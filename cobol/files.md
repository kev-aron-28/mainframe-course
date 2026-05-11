# FIles in cobol
ENVIRONMENT DIVISION.            
INPUT-OUTPUT SECTION.            
FILE-CONTROL.                    
  SELECT MYFILE ASSIGN TO FILE1  
  ORGANIZATION IS SEQUENTIAL     
  ACCESS MODE IS SEQUENTIAL      
  FILE STATUS IS WS-FILE-STATUS. 
DATA DIVISION.                   
FILE SECTION.                    
FD MYFILE                        
  RECORD CONTAINS 13 CHARACTERS  
  DATA RECORD IS FILE-RECORD     
  RECORDING MODE IS F.           
01 FILE-RECORD.                  
  05 FILE-RECORD-NAME PIC X(10). 
  05 FILE-RECORD-AGE PIC 9(3).   

To work with files in cobol you have two important sections
one in environment division, input-output section file control
where you have to describe the files or the file you are going to work with 

``` cobol
[ENVIRONMENT DIVISION.]
[INPUT-OUTPUT SECTION.]
[FILE-CONTROL.]
    [SELECT logical-file-name ASSIGN TO DSNname]
    [ORGANIZATION IS file-organization]
    [ACCESS MODE IS access-mode]
	[RECORD KEY IS record-key]
	[ALTERNATE RECORD KEY IS alt-record-key WITH DUPLICATES]
	[RELATIVE KEY IS relative-key]
	[RECORD DELIMITER IS record-delimiter]
    [FILE STATUS IS file-status].
```

and the second part is where you have to describe the records inside that file inside data division. file section.

``` cobol
[DATA DIVISION.]
[FILE SECTION.]
[FD logical-file-name]
    [RECORD CONTAINS ...]
    [BLOCK CONTAINS ...]
    [LABEL RECORD IS OMITTED|STANDARD|variable1]
	[DATA RECORD IS file-record]
	[RECORDING MODE IS F|V|U|S].

01 file-record    PIC X(max-rec-length).
```

## Different records lengths

### Fixed length

```
RECORD CONTAINS record-length CHARACTERS
BLOCK CONTAINS block-length CHARACTERS
```

### Variable length

```
RECORD CONTAINS min-rec-length TO max-rec-length CHARACTERS
BLOCK CONTAINS min-blk-length TO max-blk-length CHARACTERS

RECORD CONTAINS 80 TO 100 CHARACTERS
BLOCK CONTAINS 800 TO 1000 CHARACTERS
```

### Dynamic length records
```
RECORD IS VARYING IN SIZE FROM min-length TO max-length CHARACTERS 
		DEPENDING ON variable1
BLOCK CONTAINS min-blk-length TO max-blk-length CHARACTERS

RECORD CONTAINS 80 TO 100 CHARACTERS
         DEPENDING ON ws-length
BLOCK CONTAINS 800 TO 1000 CHARACTERS
```

# File organization
File organization is the method used to store and arrange data records within a file. It specifies how information is physically stored in the memory and impacts how efficiently data can be accessed and managed.

COBOL primarily supports three types of file organizations:
- Sequential File Organization
- Indexed File Organization
- Relative File Organization

## Sequential file organization


Sequential file organization applies to the sequential files (PS - Physical sequential file) that use the QSAM access method. A sequential file consists of records that are stored and accessed sequentially. 
The main attributes of the sequential file organization are:
- Records are stored in the same order as they are written.
- Can be read in sequential order, from file beginning to end. If we need to read five times to get the desired record if we want the 5th record
- Record physical deletion or length change is not possible once it is written to the file
- Updating a record (REWRITE) is possible. A record can be updated with new data or replaced with a new record if both have the same length.
- A new record is always written at the end of the file.
- Records sorting is not possible.
- The file may contain duplicate records because the key is not applicable.
- Accessing is slow because reading is allowed only in sequential order.

```
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT logical-file-name ASSIGN TO DSName 
    ORGANIZATION IS SEQUENTIAL
```

## Indexed file organization
Indexed file organization applies to the KSDS file that uses the Virtual storage access method (VSAM). 
A KSDS file consists of records that are stored and accessed using the key value. The key is unique and combination of field or fields (defined by the developer and part of the record). 
VSAM file has two components:
- DATA
- INDEX

The main attributes of the indexed file organization are:
- Records are written in key sequential order.
- Records can be read sequentially (one by one without key value), randomly (using key-value), or dynamically (a combination of the above two).
- Physical deletion of the record is allowed, and the memory released will be reused.
- Updating a record (REWRITE) is possible.
- New records will be written where the key value fits in sorting order.
- All the records in the file are sorted order based on key values.
- Duplicate records cannot be written into the file because of the key.
- Accessing records is faster because we can read them dynamically or randomly.

```
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT logical-file-name ASSIGN TO DSName 
    ORGANIZATION IS INDEXED
	RECORD KEY IS primary-key
	ALTERNATE KEY IS alt-key
```

## Relative file organization

Relative file organization applies to the RRDS file that uses the Virtual storage access method (VSAM). An RRDS file consists of records that are stored and accessed using the RRN value. 
Relative Record Number (RRN) is unique and used as an implicit key (generated by the system and not part of the record).The main attributes of the indexed file organization are -

- Records are written in Record Relative Number (RRN) order
- Records can be read sequentially (one by one without RRN value), randomly (using RRN-value), or dynamically (combination of the above two).
- Physical deletion of the record is allowed, but the memory is not reused.
- Updating a record (REWRITE) is possible.
- New records will be written sequentially and set RRN value for it.
- All the records in the file are sorted order based on RRN.
- Duplicate records can't be written into the file.
- Records accessing is faster than indexed files as the records can be read using RRN.

```
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT logical-file-name ASSIGN TO DSName 
    ORGANIZATION IS RELATIVE
	RELATIVE KEY IS rrn
```

## File accessing modes
The file access modes specify how data is read from or written to files. 
The file access mode that we used, specifies how we interact the records within the file. Always choose the mode based on the application's requirements for efficiency and performance.

COBOL supports three access modes -

- Sequential access mode
- Random access mode
- Dynamic access mode

## Sequential access mode
Records are accessed one after another in the order they appear in the file. Sequential access mode applicable to -

#### Sequential files 
``` cobol
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT logical-file-name ASSIGN TO DSName 
    ORGANIZATION IS SEQUENTIAL
	ACCESS MODE IS SEQUENTIAL
```

#### Indexed files - No need to pass the rec-key or alt-key values. Reads from the first record in the file
```
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT logical-file-name ASSIGN TO DSName 
    ORGANIZATION IS INDEXED
	ACCESS MODE IS SEQUENTIAL
    RECORD KEY IS rec-key
    ALTERNATE RECORD KEY IS alt-key
```

#### Relative files - No need to pass the ws-rrn value and reads from the first record in the file.
``` cobol
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT logical-file-name ASSIGN TO DSName 
    ORGANIZATION IS RELATIVE
	ACCESS MODE IS SEQUENTIAL
	RELATIVE KEY IS ws-rrn
```

## Random access mode
Records are accessed based on a specific key value, allowing for the direct retrieval of any record without knowing its position or reading the preceding ones. 
Random access mode applicable to:

#### Indexed files - Need to pass the rec-key or alt-key values. Reads from the record that matches with the rec-key or alt-key.
``` cobol
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT logical-file-name ASSIGN TO DSName 
    ORGANIZATION IS INDEXED
	ACCESS MODE IS RANDOM
    RECORD KEY IS rec-key
    ALTERNATE RECORD KEY IS alt-key
```

#### Relative files - Need to pass the ws-rrn value. Reads from the record that matches with the ws-rrn

``` cobol
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT logical-file-name ASSIGN TO DSName 
    ORGANIZATION IS RELATIVE
	ACCESS MODE IS RANDOM
	RELATIVE KEY IS ws-rrn
```

## Dynamic access mode
A combination of both SEQUENTIAL and RANDOM access modes. 
The type of access (sequential or random) can be chosen during runtime based on the operations we perform. Dynamic access mode applicable to -

#### Indexed files
``` cobol
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT logical-file-name ASSIGN TO DSName 
    ORGANIZATION IS INDEXED
	ACCESS MODE IS DYNAMIC
    RECORD KEY IS rec-key
    ALTERNATE RECORD KEY IS alt-key
```
#### Relative files
``` cobol
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT logical-file-name ASSIGN TO DSName 
    ORGANIZATION IS RELATIVE
	ACCESS MODE IS DYNAMIC
	RELATIVE KEY IS ws-rrn
```

# File operations

## OPEN statement

- It stablishes a connection between the logical file and its associated physical file
- it opens the file for subsequent processing 
- the program cant be able to process a file without opening

``` cobol
OPEN opening-mode file-name
```

Opening modes:
- INPUT
- OUTPUT
- I-O
- EXTENDd (only for sequential access files only)

## Error handling

INPUT, if unsuccessful 35
I-O, 35
OUTPUT, this causes the file to be created
EXTEND, 35 if unsuccessful


## READ statement
READ statement is used to retrieve a record from the file. At a time, only one record is retrieved from the file.

```
READ logical-file-name  
    [INTO ws-record-name]
        [AT END statements-set1]
    [NOT AT END statements-set2]
[END-READ].
```

```
READ logical-file-name  
    [INTO ws-record-name]
	[KEY IS key-variable]
        [INVALID KEY statements-set3]
    [NOT INVALID KEY statements-set4]
[END-READ].
```

Error handling:
- INVALID KEY - This phrase specifies the action to be taken if the record is not found (or if the key is invalid). The statements following INVALID KEY are executed in such cases. This is applicable to indexed or relative files.
- NOT INVALID KEY - This phrase specifies the steps to be taken if the read is successful and the key is valid. This is applicable to indexed or relative files.
- AT END - This phrase specifies the action to take if you're at the end of a file or no more records are left. It applies to sequential files only.
- NOT AT END - This phrase specifies the action to perform when the read is successful and it's not the end of the file. It applies to sequential files only.

## READ statement
READ statement is used to retrieve a record from the file. At a time, only one record is retrieved from the file.

``` cobol
READ logical-file-name  
    [INTO ws-record-name]
        [AT END statements-set1]
    [NOT AT END statements-set2]
[END-READ].

READ logical-file-name  
    [INTO ws-record-name]
	[KEY IS key-variable]
        [INVALID KEY statements-set3]
    [NOT INVALID KEY statements-set4]
[END-READ].
```

## WRITE statement
- The file should open in OUTPUT (for sequential, indexed, and relative files when the files are empty), I-O(for indexed and relative files when the files are not empty), or EXTEND (for sequential files when the file is not empty) mode to write a record.
- It is used for all types of (sequential, indexed, and relative) files.


``` cobol
WRITE record-name 
     [FROM ws-record-name]
	 [BEFORE ADVANCING ws-variable|num LINES]
	 [AFTER  ADVANCING ws-variable|num LINES]
[END-WRITE].

WRITE record-name 
     [FROM ws-record-name]
         [INVALID KEY statements-set1]
     [NOT INVALID KEY statements-set2]
[END-WRITE].
```

## DELETE statement
DELETE statement removes a record from an indexed or relative file.
After it is successfully executed, the record is removed from the file and can no longer be available

- DELETE does not apply to sequential files, as record deletion is impossible.
- The file must open in I-O mode to execute the DELETE statement.
- After the successful deletion, the space occupied by the record is marked as available but not immediately used.
- The record that will be deleted should read first in SEQUENTIAL accessing mode.
- We should provide RECORD KEY (for indexed files) or RELATIVE KEY (for relative files) for the DELETE statement for DYNAMIC access mode.

``` cobol
DELETE logical-file-name 
           [INVALID KEY statements-set1]
       [NOT INVALID KEY statements-set2]
[END-DELETE].
```

## REWRITE statement
REWRITE statement is used to replace the content of a previously read record with new data. At a time, only one record is replaced in the file.
- The file should open in I-O mode to perform the REWRITE statement.
- The REWRITE statement is used for all types of (sequential, indexed and relative) files.


```
REWRITE record-name 
       [FROM ws-record-name]
           [INVALID KEY statements-set1]
       [NOT INVALID KEY statements-set2]
[END-REWRITE].
```


## START statement
START is used to set the file pointer to read the record.
START won't retrieve any record and only sets the pointer before beginning a sequence of READ operations

- The file should open in INPUT or I-O mode to perform the START operation.
- It is used for indexed and relative files.
- It is used when the ACCESS MODE is DYNAMIC.

``` cobol
START logical-file-name
    [KEY IS {EQUAL TO | GREATER THAN | LESS THAN | NOT ...} ws-key-value]
        [INVALID KEY statements-set1]
    [NOT INVALID KEY statements-set2]
[END-START].
```

## NEXT RECORD
READ NEXT statement is used to read the next record from the current reading position of the file. At a time, only one record is retrieved from the file.

The file should open in INPUT or I-O mode to perform the READ NEXT statement.
The READ NEXT statement is used for indexed or relative files.
A READ NEXT statement is used when the ACCESS MODE is DYNAMIC.

```
READ logical-file-name
    [NEXT RECORD]  
    [INTO ws-record-name]
        [AT END statements-set1]
    [NOT AT END statements-set2]
[END-READ].
```

## CLOSE statement
CLOSE statement is used to terminate the file processing and release the resources used by the file.
Once the file's CLOSE statement is executed successfully, the record area associated with it is no longer available.
This statement specifies that the program has finished using the file.

``` cobol
CLOSE file-name [WITH LOCK].
```
WITH LOCK - Specifies that the program exclusively locks the file and can't be used until the current run unit execution is completed.