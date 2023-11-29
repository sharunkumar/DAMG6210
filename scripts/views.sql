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
create or alter view sales_by_parts
as
    select part_id, p.PartName, p.[description], sum(total_price) [Total_Sales]
    from [Transaction] t inner join TransactionRow r on t.TransactionID = r.transaction_id and transaction_type = 'S'
        inner join Batch b on r.part_batch_id = b.BatchID
        inner join Part p on p.PartID = b.BatchID
    group by part_id, p
.PartName, p.[description]
GO
create or alter view transaction_logistics
as
    select dbo.calc_distance(f.latitude, f.longitude, t.latitude, t.longitude) [TransportationDistance],
        dbo.calc_distance(f.latitude, f.longitude, t.latitude, t.longitude) * tr.[cost_per_km] [TransportCost], [transaction].*
    from [Transaction] inner join [Location] [f] on [Transaction].from_location_id = f.LocationID
        inner join [Location] [t] on [Transaction].to_location_id = t.LocationID
        inner join [Transport] tr on tr.TransportID = [Transaction].transported_by_id
go
create or alter view sales_by_date
as
    select convert(DATE,created_date) TDATE, sum(total_amount) SalesForTheDay
    from [Transaction]
    group by convert(DATE,created_date)
go
create or alter view sales_by_month
as
    select MONTH(created_date) TDATE, sum(total_amount) SalesForTheMonth
    from [Transaction]
    group by MONTH(created_date)
go
-- select * from transaction_logistics


-- select *
-- from transaction_logistics