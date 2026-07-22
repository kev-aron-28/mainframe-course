# Interview

# What is JCL?
JCL stands for Job Control Language. Its the command language used in IBM mainframe OS. Its used to instruct the system on how to run batch jobs
specifying details like which programs to execute and the resources required

# What is the use of JCL?
JCL is used to identify the program to be executed, the inputs required, and the location of input/output data. It informs
the OS about these requirements through JCL statements

# What are the types of JCL?
- JOB STATEMENT
- EXEC STATEMENT
- DD

# What does JCL statement consists of?
- Name field
- Operation field
- Operand field
- Comments

# What are the differences between JES2 and JES3?
Both are Job Entry Subsystems in IBM mainframes that manage job processing

JES2:
- Processes jobs individually
- Jobs are queued and select based on priority
- Each job is handled independently, so restart must be managed manually
- Allocates datasets at execution time
- More decentralized  control, simpler to configure

JES3:
- Uses centralized control, analyzing all jobs before exeuctions
- Jobs can be pre-sequenced fro optimized execution
- Can dinamically control job restarts within the same execution cycle
- Can pre-allocate datasets before execution begins
- More centralized control, complex but efficient

# State the difference between positional parameter and keyword parameter in JCL
Positional: Must be specified in a fix order
Keyword: Allow flexible order

# What is the difference between the JOBLIB and the STEPLIB statements?
Both are used to specify libraries libraries that the system should search to find programs to execute
- JOBLIB: Placed at the beggining
- STEPLIB: Placed after the exec statement within a job step