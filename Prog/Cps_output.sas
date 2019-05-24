/**************************************************************************
 Program:  Cps_output.sas
 Library:  CPS
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  10/16/07
 Version:  SAS 9.1
 Environment:  Windows
 
 Description:  Autocall macro to output records from 
 CPS March Supplement files.

 Modifications:
**************************************************************************/

/** Macro Cps_output - Start Definition **/

%macro Cps_output;

  ** Additional variables *****;

  count = 1;

  label count = "Population count";

  %statecd( gestfips )
  %ucounty( gestfips, gtco )
  %a_race( prdtrace )
  
  ** Output records **;

  select ( statecd );
    when ( "11" ) output &out._was;
    when ( "24" ) output &out._was;
    when ( "51" ) output &out._was;
    when ( "54" ) output &out._was;
    otherwise
      /** Not DC, MD, VA, or WV **/;
  end;

  ** Comparison file **;
  if statecd = "11" then comp_city = 1;
  else if ( statecd = "24" and gtco = 510 ) or ( gtcbsa = 12580 and gtindvpc = 1 ) then comp_city = 2; /** Baltimore **/
  else if ( gtcbsa = 71650 and statecd = "25" and gtindvpc = 1 ) then comp_city = 3; /** Boston */
  /***else if ( statecd = "39" and gtco = 035 and gtcbsast in ( 1, 4 ) ) then comp_city = 4;***/ /** Cleveland **/
  else if ( gtcbsa = 17460 and gtindvpc = 1 ) then comp_city = 4; /** Cleveland **/
  else if ( gtcbsa = 19100 and gtindvpc = 1 ) then comp_city = 5; /** Dallas **/
  else if ( gtcbsa = 19820 and gtco = 163 and gtindvpc = 1 ) then comp_city = 6;  /** Detroit **/
  else if ( gtcbsa = 33340 and gtindvpc = 1 ) then comp_city = 7;  /** Milwaukee **/
  else if ( gtcbsa = 35380 and gtindvpc = 1 ) then comp_city = 8;  /** New Orleans **/
  else if ( gtcbsa = 41860 and gtco = 001 and gtindvpc = 1 ) then comp_city = 9; /** Oakland **/
  else if ( statecd = "42" and gtco = 101 ) then comp_city = 10;  /** Philadelphia **/
  else if ( statecd = "29" and gtco = 510 ) or ( gtcbsa = 41180 and gtindvpc = 1 ) then comp_city = 11;  /** St. Louis **/

  if not( missing( comp_city ) ) then output &out._comp;

%mend Cps_output;

/** End Macro Definition **/

