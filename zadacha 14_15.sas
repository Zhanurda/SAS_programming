/*proc iml ;
	a={1 2, 3 4};
	print a;
	quit;
*/

/*proc iml ;
	a={1 'a', 3 'b'};
	quit;

*/


/*proc iml ;
	a={1 2 3, 4 5 6};
	print a , , (a[1, 2]) , , (a[{1 2}, 2]);
	quit;
*/

/*
proc iml ;
	x={45.125 50.500, 75.375 90.825};
	r={"Div A" "Div B"};
	c={"Amount" "Net Pay"};
	print x[rowname=r colname=c format=dollar12.2];
	quit;
*/

/*proc iml ;
	a={1 2, 3 4};
	*it’s okay;
	b={1 1+1, 3 4};
	*impossible;
	c={1 (1+1), 3 4};
	*also impossible;
	d1=1+1;
	d2={1 d1, 3 4};
	print a, , b, , c, , d2;
	quit;
*/

/*
proc iml ;
	a={1 2, 3 4};
	a[1, 2]=3+2;
	print a;
	quit;
*/


/*proc iml ;
	a=(1 || 3+2)//{3 4};
	print a;
	quit;
*/

/*
proc iml ;
	a={1 2, 3 4};
	print (a[1, 1]);
	show names;
*/

/*a=j(2, 2, "");
	a[1, 1]="HELLO!";
	print (a[1, 1]);
	show names;
	quit;
*/

proc iml ;
	a={1 2, 3 4};
	b={0 0, 5 6};
	print a b , 'a<>b', (a<>b);
	*set maximum;
	b={2, 3};
	print a b, 'a<b', (a<b);
	quit;
	
	
	
proc iml ;
	a={1 2 3, 4 5 6, 7 8 9};
	print (a[+, ]), , /*bit-by-bit addition on all lines*/
        (a[+, <>]), , 
		/*in the lines - addition, then on the received line search of a maximum*/
	    (a[+, <:>]), , /*..... , search index of maximum*/
        (a[+, ][ , <:>]);

quit;

proc iml ;
	start test;
	/*subprogram’s start*/

	print a;
	/*"a" is not defined in subprogram and arguments*/

	finish;
	/*subprogram end*/

	a=5;
	call test;

	/*"а" undertakes from global scope as the subprogramme not contains arguments*/
	quit;


proc iml ;
	start a;
	reset print;
	start b;
	x=x+1;
	finish b;
	call b;
	finish a;
	call a;
	quit;

proc iml ;
	start test(x) global (c);
	/*the subprogram contains arguments, returns in global scope  matrix with */
	c=x+1;
	finish test;
	call test(2);
	print (c);
	quit;
	
proc iml ;
	start test(x);
	/*subprogram with arguments, "c" -local variable */
	c=x+1;
	finish test;
	call test(2);
	print (c);
	/*will be error*/
	quit;


proc iml ;
	reset printall;
	/* print all intermediate results     */
	start test(in, out);
	/*subprogram should change out argument*/
	out=in+1;
	print in out;
	finish;
	inx={1 2 3};
	/*we will check, having given a matrix element on an entrance*/
	outx={0 0 0};
	/*here we’ll save results*/
	out=0;
	/*and check them,give on the entrance scalar */
	print 'output-meaning';
	call test(inx[1], outx[1]);
	print (outx[1]);
	/* result =1, didn’t changed */
	/*Expressions are evaluated, and the evaluated values are
	stored in temporary variables.*/
	print 'output- matrix ';
	call test(inx, outx);
	print (outx);
	/* output changed*/
	print 'output - scalar';
	call test(inx[1], out);
	print (out);
	/* output changed*/
	quit;

proc iml ;
	start Sum5(x, a=1, b=2, c=3, d=4, e=5);
	x=a + b + c + d + e;
	finish;
	call Sum5(x, , , , , 10);
	/* skip some positional parameters    */
	print x;
	call Sum5(x) e=10;
	/* equivalent, but simpler            */
	print x;
	quit;

proc iml ;
	a={1 2, 3 4};
	store a;
	quit;

proc iml ;
	load a;
	print (a[1, 1]);
	quit;

proc iml ;
	start test;
	print "this is a test";
	finish;
	STORE MODULE=test;
	quit;

	/*and then loaded from it*/
proc iml ;
	LOAD MODULE=test;
	call test;
	show storage;
	quit;
	
proc iml ;
	do i=1 to 5;

		/* by index */
		print i;
	end;
	quit;

proc iml ;
	i=0;

	do until (i>5);

		/* by condition, while and until */
		print i;
		i=i+1;
	end;
	quit;

proc iml ;
	x=do(1, 10, 1);
	*vector could be created;
	print x;
	x=1:10;
	* the same;
	print x;
	quit;

data test;
	length a $ 3 text $ 200;
	input a $ b text $;
	datalines;
aaa 10 blahblahblah
bbb 20 blahblahblah
ccc 30 blahblahblah
ddd 40 blahblahblah
;
run;


proc iml ;
	use test;

	show datasets;
	read all var {a} into char_test;
	read all var {b} into num_test;
	read all var {text} into text_test;
	read all var _num_ into num_mat;
	
	read all var _char_ into char_mat;
	print (char_test || text_test);
	show names;

	close test;

	
	quit;

	proc iml ;
	x=repeat(do(1, 3, 1), 3, 1);
	y=repeat(T(do(1, 3, 1)), 1, 3);
	print x y;
	create test1 from x;
	append from x;
	create test2 from y;
	append from y;
	quit;

proc iml ;
	c={"1" "2" "3"};
	reset print;

	/*display values and type of matrices*/
	m=num(c);
	quit;

proc iml ;
	a={-1.1 0 3.1415 4};
	reset print;

	/*display values and type of matrices*/
	m=char(a, 4, 1);
	;
	quit;

proc iml ;
	x=do(-10, 10, 0.5);
	eps=j(1, ncol(x), 1);
	call randgen(eps, "normal", 0, 2);
	y=3#x+5+eps;
	data_iml=(T(x//y));
	create test1 from data_iml;
	append from data_iml;
	close test1;
	SUBMIT;

	proc reg data=test1;
		model col2=col1;
	quit;
	
	ENDSUBMIT;
quit;

proc iml ;
	VarName="Sex";
	submit VarName;

	/* inside submit could send variables from iml */
	/* they are transferred as macro variables */
	proc freq data=Sashelp.Class;
		table &VarName / out=OutFreq;
	run;
	
	/*from  IML 14.2  these macrovariables  visibility area - global */
	endsubmit;
quit;
%put &VarName ;

proc iml ;
	s="Sashelp.Class";
	n=2;
	submit DSName=s NumObs=n;

	proc print data=&DSName(obs=&NumObs);
	run;
	
	endsubmit;
quit;

proc iml ;
	DSName="Sashelp.Class";
	NumObs=1;
	submit *;

	proc print data=&DSName(obs=&NumObs);
	run;
	
	endsubmit;
quit;

proc iml ;
	a={1 2 3, 4 5 6, 7 8 9};
	var={[7]A [8]B [3]C};

	/* repetition factors: 7 As, 8 Bs, and 3 Cs */;
	submit *;
	%put &var;
	%put &a ;
	endsubmit;
quit;

proc iml ;
	a=1;
	var="privet";
	submit a var;

	data _null_;
		t1=symget('var');
		t2=symgetn('a');
		put t1;
		put t2;
	run;
	
	endsubmit;
quit;

proc iml ;
	/*we will generate 2-dimensional distribution consisting of 2 normal distributions */
	/*will find 2 clusters centers by k-means */
	call randseed(1);
	x=RandNormal(30, {5 5}, {2.4 3, 3 8.1}) // RandNormal(30, {-5 5}, {8.1 -2, -2 
		2.4});
	create test from x;
	append from x;
	close test;
	submit;

	proc sgplot data=test;
		scatter x=col1 y=col2;
	run;
	
	endsubmit;
run;


proc iml ;
	/*and now we will find centers of clusters by fastclus procedures means*/
	submit;
	ods output ClusterCenters=tab2;
	* see ODS table names;
	*ods trace on;
	*or use this operator to print to log object names;

    proc fastclus data=test maxclusters=2;
	var col:;
     run;

    endsubmit;
    use tab2;
    *read from table, created by ods output;
    read all var _num_ into centers;

	/*this is matrix*/
	print centers;
run;

/*PRACTICAL CLASS 15*/





