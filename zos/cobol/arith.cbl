       IDENTIFICATION DIVISION.                                         00010000
       PROGRAM-ID. ARITH                                                00020000
      * ************************                                        00030000
      * ARITHMETIC ON COBOL    *                                        00040000
      * ************************                                        00050000
       ENVIRONMENT DIVISION.                                            00060000
       DATA DIVISION.                                                   00070000
       WORKING-STORAGE SECTION.                                         00071000
       01 NUM1 PIC 9(2) VALUE 2.                                        00080000
       01 NUM2 PIC 9(2) VALUE 2.                                        00090000
       01 RESULT PIC 9(3) VALUE ZEROES.                                 00100003
       01 COMPRES PIC 9(4) VALUE ZEROES.                                00101003
       01 D PIC 9(1) VALUE ZEROES.                                      00102003
       PROCEDURE DIVISION.                                              00110000
           ADD NUM1 TO RESULT                                           00111000
           DISPLAY 'RESULT = ' RESULT                                   00112000
           ADD NUM2 TO RESULT                                           00113000
           DISPLAY 'RESULT = ' RESULT                                   00114000
                                                                        00115000
           ADD NUM1 TO NUM2 GIVING RESULT ON SIZE ERROR DISPLAY "ERROR" 00116003
           DISPLAY 'NUM1 = ' NUM1                                       00117000
           DISPLAY 'NUM2 = ' NUM2                                       00118000
           DISPLAY 'RESULT = ' RESULT                                   00119000
                                                                        00119101
           SUBTRACT NUM1 FROM NUM2                                      00119201
           SUBTRACT NUM1 FROM NUM GIVING RESULT                         00119301
                                                                        00119401
           MULTIPLY NUM1 BY NUM2                                        00119501
           MULTIPLY NUM1 BY NUM2 GIVING RESULT                          00119601
                                                                        00119701
           DIVIDE NUM1 INTO NUM2 GIVING RESULT                          00119801
           REMAINDER NUM3                                               00119901
                                                                        00120002
           COMPUTE COMPRES = (NUM1 + NUM2) * NUM2                       00121002
           COMPUTE D ROUNDED = 3.88                                     00122003
           STOP RUN.                                                    00130000
