# MySql General Notes

+ [Mariadb notes](https://github.com/simon387/notes/blob/master/sql/readme.md)
+ [Mariadb notes](mariadb.md)

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

