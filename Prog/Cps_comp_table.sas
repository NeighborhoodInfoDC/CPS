/**************************************************************************
 Program:  Cps_comp_table.sas
 Library:  CPS
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  09/06/06
 Version:  SAS 8.2
 Environment:  Windows
 
 Description:  Create summary table with comparison cities from CPS.

 Modifications:
**************************************************************************/

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";

** Define libraries **;
%DCData_lib( CPS )

proc means data=Cps.Cps_comp_table n sum;
  where comp_city = 1 /*and h_year = 2005*/;
  var num_: ;

run;
