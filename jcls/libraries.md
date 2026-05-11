# Libraries in JCL

Referes to a dataset or collection of datasets that contain reusable JCL code or procedures.
- System libraries
- User defined libraries


## System libraries
- SYS.LINKLIB: contains many of the basic execution modules of the system
- SYS1.PROCLIB: contains JCL procedures distributed with the Z/OS
- SYS1.PARMLIB: contains control parameters for z/OS and for some program products
- SYS1.LPALIB: contains system execution modules loaded into the link pack area when the system is initialized
- SYS1.NUCLEUS: contains basic kernel modules
- SYS1.SVCLIB: contains operating system routines known as SVC's


## User defined libraries

### Steplib
The STEPLIB is used to specify user-defined load library at the step level.
the system will search these libraries to find the load module of the program running at the step.
A STEPLIB is optional and job step can have only one STEPLIB statement.

``` jcl
//MTHEXMP1 JOB (META007),'PAWAN Y',NOTIFY=&SYSUID
//STEP01  EXEC PGM=PROG1
//STEPLIB DD   DSN=MTH.LOADLIB1,DISP=SHR
//STEP01  EXEC PGM=PROG2
//STEPLIB DD   DSN=MTH.LOADLIB2,DISP=SHR
```

### Joblib
The JOBLIB is used to specify user-defined load library at the job level. When the job is submitted for execution, the system will search these libraries to find the load module of the program running at each step. A JOBLIB is optional and job can have only one JOBLIB statement

``` jcl
//MTHEXMP1 JOB (META007),'PAWAN Y',NOTIFY=&SYSUID
//JOBLIB  DD   DSN=MTH.JLOADLIB,DISP=SHR
//STEP1   EXEC PGM=PROG1
//STEP2   EXEC PGM=PROG2
```

### Jcllib
A JCLLIB statement is used to specify the private libraries that contain the cataloged procedures. The system searches the libraries in the same order coded on the JCLLIB statement. 

There is only one JCLLIB statement in a JCL.

``` jcl
//MTHEXMP1 JOB (META007),'PAWAN Y',NOTIFY=&SYSUID
//MYLIBS   JCLLIB  ORDER=MTH.PROCLIB
//[DDname] JCLLIB ORDER=(library1[,library2,...])
//STEP01   EXEC PROC=MTHPROC
```

### Proclib

``` jcl
//EXMP  JOB (123),'KEVIN',NOTIFY=&SYSUID
//PROCLIB  DD  DSN=...
//SETP01 EXEC PROC
```