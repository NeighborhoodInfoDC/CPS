/**************************************************************************
 Program:  ucounty.sas
 Library:  CPS
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  11/08/05
 Version:  SAS 8.2
 Environment:  Windows
 
 Description:  Autocall macro to create UCOUNTY character variable
 from numeric FIPS state and county codes.

 Modifications:
**************************************************************************/

/** Macro statecd - Start Definition **/

%macro ucounty( fips_state, fips_county );

  length ucounty $ 5;
  
  if &fips_county in ( 0, . ) then &fips_county = 999;

  if 1 <= ( 1 * ( &fips_state ) ) <= 99 then do;
    if 1 <= ( 1 * ( &fips_county ) ) <= 999 then do;
      ucounty = put( ( 1 * ( &fips_state ) ), z2. ) || 
                put( ( 1 * ( &fips_county ) ), z3. );
    end;
    else do;
      %err_put( msg="Invalid FIPS county code: " &fips_county= )
    end;
  end;
  else do;
    %err_put( msg="Invalid FIPS state code: " &fips_state= )
  end;

  label ucounty = "Unique FIPS county code:  ssccc";

%mend ucounty;

/** End Macro Definition **/

