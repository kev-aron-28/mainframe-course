# Datasets

Max len is 44
It can contain any spacial char as long as is not the first char
Not .. allowed, only . as separator

# Types

1. Basic Dataset Types
a) Sequential Dataset
The simplest type.
Stores data as a sequence of records.
Records are read one after another.
Used for logs, reports, or simple input/output files.


b) Partitioned Dataset (PDS)

Contains members, which are like separate files inside the dataset.
Ideal for source code, JCL libraries, macros.
Each member has its own name (usually 1–8 characters).
PDS has a directory block to manage members.
Example: USER.JCLLIB(MYJOB) → MYJOB is a member.

c) Partitioned Dataset Extended (PDSE)

Enhanced version of PDS:
No limit on number of members like PDS.
Members can be added and deleted without manually reclaiming space.
Better for source libraries and JCL that change often.
Syntax is similar to PDS, but allocated as PDSE.

d) VSAM Datasets

VSAM (Virtual Storage Access Method) is a high-performance dataset type for indexed access.
KSDS (Key-Sequenced Data Set)
Records are stored in key order.
Supports random and sequential access.
Used for databases or indexe
ESDS (Entry-Sequenced Data Set)
Records are stored in insertion order.
Mainly sequential access, but can have relative pointers.
Often used for log files or sequential records.
RRDS (Relative Record Data Set)
Access records by position (relative record number).
Useful when you know exactly which record you want.
LVDS (Linear VSAM Dataset)
Less common, used for linear storage.


f) Cataloged vs Non-Cataloged Datasets

Cataloged: Registered in z/OS Catalog, can be referred to by name easily.
Non-Cataloged: Must provide full dataset location or allocation info; usually temporary or test datasets.

g) GDG (Generation Data Group)

Series of related datasets (generations):
Example: LOGS.DATASET.G0001V00, LOGS.DATASET.G0002V00
Supports automatic versioning and easy cleanup.
Useful for daily batch files, backups, or logs.

LRECL Logical Record Length









