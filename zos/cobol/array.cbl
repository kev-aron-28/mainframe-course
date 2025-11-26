 # ARRAYS IN COBOL                                                      00010000
 AN ARRAY IN COBOL IS CALLED A TABLE                                    00020000
 01 WEEK-TABLE VALUE "MONDAY  TUESDAY  WEDNESDAY"                       00021000
    01 DAY-NAME PIC X(10) OCCURS 7 TIMES.                               00030000
                                                                        00040000
 THEN                                                                   00050000
 MOVE 'MONDAY' TO DAY-NAME(1).                                          00060000
INDEXES BEGIN FROM 1 TO N                                               00070000
                                                                        00080000
# MULTI LEVEL TABLE                                                     00090000
01 STUDENT-TABLE                                                        00100000
       05 STUDENTS OCCURS 30 TIMES                                      00110000
         10 STUDENT-NAME PIC X(15).                                     00120000
         10 SUBJECTS PIC 9(3) OCURRS 3 TIMES.                           00130000
                                                                        00140000
MOVE 'STEVE             35 57 83' TO STUDENT-TABLE.                     00150000
MOVE                              TO STUDENTS(1).                       00160000
DISPLAY SUBJECTS(1 3)                                                   00170000
                                                                        00180000
# SEARCH A TABLE                                                        00190000
     PERFORM VARYING I FROM 1 BY 1 UNTIL I > 7                          00200000
       DISPLAY DAY-NAME(I)                                              00210000
     END-PERFORM.                                                       00220000
