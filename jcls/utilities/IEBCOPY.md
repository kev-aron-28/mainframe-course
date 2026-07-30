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

# SELECT statement

``` jcl
//MATEPKS  JOB (123),'MTH',CLASS=A,MSGCLASS=A,MSGLEVEL=(1,1),
//             NOTIFY=&SYSUID
//*************************************************** 
//* SELETING MEMBER(S) FROM INPUT PDS DURING COPY  
//***************************************************
//STEP10   EXEC PGM=IEBCOPY
//SYSPRINT DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//SYSDUMP  DD SYSOUT=* 
//SYSUT1   DD DSN=MATEPK.IEBCOPY.INPPDS,DISP=SHR
//SYSUT2   DD DSN=MATEPK.IEBCOPY.OUTPDS,DISP=SHR
//SYSIN    DD *
     COPY INDD=SYSUT1,OUTDD=SYSUT2
     SELECT MEMBER=FIRSTPRG,IDENTDIV,LEVELNUM 
/* 
```

# EXCLUDE statement

``` jcl
----+----1----+----2----+----3----+----4----+----5----+
//MATEPKC  JOB (123),'MTH',CLASS=A,MSGCLASS=A,MSGLEVEL=(1,1),
//             NOTIFY=&SYSUID
//***********************************************************
//* EXCLIDING MEMBERS WHILE COPY FROM ONE PDS TO ANOTHER
//*********************************************************** 
//STEP10   EXEC PGM=IEBCOPY
//SYSPRINT DD SYSOUT=* 
//SYSOUT   DD SYSOUT=*
//SYSDUMP  DD SYSOUT=*
//SYSUT1   DD DSN=MATEPK.IEBCOPY.INPPDS,DISP=SHR
//SYSUT2   DD DSN=MATEPK.IEBCOPY.OUTPDS,
//            DISP=(NEW,CATLG,DELETE),
//            SPACE=(TRK,(10,10,10),RLSE),
//            UNIT=3390,VOL=SER=DEVHD4,
//            DCB=(DSORG=PO,RECFM=FB,LRECL=80,BLKSIZE=800)
//SYSIN    DD *
     COPY INDD=SYSUT1,OUTDD=SYSUT2
     EXCLUDE MEMBER=MAINPROG
/*
```

# RENAME


``` jcl
----+----1----+----2----+----3----+----4----+----5----+
//MATEPKC  JOB (123),'MTH',CLASS=A,MSGCLASS=A,MSGLEVEL=(1,1),
//             NOTIFY=&SYSUID
//****************************************************************
//* Rename member while copying from one PDS to other
//****************************************************************
//STEP10   EXEC PGM=IEBCOPY
//SYSPRINT DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//SYSDUMP  DD SYSOUT=*
//SYSUT1   DD DSN=MATEPK.IEBCOPY.INPPDS,DISP=SHR
//SYSUT2   DD DSN=MATEPK.IEBCOPY.OUTPDS,
//            DISP=(NEW,CATLG,DELETE),
//            SPACE=(TRK,(10,10,10),RLSE),
//            UNIT=3390,VOL=SER=DEVHD2,
//            DCB=(DSORG=PO,RECFM=FB,LRECL=80,BLKSIZE=800)
//SYSIN    DD *
     COPY INDD=SYSUT1,OUTDD=SYSUT2
     SELECT MEMBER=(IDENTDIV,(FIRSTPRG,FIRPRG1))
/*
```

# REPLACE

``` jcl
//MATEPKC  JOB (123),'MTH',CLASS=A,MSGCLASS=A,MSGLEVEL=(1,1),
//             NOTIFY=&SYSUID
//****************************************************************
//* Replaces the member if it is in target PDS
//****************************************************************
//STEP10   EXEC PGM=IEBCOPY
//SYSPRINT DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//SYSDUMP  DD SYSOUT=*
//SYSUT1   DD DSN=MATEPK.IEBCOPY.INPPDS,DISP=SHR
//SYSUT2   DD DSN=MATEPK.IEBCOPY.OUTPDS,DISP=OLD
//SYSIN    DD *
     COPY  OUTDD=SYSUT2,INDD=SYSUT1        
     SELECT MEMBER=((IDENTDIV,,R),FIRSTPRG)
/*
```

# COMPRESS

``` jcl
----+----1----+----2----+----3----+----4----+----5----+
//MATEPKC  JOB (123),'MTH',CLASS=A,MSGCLASS=A,MSGLEVEL=(1,1),
//             NOTIFY=&SYSUID
//***********************************************
//* COMPRESS THE PDS
//***********************************************
//STEP10   EXEC PGM=IEBCOPY
//SYSPRINT DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//SYSDUMP  DD SYSOUT=*
//SYSUT1   DD DSN=MATEPK.IEBCOPY.INPPDS,DISP=SHR
//SYSIN    DD *
  COPY OUTDD=SYSUT1,INDD=SYSUT1
/* 
```

# Convert PDS to PDSE

``` jcl
----+----1----+----2----+----3----+----4----+----5----+
//MATEPKE  JOB (123),'MTH',CLASS=A,MSGCLASS=A,
//             MSGLEVEL=(1,1),NOTIFY=&SYSUID 
//***************************************************
//* CONVERT PDS TO PDSE 
//***************************************************
//STEP10   EXEC PGM=IEBCOPY
//SYSPRINT DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//SYSDUMP  DD SYSOUT=*
//SYSUT1   DD DSN=MATEPK.IEBCOPY.INPPDS,DISP=SHR
//SYSUT2   DD DSN=MATEPK.IEBCOPY.INPPDSE,
//            DSNTYPE=LIBRARY,
//            DISP=(NEW,CATLG,DELETE),
//            UNIT=3390,VOL=SER=DEVHD4
//            DCB=(RECFM=FB,LRECL=80,BLKSIZE=800)
```