# IEBCOPY
IEBCOPY is a z/OS utility used to copy, backup, compress, 
and manage PDS and PDSE libraries.

If IEBGENER is for sequential datasets,
IEBCOPY is for partitioned datasets (PDS/PDSE).

Think of it as a “PDS manager”.

# Copy all members from one pds to another
//COPYALL EXEC PGM=IEBCOPY
//SYSPRINT DD  SYSOUT=*
//SYSUT1   DD  DSN=KEVIN.SOURCE.PDS,DISP=SHR
//SYSUT2   DD  DSN=KEVIN.SOURCE.BACKUP,DISP=OLD

# Copy specific members
//COPYMBR EXEC PGM=IEBCOPY
//SYSPRINT DD  SYSOUT=*
//SYSUT1   DD  DSN=KEVIN.SOURCE.PDS,DISP=SHR
//SYSUT2   DD  DSN=KEVIN.TARGET.PDS,DISP=OLD
//SYSIN    DD  *
  COPY INDD=SYSUT1,OUTDD=SYSUT2
    SELECT MEMBER=PROG1
    SELECT MEMBER=UTIL2
/*

#Rename members
 //SYSIN DD *
   COPY INDD=SYSUT1,OUTDD=SYSUT2
     SELECT MEMBER=OLDNAME,RENAME=NEWNAME
 /*

# Delete members
 //SYSIN DD *
   DELETE INDD=SYSUT1
     MEMBER=TEMP1
     MEMBER=TEMP2
 /*

# Comptress 