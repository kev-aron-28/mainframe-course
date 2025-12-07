# idcams
Es la utility principal para trabajar con VSAM (Virtual Storage Access Method)
IDCAMS = Integrated Data Control Access Method Services

Se usa para:

Crear datasets VSAM
- KSDS (Key Sequenced File)
- ESDS (Entry Sequenced)
- RRDS (Relative Record)

✔ Borrarlos
✔ Listar información de VSAM (LISTCAT)
✔ Definir catálogos
✔ Copiar/backup VSAM (REPRO)
✔ Inicializar clusters
✔ Imprimir contenido VSAM
✔ Renombrar datasets
✔ Migrar o recall con HSM

VSAM = Virtual Storage Access Method

VSAM is a file management system used on IBM mainframes.
It provides advanced methods to store, organize, and access data.

Why VSAM exists?
- VSAM was created to handle:
- Large datasets
- Fast access
- Indexed data
- High-performance record retrieval
- Dynamic insert/update/delete

Standard sequential datasets can’t do this efficiently

# Types of VSAM datasets

1. KSDS (Key-Sequenced Data Set)
Most used VSAM type
Records stored by key
Like a database index

Allows:
Fast search by key
Insert/update/delete without rewriting entire file

2. ESDS (Entry-Sequenced Data Set)
Records stored in the order they were added
No key
Can only append

3. RRDS (Relative Record Data Set)
Records accessed by relative record number (RRN)
Example: “give me record number 50”

4. LDS (Linear Data Set)
Low-level, block-addressable storage
Used by DB2, VSAM catalogs, etc.

# Most common in IDCAMS

## LISTCAT - description of a dataset
Sintax
LISTCAT
     ALL
   | LEVEL(level)
   | ENTRY(entryname)
   | ENTRIES(entryname)
   [ ALLOCATION | CATALOG | CLUSTER | SPACE ... ]


 //STEP1 EXEC PGM=IDCAMS
 //SYSPRINT DD SYSOUT=*
 //SYSIN DD *
    LISTCAT ENT('KEVIN.DATA.KSDS')
 /*

## DEFINE - creating VSAM datasets
DEFINE CLUSTER (
        NAME(name)
        INDEXED
        KEYS(length offset)
        RECORDSIZE(avg max)
        FREESPACE(ci ca)
        VOLUMES(volser)
     )
     DATA ( NAME(name.DATA) )
     INDEX ( NAME(name.INDEX) )

//STEP1 EXEC PGM=IDCAMS
//SYSPRINT DD SYSOUT=*
//SYSIN DD *
  DEFINE CLUSTER (
       NAME(KEVIN.KSDS.FILE)
       INDEXED
       KEYS(10 0)
       RECORDSIZE(80 80)
       FREESPACE(10 10)
       VOLUMES(MYVOL)
  )
  DATA (NAME(KEVIN.KSDS.FILE.DATA))
  INDEX(NAME(KEVIN.KSDS.FILE.INDEX))
/*


