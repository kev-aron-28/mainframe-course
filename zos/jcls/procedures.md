# PROCEDURES

## The exec keyword
Its main purpose is to provide the necessary information to the operating system to execute the job step

EXEC treats as the beginning of the step and required for each step

```jcl
//[stepname]  exec parameters  [comments]
```

### PGM
Is used to specify the program that needs to be run by the system. Should be a clean compiled program ready to execute

``` jcl
//STEP1 exec pgm=sample
```

### PROC
Is used to specify the procedure that needs to be run by the system. THe procedure can be instream
or cataloged.

```
//step01 exec proc=procedure=name

```

