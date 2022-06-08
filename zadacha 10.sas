//1
data empdat;
input empid ename $ salary dept $ DOJ date9.;
label id ='Employee Id';
Format DOJ date9.;
datalines;
1 Rick 633.3 IT 02APR2001
2 Dan 515.2 OPS 11JUL2012
3 Mike 611.5 IT 21OCT2000
4 Ryan 729.1 HR 30JUL2012
5 Gary 843.2 FIN 06AUG2000
6 Tusar 578.6 IT 01MAR2009
7 Pranab 632.8 OPS 16AUG1998
8 Rasmi 722.5 FIN 13SEP2014
;
Data empdat1;
Set empdat;
if salary > 650;
proc print data =empdat1;
run;
------------------------------------------------------------------
//2
data empdat;
input empid ename $ salary dept $ DOJ date9.;
label id ='Employee Id';
Format DOJ date9.;
datalines;
1 Rick 63.3 IT 02APR2001
2 Dan 515.2 OPS 11JUL2012
3 Mike 611.5 IT 21OCT2000
4 Ryan 729.1 HR 30JUL2012
5 Gary 843.2 FIN 06AUG2000
6 Tusar 578.6 IT 01MAR2009
7 Pranab 632.8 OPS 16AUG1998
8 Rasmi 722.5 FIN 13SEP2014
;
Data empdat1;
Set empdat;
IF salary >650 then salrange ='high';
else salrange ='low';
proc print data = empdat1;
run;
---------------------------------------------------------------------
//Use of Variables in SAS Program
data temp;
input id name $ salary dept $ DOJ date9.;
format doj date9.;
datalines;
1 Rick 633.3 IT 02APR2001
2 Dan 515.2 OPS 11JUL2012
3 Mike 611.5 IT 21OCT2000
4 Ryan 729.1 HR 30JUL2012
5 Gary 843.2 FIN 06AUG2000
6 Tusar 578.6 IT 01MAR2009
7 Pranab 632.8 OPS 16AUG1998
8 Rasmi 722.5 FIN 13SEP2014
;
proc print data = temp;
run;
-----------------------------------------------------------------------
//4
data empdat;
input empid ename $ salary dept $ DOJ date9.;
label id ='Employee Id';
Format DOJ date9.;
datalines;
1 Rick 623.3 IT 02APR2001
2 Dan 515.2 OPS 11JUL2012
3 Mike 611.5 IT 21OCT2000
4 Ryan 729.1 HR 30JUL2012
5 Gary 843.2 FIN 06AUG2000
6 Tusar 578.6 IT 01MAR2009
7 Pranab 632.8 OPS 16AUG1998
8 Rasmi 722.5 FIN 13SEP2014
;
Data empdat1;
Set empdat;
if salary <600 then salrange ='low';
else if 600 <=salary <= 700 then salrange ='medium';
else if 700 < salary then salrange = 'medium';
proc print data =empdat1;
run;
------------------------------------------------------------------------
//5
data empdat;
input empid ename $ salary dept $ DOJ date9.;
label id ='Employee Id';
Format DOJ date9.;
datalines;
1 Rick 63.3 IT 02APR2001
2 Dan 515.2 OPS 11JUL2012
3 Mike 611.5 IT 21OCT2000
4 Ryan 729.1 HR 30JUL2012
5 Gary 843.2 FIN 06AUG2000
6 Tusar 578.6 IT 01MAR2009
7 Pranab 632.8 OPS 16AUG1998
8 Rasmi 722.5 FIN 13SEP2014
;
Data empdat1;
Set empdat;
if salary > 700 then delete;
proc print data =empdat1;
run;
-------------------------------------------------------------------------
//6
v1=21; v2=42; v3=13; v4=10; v5=29;
/* get max val */
max_val = max (v1,v2,v3,v4,v5);
min_val = min (v1,v2,v3,v4,v5);
med_val = MEDIAN (v1,v2,v3,v4,v5);
rand_val = RANUNI(0);
SR_val = SQRT(sum(v1,v2,v3,v4,v5));
proc print data = Math_functions noobs;
run;
--------------------------------------------------------------------------
//7
//Date and Time Functions
date date_functions;
input @1 date1 date9. @11 date2 date9.;
format date1 date9. date2 date9.;
//interval between the dates in years
years_= INTCK('year',date1,date2);
months_= intck('month',date,date2);
weekday_= weekday(date1);
today_= today();
time_= time();
datalines;
21OCT2000 16AUG1998
01MAR2009 11JUL2012
;
proc print data = date_functions noobs;
run;
------------------------------------------------------------
//8
DATA CHARACTER_FUNCTIONS;
lowcse_ = lowcase ('HELLO');
upcase_ = upcase ('hello');
REVERSE_ = reverse ('Hello');
nth_letter_ = SCAN('learn SAS Now',2);
run;
proc print data = character_functions noobs;
run;
-------------------------------------------------------------------
//9
//Trancation Functions
DATA TRUNC_FUNCTIONS;
CEIL_ = CEIL(11.85);
floor_= FLOOR (11.85);
INT_= INT(32.41);
Round_= round(5621.78);
RUN;
proc print data = TRUNC_functions noobs;
run;
-------------------------------------------------------------------- 
//10
data TEMP;
input id $ name $ salary departament $ ;
datalines;
1 Rick 633.3 IT 
2 Dan 515.2 OPERATIONS
3 Mike 611.5 IT 
4 Ryan 729.1 HR 
5 Gary 843.2 FINANCE 
6 Tusar 578.6 IT 
7 Pranab 632.8 OPERATIONS
8 Rasmi 722.5 FINANCE
;
RUN;
PROC SQL;
CREATE TABLE EMPLOYEES AS
SELECT * FROM TEMP;
QUIT
;
proc print data = EMPLOYEES;
run;
-----------------------------------------------------------------------
//11
//SQL Read Operation
PROC SQL;
SELECT make,model,type,invoice,horsepower
FROM
SASHELP.CARS
;
QUIT;
---------------------------------------------------------------
//12
//SQL SELECT with WHERE Clause
PROC SQL;
SELECT make,model,type,invoice,horsepower
FROM
SASHELP.CARS
WHERE make = 'Audi'
and Type = 'Sports'
;
QUIT;
--------------------------------------------------------------------
//13
data TEMP;
input id $ name $ salary departament $ ;
datalines;
1 Rick 633.3 IT 
2 Dan 515.2 OPERATIONS
3 Mike 611.5 IT 
4 Ryan 729.1 HR 
5 Gary 843.2 FINANCE 
6 Tusar 578.6 IT 
7 Pranab 632.8 OPERATIONS
8 Rasmi 722.5 FINANCE
;
RUN;
PROC SQL;
CREATE TABLE EMPLOYEES2 AS
select id as empid,
name as empname,
salary as salary ,
departament as dept,
salary*0.23 as commision
quit;
proc sql;
update employees2
set salary = salary*1.25;
quit;
proc print data =employees2;
run;
------------------------------------------------------------------------------------
//14
//SQL DELETE Operation
proc sql;
delete from employees2
      where salary > 900;
quit;
      proc print data=employees2;
run;
---------------------------------------------------------------------------
//15
//Syntax
proc means data = sashelp.CARS Mean Sum MAXDEC=2;
RUN;
-----------------------------------------------------------------------
//16
proc means data = sashelp.CARS Mean Sum MAXDEC=2;
VAR horsepower invoice EngineSize;
RUN;
-------------------------------------------------------------------
//17
proc means data = sashelp.CARS Mean Sum MAXDEC=2;
class make type;
var horsepower;
run;
-------------------------------------------------------------------
//18
proc sql;
create table CARS1 as
Select make,type,invoice,horsepower,length,weight
FROM
SASHELP.CARS
WHERE make in ('Audi','BMW')
;
RUN;
PROC MEANS DATA = CARS1 STD;
RUN;
-------- ---------------------------------------------------------------------
//19
//Creating HTML Output
ods html;
 path='/folders/myfolders/sasuser.v94/TutorialsPoint/'
 file='CARS2.html'
 style = EGDefault;
 proc sql;
 select make,model,invoice
 from sashelp.cars
 where make in ('Audi','BMW')
 and type = 'Sports'
 ;
 quit;
 
 proc SQL;
 select make,mean(horsepower)as meanhp
 from sashelp.cars
 where make in ('Audi','BMW')
 group by make ;
 quit;
 
 ods html close;
 ------------------------------------------------------------------------
 //20
 //Creating PDF Output
 ods pdf;
 file='/folders/myfolders/sasuser.v94/TutorialsPoint/CARS2.pdf'
 style = EGDefault;
 proc sql;
 select make,model,invoice
 from sashelp.cars
 where make in ('Audi','BMW')
 and type = 'Sports'
 ;
 quit;
 
 proc SQL;
 select make,mean(horsepower)as meanhp
 from sashelp.cars
 where make in ('Audi','BMW')
 group by make ;
 quit;
 
 ods pdf close;
 ----------------------------------------------------------------------
 //21
 //Creating RТF Output
 ods RTF;
 file='/folders/myfolders/sasuser.v94/TutorialsPoint/CARS2.rtf'
 style = EGDefault;
 proc sql;
 select make,model,invoice
 from sashelp.cars
 where make in ('Audi','BMW')
 and type = 'Sports'
 ;
 quit;
 
 proc SQL;
 select make,mean(horsepower)as meanhp
 from sashelp.cars
 where make in ('Audi','BMW')
 group by make ;
 quit;
 
 ods rtf close;
 ---------------------------------------------------------------------