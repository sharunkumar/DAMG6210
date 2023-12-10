-- Kill all active connections to the database
ALTER DATABASE DAMG SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

-- Drop the database 
DROP DATABASE DAMG;