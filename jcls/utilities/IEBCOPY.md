# IEBCOPY
IEBCOPY is a data set utility program in a mainframe environment that is used to copy members from one or more PDS (Partitioned Data Set) 
or PDSE (Partitioned Data Set Extended) to another. It is also used to merge members between one or more PDS, or PDSE. The copying or merging can be full or partial.


Only used for:
- PDS
- PDSE

Commonly used for the below purposes:
- Copy all or selected members from one PDS to another
- Unload a PDS into a unique sequential dataset
- Load a unloaded sequential dataset and recreate the original partitioned dataset
- To compress partitioned datasets to recover lost space

``` jcl
//job-Card-and-parameters
//STEP1    EXEC PGM=IEBCOPY
//SYSPRINT DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//SYSDUMP  DD SYSOUT=* 
//SYSUT1   DD DSN=...
//SYSUT2   DD DSN=...
//SYSUT3   DD UNIT=..
//SYSUT4   DD UNIT=..
//SYSIN    DD *
   control-statements
/*
```

