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

# Exercices

A temperature like -12.5
1. temperature pic S9(2)V9
2. 

# COBOL Editing Symbols
9 – Digit
Represents a numeric digit.
Always displays a digit; if the number has fewer digits than 9s, it will show 0.

01 WS-NUM PIC 9999.
Value = 45 → Displays as 0045
Value = 123 → Displays as 0123

Z – Leading zero suppression
Like 9, but does not show leading zeros.
First non-zero digit and everything after it are displayed.
01 WS-NUM PIC ZZZ9.
Value = 45 → Displays as 45 (2 spaces before 45)
Value = 7 → Displays as 7

Use Z for reports where you don’t want ugly leading zeros.

$ – Currency symbol
Inserts a currency symbol literally in the display.
Example:
01 WS-AMT PIC $9,999.99.

Value = 1234.56 → Displays as $1,234.56
Works with any number, just shows the $ in the display.

* – Replace leading zeros with asterisks
Instead of showing zeros, leading zeros become *.
Example:
01 WS-NUM PIC ****9.

Value = 45 → Displays as ***45
Value = 7 → Displays as ****7
Often used in banking reports to hide small numbers or blanks visually.

. – Decimal point
The period is displayed literally in the output.

Example:
01 WS-NUM PIC 999.99.
Value = 12345 → Displays as 123.45?

Important: if you want implied decimal, use V instead of . in PIC.
V = decimal not stored, just position
. = decimal actually stored/displayed

, – Thousands separator
Displays a comma for readability.
Example:
01 WS-NUM PIC 9,999.

Value = 1234 → Displays as 1,234
Value = 56 → Displays as 56 (space for missing digits)

# What nested variables really mean
01 PERSON.
   05 NAME.
      10 FIRST-NAME PIC X(10).
      10 LAST-NAME  PIC X(10).
   05 AGE PIC 9(3).
This is ONE block of memory, broken into named pieces.

PERSON
┌─────────────────────────────┐
│ NAME                        │
│ ┌──────────┬──────────┐     │
│ │ FIRST    │ LAST     │     │
│ └──────────┴──────────┘     │
│ AGE                         │
└─────────────────────────────┘

What is a level 88 in COBOL?
A level 88 is a named condition, not a variable.

01 WS-STATUS      PIC X.
   88 STATUS-ON   VALUE 'Y'.
   88 STATUS-OFF  VALUE 'N'.

Important rules
- Level 88 never has a PIC
- It belongs to the variable above it
- It is true when the parent variable has that value

SET STATUS-ON TO TRUE. = MOVE 'Y' TO WS-STATUS.

IF STATUS-ON
    DISPLAY "Status is ON"
END-IF
IF WS-STATUS = 'Y'



# PROCEDURE DIVISION
This is where COBOL actually runs code. The DATA DIVISION defines variables, but the PROCEDURE DIVISION does the actions.

- Must start with PROCEDURE DIVISION.
- Can contain sections and paragraphs, though sections are optional.
- Statements are executed top-to-bottom.

``` cobol
PROCEDURE DIVISION.

MAIN-LOGIC.
    PERFORM INPUT-PROCESSING
    PERFORM CALCULATION
    PERFORM OUTPUT-PROCESSING
    STOP RUN.

INPUT-PROCESSING.
    DISPLAY "Enter a number: "
    ACCEPT WS-NUMBER
    .
CALCULATION.
    ADD 5 TO WS-NUMBER
    .
OUTPUT-PROCESSING.
    DISPLAY "Result: " WS-NUMBER
    .
```

MAIN-LOGIC, INPUT-PROCESSING … are paragraphs.
Paragraphs are executed with PERFORM paragraph-name.


## Move statement
``` cobol
MOVE WS-NAME TO WS-MESSAGE
MOVE "HELLO" TO WS-MESSAGE
```

## compute statements
```
COMPUTE WS-TOTAL = WS-NUM1 + WS-NUM2 * 2
```

## add / substract / multiply / divide
```
ADD WS-A TO WS-B GIVING WS-C
SUBTRACT 5 FROM WS-C
MULTIPLY WS-D BY 2 GIVING WS-E
DIVIDE WS-F BY WS-G GIVING WS-H REMAINDER WS-R
```

## if statement
```
IF WS-NUMBER > 10
    DISPLAY "Greater than 10"
ELSE
    DISPLAY "10 or less"
END-IF.
```
Supports nested IFs and logical operators:
AND, OR, NOT
Can also use IF WS-FLAG = 'Y' ...

## Evaluate (switch / case equivalent)

```
EVALUATE WS-CHOICE
    WHEN 1
        DISPLAY "Option 1"
    WHEN 2
        DISPLAY "Option 2"
    WHEN OTHER
        DISPLAY "Unknown option"
END-EVALUATE.
```

## Perform
### Simple perform
PERFORM PRINT-MESSAGE

### perform thru
PERFORM INPUT-PROCESSING THRU OUTPUT-PROCESSING

### perform until (loop)
```
PERFORM UNTIL WS-COUNT > 10
    DISPLAY WS-COUNT
    ADD 1 TO WS-COUNT
END-PERFORM.
```

### perform varying (for loops)
```
PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
    DISPLAY "I = " I
END-PERFORM.
```

### perform times
PERFORM 10 TIMES

END-PERFORM

### STOP RUN
 Stops the program

