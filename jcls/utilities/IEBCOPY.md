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

# COPYY statement
COPY statement is used for copying, unloading, or loading operations from one PDS to another. The copy can be full or partial.

``` jcl
//SYSIN     DD  *
[label] COPY OUTDD=DDname
		,INDD=[(]{DDname|(DDname,R) }[,...][)] 
		[LIST={YES|NO}]
/*
```

OUTDD=DDname - Specifies the DDname of the output PDS.
INDD=[(]{DDname|(DDname,R) }[,...][)] - Specifies the DDname of the input PDS.
R - Specifies that the members to be copied or loaded from the input PDS will replace any same members on the output PDS.
LIST={YES|NO} - Specify the altered member names to be listed in the SYSPRINT dataset. When ignored, the default listing option from the EXEC PARM gets applied.