# Design Document

## Models

### Tables

- `Car` - Represents a car with details linking to `Brand`, `CarType`
- `CarType` - Represents a collection of car types
- `Brand` - Represents the brand of a car
- `Supplier` - Entity that supplies parts
- `Manufacturer` - Entity that manufactures parts
- `Location` - Table with location data for every entity in the database
- `Transport` - Entity responsible for moving a transaction from one `Location` to another
- `TransportType` - Type of the `Transport` enity
- `Part` - Entity that represents parts of a car in the supply chain
- `Batch` - Represents a collection that links a `Part` with a `Manufacturer` and the associated cost
- `Stock` - Table representing the amount of stock available for each `Batch` in each of the `Location`s
- `User` - User that Creates / Modifies `Transaction`s
- `AssemblyUnit` - An entity where a `Car` gets manufactured
- `CarBlueprint` - Entity representing the composition of `Car` based on number of `Part`
- `CarProduction` - When a car is produced, associated details is added to this table
- `Transaction` - Represents the 'header' section of a transaction
- `TransactionRow` - Represents each row associated with a `Transaction`
- `TransactionType` - Represents the type of `Transaction` (Sales/Purchase/etc.)
- `StockAudit` - When stock is updated, entries are added to this table for auditing

## Final ERD

![](../diagrams/erd.png)
