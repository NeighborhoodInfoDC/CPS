/**************************************************************************
 Program:  Cps_sup_yyyy_03.sas
 Library:  CPS
 Project:  NeighborhoodInfo DC
 Author:   
 Created:  
 Version:  SAS 9.1
 Environment:  Windows
 
 Description:  Read CPS March Supplement from raw data into SAS.
 
 Based on Cpsmar??.sas written by Jean Roth and downloaded from the
 NBER web site (http://www.nber.org/data/cps_progs.html).

 Modifications:
  10/15/08 PAT  Rewritten not to use ZIP MAGIC.
**************************************************************************/

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";

** Define libraries **;
%DCData_lib( CPS )

%let year = yyyy;

*options obs=100;   *** NB: Uncomment this line to debug program. ***;


/***** DO NOT CHANGE *****/
%let month = 03;
%let outlib = cps;
%let out = &outlib..Cps_sup_&year._&month;
%let shyear = %substr( &year, 3, 2 );
%let inpath = &_dcdata_path\CPS\Raw;
%let infile = cpsmar&shyear..dat;

%put _local_;

filename datafile "&inpath\&infile";


******************** START OF PROGRAM INSERT ********************;



******************** END OF PROGRAM INSERT ********************;


%cps_finish;

run;

