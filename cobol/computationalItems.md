# COmputational items
ITems that are used for arithmetic calculations. These items are typically defined with the USAGE clause to specify their
internal representation. The usage clause explain how data is stored in memory and how the calculations are performed on that data.

The usage mode can impact storage requirements and the efficiency of arithmethic operations.

- reduce the storage space and increase the efficiency of the program.


# DISPLAY
DISPLAY computation uses the character form. In character form, one character equals one byte (8 bits) of storage. If no usage clause is used, then DISPLAY usage will be applied by default.

``` cobol
01 WS-VAR.
   05 WS-VAR1          PIC 9(06) USAGE DISPLAY.
   05 WS-VAR2          PIC 9(06).
```

# BINARY | COMP | COMPUTATION
COMP (BINARY) stores signed decimal numbers in pure binary format and applicable to numeric data items. This format is often used for arithmetic operations as it provides efficient storage and fast computation.
And based on the numbers of digits in the picture clause, changes the number of bytes for storage

1 thru 4: 2 bytes
5 thru 9: 4 bytes
10 thru 18: 8 bytes

```
01 WS-VAR.
   05 WS-VAR1   PIC 9(5) USAGE IS COMP.
   05 WS-VAR2   PIC 9(8) COMP.
```

# COMP-1
COMP-1 stores the numbers as single-precision (32 bit) floating-point numbers and applicable to numeric data items. It 
has no PIC clause, it is 4 bytes long (full word)
- mantissa and exponent

``` cobol
01 WS-VAR.
   05 WS-PI        USAGE IS COMP-1.
   05 WS-RADIUS    USAGE IS COMP-1.
```

# COMP-2
COMP-2 stores the numbers as internal double-precision (64 bit) floating-point numbers and applicable to numeric data items. It is 8 bytes (double word)
- mantissa and exponent

``` cobol
01 WS-VAR.
   05 WS-WIDTH     PIC S9(02) USAGE IS COMP-3.
   05 WS-AREA      PIC S9(06) COMP-3.
```

# COMP-3
Or packed decimal or packed numeric stores the decimal numbers in a compact binary-coded decimal (BCD) it can have a value of not exceeding 18 decimal digits
The formula for calculation with n digits (variable length and 1 sign byte)
- No. bytes = Round((n + 1) / 2) if odd
- No. bytes = Round((n)/2) if even


# COMP-4, COMP-5
COMPUTATION-4 or COMP-4 or COMPUTATION-5 or COMP-5 is the equivalent of COMP or BINARY. The data items are represented in storage as binary data.
