# IEBGENER

IEBGENER is a utility program in IBM Mainframe systems, particularly under z/OS. It is primarily used for copying and converting data sets, 
including sequential files, partitioned datasets, and generation data groups.

Usage:
- Copying datasets
- Creating and modifying datasets
- Dataset conversion
- Print formatting
- Dataset concatenation

# Control statements
IEBGENER also has its own control statements and it controls the functions of copy, if no utility control statements are coded, the entire input data set gets copied
sequentially

- GENERATE
- RECORD
- MEMBER
- EXITS
- LABELS

# GENERATE
The GENERATE statement can be used while copying and reformatting data during copying 

``` jcl
//SYSIN DD *
  GENERATE [MAXNAME=n][,MAXFLDS=n][,MAXGPS=n][,MAXLITS=n]
/*
```

MAXNAME=n, Maximum number of MEMBER statements you will code. Required only if you use MEMBER statements.
MAXFLDS=n, Maximum number of FIELD parameters that can appear in each subsequent RECORD statement.
MAXGPS=n, Maximum number of IDENT parameters that can appear in each RECORD statement. IDENT is used to identify records that should be modified.
MAXLITS=n, Maximum number of FIELD parameters that contain literal values (constants like 'ABC', '123', etc.) in the RECORD statements.

# RECORD
Defines a record group with editing information
``` jcl
//SYSIN DD *
  RECORD [{IDENT|IDENTG}=(length,'name',input-location)]
  [,FIELD=([length],[{input-location|'literal'}],
          [conversion],[output-location])]
  [,FIELD=...][,LABELS=n]
/*
```

IDENT|IDENTG=(length,'name',input-location): IDentifies the last record of input file group of records
