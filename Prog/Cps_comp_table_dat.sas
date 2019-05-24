/**************************************************************************
 Program:  Cps_comp_table_dat.sas
 Library:  CPS
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  09/05/06
 Version:  SAS 8.2
 Environment:  Windows
 
 Description:  Create data file for table of indicators for 
 DC & comparison cities for households with children 0-3 years old.

 Modifications:
**************************************************************************/

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";

** Define libraries **;
%DCData_lib( CPS )

%let maxobs = 100000000;

data Cps.Cps_comp_table (compress=no);

  set 
    cps.cps_sup_2003_03_comp (obs=&maxobs)
    cps.cps_sup_2004_03_comp (obs=&maxobs)
    cps.cps_sup_2005_03_comp (obs=&maxobs)
    cps.cps_sup_2006_03_comp (obs=&maxobs)
  ;
  by h_year ph_seq;
  
  retain num_hhs num_persons num_children num_children_0_2 num_foster_0_2 num_parents_0_2 
         num_adults num_work_adults num_work_ft_adults 
         hh_has_earn hh_food_stamps hh_pub_assist hh_health hh_medicare hh_medicaid
         hhh_age hhh_poverty hhh_educ hhh_citizen;
  
  if first.ph_seq then do;
    num_hhs = 1;
    num_persons = 0;
    num_children = 0;
    num_children_0_2 = 0;
    num_foster_0_2 = 0;
    num_parents_0_2 = 0;
    num_adults = 0;
    num_work_adults = 0;
    num_work_ft_adults = 0;
    hh_has_earn = 0;
    hh_food_stamps = .;
    hh_pub_assist = .;
    hh_health  = .;
    hh_medicare = .;
    hh_medicaid = .;
    hhh_age = a_age;
    hhh_poverty = POVLL;
    hhh_educ = A_HGA;
    hhh_citizen = PRCITSHP;
  end;
  
  num_persons + 1;
  
  if 0 <= a_age < 18 then num_children + 1;
  else do;
    num_adults + 1;
    if A_LFSR in ( 1, 2 ) then do;
      num_work_adults + 1;
      if A_WKSTAT in ( 2, 3 ) then num_work_ft_adults + 1;
    end;
  end;    
  
  if 0 <= a_age < 3 then do;
    num_children_0_2 + 1;
    if A_PARENT ~= 0 then num_parents_0_2 + 1;
    if A_EXPRRP = 11 then num_foster_0_2 + 1;
  end;

  if hearnval > 0 then hh_has_earn = 1;
  
  if HFOODSP = 1 then hh_food_stamps = 1;
  else if HFOODSP = 2 then hh_food_stamps = 0;
  
  if HPAW_YN = 1 then hh_pub_assist = 1;
  else if HPAW_YN = 2 then hh_pub_assist = 0;

  if HHI_YN = 1 then hh_health   = 1;
  else if HHI_YN = 2 then hh_health   = 0;

  if HMCARE = 1 then hh_medicare = 1;
  else if HMCARE = 2 then hh_medicare = 0;

  if HMCAID = 1 then hh_medicaid = 1;
  else if HMCAID = 2 then hh_medicaid = 0;
    
  ** Adjust weight for multiple samples **;
  
  HSUP_WGT = HSUP_WGT / 4;
  
  if last.ph_seq and num_children_0_2 > 0 then output;
  
  format hearnval ;
  
  keep h_year ph_seq comp_city hsup_wgt htotval hearnval h_type 
       num_hhs num_persons num_children num_children_0_2 num_foster_0_2 num_parents_0_2
       num_adults num_work_adults num_work_ft_adults 
       hh_has_earn hh_food_stamps hh_pub_assist hh_health hh_medicare hh_medicaid
       hhh_age hhh_poverty hhh_educ hhh_citizen;

run;

%File_info( data=Cps.Cps_comp_table, freqvars=comp_city )

proc format;
  value ageg 
    0 -< 18 = '< 18'
    18 -< 30 = '18 - 29'
    30 -< 50 = '30 - 49'
    50 -< 70 = '50 - 69'
    70 - high = '70+';

proc freq data=Cps.Cps_comp_table;
  tables h_year * ( h_type num_: hh_: hhh_: ) / missing list;
  format hhh_age ageg.;

run;
