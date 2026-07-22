# World of the Mainframe
In 1985, Stewart Alsop started the P.C letter, which quickly became a must-read for rapidly growing
tech industry. He would go on to create several conferences and to became an editor of InfoWorld

In 1991, he wrote: "I predict that the last mainframe will be unplugged on 15 march 1996"

Since 2010 more than 250 companies have migrated their workloads to IBM Z systems

# What does Mainframe mean?
The first use of the word mainframe was in 1964.
The concept of the mainframe came from the telecommunications industry. It was used to describe the central
system of a telephone exchange, where lines were interconnected

the term mainframe computer was used to describe the CPU, which connected to peripherals. But it
would also become synonymous for a large computer system that could handle huge amounts of data processing

Mainframe are usually designed for business purposes and are ideal for managing transactions at scale.
A supercoputer has only a franction of the mainframes capabilities

# History
The earliest computers were mainframes. These machines were housed in large rooms, often refered as Big Iron
- The first mainframe is considere to be the Harvard Mark I in 1944

# What are punch cards?
A punch card, or punched card is a piece of stiff paper marked with perforations to represent information. They were
employed as early as the 1700s. By the 1830, Charles Babbages was using punch cards for his Analytical Engine.
Holleriths business would eventually morph into IBM, and punch cards would remain a lucrative business

# Growth of the mainframe
Systems would find more usage within the business world
A critical breakthrough in mainframes for business came in 1959 with IBM's lauch of the:
- 1401 system, it used only transistors and could be mass produced.

A mainframe was often a custom device for a particular use case, such as for inventory or payroll, each 
had a unique oeprating system. 

At the heart of this was the development of the System/360 (the name referred to the 360 degrees of a compass symbolizing that the mainframe was a complete solution) this was the largest invesment during the 1960s

Initially the compay built 5 computers and 44 peripherals
- Model 20
- Model 65
- Model 75

Competition from other mainframe companies certainly existed: Sperry Rand, NCR, RCA, Honeywell, General Electric
but they were referred to as the "seven dwarfs"

# Mainframe innovation
- One breakthrough innovation was virtualization
- Another innovation in 1970s was the Universal Product Code (UPC)

# The terminal
From 1960s through the 1990s the terminal was a common way for nontechnical users to access a mainframe.
But as personal computers grew in popularity, they would become the norm for accessing mainframe, during the
1980, IBMs Disk Operating System (DOS) (DOS/360)

# Mainframe challenges
By the 1980, IBMs mainframe business was starting to come under pressure
- Growth in minicomputers, then came the PC revolutions

# Why have a mainframe?
A big reason has lasted so long is that getting rid of it would be incredibly expensive
- Performance
- Flexible compute
- Reliability


# The OS
The OS has seen a myriad of names, including OS/360, MVT, OS/VS2 and OS/390
The most current version is the z/OS. This 64-bit platform got its start in 2000 and has seen major upgrades, it has maintained backward compatibility 
as its core still much of the same functionality as the original System/360

While z/OS is similiar to typical OSs, there are still some notable differences. For example, the memory managment does not use the heap or stack
Instead, z/OS allocates memory to programs based on using large chunks or several of them

- Concurrency: 
- Spooling:Certain functions, like printing, can cause problems in terms of handling the process. Spooling manages the queue for files
- POSIX compatiblitiy

Yet z/OS is not the only OS supported on the IBM Z. There are five others.

### z/VSE
z/Virtual Stroage Extended was part of the original System/360 architecture.
But the focus for this OS has been for smaller companies. The original name was Disk Operating System (DOS). IBM's DOS was used
to describe how the system would use the the disk drive to handle processing


### z/TPF
z/Transaction Processing Facility was developed to handle IBM's semi-automatic business research environment (Sabre) airline reservation system,
which was launched in the early 1960s. The language for the system was based on assembler

### z/VM
It was introduced in 1972 when IBM developed virtualization. The z/VM allowed for the use of a type 1 hypervisor (bare-metal)

### Linux
When using linux on an IBM mainframe, there are some factors to note:
- Access: You do not use a 3270 display terminal. Instead, uses X window terminators or emulators on PCs

### KVM
Kernel based virtual machine, is an open source virtualization module for the Linux kernel

# Processor architecture
The processor architecture for the modern IBM z mainfrmame looks similtar to the original develoed in 1964

It has three main components:
- CPU
- Main storage
- Channels

A typical IBM Z system has a multiprocessor as well.

## LPAR
A logical partition (LPAR) is a form of virutalization that divides the machine into separate mainframes. Its based on a type 1
hypervisor. The current system allows for up to 40 LPARS

Each LPAr has its own OS and software. Each partition has complete independence. To allow for seamless operation across the machine,
the z/OS uses cross memory services to handle the tasks for various LPARs

Allocation of resources is flexible. For example, it is possible to use one or more processors per LPAR or to spread them across
multiple LPARS

Consider that the LPAR technology relies on Processor Resource/System Manager (PR/SM). With this a mainframe has built-in virtualization
that allows for the efficient use of CPU resources and storage for the LPARs

Another tech to tone is the system complex (sysplex), which allows for the communcation and clustering of LPARs. There are two types of
sysplex:
1. Base or mono
2. Parallel

# Disk
IBM uses different terminology to describe its mainframe disk drive. The drive is called a Direct Access Storage Device (DASD)


# Batch and online transaction processing
A program is run by using Job Control Language (JCL), and a job is scheduled to process the data

For real time processing we have OLTP (Online transaction processing)
