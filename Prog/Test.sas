%include "C:\DCData\SAS\Inc\Stdhead.sas";

** Define libraries **;
%DCData_lib( CPS )

proc print data=cps.cps_sup_2003_03_comp (obs=24);
  id PH_SEQ;
  by PH_SEQ;
  var A_LINENO A_EXPRRP HTOTVAL HEARNVAL POVLL FRSPOV /*HMCARE HFOODSP H_TYPE /*A_AGE A_HGA A_LFSR A_WKSTAT HSUP_WGT MARSUPWT*/;
run;

