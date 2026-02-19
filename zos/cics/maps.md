# MAPS in cics
CICS Maps are screen layouts designed for 3270 terminals used in CICS applications. 
A map defines the structure of a user interface (UI) in a CICS program, including text fields, input fields, labels, colors, and cursor positions.

MAPs are grouped as MAPSET based on its characteristics and usage. Each MAP is designed with a set of fields for the retrieval or displaying data. MAP hierarchy is shown below -

Maps are created by the assembler macros called Basic Mapping Support (BMS) macros, which separates screen design from application logic. Basic mapping support (BMS) is an application programming interface between CICS programs and terminal devices. This allows CICS programs to interact with users through formatted screens.


The BMS macro for the MAP neesd to be compiled and link edited to create a executable load module of the map and map copybook, which is used to send data to the terminal or 
receive data from the terminal

The MAP is divided into two types based on its creation and usage 
- Physical map
- Symbolic map

And both are created after the MAP compilation only

## Physical map
- Is the load module produced after the link-edit process of the MAP
- It controls the screen alignment of the MAP and represents the display format of the terminal
- They are used to display data to the terminal and receive dat afrom the terminal
- After as succesful compilation the physical map is assembled and linked into the CICS LOAD LIBRARY. the phisical map is stored in the same load library where the application program loads are stored

## Symbolic MAP
- Consists of all named fields specified with DFHMDF in the map definition, along with the programming language equivalent declaration. Each named field has five different extensions.
- The sub-divided variables for the named field are:
    - Input variable (I)
    - Output variable (O)
    - Field variable (F)
    - LEngth variable (L)
    - Attribute variable (A
    - Extended color variable(C)
    - Extened highlight variable (H)

# Verifying map display in the CICS region

1. Open CICS region
2. Define MAPSET entry in CICS region
```
CEDA DEF MAPset(mapsetname) group(ibmuser)
```
3. Install the map CICS 

```
CEDA install mapset(helomap) group(ibmuser)
```
4. Issue a new copy of the matset after the clean compilation
```
cemt set prog(mapset-name) new
```
5. Send the MAPSET

```
ceci send map(helomap)
```