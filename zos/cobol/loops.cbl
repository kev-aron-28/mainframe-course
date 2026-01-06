       IDENTIFICATION DIVISION.                                         00010000
       PROGRAM-ID. LOOPS.                                               00020000
      * *******************************                                 00030000
      * LEARNING TO USE LOOPS ON COBOL*                                 00031000
      * *******************************                                 00032000
       ENVIRONMENT DIVISION.                                            00040000
                                                                        00050000
       DATA DIVISION.                                                   00060000
       WORKING-STORAGE SECTION.                                         00070000
       01 I PIC 9(2) VALUE ZERO.                                        00080000
                                                                        00090000
                                                                        00100000
       PROCEDURE DIVISION.                                              00110000
           PERFORM 5 TIMES                                              00111000
             DISPLAY 'I = ' I                                           00112000
             ADD 1 TO I                                                 00112100
           END-PERFORM                                                  00113000
                                                                        00113100
           MOVE 0 TO I                                                  00114000
                                                                        00114100
           PERFORM UNTIL I > 5                                          00115000
             DISPLAY 'I = ' I                                           00116000
             ADD 1 TO I                                                 00117000
           END-PERFORM                                                  00118000
                                                                        00119000
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5                    00119100
            DISPLAY 'I = 'I                                             00119200
           END-PERFORM                                                  00119300
                                                                        00119400
           STOP RUN.                                                    00119500
