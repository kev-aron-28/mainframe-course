# Pseudoconversation

In a batch system, the system is in a continuous wait status to perform the tasks given by the user even during idle time. But in the CICS region, the system sends or displays something to the terminal (SEND), and if the same requires user action, 
then the system terminates (RETURN) the connection for the task.

When the user enters the data, the system automatically re-establishes the connection for the task to receive the data (RECEIVE). 
This technique is called Pseudo Conversation, which effectively saves CPU utilization. From the system's point of view, it effectively utilizes CPU time by terminating and reinitiating the task processing.

** Pseudo Conversation = Terminating & Reinitiating **

## Commands

SEND: Sends the data to the screen, it also terminates the control from the program,
    - SEND MAP
    - SEND TEXT
    - SEND CONTROL
RETURN : usedto establish the connection back (Reinitiates the program)
RECEIVE: Receives the data entered on the screen by the user


### SEND MAP command

```
EXEC CICS SEND
     MAP(map-name)
     MAPSET(mapset-name)
	 FROM (symbolic-map-area)
	 LENGTH (symbolic-map-area-length)
     DATAONLY|MAPONLY
     CURSOR(cursor-position)
     ERASE
	 PRINT|FREEKB|ALARM|FRSET
     RESP(response-variable)
	 RESP2(response2-variable)
END-EXEC.
```

- MAP(map-name) - specifies the map name which needs to be display on the terminal.
- MAPSET(mapset-name) - Optional when map name coded. It specifies the mapset name that contains the map. A mapset can have multiple maps. Mapset should be defined in Program Processing Table (PPT).
- FROM(symbolic-map-area) - Optional. It contains the data to be passed to map. If the FROM parameter is not coded, CICS automatically locates the corresponding symbolic map area (mapnameO) and sends it to the terminal.
- LENGTH (symbolic-map-area-length) - Optional. It specifies the length of the data. The sending data area length should not exceed the length of the mapped data area.
- DATAONLY - Optional. It sends only the data fields of the map without the formatting or labels. It is used to update data on the screen without overwriting the static parts of the map.
- MAPONLY - Optional. It specifies only default MAP data to be written to the screen. If the MAPONLY option is coded, FROM option is not required. If MAPONLY coded along with FROM, FROM option will be ignored.
- CURSOR(cursor-position) - Optional. It specifies the cursor's position on the terminal after the map is displayed. If no value is coded, then the cursor will be positioned at the first unprotected field of the MAP.
- ERASE - Optional. Clears the screen before displaying the map. It is responsible for the below three tasks
    - Erases the screen buffer before sending the map to the screen.
    - Erases the screen print buffer before sending the map to the screen.
    - Place the cursor on the upper left corner of the MAP before sending the map to the screen.
- PRINT - Optional. This option specifies that map printing should be initiated at the printer.
- FREEKB - Optional. This option indicates that the keyboard should be unlocked after the data has been written. If the FREEKB option is not used, the keyboard will remain locked.
ALARM - Optional. This option activates the audible alarm feature of the 3270.
FRSET - Optional. This option specifies that the modified data tags (MDTs) of all fields should be reset to their unmodified state before any map data is written to the buffer.
RESP(response-variable) - Optional. It captures the response code of the SEND MAP operation and used to check if the command executed successfully or encountered an error.
RESP2(response2-variable) - Optional. It captures the response2 code of the RECEIVE MAP operation when the error occured.

### SEND TEXT command

The SEND TEXT command is used to send unformatted text directly to a terminal screen. SEND TEXT can do the following things:
- If the text exceeds a line, SEND TEXT can split it up into multiple lines without splitting words.
- If the text exceeds a page, SEND TEXT can split into multiple pages according to the terminal size.

Single SEND TEXT command can send up to 4096 bytes of data stream in a single execution

``` cics
EXEC CICS 
	 SEND TEXT
	 FROM (data-area)
	 LENGTH (data-area-length)
     CURSOR(cursor-position)
     ERASE
	 PRINT|FREEKB|ALARM
	 HEADER (header-data)
	 TRAILER (trailer-data)
	 JUSTIFY (position-value)
     RESP(response-variable)
END-EXEC.
```

- FROM(data-area) - Optional. It contains the data to be passed to the screen.
- LENGTH (data-area-length) - Optional. It specifies the length of the data.
- CURSOR(cursor-position) - Optional. It specifies the cursor's position on the terminal after the data is displayed. If no value is coded, then the cursor will be positioned at the top left corner on the screen.
- ERASE - Optional. Clears the screen before displaying the text. 
- RESP(response-variable) - Optional. It captures the response code of the SEND MAP operation and used to check if the command executed successfully or encountered an error.
- PRINT - Optional. This option specifies that text printing should be initiated at the printer.
- FREEKB - Optional. This option indicates that the keyboard should be unlocked after the data has been written. If the FREEKB option is not used, the keyboard will remain locked.
- ALARM - Optional. This option activates the audible alarm feature of the 3270.
- HEADER (header-data) - Specifies the header data to be placed at the beginning of each page of text data.
- TRAILER (trailer-data) - Specifies the text data area that contains trailer data to be placed at the bottom of each page.
- JUSTIFY (position-value) - Specifies the page line at which the text data is to be positioned. The data value must be a halfword binary value from 1 through 240.

### SEND CONTROL command
The SEND CONTROL option is used to send the control to the terminal without any map or text data. This provides a dynamic way for transmitting control to the terminal.

``` cics
EXEC CICS SEND CONTROL
     CURSOR(cursor-position)
     ERASE
     RESP(response-variable)
	 PRINT|FREEKB|ALARM|FRSET
END-EXEC.
```

- CURSOR(cursor-position) - Optional. It specifies the cursor's position on the terminal after the map is displayed.
- ERASE - Optional. Clears the screen. It is responsible for the below three tasks -
    - Erases the screen buffer.
    - Erases the screen print buffer.
    - Place the cursor on the upper left corner of the screen.
- RESP(response-variable) - Optional. It captures the response code of the operation and used to check if the command executed successfully or encountered an error.
- PRINT - Optional. This option specifies that prints should be initiated at the printer.
- FREEKB - Optional. This option indicates that the keyboard should be unlocked after the data has been written. If the FREEKB option is not used, the keyboard will remain locked.
- ALARM - Optional. This option activates the audible alarm feature of the 3270.
- FRSET - Optional. This option specifies that the modified data tags (MDTs) of all fields should be reset to their unmodified state before any data is written to the buffer.

### RECEIVE MAP
The RECEIVE MAP command is used to retrieve input data entered by a user on a 3270 terminal screen. 

```
EXEC CICS 
	RECEIVE MAP(map-name)
     MAPSET(mapset-name)
     INTO(data-area)
     LENGTH(data-area-length)
	 TERMINAL
	 ASIS
     RESP(response-variable)
	 RESP2(response2-variable)
END-EXEC.
```

- MAP(map-name) - specifies the map name from which input is received.
- MAPSET(mapset-name) - Optional when map name coded. It specifies the mapset name that contains the map. A mapset can have multiple maps. Mapset should be defined in Program Processing Table (PPT).
- INTO(data-area) - Optional. specifies the data area where the received data needs to be written. If INTO is not coded, then CICS automatically finds the symbolic map area for the MAP and places the data in the corresponding input fields. The fields can be referred to in the program by referring to fieldname+I.
- LENGTH (symbolic-map-area-length) - Optional. It specifies the length of the data. The receiving data area length should not exceed the length of the mapped data area.
- TERMINAL - Optional. Specifies the data needs to be read from the terminal that initiated the transaction. TERMINAL is mandatory if INTO and LENGTH are not specified.
ASIS - Optional. Indicates that the data entered on the screen will remain in its original case. This allows the current task to receive messages containing both uppercase and lowercase characters from the map.
- RESP(response-variable) - Optional. It captures the response code of the RECEIVE MAP operation and used to check if the command executed successfully or encountered an error.
- RESP2(response2-variable) - Optional. It captures the response2 code of the RECEIVE MAP operation when the error occured.

### EXEC CICS RETURN
The RETURN command is used to end a transaction or pass control to another program or transaction. It is an essential command in CICS COBOL programming, ensuring a smooth handover of control within the system.

- Terminate the current task and return control to CICS
- Pass control to another transaction or program.
- Pass data using a COMMAREA (Communication Area).
- Schedule another transaction to run after termination.

- TRANSID(trans-id) - Specifies the next transaction ID to start after the return. If omitted, the task ends.
- COMMAREA(data-area) - Specifies a communication area available to the next program that receives control. The valid range for the COMMAREA length is 0 through 32767 bytes. If the length provided is outside range, the LENGERR condition occurs.
- LENGTH(data-area-length) - Specifies the length of the COMMAREA in bytes. If any negative value provided, ZERO assumed as length.
- IMMEDIATE - used to trigger the next transaction specified with TRANSID immediately.
- CHANNEL (name) - Specifies the channel name (1–16 characters) to be available to the next program that receives control.
- INPUTMSG(data-area) - Specifies the data to pass to the transaction in the TRANSID option or call a program in a multi-region environment.
- INPUTMSGLEN(data-value) - Specifies the length of the INPUTMSG. (Declaration: PIC S9(4) USAGE BINARY).
- RESP(response-variable) - Optional. It captures the response code of the RECEIVE MAP operation and used to check if the command executed successfully or encountered an error.
- RESP2(response2-variable) - Optional. It captures the response2 code of the RECEIVE MAP operation when the error occured.

