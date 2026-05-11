       IDENTIFICATION DIVISION.                                         00010000
       PROGRAM-ID. STRS.                                                00020000
       ENVIRONMENT DIVISION.                                            00030000
       DATA DIVISION.                                                   00040000
       WORKING-STORAGE SECTION.                                         00050000
       01 CURRENT-DATE PIC 9(8) VALUE 10052019.                         00060000
       01 DAYVAR PIC 9(2) VALUE ZEROES.                                 00061000
       01 MONVAR PIC 9(2) VALUE ZEROES.                                 00062000
       01 YEARVAR PIC 9(4) VALUE ZEROES.                                00063000
                                                                        00064000
       PROCEDURE DIVISION.                                              00070000
           MOVE CURRENT-DATE(1:2) TO DAYVAR                             00081000
           MOVE CURRENT-DATE(3:2) TO MONVAR                             00082000
           MOVE CURRENT-DATE(5) TO YEARVAR                              00083000
           DISPLAY "DAY: " DAYVAR                                       00084000
           STOP RUN.                                                    00090000
