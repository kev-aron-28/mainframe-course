# PRogram communication statements

They manage interactions between program components, different programs or external entities.
They enable structured programming by sharing code and data among different parts of a program
between separate programs.

## CALL statement

- A CALL statement statement is used to transfer the control from one program to another.
- The CALL statement is always coded in the calling or main program, and the program name in the CALL statement is called or subprogram.
- The main program holds its execution until the subprogram completes its execution. This allows for a structured and organized flow of operations.
- Subprograms are mainly designed to complete a common task performed in many programs. By calling the subprogram from where the task needs to be completed, 
  we can avoid code redundancy (coding the same piece of code in multiple locations).

``` cobol
CALL subprogram
    [USING variable1, variable2, ...]
    [RETURNING variableA, variableB, ...]
    [ON EXCEPTION statements-block1]
    [NOT ON EXCEPTION statements-block2]
[END-CALL].
```

## CALL types
- Static call
- Dynamic call

### Static
- STATIC CALL attaches the SUBPROG load module to the MAINPROG load module to increase processing speed.
- The load modules of MAINPROG and SUBPROG are stored together, that reduces the loading time of the SUBPROG load module into the main memory.

```
CALL "subprogram-name"
```
- subprogram-name should be in quotes, and the compiler option should be NODYNAM to make the call as STATIC.
- If SUBPROG is modified, it should be compiled first. Then, MAINPROG should be compiled to update the load module with the new SUBPROG changes. If SUBPROG is not modified, compiling MAINPROG alone is sufficient.
- STATIC CALL execution is faster than DYNAMIC CALL.

## Dynamic
- DYNAMIC CALL removes the compilation dependency of MAINPROG when the SUBPROG is modified.
- The CALL statement is coded with a variable containing the SUBPROG name to separate the load modules stored independently.

``` cobol
 05 WS-SUBPROG     PIC X(08) VALUE SPACES.
 ...
 MOVE "SUBPROG"  TO WS-SUBPROG.
 CALL WS-SUBPROG
```

### Using phrase
- Using phrase is used to pass the parameters from MAIN to subprog
- We should declare the passing paremeters in the working-storage section of main and the linkage section of subprog
- 

#### Using by reference

BY REFERENCE passes the address of the parameter memory location to the SUBPROG. The SUBPROG receives the pointer to the parameter memory location when we pass the parameters using BY REFERENCE. If the SUBPROG modifies the value of the passing parameter, the new value will be reflected in the MAINPROG.


``` cobol
CALL subprog-name USING BY REFERENCE PARM1, PARM2
```

#### By content
BY CONTENT phrase is used to pass the copy of the data to the SUBPROG. The SUBPROG receives a copy of the variable's data at the time of the execution when we pass the parameters using the BY CONTENT. If the SUBPROG modifies the value of the passing input variable, the new value will not reflect in the MAINPROG.

``` cobol
CALL subprog-name USING BY CONTENT PARM1, PARM2, ...
```

#### BY value

``` cobol
CALL subprog-name USING BY VALUE PARM1, PARM2, ...
```

## Cancel statement
CANCEL statement is used to release the resources associated with a previously called subprogram.
When a subprogram is called, a set resources are allocated for its execution. If the subprogram is no longer needed, a CANCEL statement is used to free up those resources.

``` cobol
CANCEL ""
or
CANCEL ws-variable
```

# Stop a program
## STOP RUN statement
- The STOP RUN statement terminates a program's execution.
- Once STOP RUN is executed, control returns to the operating system.

``` cobol
STOP RUN.
```

what it does:
- All files closed
- Any buffered output is written
- Control is returned to the operating system

## EXIT PROGRAM statement
EXIT PROGRAM indicates the end of the subprogram (called program) processing and returns control to the main program (calling program). It is mainly used in COBOL subprograms.

``` cobol
EXIT PROGRAM.
```

## GO BACK statement
GOBACK statement specifies the logical end of a program and gives the control back from where it was received.

``` cobol
GOBACK.
```

- it can be coded both in the main program and the sub-program
- works like the EXIT PROGRAM when in a sub-program
- It works like the STOP RUN when in the mainprogram

## GO TO statement
GO TO statement is used to transfer control to another part of the program, allowing the program to "jump" to a different paragraph or section.

``` cobol
GO TO paragraph-1.

### Conditional GO TO 

or
GO TO paragraph-1[,paragraph-2,...]
     DEPENDING ON ws-variable.
```