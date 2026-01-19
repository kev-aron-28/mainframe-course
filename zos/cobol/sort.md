# SORT statement
SORT statement is a powerful statement used for sorting files internally within the program. It's mainly useful in batch processing, where large amounts of data need to be sorted before further processing.

``` cobol
  SORT work-file-1 ON ASCENDING|DESCENDING KEY key-1
       [ASCENDING|DESCENDING KEY key-2 ...]
       [USING input-file1]
       [GIVING output-file]
       [COLLATING SEQUENCE IS alphabet-name]
       [USING input-file2 ...]
       [INPUT PROCEDURE IS para-1 THRU para-2]
       [OUTPUT PROCEDURE IS para-3 THRU para-4]
```

- work-file-1 - The name of the sort work file. It's a logical file and does not correspond to any physical file.
- ASCENDING|DESCENDING KEY - Specifies the sort order. You can sort on multiple keys.
- key-1, key-2, ... - The data item(s) on which to sort.
- USING input-file1, input-file2, ... - The name of the input file to be sorted.
- GIVING output-file - The name of the output file where the sorted data will be written.
- COLLATING SEQUENCE IS alphabet-name USING file-4 ... - Optional. Defines the sequence in which data is sorted. For instance, specify an EBCDIC or ASCII collating sequence.
- INPUT PROCEDURE - Optional. A procedure is executed for each record of the input file before sorting.
- OUTPUT PROCEDURE - Optional. A procedure is executed for each record of the sorted file.

## Files used in the process of sorting
- Input file
- Work file
- Output file


## Process
- It opens work file in I-O mode, input file in INPUT mode, and output file in OUTPUT mode.
- Transfers the records from input file to the work file.
- Sorts the sort file based on the order coded with key-1.
- Transfers the sorted records from work file to output file.
- Closes the input, output files and releases (deletes) the work-file.


# MERGE statement
MERGE statement is used to combine two or more sequentially ordered files into a single, merged, and sequentially ordered output file.

``` cobol
MERGE work-file-1
     ON ASCENDING/DESCENDING KEY key-name-1 [key-name-2 ...]
     [COLLATING SEQUENCE {IS} alphabet-name-1]
     [USING input-file-1 [, input-file-2, ...]]
	 [OUTPUT PROCEDURE IS para-1 THRU para-2]
     [GIVING output-file-1 [, output-file-2, ...]]
```

- work-file-1 - The name of the merge work file. It's a logical file and does not correspond to any physical file.
- ON ASCENDING/DESCENDING KEY - Defines the sorting order for the merge based on the specified keys.
- key-name-1, key-name-2, ... - Specifies the data items that determine the sort order.
- COLLATING SEQUENCE {IS} alphabet-name-1 - Optional. Specifies the collating sequence for sorting. If not mentioned, machine's native sequence is used.
- USING input-file-1, input-file-2, ... - Specifies the input files that we want to merge. They should be sorted in the sequence mentioned by the sort keys.
- OUTPUT PROCEDURE IS para-1 THRU para-2 - Specifies the name of a procedure used to select or modify output records from the merge operation.
- GIVING output-file-1, output-file-2, ... - Specifies the output file or files to which the merged records are written.