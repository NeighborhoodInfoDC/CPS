/**************************************************************************
 Program:  Download_cps.sas
 Library:  CPS
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  10/25/07
 Version:  SAS 9.1
 Environment:  Windows with SAS/Connect
 
 Description:  Download all CPS data sets and formats from Alpha.

 Modifications:
**************************************************************************/

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";
%include "K:\Metro\PTatian\DCData\SAS\Inc\AlphaSignon.sas" /nosource2;

** Define libraries **;
%DCData_lib( CPS )

** Start submitting commands to remote server **;

rsubmit;

proc download status=no
  inlib=Cps 
  outlib=Cps memtype=(all);
  select cps_sup_: formats;

run;

endrsubmit;

** End submitting commands to remote server **;

run;

signoff;
