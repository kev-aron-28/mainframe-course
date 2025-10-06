# Tarea
STC es una unidad de memoria basica que tiene que ser arracanda,
como un servicio o un demonio en win or lin

# JES2
Job entry subsystem
Permite que todo este trabajando en el sistema, es lo primero que arranca

# VTAM
Virtual Telecomunications access method

# TCP/IP Transmision control and internet protocol

# WLM Work load manager
Controla como se entrega los recursos del pc

# RACF Resource access control facility

# SMS Storage managment subsystem

# HSM Hierachical storage manager

# MQ Message queuing

# DB2 gestor de base de datos relacionales

# CICS Customer Information Control system

# IMS Information managment system

# TSO Time Sharing option

# ISPF Interactive system productivity facility

# SDSF Spool Display and Search Facility

# Spool Simultaneous Peripheral OPerations online

# Syslog 

-----------------------
# Jobs batch

# Usuarios
Ver info de un usuario
En ISPF:
## tso lu ibmuser
## tso profile

Quitar prefijo en los dataset
En ISPF:
## tso profile noprefix
para activar
## tso profile prefix(ibmuser)

# Recursos compartidos

Hoy en día, practicamente todas las compañías no tienen solamente una copia de un sistema operativo, si no que tienen diferentes imágenes para los entornos de producción, desarrollo y test, o para diferentes partes del negocio.
 Esto les permite también tener mejor margen y elasticidad a la hora de solucionar problemas.


Cada imagen será una partición lógica, se les llama LPAR, el z15, al igual que el modelo anterior el z14, pueden 
tener hasta 85 particiones lógicas. A cada LPAR se le asignarán un número de procesadores y una cantidad de memoria 
determinada.

Ahora, puede haber LPARs que compartan recursos dentro del sistema operativo, es decir, 
dentro de z/OS, comparten ficheros, tareas, spool, etc., y cooperan entre ellas para procesar información. 
Accediendo a una LPAR puedes manejar todas las LPARs.


Este concepto se llama SYSPLEX, puede ser monoplex cuando solo se trata de una LPAR, o multiplex cuando hay varias, 
pero normalmente se refiere a SYSPLEX cuando hay más de una LPAR. 
Con esto además se consigue que si hay un problema en una LPAR de ese SYSPLEX, no perderemos el servicio, ya 


Aquí entra en juego una herramienta, XCF, cross system coupling facility, 
utilidad de enganche de sistemas cruzados, ya que esta lo que hace es permitir a programas y 
tareas de un sistema, comunicarse con otros sistemas del SYSPLEX.


A parte, normalmente tendremos unas LPARs especiales creadas que van a ser las
COUPLING FACILITY, utilidad de enganche, que es un espacio de memoria común para compartir recursos.
En este caso será un SYSPLEX en paralelo.
Por último, todos los procesadores dentro del SYSPLEX tienen que tener exactamente la misma hora, 
no puede haber segundos de desfase, de esto se encarga el STP (Server Time Protocol), 
protocolo de la hora del servidor, que sincronizará la hora de todos los sitemas del SYSPLEX.





