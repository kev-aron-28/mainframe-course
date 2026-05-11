//SORTJOB JOB  (COURSE2,'LEARNING'),
//             KEVIN,
//             CLASS=A, /* A-Z,0-9
//             PRTY=15,
//             NOTIFY=&SYSUID,
//             MSGCLASS=X,  /* A-Z,0-9
//             MSGLEVEL=(1,1),
//             TYPRUN=SCAN, /* OR HOLD
//             TIME=(5,0),  /* MAXIMUM TIME
//             REGION=5K    /* NK OR NM
//
//STEP1   EXEC PGM=SORT         /* OR PROC
//SORTFILE DD  DSN=IBMUSER.TEST.FILE,
//             DISP=(NEW,CATLG,DELETE),
//             UNIT=SYSDA,
//             VOL=SER=3390,
//             SPACE=(TRK,(20,20),RLSE),
//             DCB=(RECL=80,RECFM=FB,BLKSIZE=800,DSORG=PS)
//SYSOUT   DD  SYSOUT=*
