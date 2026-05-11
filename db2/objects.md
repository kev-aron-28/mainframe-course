# DB2 Catalog
The DB2 catalog is a collection of tables that store metadata about the database. Includes info about:
- Database objects
- Tables
- columns
- indexes

# DB2 directory
Is a set of internal system tables that stores important information required by the DB2 database to operate. Unlike the catalog,
the directory stores operational data that helps the system work efficiently.

# Buffer pool
Is a portion of memory where frequently accessed data is temporarly stored. This speeds up data retrieval and reduces the load on the storage disk.

# DB2 Log
DB2 uses log to keep track of all database changes to ensure data integrity and recovery

# Work file database
Is a special database that stores temporary data during query processing. When a query is to large to be processed in memory or requires complex sorting or joins