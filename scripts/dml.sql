USE [DAMG]

INSERT INTO [dbo].[User] ([UserName]) VALUES 
('John Doe'),
('Jane Smith'),
('Alice Johnson'),
('Bob Williams'),
('Eva Brown'),
('Michael Davis'),
('Sophia White');

INSERT INTO [dbo].[TransportType] ([description]) VALUES 
('Road'),
('Ship'),
('Airplane'),
('Train'),
('Bicycle'),
('Motorcycle'),
('Boat');

INSERT INTO [dbo].[Transport] ([TransportName], [type_id]) VALUES 
('Car', (SELECT [TransportTypeID] FROM [dbo].[TransportType] WHERE [description] = 'Road')),
('Cargo Ship', (SELECT [TransportTypeID] FROM [dbo].[TransportType] WHERE [description] = 'Ship')),
('Boeing 747', (SELECT [TransportTypeID] FROM [dbo].[TransportType] WHERE [description] = 'Airplane')),
('Express Train', (SELECT [TransportTypeID] FROM [dbo].[TransportType] WHERE [description] = 'Train')),
('Mountain Bike', (SELECT [TransportTypeID] FROM [dbo].[TransportType] WHERE [description] = 'Bicycle')),
('Harley Davidson', (SELECT [TransportTypeID] FROM [dbo].[TransportType] WHERE [description] = 'Motorcycle')),
('Sailboat', (SELECT [TransportTypeID] FROM [dbo].[TransportType] WHERE [description] = 'Boat'));

INSERT INTO [dbo].[TransactionType] ([transaction_code], [TransactionTypeName]) VALUES 
('P', 'Purchase'),
('S', 'Sale'),
('R', 'Return'),
('T', 'Transfer'),
('D', 'Damage'),
('L', 'Loss'),
('C', 'Correction');

INSERT INTO [dbo].[Location] ([street], [city], [zip], [latitude], [longitude]) VALUES 
('123 Main St', 'Cityville', 12345, 40.7128, -74.0060),
('456 Oak Ave', 'Townburg', 54321, 34.0522, -118.2437),
('789 Pine Ln', 'Villageton', 67890, 41.8781, -87.6298),
('101 Elm Blvd', 'Metropolis', 98765, 37.7749, -122.4194),
('202 Maple Dr', 'Hamletville', 13579, 32.7157, -117.1611),
('303 Birch Ct', 'Ruraltown', 24680, 38.9072, -77.0370),
('404 Cedar Rd', 'Suburbia', 11223, 29.7604, -95.3698);

INSERT INTO [dbo].[Transaction] ([transaction_type], [created_user_id], [updated_user_id], [transported_by_id], [from_location_id], [to_location_id]) VALUES 
('P', 1, 1, 2, 3, 1),
('S', 2, 2, 4, 5, 2),
('R', 3, 3, 6, 7, 3),
('T', 4, 4, 1, 2, 4),
('D', 5, 5, 3, 4, 5),
('L', 6, 6, 5, 6, 6),
('C', 7, 7, 2, 3, 7);

INSERT INTO [dbo].[Supplier] ([SupplierName], [location_id]) VALUES 
('Supplier A', 1),
('Supplier B', 2),
('Supplier C', 3),
('Supplier D', 4),
('Supplier E', 5),
('Supplier F', 6),
('Supplier G', 7);
