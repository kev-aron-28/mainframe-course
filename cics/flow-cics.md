# Control flow of a CICS transaction

1. COPY DFHAID on working storage and needed copy book for the view.

``` cobol
WORKING-STORAGE SECTION.   
 ADDING NEEDED COPYBOOKS   
COPY DFHAID.               
COPY PRAC2.                
```

2. define ws-commarea in working-storage

``` cobol
DATA DIVISION.                      
WORKING-STORAGE SECTION.            
 ADDING NEEDED COPYBOOKS            
COPY DFHAID.                        
COPY PRAC2.                         
                                    
01 WS-TRANSID PIC X(4) VALUE 'PR02'.
01 WS-OPTYPE  PIC X(4).             
01 WS-RESULT PIC 9(5) VALUE 0.      
01 WS-NUM1   PIC 9(5) VALUE 0.      
01 WS-NUM2   PIC 9(5) VALUE 0.      
01 WS-VALIDATE-ST PIC X VALUE 'N'.  
   88 WS-ERROR VALUE 'Y'.           
   88 WS-OK    VALUE 'N'.           
01 WS-COMMAREA.                     
 05 WS-VAL PIC X.                   
```

3. define linkage section with dfhcommarea

``` cobol
LINKAGE SECTION.    
01 DFHCOMMAREA.     
 05 WS-VAL PIC X.                    
```

4. On procedure division inside the main you check if its the first time 
with eibcalen
``` cobol
MAIN.                        
    IF EIBCALEN = 0 THEN     
      PERFORM INIT-PROGRAM   
      PERFORM FIRST-TIME     
    ELSE                     
      PERFORM GET-SCREEN     
    END-IF.                  
```

5. You have to initialize the map depending on the type of data

```
MOVE LOW-VALUES TO SCRN1I.
```

5. FIRST-TIME procedure only sends the map and returns to transaction so you can have pseudoconversational
programming

``` cobol
FIRST-TIME.                            
    EXEC CICS SEND                     
       MAPSET('PRAC2')                 
       MAP('SCRN1')                    
       FREEKB                          
       ERASE                           
    END-EXEC                           
                                       
    EXEC CICS RETURN                   
      TRANSID(WS-TRANSID)              
      COMMAREA(WS-COMMAREA)            
      LENGTH(1)                        
    END-EXEC.                          
```

6. The second time you are supposed to get data from the client and you have to put the data
into some structure, tipically SCRNI

``` cobol
 GET-SCREEN.                                 
     EXEC CICS RECEIVE MAPSET('PRAC2')       
       MAP('SCRN1')                          
       INTO(SCRN1I)                          
     END-EXEC                                
* FIRST WE CHECK WHICH KEY THE USER PRESSED  
     PERFORM CHECK-KEY.                      
```

7. You have to check the key the user pressed with EIBAID
``` cobol
CHECK-KEY.                             
    EVALUATE TRUE                      
      WHEN EIBAID = DFHENTER           
        PERFORM PROCESS-DATA           
        PERFORM SEND-SCREEN            
      WHEN EIBAID = DFHPF3             
         PERFORM EXIT-PROGRAM          
    END-EVALUATE.                      
```

8. Evaluate the the data and move it into your own ws-data

``` cobol
   IF NUM1I IS NOT NUMERIC          
     OR NUM2I IS NOT NUMERIC        
   THEN                             
     MOVE 'MUST BE NUM' TO RESO     
     SET WS-ERROR TO TRUE           
   ELSE                             
     MOVE NUM1I TO WS-NUM1          
     MOVE NUM2I TO WS-NUM2          
   END-IF                           
```

9. Then you have to send the screen again

``` cobol
SEND-SCREEN.                         
    EXEC CICS SEND MAP('SCRN1')      
      MAPSET('PRAC2')                
      FROM(SCRN1O)                   
      ERASE                          
      FREEKB                         
    END-EXEC                         
                                     
    EXEC CICS RETURN                 
      TRANSID(WS-TRANSID)            
      COMMAREA(WS-COMMAREA)          
      LENGTH(1)                      
    END-EXEC.                        
```

10. To exit a program in CICS you do
``` cobol
EXEC CICS RETURN   
END-EXEC.
```