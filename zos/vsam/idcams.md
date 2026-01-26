# IDCAMS 

## What is AMS?
An access method represents the process that is used to store and retreive data from the datasets or files.
Access method services (AMS) is an utility mainly used to define and handle VSAM datasets and integrated catalogs

## What is IDCAMS?
IDCAMS (Integrated data clusters acces method services) is the utility program that is used to create, modify and delete VSAM datasets
The functions of AMS are performed through the different functiona lcommands of IDCAMS

Functions:
- define, alter, copy or delete datasets
- list catalogs, catalog entries, or datasets
- define and build alternate indexes
- print the contents of datasets
- collect information about datasets
- examine structura consistency of VSAM KDSD
- Set cache parameters for DASD devices
- retrieve Direct Access Storage Device (DASD) information
- List tape volume (VOLCAT) catalog entries
- Detect and diagnose catalog errors
- REcover from catalog errors
- Detect VSAM datasets problems
- Ecnrypt and decrypt datasets
- Turn VSAM record level sharing on and off

## Invoking IDCAMS utility
- Batch mode with the help of JCL
- With TSO commands
- Call from the program - needs the PPI (Probem program interface) to invoke IDCAMS

### Batch mode

```
//JOBNAME  JOB job-card-parameters
//STEP1    EXEC PGM=IDCAMS
//SYSPRINT DD SYSOUT=A
//SYSIN    DD *
  AMS commands and their parameters
/*
```
- SYSPRINT DD statement - contains the result of the coded AMS command.
- SYSIN DD statement - specifies a file or instream procedure that contains IDCAMS AMS commands.

## IDCAMS return codes

- 0 (Normal Completion) - Specifies that the AMS command successfully finished its processing.
- 4 (Minor Error) - Specifies processing can continue further. However, a minor error occurred that resulted in issuing a warning message.
- 8 (Major Error) - Specifies processing can continue further. However, a more severe error resulted in major command specifications being bypassed.
- 12 (Logical Error) - Specifies that inconsistent parameters are coded, which causes the entire command to be bypassed.
- 16 (Severe Error) - Specifies a severe error that causes the entire AMS command stream to be flushed, not only the command causing the error.

# Commands

IDCAMS utility has multiple predefined commands, and each command is created for a specific purpose. Each command should be coded in one particular format under SYSIN DD to perform the task. The syntax for the IDCAMS commands are -

``` jcl
//SYSIN DD *
  Command   parameter(s) terminator [Continuation Indicator]
/*
```

Terminator - Specifies the end or continuation of the command. The line followed by spaces (without hyphen) is considered as the current line's ending.

### Guidelines
- f the command does not fit in one line, command can be continued to more than one line. A hyphen (-) is allowed as a continution character at the last character in the line.
- A parameter and a subparameter cannot be separated with a hyphen (-). A plus sign (+) should use for this purpose.
- Coding multiple commands within one job step is allowed. However, each command coding should start in new line.


# DEFINE CLUSTER

DEFINE CLUSTER command creates a new VSAM dataset. it defines the attributes for the cluster as a whole, the data and the index component of the cluster.

```
//JOBNAME  JOB job-card-parameters
//STEP1    EXEC PGM=IDCAMS
//SYSPRINT DD SYSOUT=*
//SYSIN    DD *
  DEFINE CLUSTER
 	  (NAME(entryname)
 	  [INDEXED|LINEAR|NONINDEXED|NUMBERED]
 	  [SHAREOPTIONS(crossregion[ crosssystem]|1 3)]
 	  [TO(date)|FOR(days)]
	  [cd_common_parameters]
	  [cdi_common_parameters])
 	[DATA (
 	  [NAME(entryname)]
 	  [cd_common_parameters]
	  [cdi_common_parameters])]
 	[INDEX (
 	  [NAME(entryname)]
	  [cdi_common_parameters])]
 	[CATALOG(catname)]
/*
```
cd_common_parameters (Cluster, DATA and INDEX)
```
  [BUFFERSPACE(size)]
 	  [ERASE|NOERASE]
 	  [FREESPACE(CI-percent[ CA-percent])]
 	  [KEYS(length  offset)]
 	  [RECORDSIZE(average  maximum)]
 	  [SPANNED|NONSPANNED]
 	  [SPEED|RECOVERY]
```

cdi_common_parameters

```
 	  {CYLINDERS(primary[ secondary])|
 	   KILOBYTES(primary[ secondary])|
 	   MEGABYTES(primary[ secondary])|
 	   RECORDS(primary[ secondary])|
 	   TRACKS(primary[ secondary])}
 	  [VOLUMES(volser[ volser...])]
 	  [CONTROLINTERVALSIZE(size)]
 	  [DATACLASS(class)]
 	  [FILE(ddname)]
	  [REUSE | NOREUSE]
	  [ORDERED | UNORDERED]
 	  [MODEL(entryname[ catname])]
 	  [OWNER(ownerid)]
 	  [SHAREOPTIONS(crossregion[ crosssystem]|1 3)]
	  [WRITECHECK | NOWRITECHECK]
```



## Mandatory parameters
- CLUSTER - defines the clusters. The parameters coded with the CLUSTER are applied to the whole cluster that is going to create. Short Description: CL
-NAME (entryname) - specifies the name of the VSAM cluster to be defined. This name must be unique within the catalog. entrynames are different for the cluster, its DATA component, and its INDEX component. The name is automatically generated if no names are coded for the DATA or INDEX component. The name of the cluster can be up to 44 alphanumeric characters.
= CYLINDERS (primary[ secondary])
= KILOBYTES (primary[ secondary])
= MEGABYTES (primary[ secondary])
= RECORDS (primary[ secondary])
= TRACKS (primary[ secondary]) - used to specify the amount of space allocated to the cluster, DATA and INDEX component in CYLINDERS (CYL), KILOBYTES (KB), MEGABYTES (MB), RECORDS (REC), or TRACKS (TRK) from the volume's available space. Short Description: CYL, KB, MB, REC, TRK
primary - specifies the amount of space that should allocate initially. secondary specifies an amount of space required each time when it extends.
- VOLUMES (volser[ volser...]) - Specifies the volume serial numbers where the dataset will reside. If there is not enough space on the volume as specified, the allocation is unsuccessful. Short Description: VOL


## Optional parameters
- BUFFERSPACE (size) - Specifies the amount of space to allocate for buffers. Short Description: BUFSP or BUFSPC
- CONTROLINTERVALSIZE (size) - Specifies the control interval size, which affects how data is stored and retrieved. If it is coded at the cluster level, it applies to the all components where it is not coded. If it is not coded, CLUSTER determines the size of control intervals. Short Description: CISZ or CNVSZ
- DATACLASS (class) - Specifies dataclass for the new datasets. The storage administrator provides the data class name (1-8 characters). Short Description: DATACLAS
- ERASE | NOERASE - Default: NOERASE
ERASE - specifies the cluster components memory is to be erased with binary zeroes when cluster is deleted. Short Description: ERAS
NOERASE - specifies the cluster components memory is not to be erased when cluster is deleted. Short Description: NERAS
- FILE (DDname) - specifies DDname that identifies the file.
- FREESPACE (CI-percent[ CA-percent]|0 0) - Specifies the percentage of each control interval and control area to leave free for future insertions. Short Description: FSPC. Default: FREESPACE (0 0)
- KEYS (length offset | 64 0) - specifies the primary key field in the data record. It specifies key length and its displacement (in bytes) positions from the offset of the record. Default: KEYS (64 0)
- MODEL (entryname[ catname]) - specifies existing file name that is used as a model while creating a new file.
- OWNER (ownerid) - specifies the cluster owner.
- RECORDSIZE (average maximum|default) - specifies the average and maximum lengths of the records in bytes. The minimum record size is 1 byte. Short Description: RECSZ
- REUSE | NOREUSE -
REUSE - allows the dataset to be reused if it is deleted and then recreated. Short Description: RUS
NOREUSE - indicates that the dataset is not reused after being deleted. Short Description: NRUS
- SHAREOPTIONS (crossregion[ crosssystem]|1 3) - defines how the dataset can be shared among different regions and systems. Short Description: SHR. Default: SHR (1 3). crossregion specifies the amount of sharing allowed among regions. Valid values are 1 to 4. crosssystem option specifies the amount of sharing allowed among systems. Valid values are 1 to 4.

controls how a VSAM data set can be shared between jobs, TSO users, CICS regions, or batch steps.

The first value is the Cross-region sharing 1 - no sharing, 2 - multiple readers, one writer, 3 - multiple readers, multiple writers

The second value is Cross-system 1 - no sharing, 2 - multiple readers, one writer, 3 - multiple readers, multiple writers
- INDEXED | LINEAR | NONINDEXED | NUMBERED - used to specify the type of data organization for the cluster. If the parameter is not coded, the default value is INDEXED. The valid file organizations are INDEXED (for KSDS), NONINDEXED (for ESDS), NUMBERED (for RRDS), or LINEAR (for LDS). Short Description: IXD or LIN or NIXD or NUMD
- SPEED (does not preformat) | RECOVERY (does preformat) - specifies whether the data component control areas are to be preformatted before cluster records are loaded into them. Default: SPEED. Short Description: SPEED or RCVY
- TO (date) | FOR (days) - specifies the retention period for the cluster. If neither TO nor FOR is used, the cluster can be deleted at any time.
- WRITECHECK | NOWRITECHECK - specifies twhether the cluster or component is to be reviewed when a record is being written into it. Short Description: WCK or NWCK
- CATALOG (catname) - Specifies the catalog name in which the cluster is to be defined. Short Description: CAT

Example:

``` jcl
//STEP1   EXEC PGM=IDCAMS           
//SYSPRINT DD  SYSOUT=*             
//SYSOUT  DD   SYSOUT=*             
//SYSIN   DD   *                    
  DEFINE CLUSTER(      -            
    NAME(IBMUSER.KSDS) -            
    RECORDSIZE(47,47)  -            
    KEYS(10,0)         -            
    VOLUMES(SBSYS1)    -            
    INDEXED            -            
    CYLINDERS(1,1)     -            
    SHAREOPTIONS(3,3)  -            
    CISZ(4096)         -            
    REUSE)             -            
  DATA(NAME(IBMUSER.KSDS.DATA))   - 
  INDEX(NAME(IBMUSER.KSDS.INDEX))   
/*                                  

```

# ALTER 
We never know how many records will be stored in the file during creation. So we always create a VSAM file with an average number of primary or secondary quantities. After some time, the memory is not sufficient to store the records. In this case, the file needs to be recreated (backup data, delete the file, create with modified parameters, and copy data ). IDCAMS supports changing the VSAM file parameters using the ALTER command rather than doing all the above steps.

``` jcl	
//JOBNAME  JOB job-card-parameters
//STEP1    EXEC PGM=IDCAMS
//SYSPRINT DD SYSOUT=*
//SYSIN    DD *
  ALTER  entry-name
  	[ADDVOLUMES(volser[ volser...])]
  	[BUFFERSPACE(size)]
  	[ERASE | NOERASE]
  	[FREESPACE (CI-percent[ CA-percent])]
	[INHIBIT | UNINHIBIT]
  	[KEYS(length  offset)]
  	[NEWNAME(newname)]
  	[NULLIFY(parameters)]
  	[OWNER(ownerid)]
  	[RECORDSIZE(average  maximum)]
  	[REMOVEVOLUMES(volser[ volser...])]
  	[SHAREOPTIONS(crossregion[ crosssystem])]
  	[TO(date)|FOR(days)]
  	[UNIQUEKEY|NONUNIQUEKEY]
  	[UPDATE|NOUPDATE]
  	[UPGRADE|NOUPGRADE]
	[USERCATALOG]
	[WRITECHECK|NOWRITECHECK]
	[CATALOG (catname)]
/*
```

## Optional parameters
- ADDVOLUMES (volser [ volser]) - specifies the additional volumes that are to be added to the dataset. Suppose an ALTER ADDVOLUMES is done to an opened dataset. 
In that case, the dataset must be closed and reopened to reflect the newly added volumes. Short Description: AVOL
- BUFFERSPACE (size) - Specifies the amount of space to be added for buffers. Short Description: BUFSP or BUFSPC
- ERASE | NOERASE - Default: NOERASE
ERASE - specifies the cluster components memory is to be erased with binary zeroes when cluster is deleted. Short Description: ERAS
NOERASE - specifies the cluster components memory is not to be erased when cluster is deleted. Short Description: NERAS
- FREESPACE (CI-percent[ CA-percent]|0 0) - Specifies the percentage of each control interval and control area to leave free for future insertions. Short Description: FSPC. Default: FREESPACE (0 0)
- INHIBIT | UNINHIBIT - Specifies the type of access constraint applies to the file. The available types are - INHIBIT (Applies read-only constraint. Short Description: INH), UNINHIBIT (removes read-only constraint. Short Description: UNINH).
- KEYS (length offset | 64 0) - specifies the primary key field in the data record. It specifies key length and its displacement (in bytes) positions from the offset of the record. Default: KEYS (64 0)
- NEWNAME (new-dataset-name) - specifies the new name of the entry. Short Description: NEWNM
- NULLIFY (parameters) - specifies the attributes to be nullified.
- OWNER (ownerid) - specifies the owner being altered for the entry.
- RECORDSIZE (average maximum|default) - specifies the average and maximum lengths of the records in bytes. The minimum record size is 1 byte. Short Description: RECSZ
- SHAREOPTIONS (crossregion[ crosssystem]|1 3) - defines how the dataset can be shared among different regions and systems. Short Description: SHR. Default: SHR (1 3). crossregion specifies the amount of sharing allowed among regions. Valid values are 1 to 4. crosssystem option specifies the amount of sharing allowed among systems. Valid values are 1 to 4.
- TO (date) | FOR (days) - specifies the retention period for the cluster. If neither TO nor FOR is used, the cluster can be deleted at any time.
- UNIQUEKEY | NONUNIQUEKEY -
UNIQUEKEY - ensures all keys are unique. Short Description: UNQK
NONUNIQUEKEY - allows duplicate keys. Short Description: NUNQK
- UPDATE | NOUPDATE -
UPDATE - specifies that the alternate index should be updated when changes are made to the base cluster. Short Description: UPD
NOUPDATE - specifies that the path is not reused after being deleted. Short Description: NUPD
- UPGRADE | NOUPGRADE -
UPGRADE - ensures the AIX is automatically updated when changes happend in the base cluster. Short Description: UPG
NOUPGRADE - specifies no automatic updates to AIX for changes in the base cluster. Short Description: NUPG
- WRITECHECK | NOWRITECHECK - specifies whether the cluster or component is to be reviewed when a record is being written into it. Short Description: WCK or NWCK
- CATALOG (catalog-name) - Specifies the catalog in which the work files are to be defined. Short Description: CAT

