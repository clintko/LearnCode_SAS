* Output dataset descriptor for SASHELP.HEART;
proc contents data=sashelp.heart;
run;

* Print the first 5 observations of SASHELP.HEART;
proc print data=sashelp.heart (obs=5);
run;

* Print summary stats for sex, death status, and cause of death ignoring cumulative statistics;
proc freq data=sashelp.heart;
    tables status deathcause sex / nocum; /* nocum: remove the cumulative column */
run;

* Evaluate relationship between weight and systolic blood pressure; 
title 'Relationship between Weight and Systolic BP (by Gender)';
proc sgplot data=sashelp.heart;
  scatter x=weight y=systolic / group=sex;
  reg x=weight y=systolic/ group=sex;
  xaxis grid label='Weight (lbs)';
  yaxis grid label='Systolic BP (mmHg)';
run;