use DAMG
go
CREATE or alter TRIGGER StockAuditTrigger
ON Stock
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @audit_type VARCHAR(10);
    IF EXISTS (SELECT 1
    FROM inserted)
    BEGIN
        IF EXISTS (SELECT 1
        FROM deleted)
            SET @audit_type = 'UPDATE';
        ELSE
            SET @audit_type = 'INSERT';

        INSERT INTO StockAudit
            (batch_id, location_id, quantity, audit_type)
        SELECT
            COALESCE(i.batch_id, d.batch_id),
            COALESCE(i.location_id, d.location_id),
            COALESCE(i.quantity, d.quantity),
            @audit_type
        FROM inserted i
            FULL OUTER JOIN deleted d ON i.batch_id = d.batch_id
    END
    ELSE
    BEGIN
        INSERT INTO StockAudit
            (batch_id, location_id, quantity, audit_type)
        SELECT
            d.batch_id,
            d.location_id,
            d.quantity,
            'DELETE'
        FROM deleted d;
    END
END
go
CREATE or ALTER TRIGGER StockUpdate
ON TransactionRow
AFTER INSERT, UPDATE, DELETE 
AS
BEGIN
    SET NOCOUNT ON;

    -- handle updated rows
    update sf
    set sf.quantity = sf.quantity - (d.quantity - i.quantity)
    from inserted i inner join deleted d on i.TransactionRowID = d.TransactionRowID and i.quantity <> d.quantity
        inner join [Transaction] t on i.transaction_id = t.TransactionID
        inner join Stock sf on sf.location_id = t.from_location_id and i.part_batch_id = sf.batch_id

    update st
    set st.quantity = st.quantity + (d.quantity - i.quantity)
    from inserted i inner join deleted d on i.TransactionRowID = d.TransactionRowID and i.quantity <> d.quantity
        inner join [Transaction] t on i.transaction_id = t.TransactionID
        inner join Stock st on st.location_id = t.to_location_id and i.part_batch_id = st.batch_id


    -- handle deleted row
    update sf
        set sf.quantity = sf.quantity + d.quantity
         from deleted d inner join [transaction] t on d.TransactionRowID not in (select TransactionRowID
            from inserted) and t.TransactionID = d.transaction_id
        inner join stock sf on sf.location_id = t.from_location_id

    update st
        set st.quantity = st.quantity - d.quantity
         from deleted d inner join [transaction] t on d.TransactionRowID not in (select TransactionRowID
            from inserted) and t.TransactionID = d.transaction_id
        inner join stock st on st.location_id = t.to_location_id

    -- handle inserted row
    update sf
        set sf.quantity = sf.quantity - i.quantity
         from inserted i inner join [transaction] t on i.TransactionRowID not in (select TransactionRowID
            from deleted) and t.TransactionID = i.transaction_id
        inner join stock sf on sf.location_id = t.from_location_id

    update st
        set st.quantity = st.quantity + i.quantity
         from inserted i inner join [transaction] t on i.TransactionRowID not in (select TransactionRowID
            from deleted) and t.TransactionID = i.transaction_id
        inner join stock st on st.location_id = t.to_location_id

END
GO
CREATE OR ALTER TRIGGER Prevent_CarProduction_Update_Delete ON CarProduction
INSTEAD OF DELETE, UPDATE
AS
BEGIN
    RAISERROR('Updates and deletes are not allowed on this table.', 16, 1);
    ROLLBACK TRANSACTION;
END
GO
use master
go