# BMS macros

## Terms
Field: Field refers to the input or output area on the Map. Its name can consist of 1 to 7 characters.
Map: Map is a single-screen format designed using BMS macros. It can have names containing 1 to 7 characters.
Mapset: Mapset is a collection of maps linked together to form a load Mapset module. It should include a PPT entry and can have names ranging from 1 to 7 characters.

## Macros

- DFHMDF: Define Field Hierarchy Map Definition Field
- DFHMDI: Define Field Hierarchy Map Definition Interface
- DFHMSD: Define Field Hierarchy Map Set Definition

### DFHMSD (Define Field Hierarchy Map Set Definition)

The DFHMSD macro is a Basic Mapping Support (BMS) macro in CICS used to define a mapset. A mapset is a collection of screen layouts that define user interfaces for CICS applications. The DFHMSD macro specifies global attributes for all maps within the mapset, such as terminal characteristics, storage options, and processing modes.

Purpose:
- Define the properties and attributes of a mapset in a CICS application
- Serves as a container for multiple DFHMDI macros which define individual maps
- Establishes terminal interaction mode (conversational or pseudo-conversational)
- Controls the way maps are stored, transmitted and displayed

```
mapset-name DFHMSD TYPE={MAP|DSECT|FINAL},
		   MODE={IN|OUT|INOUT},
		   LANG={COBOL|PL/I|ASSEMBLER},
		   CTRL={FREEKB|PRINT|FRSET|ALARM},
		   HILIGHT={OFF|BLINK|REVERSE|UNDERLINE},
		   STORAGE=AUTO,
		   TIOAPFX=YES,
		   TERM=type,
		   COLOR=color-name
```
- mapset-name must be 7 chars 
- macros should start at col 9 up to 14
- after 15 comes all the params and if you want to indicate a new line an x must be type at the end of the line
- TYPE=MAP | DSECT | FINAL: Specifies the purpose of the mapset.
    - MAP: Indicates that the mapset is for application processing.
    - DSECT: Used to generate symbolic descriptions for the map in the specified language.
    - FINAL: Indicates the end of the mapset definition.
- MODE=IN | OUT | INOUT Defines the input/output mode of the mapset:
    - IN: For receiving input from the terminal.
    - OUT: For sending output to the terminal.
    - INOUT: For both input and output operations.
- LANG=COBOL | PL/I | ASSEMBLER - Specifies the programming language of the application program using the mapset. The symbolic map is generated in the specified language.
- CTRL=FREEKB|PRINT|FRSET|ALARM
    - FREEKB: Unlocks the terminal keyboard after the mapset is sent.
    - PRINT: is used to send the map set to printer.
    - FRSET: Resets the Modified Data Tag (MDT) for all fields in the mapset.
    - ALARM: specifies the alarm feature is to be activated.
- HILIGHT=OFF|BLINK|REVERSE|UNDERLINE
    - OFF: is default and indicates no highlighting is used.
    - BLINK: used to specify to field must blink.
    - REVERSE: used to specify character or field displayed in reverse.
    - UNDERLINE: used to underline the field. If the terminal doesn't support highlighting, these parameters is ignored.
- STORAGE=AUTO - Specifies that the storage required for the mapset will be automatically allocated.
- TIOAPFX=YES | NO - Indicates whether the Terminal Input Output Area Prefix (TIOAPFX) is included in the mapset.
- TERM=type - Defines the terminal type for which the mapset is intended, such as 3270.
- COLOR=color-name - Specifies the color used for all maps of the map set. The COLOR operand of the DFHMDI macro can override this for individual fields. Valid colors are blue, green, neutral, pink, red, turquoise, and yellow. If the default value of the output device is ignored, it is to be used as the basic color for this map.


Example: 
```
----+----1----+----2----+----3----+----4----+----5----+----6----+----7--
***************************** Top of Data ******************************
HELOMAP DFHMSD TYPE=&SYSPARM,MODE=INOUT,TERMINAL=3270,CTRL=FREEKB,     X
               STORAGE=AUTO,LANG=COBOL,TIOAPFX=YES                      
                                                                        
HELLO   DFHMDI SIZE=(24,80),LINE=1,COLUMN=1                             
        DFHMDF POS=(1,1),INITIAL='HELLO WORLD',LENGTH=11,              X
               ATTRB=PROT                                               
        DFHMSD TYPE=FINAL                                               
               END                                                      
```

### DFHMDI (Define Field Hierarchy Map Definition Interface)
macro used to define individual maps within a mapset. A map is a layout that structures how data appears on a 3270 terminal screen, including fields for input and output. 
The DFHMDI macro is part of a BMS mapset and defines the characteristics of a specific screen format, including its size, position, and attributes.

- Defines the size, positioning, and attributes of a screen map.
- Specifies input and output fields for user interaction.
- Ensures consistent formatting of data on CICS terminal screens.
- Works in combination with DFHMSD (Mapset Definition) and DFHMDF (Field Definition) macros.

```
map-name DFHMDI  SIZE=(rows,columns),
			LINE=row-position,
			COLUMN=column-position,
			CTRL={FREEKB|PRINT|FRSET|ALARM},
			COLOR=color-name,
			HILIGHT={OFF|BLINK|REVERSE|UNDERLINE}
```

- SIZE=(rows, columns) - Defines the screen dimensions of the map in terms of rows and columns. Example: SIZE=(24,80).
- LINE=row-position - Specifies the starting row position of the map on the screen. Example: LINE=1.
- COLUMN=column-position - Specifies the starting column position of the map. Example: COLUMN=1.
- CTRL=FREEKB|PRINT|FRSET|ALARM
    - FREEKB: Unlocks the terminal keyboard after the map is sent.
    - PRINT: is used to send the map to printer.
    - FRSET: Resets the Modified Data Tag (MDT) for all fields in the map.
    - ALARM: specifies the alarm feature is to be activated.
- COLOR=color-name - Specifies the color used for the map. Valid colors are blue, green, neutral, pink, red, turquoise, and yellow. If the default value of the output device is ignored, it is to be used as the basic color for this map.- 
- HILIGHT=OFF|BLINK|REVERSE|UNDERLINE
    - OFF: is default and indicates no highlighting is used.
    - BLINK: used to specify to field must blink.
    - REVERSE: used to specify character or field displayed in reverse.
    - UNDERLINE: used to underline the field. If the terminal doesn't support highlighting, these parameters is ignored.


### DFHMDF (Define Field Hierarchy Map Definition Field)
used to define individual fields (data entry or display fields) within a map in a CICS application. It works inside a DFHMDI (Map Definition) and defines the 
position, length, attributes, and default values of a field on a 3270 terminal screen.

Purpose:
- Defines input and output fields for user interaction on a CICS terminal
- Controls field behaviour such as protected (read-only) or unprotected(editable)
- Specifies cursos position, colors, highlighting

```
field-name DFHMDF    POS=(row,column),
					 LENGTH=field-length,
					 ATTRB=(attribute-list),
					 INITIAL='default-text',
					 HILIGHT=OFF|BLANK|REVERSE|UNDERLINE,
					 COLOR=color-option,
					 PICIN=input-picture-value,
					 PICOUT=picture-clause,
					 JUSTIFY=LEFT|RIGHT|BLANK|ZERO
```

- POS=(row, column) - Specifies the position of the field on the screen. Example: POS=(5,10) places the field at row 5, column 10.
    - row: Row number where the field starts.
    - column: Column number where the field starts.
- LENGTH=field-length - Defines the maximum number of characters in the field. Example: LENGTH=10 allows 10 characters of input/output.
- ATTRB=(attribute-list) - Controls the field behavior and specifies the attributes of the field. Example: ATTRB=(UNPROT,NUM,IC)
- ATTRB=(attribute-list) - Controls the field behavior and specifies the attributes of the field. Example: ATTRB=(UNPROT,NUM,IC)
    - ASKIP: specifies that user can’t able to enter the data into the field. When user enters tab from previous field, control will skip the field because of ASKIP attribute and places control to next field.
    - PROT: Protected (read-only). Specifies that user can’t able to enter the data into the field. But cursor can be placed on the same field. PROT is coded for output and stopper fields.
    - UNPROT: Unprotected (user can type). specifies the data can be entered into the field and used as input or output fields.
    - BRT: specifies the field should be highlighted with high intensity.
    - NORM: specifies the field should be highlighted with normal intensity.
    - DRK: specifies the field should not be highlighted or not printed or not displayed.
    - NUM: specifies user can enter numeric input only.
    - IC: Sets cursor at this field when the screen loads.
    - FSET: specifies the MDT (Modified Data Tag) and used to check whether the specific field is modified or not while receiving the MAP. MDT returns the modification status of the field to the application program and uses for the field data validation.
- INITIAL='default-text' - Provides default text to be displayed in the field. Example: INITIAL='Enter Customer ID:'
- HILIGHT=OFF|BLINK|REVERSE|UNDERLINE
    - OFF: is default and indicates no highlighting is used.
    - BLINK: used to specify to field must blink.
    - REVERSE: used to specify character or field displayed in reverse.
    - UNDERLINE: used to underline the field. If the terminal doesn't support highlighting, these parameters is ignored.
- PICIN=in-picture-clause - Specifies the input field picture clause of the particular field for the symbolic map.
- PICOUT=out-picture-clause - Specifies the output field picture clause of the particular field for the symbolic map.