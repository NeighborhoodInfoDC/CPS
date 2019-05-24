/**************************************************************************
 Program:  Compare_cps.sas
 Library:  Cps
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  11/08/05
 Version:  SAS 8.2
 Environment:  Windows
 
 Description:  Compare DC CPS file for 2004 with data from Jason Ost.

 Modifications:
**************************************************************************/

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";

** Define libraries **;
%DCData_lib( Cps )

libname jost "D:\Data\CPS\Passel\CPS";

proc compare  maxprint=(40,32000)
  base=Cps.Cps_sup_2004_03_dc 
  compare=Jost.Cpsmar04 (where=(gestfips=11));

run;

