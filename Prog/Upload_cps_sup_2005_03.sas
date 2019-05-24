/**************************************************************************
 Program:  Upload_cps_sup_2005_03.sas
 Library:  Cps
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  11/08/05
 Version:  SAS 8.2
 Environment:  Windows with SAS/Connect
 
 Description:  Upload and register 2005 CPS March supplements for DC,
 MD, VA, and WV.

 Modifications:
**************************************************************************/

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";
%include "K:\Metro\PTatian\DCData\SAS\Inc\AlphaSignon.sas" /nosource2;

** Define libraries **;
%DCData_lib( Cps )

rsubmit;

%let year = 2005;
%let revisions = New file.;

** Upload file **;

proc upload status=no
  inlib=cps 
  outlib=cps memtype=(data);
  select cps_sup_&year._03_was cps_sup_&year._03_comp;
         
run;
  
** Register w/metadata system **;
/*
%Dc_update_meta_file(
  ds_lib=Cps,
  ds_name=Cps_sup_&year._03_was,
  creator_process=Cps_sup_&year._03.sas,
  restrictions=None,
  revisions=%str(&revisions)
)

%Dc_update_meta_file(
  ds_lib=Cps,
  ds_name=Cps_sup_&year._03_comp,
  creator_process=Cps_sup_&year._03.sas,
  restrictions=None,
  revisions=%str(&revisions)
)
*/
run;
  
endrsubmit;

signoff;
