/**************************************************************************
 Program:  race_ethn.sas
 Library:  CPS
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  11/08/05
 Version:  SAS 8.2
 Environment:  Windows
 
 Description:  Autocall macro to create summary CPS race/ethnicity 
 variable race_ethn.

 Modifications:
**************************************************************************/

/** Macro race_ethn - Start Definition **/

%macro race_ethn( new_race_var=prdtrace );

  if pehspnon = 2 then do;

    select;
      
      /** White only non-Latino **/
      when ( &new_race_var = 1 )
        race_ethn = 1;
      
      /** Black only non-Latino **/
      when ( &new_race_var = 2 )
        race_ethn = 2;

      /** American Indian/Alaska Native only non-Latino **/
      when ( &new_race_var = 3 )
        race_ethn = 4;
      
      /** Asian only non-Latino **/
      when ( &new_race_var = 4 )
        race_ethn = 5;
      
      /** Multiracial/Other non-Latino **/
      when ( &new_race_var in ( 5:26 ) )
        race_ethn = 6;
        
      /** Missing **/
      when ( &new_race_var in ( 0, . ) )
        race_ethn = .;
        
      otherwise
        do;
          %err_put( macro=race_ethn, msg="Invalid race code: " &new_race_var= )
        end;
        
      end;
    
    end;
    else if pehspnon = 1 then do;
    
      /** Latino/Hispanic **/
      race_ethn = 3;
      
    end;

  format race_ethn race_ethn.;

  label race_ethn = "Race/ethnicity (Urban recode)";

%mend race_ethn;

/** End Macro Definition **/

