USE [DAMG]
GO
INSERT INTO [dbo].[User]
    ([UserName],[FirstName],[LastName])
VALUES
    ('johndoe', 'John', 'Doe' ),
    ('janesmith', 'Jane', 'Smith'),
    ('alicejohnson', 'Alice', 'Johnson'),
    ('bobwilliams', 'Bob', 'Williams'),
    ('evabrown', 'Eva', 'Brown'),
    ('michaeldavis', 'Michael', 'Davis'),
    ('sophiawhite', 'Sophia', 'White')
GO
INSERT INTO [dbo].[TransportType]
    ([description])
VALUES
    ('Road'),
    ('Ship'),
    ('Airplane'),
    ('Train')
GO
INSERT INTO [dbo].[Transport]
    ([TransportName], [type_id], [cost_per_km])
VALUES
    ('Car', (SELECT [TransportTypeID]
        FROM [dbo].[TransportType]
        WHERE [description] = 'Road'), 30),
    ('Cargo Ship', (SELECT [TransportTypeID]
        FROM [dbo].[TransportType]
        WHERE [description] = 'Ship'), 40),
    ('Boeing 747', (SELECT [TransportTypeID]
        FROM [dbo].[TransportType]
        WHERE [description] = 'Airplane'), 50),
    ('Express Train', (SELECT [TransportTypeID]
        FROM [dbo].[TransportType]
        WHERE [description] = 'Train'), 45)
GO
INSERT INTO [dbo].[TransactionType]
    ([transaction_code], [TransactionTypeName])
VALUES
    ('P', 'Purchase'),
    ('S', 'Sale'),
    ('R', 'Return'),
    ('T', 'Transfer'),
    ('D', 'Damage'),
    ('L', 'Loss'),
    ('C', 'Correction');


GO
INSERT INTO [dbo].[Location]
    ([street], [city], [zip], [latitude], [longitude])
VALUES
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
    ('888 West Rd', 'Punjab', 8888, 29.7604, -97.3698),
    ('505 Oakwood Ln', 'Hillsborough', 54312, 37.3541, -121.9552),
    ('606 Redwood Blvd', 'Groveville', 45678, 33.4484, -112.0740),
    ('707 Willow Ave', 'Meadowland', 78901, 42.3601, -71.0589),
    ('808 Cedar Lane', 'Harbortown', 23456, 39.9526, -75.1652),
    ('909 Pine St', 'Lakeview', 65432, 36.7783, -119.4179),
    ('111 Birchwood Dr', 'Mountainville', 13579, 35.6895, -105.9378),
    ('222 Elmwood Ct', 'Riverside', 87654, 33.6846, -117.8265),
    ('333 Maple Blvd', 'Valley City', 11234, 41.2524, -95.9970),
    ('444 Cedar Ave', 'Woodside', 56789, 40.7128, -74.0060),
    ('555 Spruce Rd', 'Brookside', 98765, 47.6062, -122.3321);

GO
INSERT INTO [dbo].[Transaction]
    ([transaction_type], [created_user_id], [updated_user_id], [transported_by_id], [from_location_id], [to_location_id])
VALUES
    ('P', 1, 1, 2, 3, 1),
    ('S', 2, 2, 4, 5, 2),
    ('R', 3, 3, 1, 7, 3),
    ('T', 4, 4, 1, 2, 4),
    ('D', 5, 5, 3, 4, 5),
    ('L', 6, 6, 2, 6, 6),
    ('C', 7, 7, 2, 3, 7);

GO
INSERT INTO [dbo].[Supplier]
    ([SupplierName], [location_id])
VALUES
    ('Supplier A', 1),
    ('Supplier B', 2),
    ('Supplier C', 3),
    ('Supplier D', 4),
    ('Supplier E', 5),
    ('Supplier F', 6),
    ('Supplier G', 7);

GO
INSERT INTO [dbo].[Brand]
    ([BrandName],[location_id])
VALUES
    ('GM Parts', 7),
    ('Car Care', 8),
    ('AM Part', 9),
    ('Central Part', 10),
    ('3M Products', 11);


GO
INSERT INTO [dbo].[Part]
    ([PartName], [description], [brand_id])
VALUES
    ('GM-Engine', 'The engine block features parts such as the timing chain, camshaft, crankshaft, spark plugs, cylinder heads, valves and pistons.', 1),
    ('3M-Engine', 'The engine block features parts such as the timing chain, camshaft, crankshaft', 5),
    ('CentalPart-Engine', 'The engine block features parts such as the timing chain, camshaft, crankshaft', 4),

    ('3M-Transmission', 'The transmission is a gearbox filled with gears and gear trains that makes effective use of the engines torque to change the gears and power the vehicle.', 5),
    ('GM-Transmission', 'GM transmission is a gearbox filled with gears and gear trains that makes effective use of the engines torque to change the gears and power the vehicle.', 1),
    ('AmPart-Transmission', 'AM Part transmission is a gearbox filled with gears and gear trains that makes effective use of the engines torque to change the gears and power the vehicle.', 3),

    ('CarCare-Battery', 'The battery delivers the electricity needed to run your vehicles electrical components. Without a battery, your car wont run.', 2),
    ('3M-Battery', '3M battery delivers the electricity needed to run your vehicles electrical components. Without a battery, your car wont run.', 5),
    ('CentalPart-Battery', 'CentalPart battery delivers the electricity needed to run your vehicles electrical components. Without a battery, your car wont run.', 4),

    ('AmPart-Alternator', 'Part of the electrical system, the alternator charges the battery and powers the electrical system while your car is running.', 3),
    ('CentalPart-Alternator', 'Central Part of the electrical system, the alternator charges the battery and powers the electrical system while your car is running.', 4),
    ('GM-Alternator', 'GM Part of the electrical system, the alternator charges the battery and powers the electrical system while your car is running.', 1),

    ('CentalPart-Radiator', 'The radiator is responsible for helping the engine keep cool by removing heat from coolant before it is pumped back through the engine.', 4),
    ('AMPart-Radiator', 'The radiator is responsible for helping the engine keep cool by removing heat from coolant before it is pumped back through the engine.', 3),
    ('3M-Radiator', 'The radiator is responsible for helping the engine keep cool by removing heat from coolant before it is pumped back through the engine.', 5),

    ('3M-Brake', '3M brakes are one of the most important safety systems on your vehicle', 5),
    ('CarCare-Brake', 'Car Care brakes are one of the most important safety systems on your vehicle', 2),
    ('CentalPart-Brake', 'Central Part brakes are one of the most important safety systems on your vehicle', 4);


GO
INSERT INTO [dbo].[Manufacturer]
    ([ManufacturerName],[location_id])
VALUES
    ('Manufacturer-1', 12),
    ('Manufacturer-2', 13),
    ('Manufacturer-3', 14);

GO
INSERT INTO [dbo].[AssemblyUnit]
    ([AssemblyUnitName], [brand_id], [location_id])
VALUES
    ('Assembly Unit 1', 1, 7),
    ('Assembly Unit 2', 2, 8),
    ('Assembly Unit 3', 3, 9),
    ('Assembly Unit 4', 4, 10),
    ('Assembly Unit 5', 5, 11);

GO
INSERT INTO [dbo].[Batch]
    ([cost], [manufacturer_id], [part_id])
VALUES
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
INSERT INTO [dbo].[CarType]
    ([CarTypeName], [description], [is_electric])
VALUES
    ('Sedan', 'Medium size vehicle', 0),
    ('i-Sedan', 'Medium size e-vehicle', 1),
    ('Hybrid-Sedan', 'Electric and gas vehicle', 1),
    ('SUV', 'Big size Vehicle', 0),
    ('i-SUV', 'Big size e-Vehicle', 1),
    ('Hatchback', 'small size Vehicle', 0),
    ('i-Hatchback', 'small e-size Vehicle', 1),
    ('Truck', 'heavy Vehicle', 0),
    ('i-Truck', 'heavy e-Vehicle', 1),
    ('Bike', 'two wheeler', 0),
    ('i-Bike', 'electric two wheeler', 1),
    ('Bus', 'public transport', 0),
    ('i-Bus', 'electric public transport', 1);
GO
INSERT INTO [dbo].[Car]
    ([CarName], [production_year_start], [production_year_end], [brand_id], [type_id])
VALUES
    ('Honda Accord', '2000-11-28 23:43:34.000', '2020-12-31T23:59:59.9999999Z', 3, 1),
    -- Sedan
    ('Chevrolet Bolt', '2002-01-01T00:00:00.0000000Z', '2024-12-31T23:59:59.9999999Z', 4, 2),
    -- i-Sedan (electric)
    ('Toyota Prius', '2001-01-01T00:00:00.0000000Z', '2022-12-31T23:59:59.9999999Z', 5, 3),
    -- Hybrid-Sedan
    ('Ford Explorer', '2002-01-01T00:00:00.0000000Z', '2019-12-31T23:59:59.9999999Z', 1, 4),
    -- SUV
    ('Tesla Model X', '2010-01-01T00:00:00.0000000Z', '2020-12-31T23:59:59.9999999Z', 2, 5),
    -- i-SUV (electric)
    ('Volkswagen Golf', '2015-01-01T00:00:00.0000000Z', '2018-12-31T23:59:59.9999999Z', 3, 6),
    -- Hatchback
    ('Nissan Leaf', '2017-01-01T00:00:00.0000000Z', '2019-12-31T23:59:59.9999999Z', 4, 7),
    -- i-Hatchback (electric)
    ('Ford F-150', '2015-01-01T00:00:00.0000000Z', '2020-12-31T23:59:59.9999999Z', 1, 8),
    -- Truck
    ('Rivian R1T', '2016-01-01T00:00:00.0000000Z', '2018-12-31T23:59:59.9999999Z', 2, 9),
    -- i-Truck (electric)
    ('Harley-Davidson Fat Boy', '2019-01-01T00:00:00.0000000Z', '2021-12-31T23:59:59.9999999Z', 3, 10); -- Bike
GO
INSERT INTO [dbo].[CarBlueprint]
    ([car_id], [part_id], [part_count])
VALUES
    (1, 2, 1),
    -- GM-Engine
    (1, 5, 1),
    -- 3M-Transmission
    (1, 8, 1),
    -- CarCare-Battery
    (1, 14, 1),
    -- CentalPart-Radiator
    (1, 17, 4),
    -- 3M-Brake

    (2, 2, 1),
    (2, 5, 1),
    (2, 8, 1),
    (2, 14, 1),
    (2, 17, 4),

    (3, 3, 1),
    (3, 5, 1),
    (3, 9, 1),
    (3, 16, 1),
    (3, 17, 4),

    (4, 4, 1),
    (4, 6, 1),
    (4, 10, 1),
    (4, 14, 1),
    (4, 17, 4),

    (5, 5, 1),
    (5, 8, 1),
    (5, 11, 1),
    (5, 15, 1),
    (5, 17, 4),

    (6, 6, 1),
    (6, 8, 1),
    (6, 13, 1),
    (6, 14, 1),
    (6, 17, 4),

    (7, 7, 1),
    (7, 8, 1),
    (7, 14, 1),
    (7, 17, 4),

    (8, 8, 1),
    (8, 9, 1),
    (8, 15, 1),
    (8, 17, 4),

    (9, 10, 1),
    (9, 11, 1),
    (9, 16, 1),
    (9, 17, 4),

    (10, 12, 1),
    (10, 13, 1),
    (10, 17, 4),
    (10, 18, 1);
GO
INSERT INTO [dbo].[TransactionRow]
    ([quantity], [unit_price], [part_batch_id], [transaction_id])
VALUES
    (1, 25.5, 3, 1),
    (2, 30.0, 4, 1),
    (3, 45.8, 5, 1),
    (1, 27.2, 6, 2),
    (2, 32.6, 7, 2),
    (3, 40.0, 8, 2),
    (1, 28.9, 9, 3),
    (2, 35.3, 10, 3),
    (3, 42.7, 11, 3),
    (1, 29.8, 12, 4),
    (2, 36.1, 13, 4),
    (3, 44.5, 14, 4),
    (1, 30.7, 15, 5),
    (2, 37.4, 16, 5),
    (3, 46.3, 17, 5),
    (1, 31.6, 18, 6),
    (2, 38.7, 19, 6),
    (3, 48.1, 20, 6),
    (1, 33.2, 21, 7),
    (2, 40.5, 22, 7),
    (3, 50.2, 23, 7),
    (1, 34.8, 24, 1),
    (2, 42.3, 25, 1),
    (3, 52.4, 26, 1),
    (1, 36.2, 27, 2),
    (2, 43.9, 28, 2),
    (3, 54.0, 29, 2),
    (1, 37.7, 30, 3),
    (2, 45.1, 31, 3),
    (3, 53.6, 32, 3),
    (1, 39.0, 33, 4),
    (2, 46.5, 34, 4),
    (3, 55.3, 35, 4);
GO
-- INSERT INTO [dbo].[Stock]
--     ([batch_id], [location_id], [quantity])
-- VALUES
--     (3, 1, 10),
--     (4, 2, 15),
--     (5, 3, 20),
--     (6, 4, 25),
--     (7, 5, 30),
--     (8, 6, 35),
--     (9, 7, 40),
--     (10, 8, 45),
--     (11, 9, 50),
--     (12, 10, 55),
--     (13, 11, 60),
--     (14, 12, 65),
--     (15, 13, 70),
--     (16, 14, 75),
--     (17, 15, 80),
--     (18, 16, 85),
--     (19, 17, 90),
--     (20, 18, 95),
--     (21, 19, 100),
--     (22, 20, 105),
--     (23, 1, 11),
--     (24, 2, 16),
--     (25, 3, 21),
--     (26, 4, 26),
--     (27, 5, 31),
--     (28, 6, 36),
--     (29, 7, 41),
--     (30, 8, 46),
--     (31, 9, 51),
--     (32, 10, 56),
--     (33, 11, 61),
--     (34, 12, 66),
--     (35, 13, 71),
--     (36, 14, 76),
--     (37, 15, 81),
--     (38, 16, 86),
--     (39, 17, 91),
--     (40, 18, 96),
--     (41, 19, 101),
--     (42, 20, 106),
--     (43, 1, 12),
--     (44, 2, 17),
--     (45, 3, 22),
--     (46, 4, 27),
--     (47, 5, 32),
--     (48, 6, 37),
--     (49, 7, 42),
--     (50, 8, 47),
--     (51, 9, 52),
--     (52, 10, 57),
--     (53, 11, 62),
--     (54, 12, 67),
--     (1, 13, 72),
--     (2, 14, 77);
-- GO
INSERT INTO [dbo].[CarProduction]
    ([manufactured_date], [color], [manufactured_at_id], [car_id])
VALUES
    ('2000-02-01', 'Red', 2, 2),
    ('2005-06-15', 'Blue', 3, 3),
    ('2010-10-30', 'Black', 4, 4),
    ('2015-03-22', 'White', 5, 5),
    ('2020-08-05', 'Silver', 1, 6),
    ('2002-02-12', 'Gray', 2, 7),
    ('2007-07-18', 'Green', 3, 8),
    ('2012-11-03', 'Yellow', 4, 9),
    ('2017-05-28', 'Orange', 5, 10),
    ('2022-01-10', 'Purple', 1, 1);
GO


