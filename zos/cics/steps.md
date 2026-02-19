# Steps when developing a CICS program

1. A Cics program is written in COBOL with CICS commands. These commands must be enclosed within:

``` cobol
EXEC CICS
...
END-CICS
```

2. Compile the COBOL + CICS program

    3. Define the transaction entry (PCT) in CICS:
        - ceda def tran(mdfa)
        - you will be asked the transaction id (4 chars), the group, and the program
        - then you install the transaction, ceda install tran(mdfa)
    4. Define the rogram entry (PPT) in CICS:
        - ceda def prog(mdfpgma)
        - the you must install it, ceda ins prog(MDFPGMA) Only put the program, and the group
    5. Issue a new copy in CICS region
        - cemt set prog(sendtxtp) newc and in the results must say NORMAL
    6. Now in CICS region you enter the transction

ce