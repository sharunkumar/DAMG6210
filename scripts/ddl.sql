USE [master]
GO
CREATE DATABASE [DAMG]
GO
USE [DAMG]
GO
CREATE TABLE [dbo].[AssemblyUnit]
(
	[AssemblyUnitID] [int] IDENTITY(1,1) NOT NULL,
	[AssemblyUnitName] [varchar](250) NOT NULL,
	[location_id] [int] NOT NULL,
	[brand_id] [int] NOT NULL,
	CONSTRAINT [AssemblyUnit_pkey] PRIMARY KEY CLUSTERED ( [AssemblyUnitID] ASC ),
	CONSTRAINT [AssemblyUnit_location_id_key] UNIQUE NONCLUSTERED ( [location_id] ASC )
)
GO
CREATE TABLE [dbo].[Batch]
(
	[BatchID] [int] IDENTITY(1,1) NOT NULL,
	[part_id] [int] NOT NULL,
	[cost] [float] NOT NULL,
	[manufacturer_id] [int] NOT NULL,
	CONSTRAINT [Batch_pkey] PRIMARY KEY CLUSTERED ( [BatchID] ASC )
)
GO
CREATE TABLE [dbo].[Brand]
(
	[BrandID] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [varchar](250) NOT NULL,
	[location_id] [int] NOT NULL,
	CONSTRAINT [Brand_pkey] PRIMARY KEY CLUSTERED ( [BrandID] ASC ) ,
	CONSTRAINT [Brand_location_id_key] UNIQUE NONCLUSTERED ( [location_id] ASC )
)
GO
CREATE TABLE [dbo].[Car]
(
	[CarID] [int] IDENTITY(1,1) NOT NULL,
	[CarName] [varchar](250) NOT NULL,
	[production_year_start] DATE NOT NULL,
	[production_year_end] DATE NOT NULL,
	[brand_id] [int] NOT NULL,
	[type_id] [int] NOT NULL,
	CONSTRAINT [Car_pkey] PRIMARY KEY CLUSTERED ( [CarID] ASC )
)
GO
CREATE TABLE [dbo].[CarBlueprint]
(
	[car_id] [int] NOT NULL,
	[part_id] [int] NOT NULL,
	[part_count] [int] NOT NULL,
	CONSTRAINT [CarBlueprint_car_id_part_id_key] UNIQUE NONCLUSTERED ( [car_id] ASC, [part_id] ASC )
)
GO
CREATE TABLE [dbo].[CarProduction]
(
	[CarProductionID] [int] IDENTITY(1,1) NOT NULL,
	[manufactured_date] DATE NOT NULL,
	[color] [varchar](50) NOT NULL,
	[manufactured_at_id] [int] NOT NULL,
	[car_id] [int] NOT NULL,
	CONSTRAINT [CarProduction_pkey] PRIMARY KEY CLUSTERED ( [CarProductionID] ASC )
)
GO
CREATE TABLE [dbo].[CarType]
(
	[CarTypeID] [int] IDENTITY(1,1) NOT NULL,
	[CarTypeName] [varchar](100) NOT NULL,
	[description] [varchar](500) NOT NULL,
	[is_electric] [bit] NOT NULL,
	CONSTRAINT [CarType_pkey] PRIMARY KEY CLUSTERED ( [CarTypeID] ASC )
)
GO
CREATE TABLE [dbo].[Location]
(
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[street] [varchar](100) NOT NULL,
	[city] [varchar](100) NOT NULL,
	[zip] [int] NOT NULL,
	[latitude] [decimal](32, 16) NOT NULL,
	[longitude] [decimal](32, 16) NOT NULL,
	CONSTRAINT [Location_pkey] PRIMARY KEY CLUSTERED ( [LocationID] ASC )
)
GO
CREATE TABLE [dbo].[Manufacturer]
(
	[ManufacturerID] [int] IDENTITY(1,1) NOT NULL,
	[ManufacturerName] [varchar](250) NOT NULL,
	[location_id] [int] NOT NULL,
	CONSTRAINT [Manufacturer_pkey] PRIMARY KEY CLUSTERED ( [ManufacturerID] ASC ) ,
	CONSTRAINT [Manufacturer_location_id_key] UNIQUE NONCLUSTERED ( [location_id] ASC )
)
GO
CREATE TABLE [dbo].[Part]
(
	[PartID] [int] IDENTITY(1,1) NOT NULL,
	[PartName] [varchar](250) NOT NULL,
	[description] [varchar](500) NOT NULL,
	[brand_id] [int] NOT NULL,
	CONSTRAINT [Part_pkey] PRIMARY KEY CLUSTERED ( [PartID] ASC )
)
GO
CREATE TABLE [dbo].[Stock]
(
	[batch_id] [int] NOT NULL,
	[location_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	CONSTRAINT [Stock_batch_id_location_id_key] UNIQUE NONCLUSTERED ( [batch_id] ASC, [location_id] ASC
)
)
GO
CREATE TABLE StockAudit (
    audit_id INT IDENTITY(1,1) NOT NULL,
    batch_id INT,
    location_id INT,
    quantity INT,
    audit_type VARCHAR(10),
    audit_date DATETIME,
	CONSTRAINT [StockAudit_pkey] PRIMARY KEY CLUSTERED ( [audit_id] ASC )
);
GO
CREATE TABLE [dbo].[Supplier]
(
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [varchar](250) NOT NULL,
	[location_id] [int] NOT NULL,
	CONSTRAINT [Supplier_pkey] PRIMARY KEY CLUSTERED ( [SupplierID] ASC ) ,
	CONSTRAINT [Supplier_location_id_key] UNIQUE NONCLUSTERED ( [location_id] ASC )
)
GO
CREATE TABLE [dbo].[Transaction]
(
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[transaction_type] [char](1) NOT NULL,
	[created_user_id] [int] NOT NULL,
	[updated_user_id] [int] NOT NULL,
	[transported_by_id] [int] NOT NULL,
	[from_location_id] [int] NOT NULL,
	[to_location_id] [int] NOT NULL,
	[created_date] DATETIME NOT NULL,
	[updated_date] DATETIME NOT NULL,
	CONSTRAINT [Transaction_pkey] PRIMARY KEY CLUSTERED ( [TransactionID] ASC )
)
GO
ALTER TABLE [dbo].[StockAudit] ADD  CONSTRAINT [StockAudit_date_df]  DEFAULT (getdate()) FOR [audit_date]
GO
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [Transaction_created_date_df]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [Transaction_updated_date_df]  DEFAULT (getdate()) FOR [updated_date]
GO
CREATE TABLE [dbo].[TransactionRow]
(
	[TransactionRowID] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NOT NULL,
	[unit_price] [float] NOT NULL,
	[part_batch_id] [int] NOT NULL,
	[transaction_id] [int] NOT NULL,
	CONSTRAINT [TransactionRow_pkey] PRIMARY KEY CLUSTERED ( [TransactionRowID] ASC )
)
GO
CREATE TABLE [dbo].[TransactionType]
(
	[transaction_code] [char](1) NOT NULL,
	[TransactionTypeName] [varchar](50) NOT NULL,
	CONSTRAINT [TransactionType_pkey] PRIMARY KEY CLUSTERED ( [transaction_code] ASC )
)
GO
CREATE TABLE [dbo].[Transport]
(
	[TransportID] [int] IDENTITY(1,1) NOT NULL,
	[TransportName] [varchar](250) NOT NULL,
	[type_id] [int] NOT NULL,
	[cost_per_km] float not null,
	CONSTRAINT [Transport_pkey] PRIMARY KEY CLUSTERED ( [TransportID] ASC )
)
GO
CREATE TABLE [dbo].[TransportType]
(
	[TransportTypeID] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](500) NOT NULL,
	CONSTRAINT [TransportType_pkey] PRIMARY KEY CLUSTERED ( [TransportTypeID] ASC )
)
GO
CREATE TABLE [dbo].[User]
(
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](250) NOT NULL,
	[FirstName] [varchar] (250) NOT NULL,
	[LastName] [varchar] (250) NOT NULL,
	CONSTRAINT [User_pkey] PRIMARY KEY CLUSTERED ( [UserID] ASC ),
	CONSTRAINT [User_Username] UNIQUE NONCLUSTERED ( [UserName] ASC ),
)
GO
ALTER TABLE [dbo].[AssemblyUnit]  WITH CHECK ADD  CONSTRAINT [AssemblyUnit_brand_id_fkey] FOREIGN KEY([brand_id])
REFERENCES [dbo].[Brand] ([BrandID])
GO
ALTER TABLE [dbo].[AssemblyUnit] CHECK CONSTRAINT [AssemblyUnit_brand_id_fkey]
GO
ALTER TABLE [dbo].[AssemblyUnit]  WITH CHECK ADD  CONSTRAINT [AssemblyUnit_location_id_fkey] FOREIGN KEY([location_id])
REFERENCES [dbo].[Location] ([LocationID])
GO
ALTER TABLE [dbo].[AssemblyUnit] CHECK CONSTRAINT [AssemblyUnit_location_id_fkey]
GO
ALTER TABLE [dbo].[Batch]  WITH CHECK ADD  CONSTRAINT [Batch_manufacturer_id_fkey] FOREIGN KEY([manufacturer_id])
REFERENCES [dbo].[Manufacturer] ([ManufacturerID])
GO
ALTER TABLE [dbo].[Batch] CHECK CONSTRAINT [Batch_manufacturer_id_fkey]
GO
ALTER TABLE [dbo].[Batch]  WITH CHECK ADD  CONSTRAINT [Batch_part_id_fkey] FOREIGN KEY([part_id])
REFERENCES [dbo].[Part] ([PartID])
GO
ALTER TABLE [dbo].[Batch] CHECK CONSTRAINT [Batch_part_id_fkey]
GO
ALTER TABLE [dbo].[Brand]  WITH CHECK ADD  CONSTRAINT [Brand_location_id_fkey] FOREIGN KEY([location_id])
REFERENCES [dbo].[Location] ([LocationID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Brand] CHECK CONSTRAINT [Brand_location_id_fkey]
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [Car_brand_id_fkey] FOREIGN KEY([brand_id])
REFERENCES [dbo].[Brand] ([BrandID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [Car_brand_id_fkey]
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [Car_type_id_fkey] FOREIGN KEY([type_id])
REFERENCES [dbo].[CarType] ([CarTypeID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [Car_type_id_fkey]
GO
ALTER TABLE [dbo].[CarBlueprint]  WITH CHECK ADD  CONSTRAINT [CarBlueprint_car_id_fkey] FOREIGN KEY([car_id])
REFERENCES [dbo].[Car] ([CarID])
GO
ALTER TABLE [dbo].[CarBlueprint] CHECK CONSTRAINT [CarBlueprint_car_id_fkey]
GO
ALTER TABLE [dbo].[CarBlueprint]  WITH CHECK ADD  CONSTRAINT [CarBlueprint_part_id_fkey] FOREIGN KEY([part_id])
REFERENCES [dbo].[Part] ([PartID])
GO
ALTER TABLE [dbo].[CarBlueprint] CHECK CONSTRAINT [CarBlueprint_part_id_fkey]
GO
ALTER TABLE [dbo].[CarProduction]  WITH CHECK ADD  CONSTRAINT [CarProduction_car_id_fkey] FOREIGN KEY([car_id])
REFERENCES [dbo].[Car] ([CarID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CarProduction] CHECK CONSTRAINT [CarProduction_car_id_fkey]
GO
ALTER TABLE [dbo].[CarProduction]  WITH CHECK ADD  CONSTRAINT [CarProduction_manufactured_at_id_fkey] FOREIGN KEY([manufactured_at_id])
REFERENCES [dbo].[AssemblyUnit] ([AssemblyUnitID])
GO
ALTER TABLE [dbo].[CarProduction] CHECK CONSTRAINT [CarProduction_manufactured_at_id_fkey]
GO
ALTER TABLE [dbo].[Manufacturer]  WITH CHECK ADD  CONSTRAINT [Manufacturer_location_id_fkey] FOREIGN KEY([location_id])
REFERENCES [dbo].[Location] ([LocationID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Manufacturer] CHECK CONSTRAINT [Manufacturer_location_id_fkey]
GO
ALTER TABLE [dbo].[Part]  WITH CHECK ADD  CONSTRAINT [Part_brand_id_fkey] FOREIGN KEY([brand_id])
REFERENCES [dbo].[Brand] ([BrandID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Part] CHECK CONSTRAINT [Part_brand_id_fkey]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [Stock_batch_id_fkey] FOREIGN KEY([batch_id])
REFERENCES [dbo].[Batch] ([BatchID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [Stock_batch_id_fkey]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [Stock_location_id_fkey] FOREIGN KEY([location_id])
REFERENCES [dbo].[Location] ([LocationID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [Stock_location_id_fkey]
GO
ALTER TABLE [dbo].[Stock] ADD CONSTRAINT [chk_quantity_positive] CHECK (quantity >= 0);
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [Supplier_location_id_fkey] FOREIGN KEY([location_id])
REFERENCES [dbo].[Location] ([LocationID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [Supplier_location_id_fkey]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [Transaction_created_user_id_fkey] FOREIGN KEY([created_user_id])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [Transaction_created_user_id_fkey]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [Transaction_from_location_id_fkey] FOREIGN KEY([from_location_id])
REFERENCES [dbo].[Location] ([LocationID])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [Transaction_from_location_id_fkey]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [Transaction_to_location_id_fkey] FOREIGN KEY([to_location_id])
REFERENCES [dbo].[Location] ([LocationID])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [Transaction_to_location_id_fkey]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [Transaction_transaction_type_fkey] FOREIGN KEY([transaction_type])
REFERENCES [dbo].[TransactionType] ([transaction_code])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [Transaction_transaction_type_fkey]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [Transaction_transported_by_id_fkey] FOREIGN KEY([transported_by_id])
REFERENCES [dbo].[Transport] ([TransportID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [Transaction_transported_by_id_fkey]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [Transaction_updated_user_id_fkey] FOREIGN KEY([updated_user_id])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [Transaction_updated_user_id_fkey]
GO
ALTER TABLE [dbo].[TransactionRow]  WITH CHECK ADD  CONSTRAINT [TransactionRow_part_batch_id_fkey] FOREIGN KEY([part_batch_id])
REFERENCES [dbo].[Batch] ([BatchID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TransactionRow] CHECK CONSTRAINT [TransactionRow_part_batch_id_fkey]
GO
ALTER TABLE [dbo].[TransactionRow]  WITH CHECK ADD  CONSTRAINT [TransactionRow_transaction_id_fkey] FOREIGN KEY([transaction_id])
REFERENCES [dbo].[Transaction] ([TransactionID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TransactionRow] CHECK CONSTRAINT [TransactionRow_transaction_id_fkey]
GO
ALTER TABLE [dbo].[Transport]  WITH CHECK ADD  CONSTRAINT [Transport_type_id_fkey] FOREIGN KEY([type_id])
REFERENCES [dbo].[TransportType] ([TransportTypeID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Transport] CHECK CONSTRAINT [Transport_type_id_fkey]
GO
-- non-clustered indexes
CREATE INDEX idx_transactions_date
ON [Transaction] (transaction_type)
-- This will speed up queries filtering by transaction type.
GO
CREATE INDEX idx_from_location 
ON [Transaction] (from_location_id)

CREATE INDEX idx_to_location
ON [Transaction] (to_location_id)
-- This will improve join performance with the Locations table.
GO
CREATE INDEX idx_batch  
ON Stock (batch_id)

CREATE INDEX idx_batch_tx
ON [TransactionRow] (part_batch_id)
-- Speeds up joins to the Batch table.
GO
CREATE INDEX idx_created_user  
ON [Transaction] (created_user_id) 
-- Again this helps joins against the Users table.
GO
-- computed columns
alter table TransactionRow add total_price as unit_price * quantity
GO
alter table Car add years_in_production as DATEDIFF
(year, production_year_start, production_year_end)
GO
alter table Car add currently_in_production as case when getdate() < production_year_end then 1 else 0 end
GO
create or alter function total_transaction_amount(@transaction_id int) returns float as begin
	return (select sum(total_price)
	from [TransactionRow]
	where transaction_id = @transaction_id)
end
GO
alter table [Transaction] add total_amount as dbo.total_transaction_amount(transactionId)
GO
create or alter function calc_distance(@lat1 float, @lon1 float, @lat2 float, @lon2 float) returns float as BEGIN
	DECLARE @radius FLOAT = 6371;
	-- Earth's radius in kilometers

	-- Convert latitude and longitude from degrees to radians
	SET @lat1 = RADIANS(@lat1);
	SET @lon1 = RADIANS(@lon1);
	SET @lat2 = RADIANS(@lat2);
	SET @lon2 = RADIANS(@lon2);

	-- Calculate differences
	DECLARE @latDiff FLOAT = @lat2 - @lat1;
	DECLARE @lonDiff FLOAT = @lon2 - @lon1;

	-- Haversine formula
	DECLARE @a FLOAT = SIN(@latDiff / 2) * SIN(@latDiff / 2) + COS(@lat1) * COS(@lat2) * SIN(@lonDiff / 2) * SIN(@lonDiff / 2);
	DECLARE @c FLOAT = 2 * ATN2(SQRT(@a), SQRT(1 - @a));
	DECLARE @distance FLOAT = @radius * @c;

	return @distance
END
go
create or alter function calc_transaction_distance(@transaction_id int) returns float as begin
	declare @from_id INT
	declare @to_id INT

	select @from_id = from_location_id, @to_id= to_location_id
	from [Transaction]
	where TransactionID = @transaction_id

	declare @lat1 float, @lon1 float, @lat2 float, @lon2 float

	select @lat1 = latitude, @lon1 = longitude
	from [Location]
	where LocationID = @from_id
	select @lat2 = latitude, @lon2 = longitude
	from [Location]
	where LocationID = @to_id

	return dbo.calc_distance(@lat1, @lon1, @lat2, @lon2)
end
go
USE [master]
GO
