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