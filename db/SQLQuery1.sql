--use KSCManagementEvent
--use master
create server role [ReadOnly_Admin]
go

grant view any database to [ReadOnly_Admin]
go

grant view server state to [ReadOnly_Admin]
go

grant view any definition to [ReadOnly_Admin]
go

EXECUTE sp_addlogin @loginame = 'John', @passwd = 'ASDFG'
EXECUTE sp_addlogin @loginame = 'Paul', @passwd = 'ASDFG'
EXECUTE sp_adduser 'John', 'John'
EXECUTE sp_adduser 'Paul', 'Paul'
go

/* Add Role */
EXECUTE sp_addrole @rolename = 'DataEntry'
EXECUTE sp_addrole @rolename = 'Management'
EXECUTE sp_addrole @rolename = 'Supervisor'
go

EXECUTE sp_addrolemember @rolename = 'DataEntry', @membername = 'John'
EXECUTE sp_addrolemember @rolename = 'Management', @membername = 'Paul'
go

/* Grant Privileges */
GRANT SELECT, INSERT, DELETE, UPDATE
ON Customer
TO John
go

GRANT SELECT
ON [Event]
TO John
go


grant all privileges on Customer to Paul
go

GRANT SELECT
ON Cust_Event
TO PUBLIC
go

insert into [Event](Title, Logo, Description, Speaker) values('Haloween', 'HeadFirst', 'Oh yeah, Oh right', 'busy')
delete from Event
select * from Event
go

/* Grant to Role */
GRANT SELECT, INSERT, UPDATE
ON [Event]
TO DataEntry
GO
GRANT SELECT
ON Customer
TO Management
GO

/* Grant column  */
GRANT UPDATE (Title, Logo)
ON Event
TO DataEntry
go

exec sp_helplogins
exec sp_helpuser
go

/* Revoke privileges */
revoke delete
on [Event]
from John
go

/* Create Test User */
CREATE ROLE TestRole;
GO 
CREATE USER TestUser WITHOUT LOGIN;
GO 
EXEC sp_addrolemember @rolename = 'TestRole', @membername = 'TestUser';
GO

/* Create Tables and Permissions */
CREATE SCHEMA Test;
GO 
CREATE TABLE Test.TestTable (TableID int);
GO 
GRANT SELECT ON OBJECT::Test.TestTable TO TestRole;
GO 
CREATE TABLE Test.TestTable2 (TableID int);
GO

/* Test Harness Queries */
-- Test Harness to verify how permissions work for Test.TestTable.
EXECUTE AS USER = 'TestUser';
GO 
SELECT * FROM Test.TestTable;
GO 
REVERT;
GO 
-- Test Harness to verify how permissions work for Test.TestTable2.
EXECUTE AS USER = 'TestUser';
GO 
-- This should fail initially, as there is no permission for this table
SELECT * FROM Test.TestTable2;
GO 
REVERT;
GO 

/* Seeing the Permissions */
-- Query sys.database_permissions to see applicable permissions
SELECT dp.class_desc, s.name AS 'Schema', o.name AS 'Object', dp.permission_name, 
       dp.state_desc, prin.[name] AS 'User'
FROM sys.database_permissions dp
  JOIN sys.database_principals prin
    ON dp.grantee_principal_id = prin.principal_id
  JOIN sys.objects o
    ON dp.major_id = o.object_id
  JOIN sys.schemas s
    ON o.schema_id = s.schema_id
WHERE LEFT(o.name, 9) = 'TestTable'
  AND dp.class_desc = 'OBJECT_OR_COLUMN'
UNION ALL
SELECT dp.class_desc, s.name AS 'Schema', '-----' AS 'Object', dp.permission_name, 
       dp.state_desc, prin.[name] AS 'User'
FROM sys.database_permissions dp
  JOIN sys.database_principals prin
    ON dp.grantee_principal_id = prin.principal_id
  JOIN sys.schemas s
    ON dp.major_id = s.schema_id
WHERE dp.class_desc = 'SCHEMA';

/* REVOKE */
REVOKE SELECT ON OBJECT::Test.TestTable FROM TestRole;

-- get current user
REVERT;
GO 
SELECT CURRENT_USER;
GO