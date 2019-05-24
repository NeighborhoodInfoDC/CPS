/**************************************************************************
 Program:  statecd.sas
 Library:  CPS
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  11/08/05
 Version:  SAS 8.2
 Environment:  Windows
 
 Description:  Autocall macro to create STATECD character variable
 from numeric FIPS code.

 Modifications:
**************************************************************************/

/** Macro statecd - Start Definition **/

%macro statecd( fips_state );

  length statecd $ 2;

  if 1 <= ( 1 * ( &fips_state ) ) <= 99 then 
    statecd = put( ( 1 * ( &fips_state ) ), z2. );
  else do;
    %err_put( msg="Invalid FIPS state code: " _n_= &fips_state= )
  end;

  label statecd = "FIPS state code";
  
  format statecd $fstname.;

%mend statecd;

/** End Macro Definition **/

