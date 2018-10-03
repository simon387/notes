# mssql

## Rebuilding indexes

```sql
ALTER TABLE <table_name> NOCHECK CONSTRAINT ALL;
ALTER INDEX ALL ON <table_name> DISABLE;
ALTER INDEX ALL ON <table_name> REBUILD;
ALTER TABLE <table_name> CHECK CONSTRAINT ALL;
```

---

## How to turn IDENTITY_INSERT on and off using SQL Server

```sql
SET IDENTITY_INSERT sometableWithIdentity ON

INSERT sometableWithIdentity (IdentityColumn, col2, col3, ...)
VALUES (AnIdentityValue, col2value, col3value, ...)

SET IDENTITY_INSERT sometableWithIdentity OFF
```

---

## Cannot drop database "databasename" because it is currently in use.

```sql
use master;
GO

ALTER DATABASE databasename SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

GO
```

---

## Drop constraint

```sql
alter table tablename DROP CONSTRAINT constraint_name
```
