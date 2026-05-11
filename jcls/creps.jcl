//CREPS   JOB  (123),KEVIN,
//             CLASS=A,
//             MSGCLASS=A,
//             MSGLEVEL=(1,1),
//             NOTIFY=&SYSUID,
//             PRTY=15,TIME=(0,50)
//CREPSPR PROC
//STEP1   EXEC PGM=IEFBR14
//DD1     DD   DSN=&DNAME,
//             DISP=(NEW,CATLG,DELETE),
//             SPACE=(TRK,(20,20),RLSE),
//             DCB=(LRECL=80,RECFM=FB,BLKSIZE=800,DSORG=PS)
//        PEND
//* NOW YOU CAN CALL IT AS A FUNCTION
//STEP2   EXEC CREPSPR,DNAME=KEVIN.CUSTOM(+1)
