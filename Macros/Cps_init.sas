/**************************************************************************
 Program:  Cps_init.sas
 Library:  CPS
 Project:  Urban-Greater DC
 Author:   P. Tatian
 Created:  05/25/19
 Version:  SAS 9.4
 Environment:  Local Windows session (desktop)
 
 Description:  Autocall macro to initialize macro vars for CPS data.

 Modifications:
**************************************************************************/

%macro Cps_init();

  %global dataset shyear inpath infile out;
  
  %let shyear = %substr( &year, 3, 2 );
  
  %let inpath = &_dcdata_r_path\CPS\Raw;
  
  %** Name of raw input file **;
  %if &year < 2009 %then %let infile = mar&shyear.supp.dat;
  %else %if &year = 2016 %then %let infile = asec&year._pubuse_v3.dat;
  %else %let infile = asec&year._pubuse.dat;

  %** Name of initial SAS output data set (from within NBER program) **;
  %let dataset = %mif_select( &year > 2012, Cpsmar&year, Cpsmar&shyear );
  
  %let out = Cps_sup_&year._03;
  
  %if &year <= 2003 %then %do;
    filename raw "&inpath\&infile";
  %end;
  %else %do;
    filename datafile "&inpath\&infile";
  %end;
  
  libname library %sysfunc(quote(%sysfunc(pathname(work)))) ;

  %push_option( ls )
  %push_option( ps )
  
%mend Cps_init;

