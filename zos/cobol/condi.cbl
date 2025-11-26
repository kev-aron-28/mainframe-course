       IDENTIFICATION DIVISION.                                         00010000
       PROGRAM-ID. CONDI.                                               00020000
      * *********************************                               00030000
      * LEARNING CONDITIONALS AND LOOPS *                               00040000
      * *********************************                               00050000
       ENVIRONMENT DIVISION.                                            00060000
                                                                        00070000
                                                                        00080000
       DATA DIVISION.                                                   00090000
       WORKING-STORAGE SECTION.                                         00100000
       01 AGE PIC 9(2) VALUE 50.                                        00110000
       01 COUNTRY PIC X(20) VALUE 'USA'.                                00120000
       01 GRADE PIC X(1) VALUE 'A'.                                     00130000
       PROCEDURE DIVISION.                                              00140000
           DISPLAY 'START OF PROGRAM'                                   00141000
                                                                        00142000
           IF AGE > 18 AND COUNTRY = 'USA'                              00143000
             DISPLAY 'ADULT'                                            00144000
           ELSE                                                         00144100
             DISPLAY 'NOT ADULT'                                        00144200
           END-IF                                                       00145000
           EVALUATE GRADE                                               00146000
            WHEN 'A'                                                    00146100
              DISPLAY 'GOOD'                                            00146200
            WHEN 'B'                                                    00146300
              DISPLAY 'BAD'                                             00146400
            WHEN OTHER                                                  00146500
              DISPLAY 'NOT'                                             00146600
           END-EVALUATE                                                 00146900
                                                                        00147000
                                                                        00147100
           DISPLAY 'END OF THE PROGRAM'                                 00147200
                                                                        00148000
           STOP RUN.                                                    00150000
