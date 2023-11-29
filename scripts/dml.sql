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
    ('T', 'Transfer')
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
-- INSERT INTO [dbo].[Transaction]
--     ([transaction_type], [created_user_id], [updated_user_id], [transported_by_id], [from_location_id], [to_location_id])
-- VALUES
--     ('P', 1, 1, 2, 3, 1),
--     ('S', 2, 2, 4, 5, 2),
--     ('R', 3, 3, 1, 7, 3),
--     ('T', 4, 4, 1, 2, 4),
--     ('D', 5, 5, 3, 4, 5),
--     ('L', 6, 6, 2, 6, 6),
--     ('C', 7, 7, 2, 3, 7);

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
    ('Electric Sedan', 'Medium size e-vehicle', 1),
    ('Hybrid Sedan', 'Electric and gas vehicle', 1),
    ('SUV', 'Big size Vehicle', 0),
    ('e-SUV', 'Big size e-Vehicle', 1),
    ('Hatchback', 'small size Vehicle', 0),
    ('e-Hatchback', 'small e-size Vehicle', 1),
    ('Truck', 'heavy Vehicle', 0),
    ('e-Truck', 'heavy e-Vehicle', 1)
GO
INSERT INTO [dbo].[Car]
    ([CarName], [production_year_start], [production_year_end], [brand_id], [type_id])
VALUES
    ('Honda Accord', '2000-11-28 23:43:34.000', '2020-12-31T23:59:59.9999999Z', 3, 1),
    ('Chevrolet Bolt', '2002-01-01T00:00:00.0000000Z', '2024-12-31T23:59:59.9999999Z', 4, 2),
    ('Toyota Prius', '2001-01-01T00:00:00.0000000Z', '2022-12-31T23:59:59.9999999Z', 5, 3),
    ('Ford Explorer', '2002-01-01T00:00:00.0000000Z', '2019-12-31T23:59:59.9999999Z', 1, 4),
    ('Tesla Model X', '2010-01-01T00:00:00.0000000Z', '2020-12-31T23:59:59.9999999Z', 2, 5),
    ('Volkswagen Golf', '2015-01-01T00:00:00.0000000Z', '2018-12-31T23:59:59.9999999Z', 3, 6),
    ('Nissan Leaf', '2017-01-01T00:00:00.0000000Z', '2019-12-31T23:59:59.9999999Z', 4, 7),
    ('Ford F-150', '2015-01-01T00:00:00.0000000Z', '2020-12-31T23:59:59.9999999Z', 1, 8),
    ('Rivian R1T', '2016-01-01T00:00:00.0000000Z', '2018-12-31T23:59:59.9999999Z', 2, 9)
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
-- INSERT INTO [dbo].[TransactionRow]
--     ([quantity], [unit_price], [part_batch_id], [transaction_id])
-- VALUES
--     (1, 25.5, 3, 1),
--     (2, 30.0, 4, 1),
--     (3, 45.8, 5, 1),
--     (1, 27.2, 6, 2),
--     (2, 32.6, 7, 2),
--     (3, 40.0, 8, 2),
--     (1, 28.9, 9, 3),
--     (2, 35.3, 10, 3),
--     (3, 42.7, 11, 3),
--     (1, 29.8, 12, 4),
--     (2, 36.1, 13, 4),
--     (3, 44.5, 14, 4),
--     (1, 30.7, 15, 5),
--     (2, 37.4, 16, 5),
--     (3, 46.3, 17, 5),
--     (1, 31.6, 18, 6),
--     (2, 38.7, 19, 6),
--     (3, 48.1, 20, 6),
--     (1, 33.2, 21, 7),
--     (2, 40.5, 22, 7),
--     (3, 50.2, 23, 7),
--     (1, 34.8, 24, 1),
--     (2, 42.3, 25, 1),
--     (3, 52.4, 26, 1),
--     (1, 36.2, 27, 2),
--     (2, 43.9, 28, 2),
--     (3, 54.0, 29, 2),
--     (1, 37.7, 30, 3),
--     (2, 45.1, 31, 3),
--     (3, 53.6, 32, 3),
--     (1, 39.0, 33, 4),
--     (2, 46.5, 34, 4),
--     (3, 55.3, 35, 4);
GO
insert into [Stock]
    ([batch_id],[location_id],[quantity])
    select 1, 1, 506
UNION ALL
    select 2, 1, 501
UNION ALL
    select 3, 1, 552
UNION ALL
    select 4, 1, 589
UNION ALL
    select 5, 1, 593
UNION ALL
    select 6, 1, 549
UNION ALL
    select 7, 1, 513
UNION ALL
    select 8, 1, 556
UNION ALL
    select 9, 1, 549
UNION ALL
    select 10, 1, 538
UNION ALL
    select 11, 1, 563
UNION ALL
    select 12, 1, 516
UNION ALL
    select 13, 1, 561
UNION ALL
    select 14, 1, 531
UNION ALL
    select 15, 1, 577
UNION ALL
    select 16, 1, 517
UNION ALL
    select 17, 1, 571
UNION ALL
    select 18, 1, 523
UNION ALL
    select 19, 1, 523
UNION ALL
    select 20, 1, 540
UNION ALL
    select 21, 1, 513
UNION ALL
    select 22, 1, 510
UNION ALL
    select 23, 1, 552
UNION ALL
    select 24, 1, 581
UNION ALL
    select 25, 1, 549
UNION ALL
    select 26, 1, 570
UNION ALL
    select 27, 1, 588
UNION ALL
    select 28, 1, 538
UNION ALL
    select 29, 1, 535
UNION ALL
    select 30, 1, 593
UNION ALL
    select 31, 1, 559
UNION ALL
    select 32, 1, 579
UNION ALL
    select 33, 1, 528
UNION ALL
    select 34, 1, 512
UNION ALL
    select 35, 1, 504
UNION ALL
    select 36, 1, 532
UNION ALL
    select 37, 1, 538
UNION ALL
    select 38, 1, 529
UNION ALL
    select 39, 1, 586
UNION ALL
    select 40, 1, 515
UNION ALL
    select 41, 1, 578
UNION ALL
    select 42, 1, 546
UNION ALL
    select 43, 1, 512
UNION ALL
    select 44, 1, 600
UNION ALL
    select 45, 1, 507
UNION ALL
    select 46, 1, 515
UNION ALL
    select 47, 1, 533
UNION ALL
    select 48, 1, 566
UNION ALL
    select 49, 1, 592
UNION ALL
    select 50, 1, 503
UNION ALL
    select 51, 1, 520
UNION ALL
    select 52, 1, 591
UNION ALL
    select 53, 1, 586
UNION ALL
    select 54, 1, 554
UNION ALL
    select 1, 2, 597
UNION ALL
    select 2, 2, 530
UNION ALL
    select 3, 2, 551
UNION ALL
    select 4, 2, 577
UNION ALL
    select 5, 2, 579
UNION ALL
    select 6, 2, 594
UNION ALL
    select 7, 2, 584
UNION ALL
    select 8, 2, 522
UNION ALL
    select 9, 2, 544
UNION ALL
    select 10, 2, 574
UNION ALL
    select 11, 2, 558
UNION ALL
    select 12, 2, 534
UNION ALL
    select 13, 2, 516
UNION ALL
    select 14, 2, 527
UNION ALL
    select 15, 2, 529
UNION ALL
    select 16, 2, 534
UNION ALL
    select 17, 2, 550
UNION ALL
    select 18, 2, 534
UNION ALL
    select 19, 2, 588
UNION ALL
    select 20, 2, 590
UNION ALL
    select 21, 2, 528
UNION ALL
    select 22, 2, 569
UNION ALL
    select 23, 2, 518
UNION ALL
    select 24, 2, 578
UNION ALL
    select 25, 2, 581
UNION ALL
    select 26, 2, 588
UNION ALL
    select 27, 2, 565
UNION ALL
    select 28, 2, 596
UNION ALL
    select 29, 2, 535
UNION ALL
    select 30, 2, 588
UNION ALL
    select 31, 2, 523
UNION ALL
    select 32, 2, 580
UNION ALL
    select 33, 2, 517
UNION ALL
    select 34, 2, 556
UNION ALL
    select 35, 2, 572
UNION ALL
    select 36, 2, 576
UNION ALL
    select 37, 2, 532
UNION ALL
    select 38, 2, 599
UNION ALL
    select 39, 2, 575
UNION ALL
    select 40, 2, 593
UNION ALL
    select 41, 2, 589
UNION ALL
    select 42, 2, 537
UNION ALL
    select 43, 2, 565
UNION ALL
    select 44, 2, 582
UNION ALL
    select 45, 2, 600
UNION ALL
    select 46, 2, 572
UNION ALL
    select 47, 2, 547
UNION ALL
    select 48, 2, 584
UNION ALL
    select 49, 2, 545
UNION ALL
    select 50, 2, 529
UNION ALL
    select 51, 2, 594
UNION ALL
    select 52, 2, 536
UNION ALL
    select 53, 2, 547
UNION ALL
    select 54, 2, 518
UNION ALL
    select 1, 3, 583
UNION ALL
    select 2, 3, 507
UNION ALL
    select 3, 3, 565
UNION ALL
    select 4, 3, 516
UNION ALL
    select 5, 3, 504
UNION ALL
    select 6, 3, 538
UNION ALL
    select 7, 3, 555
UNION ALL
    select 8, 3, 584
UNION ALL
    select 9, 3, 524
UNION ALL
    select 10, 3, 556
UNION ALL
    select 11, 3, 591
UNION ALL
    select 12, 3, 577
UNION ALL
    select 13, 3, 548
UNION ALL
    select 14, 3, 569
UNION ALL
    select 15, 3, 518
UNION ALL
    select 16, 3, 532
UNION ALL
    select 17, 3, 550
UNION ALL
    select 18, 3, 528
UNION ALL
    select 19, 3, 504
UNION ALL
    select 20, 3, 583
UNION ALL
    select 21, 3, 554
UNION ALL
    select 22, 3, 524
UNION ALL
    select 23, 3, 526
UNION ALL
    select 24, 3, 547
UNION ALL
    select 25, 3, 596
UNION ALL
    select 26, 3, 592
UNION ALL
    select 27, 3, 580
UNION ALL
    select 28, 3, 502
UNION ALL
    select 29, 3, 597
UNION ALL
    select 30, 3, 501
UNION ALL
    select 31, 3, 515
UNION ALL
    select 32, 3, 538
UNION ALL
    select 33, 3, 548
UNION ALL
    select 34, 3, 565
UNION ALL
    select 35, 3, 559
UNION ALL
    select 36, 3, 556
UNION ALL
    select 37, 3, 541
UNION ALL
    select 38, 3, 547
UNION ALL
    select 39, 3, 545
UNION ALL
    select 40, 3, 536
UNION ALL
    select 41, 3, 568
UNION ALL
    select 42, 3, 554
UNION ALL
    select 43, 3, 535
UNION ALL
    select 44, 3, 514
UNION ALL
    select 45, 3, 550
UNION ALL
    select 46, 3, 565
UNION ALL
    select 47, 3, 564
UNION ALL
    select 48, 3, 574
UNION ALL
    select 49, 3, 579
UNION ALL
    select 50, 3, 524
UNION ALL
    select 51, 3, 514
UNION ALL
    select 52, 3, 594
UNION ALL
    select 53, 3, 542
UNION ALL
    select 54, 3, 505
UNION ALL
    select 1, 4, 538
UNION ALL
    select 2, 4, 521
UNION ALL
    select 3, 4, 589
UNION ALL
    select 4, 4, 562
UNION ALL
    select 5, 4, 550
UNION ALL
    select 6, 4, 527
UNION ALL
    select 7, 4, 595
UNION ALL
    select 8, 4, 536
UNION ALL
    select 9, 4, 513
UNION ALL
    select 10, 4, 546
UNION ALL
    select 11, 4, 596
UNION ALL
    select 12, 4, 537
UNION ALL
    select 13, 4, 529
UNION ALL
    select 14, 4, 583
UNION ALL
    select 15, 4, 565
UNION ALL
    select 16, 4, 596
UNION ALL
    select 17, 4, 501
UNION ALL
    select 18, 4, 562
UNION ALL
    select 19, 4, 572
UNION ALL
    select 20, 4, 560
UNION ALL
    select 21, 4, 501
UNION ALL
    select 22, 4, 562
UNION ALL
    select 23, 4, 562
UNION ALL
    select 24, 4, 567
UNION ALL
    select 25, 4, 501
UNION ALL
    select 26, 4, 587
UNION ALL
    select 27, 4, 535
UNION ALL
    select 28, 4, 553
UNION ALL
    select 29, 4, 578
UNION ALL
    select 30, 4, 540
UNION ALL
    select 31, 4, 544
UNION ALL
    select 32, 4, 513
UNION ALL
    select 33, 4, 536
UNION ALL
    select 34, 4, 583
UNION ALL
    select 35, 4, 509
UNION ALL
    select 36, 4, 545
UNION ALL
    select 37, 4, 596
UNION ALL
    select 38, 4, 538
UNION ALL
    select 39, 4, 564
UNION ALL
    select 40, 4, 567
UNION ALL
    select 41, 4, 507
UNION ALL
    select 42, 4, 511
UNION ALL
    select 43, 4, 506
UNION ALL
    select 44, 4, 502
UNION ALL
    select 45, 4, 538
UNION ALL
    select 46, 4, 588
UNION ALL
    select 47, 4, 592
UNION ALL
    select 48, 4, 583
UNION ALL
    select 49, 4, 508
UNION ALL
    select 50, 4, 585
UNION ALL
    select 51, 4, 548
UNION ALL
    select 52, 4, 571
UNION ALL
    select 53, 4, 587
UNION ALL
    select 54, 4, 523
UNION ALL
    select 1, 5, 547
UNION ALL
    select 2, 5, 543
UNION ALL
    select 3, 5, 510
UNION ALL
    select 4, 5, 547
UNION ALL
    select 5, 5, 521
UNION ALL
    select 6, 5, 565
UNION ALL
    select 7, 5, 526
UNION ALL
    select 8, 5, 540
UNION ALL
    select 9, 5, 521
UNION ALL
    select 10, 5, 516
UNION ALL
    select 11, 5, 558
UNION ALL
    select 12, 5, 596
UNION ALL
    select 13, 5, 550
UNION ALL
    select 14, 5, 524
UNION ALL
    select 15, 5, 578
UNION ALL
    select 16, 5, 596
UNION ALL
    select 17, 5, 522
UNION ALL
    select 18, 5, 590
UNION ALL
    select 19, 5, 502
UNION ALL
    select 20, 5, 574
UNION ALL
    select 21, 5, 554
UNION ALL
    select 22, 5, 594
UNION ALL
    select 23, 5, 554
UNION ALL
    select 24, 5, 583
UNION ALL
    select 25, 5, 502
UNION ALL
    select 26, 5, 573
UNION ALL
    select 27, 5, 533
UNION ALL
    select 28, 5, 534
UNION ALL
    select 29, 5, 590
UNION ALL
    select 30, 5, 568
UNION ALL
    select 31, 5, 506
UNION ALL
    select 32, 5, 503
UNION ALL
    select 33, 5, 559
UNION ALL
    select 34, 5, 566
UNION ALL
    select 35, 5, 506
UNION ALL
    select 36, 5, 572
UNION ALL
    select 37, 5, 503
UNION ALL
    select 38, 5, 584
UNION ALL
    select 39, 5, 561
UNION ALL
    select 40, 5, 552
UNION ALL
    select 41, 5, 549
UNION ALL
    select 42, 5, 546
UNION ALL
    select 43, 5, 537
UNION ALL
    select 44, 5, 531
UNION ALL
    select 45, 5, 510
UNION ALL
    select 46, 5, 558
UNION ALL
    select 47, 5, 522
UNION ALL
    select 48, 5, 531
UNION ALL
    select 49, 5, 526
UNION ALL
    select 50, 5, 558
UNION ALL
    select 51, 5, 501
UNION ALL
    select 52, 5, 551
UNION ALL
    select 53, 5, 558
UNION ALL
    select 54, 5, 598
UNION ALL
    select 1, 6, 549
UNION ALL
    select 2, 6, 548
UNION ALL
    select 3, 6, 572
UNION ALL
    select 4, 6, 597
UNION ALL
    select 5, 6, 573
UNION ALL
    select 6, 6, 509
UNION ALL
    select 7, 6, 584
UNION ALL
    select 8, 6, 539
UNION ALL
    select 9, 6, 518
UNION ALL
    select 10, 6, 508
UNION ALL
    select 11, 6, 590
UNION ALL
    select 12, 6, 521
UNION ALL
    select 13, 6, 574
UNION ALL
    select 14, 6, 531
UNION ALL
    select 15, 6, 564
UNION ALL
    select 16, 6, 524
UNION ALL
    select 17, 6, 593
UNION ALL
    select 18, 6, 598
UNION ALL
    select 19, 6, 543
UNION ALL
    select 20, 6, 531
UNION ALL
    select 21, 6, 549
UNION ALL
    select 22, 6, 531
UNION ALL
    select 23, 6, 600
UNION ALL
    select 24, 6, 583
UNION ALL
    select 25, 6, 591
UNION ALL
    select 26, 6, 569
UNION ALL
    select 27, 6, 580
UNION ALL
    select 28, 6, 577
UNION ALL
    select 29, 6, 516
UNION ALL
    select 30, 6, 510
UNION ALL
    select 31, 6, 543
UNION ALL
    select 32, 6, 585
UNION ALL
    select 33, 6, 550
UNION ALL
    select 34, 6, 544
UNION ALL
    select 35, 6, 518
UNION ALL
    select 36, 6, 506
UNION ALL
    select 37, 6, 537
UNION ALL
    select 38, 6, 569
UNION ALL
    select 39, 6, 556
UNION ALL
    select 40, 6, 596
UNION ALL
    select 41, 6, 515
UNION ALL
    select 42, 6, 560
UNION ALL
    select 43, 6, 577
UNION ALL
    select 44, 6, 558
UNION ALL
    select 45, 6, 552
UNION ALL
    select 46, 6, 548
UNION ALL
    select 47, 6, 531
UNION ALL
    select 48, 6, 581
UNION ALL
    select 49, 6, 542
UNION ALL
    select 50, 6, 572
UNION ALL
    select 51, 6, 590
UNION ALL
    select 52, 6, 589
UNION ALL
    select 53, 6, 509
UNION ALL
    select 54, 6, 552
UNION ALL
    select 1, 7, 521
UNION ALL
    select 2, 7, 534
UNION ALL
    select 3, 7, 522
UNION ALL
    select 4, 7, 587
UNION ALL
    select 5, 7, 504
UNION ALL
    select 6, 7, 592
UNION ALL
    select 7, 7, 548
UNION ALL
    select 8, 7, 588
UNION ALL
    select 9, 7, 571
UNION ALL
    select 10, 7, 519
UNION ALL
    select 11, 7, 539
UNION ALL
    select 12, 7, 567
UNION ALL
    select 13, 7, 575
UNION ALL
    select 14, 7, 587
UNION ALL
    select 15, 7, 590
UNION ALL
    select 16, 7, 589
UNION ALL
    select 17, 7, 545
UNION ALL
    select 18, 7, 582
UNION ALL
    select 19, 7, 535
UNION ALL
    select 20, 7, 532
UNION ALL
    select 21, 7, 506
UNION ALL
    select 22, 7, 531
UNION ALL
    select 23, 7, 575
UNION ALL
    select 24, 7, 562
UNION ALL
    select 25, 7, 550
UNION ALL
    select 26, 7, 579
UNION ALL
    select 27, 7, 559
UNION ALL
    select 28, 7, 511
UNION ALL
    select 29, 7, 539
UNION ALL
    select 30, 7, 564
UNION ALL
    select 31, 7, 530
UNION ALL
    select 32, 7, 562
UNION ALL
    select 33, 7, 558
UNION ALL
    select 34, 7, 504
UNION ALL
    select 35, 7, 556
UNION ALL
    select 36, 7, 507
UNION ALL
    select 37, 7, 598
UNION ALL
    select 38, 7, 530
UNION ALL
    select 39, 7, 594
UNION ALL
    select 40, 7, 572
UNION ALL
    select 41, 7, 580
UNION ALL
    select 42, 7, 579
UNION ALL
    select 43, 7, 562
UNION ALL
    select 44, 7, 534
UNION ALL
    select 45, 7, 591
UNION ALL
    select 46, 7, 511
UNION ALL
    select 47, 7, 599
UNION ALL
    select 48, 7, 545
UNION ALL
    select 49, 7, 586
UNION ALL
    select 50, 7, 585
UNION ALL
    select 51, 7, 524
UNION ALL
    select 52, 7, 511
UNION ALL
    select 53, 7, 523
UNION ALL
    select 54, 7, 557
UNION ALL
    select 1, 8, 516
UNION ALL
    select 2, 8, 572
UNION ALL
    select 3, 8, 569
UNION ALL
    select 4, 8, 571
UNION ALL
    select 5, 8, 568
UNION ALL
    select 6, 8, 561
UNION ALL
    select 7, 8, 560
UNION ALL
    select 8, 8, 501
UNION ALL
    select 9, 8, 518
UNION ALL
    select 10, 8, 520
UNION ALL
    select 11, 8, 548
UNION ALL
    select 12, 8, 506
UNION ALL
    select 13, 8, 545
UNION ALL
    select 14, 8, 509
UNION ALL
    select 15, 8, 555
UNION ALL
    select 16, 8, 550
UNION ALL
    select 17, 8, 523
UNION ALL
    select 18, 8, 523
UNION ALL
    select 19, 8, 506
UNION ALL
    select 20, 8, 513
UNION ALL
    select 21, 8, 588
UNION ALL
    select 22, 8, 510
UNION ALL
    select 23, 8, 527
UNION ALL
    select 24, 8, 541
UNION ALL
    select 25, 8, 504
UNION ALL
    select 26, 8, 597
UNION ALL
    select 27, 8, 600
UNION ALL
    select 28, 8, 551
UNION ALL
    select 29, 8, 558
UNION ALL
    select 30, 8, 533
UNION ALL
    select 31, 8, 549
UNION ALL
    select 32, 8, 543
UNION ALL
    select 33, 8, 552
UNION ALL
    select 34, 8, 510
UNION ALL
    select 35, 8, 571
UNION ALL
    select 36, 8, 574
UNION ALL
    select 37, 8, 559
UNION ALL
    select 38, 8, 515
UNION ALL
    select 39, 8, 581
UNION ALL
    select 40, 8, 585
UNION ALL
    select 41, 8, 586
UNION ALL
    select 42, 8, 574
UNION ALL
    select 43, 8, 581
UNION ALL
    select 44, 8, 558
UNION ALL
    select 45, 8, 552
UNION ALL
    select 46, 8, 540
UNION ALL
    select 47, 8, 594
UNION ALL
    select 48, 8, 576
UNION ALL
    select 49, 8, 559
UNION ALL
    select 50, 8, 598
UNION ALL
    select 51, 8, 568
UNION ALL
    select 52, 8, 512
UNION ALL
    select 53, 8, 529
UNION ALL
    select 54, 8, 553
UNION ALL
    select 1, 9, 587
UNION ALL
    select 2, 9, 531
UNION ALL
    select 3, 9, 565
UNION ALL
    select 4, 9, 512
UNION ALL
    select 5, 9, 564
UNION ALL
    select 6, 9, 592
UNION ALL
    select 7, 9, 517
UNION ALL
    select 8, 9, 520
UNION ALL
    select 9, 9, 528
UNION ALL
    select 10, 9, 531
UNION ALL
    select 11, 9, 541
UNION ALL
    select 12, 9, 547
UNION ALL
    select 13, 9, 561
UNION ALL
    select 14, 9, 540
UNION ALL
    select 15, 9, 527
UNION ALL
    select 16, 9, 535
UNION ALL
    select 17, 9, 505
UNION ALL
    select 18, 9, 506
UNION ALL
    select 19, 9, 515
UNION ALL
    select 20, 9, 598
UNION ALL
    select 21, 9, 502
UNION ALL
    select 22, 9, 566
UNION ALL
    select 23, 9, 551
UNION ALL
    select 24, 9, 587
UNION ALL
    select 25, 9, 593
UNION ALL
    select 26, 9, 583
UNION ALL
    select 27, 9, 598
UNION ALL
    select 28, 9, 522
UNION ALL
    select 29, 9, 503
UNION ALL
    select 30, 9, 523
UNION ALL
    select 31, 9, 509
UNION ALL
    select 32, 9, 552
UNION ALL
    select 33, 9, 582
UNION ALL
    select 34, 9, 541
UNION ALL
    select 35, 9, 584
UNION ALL
    select 36, 9, 539
UNION ALL
    select 37, 9, 564
UNION ALL
    select 38, 9, 595
UNION ALL
    select 39, 9, 554
UNION ALL
    select 40, 9, 547
UNION ALL
    select 41, 9, 532
UNION ALL
    select 42, 9, 597
UNION ALL
    select 43, 9, 504
UNION ALL
    select 44, 9, 599
UNION ALL
    select 45, 9, 569
UNION ALL
    select 46, 9, 501
UNION ALL
    select 47, 9, 512
UNION ALL
    select 48, 9, 542
UNION ALL
    select 49, 9, 552
UNION ALL
    select 50, 9, 572
UNION ALL
    select 51, 9, 560
UNION ALL
    select 52, 9, 521
UNION ALL
    select 53, 9, 544
UNION ALL
    select 54, 9, 584
UNION ALL
    select 1, 10, 538
UNION ALL
    select 2, 10, 507
UNION ALL
    select 3, 10, 593
UNION ALL
    select 4, 10, 542
UNION ALL
    select 5, 10, 592
UNION ALL
    select 6, 10, 565
UNION ALL
    select 7, 10, 541
UNION ALL
    select 8, 10, 573
UNION ALL
    select 9, 10, 542
UNION ALL
    select 10, 10, 567
UNION ALL
    select 11, 10, 586
UNION ALL
    select 12, 10, 512
UNION ALL
    select 13, 10, 527
UNION ALL
    select 14, 10, 529
UNION ALL
    select 15, 10, 585
UNION ALL
    select 16, 10, 575
UNION ALL
    select 17, 10, 583
UNION ALL
    select 18, 10, 503
UNION ALL
    select 19, 10, 577
UNION ALL
    select 20, 10, 542
UNION ALL
    select 21, 10, 560
UNION ALL
    select 22, 10, 589
UNION ALL
    select 23, 10, 599
UNION ALL
    select 24, 10, 535
UNION ALL
    select 25, 10, 529
UNION ALL
    select 26, 10, 567
UNION ALL
    select 27, 10, 505
UNION ALL
    select 28, 10, 562
UNION ALL
    select 29, 10, 598
UNION ALL
    select 30, 10, 546
UNION ALL
    select 31, 10, 566
UNION ALL
    select 32, 10, 511
UNION ALL
    select 33, 10, 591
UNION ALL
    select 34, 10, 585
UNION ALL
    select 35, 10, 533
UNION ALL
    select 36, 10, 532
UNION ALL
    select 37, 10, 535
UNION ALL
    select 38, 10, 593
UNION ALL
    select 39, 10, 518
UNION ALL
    select 40, 10, 542
UNION ALL
    select 41, 10, 599
UNION ALL
    select 42, 10, 537
UNION ALL
    select 43, 10, 573
UNION ALL
    select 44, 10, 504
UNION ALL
    select 45, 10, 583
UNION ALL
    select 46, 10, 559
UNION ALL
    select 47, 10, 516
UNION ALL
    select 48, 10, 555
UNION ALL
    select 49, 10, 597
UNION ALL
    select 50, 10, 572
UNION ALL
    select 51, 10, 521
UNION ALL
    select 52, 10, 505
UNION ALL
    select 53, 10, 589
UNION ALL
    select 54, 10, 505
UNION ALL
    select 1, 11, 585
UNION ALL
    select 2, 11, 514
UNION ALL
    select 3, 11, 533
UNION ALL
    select 4, 11, 580
UNION ALL
    select 5, 11, 527
UNION ALL
    select 6, 11, 576
UNION ALL
    select 7, 11, 508
UNION ALL
    select 8, 11, 549
UNION ALL
    select 9, 11, 522
UNION ALL
    select 10, 11, 543
UNION ALL
    select 11, 11, 551
UNION ALL
    select 12, 11, 525
UNION ALL
    select 13, 11, 595
UNION ALL
    select 14, 11, 509
UNION ALL
    select 15, 11, 524
UNION ALL
    select 16, 11, 522
UNION ALL
    select 17, 11, 546
UNION ALL
    select 18, 11, 505
UNION ALL
    select 19, 11, 560
UNION ALL
    select 20, 11, 544
UNION ALL
    select 21, 11, 538
UNION ALL
    select 22, 11, 576
UNION ALL
    select 23, 11, 571
UNION ALL
    select 24, 11, 544
UNION ALL
    select 25, 11, 600
UNION ALL
    select 26, 11, 540
UNION ALL
    select 27, 11, 504
UNION ALL
    select 28, 11, 560
UNION ALL
    select 29, 11, 578
UNION ALL
    select 30, 11, 536
UNION ALL
    select 31, 11, 591
UNION ALL
    select 32, 11, 580
UNION ALL
    select 33, 11, 502
UNION ALL
    select 34, 11, 596
UNION ALL
    select 35, 11, 545
UNION ALL
    select 36, 11, 596
UNION ALL
    select 37, 11, 525
UNION ALL
    select 38, 11, 579
UNION ALL
    select 39, 11, 554
UNION ALL
    select 40, 11, 552
UNION ALL
    select 41, 11, 559
UNION ALL
    select 42, 11, 566
UNION ALL
    select 43, 11, 522
UNION ALL
    select 44, 11, 514
UNION ALL
    select 45, 11, 565
UNION ALL
    select 46, 11, 530
UNION ALL
    select 47, 11, 585
UNION ALL
    select 48, 11, 523
UNION ALL
    select 49, 11, 552
UNION ALL
    select 50, 11, 503
UNION ALL
    select 51, 11, 559
UNION ALL
    select 52, 11, 524
UNION ALL
    select 53, 11, 506
UNION ALL
    select 54, 11, 575
UNION ALL
    select 1, 12, 554
UNION ALL
    select 2, 12, 600
UNION ALL
    select 3, 12, 568
UNION ALL
    select 4, 12, 569
UNION ALL
    select 5, 12, 572
UNION ALL
    select 6, 12, 580
UNION ALL
    select 7, 12, 535
UNION ALL
    select 8, 12, 563
UNION ALL
    select 9, 12, 564
UNION ALL
    select 10, 12, 585
UNION ALL
    select 11, 12, 592
UNION ALL
    select 12, 12, 536
UNION ALL
    select 13, 12, 596
UNION ALL
    select 14, 12, 549
UNION ALL
    select 15, 12, 534
UNION ALL
    select 16, 12, 548
UNION ALL
    select 17, 12, 575
UNION ALL
    select 18, 12, 556
UNION ALL
    select 19, 12, 547
UNION ALL
    select 20, 12, 563
UNION ALL
    select 21, 12, 547
UNION ALL
    select 22, 12, 555
UNION ALL
    select 23, 12, 533
UNION ALL
    select 24, 12, 580
UNION ALL
    select 25, 12, 534
UNION ALL
    select 26, 12, 538
UNION ALL
    select 27, 12, 532
UNION ALL
    select 28, 12, 503
UNION ALL
    select 29, 12, 540
UNION ALL
    select 30, 12, 572
UNION ALL
    select 31, 12, 550
UNION ALL
    select 32, 12, 526
UNION ALL
    select 33, 12, 595
UNION ALL
    select 34, 12, 507
UNION ALL
    select 35, 12, 580
UNION ALL
    select 36, 12, 519
UNION ALL
    select 37, 12, 570
UNION ALL
    select 38, 12, 562
UNION ALL
    select 39, 12, 529
UNION ALL
    select 40, 12, 528
UNION ALL
    select 41, 12, 585
UNION ALL
    select 42, 12, 532
UNION ALL
    select 43, 12, 503
UNION ALL
    select 44, 12, 533
UNION ALL
    select 45, 12, 576
UNION ALL
    select 46, 12, 586
UNION ALL
    select 47, 12, 564
UNION ALL
    select 48, 12, 507
UNION ALL
    select 49, 12, 568
UNION ALL
    select 50, 12, 582
UNION ALL
    select 51, 12, 592
UNION ALL
    select 52, 12, 561
UNION ALL
    select 53, 12, 543
UNION ALL
    select 54, 12, 531
UNION ALL
    select 1, 13, 510
UNION ALL
    select 2, 13, 521
UNION ALL
    select 3, 13, 597
UNION ALL
    select 4, 13, 539
UNION ALL
    select 5, 13, 509
UNION ALL
    select 6, 13, 594
UNION ALL
    select 7, 13, 513
UNION ALL
    select 8, 13, 526
UNION ALL
    select 9, 13, 517
UNION ALL
    select 10, 13, 535
UNION ALL
    select 11, 13, 540
UNION ALL
    select 12, 13, 521
UNION ALL
    select 13, 13, 553
UNION ALL
    select 14, 13, 526
UNION ALL
    select 15, 13, 527
UNION ALL
    select 16, 13, 586
UNION ALL
    select 17, 13, 593
UNION ALL
    select 18, 13, 510
UNION ALL
    select 19, 13, 544
UNION ALL
    select 20, 13, 534
UNION ALL
    select 21, 13, 559
UNION ALL
    select 22, 13, 513
UNION ALL
    select 23, 13, 584
UNION ALL
    select 24, 13, 546
UNION ALL
    select 25, 13, 553
UNION ALL
    select 26, 13, 586
UNION ALL
    select 27, 13, 530
UNION ALL
    select 28, 13, 576
UNION ALL
    select 29, 13, 535
UNION ALL
    select 30, 13, 600
UNION ALL
    select 31, 13, 571
UNION ALL
    select 32, 13, 557
UNION ALL
    select 33, 13, 555
UNION ALL
    select 34, 13, 585
UNION ALL
    select 35, 13, 542
UNION ALL
    select 36, 13, 548
UNION ALL
    select 37, 13, 588
UNION ALL
    select 38, 13, 587
UNION ALL
    select 39, 13, 551
UNION ALL
    select 40, 13, 537
UNION ALL
    select 41, 13, 532
UNION ALL
    select 42, 13, 520
UNION ALL
    select 43, 13, 536
UNION ALL
    select 44, 13, 554
UNION ALL
    select 45, 13, 591
UNION ALL
    select 46, 13, 575
UNION ALL
    select 47, 13, 595
UNION ALL
    select 48, 13, 508
UNION ALL
    select 49, 13, 599
UNION ALL
    select 50, 13, 529
UNION ALL
    select 51, 13, 517
UNION ALL
    select 52, 13, 557
UNION ALL
    select 53, 13, 509
UNION ALL
    select 54, 13, 502
UNION ALL
    select 1, 14, 515
UNION ALL
    select 2, 14, 600
UNION ALL
    select 3, 14, 507
UNION ALL
    select 4, 14, 596
UNION ALL
    select 5, 14, 537
UNION ALL
    select 6, 14, 517
UNION ALL
    select 7, 14, 551
UNION ALL
    select 8, 14, 528
UNION ALL
    select 9, 14, 542
UNION ALL
    select 10, 14, 553
UNION ALL
    select 11, 14, 560
UNION ALL
    select 12, 14, 517
UNION ALL
    select 13, 14, 545
UNION ALL
    select 14, 14, 525
UNION ALL
    select 15, 14, 588
UNION ALL
    select 16, 14, 594
UNION ALL
    select 17, 14, 594
UNION ALL
    select 18, 14, 510
UNION ALL
    select 19, 14, 557
UNION ALL
    select 20, 14, 557
UNION ALL
    select 21, 14, 597
UNION ALL
    select 22, 14, 590
UNION ALL
    select 23, 14, 591
UNION ALL
    select 24, 14, 544
UNION ALL
    select 25, 14, 504
UNION ALL
    select 26, 14, 546
UNION ALL
    select 27, 14, 517
UNION ALL
    select 28, 14, 514
UNION ALL
    select 29, 14, 508
UNION ALL
    select 30, 14, 535
UNION ALL
    select 31, 14, 559
UNION ALL
    select 32, 14, 552
UNION ALL
    select 33, 14, 578
UNION ALL
    select 34, 14, 505
UNION ALL
    select 35, 14, 524
UNION ALL
    select 36, 14, 525
UNION ALL
    select 37, 14, 542
UNION ALL
    select 38, 14, 510
UNION ALL
    select 39, 14, 522
UNION ALL
    select 40, 14, 587
UNION ALL
    select 41, 14, 509
UNION ALL
    select 42, 14, 533
UNION ALL
    select 43, 14, 548
UNION ALL
    select 44, 14, 530
UNION ALL
    select 45, 14, 565
UNION ALL
    select 46, 14, 577
UNION ALL
    select 47, 14, 519
UNION ALL
    select 48, 14, 593
UNION ALL
    select 49, 14, 585
UNION ALL
    select 50, 14, 504
UNION ALL
    select 51, 14, 568
UNION ALL
    select 52, 14, 589
UNION ALL
    select 53, 14, 518
UNION ALL
    select 54, 14, 572
UNION ALL
    select 1, 15, 510
UNION ALL
    select 2, 15, 557
UNION ALL
    select 3, 15, 563
UNION ALL
    select 4, 15, 574
UNION ALL
    select 5, 15, 551
UNION ALL
    select 6, 15, 562
UNION ALL
    select 7, 15, 549
UNION ALL
    select 8, 15, 519
UNION ALL
    select 9, 15, 555
UNION ALL
    select 10, 15, 600
UNION ALL
    select 11, 15, 556
UNION ALL
    select 12, 15, 599
UNION ALL
    select 13, 15, 548
UNION ALL
    select 14, 15, 581
UNION ALL
    select 15, 15, 534
UNION ALL
    select 16, 15, 597
UNION ALL
    select 17, 15, 502
UNION ALL
    select 18, 15, 599
UNION ALL
    select 19, 15, 578
UNION ALL
    select 20, 15, 599
UNION ALL
    select 21, 15, 503
UNION ALL
    select 22, 15, 551
UNION ALL
    select 23, 15, 503
UNION ALL
    select 24, 15, 546
UNION ALL
    select 25, 15, 552
UNION ALL
    select 26, 15, 575
UNION ALL
    select 27, 15, 598
UNION ALL
    select 28, 15, 581
UNION ALL
    select 29, 15, 555
UNION ALL
    select 30, 15, 600
UNION ALL
    select 31, 15, 595
UNION ALL
    select 32, 15, 536
UNION ALL
    select 33, 15, 526
UNION ALL
    select 34, 15, 573
UNION ALL
    select 35, 15, 561
UNION ALL
    select 36, 15, 508
UNION ALL
    select 37, 15, 537
UNION ALL
    select 38, 15, 535
UNION ALL
    select 39, 15, 590
UNION ALL
    select 40, 15, 530
UNION ALL
    select 41, 15, 532
UNION ALL
    select 42, 15, 506
UNION ALL
    select 43, 15, 599
UNION ALL
    select 44, 15, 567
UNION ALL
    select 45, 15, 519
UNION ALL
    select 46, 15, 566
UNION ALL
    select 47, 15, 508
UNION ALL
    select 48, 15, 505
UNION ALL
    select 49, 15, 557
UNION ALL
    select 50, 15, 597
UNION ALL
    select 51, 15, 538
UNION ALL
    select 52, 15, 573
UNION ALL
    select 53, 15, 517
UNION ALL
    select 54, 15, 562
UNION ALL
    select 1, 16, 549
UNION ALL
    select 2, 16, 563
UNION ALL
    select 3, 16, 524
UNION ALL
    select 4, 16, 510
UNION ALL
    select 5, 16, 523
UNION ALL
    select 6, 16, 561
UNION ALL
    select 7, 16, 568
UNION ALL
    select 8, 16, 560
UNION ALL
    select 9, 16, 519
UNION ALL
    select 10, 16, 543
UNION ALL
    select 11, 16, 530
UNION ALL
    select 12, 16, 548
UNION ALL
    select 13, 16, 501
UNION ALL
    select 14, 16, 597
UNION ALL
    select 15, 16, 556
UNION ALL
    select 16, 16, 532
UNION ALL
    select 17, 16, 583
UNION ALL
    select 18, 16, 526
UNION ALL
    select 19, 16, 519
UNION ALL
    select 20, 16, 574
UNION ALL
    select 21, 16, 589
UNION ALL
    select 22, 16, 551
UNION ALL
    select 23, 16, 532
UNION ALL
    select 24, 16, 545
UNION ALL
    select 25, 16, 593
UNION ALL
    select 26, 16, 529
UNION ALL
    select 27, 16, 549
UNION ALL
    select 28, 16, 589
UNION ALL
    select 29, 16, 548
UNION ALL
    select 30, 16, 553
UNION ALL
    select 31, 16, 582
UNION ALL
    select 32, 16, 556
UNION ALL
    select 33, 16, 517
UNION ALL
    select 34, 16, 597
UNION ALL
    select 35, 16, 517
UNION ALL
    select 36, 16, 583
UNION ALL
    select 37, 16, 545
UNION ALL
    select 38, 16, 585
UNION ALL
    select 39, 16, 525
UNION ALL
    select 40, 16, 572
UNION ALL
    select 41, 16, 600
UNION ALL
    select 42, 16, 509
UNION ALL
    select 43, 16, 503
UNION ALL
    select 44, 16, 600
UNION ALL
    select 45, 16, 574
UNION ALL
    select 46, 16, 563
UNION ALL
    select 47, 16, 591
UNION ALL
    select 48, 16, 507
UNION ALL
    select 49, 16, 507
UNION ALL
    select 50, 16, 502
UNION ALL
    select 51, 16, 528
UNION ALL
    select 52, 16, 584
UNION ALL
    select 53, 16, 573
UNION ALL
    select 54, 16, 516
UNION ALL
    select 1, 17, 579
UNION ALL
    select 2, 17, 596
UNION ALL
    select 3, 17, 511
UNION ALL
    select 4, 17, 526
UNION ALL
    select 5, 17, 554
UNION ALL
    select 6, 17, 570
UNION ALL
    select 7, 17, 573
UNION ALL
    select 8, 17, 526
UNION ALL
    select 9, 17, 569
UNION ALL
    select 10, 17, 557
UNION ALL
    select 11, 17, 560
UNION ALL
    select 12, 17, 581
UNION ALL
    select 13, 17, 525
UNION ALL
    select 14, 17, 577
UNION ALL
    select 15, 17, 556
UNION ALL
    select 16, 17, 527
UNION ALL
    select 17, 17, 555
UNION ALL
    select 18, 17, 529
UNION ALL
    select 19, 17, 535
UNION ALL
    select 20, 17, 508
UNION ALL
    select 21, 17, 523
UNION ALL
    select 22, 17, 505
UNION ALL
    select 23, 17, 577
UNION ALL
    select 24, 17, 506
UNION ALL
    select 25, 17, 567
UNION ALL
    select 26, 17, 519
UNION ALL
    select 27, 17, 562
UNION ALL
    select 28, 17, 553
UNION ALL
    select 29, 17, 557
UNION ALL
    select 30, 17, 508
UNION ALL
    select 31, 17, 514
UNION ALL
    select 32, 17, 574
UNION ALL
    select 33, 17, 537
UNION ALL
    select 34, 17, 519
UNION ALL
    select 35, 17, 503
UNION ALL
    select 36, 17, 536
UNION ALL
    select 37, 17, 518
UNION ALL
    select 38, 17, 529
UNION ALL
    select 39, 17, 568
UNION ALL
    select 40, 17, 584
UNION ALL
    select 41, 17, 591
UNION ALL
    select 42, 17, 571
UNION ALL
    select 43, 17, 521
UNION ALL
    select 44, 17, 513
UNION ALL
    select 45, 17, 515
UNION ALL
    select 46, 17, 541
UNION ALL
    select 47, 17, 547
UNION ALL
    select 48, 17, 514
UNION ALL
    select 49, 17, 550
UNION ALL
    select 50, 17, 529
UNION ALL
    select 51, 17, 514
UNION ALL
    select 52, 17, 509
UNION ALL
    select 53, 17, 505
UNION ALL
    select 54, 17, 575
UNION ALL
    select 1, 18, 579
UNION ALL
    select 2, 18, 512
UNION ALL
    select 3, 18, 523
UNION ALL
    select 4, 18, 563
UNION ALL
    select 5, 18, 520
UNION ALL
    select 6, 18, 589
UNION ALL
    select 7, 18, 516
UNION ALL
    select 8, 18, 549
UNION ALL
    select 9, 18, 564
UNION ALL
    select 10, 18, 577
UNION ALL
    select 11, 18, 558
UNION ALL
    select 12, 18, 541
UNION ALL
    select 13, 18, 572
UNION ALL
    select 14, 18, 509
UNION ALL
    select 15, 18, 574
UNION ALL
    select 16, 18, 537
UNION ALL
    select 17, 18, 537
UNION ALL
    select 18, 18, 541
UNION ALL
    select 19, 18, 535
UNION ALL
    select 20, 18, 569
UNION ALL
    select 21, 18, 566
UNION ALL
    select 22, 18, 589
UNION ALL
    select 23, 18, 564
UNION ALL
    select 24, 18, 508
UNION ALL
    select 25, 18, 560
UNION ALL
    select 26, 18, 559
UNION ALL
    select 27, 18, 535
UNION ALL
    select 28, 18, 562
UNION ALL
    select 29, 18, 531
UNION ALL
    select 30, 18, 530
UNION ALL
    select 31, 18, 578
UNION ALL
    select 32, 18, 571
UNION ALL
    select 33, 18, 567
UNION ALL
    select 34, 18, 555
UNION ALL
    select 35, 18, 590
UNION ALL
    select 36, 18, 555
UNION ALL
    select 37, 18, 562
UNION ALL
    select 38, 18, 542
UNION ALL
    select 39, 18, 551
UNION ALL
    select 40, 18, 505
UNION ALL
    select 41, 18, 554
UNION ALL
    select 42, 18, 566
UNION ALL
    select 43, 18, 566
UNION ALL
    select 44, 18, 518
UNION ALL
    select 45, 18, 517
UNION ALL
    select 46, 18, 598
UNION ALL
    select 47, 18, 573
UNION ALL
    select 48, 18, 546
UNION ALL
    select 49, 18, 558
UNION ALL
    select 50, 18, 543
UNION ALL
    select 51, 18, 533
UNION ALL
    select 52, 18, 582
UNION ALL
    select 53, 18, 533
UNION ALL
    select 54, 18, 583
UNION ALL
    select 1, 19, 534
UNION ALL
    select 2, 19, 571
UNION ALL
    select 3, 19, 592
UNION ALL
    select 4, 19, 530
UNION ALL
    select 5, 19, 584
UNION ALL
    select 6, 19, 599
UNION ALL
    select 7, 19, 563
UNION ALL
    select 8, 19, 536
UNION ALL
    select 9, 19, 566
UNION ALL
    select 10, 19, 597
UNION ALL
    select 11, 19, 597
UNION ALL
    select 12, 19, 571
UNION ALL
    select 13, 19, 512
UNION ALL
    select 14, 19, 509
UNION ALL
    select 15, 19, 520
UNION ALL
    select 16, 19, 585
UNION ALL
    select 17, 19, 541
UNION ALL
    select 18, 19, 571
UNION ALL
    select 19, 19, 590
UNION ALL
    select 20, 19, 521
UNION ALL
    select 21, 19, 549
UNION ALL
    select 22, 19, 570
UNION ALL
    select 23, 19, 547
UNION ALL
    select 24, 19, 533
UNION ALL
    select 25, 19, 519
UNION ALL
    select 26, 19, 546
UNION ALL
    select 27, 19, 558
UNION ALL
    select 28, 19, 564
UNION ALL
    select 29, 19, 551
UNION ALL
    select 30, 19, 599
UNION ALL
    select 31, 19, 514
UNION ALL
    select 32, 19, 551
UNION ALL
    select 33, 19, 566
UNION ALL
    select 34, 19, 561
UNION ALL
    select 35, 19, 581
UNION ALL
    select 36, 19, 567
UNION ALL
    select 37, 19, 577
UNION ALL
    select 38, 19, 581
UNION ALL
    select 39, 19, 547
UNION ALL
    select 40, 19, 592
UNION ALL
    select 41, 19, 565
UNION ALL
    select 42, 19, 531
UNION ALL
    select 43, 19, 598
UNION ALL
    select 44, 19, 556
UNION ALL
    select 45, 19, 529
UNION ALL
    select 46, 19, 547
UNION ALL
    select 47, 19, 518
UNION ALL
    select 48, 19, 562
UNION ALL
    select 49, 19, 521
UNION ALL
    select 50, 19, 589
UNION ALL
    select 51, 19, 563
UNION ALL
    select 52, 19, 546
UNION ALL
    select 53, 19, 552
UNION ALL
    select 54, 19, 584
UNION ALL
    select 1, 20, 503
UNION ALL
    select 2, 20, 570
UNION ALL
    select 3, 20, 512
UNION ALL
    select 4, 20, 514
UNION ALL
    select 5, 20, 570
UNION ALL
    select 6, 20, 592
UNION ALL
    select 7, 20, 592
UNION ALL
    select 8, 20, 598
UNION ALL
    select 9, 20, 539
UNION ALL
    select 10, 20, 512
UNION ALL
    select 11, 20, 565
UNION ALL
    select 12, 20, 566
UNION ALL
    select 13, 20, 526
UNION ALL
    select 14, 20, 543
UNION ALL
    select 15, 20, 544
UNION ALL
    select 16, 20, 585
UNION ALL
    select 17, 20, 578
UNION ALL
    select 18, 20, 599
UNION ALL
    select 19, 20, 598
UNION ALL
    select 20, 20, 520
UNION ALL
    select 21, 20, 538
UNION ALL
    select 22, 20, 576
UNION ALL
    select 23, 20, 587
UNION ALL
    select 24, 20, 569
UNION ALL
    select 25, 20, 576
UNION ALL
    select 26, 20, 521
UNION ALL
    select 27, 20, 585
UNION ALL
    select 28, 20, 547
UNION ALL
    select 29, 20, 523
UNION ALL
    select 30, 20, 515
UNION ALL
    select 31, 20, 523
UNION ALL
    select 32, 20, 520
UNION ALL
    select 33, 20, 576
UNION ALL
    select 34, 20, 551
UNION ALL
    select 35, 20, 544
UNION ALL
    select 36, 20, 598
UNION ALL
    select 37, 20, 591
UNION ALL
    select 38, 20, 536
UNION ALL
    select 39, 20, 515
UNION ALL
    select 40, 20, 545
UNION ALL
    select 41, 20, 554
UNION ALL
    select 42, 20, 583
UNION ALL
    select 43, 20, 510
UNION ALL
    select 44, 20, 583
UNION ALL
    select 45, 20, 540
UNION ALL
    select 46, 20, 586
UNION ALL
    select 47, 20, 509
UNION ALL
    select 48, 20, 560
UNION ALL
    select 49, 20, 513
UNION ALL
    select 50, 20, 599
UNION ALL
    select 51, 20, 534
UNION ALL
    select 52, 20, 563
UNION ALL
    select 53, 20, 529
UNION ALL
    select 54, 20, 581
UNION ALL
    select 1, 21, 600
UNION ALL
    select 2, 21, 539
UNION ALL
    select 3, 21, 507
UNION ALL
    select 4, 21, 510
UNION ALL
    select 5, 21, 589
UNION ALL
    select 6, 21, 528
UNION ALL
    select 7, 21, 547
UNION ALL
    select 8, 21, 571
UNION ALL
    select 9, 21, 519
UNION ALL
    select 10, 21, 568
UNION ALL
    select 11, 21, 530
UNION ALL
    select 12, 21, 534
UNION ALL
    select 13, 21, 576
UNION ALL
    select 14, 21, 527
UNION ALL
    select 15, 21, 504
UNION ALL
    select 16, 21, 511
UNION ALL
    select 17, 21, 582
UNION ALL
    select 18, 21, 548
UNION ALL
    select 19, 21, 547
UNION ALL
    select 20, 21, 567
UNION ALL
    select 21, 21, 568
UNION ALL
    select 22, 21, 538
UNION ALL
    select 23, 21, 505
UNION ALL
    select 24, 21, 597
UNION ALL
    select 25, 21, 571
UNION ALL
    select 26, 21, 557
UNION ALL
    select 27, 21, 522
UNION ALL
    select 28, 21, 524
UNION ALL
    select 29, 21, 574
UNION ALL
    select 30, 21, 540
UNION ALL
    select 31, 21, 594
UNION ALL
    select 32, 21, 517
UNION ALL
    select 33, 21, 571
UNION ALL
    select 34, 21, 534
UNION ALL
    select 35, 21, 528
UNION ALL
    select 36, 21, 509
UNION ALL
    select 37, 21, 577
UNION ALL
    select 38, 21, 540
UNION ALL
    select 39, 21, 593
UNION ALL
    select 40, 21, 535
UNION ALL
    select 41, 21, 536
UNION ALL
    select 42, 21, 549
UNION ALL
    select 43, 21, 555
UNION ALL
    select 44, 21, 575
UNION ALL
    select 45, 21, 581
UNION ALL
    select 46, 21, 526
UNION ALL
    select 47, 21, 561
UNION ALL
    select 48, 21, 509
UNION ALL
    select 49, 21, 503
UNION ALL
    select 50, 21, 560
UNION ALL
    select 51, 21, 567
UNION ALL
    select 52, 21, 511
UNION ALL
    select 53, 21, 573
UNION ALL
    select 54, 21, 587
UNION ALL
    select 1, 22, 563
UNION ALL
    select 2, 22, 534
UNION ALL
    select 3, 22, 589
UNION ALL
    select 4, 22, 596
UNION ALL
    select 5, 22, 563
UNION ALL
    select 6, 22, 569
UNION ALL
    select 7, 22, 530
UNION ALL
    select 8, 22, 544
UNION ALL
    select 9, 22, 547
UNION ALL
    select 10, 22, 521
UNION ALL
    select 11, 22, 533
UNION ALL
    select 12, 22, 567
UNION ALL
    select 13, 22, 506
UNION ALL
    select 14, 22, 536
UNION ALL
    select 15, 22, 556
UNION ALL
    select 16, 22, 582
UNION ALL
    select 17, 22, 530
UNION ALL
    select 18, 22, 552
UNION ALL
    select 19, 22, 513
UNION ALL
    select 20, 22, 519
UNION ALL
    select 21, 22, 590
UNION ALL
    select 22, 22, 576
UNION ALL
    select 23, 22, 584
UNION ALL
    select 24, 22, 585
UNION ALL
    select 25, 22, 518
UNION ALL
    select 26, 22, 582
UNION ALL
    select 27, 22, 591
UNION ALL
    select 28, 22, 504
UNION ALL
    select 29, 22, 538
UNION ALL
    select 30, 22, 574
UNION ALL
    select 31, 22, 599
UNION ALL
    select 32, 22, 543
UNION ALL
    select 33, 22, 532
UNION ALL
    select 34, 22, 545
UNION ALL
    select 35, 22, 544
UNION ALL
    select 36, 22, 545
UNION ALL
    select 37, 22, 579
UNION ALL
    select 38, 22, 545
UNION ALL
    select 39, 22, 526
UNION ALL
    select 40, 22, 588
UNION ALL
    select 41, 22, 596
UNION ALL
    select 42, 22, 558
UNION ALL
    select 43, 22, 562
UNION ALL
    select 44, 22, 546
UNION ALL
    select 45, 22, 593
UNION ALL
    select 46, 22, 523
UNION ALL
    select 47, 22, 504
UNION ALL
    select 48, 22, 593
UNION ALL
    select 49, 22, 564
UNION ALL
    select 50, 22, 579
UNION ALL
    select 51, 22, 518
UNION ALL
    select 52, 22, 575
UNION ALL
    select 53, 22, 581
UNION ALL
    select 54, 22, 513
UNION ALL
    select 1, 23, 511
UNION ALL
    select 2, 23, 540
UNION ALL
    select 3, 23, 554
UNION ALL
    select 4, 23, 526
UNION ALL
    select 5, 23, 598
UNION ALL
    select 6, 23, 590
UNION ALL
    select 7, 23, 554
UNION ALL
    select 8, 23, 535
UNION ALL
    select 9, 23, 585
UNION ALL
    select 10, 23, 585
UNION ALL
    select 11, 23, 509
UNION ALL
    select 12, 23, 510
UNION ALL
    select 13, 23, 547
UNION ALL
    select 14, 23, 592
UNION ALL
    select 15, 23, 567
UNION ALL
    select 16, 23, 571
UNION ALL
    select 17, 23, 501
UNION ALL
    select 18, 23, 564
UNION ALL
    select 19, 23, 506
UNION ALL
    select 20, 23, 563
UNION ALL
    select 21, 23, 598
UNION ALL
    select 22, 23, 583
UNION ALL
    select 23, 23, 525
UNION ALL
    select 24, 23, 587
UNION ALL
    select 25, 23, 559
UNION ALL
    select 26, 23, 540
UNION ALL
    select 27, 23, 569
UNION ALL
    select 28, 23, 554
UNION ALL
    select 29, 23, 552
UNION ALL
    select 30, 23, 593
UNION ALL
    select 31, 23, 534
UNION ALL
    select 32, 23, 597
UNION ALL
    select 33, 23, 572
UNION ALL
    select 34, 23, 598
UNION ALL
    select 35, 23, 539
UNION ALL
    select 36, 23, 535
UNION ALL
    select 37, 23, 510
UNION ALL
    select 38, 23, 515
UNION ALL
    select 39, 23, 554
UNION ALL
    select 40, 23, 549
UNION ALL
    select 41, 23, 519
UNION ALL
    select 42, 23, 532
UNION ALL
    select 43, 23, 553
UNION ALL
    select 44, 23, 566
UNION ALL
    select 45, 23, 554
UNION ALL
    select 46, 23, 564
UNION ALL
    select 47, 23, 596
UNION ALL
    select 48, 23, 564
UNION ALL
    select 49, 23, 555
UNION ALL
    select 50, 23, 588
UNION ALL
    select 51, 23, 555
UNION ALL
    select 52, 23, 585
UNION ALL
    select 53, 23, 578
UNION ALL
    select 54, 23, 585
UNION ALL
    select 1, 24, 506
UNION ALL
    select 2, 24, 531
UNION ALL
    select 3, 24, 582
UNION ALL
    select 4, 24, 567
UNION ALL
    select 5, 24, 595
UNION ALL
    select 6, 24, 524
UNION ALL
    select 7, 24, 571
UNION ALL
    select 8, 24, 561
UNION ALL
    select 9, 24, 573
UNION ALL
    select 10, 24, 588
UNION ALL
    select 11, 24, 552
UNION ALL
    select 12, 24, 511
UNION ALL
    select 13, 24, 567
UNION ALL
    select 14, 24, 515
UNION ALL
    select 15, 24, 513
UNION ALL
    select 16, 24, 505
UNION ALL
    select 17, 24, 539
UNION ALL
    select 18, 24, 522
UNION ALL
    select 19, 24, 525
UNION ALL
    select 20, 24, 558
UNION ALL
    select 21, 24, 505
UNION ALL
    select 22, 24, 559
UNION ALL
    select 23, 24, 568
UNION ALL
    select 24, 24, 546
UNION ALL
    select 25, 24, 571
UNION ALL
    select 26, 24, 505
UNION ALL
    select 27, 24, 521
UNION ALL
    select 28, 24, 511
UNION ALL
    select 29, 24, 573
UNION ALL
    select 30, 24, 573
UNION ALL
    select 31, 24, 558
UNION ALL
    select 32, 24, 544
UNION ALL
    select 33, 24, 559
UNION ALL
    select 34, 24, 562
UNION ALL
    select 35, 24, 527
UNION ALL
    select 36, 24, 515
UNION ALL
    select 37, 24, 514
UNION ALL
    select 38, 24, 578
UNION ALL
    select 39, 24, 563
UNION ALL
    select 40, 24, 542
UNION ALL
    select 41, 24, 517
UNION ALL
    select 42, 24, 564
UNION ALL
    select 43, 24, 542
UNION ALL
    select 44, 24, 600
UNION ALL
    select 45, 24, 559
UNION ALL
    select 46, 24, 514
UNION ALL
    select 47, 24, 530
UNION ALL
    select 48, 24, 534
UNION ALL
    select 49, 24, 531
UNION ALL
    select 50, 24, 530
UNION ALL
    select 51, 24, 597
UNION ALL
    select 52, 24, 505
UNION ALL
    select 53, 24, 591
UNION ALL
    select 54, 24, 503
UNION ALL
    select 1, 25, 561
UNION ALL
    select 2, 25, 568
UNION ALL
    select 3, 25, 533
UNION ALL
    select 4, 25, 529
UNION ALL
    select 5, 25, 585
UNION ALL
    select 6, 25, 541
UNION ALL
    select 7, 25, 551
UNION ALL
    select 8, 25, 581
UNION ALL
    select 9, 25, 571
UNION ALL
    select 10, 25, 531
UNION ALL
    select 11, 25, 504
UNION ALL
    select 12, 25, 589
UNION ALL
    select 13, 25, 532
UNION ALL
    select 14, 25, 570
UNION ALL
    select 15, 25, 521
UNION ALL
    select 16, 25, 523
UNION ALL
    select 17, 25, 557
UNION ALL
    select 18, 25, 558
UNION ALL
    select 19, 25, 547
UNION ALL
    select 20, 25, 524
UNION ALL
    select 21, 25, 546
UNION ALL
    select 22, 25, 537
UNION ALL
    select 23, 25, 519
UNION ALL
    select 24, 25, 560
UNION ALL
    select 25, 25, 538
UNION ALL
    select 26, 25, 530
UNION ALL
    select 27, 25, 552
UNION ALL
    select 28, 25, 540
UNION ALL
    select 29, 25, 540
UNION ALL
    select 30, 25, 521
UNION ALL
    select 31, 25, 531
UNION ALL
    select 32, 25, 519
UNION ALL
    select 33, 25, 508
UNION ALL
    select 34, 25, 593
UNION ALL
    select 35, 25, 504
UNION ALL
    select 36, 25, 535
UNION ALL
    select 37, 25, 575
UNION ALL
    select 38, 25, 515
UNION ALL
    select 39, 25, 536
UNION ALL
    select 40, 25, 544
UNION ALL
    select 41, 25, 568
UNION ALL
    select 42, 25, 600
UNION ALL
    select 43, 25, 538
UNION ALL
    select 44, 25, 536
UNION ALL
    select 45, 25, 523
UNION ALL
    select 46, 25, 556
UNION ALL
    select 47, 25, 594
UNION ALL
    select 48, 25, 569
UNION ALL
    select 49, 25, 540
UNION ALL
    select 50, 25, 513
UNION ALL
    select 51, 25, 547
UNION ALL
    select 52, 25, 514
UNION ALL
    select 53, 25, 523
UNION ALL
    select 54, 25, 575;
GO
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


