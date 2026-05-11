       IDENTIFICATION DIVISION.                                         00010001
       PROGRAM-ID. FILESHAN.                                            00020001
                                                                        00030001
       ENVIRONMENT DIVISION.                                            00040001
      *> IDENTIFY THE FILE                                              00050001
       INPUT-OUTPUT SECTION.                                            00060002
       FILE-CONTROL.                                                    00070002
           SELECT MYFILE                                                00080002
           ASSIGN TO MYDD                                               00090002
           ORGANIZATION IS SEQUENTIAL                                   00091004
           FILE STATUS IS FS-MYFILE.                                    00093003
       DATA DIVISION.                                                   00100001
       FILE SECTION.                                                    00101001
       FD MYFILE.                                                       00102002
       01 MYFILE-RECORDS PIC X(100).                                    00103002
                                                                        00104001
       WORKING-STORAGE SECTION.                                         00110002
       01 WS-RECORD PIC X(100).                                         00120001
       01 FS-MYFILE PIC XX.                                             00121003
                                                                        00122003
       PROCEDURE DIVISION.                                              00130001
      *> OPEN FILE                                                      00140001
           OPEN INPUT MYFILE                                            00150001
           IF FS-MYFILE NOT = "00"                                      00151003
              DISPLAY "OPEN FAILED: " FS-MYFILE                         00151103
             STOP RUN                                                   00151203
           END-IF                                                       00152003
      *> OPERATION READ/WRITE                                           00160001
           READ MYFILE                                                  00162001
             INTO WS-RECORD                                             00163002
           END-READ                                                     00164001
           DISPLAY WS-RECORD                                            00165001
      *> CLOSE FILE                                                     00170001
           CLOSE MYFILE                                                 00171001
                                                                        00172001
           STOP RUN.                                                    00180001
