/**************************************************************************
 Program:  Upload_cps_sup_2006_03.sas
 Library:  Cps
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  10/16/07
 Version:  SAS 9.1
 Environment:  Windows with SAS/Connect
 
 Description:  Upload and register 2006 CPS March supplements.

 Modifications:
**************************************************************************/

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";
%include "K:\Metro\PTatian\DCData\SAS\Inc\AlphaSignon.sas" /nosource2;

** Define libraries **;
%DCData_lib( Cps )

rsubmit;

%let year = 2006;
%let revisions = New file.;

** Upload file **;

proc upload status=no
  inlib=cps 
  outlib=cps memtype=(data);
  select cps_sup_&year._03_was cps_sup_&year._03_comp;
         
run;
  
x "purge [dcdata.cps.data]cps_sup_&year._03_was.*";
x "purge [dcdata.cps.data]cps_sup_&year._03_comp.*";
  
** Register w/metadata system **;

/*****************SKIP FOR NOW
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

run;
*****************/
  
endrsubmit;

signoff;
