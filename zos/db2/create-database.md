# Create database

What is a Database?
A DB2 database on the mainframe is essentially a collection of tablespaces, tables, and indexes that are logically grouped together. 
It enables data storage and retrieval while allowing centralized control over access, organization, and resource allocation. 
In DB2, each database is a self-contained unit, which makes it easier to manage large sets of data within a DB2 subsystem.

``` java
CREATE DATABASE database_name
STOGROUP storage_group_name
BUFFERPOOL bufferpool_name
[CCSID UNICODE | EBCDIC];
```

- Alter database

``` db2
ALTER DATABASE database_name
STOGROUP new_storage_group_name
BUFFERPOOL new_bufferpool_name
CCSID new_encoding;
```

- deleting database
``` db2
DROP DATABASE database_name;
```