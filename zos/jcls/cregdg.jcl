//CREGDG  JOB  (123),'KEVIN',
//             CLASS=A,
//             MSGCLASS=A,
//             MSGLEVEL=(1,1),
//             PRTY=15,
//             NOTIFY=&SYSUID
//******************************************************
//*  JCL TO CREATE A GDG
//********************************************************
//STEP1   EXEC PGM=IDCAMS
//SYSPRINT DD  SYSOUT=*
//SYSIN    DD  *
      DEFINE GDG(NAME(KEVIN.CUSTOM) -
             LIMIT(12) -
             NOEMPTY -
             SCRATCH)
/*
