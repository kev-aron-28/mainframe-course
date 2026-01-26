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
A cluster is the full VSAM dataset definition
A VSAM cluster is a logical definition for a VSAM dataset and has the below one or two componets
- the data components contains the data records
- the index component of the key-sequenced cluster consists of the index records

A VSAM cluster is a logical definition for the VSAM dataset of any type (ESDS, KSDS, RRDS, or LDS).

## Logical record
is a logical representation of a physical record used to store the data in VSAM or retrieve it from VSAM
- They can be of fixed length or variable length and VSAM supports both
- The application program uses logical records to access and process the data through I/O operations from the dataset.

## Physical record
- A physical record is an actual record that is stored on the disk allocated for the file.
- A physical record may be a set of one or more logical records.
- A physical record is also called a physical block or simply a block.


## Control interval (CI)
Smallest unit VSAM reads/writes
VSAM always moves data by CI, not by record.
- I s the fundamental block of every VSAM dataset
- set of phyisical blocks that are read or written during the I/O operation
- CI can be from 512 bytes to 32KB
- FOr better benefits use 3390 tracks for the size of physical record
- Smal CI is suitable for random access because avoids bringing unnecesary logical records
- Large CI is suitable for sequential access because large CI gets more records in a single record reducing the number of reads
- A CI is a set of physical blocks that are read or written during the I/O operation.


The CI Components that impact the CI size decision are:
- No. of logical records stored in CI
- Free space for records insertion
- Control information:
   - Control interval Definition Field (CIDF)
   - REcord definition fields (RDFs)

## Control Area (CA)
Group of Control Intervals
- A CA contains multiple CIs
- Used for allocation and growth
- Generally, CA's maximum size is one cylinder, and the minimum size is one track.

## Spanned records
A spanned record is a record that is too large to fit inside a single Control Interval (CI),
so VSAM splits it across multiple CIs.
- DEFINE CLUSTER should use SPANNED attribute to have spanned records when defining the dataset. Spanned records can store on multiple control intervals (CIs).
- A spanned record can't share the CI with any other records.
- The maximum size of the spanned record is the size of the control area (CA).

## Alternate indexes
- Alternate indexes (AIXs) allow access to the logical records sequentially or directly using alternate key fields (other than the primary key field).
- Each alternate index is a KSDS cluster with an index and data components.
- AIX can define and used in three steps, and those are:
Create AIX - Defines alternate index (IDCAMS DEFINE command).
Build AIX - Creates an alternate index (IDCAMS BLDINDEX command).
Define Path - Defines the mapping between primary and alternate keys to access the records faster (IDCAMS DEFINE PATH).


## Sphere
A VSAM sphere is everything that belongs together as one logical VSAM object.


## Splits
CI split occurs when there is not enough space to process the below two requests:
- Inserting a new record at the end of CI.
- An existing record length expanded.
- CI and CA split occur in KSDS and VRRDS datasets.


# Components
A component is an individual part of a VSAM dataset. Each component has an entry, a name in the catalog, and an entry in the VTOC. A component can be multi-extent and multi-volume.

VSAM dataset has three components, and those are: 
Cluster
Data component
Index component

## Cluster
A VSAM cluster is a logical definition for a VSAM dataset and has the below one or two components:
The data component contains the data records.
The index component of the key-sequenced cluster consists of the index records.

IDCAMS DEFINE CLUSTER access-method services used to define VSAM datasets (clusters) with data and index components. This process includes creating an entry in an integrated catalog without any data transfer.

The below information is mandatory to create the dataset:

- Name of the dataset.
- Name of the catalog to contain this definition.
- Organization (sequential, indexed, or relative).
- Device and volumes that the dataset occupy.
- Space required for the dataset.
- Record size and control interval sizes (CISIZE).

## Data component
- VSAM Data Component contains data records. These data records can be small or large that might spread across CIs and CA.
- The data component is part of the VSAM dataset, alternate index, or catalog.

## Index component
- The index component contains index records with the key fields/RBA of data records.


# Catalog
When a dataset is used, it always refers to its name without the information where the dataset is stored. There should be someplace where this linking information should save. The catalog concept was invented to resolve this issue.

Catalog structure has the below components:

- Catalog
- Data Space
- Unique Clusters
- Non-VSAM Datasets

## Catalog

- Catalog maintains the dataset information like unit and volumes on which the dataset is located. It uses the same information while retrieving the data from the dataset.
- Datasets can be cataloged (while creating VSAM dataset), uncataloged (while deleting VSAM dataset), or recataloged (while creating the deleted VSAM dataset again).
- All system-managed datasets stored on DISKs are cataloged automatically in a catalog.


All Catalogs are classified into two types, and those are: 
- Master Catalog
- User Catalogs

### Master catalog
- The Master Catalog stores only the dataset high-level qualifier with the name of the user catalog, which has the location of all the datasets information.
- Every mainframe (z/OS) system that uses VSAM has at least one master catalog.
- The master catalog "owns" all other VSAMs datasets information on the system

### User catalog
- A User Catalog is a catalog that contains the name and location of a dataset (DSN / VOLUME / UNIT).
- The user catalog contains the application-specific datasets information (entries).
- 