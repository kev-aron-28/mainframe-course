# Conditional statements in JCL

The "IF" statement is used to execute a step conditionally based on the condition coded. 
The IF statement defines a condition with the return code or condition code of the previous steps. 
If the condition is true, then the step that follows the IF statement gets executed, and if the condition is false, the step execution gets skipped.

## COND parameter (old but still used)
COND=(code,operator)

Skip this step if the condition is TRUE
EQ (equal)
NE (not equal)
GT (greater than)
GE (greater or equal)
LT (less than)
LE (less or equal)

// IF (STEP1.RC = 0) THEN
//STEP2 EXEC PGM=PROGB
// ENDIF


## Common RC meanings

| RC  | Meaning (typical)             |
| --- | ----------------------------- |
| 0   | Successful                    |
| 4   | Warning / minor issue         |
| 8   | Error (recoverable)           |
| 12  | Serious error                 |
| 16  | Severe error                  |
| >16 | Very severe (program-defined) |


## ABENDs (abnormal ends)
An ABEND occurs when:

- program crashes
- program violates system rules
- program explicitly abends

## Types of abends
| ABEND | Meaning                                     |
| ----- | ------------------------------------------- |
| S0C1  | Operation exception (bad instruction)       |
| S0C4  | Protection / addressing error (very common) |
| S0C7  | Data exception (bad numeric data)           |
| S013  | Dataset open error                          |
| S222  | Job canceled                                |
| S322  | CPU time exceeded                           |
| S806  | Program not found                           |
| S80A  | Insufficient storage                        |
