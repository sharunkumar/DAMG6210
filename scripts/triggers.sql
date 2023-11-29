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
use master
go