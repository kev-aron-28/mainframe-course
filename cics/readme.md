# CICS
In traditional batch processing systems, multiple jobs can execute in parallel. However, when jobs require exclusive access to the same resource—such as a sequential file opened for update—resource locking mechanisms may serialize execution, causing one job to wait until the other releases the resource.

The main limitation of batch processing is not a lack of parallelism, but higher latency and delayed results, since jobs are typically scheduled and executed asynchronously.

To complement batch processing, IBM introduced CICS to support online transaction processing, enabling immediate responses and high-volume concurrent user access, rather than to replace batch or provide parallel execution.



# What is CICS?

CICS stands for "Customer Information Control System".

It is an Online Transaction Processing (OLTP) system and application server that provides online transaction management and connectivity for applications running on mainframes under z/OS

CICS offers services that allow different transactions (tasks) to run simultaneously, producing instant results. 

A CICS application consists of a collection of related programs that work together to carry out a business operation.

CICS is a transaction monitor that:
- Accepts requests
- Dispatches them to programs
- Manages transactions, security, and rollback
- Reuses memory and threads efficiently

CICS supports high-speed, high-volume online transaction processing

# Therminology

## Conversational programming
involves keeping a program active and waiting for user input during its execution.

Key Points:
- The program sends a message to the user and waits for a response before proceeding to the next step.
- Since the program occupies system resources during the user's "think time", it can lead to resource bottlenecks.

## Pseudo-Conversational Programming
optimizes conversational programming by releasing resources during user think time. This approach enhances system performance and scalability.

Key Points:

- The program sends a message and terminates, specifying the next transaction to start upon user response.
- When the user responds, CICS restarts the program, passing the context to resume from the last step.

## Task
A task in CICS is a single instance of work created when a user initiates a transaction by entering a Transaction Identifier (TRANID). Each task runs independently under the control of CICS and executes the associated program(s) until completion.

## Multitasking 
Multitasking refers to an operating system's ability to execute multiple tasks simultaneously, whether those tasks involve the same program or different ones. CICS manages multitasking within its own region, creating an environment where several CICS tasks can run concurrently. This means that CICS can handle multiple user requests at the same time, enhancing the system's efficiency and responsiveness.

## Non-reentrant program
A non-reentrant program in CICS is one that cannot safely be executed by multiple concurrent tasks because it modifies shared storage, typically WORKING-STORAGE.

## Reentrant Program 
A reentrant program is designed to be safely executed by multiple tasks concurrently without interfering with each other.
This is achieved by ensuring that the program does not modify itself during execution

## Quasi-Reentrant Programs
A quasi-reentrant program in CICS is one that can safely be used by multiple tasks, even though CICS may interrupt and resume tasks in a manner that doesn't align with traditional reentrancy models.
CICS obtains a separate copy of working storage for each execution of an application program to ensure that programs cannot interfere with each others working storage. Quasi-reentrancy allows programs to access globally shared resources.

## Multithreading
Multithreading is a subset of multitasking where multiple tasks share the same program code.

# CICS components
- 3270 terminal
- Monitor
- Keyboard
- Transaction: Each transaction is executed by submitting its TRANSID to CICS. The CICS transaction identifier (TRANSID) is a 4-character name defined in the program control table (PCT). A single transaction can run one or more application programs as needed during processing.
- Task: A task is the execution instance of a transaction.
- Unit of work: equence of actions that must be completed before any individual action can be considered complet
- Application program: A CICS application is a group of related programs that work together to perform a specific business operation. 
- Map:  A map defines the layout and structure of screens displayed to the user in a terminal.
- File: Files are storage resources used by CICS to manage and store data.

# Control programs and tables
CICS core, also known as CICS Nucleus, is built with IBM-supplied control programs and user-defined control tables. Simply writing an application program does not automatically make it available to the CICS system. The application developer must take several steps to ensure the application program can be executed in the CICS region

And the initial steps is this process involvesa making entries in the control tables

The CICS core consists of IBM-supplied CICS control programs and the corresponding control tables.

- when a transaction is initiated, the related program name is retrieved from the Program Control Table (PCT) and executed to fulfill the request.

Whenever new programs, transactions, or resources are introduced to CICS, their entries must be updated in the control tables to ensure they are accessible within the CICS region.

## Control tables
Control tables are structured data storage entities within CICS that contain resource definitions and configuration information. 
These tables define the behavior of CICS resources like transactions, programs, files, terminals, and more.
- New resources (e.g., programs, terminals, files) must be added to the relevant control tables to make them available for use in the CICS region.
- Control tables are queried and updated by control programs during the execution of tasks.

### Program Control Table (PCT)
Program Control Table (PCT) contains entries that map transaction identifiers (TRANSIDs) to their corresponding application programs. 
CICS will not recognize a transaction unless it is registered in the PCT. Therefore, every CICS transaction must have an entry in this table.
The PCT table includes mandatory entries for TRANID (a unique transaction identifier with 1-4 characters), and PROGRAM (the name of the program).

### Processing program table (PPT)
All CICS programs, including those that do not have a corresponding transaction, as well as MAPS, must be registered in the Processing Program Table (PPT). 
The PPT table requires mandatory entries for PROGRAM (Program name) and MAPSET (Mapset name).

### FIle control table (FCT)
All VSAM files used in CICS programs must be registered in the File Control Table (FCT). The File Control Program (FCP) refers to the FCT for processing.

Both the PATH and the alternate index should be registered alongside the VSAM file entries. The FCT contains several entries: ACCMETH (data access method), DATASET (dataset name), FILE (file name), and SERVREQ (operations to be performed on the file) are mandatory entries.

### Destination Control Table (DCT)
 The transient data program (TDP) refers to DCT and performs the input/output operations on the TDQs. The DCT table has TYPE (type of TDQ) and destination ID (DESTID) as mandatory entries and TRANSID and TRIGLEV as optional entries.
 defines output destinations such as transient data queues and printers, controlling where and how messages generated by CICS programs are sent.

###  Temporary Storage Table (TST)
If temporary storage queues need recovery during a system crash, they must be registered in the temporary storage table (TST). If recovery is not required, registration in the temporary storage table (TST) is not required.

### Resource Control Table (RCT)
All DB2 plans should be registered in the Resource control table (RCT). If a new plan created for DB2 commands used in the program, then the PLAN should also be registered in the RCT table.

### Sign-on Table (SNT)
All used IDs and passwords that require login access to the CICS region must be registered in the sign-on table (SNT).

### Terminal Control Table (TCT) 
Terminal Control Table (TCT) contains definitions for each terminal connected to the CICS region, specifying attributes such as terminal identifiers, types, and associated properties

### Program List Table (PLT)
The programs that need to be automatically started during CICS start-up and shut-down should be registered in the program list table

## Control programs

Control programs are system-level programs in CICS responsible for interacting with control tables. They:
- Interpret the data in control tables.
- Manage tasks and resources.
- Ensure that the correct resources are allocated and used for each transaction.

### Program Control Program (PCP)
The program control program (PCP) manages the interaction between CICS and application programs. The application program name must be registered in the processing program table (PCT). If the program is not registered, it won’t be recognized by CICS.

### File Control Program (FCP)
The File Control Program (FCP) offers file manipulation services to application programs. These services include reading, updating, adding, and deleting records in files.

### Terminal Control Program (TCP)
Terminal Control Program (TCP) provides the communication services between application programs and terminals. 

### Temporary Storage Control Program (TSP)
The Temporary Storage Control Program (TSP) controls temporary storage queues, which allow applications to temporarily store data during transaction processing.

### Task Control Program (KCP)
A Task Control Program (KCP) manages the initiation, scheduling, and termination of tasks within CICS, ensuring efficient multitasking and resource utilization

# Environment
In a z/OS system, CICS provides a functional layer for managing transactions, with the operating system serving as the final interface with the computer hardware

CICS Transaction Server (CICS TS) is the version of CICS that acts as an assistant to the z/OS operating system and functions as an administrative coordinator for other applications.

CICS TS operates as an intermediary between application programs, database managers, and access methods. It supports the system by efficiently handling complex tasks or transactions, allowing the system to focus on processing its regular non-transactional workload.

A z/OS system may have multiple instances of CICS (i.e., multiple systems) running simultaneously. Each instance of CICS starts as a separate address space within the z/OS environment.

# Cobol programming restrictions and requirements

- Identification division:
    - IDENTIFICATION DIVISION header is mandatory.
    - PROGRAM-ID is mandatory.
- environment division:
    - ENVIRONMENT DIVISION header is mandatory.
    - Other entries are optional and not needed.
- data division:
    - DATA DIVISION header entry is mandatory.
    - FILE SECTION is not required.
    - WORKING-STORAGE SECTION is needed. The length of working storage should not exceed 64k.
    - LINKAGE SECTION is optional. However, it is mandatory when communicating with other programs in the CICS region.
- procedure division
    - PROCEDURE DIVISION header entry is mandatory.
    - Any COBOL file commands for OPEN, CLOSE, READ, START, REWRITE, WRITE, or DELETE statements. Instead, use CICS commands to retrieve, update, insert, and delete data.
    - Do not use the ACCEPT statement in a CICS program.
    - Do not use DISPLAY...UPON CONSOLE and DISPLAY...UPON SYSPUNCH. DISPLAY to the system logical output device (SYSOUT, SYSLIST, SYSLST) is supported.
    - Do not use STOP "literal". STOP RUN is allowed.
    - There are restrictions on the use of the SORT statement. Do not use MERGE.
    - Do not use user-specified parameters in the main program.
    - Do not use USE declaratives.

# Services provided to application programs
- Terminal Control Services
- File Control Services
- Database Control Services
- Task Control Services
- Program Control Services
- Temporary Storage and Transient Data Control Services
- Interval Control Services
- Storage Control Services
- Dump and Trace Control Services


# CICS Supplied transactions

CEBR	Temporary storage browse	Browses temporary storage queues and to delete them. CEBR is used to transfer a transient data queue to temporary storage to look at its contents and to re-create the transient data queue when finished.
CECI	Command-level interpreter	Provides an interface to test and execute CICS commands interactively, aiding in application development and debugging.
CEDA	Resource Definition Online (RDO)	Allows defining, modifying, and managing CICS resources dynamically while the system is running, making it easier to configure resources without system restarts.
CEDF	Execution Diagnostic Facility	Offers a debugging tool that allows step-by-step execution of application programs, helping developers identify and resolve issues during program execution.
CEMT	Master Terminal Transaction	Invokes all the master terminal functions. The master terminal program provides dynamic user control of the CICS system. Using CEMT, an operator can inquire about and change the values of parameters used by CICS, alter the status of the system resources, terminate tasks, and shut down the CICS system.
CEMN	CICS monitoring facility	Inquire on the settings for the CICS monitoring facility and to change some of the settings without needing to restart CICS.
CESN	sign on	Sign on the user to CICS region by using a password as authorization. CESN does not support password phrases.
CESF	sign off	Sign off the user from the CICS system.
CLDM	CICS load module map	Transaction CLDM is used to generate a CICS load module map.

# CICS command level codign?
CICS command-level coding refers to writing application programs that interact with the CICS environment using CICS-provided commands. These commands enable programs to utilize CICS services such as file handling, task management, communication with terminals, and database operations.

CICS operations are carried out by using specific CICS commands within the application program. To execute these commands, a command-level interface known as EXECUTE CICS or EXEC CICS is required. When a CICS service is needed, these commands must be coded between the EXEC CICS and END-EXEC statements to clearly distinguish them from the rest of the application program code. 

```
EXEC CICS <COMMAND>
    [OPTIONS]
    [RESP(response-variable)]
    [END-EXEC].
```

## Response handling
Response handling captures the result of a CICS command execution. It helps determine whether the command was successful or encountered an error.

1. RESP Option: Use the RESP option in a command to capture the response code in a variable.
```
EXEC CICS READ
    FILE('CUSTOMER-FILE')
    INTO(DATA-AREA)
    KEY(ACCOUNT-NUMBER)
    RESP(RESPONSE-CODE)
    END-EXEC.

IF RESPONSE-CODE = NOTFOUND
    DISPLAY 'Record not found'
ELSE IF RESPONSE-CODE = NORMAL
    DISPLAY 'Record retrieved successfully'
END-IF.
```

2. EIBRESP Field: The Execution Interface Block (EIB) contains the EIBRESP field, which automatically stores the response code after a command.
```
EXEC CICS READ
    FILE('CUSTOMER-FILE')
    INTO(DATA-AREA)
    KEY(ACCOUNT-NUMBER)
    END-EXEC.
	
MOVE EIBRESP TO RESPONSE-CODE.
```

