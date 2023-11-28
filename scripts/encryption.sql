use DAMG
go
-- ENCRYPTION FOR USER PASSWORD FIELD
alter table [User] add [Password]  varbinary(400) 
go
create MASTER KEY ENCRYPTION BY PASSWORD = 'YourStrong@Passw0rd';
SELECT name KeyName, symmetric_key_id KeyID, key_length KeyLength, algorithm_desc KeyAlgorithm
FROM sys.symmetric_keys; 
go
CREATE CERTIFICATE EmpPass WITH SUBJECT = 'User Sample Password';   
GO
CREATE SYMMETRIC KEY USER_SM WITH ALGORITHM = AES_256 ENCRYPTION BY CERTIFICATE EmpPass;   
GO
OPEN SYMMETRIC KEY USER_SM DECRYPTION BY CERTIFICATE EmpPass;
UPDATE dbo.[User] set [Password] = EncryptByKey(Key_GUID('USER_SM'),  convert(varbinary,'userpass123'))  
GO
OPEN SYMMETRIC KEY USER_SM DECRYPTION BY CERTIFICATE EmpPass;
SELECT *, CONVERT(varchar, DecryptByKey([Password])) AS 'Decrypted password'
FROM dbo.[User];   
GO
use master
go