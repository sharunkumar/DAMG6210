CREATE OR ALTER PROCEDURE GetTotalCostForCar
    @carID INT
AS
BEGIN
    DECLARE @TotalCost FLOAT;

    select @TotalCost = sum(tot)
    from (select (select min(cost)
            from batch b
            where b.part_id = cb.part_id) tot
        from CarBlueprint cb
        where car_id = @carID) tab

    -- Return the total cost
    SELECT
        @TotalCost AS TotalCost;
END;
GO
CREATE OR ALTER PROCEDURE GetPartsWithLowStock
    @thresholdQuantity INT
AS
BEGIN
    SELECT
        p.[PartID],
        p.[PartName],
        p.[description],
        b.[BrandName],
        s.[quantity]
    FROM
        [dbo].[Part] p
        INNER JOIN
        [dbo].[Brand] b ON p.[brand_id] = b.[BrandID]
        LEFT JOIN
        [dbo].[Batch] bat ON p.PartID = bat.part_id
        LEFT JOIN
        dbo.Stock s ON bat.BatchID= s.batch_id
    WHERE
        s.[quantity] IS NULL OR s.[quantity] < @thresholdQuantity;
END
GO
CREATE OR ALTER PROCEDURE GetCarsInProduction
AS
BEGIN
    SELECT
        [CarID],
        [CarName],
        [production_year_start],
        [production_year_end],
        [brand_id],
        [type_id]
    FROM
        [dbo].[Car]
    WHERE
        GETDATE() BETWEEN [production_year_start] AND [production_year_end];
END
GO
CREATE OR ALTER PROCEDURE GetTransportsByCostRange
    @minCost FLOAT,
    @maxCost FLOAT
AS
BEGIN
    SELECT
        t.[TransportID],
        t.[TransportName],
        t.[cost_per_km],
        tt.[TransportTypeID],
        tt.[description] AS TransportTypeDescription
    FROM
        [dbo].[Transport] t
        INNER JOIN
        [dbo].[TransportType] tt ON t.[type_id] = tt.[TransportTypeID]
    WHERE
        t.[cost_per_km] BETWEEN @minCost AND @maxCost;
END
GO