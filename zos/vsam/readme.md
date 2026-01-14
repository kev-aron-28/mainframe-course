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
VSAM is IBM’s smart file system for mainframes that lets programs find data quickly without reading the whole file.

- Virtual Storage Access Method
- VSAM is an IBM-invented access method that allows us to access and organize the records in the disk dataset. 
- VSAM works with the data that stores only on Direct Access Storage Devices (DASDs)
- VSAM record storage format is unique and not understandable by other access methods.
- IDCAMS utility used to define the VSAM datasets.
- It was developed in 1970 
- Virtual specifies that it was developed when the initial IBM virtual storage OS/VS1 and OS/VS2 was introduced

# Acces methdos and File organization
- Physical Sequential (PS
- Partitioned organization (PO)
- Indexed Sequential (IS)
- Direct Access (DA)
- Virtual Storage Access method (VSAM)

Each dataset type except VSAM has its own records organizing method depending on its purpose. 
However, VSAM provides a functional equivalent for most of the existing dataset types as follows

- ESDS = PS
- KSDS = IS
- RRDS = DA

# What is VSAM? 
- Refers both the type of the dataset and the access methods that are used to manage various dataset types
- An access method is a re-entrant code loaded and contained in DFSMSdfp (Data Facility Storage Managment Subsystem dfp)
- The access method makes an I/O operation easier for application
- **VSAM** works only with DASDs
- They cant be edited or displayed by ISPF, it requires DITTO


## VSAM types
- Entry sequenced datasets (ESDS)
- Key-sequenced datasets (KSDS)
- Relative record datasets (RRDS)
- LInear datasets (LDS)

And the primary difference is the way records are stored and accessed

## Access and retrival options 
- Sequential
- Direct
- Dynamic or Skip sequential

and also provides the below access options
- Two direct access modes: Addressed or keyed
- Two direct entities: Logical records or Control intervals
- Two access directions: Forward or backward
- Retrival options: Generic key or using key greater than or equal

## How they differ from other datasets?
- VSAM datasets are device indepentdent 
- VSAM datsets can be both sequentially and directly accessed

## Advantages
- High speed data retrieval thanks to organized index
- Supports all types of data retrieval (squential, random, dynamic, linear)
- Supports fiexd and variable record length records
- In batch and online systems
- Inserting is easy compare to other methods
- Independent of storage device types
- They can be shared across systems and regions

## Disadvantages
- Can be accessed by ISPF
- MOre DASD space
- Only works with data stored on a disk and cant handle data in tapes
- Only provides security at dataset level if nay changes are required at security level the user should handle that manually
- Have no or little support for security and integrity issues
- Have no or little support ofr recovery and concurrency issues
- Accessing speed is slow
- Have no tru data dictionary concept

## Types of VSAM (easy view)
### KSDS – Keyed Sequential Data Set (MOST COMMON)

Find a record using a key

## ESDS - Entry sequential data set
Records in order of arrival

- NO key,
- Recrods have a relative address
- Can only append new records


# Basic concepts and terminology


## Cluster
A VSAM cluster is a logical definition for a VSAM dataset and has the below one or two componets
- the data components contains the data records
- the index component of the key-sequenced cluster consists of the index records

## Logical record
is a logical representation of a physical record used to store the data in VSAM or retrieve it from VSAM