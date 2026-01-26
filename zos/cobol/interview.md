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

