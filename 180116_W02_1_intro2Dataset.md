# Outline
- [Review: Step & Statment](#Review)
- [SAS Dataset](#Dataset)
- [Examples of steps](#Example)
- [Manipulating SAS Datasets](#ManipulateDataset)

# <a name="Review"></a>Review: Step & Statment 
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

# <a name="SAS"></a>SAS Dataset
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

Example  
```
libname bios722 '/informatics/BIOS722_Spring2018/Data_Files/'
    access=readonly;
```

# <a name="Example"></a>Examples of steps


# <a name="ManipulateDataset"></a>Manipulating SAS Datasets
1. DROP     = tells SAS which variables should be excluded from the SAS dataset
2. KEEP     = tells SAS which variables to retain in the SAS dataset
3. OBS      = specifies the last observation to be read from a dataset by position
4. FIRSTOBS = specifies the first observation to be read from a dataset by position
5. WHERE    = (condition) - specifies a logical condition that must be satisfied in orderfor an observation to be retained.

