/**************************************************************************
 Program:  Cps_finish.sas
 Library:  CPS
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  10/16/07
 Version:  SAS 9.1
 Environment:  Windows
 
 Description:  Autocall macro for finalizing CPS March Supplement
 data set.

 Modifications:
**************************************************************************/

/** Macro Cps_finish - Start Definition **/

%macro Cps_finish;

  proc sort data=&out._was;
    by ph_seq a_lineno;

  proc sort data=&out._comp;
    by ph_seq a_lineno;

  %File_info( data=&out._was, printobs=0, freqvars=gestfips gtco statecd ucounty )

  proc freq data=&out._was;
    tables PRDTRACE * a_race / list missing;

  run;

  proc tabulate data=&out._was format=comma12.0 noseps missing;
    class statecd a_race;
    var count;
    weight marsupwt;
    table statecd, all='Total' a_race, count=' ' * ( sum='Population' colpctsum='Pct.' )
     / condense;
    title2;
    title3 "CPS March Supplement, &year";

  run;

  ** Comparison data set summary **;

  proc freq data=&out._comp;
    tables comp_city comp_city * statecd * gtco * gtcbsa * gtindvpc * gtcbsast / list missing;
    format comp_city comp_cit.;
    title2;
    title3 "CPS March Supplement, &year, Comparison Cities Data Set";
    
  run;

  title2;

%mend Cps_finish;

/** End Macro Definition **/

