//DELPS   JOB  (123),'KEVIN',
//             CLASS=A,
//             MSGCLASS=A,
//             MSGLEVEL=(1,1),
//             PRTY=15,
//             NOTIFY=&SYSUID
//*****************************************
//* DELETE A DATASET
//*****************************************
//STEP1   EXEC PGM=IEFBR14
//DD1     DD   DSN=KEVIN.CUSTOM,
//             DISP=(OLD,DELETE,DELETE)
//SYSPRINT DD  SYSOUT=*
//SYSIN    DD  DUMMY
/*
