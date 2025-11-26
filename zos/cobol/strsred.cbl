# REFERENCE MODIFICATION                                                00010000
  MOVE FULL-DATE(3:2) TO MONTH                                          00020000
  MOVE FULL-DATE(5:4) TO YEAR                                           00030000
  REFERENCE MODIICATION CAN BE USED TO REFER A POSITION OF A FIELD      00040000
  FIELDNAME(OFFSET:LENGTH)                                              00050000
  IF LEN IS OMITTED THE ALL CHARS AFTER OFFSET ARE SELECTED             00060000
# STRING STATEMENT                                                      00070000
  STRING FIRST-NAME DELIMITED BY SIZE                                   00080000
         LAST-NAME DELIMITED BY SIZE                                    00090000
         INTO FULL-NAME                                                 00100000
         WITH POINTER POINTER-FIELD                                     00110000
         ON OVERFLOW DISPLAY                                            00120000
         NOT ON OVERFLOW DISPLAY                                        00130000
 USED TO CONCATENATE TWO OR MORE FIELDS TOGETHER                        00140000
 DELIMIT BY SIZE WILL SEND THE WHOLE FIELD                              00150000
 POINTER CLAUSE DETERMINES STARTING POSITION IN THE RECEIVING FIELD     00160000
 OVERFLOW CLAUSE WILL GET EXECUTED WHEN MORE CHARS ARE SENT THAN        00170000
 IT CAN HOLD                                                            00180000
                                                                        00190000
                                                                        00200000
# UNSTRING STATEMENT                                                    00210000
UNSTRING FULL-NAME DELIMITED BY " "                                     00220000
     INTO FIRST-NAME MIDDLE-NAME LAST-NAME                              00230000
     TALLYING IN COUNTER1                                               00240001
     WITH POINTER POINTER-FIELD                                         00250001
     ON OVERFLOW DISPLAY ""                                             00260001
     NOT ON OVERFLOW DISPLAY ""                                         00270001
END-UNSTRING.                                                           00271001
                                                                        00272001
USED TO DIVIDE A FIELD INTO TWO OR MORE FIELDS                          00280001
POINTER CLAUSE DETERMINES THE STARTING POSITION IN THE SENDIN FIELD     00290001
OVERFLOW CLAUSE WILL GET EXECUTED WHEN MORE CHARS ARE SENT INTO RECE    00300001
VING FIELD THAN IT CAN HOLD                                             00310001
TALLYING COUNTS THE NUMBER OF RECEIVING FIELDS                          00320001
                                                                        00330001
# INSPECT STATEMENT                                                     00340001
INSPECT FULL-NAME                                                       00350001
        TALLYING COUNTER1 FOR CHARACTERS BEFORE SPACE.                  00360001
IT CAN BE USED TO COUNT, REPLACE AND CONVERT CHARACTERS IN A STRING.    00370001
                                                                        00380001
INSPECT FULL-NAME                                                       00390001
       TALLYING COUNTER1 OR ALL ".".                                    00400001
INSPECT FULL-NAME                                                       00410001
       TALLYING COUNTER1 FOR ALL "#".                                   00420001
       TALLYING COUNTER1 FOR ALL "*" BEFORE ".".                        00430001
       REPLACING ALL "." BY "".                                         00440001
       REPLACING CHARACTERS BY "0" AFTER "."                            00450001
       REPLACING LEADING "*" BY ZERO                                    00460001
       REPLACING ALL "CR" BY "".                                        00470001
       CONVERTING "A" TO "A".                                           00480001
