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
CREATE or ALTER TRIGGER CarProduction_Stock_Consume
ON CarProduction
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    -- trigger for consuming parts (quantity) from stock when a car is produced
    
    WITH RankedRows AS ( -- select all candidate batches and rank them based on quantity
    select B.part_id, S.batch_id, S.location_id, S.quantity, CB.part_count, CB.car_id 
    , ROW_NUMBER() OVER(PARTITION BY B.part_id ORDER BY quantity DESC) AS RowNumber
    from inserted I
    inner join AssemblyUnit A on A.AssemblyUnitID = I.manufactured_at_id
    inner join [Location] L on L.LocationID = A.location_id
    inner join CarBlueprint CB on CB.car_id = I.car_id
    inner join Batch B on B.part_id = CB.part_id
    inner join Stock S on S.batch_id = B.BatchID and S.location_id = L.LocationID
    )
    update RankedRows
    set quantity = quantity - (part_count * (select count(1) from inserted II where II.car_id = RankedRows.car_id)) -- in case multiple production of the same car is inserted
    where RowNumber = 1

END
GO
use master
go