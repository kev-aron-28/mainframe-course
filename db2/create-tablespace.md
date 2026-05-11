# TableSpace

What is a Tablespace?
A tablespace is a logical storage container within a database used to store tables, indexes, and data. 
Tablespaces help define how data storage is allocated for database objects, managing disk space and enhancing access performance.


# Types of tablespace
- Simple Tablespace: Stores data in a straightforward manner without advanced features. Supports multiple tables within the same tablespace. Not commonly used in newer DB2 versions, as more advanced tablespaces are available.
- Segmented Tablespace: Divides the tablespace into segments (groups of pages), which each store data for a single table. Designed for tables with frequent insertions and deletions, improving performance by minimizing fragmentation.
- Partitioned Tablespace: Divides the tablespace into multiple partitions based on a defined key range (e.g., date or region). Ideal for large tables that need to be spread across multiple storage volumes, allowing for parallel processing.
- Universal Tablespace (UTS): Combines features of both segmented and partitioned tablespaces. Supports both segmented and partitioned characteristics, allowing multiple tables and partitions. Commonly used in modern DB2 systems.


``` db2
CREATE TABLESPACE table-space-name 
	IN database-name
	USING STOGROUP 	stogroup-name 
	PRIQTY 			integer 
	SECQTY 			integer
	ERASE 			NO/YES 
	FREEPAGE 		0/integer
	PCTFREE 		5/smallint
	MAXPARTITIONS 		integer
	NUMPARTS 		integer     
	PARTITION 		integer using-block/free-block 
	SEGSIZE 		integer
	BUFFERPOOL 		bpname
	CLOSE 			YES/NO
	COMPRESS 		NO/YES
	LOCKMAX 		SYSTEM/integer
	LOCKSIZE 		ANY/TABLESPACE/TABLE/PAGE/ROW
	MAXROWS 		integer
	SEGSIZE 		integer 
```

- Table-space-name - Name of the table space that is going to create.
- Database-name - Name of the database table under which the table space is going to create.
- Stogroup-name - Name of the stored group under where the database existed.
- PRIQTY - PRIQTY is nothing but the primary quantity of space allocation. PRIQTY should be always positive numeric value or -1.
- SECQTY - SECQTY is nothing but the secondary quantity of space allocation. SECQTY should be always positive numeric value or -1.
- ERASE - Specifies that whether the data needs to be erased or not during the deletion of the table space. ERASE have YES & NO as a valid options.
- FREESPACE - Specifies how to leave the page as a free space in table space when it is partitioned or reorganized. FREESPACE value must be in between 0 to 255. The default value is 0, if the FREESPACE not provided during the declaration.
- PCTFREE - Specifies how to leave the page as a free space in table when it is loaded or reorganized. PCTFREE value must be in between 0 to 99. PCTFREE does not applies to table spaces.
- MAXPARTITIONS - Specifies that table space is a partition by growth table space. MAXPARTITIONS must be in the range 0 to 4096. MAXPARTITIONS value in the multiples of Giga bytes.
- NUMPARTS - NUMPARTS used to specify number of partitions. NUMPARTS only specifies for partitioned table spaces.
- PARTITION - Specifies which partition is the using-block or free-block applies. PARTITION value starts from 1 to NUMPARTS specified value.
- BUFFERPOOL - Identifies which buffer pool used for table space. Determines the page size of the table space.
- CLOSE - Specifies the action to be taken when the limit of open data sets reached to its maximum.The valid values are YES and NO.
- COMPRESS - Specifies the compression applies for the rows in table space or not. The Valid values are YES and NO.
- LOCKMAX - Specifies the maximum number of locks can hold simultaneously. If 0 specifies, the locks will not be counted.
- LOCKSIZE - Specifies the size of locks within the table space. DB2 uses any lock size specified.Valid values are ANY/TABLESPACE/TABLE/PAGE/ROW.
- MAXROWS - Specifies the max number of rows that need to placed per page. The range can be from 1 to 255.If nothing is specified, the default value is 255.
- SEGSIZE - Specifies the number of pages assigned to the segment. SEGSIZE has the range from 0 to 64 but multiples of 4. SEGSIZE specifies the segmented table space. SEGSIZE values can be in between 0 to 64 but multiples of 4.

