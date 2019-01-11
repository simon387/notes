# MySql General Notes

+ [GOTO Liferay Notes](../java/liferay.md)
+ [Mariadb Notes](mariadb.md)
+ [MsSql Notes](mssql.md)
+ [Oracle Database Notes](oracle_database.md)

## Turns on queries logging

```
mysql> SHOW VARIABLES LIKE "general_log%";
```

```
+------------------+----------------------------+
| Variable_name    | Value                      |
+------------------+----------------------------+
| general_log      | OFF                        |
| general_log_file | /var/run/mysqld/mysqld.log |
+------------------+----------------------------+
```

```
mysql> SET GLOBAL general_log = 'ON';
```

---

## Window

To install it on Window you have to download the MySQL installer and install it via Admin with PowerShell

Or the setup somtime never ends (I hate window)

```
C:\> .\mysql-installer-community-8.0.13.0.msi
```
