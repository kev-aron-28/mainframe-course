# The development environment

Thousands of people can interact with a mainframe that is managed by z/OS. But before you can get access, your employer
will provide you with the necessary login credentials.

A common approach to provide mainframe access is through the use of emulator software:
- TN3270 emulator
- File transfer protocol
- Secure Shell client (SSH)


## TSO
Time Sharing Option (TSO) has dozen of commands, depending on the products installed. In fact, for many mainframe
developers, TSO is not used much.
Why is it important? 
- It provides the foundation for  other technologies like ISPF

## ISPF
Interactive System Productivity Facility (ISPF) is a menu based system, it is fast and efficient.

## Datasets
The data is often in the form of records. Because of this, the length of each will be established beforehand
Whats more, a file is not called a file. Its known as a dataset. You need to provide a variety of parameters,
such as:
- Volume serial: The name of the DASD
- Device type: The disk device used
- Organization: Shows how data is processed, which could be sequential, random, virtual storage acces method...
- Record format: Fixed or variable
- Space: The amount reserved for the dataset

## Main types of datasets:
- Sequential file
- Partitioned dataset
- Virutal storage access

# System display and search facility (SDSF)
Is a system within z/OS that you can access via ISPF It helps with the managment of jobs. Some of its functions include
cancenling and purging jobs, viewing and searching the system log, monitoring jobs that are beign processed and controlling the scheduling of jobs

# Job Control langugage (JCL)
Scripting language. When you execute JCL, a set of sophisticated processes will be initiated and major part of this
is the job entry subsystem (JES). This coordinates and schedule the various jobs that need to be performed by the z/OS

# Mainframe tools
- DFSORT and Syncsort
Sophisticated tools from IBM and Precisely for sorting, merging, copying, and
analyzing data.

- BMC Compuware Abend-AID
Can identify, resolve, and track application and system abends.

- BMC Compuware File-AID
Helps to manage files and data across platforms

- BMC Compuware Xpediter
Includes a set of debuggers and interactive analysis tools for COBOL, PL/I, C,
and assembler applications

- ChangeMan ZMF
Allows for version control for applications.

