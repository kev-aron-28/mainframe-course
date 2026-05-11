# Structure of a JCL

Three types of statements

- Job
- exec
- dd

# Job statement
The JOB statement always goes first:
It tells z/OS:
who you are
how the job should be run
message output class
priority
etc.

Only one JOB statement per job

# EXEC statement (runs a program)

Every job has one or more EXEC statements, each one running a program
Every EXEC step can have many DD statements following it.

# DD statements
DD = Data Definition

These define the resources the step needs:
datasets (input/output)
sysout
control cards (SYSIN)
logs (SYSPRINT)
temporary files
parameters

Order doesn't matter between DDs,
but they all must come after that step’s EXEC.


# What can come after an exec

So after the EXEC, the only valid things that can come are:

1. DD Statements
These define all the datasets and resources the program uses.

2. IF / THEN / ELSE Blocks

3. In-stream Data (for SYSIN or others)

4. PROC Overrides (if the EXEC calls a PROC)

1. SYSIN — “input to the program”
SYSIN is the place where you give a program its control statements.
Think of it this way:
a program (like SORT, IDCAMS, IEBCOPY, etc.) needs instructions
those instructions go in SYSIN

2. SYSPRINT — “what the utility prints (log)”
SYSPRINT is where most IBM utilities write their reports or logs, such as:
 //SYSPRINT DD SYSOUT=*

3. SYSOUT — “message/output stream to JES”
SYSOUT is a DD statement that sends data to the spool, controlled by JES.
 //SYSOUT DD SYSOUT=*