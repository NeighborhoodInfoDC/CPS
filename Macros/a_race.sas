/**************************************************************************
 Program:  a_race.sas
 Library:  CPS
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  11/08/05
 Version:  SAS 8.2
 Environment:  Windows
 
 Description:  Autocall macro to create old CPS race variable A_RACE.
 Assigns multiracial groups to single race category (Passel method).

 Modifications:
**************************************************************************/

/** Macro a_race - Start Definition **/

%macro a_race( new_race_var );

  select ( &new_race_var );
    
    /** White **/
    when ( 1, 7 )
      a_race = 1;
    
    /** Black **/
    when ( 2, 6, 10, 11, 12, 15, 16, 17, 20, 21, 22, 23 )
      a_race = 2;

    /** American Indian **/
    when ( 3 )
      a_race = 3;
    
    /** Asian and Pacific Islander **/
    when ( 4, 5, 8, 9, 13, 14, 18, 19, 24 )
      a_race = 4;
    
    /** Multiracial (not assignable) **/
    when ( 25, 26 )
      a_race = 5;
      
    /** Missing **/
    when ( 0, . )
      a_race = .;
      
    otherwise
      do;
        %err_put( macro=a_race, msg="Invalid race code: " &new_race_var= )
      end;
  
  end;

  format a_race a_race.;

  label A_RACE = "Race (Urban recode to old CPS definition)";

%mend a_race;

/** End Macro Definition **/

