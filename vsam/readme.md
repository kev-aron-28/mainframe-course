# Acces methods 
Are software units that control the data transfer between main memory (primary storage) and secondary storage devices. Secondary or auxiliary storage devices are independent of computer memory
Access method creates some techniques to store and retrieve the data from the dataset. An access method simplifies the application logic when the application requests I/O operations to z/OS. An access method is an optional function. 

** An access method defines how data is stored, organized, and read on disk **

# Access method types

## BSAM
 is the short form of the Basic Sequential Access Method 
 BSAM allows the programs to read and write physical blocks of data. 
 BSAM arranges records sequentially in the order of how they are entered.

## QSAM
- Queued Sequential Access Method and is the  and the most used access method. 
- QSAM is the extended method of the BSAM
- QSAM reads the records into storage before they are requested to improve the performance. This technique is called as queued access.
- QSAM organizes the records sequentially in the order of how they are inserted to form sequential datasets. The system is responsible for managing the records, among other records.

IN cobol
``` cobol
FILE-CONTROL.
    SELECT file-name ASSIGN TO disk-name.
    ORGANIZATION IS SEQUENTIAL
    ACCESS MODE IS SEQUENTIAL.
```
DSORG=PS defines in DCB specifies the delcared dataset uses QSAM

## BDAM
- is the short form of the Basic Direct Access Method and is becoming obsolete
- BDAM organizes the records in any sequence based on the requirement and retrieves records by actual or relative address.

DSORG=DA

## BPAM
- Basic Partitioned Access Method
- BPAM organizes the records as members of a partitioned dataset (PDS) or a partitioned dataset extended (PDSE) on DASD.
- BPAM is an access method for libraries with partitioned datasets (PDSes) structures. 
- DSORG=PO

## VSAM
- Virtual Storage Access Method
- VSAM is an IBM-invented access method that allows us to access and organize the records in the disk dataset. 
- VSAM works with the data that stores only on Direct Access Storage Devices (DASDs)
- VSAM record storage format is unique and not understandable by other access methods.
- IDCAMS utility used to define the VSAM datasets. We will discuss VSAM more detail in further chapters. 
- It was developed in 1970 
- Virtual specifies that it was developed when the initial IBM virtual storage OS/VS1 and OS/VS2 was introduced



# Acces methdos and File organization
- Physical Sequential (PS
- Partitioned organization (PO)
- Indexed Sequential (IS)
- Direct Access (DA
- Virtual Storage Access method (VSAM)
