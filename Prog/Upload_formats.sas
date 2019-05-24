/**************************************************************************
 Program:  Upload_formats.sas
 Library:  CPS
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  10/16/07
 Version:  SAS 9.1
 Environment:  Windows with SAS/Connect
 
 Description:  Upload format library to Alpha.

 Modifications:
**************************************************************************/

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";
%include "K:\Metro\PTatian\DCData\SAS\Inc\AlphaSignon.sas" /nosource2;

** Define libraries **;
%DCData_lib( CPS )

** Start submitting commands to remote server **;

rsubmit;

proc upload status=no
  inlib=CPS 
  outlib=CPS memtype=(catalog);
  select formats;

run;

endrsubmit;

** End submitting commands to remote server **;

run;

signoff;
