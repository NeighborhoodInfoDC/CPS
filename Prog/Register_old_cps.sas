/**************************************************************************
 Program:  Register_old_cps.sas
 Library:  CPS
 Project:  Urban-Greater DC
 Author:   P. Tatian
 Created:  05/28/19
 Version:  SAS 9.4
 Environment:  Local Windows session (desktop)
 GitHub issue:  2
 
 Description:  Register metadata for previously created CPS data sets. 

 Modifications:
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( CPS )


/** Macro Register_cps - Start Definition **/

%macro Register_cps( year );

  %Dc_update_meta_file(
    ds_lib=CPS,
    ds_name=cps_sup_&year._03_comp,
    creator_process=Cps_sup_&year._03.sas,
    restrictions=None,
    revisions=%str(New file.)
  )

  %Dc_update_meta_file(
    ds_lib=CPS,
    ds_name=cps_sup_&year._03_was,
    creator_process=Cps_sup_&year._03.sas,
    restrictions=None,
    revisions=%str(New file.)
  )

run;

%mend Register_cps;

/** End Macro Definition **/


%Register_cps( 2003 )
%Register_cps( 2004 )
%Register_cps( 2005 )
%Register_cps( 2007 )
%Register_cps( 2008 )
%Register_cps( 2009 )
%Register_cps( 2010 )
