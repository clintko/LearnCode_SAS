
/* The two steps below: ;
 *     read sashelp.heart;
 *     select three columns
 *     select 5~10 rows
 */
data heart_reduced;
  set sashelp.heart (keep=sex status deathcause);
run;

proc print data=heart_reduced (firstobs=5 obs=10);
run;

* The code below only load the three columns of the dataset;
data heart_reduced;
    set sashelp.heart (keep=sex status deathcause);
run;

* This read the whole things and output three columns;
data heart_reduced (keep=sex status deathcause) ;
    set sashelp.heart ;
run;

* below create errors;
data heart_reduced (firstobs=5 obs=10);
    set sashelp.heart (keep=sex status deathcause);
run;

* but your can do this instead;
data heart_reduced;
    set sashelp.heart (keep=sex status deathcause firstobs=5 obs=10);
run;