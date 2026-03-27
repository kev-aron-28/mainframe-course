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
Command is usedc to transfer control permanently from one program to another. Unlike the LINK command, XCTL does not return control to the calling program

CICS XCTL command is useful when:
- Current program does not need to resume after calling another program
- You want to replace the currently running program with another running program
- Reducing memory usage by freeing resources used by the calling program

``` cobol
EXEC CICS XCTL
	PROGRAM(program-name)
	[COMMAREA(data-area) LENGTH(data-area-length)]
	[CHANNEL (name)] 
	[INPUTMSG(data-area)]
	[INPUTMSGLEN(data-value)]
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
- RESP(response-variable) - Optional. It captures the response code of the RECEIVE MAP operation and used to check if the command executed successfully or encountered an error.
- RESP2(response2-variable) - Optional. It captures the response2 code of the RECEIVE MAP operation when the error occured.

## LOAD
Load statement is used to dynamically load a program, mapset or a table into main memory at runtime. This eliminates the need for pre-linking or pre-loading a module,
improving memory efficiency.

When a CICS program uses the LOAD command the requested resources is fetched from storage or from load library

THis is useful:
- A program needs to load another module dynamically
- A table or file needs to be loaded into memory on demand
- A mapset needs to be accessed dynamically

``` cobol
EXEC CICS LOAD
     PROGRAM(program-name)
     [LENGTH(length)]
	 [FLENGTH(length)]
     [SET(ptr-ref)]
	 [ENTRY(ptr-ref)]
	 [HOLD]
     [RESP(response-field)]
     [RESP2(response-field2)]
END-EXEC.
```

- PROGRAM(program-name) - Specifies the name of the CICS program, table, or mapset to load.
- LENGTH(length) - Optional. It specifies the size of the memory area allocated for the loaded resource. LENGTH is a half-word binary value. The program, table, or map length can be up to 32K. If it exceeds 32K, use the FLENGTH parameter for the LOAD command.
- FLENGTH(length) - Optional. The FLENGTH option serves the same purpose as the LENGTH option but is intended for larger programs, tables, or maps exceeding 32k in length. FLENGTH is a 4-byte (full-word binary area) field.
- SET(ptr-ref) - Optional. It specifies the reference address pointer where a program, table, or map is loaded.
- ENTRY(ptr-ref) - Optional. It is used to specify the address of the entry point for the application program, table, or map that has been loaded. If the ENTRY option is utilized in a multiplatform environment, the LOAD function will return a NULL pointer.
- HOLD - Optional. It specifies that the loaded program, table, or map should not be released even after the LOAD command has completed. This state will continue until the RELEASE command is issued.
If the HOLD option is omitted, the program, table, or map will be released automatically when the LOAD command finishes. The HOLD option is beneficial for programs or map sets that are executed repeatedly, as it helps reduce loading time before execution.
- RESP(response-variable) - Optional. It captures the response code of the LOAD operation and used to check if the command executed successfully or encountered an error.
- RESP2(response2-variable) - Optional. It captures the response2 code of the LOAD operation when the error occured.

## RELEASE
The RELEASE command is used to remove a program, table, or mapset that was previously loaded into main memory with a LOAD command.

- Marks a loaded program, mapset, or table as eligible for removal from memory
- Does not immediatly remove the resource, but allows CICS to reclaim memory when needed
- Optimized storage utlilization by freeing unused resources

``` cobol
EXEC CICS RELEASE
    PROGRAM(program-name)
    [RESP(response-field)]
	[RESP2(response-field2)]
END-EXEC.
```
- PROGRAM(program-name) - Specifies the name of the CICS program, table, or mapset to be released from memory.
- RESP(response-variable) - Optional. It captures the response code of the RELEASE operation and used to check if the command executed successfully or encountered an error.
- RESP2(response2-variable) - Optional. It captures the response2 code of the RELEASE operation when the error occured.


## CALL
The CALL statement can serve as an alternative to the LINK and XCTL commands. It is used to invoke another program that is at the same level or a lower level, with the expectation that control will return to the calling program
Any program that is called using the CALL statement must have a program definition (PPT)

Used when:
- CALL is particulary useful when the subprogram is written solely in COBOL and does not contain any CICS statements
- It is also advantageous in scenarios where a subprogram is called multiples times, as this can enhance efficiency and performance
- When a subprogram is called repeatedly, CALL works much faster and utilizes less memory

Disadvantages:
- Calls cannot be debugged as they are invisible to CICS
- The call cannot be used for programs in remote regions
- For multiple calls the working storage of the subprogram retains its values so use caution when calling it a second time


- Static call
``` cobol
CALL 'PROG1' USING parameter-1, parameter-2.
```

- Dynamic call
``` cobol
CALL WS-PROG-NAME USING parameter-1, parameter-2.
```