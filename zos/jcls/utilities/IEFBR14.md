# IEFBR14
Is a no-operation or dummy utility by IBM. In the utility name "IEB" means data set utility program. and 
BR14 means branch to register 14. During the IEFBR14 execution, it branches to address register 14, which returns the control to operating system

The assembler instruction for this prcess is BR 14 thats how this utility got its name IEFBR14

IEFBR14 utility perform the following tasks:
- Allocate / create datasets
- Delete datasets
- Uncatlog datasets
- Catalog datasets
- Setting return code to zero 

It performs this operations on sequential file (PS) or partitioned dataset (PDS)

## Syntax

```
//STEP1    EXEC PGM=IEFBR14
//SYSPRINT DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//SYSDUMP  DD SYSOUT=*
//DD1      DD DSN=datset.name, DISP=(OLD,UNCATLG,..),
//         VOLUME=SER=volume-name,UNIT=sys-name
```

- SYSPRINT - Optional. Utility use it for their output.
- SYSOUT - Optional. It specifies a system-defined DD name for file status codes, system abend codes information, and the display statement output.
- SYSDUMP - Oprional. The system uses it for dumping when an abend occurs.
- DD01, DD02, ... - This DD statement specifies dataset attributes for creation.


# Examples

1. Create datasets

```
//STEP01   EXEC PGM=IEFBR14
//DD1      DD DSN=MATEPK.IEFBR14.PSFILE,
//            DISP=(NEW,CATLG,DELETE),
//            SPACE=(TRK,(3,2),RLSE),
//            UNIT=SYSDA,VOLUME=SER=DEVHD4,
//            DCB=(DSORG=PS,RECFM=FB,LRECL=80,BLKSIZE=800)
```

2. Uncatalog datasets

```
//STEP01   EXEC PGM=IEFBR14
//DD1      DD DSN=MATEPK.IEFBR14.PSFILE,
//            DISP=(OLD,UNCATLG,DELETE)
//DD2      DD DSN=MATEPK.IEFBR14.PDS,
//            DISP=(OLD,UNCATLG,DELETE)
```

3. Catalog datastes

``` 
//STEP01   EXEC PGM=IEFBR14
//DD1      DD DSN=MATEPK.IEFBR14.PSFILE,
//            VOLUME=SER=DEVHD4,UNIT=SYSDA,
//            DISP=(OLD,CATLG,DELETE)
//DD2      DD DSN=MATEPK.IEFBR14.PDS,
//            VOLUME=SER=DEVHD4,UNIT=SYSDA,
//            DISP=(OLD,CATLG,DELETE)
```

4. Delete datasets

```
//STEP01   EXEC PGM=IEFBR14
//DD1      DD DSN=MATEPK.IEFBR14.PSFILE,
//            DISP=(OLD,DELETE,DELETE)
//DD2      DD DSN=MATEPK.IEFBR14.PDS,
//            DISP=(OLD,DELETE,DELETE)
```

