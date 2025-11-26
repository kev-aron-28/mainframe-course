//DELEGDG JOB  (123),'KEVIN',
//             CLASS=A,
//             MSGCLASS=A,
//             MSGLEVEL=(1,1),
//             PRTY=15,
//             NOTIFY=&SYSUID
//*********************************************
//*  DELETE A GDG
//*********************************************
//STEP1   EXEC PGM=IDCAMS
//SYSPRINT DD  SYSOUT=*
//SYSIN    DD  *
           DELETE (KEVIN.CUSTOM) GDG FORCE
/*
