******************************************
* BIOS 722 Topic 0: Course Intro Example *
******************************************;

/* 
 * SAS programmming: Four components 
 * - proc --- procedure step
 * - data --- data step
 * - comments (one line & multiple line)
 * - options
 */

/* step and statement
 - step: proc step and data step
 - statement
 	- ends with a RUN or QUIT statement
 	- have a run at your end of the program
 		- (have a run statement at the end of your selection)
	- SAS statements are NOT case-sensitive, but they are spelling-sensitive
		- (SAS compiler capitalize everything)
	
 */

* Create a dataset called "example";
data example; 
	do x = 1 to 10; 
	output; 
	end; 
	run; 

* Print out the dataset "example";
proc print data=example; 
	title'The Data Set EXAMPLE';
	run;

* The code below will not work;
* in SAS, we could not apply operations on a variable directly;
proc means data=example; 
	var 2*x; 
	title1'This PROC does NOT run because 2*X is NOT in the data set';
	title2'SAS can NOT create variables on the fly in most PROCs';
	run;

* Create a new variable to obtain 2 * x ;
data example; 
	set example; 
	x_times2 = 2*x; 
	run; 

* Print out the dataset "example";
proc print data=example; 
	title'The Data Set EXAMPLE';
	run;

* Now we calculate the mean of 2*x;
proc means data=example; 
	var x_times2; 
	title'This PROC works becase 2*x is now a variable in the data set';
	run;
