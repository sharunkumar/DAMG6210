USE [DAMG]
GO
INSERT INTO [dbo].[User] ([UserName],[FirstName],[LastName]) VALUES 
('johndoe', 'John', 'Doe' ),
('janesmith', 'Jane', 'Smith'),
('alicejohnson', 'Alice', 'Johnson'),
('bobwilliams', 'Bob', 'Williams'),
('evabrown', 'Eva', 'Brown'),
('michaeldavis', 'Michael', 'Davis'),
('sophiawhite', 'Sophia', 'White')
GO
INSERT INTO [dbo].[TransportType] ([description]) VALUES 
('Road'),
('Ship'),
('Airplane'),
('Train')
GO
INSERT INTO [dbo].[Transport] ([TransportName], [type_id]) VALUES 
('Car', (SELECT [TransportTypeID] FROM [dbo].[TransportType] WHERE [description] = 'Road')),
('Cargo Ship', (SELECT [TransportTypeID] FROM [dbo].[TransportType] WHERE [description] = 'Ship')),
('Boeing 747', (SELECT [TransportTypeID] FROM [dbo].[TransportType] WHERE [description] = 'Airplane')),
('Express Train', (SELECT [TransportTypeID] FROM [dbo].[TransportType] WHERE [description] = 'Train'))
GO
INSERT INTO [dbo].[TransactionType] ([transaction_code], [TransactionTypeName]) VALUES 
('P', 'Purchase'),
('S', 'Sale'),
('R', 'Return'),
('T', 'Transfer'),
('D', 'Damage'),
('L', 'Loss'),
('C', 'Correction');


GO
INSERT INTO [dbo].[Location] ([street], [city], [zip], [latitude], [longitude]) VALUES 
('123 Main St', 'Cityville', 12345, 40.7128, -74.0060),
('456 Oak Ave', 'Townburg', 54321, 34.0522, -118.2437),
('789 Pine Ln', 'Villageton', 67890, 41.8781, -87.6298),
('101 Elm Blvd', 'Metropolis', 98765, 37.7749, -122.4194),
('202 Maple Dr', 'Hamletville', 13579, 32.7157, -117.1611),
('303 Birch Ct', 'Ruraltown', 24680, 38.9072, -77.0370),
('404 Cedar Rd', 'Suburbia', 11223, 29.7604, -95.3698),
('111 Alpha Rd', 'Delhi', 1111, 22.7604, -99.3698),
('222 Gamma Rd', 'Mumbai', 2222, 23.7604, -91.3698),
('333 Beta Rd', 'Chennai', 3333, 24.7604, -92.3698),
('444 Acorn Rd', 'Kolkata', 4444, 25.7604, -93.3698),
('555 Cedar Rd', 'Hyderabad', 5555, 26.7604, -94.3698),
('666 Dudley Rd', 'Goa', 6666, 27.7604, -95.3698),
('777 East Rd', 'Kerala', 7777, 28.7604, -96.3698),
('888 West Rd', 'Punjab', 8888, 29.7604, -97.3698);

GO
INSERT INTO [dbo].[Transaction] ([transaction_type], [created_user_id], [updated_user_id], [transported_by_id], [from_location_id], [to_location_id]) VALUES 
('P', 1, 1, 2, 3, 1),
('S', 2, 2, 4, 5, 2),
('R', 3, 3, 1, 7, 3),
('T', 4, 4, 1, 2, 4),
('D', 5, 5, 3, 4, 5),
('L', 6, 6, 2, 6, 6),
('C', 7, 7, 2, 3, 7);

GO
INSERT INTO [dbo].[Supplier] ([SupplierName], [location_id]) VALUES 
('Supplier A', 1),
('Supplier B', 2),
('Supplier C', 3),
('Supplier D', 4),
('Supplier E', 5),
('Supplier F', 6),
('Supplier G', 7);

GO
INSERT INTO [dbo].[Brand] ([BrandName],[location_id]) VALUES 
('GM Parts', 7),
('Car Care',8),
('AM Part', 9),
('Central Part', 10),
('3M Products', 11);


GO
INSERT INTO [dbo].[Part] ([PartName], [description], [brand_id]) VALUES 
('GM-Engine', 'The engine block features parts such as the timing chain, camshaft, crankshaft, spark plugs, cylinder heads, valves and pistons.',1),
('3M-Engine', 'The engine block features parts such as the timing chain, camshaft, crankshaft', 5),
('CentalPart-Engine', 'The engine block features parts such as the timing chain, camshaft, crankshaft', 4),

('3M-Transmission','The transmission is a gearbox filled with gears and gear trains that makes effective use of the engines torque to change the gears and power the vehicle.', 5),
('GM-Transmission','GM transmission is a gearbox filled with gears and gear trains that makes effective use of the engines torque to change the gears and power the vehicle.', 1),
('AmPart-Transmission','AM Part transmission is a gearbox filled with gears and gear trains that makes effective use of the engines torque to change the gears and power the vehicle.', 3),

('CarCare-Battery','The battery delivers the electricity needed to run your vehicles electrical components. Without a battery, your car wont run.', 2),
('3M-Battery','3M battery delivers the electricity needed to run your vehicles electrical components. Without a battery, your car wont run.', 5),
('CentalPart-Battery','CentalPart battery delivers the electricity needed to run your vehicles electrical components. Without a battery, your car wont run.', 4),

('AmPart-Alternator','Part of the electrical system, the alternator charges the battery and powers the electrical system while your car is running.', 3),
('CentalPart-Alternator','Central Part of the electrical system, the alternator charges the battery and powers the electrical system while your car is running.', 4),
('GM-Alternator','GM Part of the electrical system, the alternator charges the battery and powers the electrical system while your car is running.', 1),

('CentalPart-Radiator','The radiator is responsible for helping the engine keep cool by removing heat from coolant before it is pumped back through the engine.', 4),
('AMPart-Radiator','The radiator is responsible for helping the engine keep cool by removing heat from coolant before it is pumped back through the engine.', 3),
('3M-Radiator','The radiator is responsible for helping the engine keep cool by removing heat from coolant before it is pumped back through the engine.', 5),

('3M-Brake','3M brakes are one of the most important safety systems on your vehicle', 5),
('CarCare-Brake','Car Care brakes are one of the most important safety systems on your vehicle', 2),
('CentalPart-Brake','Central Part brakes are one of the most important safety systems on your vehicle', 4);


GO
INSERT INTO [dbo].[Manufacturer] ([ManufacturerName],[location_id]) VALUES 
('Manufacturer-1',12),
('Manufacturer-2',13),
('Manufacturer-3',14);

GO
INSERT INTO [dbo].[AssemblyUnit] ([AssemblyUnitName], [brand_id], [location_id]) VALUES 
('Assembly Unit 1', 1, 7),
('Assembly Unit 2', 2, 8),
('Assembly Unit 3', 3, 9),
('Assembly Unit 4', 4, 10),
('Assembly Unit 5', 5, 11);

GO
INSERT INTO [dbo].[Batch] ([cost], [manufacturer_id], [part_id]) VALUES 
(1000, 1, 2),
(1100, 1, 3),
(1200, 1, 4),
(1300, 1, 5),
(1400, 1, 6),
(1500, 1, 7),
(1600, 1, 8),
(1700, 1, 9),
(1800, 1, 10),
(1900, 1, 11),
(2000, 1, 12),
(2100, 1, 13),
(2200, 1, 14),
(2300, 1, 15),
(2400, 1, 16),
(2500, 1, 17),
(2600, 1, 18),
(2700, 1, 1),

(1000, 2, 2),
(1100, 2, 3),
(1200, 2, 4),
(1300, 2, 5),
(1400, 2, 6),
(1500, 2, 7),
(1600, 2, 8),
(1700, 2, 9),
(1800, 2, 10),
(1900, 2, 11),
(2000, 2, 12),
(2100, 2, 13),
(2200, 2, 14),
(2300, 2, 15),
(2400, 2, 16),
(2500, 2, 17),
(2600, 2, 18),
(2700, 2, 1),

(1000, 3, 2),
(1100, 3, 3),
(1200, 3, 4),
(1300, 3, 5),
(1400, 3, 6),
(1500, 3, 7),
(1600, 3, 8),
(1700, 3, 9),
(1800, 3, 10),
(1900, 3, 11),
(2000, 3, 12),
(2100, 3, 13),
(2200, 3, 14),
(2300, 3, 15),
(2400, 3, 16),
(2500, 3, 17),
(2600, 3, 18),
(2700, 3, 1); 



GO
INSERT INTO [dbo].[CarType] ([CarTypeName], [description], [is_electric]) VALUES 
('Sedan','Medium size vehicle',0),
('i-Sedan','Medium size e-vehicle',1),
('Hybrid-Sedan','Electric and gas vehicle', 1),
('SUV', 'Big size Vehicle',0),
('i-SUV', 'Big size e-Vehicle',1),
('Hatchback', 'small size Vehicle',0),
('i-Hatchback', 'small e-size Vehicle',1),
('Truck', 'heavy Vehicle',0),
('i-Truck', 'heavy e-Vehicle',1),
('Bike', 'two wheeler',0),
('i-Bike', 'electric two wheeler',1),
('Bus', 'public transport',0),
('i-Bus', 'electric public transport',1);




