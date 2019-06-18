/**************************************************************************
 Program:  Cps_sup_yyyy_03.sas
 Library:  CPS
 Project:  Urban-Greater DC
 Author:   
 Created:  
 Version:  SAS 9.4
 Environment:  Local Windows session (desktop)
 GitHub issue:  
 
 Description:  Read CPS March yyyy data.

 Based on Cpsmar??.sas written by Jean Roth and downloaded from the
 NBER web site (http://www.nber.org/data/cps_progs.html).

 Modifications:
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( CPS )


******** Change these parameters based on latest data ********;

%let year = yyyy;

%let revisions = New file.;


********* Program initialization *********;
%Cps_init()


******************** START OF PROGRAM INSERT ********************;



******************** END OF PROGRAM INSERT ********************;


%Cps_finish_new()

run;
