# oracle database

## export schema user tables etc example

```bash
exp user/password@url.endpoint.com:port/service FULL=Y FILE=C:\dump_
```

## drop all tables ready-to-use list

```sql
select 'drop table '||table_name||' cascade constraints;' from user_tables;
```

