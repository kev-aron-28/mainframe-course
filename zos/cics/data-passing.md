# Data passing between programs or transactions

CICS provides multiple ways to transfer data between programs or between transactions, depending on the scope
and lifetime of the data

There are two mains ways to pass data between programs or transactions
1. Data passing between programs
2. Data passing between transactions

# Data passing between programs
CICS provides the below options to pass that between the CICS application programs:
- COMMAREA
- Queues
- Channels

## COMMAREA
The COMMAREA stands for "communication area". In the context of the LINK and XCTL commands, the COMMAREA option specifies the name of the data area used to pass data from
the currently program to the program being called.

- Fixed size storage (32 KB)
- Passed via LINK XCTL and return commands

## How to use COMMAREA

1. Define commarea in the calling program
``` cobol
...
WORKING-STORAGE SECTION.
01 WS-COMMAREA IC X(100).  *> Data to be passed
...
PROCEDURE DIVISION.
	EXEC CICS LINK
     PROGRAM('PROG2')
     COMMAREA(WS-COMMAREA)
     LENGTH(100)
     END-EXEC.
	...
```

2. Receive COMMAREA in a called program
 
``` cobol
...
LINKAGE SECTION.
01 WS-COMMAREA IC X(100).  *> Data to be passed
...
PROCEDURE DIVISION.
	...
```

Use COMMAREA when passing small amounts of data (under 32KB) between programs within the same transaction

## Queues
Queues are designed to transfer large amounts of data between application programs or transactions
typically handling data that exceds 32K or 64K in length. 