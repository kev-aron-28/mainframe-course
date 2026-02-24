# What is COBOL and why is it used for?
Cobol stands for Common Business Oriented Langugage is a high level programming language
designed primarly for:
- Buissiness
- Financial
- Administrative systems

# Whats an SSRANGE and NOSSRANGE?
These are options for a compiler to find the subscript out of range

- SSRANGE (Subscript Range checking enabled):
  - Enables runtime checking for array table out-of-bounds
- NOSSRAGE (Subscript Range Checking disabled):
  - Does not check array bounds at runtime

# Purpose of the FD and SD entries?
FD (File description) entry:
Is used to describe a sequential, indexed or relative files and specify the structure, record layout and organization

SD (Sort description) entry:
Is used to describe the temporary work file for the sort and merge statements

# Whats the difference of performing a SECTION and a PARAGRAPH?

A section is a set of paragraphs and when executed , it performs all its paragraphs sequentially

A paragraph is a named block of code within a section and when performed only that block of code is executed

# What does EXIT do?
Is used for logical control statement primarly for program flow control.
- Ends a loop
- paragraph 
- ends a section without performing any specific operation

# What are all the division of a cobol program?
- IDENTIFICATION DIVISION
- ENVIRONMENT DIVISION
- DATA DIVISION
- PROCEDURE DIVISION

# Which division and paragraphs are mandatory for a COBOL PROGRAM?
- IDENTIFICATION DIVISION
- PROCEDURE DIVISION

# Whats the significance of the FILE-CONTROL paragraph?
It sits inside the input-output section and is where you place all the files needed for a program
- Maps COBOL logical names fto external datasets
- Defines the File Organization
- Defines the Access mode
- Defines file status 
- Defines index for indexed and sequenced

# How many sections are there in the data division?
- file section
- working-storage section
- local-storage section
- linkage section

# Whats the significance of the WORKING-STORAGE SECTION?
Is part of the DATA DIVISION and is used to define variables, constant, and temporary storage areas needed during program execution

Variables remain available throughout the programs execution unlike the variables declared in the linkage section

# What is the used of LINKAGE SECTION?
The LINKAGE SECTION is a part of the DATA DIVISION used to define variables that receive data from calling programs, passed parameters, or shared memory areas. It is primarily used when:
- passing data between programs
- Receiving data from JCL 
- In CICS applications the linkage section is used to acces COMMAREA

We can think of think as a parameters section in cobol

# What is a level number in cobol?
A level number is a numeric identifier used in data division to define hierarchy and structure of data items.
- Stablish parent-child relationship
- Helps in grouping related data
- 66 allows redifine the variables
- 88 used for conditional processing

Examples:
## Redifines (same data diferent format)
``` cobol
01 WS-DATA.
   05 WS-NUMERIC     PIC 9(4).
   05 WS-TEXT        PIC X(6).

01 WS-DATA-REDEF REDEFINES WS-DATA.
   05 WS-ALL-TEXT    PIC X(10).
```

## Renames (creates alternate name for a group)
``` cobol
01 WS-DATE.
   05 WS-YEAR    PIC 9(4).
   05 WS-MONTH   PIC 9(2).
   05 WS-DAY     PIC 9(2).

66 WS-FULL-DATE RENAMES WS-YEAR THRU WS-DAY.
```

# What is level 77 level used for? 
Is used to declare standalone elementary data items that are not part of any group. Unlike 01 level, it cannot have subfields and must be a single variable.

# What is level 88 level used for? 
The level 88 is used to define condition names, which act as a meaningful names for specific values of a variable.

```
 01 WS-GENDER       PIC X(01).
   88 WS-MALE         VALUE 'M'.
   88 WS-FEMALE       VALUE 'F'.
```

# What are the different types of data types supported by COBOL?
- Alphabetic
- Alpha-numeric
- Numeric
- SIgn
- Decimal point