# IEFBR14
IEFBR14 is a dummy utility program in z/OS. Its main purpose is:
- Do nothing—it just returns control to JES immediately.
- Often used in JCL to create or delete datasets without executing any real program.
- Acts as a placeholder in JCL steps.

//STEP1   EXEC PMG=IEFBR14                        
//SYSUT1  DD   DNS=IBMUSER.NEW.SQ,                
//             DISP=(NEW,CATLG,DELETE),           
//             SPACE=(CYL,(5,1)),                 
//             DCB=(RECFM=FB,LRECL=80,BLKSIZE=800)
//SYSPRINT DD  SYSOUT=*                           
//SYSIN    DD  DUMMY                              


# Basic structure for creating a dataset with iefbr14
//STEP1   EXEC PGM=IEFBR14
//DDNAME  DD DSN=dataset.name,
///           DISP=(NEW,CATLG,DELETE),
///           SPACE=(CYL,(primary,secondary)),
///           UNIT=unit-class,
///           DCB=(RECFM=...,LRECL=...,BLKSIZE=...),
///           DSNTYPE=PO

| Parameter   | Purpose                                                 | Example                                                                   |
| ----------- | ------------------------------------------------------- | ------------------------------------------------------------------------- |
| **DSN**     | Dataset name                                            | `MY.NEW.SEQ`                                                              |
| **DISP**    | Dataset disposition                                     | `(NEW,CATLG,DELETE)` → create, catalog if successful, delete if job fails |
| **SPACE**   | Space allocation                                        | `(CYL,(5,1))` → 5 cylinders primary, 1 cylinder secondary                 |
| **UNIT**    | Device class                                            | `SYSDA` → typical disk device                                             |
| **DCB**     | Dataset Control Block: record format, length, blocksize | `DCB=(RECFM=FB,LRECL=80,BLKSIZE=800)`                                     |
| **DSNTYPE** | Dataset type (optional, mostly for PDS/PDSE)            | `PO` → PDS, `PO-E` → PDSE                                                 |
