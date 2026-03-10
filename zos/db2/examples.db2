CREATE STOGROUP STOG1            
VOLUMES(SBSYS1)                  
VCAT DSNCAT;                     
                                 
CREATE DATABASE LIBRARY          
STOGROUP STOG1                   
BUFFERPOOL BP0;                  
                                 
CREATE TABLESPACE LIBTABLE       
IN LIBRARY                       
USING STOGROUP STOG1             
PRIQTY 500                       
SECQTY 100                       
BUFFERPOOL BP0                   
CLOSE YES;                       


CREATE TABLE BOOK(                                           
ID INTEGER NOT NULL,                                         
NAME CHAR(100) NOT NULL,                                     
AUTHOR CHAR(100) NOT NULL,                                   
AVAILABLE CHAR(1),                                           
PRIMARY KEY (ID)                                             
) IN LIBRARY.LIBTABLE;                                       
                                                             
INSERT INTO BOOK VALUES (1,'CLEAN CODE','ROBERT MARTIN','Y');