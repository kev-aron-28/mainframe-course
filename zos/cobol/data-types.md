# Data types

## Level numbers

Level numbers specify the hierarchy or level of data items or variables. They play the most important role in declaring the variables in the application programs.

``` cobol
level-number {variable|FILLER} ...
```

### Types of level numbers

- 1-49 general purpose
- 66,77,88 special purpose

#### General purpose
- Declare regular variables
- 1 is the highest level and 49 is the lowest level number

#### Special purpose

##### 66 level number
Is used to create another logical group by regrouping the elementary variables of a group
the renames keyword is used along with the 66-level number 

- Level-01, level-77, level-88, or other level-66 entries can't be renamed.

``` cobol
66 ws-var-group2 renames ws-var-a thru ws-var-n
```


##### 77 level
Level number 77 has been set for deletion.
Used for constants

``` cobol
77 ws-pi pic 9v9(2) value 3.14
```
In the above example, WS-PI contains the value 3.14, and it is not allowed to alter its declaration.


##### 88 level
The 88-level number defines a name for a value or a set of values under the variable.
The 88-level number provides a descriptive name for a condition.
ITs called a condition name

``` cobol
 01 conditional-variable PIC variable-declaration.
    88 condition-name    VALUE condition-value.
```

Formats:

Single value:
``` cobol
01 WS-GENDER       PIC X(01).
   88 WS-MALE         VALUE 'M'.
   88 WS-FEMALE       VALUE 'F'.
```

Multiple values

``` cobol
 01 WS-GENDER       PIC X(01).
   88 WS-VALID-GENDER    VALUE "M" "F".
   88 WS-MALE            VALUE "M".
   88 WS-FEMALE          VALUE "F".
```

Range of values:

``` cobol
 01 WS-MARKS       PIC 9(03).
   88 WS-FIRST-CLASS     VALUE 60 THROUGH 100.
   88 WS-SECOND-CLASS    VALUE 50 THROUGH 59.
   88 WS-THIRD-CLASS     VALUE 35 THROUGH 49.
   88 WS-FAIL            VALUE 00 THROUGH 34.
```


# Variable naming rules
- Can be from 1 up to 30 chars
- (A-Z) (0-9) -
- Three types of variables: Individual, Group Elementary variable

Elementary: Elementary variables are not unique and can use the same name under different group variables. In this case, the elementary variables use the OF keyword followed by the group variable name.


# Picture symbol
PICTURE symbol is the letter used to specify the type of the variable during its declaration. PICTURE symbols are two types -

- for data types
- for editing

## Data types
- Alphabetic (A)
- numeric (9)
- Alphanumeric (X)
- Assumed decimal point (V) Ex. Pic 999V99
- Operational sign (S) Ex. PIC S999, PIC S999 SIGN IS LEADING SEPERATE CHARACTER, Or PIC S999 SIGN IS TRAILING SEPERATE CHARACTER

## Symbol for editing 

- Z hides leading zeroes
- Last 9 guarantees at least one digit

``` cobol
01 WS-NUM      PIC 9(5).
01 WS-NUM-OUT  PIC Z(4)9.

MOVE 42 TO WS-NUM.
MOVE WS-NUM TO WS-NUM-OUT.
DISPLAY WS-NUM-OUT.

   42
```

- Commas and decimals

```
01 WS-SALARY     PIC 9(7)V99.
01 WS-SAL-DISP   PIC Z,ZZZ,ZZ9.99.

MOVE 1234567.89 TO WS-SALARY.
MOVE WS-SALARY TO WS-SAL-DISP.
DISPLAY WS-SAL-DISP.

1,234,567.89
```

- Currency $
$ replaces leading zeros
Only one $ prints, others are placeholders

``` cobol
01 WS-AMT      PIC 9(5)V99.
01 WS-AMT-DSP  PIC $$,$$9.99.

MOVE 1234.56 TO WS-AMT.
MOVE WS-AMT TO WS-AMT-DSP.
DISPLAY WS-AMT-DSP.

$1,234.56
```

- Signs (+ / -)

```
01 WS-N PIC S9(4).
01 WS-D PIC +ZZZ9.

MOVE -25 TO WS-N.
MOVE WS-N TO WS-D.
DISPLAY WS-D.
```


- CR / CB

```
01 WS-BAL      PIC S9(5)V99.
01 WS-BAL-DSP  PIC Z,ZZZ.99CR.

MOVE -123.45 TO WS-BAL.
MOVE WS-BAL TO WS-BAL-DSP.
DISPLAY WS-BAL-DSP.
```

Do not 
- math with editing fields 
- V is never printed'
