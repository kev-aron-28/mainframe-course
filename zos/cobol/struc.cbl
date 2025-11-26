       IDENTIFICATION DIVISION.                                         00010001
       PROGRAM-ID. HELLO.                                               00020001
       ENVIRONMENT DIVISION.                                            00030001
                                                                        00040001
       DATA DIVISION.                                                   00050001
                                                                        00060001
       PROCEDURE DIVISION.                                              00070001
       000-MAIN-PROCEDURE.                                              00071002
           PERFORM 100-PRINT-HELLO                                      00071102
           STOP RUN.                                                    00072002
       100-PRINT-HELLO.                                                 00073002
           DISPLAY 'HELLO WORLD'                                        00090001
