# Daily commands

CEMT: CICS Execute master terminal
CEDA: CICS Execute Definition Administration
CECI: CICS Execute Command Interpreter
CEDF: CICS Execution Diagnostic Facility
CESN: CICS Execute Sign-on
CEBR: CICS Execute Browse

## System / Region checks

CEMT I SYS
CEMT I TASK
CEMT I DS
CEMT I TIME

SYS → region status
TASK → active tasks (runaway tasks!)
DS → temporary storage, transient data
TIME → system time / GMT offset

## Programs
CEMT I PROG
CEMT I PROG(MYPROG)
CEMT S PROG(MYPROG)
CEMT N PROG(MYPROG)

I = Inquire
S = Set
N = Newcopy (reload program after compile)

## Transactions
CEMT I TRAN
CEMT I TRAN(ABCD)
CEMT S TRAN(ABCD) EN
CEMT S TRAN(ABCD) DIS

Check if a transaction is:
ENABLED
DISABLED
ABENDING

