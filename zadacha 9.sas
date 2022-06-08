/*String variables лекция */
data string_examples;
lenght string1 $ 6 string2 $ 5;
/*String variables of lenght 6 and 5 */
string1 = 'hello';
string2 = 'world';
joined_strings = string1 || string2;
run;
proc print data = string_examples noobs;
run;
---------------------------------------------------------------

data string_examples;
lenght string1 $ 6 ;
string1 = 'hello';
sub_string1=substrn(string1,2,4);
/*extract from position 2 to 4 */
sub_string2=substrn(string1,3);
/*extract from position 3 onwords */
run;
proc print data = string_examples noobs;
run;
------------------------------------------------------------------
data string_examples;
lenght string1 $ 7 ;
string1 = 'hello';
lenght_string1 = lenghtc(string1);
lenght_trimmed_string = lenghtc (TRIMN(string1));
run;
proc print data = string_examples noobs;
run;
-----------------------------------------------------------------
data TEMP;
INPUT @1 DOJ1 mmddyy10. @12 DOJ2 mmddyy10. ;
format DOJ1 date11. DOJ2 worddate20. ;
DATALINES;
01/12/2012   02/11/1998
;
PROC PRINT DATA = TEMP;
RUN;
-----------------------------------------------------------------
DATA Employee;
  INPUT empid name $ salary DEPT $ ;
  format name $upcase9. ;
 DATALINES;
 1 rick 623.3  IT
 2 Dan 515.2 OPS
 3 Mike 611.5 IT
 4 Ryan 729.1 HR
 5 Gary 843.25 FIN
 6 Tusar 578.6 IT
 7 Prandab 632.8 OPS
 8 Rasmi 722.5 FIN 
 ;
 RUN;
  PROC PRINT DATA = Employee;
 RUN;
 ------------------------------------------------------------------
 DATA Employee;
  INPUT empid name $ salary DEPT $ ;
  
 DATALINES;
 1 rick 623.3  IT
 2 Dan 515.2 OPS
 3 Mike 611.5 IT
 4 Ryan 729.1 HR
 5 Gary 843.25 FIN
 6 Tusar 578.6 IT
 7 Prandab 632.8 OPS
 8 Rasmi 722.5 FIN 
 ;
 proc format ;
 value $dep 'IT' = 'Information Technology'
        'OPS' = 'Operations' ;
 RUN;
     PROC PRINT DATA = Employee;
     format name $upcase9. DEPT $dep.;
 run;
 ----------------------------------------------------------------------
   data mydata1;
   sum = 0;
   do var =1 to 5;
     sum = sum+var;
     end;
   proc print data = mydata1;
   run;
  ---------------------------------------------------------------------
  data mydata;
   sum = 0;
   var = 1; 
   do until (var>5);
     sum = sum+var;
     var+1;
     end;
   proc print;
   run;
   ---------------------------------------------------------------------
   //Accessing Array Values
   data array_example;
   input a1 $ a2 $ a3 $ a4 $ a5 $;
   array colours(5) $ a1-a5;
   mx = a1||'+'||a2;
   datalines;
   yellow pink orange green blue
   ;
   run;
   proc print data = array_example;
   run;
   ------------------------------------------------------------------------
   data array_example_of;
   input a1 a2 a3 a4;
   array a(4) a1-a4;
   a_sum =sum(of a(*));
   a_mean =mean (of a(*));
   a_min=min(of a(*));
   datalines;
   21 4 52 11
   96 25 42 6
   ;
   run;
   proc print data = array_example_of;
   run;
   --------------------------------------------------------------------------
   data array_example_in;
   input a1 $ a2 $ a3 $ a4 $;
   array colours(4) a1-a4;
   if 'yellow 'in colours then available ='yes'; else available ='no';
   datalines;
   orange pink violet yellow
   ;
   run;
   proc print data = array_example_in;
   run;
   ---------------------------------------------------------------------------
   //merging-sas-tables-in-data
  proc sort data = sashelp.fish out = work.testsort;
  by Weight;
  run;
  proc sort data = sashelp.heart out = work.testheart;
  by Weight;
  run;
   data work.satcoreheart;
   merge sashelp.heart work.testsort;
   by weight;
   run;
   ----------------------------------------------------------------------------
   //Filtering a SAS Table in a DATA Step. 
   //part1
   data work.highchol;
   set sashelp.heart;
   where cholesterol>200;
   run; 
   -----------------------------------------
   //part2
    data work.highchol;
   set sashelp.heart;
   where cholesterol>200 and status='Alive';
   run;
   --------------------------------------------
   //part3
   data work.highchol;
   set sashelp.heart;
   where BP_Status="High" or Chol_status="High";
   run;
   ------------------------------------------------
   //Creating a New Column in SAS. 
   data work.cardata;
   set sashelp.cars;
   Markup = MSRP - Invoice;
   run;
   ------------------------------------------------
   //Using the Import Data Utility in SAS Studio. 
   in my computer :)