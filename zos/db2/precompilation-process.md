# DB2 precompilation process

Is the first step in compiling a COBOL + DB2 program,

What is Precompilation Process?
When SQL statements are embedded within a COBOL program, a DB2 precompiler is used to extract and process SQL code. During precompilation, the SQL code is separated from the COBOL code and stored in a DBRM (Database Request Module), while the COBOL code is modified for later compilation.
DSNHPC (utilities belongs to the DSNHPC family) is used for the precompilation of COBOL + DB2 program.

Steps of Precompilation Process

The DB2 precompiler checks the program to identify embedded SQL and performs the following tasks:

1. Extract SQL Statements: SQL statements are extracted and stored in a Database Request Module (DBRM).
2. Replace SQL with COBOL Calls: Each embedded SQL code block is replaced with DB2 runtime API calls that connect to DB2 at execution time.
3. Generate Modified COBOL Source Code: A modified COBOL program (without SQL, but with DB2 runtime calls) is created for compilation.

# Precompiler
- Takes teh cobol + db2 code as input, it separates the COBOL and DB2 statements into two libraries (loadlib cobol, and dbrm)
- it is responsible for checking the syntax errors of db2 statements before placing them in DBRB(Database request module)
- it does not check for syntax erros of cobol statements, or any other programming language 
- it generates timestamp tokens for both COBOl which are validated while running the program

For STEPLIB:

DSN910.SDSNLOAD
DSN910.DB9G.SDSNEXIT

