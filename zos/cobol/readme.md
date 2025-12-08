# Cobol

## Structure
A cobol program is divided into four major divisions (each division may contain sections and
paragrahs)

IDENTIFICATION DIVISION. Program name and source info. Mandatory.
ENVIRONMENT DIVISION. Configuration and file control (optional in tiny programs, but common)
DATA DIVISION. All data descriptions (FILE SECTION, WORKING-STORAGE SECTION, LINKAGE SECTION).
PROCEDURE DIVISION. Actual executable code (statements).

# Fixed format
Area a in col 8
Area b in col 12 

# Comments and continuations
Comments: * in column 7 (fixed) or *> anywhere (free).
Inline comment-like: use * after indicator in fixed.
Continuation: place - in column 7 (fixed) or use & or line continuations in free compilers — exact behavior depends on compiler. In free format you usually just continue in next line.

# Identification division
The IDENTIFICATION DIVISION is the first division of every COBOL program and it describes the program itself.
It is the only division that is always mandatory.

PROGRAM-ID
(Optional) AUTHOR
(Optional) INSTALLATION
(Optional) DATE-WRITTEN
(Optional) DATE-COMPILED
(Optional) SECURITY (rarely used)

## PROGRAM-ID.
This is the real name of the COBOL program.
- Must be unique in a compilation unit.
- Usually uppercase by convention.
- Can include hyphens (MY-PROGRAM).
- Cannot include spaces.

# Naming Conventions (Very Important)
COBOL uses hyphen-case (kebab-case) for identifiers:

Examples:
WS-NAME
TOTAL-AMOUNT
CUSTOMER-ID
CALCULATE-SUMMARY

# ENVIRONMENT DIVISION

This division describes the machine environment where the program runs, especially files and their configuration.
It has two sections:
CONFIGURATION SECTION (optional)
INPUT-OUTPUT SECTION (commonly used with files)

## Configuration section
You rarely need this today, but it still exists.
It contains things like:
Old mainframe details; modern compilers ignore these.
```
CONFIGURATION SECTION.
SOURCE-COMPUTER. IBM-Z15.
OBJECT-COMPUTER. IBM-Z15.
```

## SPECIAL-NAMES
This is used today.

You can define:
- Decimal point vs comma
- Class definitions
- Switch names (old style)
- Currency symbols
- Alphabet definitions

## INPUT-OUTPUT SECTION
This is the most important part of the Environment Division.
It is required if your program uses files.

## FILE-CONTROL
This is where you declare logical file names and how they map to physical files.

 ENVIRONMENT DIVISION.                                            00040001
      *> IDENTIFY THE FILE                                              00050001
       INPUT-OUTPUT SECTION.                                            00060002
       FILE-CONTROL.                                                    00070002
           SELECT MYFILE                                                00080002
           ASSIGN TO MYDD                                               00090002
           ORGANIZATION IS SEQUENTIAL                                   00091004
           FILE STATUS IS FS-MYFILE.  

### Select statement
The SELECT statement tells COBOL:
- The logical name: CUSTOMER-FILE
- Where the file exists: "customers.dat"
- The file organization: SEQUENTIAL, RELATIVE, or INDEXED
- The access mode: SEQUENTIAL, RANDOM, DYNAMIC
- Optional keys: PRIMARY KEY, ALTERNATE KEY
- Record boundaries: RECORD DELIMITER

### ORGANIZATION
SEQUENTIAL
RELATIVE
INDEXED (like key-value storage)

### ACCESS MODE
SEQUENTIAL
RANDOM
DYNAMIC (you can do both)

### RECORD KEY
For indexed files: RECORD KEY IS CUSTOMER-ID.


# DATA DIVISION

This is the heart of COBOL. Every variable, file record, table, buffer, and parameter is defined here.
The DATA DIVISION contains four sections:
1. FILE SECTION – File record layouts
2. WORKING-STORAGE SECTION – Global variables
3. LOCAL-STORAGE SECTION – Variables that reset every call (like function locals)
4. LINKAGE SECTION – Parameters passed to the program (CALL using)


## FILE SECTION.
Used only when your program has files.

FILE SECTION.
FD CUSTOMER-FILE.
01 CUSTOMER-RECORD.
   05 CUSTOMER-ID      PIC 9(5).
   05 CUSTOMER-NAME    PIC X(30).
   05 CUSTOMER-AGE     PIC 9(3).

## WORKING-STORAGE SECTION.
This is where program-wide variables live.
They behave like global variables in other languages.

Level numbers describe structure/indentation:
01 = top-level item
05, 10, 15 … = subfields
77 = standalone item (no children, not struct)
88 = condition name (logical alias)

## LOCAL-STORAGE SECTION
Works like local variables inside a function in most languages.

Difference from WORKING-STORAGE:
Values are NOT preserved between calls.
Reinitialized each time the program starts or subprogram is called.

## LINKAGE SECTION
Used for programs that are called by other programs.
Variables in LINKAGE SECTION do NOT allocate storage — the caller supplies the data.
Example:

CALL "SUBPROG" USING WS-NAME WS-AGE.

LINKAGE SECTION.
01 L-NAME    PIC X(20).
01 L-AGE     PIC 9(3).

PROCEDURE DIVISION USING L-NAME L-AGE.


# What is a PIC CLAUSE?
The PIC (PICTURE) clause describes how a variable looks in memory.

## Basic categories
- Alphanumeric (text)
PIC X(n)
PIC X(30)   *> 30-character text

- alphabetic 
PIC A(n)
Stores letters only (A–Z).

- Numeric
PIC 9(n)
Digits 0–9 only.

- Decimal numbers
There are two ways

A. With an amplied decimal
PIC 9(5)V99
Meaning:
V = implied decimal point (not stored)
Actual size = 7 digits
Decimal automatically assumed before last 2 digits

B. With a real decimal point (displayed)
PIC 9(5).99
The period counts as a character → takes more space.

- Signed numbers
S for sign
PIC S9(5)
PIC S9(3)V99

# Editing formmated output
| Symbol | Meaning                       |
| ------ | ----------------------------- |
| 9      | Digit                         |
| Z      | Leading zero suppression      |
| $      | Currency                      |
| *      | Replaces leading zeros with * |
| .      | Decimal point                 |
| ,      | Thousands separator           |
| -      | Sign                          |
