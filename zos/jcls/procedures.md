# PROCEDURES

## The exec keyword
Its main purpose is to provide the necessary information to the operating system to execute the job step

EXEC treats as the beginning of the step and required for each step

```jcl
//[stepname]  exec parameters  [comments]
```

### PGM
Is used to specify the program that needs to be run by the system. Should be a clean compiled program ready to execute

``` jcl
//STEP1 exec pgm=sample
```

### PROC
Is used to specify the procedure that needs to be run by the system. THe procedure can be instream
or cataloged.

```
//step01 exec proc=procedure=name

```

# Procedures

Is a set of reusable JCL statements defined once and called multiple times within a job or across various jobs

They are used to simply job processing by allowing frequently used sets of JCL statements to be stored in a library
and called whenver required.


## Instream procedure
It is defined within the same JCL it wont validate syntax errors until an EXEC statement calls.
A maximum of 15 instream procedure can be coded

``` jcl
//NEWPS   PROC                                              
//STEPA   EXEC PGM=IEFBR14                                  
//SYSUT1  DD   DSN=&PSNAME,                                 
//             DISP=(NEW,CATLG,DELETE),                     
//             UNIT=SYSDA,                                  
//             SPACE=(CYL,(1,1),RLSE),                      
//             DCB=(DSORG=PS,LRECL=80,BLKSIZE=800,RECFM=FB) 
//SYSOUT  DD   SYSOUT=*                                     
//SYSPRINT DD  SYSOUT=*                                     
//SYSIN   DD   DUMMY                                        
//        PEND                                              
```  

and to call it 

``` jcl
//step-name EXEC proc-name
or
//STEP10  EXEC NEWPS,PSNAME=IBMUSER.TEST.FILE1
```


## Catalogued procedure
Its defined outside of the JCL and is called cataloged procedure
The library should be coded with PROCLIB|JCLLIB to include the procedure

```
PLIB JCLLIB ORDER=(YOURLIBE.JCL.LIB)
```
