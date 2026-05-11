# IEBGENER

IEBGENER is a utility in IBM mainframe systems particularly under z/OS

It is primarly used for copying and coverting data sets, including sequential files, partitioned datasets and generation data groups

can convert and copy sequential file data to PDS members and PDS member data to sequential files

It uses either a sequential file or pds (pdse) member as input and new or existing file or a pds or pdse member as output

Usage: 
- Copying datasets
- creating and modifying datasets
- Dataset conversion
- Print formatting
- Dataset concatenation


```` JCL
//STEP EXEC PGM=IEBGENER
//SYSPRINT  DD SYSOUT=*
//SYSUT1    DD 
//SYSUT2    DD
//SYSIN     DD DUMMY
```


# Control statements

The IEBGENER utility control statements are:
- GENERATE
- RECORD
- MEMBER
- EXISTS
- LABELS

## Generate statement
Statement can be used while copying and reformatting data during copying. It is coded when output is partitioned, editing is performed or label processing

``` jcl
//SYSIN DD *
    GENERATE [MAXNAME=N][,MAXFLDS=N]
        [,MAXGPS=N][,MAXLIST=N]
/*
```

## Record statement
THe record statement defines a record group with editing information, A record group consists of records that are to be processed identically

``` jcl
//SYSIN DD *
  RECORD [{IDENT|IDENTG}=(length,'name',input-location)]
  [,FIELD=([length],[{input-location|'literal'}],
          [conversion],[output-location])]
  [,FIELD=...][,LABELS=n]
/*
```

## Member statement
MEMBER statement specifies the member name or member alias of a output PDS or PDSE.

``` jcl
//SYSIN DD *
  MEMBER NAME=(name[,alias 1][,alias 2][,...])
/*
```

## Generate statement
The GENERATE statement can be used while copying and reformatting data during copying. It is coded when output is partitioned, editing is performed, or label processing.

MAXNAME=n, it is requried if one or more member statments coded
MAXFLDS=N, specifies the no of FIELD parameters coded in subsequent record
MAXGPS=N, specifies no of ident parameters coded in subsequent record
MAXLITS=N, specifies no of FIELD contain literal

## Labels statement
The LABELS statement is used to decide whether the labels are to copied or not to the output file. It is used when:

no user labels are to be copied.
user labels are to be copied from the SYSIN control card.
user labels are to be copied after the user's label processing routines modify them.


```
//SYSIN DD *
  LABELS [DATA={YES|NO|ALL|ONLY|INPUT}]
/*
```

## Exists statement

```
//SYSIN DD *
  EXITS [INHDR=routinename][,OUTHDR=routinename]
	[,INTLR=routinename][,OUTTLR=routinename]
	[,KEY=routinename][,DATA=routinename]
	[,IOERROR=routinename][,TOTAL=(routinename,size)]
/*
```


# Examples

1. Creating backup file

```
//STEP10   EXEC PGM=IEBGENER
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=MATEPK.IEBGENER.INPUTPS,DISP=SHR
//SYSUT2   DD DSN=MATEPK.IEBGENER.BACKUPPS,
//            DISP=(NEW,CATLG,DELETE),
//            SPACE=(TRK,(10,10),RLSE),
//            UNIT=3390,VOL=SER=DEVHD4,
//            DCB=(DSORG=PS,RECFM=FB,LRECL=80,BLKSIZE=800)
//SYSIN    DD  DUMMY
```


2. Changing logical record length

``` jcl 
//STEP10   EXEC PGM=IEBGENER
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD DSN=MATEPK.IEBGENER.INPUTPS,DISP=SHR
//SYSUT2   DD DSN=MATEPK.IEBGENER.OUTPUTPS,
//            DISP=(NEW,CATLG,DELETE),
//            SPACE=(TRK,(10,10),RLSE),
//            UNIT=3390,VOL=SER=DEVHD4,
//            DCB=(DSORG=PS,RECFM=FB,LRECL=70,BLKSIZE=700)
//SYSIN    DD  *
  GENERATE MAXFLDS=1
    RECORD FIELD=(70,1,,1)
/*
```

3. Extract part of a record
```
NAME     AGE CITY
KEVIN    21  MEXICO
ANA      25  SPAIN
where 
NAME → 1–10
AGE → 11–12
CITY → 13–20
```