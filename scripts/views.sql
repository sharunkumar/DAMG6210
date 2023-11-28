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
