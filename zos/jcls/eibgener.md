# EIBGENER

IEBGENER is a utility in the z/OS operating system used to copy, print, convert, or filter sequential datasets.
It’s one of the most commonly used utilities in JCL.
Think of it as the mainframe’s “copy and paste” tool for datasets.

# What is it used for?

- Copying sequential datasets
(text files, reports, flat files)
- Copying members from a PDS to a sequential dataset
- Printing a dataset to SYSOUT (the screen/printer)
- Creating datasets with fixed or variable-length records
- Doing simple filtering (e.g., trimming trailing spaces, truncating lines)

# Basic structure
//STEP1   EXEC PGM=IEBGENER
//SYSUT1  DD  DSN=input.dataset,DISP=SHR
//SYSUT2  DD  DSN=output.dataset,DISP=OLD
//SYSPRINT DD SYSOUT=*
//SYSIN   DD DUMMY

Explanation of each DD statement:
SYSUT1
This is the input dataset — the file you want to read.

SYSUT2
This is the output dataset — where the copied data will be written.

SYSPRINT
IEBGENER writes messages, statistics, and logs here.

SYSIN
Optional control statements.
Most of the time you don’t need any → DD DUMMY.

## Copy a dataset
//COPYJOB JOB (ACCT),'KEVIN'
//STEP1   EXEC PGM=IEBGENER
//SYSUT1  DD  DSN=KEVIN.INPUT.DATA,DISP=SHR
//SYSUT2  DD  DSN=KEVIN.OUTPUT.DATA,DISP=OLD
//SYSPRINT DD SYSOUT=*
//SYSIN   DD DUMMY


## Print a dataset to sysout
//PRINT   EXEC PGM=IEBGENER
//SYSUT1  DD DSN=KEVIN.INPUT.DATA,DISP=SHR
//SYSUT2  DD SYSOUT=*
//SYSPRINT DD SYSOUT=*
//SYSIN   DD DUMMY
