       IDENTIFICATION DIVISION.                                         00010000
       PROGRAM-ID. TEST1.                                               00020002
       AUTHOR. KEVIN.                                                   00030000
       DATE-WRITTEN. 22/10/2025.                                        00040000
       DATE-COMPILED. 22/10/2025.                                       00050000
       INSTALLATION. KEVIN LEARNING.                                    00060000
       SECURITY. PUBLIC.                                                00070000
      * ********************************                                00071005
      * LEARNING COBOL BASIC STRUCTURE *                                00080005
      * ********************************                                00081005
       ENVIRONMENT DIVISION.                                            00090002
                                                                        00109102
       DATA DIVISION.                                                   00110002
       WORKING-STORAGE SECTION.                                         00114004
       01 CITY PIC X(20) VALUE 'LONDON'.                                00115004
       01 FULL-NAME.                                                    00120004
        05 FIRST-NAME PIC X(20).                                        00121004
        05 LAST-NAME PIC X(20).                                         00122004
       01 INPUTD PIC X(40)                                              00123006
       01 WS-VARX PIC X(1) VALUE SPACE.                                 00124007
       01 WS-VAR9 PIC 9(2) VALUE ZERO.                                  00125007
       01 UNIVAR PIC X(5).                                              00126007
                                                                        00127007
                                                                        00128007
                                                                        00129007
       PROCEDURE DIVISION.                                              00130002
           INITIALIZE UNIVAR                                            00131007
           MOVE 'KEVIN' TO FIRST-NAME                                   00140004
           MOVE 'ARON' TO LAST-NAME                                     00141004
           DISPLAY 'FULLNAME:' FULL-NAME                                00142004
           ACCEPT INPUTD                                                00143006
           DISPLAY 'INPUT: ' INPUTD                                     00144006
           STOP RUN.                                                    00150002
