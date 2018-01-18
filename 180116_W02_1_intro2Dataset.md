# <a name="Outline"></a>Outline
- [Review: Step & Statment](#Review)
- [SAS Dataset](#Dataset)
- [Examples of steps](#Example)
- [Manipulating SAS Datasets](#ManipulateDataset)


# <a name="Review"></a>Review: Step & Statment 
[[Back to Outline]](#Outline)

Syntax
- end with a semicolons
  - one statement can continue over several lines
  - several statements can be on the same line
    - not recommended, b/c not readable
- Not case-sensitive

When submitted
- **step boundary: DATA / PROC / RUN**
- DATA / PROC statements indicate the beginning o fa step
- RUN statements indicate the end of a step

```
DATA dataset_name;
    * statement 1;
    * statement 2;
    run;

PROC name DATA = dataset_name;
    * statement 1;
    * statement 2;
    run;
```

# <a name="Dataset"></a>SAS Dataset
[[Back to Outline]](#Outline)

- SAS dataset
  - Descriptor (Metadata) 
  - Data Portion
  - Note: Framingham Heart Study
    - Cardiovascular study

- Types of SAS Data Sets
  - **Temporary** --- stored in the WORK library
    - Reference
      - WORK.DATASET_NAME or DATASET_NANE
  - **Permanent**
    - Reference
      - LIBREF.DATASET_NAME

- LIBREF
  - A LIBREF is reference to a permanent directory / folder and is defined using a SAS LIBNAME statement
  - Characteristics of the LIBREF
    - 8 character or less
    - contains only letters, numbers, or underscores
    - Must start with a letter or underscore

Template  
```
<libname libref 'directory-path-goes-here' <options>;>
```

Example 01 
```
libname bios722 '/informatics/BIOS722_Spring2018/Data_Files/'
    access=readonly;
```

Example 02
```
/* reference to a folder */
libname testlib '/informatics/BIOS722_Spring2018/Data_Files';

/* reference to a path to your home directory*/
libname testlib2 '~/Topic_0';
```

![Create_libref](https://github.com/clintko/LearnCode_SAS/blob/master/img/W02_01_Create_Libref.png?raw=true)


# <a name="Example"></a>Examples of steps
[[Back to Outline]](#Outline)

Use **PROC CONTENTS** to output the metadata
```
* Output dataset descriptor for SASHELP.HEART;
proc contents data=sashelp.heart;
run;
```

**PROC PRINT** allows you to print the dataset
```
* Print the first 5 observations of SASHELP.HEART;
proc print data=sashelp.heart (obs=5);
run;
```

**PROC FREQ** is a useful procedure to summarize your data
```
* Print summary stats for sex, death status, and cause of death ignoring cumulative statistics;
proc freq data=sashelp.heart;
    tables status deathcause sex / nocum; /* nocum: remove the cumulative column */
run;
```

**PROC SGPLOT** produce a scatter plot
```
* Evaluate relationship between weight and systolic blood pressure; 
title 'Relationship between Weight and Systolic BP (by Gender)';
proc sgplot data=sashelp.heart;
  scatter x=weight y=systolic / group=sex;
  reg x=weight y=systolic/ group=sex;
  xaxis grid label='Weight (lbs)';
  yaxis grid label='Systolic BP (mmHg)';
run;
```

- Note:
  - Title is also a special statement
  - to reset the title, simply run ```title;``` to set title to blank

# <a name="ManipulateDataset"></a>Manipulating SAS Datasets
[[Back to Outline]](#Outline)

1. DROP     = tells SAS which variables should be excluded from the SAS dataset
2. KEEP     = tells SAS which variables to retain in the SAS dataset
3. OBS      = specifies the last observation to be read from a dataset by position
4. FIRSTOBS = specifies the first observation to be read from a dataset by position
5. WHERE    = (condition) - specifies a logical condition that must be satisfied in orderfor an observation to be retained.

Firstobs = 3  
obs = 5  
=> **three observations: 3~5**

Firstobs = 5  
obs = 5  
=> **the fifth observation**

Example
```
data heart_reduced;
  set sashelp.heart (keep=sex status deathcause);
run;

proc print data=heart_reduced (firstobs=5 obs=10);
run;
```

The code below only load the three columns of the dataset
```
data heart_reduced;
    set sashelp.heart (keep=sex status deathcause);
run;
```

This read the whole things and output three columns
```
data heart_reduced (keep=sex status deathcause) ;
    set sashelp.heart ;
run;
```

below create errors
```
data heart_reduced (firstobs=5 obs=10);
    set sashelp.heart (keep=sex status deathcause);
run;
```

but your can do this instead
```
data heart_reduced;
    set sashelp.heart (keep=sex status deathcause firstobs=5 obs=10);
run;
```

