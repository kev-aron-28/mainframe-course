# MSGLEVEL param

MSGLEVEL parameter controls the printing of job messages in the output listing or job log (i.e., in the SPOOL by default).
MSLEVEL is a keyword parameter and is optional.

``` jcl
MSGLEVEL=(M1,M2)
MSGLEVEL=([statements], [execution-status])
```

statements/M1
- Specifies what JCL statements/messages to print in the output listing
- It also represent as M! with valid values from 0 to 2

0: Only job statements
1: all statements
2: only jcl staements

execution/M2
- specififes when to print the job related message in the spool
- 0-1
0: print allocation and termination messages only when job ended abnormally
1: print allocation and termination when job ended either normally or abnormally

