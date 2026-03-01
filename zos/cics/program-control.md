# CICS program control

A task may need to execute multiple programs in sequence to complete its work, A transaction can initiate only one program. while a program can call several other programs during its execution.

Program-to-program calls can occur in various ways depending on the specific requirements of the calling program.

- LINK
- XCTL
- RETURN
- LOAD
- RELEASE
- CALL

## LINK
The CICS LINK command is used to call another CICS program from the currently executing program

- Transfers control to another program and returns once execution is complete
- The calling program remains active while the called program executes
- COMMAREA can be used to pass data between programs
- The called program must be defined in CICS 

```
EXEC CICS LINK
	PROGRAM(program-name)
	[COMMAREA(data-area) LENGTH(data-area-length)]
	[CHANNEL (name)] 
	[INPUTMSG(data-area)]
	[INPUTMSGLEN(data-value)]
	[SYSID(system-name)]
	[TRANSID(name)]
	[RESP(response-field)]
	[RESP2(response-field2)]
END-EXEC.
```

- PROGRAM(program-name) - Specifies the name of the CICS program to be called.
- COMMAREA(data-area) - Specifies a communication area available to the next program that receives control. The valid range for the COMMAREA length is 0 through 32767 bytes. If the length provided is outside range, the LENGERR condition occurs.
- LENGTH(data-area-length) - Specifies the length of the COMMAREA in bytes. If any negative value provided, ZERO assumed as length.
- CHANNEL (name) - Specifies the channel name (1–16 characters) to be available to the next program that receives control.
- INPUTMSG(data-area) - Specifies the data to pass to the transaction in the TRANSID option or call a program in a multi-region environment.
- INPUTMSGLEN(data-value) - Specifies the length of the INPUTMSG. (Declaration: PIC S9(4) USAGE BINARY).
- SYSID(system-name) - specifies the remote region name to where the program link request is to be routed and mandatory entry for the remote programs.
- TRANSID(trans-id) - Specifies the remote transaction that attached to the remote region and under which it is to run the called program. If omitted, control returns to the calling program.
- RESP(response-variable) - Optional. It captures the response code of the RECEIVE MAP operation and used to check if the command executed successfully or encountered an error.
- RESP2(response2-variable) - Optional. It captures the response2 code of the RECEIVE MAP operation when the error occured.

## XCTL
