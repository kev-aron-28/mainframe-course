//COPCOMP1 JOB (123),'KEVIN',
//             CLASS=A,
//             MSGCLASS=A,
//             NOTIFY=&SYSUID,
//             MSGLEVEL=(1,1)
//*************************************************
//*         COMPILE WITH IGYWCL PROC              *
//*************************************************
//PROCLOC  JCLLIB ORDER=IGY420.SIGYPROC
//STEP1    EXEC PROC=IGYWCL
//COBOL.SYSIN DD DSN=IBMUSER.COBOL(STRUC),DISP=SHR
//LKED.SYSLMOD DD DSN=IBMUSER.LOADLIB(STRUC),DISP=SHR
/*
