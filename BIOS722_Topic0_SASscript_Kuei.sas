******************************************
* BIOS 722 Topic 0: Course Intro Example *
******************************************;

data example; 
	do x = 1 to 10; 
	output; 
	end; 
	run; 

proc print data=example; 
	title'The Data Set EXAMPLE';
	run;

proc means data=example; 
	var 2*x; 
	title1'This PROC does NOT run because 2*X is NOT in the data set';
	title2'SAS can NOT create variables on the fly in most PROCs';
	run;

data example; 
	set example; 
	x_times2 = 2*x; 
	run; 

proc print data=example; 
	title'The Data Set EXAMPLE';
	run;

proc means data=example; 
	var x_times2; 
	title'This PROC works becase 2*x is now a variable in the data set';
	run;
