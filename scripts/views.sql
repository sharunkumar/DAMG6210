use DAMG
go
-- views for transactions
create or alter view sales
as
    select *
    from [Transaction]
    where transaction_type = 'S'
GO
create or alter view purchases
as
    select *
    from [Transaction]
    where transaction_type = 'P'
GO
create or alter view [returns]
as
    select *
    from [Transaction]
    where transaction_type = 'R'
GO
create or alter view [transfers]
as
    select *
    from [Transaction]
    where transaction_type = 'T'
GO
-- reporting related views
GO
create or alter view sales_by_parts as select part_id, p.PartName, p.[description], sum(total_price) [Total_Sales]
from [Transaction] t left join TransactionRow r on t.TransactionID = r.transaction_id and transaction_type = 'S'
    left join Batch b on r.part_batch_id = b.BatchID
    left join Part p on p.PartID = b.BatchID
group by part_id, p
.PartName, p.[description]
GO
