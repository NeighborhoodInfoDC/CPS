/**************************************************************************
 Program:  Cps_sup_2010_03_new.sas
 Library:  CPS
 Project:  Urban-Greater DC
 Author:   P. Tatian
 Created:  5/29/2019
 Version:  SAS 9.4
 Environment:  Local Windows session (desktop)
 GitHub issue:  2
 
 Description:  Read CPS March 2010 data. NEW VERSION.

 Based on Cpsmar??.sas written by Jean Roth and downloaded from the
 NBER web site (http://www.nber.org/data/cps_progs.html).

 Modifications:
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( CPS )

%let year = 2010;

%let revisions = Updated file version with new code.;


********* Program initialization *********;
%Cps_init()


******************** START OF PROGRAM INSERT ********************;

*options obs=100;

/*------------------------------------------------
  by Jean Roth	Tue May 28 14:32:52 EDT 2013
  Report errors to jroth@nber.org
  This program is distributed under the GNU GPL.
  See end of this file and
  http://www.gnu.org/licenses/ for details.
 ----------------------------------------------- */

/***SKIP********************************************************
*  The following line should contain the directory
   where the SAS file is to be stored  ;

libname library ".";

*  The following line should contain
   the complete path and name of the raw data file.
   On a PC, use backslashes in paths as in C:\	 ;

FILENAME datafile pipe "unzip -p /homes/data/cps/cpsmar10.zip ";

*  The following line should contain the name of the SAS dataset ;

%let dataset = cpsmar10 ;

/*------------------------------------------------

   The raw data ( as described in the 
   'File Structure' section of the 'Overview' in
   the PDF documentation )  is a *long-shape* , 
   hierarchical data file with three record types:  
   household, family, and person.
   This program produces a *wide-shape* data set 
   of person records with their respective 
   household and family variables appended.

 ----------------------------------------------- */

DATA library.&dataset ;

INFILE datafile LRECL = 2300 ;

/*----------------------------------------------*/

options nocenter ;
*options compress=yes;
*Choose compress=yes to save space ;
*Choose compress=no if converting to another package using transfer software ;
options pagesize=59 linesize=72;

/*----------------------------------------------

   A -1 means Blank; Not in Universe; or In Universe, Met No Conditions;
   Sometimes, -1 is present but not described in the codebook.
   If the variable has a decimal, it will be resolved as -1/# of decimals.
   These are usually 'Not in Universe' values also.

   The following changes in variable names have been made, if necessary:
	'$' to 'd';		'-' to '_';	     '%' to 'p';
	($ = unedited data;	- = edited data;     % = allocated data)

  ----------------------------------------------*/


RETAIN

hrecord
h_seq
hhpos
hunits
hefaminc
h_respnm
h_year
h_hhtype
h_numper
hnumfam
h_type
h_month
h_mis
h_hhnum
h_livqrt
h_typebc
h_tenure
h_telhhd
h_telavl
h_telint
gereg
gestcen
gestfips
gtcbsa
gtco
gtcbsast
gtmetsta
gtindvpc
gtcbsasz
gtcsa
hunder15
hh5to18
hhotlun
hhotno
hflunch
hflunno
hpublic
hlorent
hfoodsp
hfoodno
hfoodmo
hengast
hengval
hinc_ws
hwsval
hinc_se
hseval
hinc_fr
hfrval
hinc_uc
hucval
hinc_wc
hwcval
hss_yn
hssval
hssi_yn
hssival
hpaw_yn
hpawval
hvet_yn
hvetval
hsur_yn
hsurval
hdis_yn
hdisval
hret_yn
hretval
hint_yn
hintval
hdiv_yn
hdivval
hrnt_yn
hrntval
hed_yn
hedval
hcsp_yn
hcspval
halm_yn
halmval
hfin_yn
hfinval
hoi_yn
hoival
htotval
hearnval
hothval
hhinc
hmcare
hmcaid
hchamp
hhi_yn
hhstatus
hunder18
htop5pct
hpctcut
hsup_wgt
h1tenure
h1livqrt
h1telhhd
h1telavl
h1telint
i_hhotlu
i_hhotno
i_hflunc
i_hflunn
i_hpubli
i_hloren
i_hfoods
i_hfdval
i_hfoodn
i_hfoodm
i_hengas
i_hengva
h_idnum2
prop_tax
housret
hrhtype
h_idnum1
i_hunits
hrpaidcc
hrnumwic
hrwicyn
hfdval
frecord
fh_seq
ffpos
fkind
ftype
fpersons
fheadidx
fwifeidx
fhusbidx
fspouidx
flastidx
fmlasidx
fownu6
fownu18
frelu6
frelu18
fpctcut
fpovcut
famlis
povll
frspov
frsppct
finc_ws
fwsval
finc_se
fseval
finc_fr
ffrval
finc_uc
fucval
finc_wc
fwcval
finc_ss
fssval
finc_ssi
fssival
finc_paw
fpawval
finc_vet
fvetval
finc_sur
fsurval
finc_dis
fdisval
finc_ret
fretval
finc_int
fintval
finc_div
fdivval
finc_rnt
frntval
finc_ed
fedval
finc_csp
fcspval
finc_alm
falmval
finc_fin
ffinval
finc_oi
foival
ftotval
fearnval
fothval
ftot_r
fspanish
fsup_wgt
ffposold
f_mv_fs
f_mv_sl
ffngcare
ffngcaid
fhoussub
ffoodreq
fhousreq
;

attrib  hrecord      length=3     label="";                                     
attrib  h_seq        length=4     label="Household sequence number";            
attrib  hhpos        length=3     label="Trailer portion of unique household";  
attrib  hunits       length=3     label="Item 78 - How many units in the";      
attrib  hefaminc     length=3     label="Family income";                        
attrib  h_respnm     length=3     label="Line number of household";             
attrib  h_year       length=4     label="Year of survey";                       
attrib  h_hhtype     length=3     label="Type of household";                    
attrib  h_numper     length=3     label="Number of persons in household";       
attrib  hnumfam      length=3     label="Number of families in household";      
attrib  h_type       length=3     label="Household type";                       
attrib  h_month      length=3     label="Month of survey";                      
attrib  h_mis        length=3     label="Month in sample";                      
attrib  h_hhnum      length=3     label="Household number";                     
attrib  h_livqrt     length=3     label="Item 4 - Type of living quarters (";   
attrib  h_typebc     length=3     label="Item 15 - Type B/C";                   
attrib  h_tenure     length=3     label="Tenure";                               
attrib  h_telhhd     length=3     label="Telephone in household";               
attrib  h_telavl     length=3     label="Telephone available";                  
attrib  h_telint     length=3     label="Telephone interview acceptable";       
attrib  gereg        length=3     label="Region";                               
attrib  gestcen      length=3     label="1960 Census State Code";               
attrib  gestfips     length=3     label="State FIPS code";                      
attrib  gtcbsa       length=4     label="Metropolitan CBSA FIPS CODE";          
attrib  gtco         length=3     label="FIPS County Code";                     
attrib  gtcbsast     length=3     label="Principal city/Balance status";        
attrib  gtmetsta     length=3     label="Metropolitan status";                  
attrib  gtindvpc     length=3     label="Individual Principal City Code";       
attrib  gtcbsasz     length=3     label="Metropolitan area (CBSA) size";        
attrib  gtcsa        length=3     label="Consolidated Statistical Area (CSA)";  
attrib  hunder15     length=3     label="Recode";                               
attrib  hh5to18      length=3     label="Recode";                               
attrib  hhotlun      length=3     label="Item 83 - During 20.. how many of the";
attrib  hhotno       length=3     label="Item 83 - Number of children in";      
attrib  hflunch      length=3     label="Item 86 - During 20.. how many of the";
attrib  hflunno      length=3     label="Item 86 - Number receiving free lunch";
attrib  hpublic      length=3     label="Item 88 - Is this a public housing";   
attrib  hlorent      length=3     label="Item 89 - Are you paying lower rent";  
attrib  hfoodsp      length=3     label="Item 90 - Did anyone in this household";
attrib  hfoodno      length=3     label="Item 91 - Number of children covered"; 
attrib  hfoodmo      length=3     label="Item 92 - Number months covered by";   
attrib  hengast      length=3     label="Item 94 - Since October 1, 20.., has"; 
attrib  hengval      length=4     label="Item 95 - Altogether, how much energy";
attrib  hinc_ws      length=3     label="Recode - Wage and Salary";             
attrib  hwsval       length=5     label="Recode - HHLD income - Wages and";     
attrib  hinc_se      length=3     label="";                                     
attrib  hseval       length=5     label="Recode - HHLD income - self employment";
attrib  hinc_fr      length=3     label="Recode - Farm self-employment";        
attrib  hfrval       length=5     label="Recode - HHLD income - Farm income";   
attrib  hinc_uc      length=3     label="Recode - Unemployment compensation";   
attrib  hucval       length=5     label="Recode - HHLD income - Unemployment";  
attrib  hinc_wc      length=3     label="Recode - Worker's compensation";       
attrib  hwcval       length=5     label="Recode - HHLD income - Worker's";      
attrib  hss_yn       length=3     label="Recode - Social Security payments";    
attrib  hssval       length=5     label="Recode - HHLD income - Social Security";
attrib  hssi_yn      length=3     label="Recode - Supplemental Security benefit";
attrib  hssival      length=4     label="Recode - HHLD income - Supplemental";  
attrib  hpaw_yn      length=3     label="Recode - Public Assistance";           
attrib  hpawval      length=4     label="Recode - HHLD income - Public";        
attrib  hvet_yn      length=3     label="Recode - Veterans' Payments";          
attrib  hvetval      length=5     label="Recode - HHLD income - Veteran Payment";
attrib  hsur_yn      length=3     label="Recode - Survivor Benefits";           
attrib  hsurval      length=5     label="Recode - HHLD income - survivor income";
attrib  hdis_yn      length=3     label="Recode - Disability benefits";         
attrib  hdisval      length=5     label="Recode - HHLD income - Disability inco";
attrib  hret_yn      length=3     label="";                                     
attrib  hretval      length=5     label="Recode - HHLD income - Retirement";    
attrib  hint_yn      length=3     label="Recode -interest payments";            
attrib  hintval      length=5     label="Recode - HHLD income - Interest income";
attrib  hdiv_yn      length=3     label="Recode - Dividend payments";           
attrib  hdivval      length=5     label="Recode - HHLD income - dividend income";
attrib  hrnt_yn      length=3     label="Recode - Rental payments";             
attrib  hrntval      length=5     label="Recode - HHLD income - Rent income";   
attrib  hed_yn       length=3     label="Recode - Educational assistance";      
attrib  hedval       length=5     label="Recode - HHLD income - Education incom";
attrib  hcsp_yn      length=3     label="Recode - Child support payments";      
attrib  hcspval      length=5     label="Recode - HHLD income - child support"; 
attrib  halm_yn      length=3     label="Recode - Alimony payments";            
attrib  halmval      length=5     label="Recode - HHLD income - alimony";       
attrib  hfin_yn      length=3     label="Recode - Financial assistance payments";
attrib  hfinval      length=5     label="Recode - HHLD income - Financial";     
attrib  hoi_yn       length=3     label="Other income payments";                
attrib  hoival       length=5     label="Recode - HHLD income - Other income";  
attrib  htotval      length=5     label="Recode - Total household income";      
attrib  hearnval     length=5     label="Recode - Total household earnings";    
attrib  hothval      length=5     label="All other types of income except";     
attrib  hhinc        length=3     label="";                                     
attrib  hmcare       length=3     label="Anyone in HHLD covered by Medicare";   
attrib  hmcaid       length=3     label="Anyone in HHLD covered by Medicaid";   
attrib  hchamp       length=3     label="CHAMPUS, VA, or military health care"; 
attrib  hhi_yn       length=3     label="Anyone in HHLD have health insurance"; 
attrib  hhstatus     length=3     label="Recode - Household status";            
attrib  hunder18     length=3     label="Recode - Number of persons in HHLD";   
attrib  htop5pct     length=3     label="Recode - Household income percentiles";
attrib  hpctcut      length=3     label="Recode - HHLD income percentiles -";   
attrib  hsup_wgt     length=8     label="Final weight (2 implied decimal places";
attrib  h1tenure     length=3     label="";                                     
attrib  h1livqrt     length=3     label="";                                     
attrib  h1telhhd     length=3     label="";                                     
attrib  h1telavl     length=3     label="";                                     
attrib  h1telint     length=3     label="";                                     
attrib  i_hhotlu     length=3     label="";                                     
attrib  i_hhotno     length=3     label="";                                     
attrib  i_hflunc     length=3     label="";                                     
attrib  i_hflunn     length=3     label="";                                     
attrib  i_hpubli     length=3     label="";                                     
attrib  i_hloren     length=3     label="";                                     
attrib  i_hfoods     length=3     label="";                                     
attrib  i_hfdval     length=3     label="";                                     
attrib  i_hfoodn     length=3     label="";                                     
attrib  i_hfoodm     length=3     label="";                                     
attrib  i_hengas     length=3     label="";                                     
attrib  i_hengva     length=3     label="";                                     
attrib  h_idnum2     length=$5    label="Second part of household id number.";  
attrib  prop_tax     length=4     label="Annual property taxes";                
attrib  housret      length=4     label="Return to home equity";                
attrib  hrhtype      length=3     label="Household type";                       
attrib  h_idnum1     length=$15   label="First part of household id number.";   
attrib  i_hunits     length=3     label="Allocation flag for HUNITS";           
attrib  hrpaidcc     length=3     label="DID (YOU/ANYONE IN THIS HOUSEHOLD) PAY";
attrib  hrnumwic     length=3     label="NUMBER OF PEOPLE IN THE HOUSEHOLD";    
attrib  hrwicyn      length=3     label="AT ANY TIME LAST YEAR, (WERE YOU/WAS"; 
attrib  hfdval       length=4     label="Item 93 - What was the value of all";  
attrib  frecord      length=3     label="";                                     
attrib  fh_seq       length=4     label="Household sequence number";            
attrib  ffpos        length=3     label="Unique family identifier";             
attrib  fkind        length=3     label="Kind of family";                       
attrib  ftype        length=3     label="Family type";                          
attrib  fpersons     length=3     label="Number of persons in family";          
attrib  fheadidx     length=3     label="Index to person record of family head";
attrib  fwifeidx     length=3     label="Index to person record of family wife";
attrib  fhusbidx     length=3     label="Index to person record of family";     
attrib  fspouidx     length=3     label="Index to person record of family spous";
attrib  flastidx     length=3     label="Index to person record of last";       
attrib  fmlasidx     length=3     label="Index to person record of last";       
attrib  fownu6       length=3     label="Own children in family under 6";       
attrib  fownu18      length=3     label="Number of own never married children"; 
attrib  frelu6       length=3     label="Related persons in family under 6";    
attrib  frelu18      length=3     label="Related persons in family under 18";   
attrib  fpctcut      length=3     label="Income percentiles";                   
attrib  fpovcut      length=4     label="Low income cutoff dollar amount";      
attrib  famlis       length=3     label="Ratio of family income to low-income"; 
attrib  povll        length=3     label="Ratio of family income to low-income"; 
attrib  frspov       length=3     label="Ratio of related subfamily income to"; 
attrib  frsppct      length=4     label="Low income cutoff dollar amount of";   
attrib  finc_ws      length=3     label="Wage and salary";                      
attrib  fwsval       length=5     label="Family income - wages and salaries";   
attrib  finc_se      length=3     label="Own business self-employment";         
attrib  fseval       length=5     label="Family income - self employment income";
attrib  finc_fr      length=3     label="Farm self-employment";                 
attrib  ffrval       length=5     label="Family income - Farm income";          
attrib  finc_uc      length=3     label="Unemployment compensation";            
attrib  fucval       length=5     label="Family income - Unemployment";         
attrib  finc_wc      length=3     label="Worker's compensation";                
attrib  fwcval       length=5     label="Family income - Worker's compensation";
attrib  finc_ss      length=3     label="Social Security Benefits";             
attrib  fssval       length=5     label="Family income - Social Security";      
attrib  finc_ssi     length=3     label="Supplemental Security Benefits";       
attrib  fssival      length=4     label="Family income - Supplemental Security";
attrib  finc_paw     length=3     label="Public assistance or welfare benefits";
attrib  fpawval      length=4     label="Family income - public assistance";    
attrib  finc_vet     length=3     label="Veterans' Benefits";                   
attrib  fvetval      length=5     label="Family income - veteran payments";     
attrib  finc_sur     length=3     label="Survivor's payments";                  
attrib  fsurval      length=5     label="Family income - Survivor income";      
attrib  finc_dis     length=3     label="Disability payments";                  
attrib  fdisval      length=5     label="Family income - Disability income";    
attrib  finc_ret     length=3     label="Retirement payments";                  
attrib  fretval      length=5     label="Family income - Retirement income";    
attrib  finc_int     length=3     label="Interest payments";                    
attrib  fintval      length=5     label="Family income - Interest income";      
attrib  finc_div     length=3     label="Dividend payments";                    
attrib  fdivval      length=5     label="Family income - Dividend income";      
attrib  finc_rnt     length=3     label="Rental payments";                      
attrib  frntval      length=5     label="Family income - Rental income";        
attrib  finc_ed      length=3     label="Education benefits";                   
attrib  fedval       length=5     label="Family income - Education income";     
attrib  finc_csp     length=3     label="Child support payments";               
attrib  fcspval      length=5     label="Family income - Child support";        
attrib  finc_alm     length=3     label="Alimony payments";                     
attrib  falmval      length=5     label="Family income - Alimony";              
attrib  finc_fin     length=3     label="Financial assistance payments";        
attrib  ffinval      length=5     label="Family income - Financial assistance"; 
attrib  finc_oi      length=3     label="Other income payments";                
attrib  foival       length=5     label="Family income - Other income";         
attrib  ftotval      length=5     label="Total family income";                  
attrib  fearnval     length=5     label="Total family earnings";                
attrib  fothval      length=5     label="Total other family income";            
attrib  ftot_r       length=3     label="Total family income recode";           
attrib  fspanish     length=3     label="Reference person or spouse of Spanish";
attrib  fsup_wgt     length=8     label="Householder or reference person weight";
attrib  ffposold     length=3     label="Trailer portion of unique household ID";
attrib  f_mv_fs      length=4     label="Family market value of food stamps";   
attrib  f_mv_sl      length=4     label="Family market value of school lunch";  
attrib  ffngcare     length=4     label="Family fungible value of medicare";    
attrib  ffngcaid     length=4     label="Family fungible value of medicaid";    
attrib  fhoussub     length=3     label="Family market value of housing subsidy";
attrib  ffoodreq     length=4     label="Based on USDA figures";                
attrib  fhousreq     length=4     label="Used to compute fungible value of";    
attrib  precord      length=3     label="";                                     
attrib  ph_seq       length=4     label="Household seq number";                 
attrib  pppos        length=3     label="Trailer portion of unique household ID";
attrib  a_lineno     length=3     label="Item 18a - Line number";               
attrib  a_parent     length=3     label="Item 18c - Parent's line number";      
attrib  a_exprrp     length=3     label="Expanded relationship code";           
attrib  a_age        length=3     label="Item 18d - Age";                       
attrib  a_maritl     length=3     label="Item 18e - Marital status";            
attrib  a_spouse     length=3     label="Item 18f - Spouse's line number";      
attrib  a_sex        length=3     label="Item 18g - Sex";                       
attrib  a_hga        length=3     label="Item 18h - Educational attainment";    
attrib  prdtrace     length=3     label="Race";                                 
attrib  p_stat       length=3     label="Status of person identifier";          
attrib  pehspnon     length=3     label="Are you Spanish, Hispanic, or Latino?";
attrib  prdthsp      length=3     label="Detailed Hispanic recode";             
attrib  a_famnum     length=3     label="Family number";                        
attrib  a_famtyp     length=3     label="Family type";                          
attrib  a_famrel     length=3     label="Family relationship";                  
attrib  a_pfrel      length=3     label="Primary family relationship";          
attrib  hhdrel       length=3     label="Detailed household summary";           
attrib  famrel       length=3     label="Family relationship";                  
attrib  hhdfmx       length=3     label="Detailed household and family status"; 
attrib  parent       length=3     label="Family members under 18 (excludes";    
attrib  age1         length=3     label="Age recode - Persons 15+ years";       
attrib  phf_seq      length=3     label="Pointer to the sequence number of own";
attrib  pf_seq       length=3     label="Pointer to the sequence number of fami";
attrib  a_fnlwgt     length=8     label="Final weight (2 implied decimal places";
attrib  a_ernlwt     length=8     label="Earnings/not in labor force weight";   
attrib  marsupwt     length=8     label="Supplement final weight (2 implied";   
attrib  a_hrs1       length=3     label="How many hrs did ... work last week";  
attrib  a_uslft      length=3     label="Does ... usually work 35 hrs or more a";
attrib  a_whyabs     length=3     label="Why was ... absent from work last week";
attrib  a_payabs     length=3     label="Is ... receiving wages or salary for"; 
attrib  peioind      length=4     label="Industry";                             
attrib  peioocc      length=4     label="Occupation";                           
attrib  a_wkslk      length=3     label="Duration of unemployment";             
attrib  a_whenlj     length=3     label="When did ... last work?";              
attrib  a_clswkr     length=3     label="Class of worker";                      
attrib  ppposold     length=3     label="Trailer portion of unique household id";
attrib  a_nlflj      length=3     label="When did ... last work for pay at a";  
attrib  a_wantjb     length=3     label="Does ... want a regular job now,";     
attrib  peafever     length=3     label="Did you ever serve on active duty in"; 
attrib  peafwhn1     length=3     label="When did you serve?";                  
attrib  peafwhn2     length=3     label="When did you serve?";                  
attrib  peafwhn3     length=3     label="When did you serve?";                  
attrib  peafwhn4     length=3     label="When did you serve?";                  
attrib  a_uslhrs     length=3     label="How many hrs per week does ...";       
attrib  a_hrlywk     length=3     label="Is ... paid by the hour on this job?"; 
attrib  a_hrspay     length=8     label="How much does ... earn per hour?";     
attrib  a_grswk      length=4     label="How much does ... usually earn per";   
attrib  a_unmem      length=3     label="On this job, is ... a member of a";    
attrib  a_uncov      length=3     label="On this job, is ... covered by a union";
attrib  a_enrlw      length=3     label="Last week was ... attending or";       
attrib  a_hscol      length=3     label="";                                     
attrib  a_ftpt       length=3     label="Is ... enrolled in school as a full-"; 
attrib  a_lfsr       length=3     label="Labor force status recode";            
attrib  a_untype     length=3     label="Reason for unemployment";              
attrib  a_wkstat     length=3     label="Full/part-time status";                
attrib  a_explf      length=3     label="Experienced labor force employment";   
attrib  a_wksch      length=3     label="Labor force by time worked or lost";   
attrib  a_civlf      length=3     label="Civilian labor force";                 
attrib  a_ftlf       length=3     label="Full/time labor force";                
attrib  a_mjind      length=3     label="Major industry code";                  
attrib  a_dtind      length=3     label="Detailed industry recode";             
attrib  mjocc        length=3     label="Major occupation recode";              
attrib  a_dtocc      length=3     label="Detailed occupation recode";           
attrib  prerelg      length=3     label="Earnings eligibility flag";            
attrib  workyn       length=3     label="Item 29a - Did ... work at a job or";  
attrib  wtemp        length=3     label="Item 29b - Did ... do any temporary,"; 
attrib  nwlook       length=3     label="Item 30 - Even though ... did not work";
attrib  nwlkwk       length=3     label="Item 31 - How may different weeks";    
attrib  rsnnotw      length=3     label="Item 32 - What was the main";          
attrib  wkswork      length=3     label="Item 33 - During 20.. in how many week";
attrib  wkcheck      length=3     label="Item 34 - Interviewer check item -";   
attrib  losewks      length=3     label="Item 35 Did ... lose any full weeks of";
attrib  lknone       length=3     label="Item 36 -  You said... worked about";  
attrib  lkweeks      length=3     label="Item 36 - Weeks was ... looking for";  
attrib  lkstrch      length=3     label="Item 37 - Were the (entry in item 36)";
attrib  pyrsn        length=3     label="Item 38 - What was the main reason ...";
attrib  phmemprs     length=3     label="Item 39 - For how many employers did .";
attrib  hrswk        length=3     label="Item 41 - In the weeks that ... worked";
attrib  hrcheck      length=3     label="Item 41 - Interviewer check item -";   
attrib  ptyn         length=3     label="Item 43 - Did ... work less than";     
attrib  ptweeks      length=3     label="Item 44 - How many weeks did ... work";
attrib  ptrsn        length=3     label="Item 45 - What was the main reason ...";
attrib  ljcw         length=3     label="Item 46e - Class of worker";           
attrib  wexp         length=3     label="Recode -  Worker/nonworker recode -";  
attrib  wewkrs       length=3     label="Recode -  Worker/nonworker recode -";  
attrib  welknw       length=3     label="Recode -  Worker/nonworker recode -";  
attrib  weuemp       length=3     label="Recode - Worker/nonworker recode - Par";
attrib  earner       length=3     label="Recode - Earner status";               
attrib  clwk         length=3     label="Recode - Longest job class of worker"; 
attrib  weclw        length=3     label="Recode - Longest job class of worker"; 
attrib  poccu2       length=3     label="Recode - Occupation of longest job by";
attrib  wemocg       length=3     label="Recode - Occupation of longest job by";
attrib  weind        length=3     label="Recode - Industry of longest job by";  
attrib  wemind       length=3     label="Recode - Industry of longest job by";  
attrib  mig_cbst     length=3     label="Item 55a - Metropolitan statistical ar";
attrib  migsame      length=3     label="Was ... living in this house (apt.) 1";
attrib  mig_reg      length=3     label="Recode - Region of previous residence";
attrib  mig_st       length=3     label="Recode - FIPS State code of previous"; 
attrib  mig_dscp     length=3     label="Recode - CBSA status of residence 1 ye";
attrib  gediv        length=3     label="Recode - Census division of current";  
attrib  mig_div      length=3     label="Recode - Census division of previous"; 
attrib  mig_mtr1     length=3     label="";                                     
attrib  mig_mtr3     length=3     label="";                                     
attrib  mig_mtr4     length=3     label="";                                     
attrib  noemp        length=3     label="Item 47 - Counting all locations where";
attrib  ern_yn       length=3     label="Earnings from longest job recode";     
attrib  ern_val      length=4     label="Item 48a &  b - How much did ... earn";
attrib  ern_srce     length=3     label="Earnings  recode";                     
attrib  ern_otr      length=3     label="Item 49a - Did ... earn money from oth";
attrib  wageotr      length=3     label="Item 49b -Other wage and salary earnin";
attrib  prswkxpns    length=4     label="Recode";                               
attrib  wsal_yn      length=3     label="Recode";                               
attrib  wsal_val     length=4     label="Recode - Total wage and salary earning";
attrib  seotr        length=3     label="Item 49b - Other work - Own business"; 
attrib  semp_yn      length=3     label="Recode - Any own business self-";      
attrib  semp_val     length=4     label="ERN-YN = 1 or SEOTR = 1";              
attrib  frmotr       length=3     label="Item 49b- Farm self-employment";       
attrib  frse_yn      length=3     label="Any own farm self-employment in ERN-YN";
attrib  frse_val     length=4     label="Recode - Total amount of farm self-";  
attrib  uc_yn        length=3     label="Item 52a - At any time during 20..";   
attrib  subuc        length=3     label="Item 52a - At any time during 20..";   
attrib  strkuc       length=3     label="Item 52a -At any time during 20..";    
attrib  uc_val       length=4     label="Item 52b - How much did ... receive in";
attrib  wc_yn        length=3     label="Item 53a - During 20.. did ... receive";
attrib  wc_type      length=3     label="Item 53b";                             
attrib  wc_val       length=4     label="Item 53c - How much compensation did"; 
attrib  ss_yn        length=3     label="Item 56b - Did ... receive s.s.?";     
attrib  ss_val       length=4     label="Item 56c - How much did ... receive in";
attrib  ssi_yn       length=3     label="Item 57b - Did ... receive SSI?";      
attrib  paw_yn       length=3     label="Item 59b - Did ... receive public";    
attrib  paw_typ      length=3     label="Item 59c - Did ... receive tanf/AFDC o";
attrib  paw_mon      length=3     label="Item 59d - In how many months of 20..";
attrib  paw_val      length=4     label="Item 59e - How much did ... receive in";
attrib  vet_yn       length=3     label="Item 60b - Did ... receive veterans'"; 
attrib  vet_typ1     length=3     label="Item 60c - Disability compensation";   
attrib  vet_typ2     length=3     label="Item 60c - Survivor benefits";         
attrib  vet_typ3     length=3     label="Item 60c - Veterans' pension";         
attrib  vet_typ4     length=3     label="Item 60c - Education assistance";      
attrib  vet_typ5     length=3     label="Item 60c - Other veterans' payments";  
attrib  vet_qva      length=3     label="Item 60d - Is ... required to fill out";
attrib  vet_val      length=4     label="Item 60e - How much did ... receive fr";
attrib  sur_yn       length=3     label="Item 61b - Other than social security";
attrib  sur_sc1      length=3     label="Item 61c - What was the source of this";
attrib  sur_sc2      length=3     label="Item 61d - Any other pension or";      
attrib  sur_val1     length=4     label="Item 61e - how much did ... receive fr";
attrib  sur_val2     length=4     label="Item 61g - How much did ... receive";  
attrib  srvs_val     length=4     label="Recode total amount of survivor's inco";
attrib  dis_hp       length=3     label="Item 62b -  Does ... have a health";   
attrib  dis_cs       length=3     label="Item 62c - Did ... retire or leave a j";
attrib  dis_yn       length=3     label="Item 64b - Other than social security ";
attrib  dis_sc1      length=3     label="Item 64c - What was the source of inco";
attrib  dis_sc2      length=3     label="Item 64c - Any other disability income";
attrib  dis_val1     length=4     label="Item 64e - How much did ... receive fr";
attrib  dis_val2     length=4     label="Item 64g - How much did ... receive fr";
attrib  dsab_val     length=4     label="Recode total amount of disability inco";
attrib  ret_yn       length=3     label="Item 65b - Other than social security";
attrib  ret_sc1      length=3     label="Item 65c - What was the source of";    
attrib  ret_sc2      length=3     label="Item 65c - Any other retirement income";
attrib  ret_val1     length=4     label="Item 65e - How much did ... receive fr";
attrib  ret_val2     length=4     label="Item 65g - How much did ... receive fr";
attrib  rtm_val      length=4     label="Recode total amount of retirement inco";
attrib  int_yn       length=3     label="Item 66b - Did... own any interest";   
attrib  int_val      length=4     label="Item 66c - How much did ... receive in";
attrib  div_yn       length=3     label="Item 67b - Did ... own any shares of s";
attrib  div_non      length=3     label="Item 67c - No dividends received";     
attrib  div_val      length=4     label="Item 67c - How much did ... receive in";
attrib  rnt_yn       length=3     label="Item 68b - Did ... own any land,";     
attrib  rnt_val      length=4     label="Item 68c - How much did ... receive in";
attrib  ed_yn        length=3     label="Item 69c - Did ... receive educational";
attrib  oed_typ1     length=3     label="Item Q66d(2,3,&  4) - Source of";      
attrib  oed_typ2     length=3     label="Item Q66d(5) - Source of educational"; 
attrib  oed_typ3     length=3     label="Item Q66d(6)- Source of educational";  
attrib  ed_val       length=4     label="Item 69h - Total amount of educational";
attrib  csp_yn       length=3     label="Item 70b - Did ... receive child suppo";
attrib  csp_val      length=4     label="Item 70c - How much did ... receive in";
attrib  alm_yn       length=3     label="Item 71b - Did .. rec’v alimony paymnt";
attrib  alm_val      length=4     label="Item 71c - How much did ... receive in";
attrib  fin_yn       length=3     label="Item 72b - Did ... receive financial"; 
attrib  fin_val      length=4     label="Item 72c - How much did ... receive in";
attrib  oi_off       length=3     label="Item 73c";                             
attrib  oi_yn        length=3     label="Item 73b - Did ... receive other incom";
attrib  oi_val       length=4     label="Item 73d - How much did ... receive in";
attrib  ptotval      length=5     label="Recode - Total persons income";        
attrib  pearnval     length=5     label="Recode - Total persons earnings";      
attrib  pothval      length=5     label="Recode - Total other persons income";  
attrib  fl_665       length=3     label="";                                     
attrib  ptot_r       length=3     label="Recode - Total person income recode";  
attrib  perlis       length=3     label="Recode - Low-income level of persons"; 
attrib  mcare        length=3     label="Item 74b - Was ... covered by medicare";
attrib  mcaid        length=3     label="Item 74d - Was ... covered by medicaid";
attrib  champ        length=3     label="Item 74f - Was ... covered by CHAMPUS,";
attrib  hi_yn        length=3     label="Item 75b - Was ... covered by private";
attrib  hiown        length=3     label="Item 75c - Was this health insurance"; 
attrib  hiemp        length=3     label="Item 75d - Was this health insurance"; 
attrib  hipaid       length=3     label="Item 75e - Did ...'s employer or union";
attrib  wrk_ck       length=3     label="Item 76 - Interviewer check item worke";
attrib  penplan      length=3     label="Item 76a - Other than social security";
attrib  penincl      length=3     label="Item 76b - Was ... included in that";  
attrib  cov_gh       length=3     label="Recode - Includes dependents included";
attrib  cov_hi       length=3     label="Recode - Includes dependents covered b";
attrib  ch_mc        length=3     label="A-AGE less than 15";                   
attrib  ch_hi        length=3     label="A-AGE less than 15";                   
attrib  a1rrp        length=3     label="Relationship to reference person";     
attrib  a1age        length=3     label="Age allocation flag";                  
attrib  a1maritl     length=3     label="Marital status allocation flag";       
attrib  a1spouse     length=3     label="Spouse's line number allocation flag"; 
attrib  a1sex        length=3     label="Sex allocation flag";                  
attrib  a1hga        length=3     label="Highest grade attended allocation flag";
attrib  pxrace1      length=3     label="Allocation flag for PRDTRACE";         
attrib  a1lfsr       length=3     label="Labor force status recode allocation"; 
attrib  pxhspnon     length=3     label="Allocation flag for PEHSPNON";         
attrib  a1hrs        length=3     label="";                                     
attrib  pxafever     length=3     label="Allocation flag for PEAFEVER";         
attrib  pxafwhn1     length=3     label="Allocation flag for PEAFWHN1";         
attrib  a1whyabs     length=3     label="";                                     
attrib  a1payabs     length=3     label="";                                     
attrib  a1clswkr     length=3     label="";                                     
attrib  a1nlflj      length=3     label="";                                     
attrib  a1uslhrs     length=3     label="";                                     
attrib  a1hrlywk     length=3     label="";                                     
attrib  prwernal     length=3     label="";                                     
attrib  prhernal     length=3     label="";                                     
attrib  a1unmem      length=3     label="";                                     
attrib  a1uncov      length=3     label="";                                     
attrib  a1enrlw      length=3     label="";                                     
attrib  a1hscol      length=3     label="";                                     
attrib  a1ftpt       length=3     label="";                                     
attrib  i_ernyn      length=3     label="";                                     
attrib  i_ernval     length=3     label="";                                     
attrib  i_wsyn       length=3     label="";                                     
attrib  i_wsval      length=3     label="";                                     
attrib  i_seyn       length=3     label="";                                     
attrib  i_seval      length=3     label="";                                     
attrib  i_frmyn      length=3     label="";                                     
attrib  i_frmval     length=3     label="";                                     
attrib  i_ucyn       length=3     label="";                                     
attrib  i_ucval      length=3     label="";                                     
attrib  i_wcyn       length=3     label="";                                     
attrib  i_wctyp      length=3     label="";                                     
attrib  i_wcval      length=3     label="";                                     
attrib  i_ssyn       length=3     label="";                                     
attrib  i_ssval      length=3     label="";                                     
attrib  i_ssiyn      length=3     label="";                                     
attrib  i_ssival     length=3     label="";                                     
attrib  i_pawyn      length=3     label="";                                     
attrib  i_pawtyp     length=3     label="";                                     
attrib  i_pawval     length=3     label="";                                     
attrib  i_pawmo      length=3     label="";                                     
attrib  i_vetyn      length=3     label="";                                     
attrib  i_vettyp     length=3     label="";                                     
attrib  i_vetval     length=3     label="";                                     
attrib  i_vetqva     length=3     label="";                                     
attrib  i_suryn      length=3     label="";                                     
attrib  i_sursc1     length=3     label="";                                     
attrib  i_sursc2     length=3     label="";                                     
attrib  i_survl1     length=3     label="";                                     
attrib  i_survl2     length=3     label="";                                     
attrib  i_dissc1     length=3     label="";                                     
attrib  i_dissc2     length=3     label="";                                     
attrib  i_dishp      length=3     label="";                                     
attrib  i_discs      length=3     label="";                                     
attrib  i_disyn      length=3     label="";                                     
attrib  toi_val      length=3     label="Other income";                         
attrib  i_disvl1     length=3     label="";                                     
attrib  i_disvl2     length=3     label="";                                     
attrib  i_retyn      length=3     label="";                                     
attrib  i_retsc1     length=3     label="";                                     
attrib  i_retsc2     length=3     label="";                                     
attrib  i_retvl1     length=3     label="";                                     
attrib  i_retvl2     length=3     label="";                                     
attrib  i_intyn      length=3     label="";                                     
attrib  i_intval     length=3     label="";                                     
attrib  i_divyn      length=3     label="";                                     
attrib  i_divval     length=3     label="";                                     
attrib  i_rntyn      length=3     label="";                                     
attrib  i_rntval     length=3     label="";                                     
attrib  i_edyn       length=3     label="";                                     
attrib  i_edtyp1     length=3     label="";                                     
attrib  i_edtyp2     length=3     label="";                                     
attrib  i_oedval     length=3     label="";                                     
attrib  i_cspyn      length=3     label="";                                     
attrib  i_cspval     length=3     label="";                                     
attrib  i_almyn      length=3     label="";                                     
attrib  i_almval     length=3     label="";                                     
attrib  i_finyn      length=3     label="";                                     
attrib  i_finval     length=3     label="";                                     
attrib  i_oival      length=3     label="";                                     
attrib  i_nwlook     length=3     label="";                                     
attrib  i_nwlkwk     length=3     label="";                                     
attrib  i_rsnnot     length=3     label="";                                     
attrib  i_losewk     length=3     label="";                                     
attrib  i_lkweek     length=3     label="";                                     
attrib  i_lkstr      length=3     label="";                                     
attrib  i_pyrsn      length=3     label="";                                     
attrib  i_phmemp     length=3     label="";                                     
attrib  i_hrswk      length=3     label="";                                     
attrib  i_hrchk      length=3     label="";                                     
attrib  i_ptyn       length=3     label="";                                     
attrib  i_ptwks      length=3     label="";                                     
attrib  i_ptrsn      length=3     label="";                                     
attrib  i_ljcw       length=3     label="";                                     
attrib  i_indus      length=3     label="";                                     
attrib  i_occup      length=3     label="";                                     
attrib  i_workyn     length=3     label="";                                     
attrib  i_wtemp      length=3     label="";                                     
attrib  i_wkswk      length=3     label="";                                     
attrib  i_wkchk      length=3     label="";                                     
attrib  i_ernsrc     length=3     label="";                                     
attrib  i_noemp      length=3     label="";                                     
attrib  i_mig2       length=3     label="MIG-ST imputation flag.";              
attrib  i_penpla     length=3     label="";                                     
attrib  i_peninc     length=3     label="";                                     
attrib  i_mig1       length=3     label="MIGSAME imputation flag.";             
attrib  tcernval     length=3     label="Earnings from employer or self-";      
attrib  tcwsval      length=3     label="Wage and salary income topcoded flag"; 
attrib  tcseval      length=3     label="Nonfarm self employment income";       
attrib  tcffmval     length=3     label="Farm self employment income topcoded"; 
attrib  a_werntf     length=3     label="Current earnings - Weekly pay";        
attrib  a_herntf     length=3     label="Current earnings - Hourly pay";        
attrib  p_mvcare     length=4     label="Person market value of medicare";      
attrib  p_mvcaid     length=4     label="Person market value of medicaid";      
attrib  emcontrb     length=4     label="Employer contribution for health";     
attrib  filestat     length=3     label="Tax Filer status";                     
attrib  dep_stat     length=3     label="Dependency status pointer";            
attrib  ctc_crd      length=4     label="Child Tax Credit";                     
attrib  eit_cred     length=4     label="Earn income tax credit";               
attrib  actc_crd     length=4     label="Additional Child tax credit";          
attrib  fica         length=4     label="Social security retirement payroll";   
attrib  fed_ret      length=4     label="Federal retirement payroll deduction"; 
attrib  agi          length=4     label="Adjusted gross income";                
attrib  erp_val      length=3     label="Amount received from Economic";        
attrib  mwp_val      length=3     label="Credit received from Making Work Pay"; 
attrib  tax_inc      length=4     label="Taxable income amount";                
attrib  marg_tax     length=3     label="Federal Income Marginal tax rate";     
attrib  pemlr        length=3     label="Major labor force recode";             
attrib  pruntype     length=3     label="Reason for unemployment";              
attrib  prwkstat     length=3     label="Full/part-time work status";           
attrib  prptrea      length=3     label="Detailed reason for part-time";        
attrib  prdisc       length=3     label="Discouraged worker recode";            
attrib  prcow1       length=3     label="Class of worker recode-job 1";         
attrib  prpertyp     length=3     label="Type of person record recode";         
attrib  peabsrsn     length=3     label="What was the main reason...was absent";
attrib  peio1cow     length=3     label="Individual class of worker on first jo";
attrib  prnlfsch     length=3     label="NLF activity in school or not in schoo";
attrib  pehruslt     length=3     label="Hours usually worked last week";       
attrib  penatvty     length=3     label="In what country were you born?";       
attrib  pemntvty     length=3     label="In what country was your mother born?";
attrib  pefntvty     length=3     label="In what country was your father born?";
attrib  peinusyr     length=3     label="When did you come to the U.S. to stay?";
attrib  prcitshp     length=3     label="";                                     
attrib  pxnatvty     length=3     label="Allocation flag for PENATVTY";         
attrib  pxmntvty     length=3     label="Allocation flag for PEMNTVTY";         
attrib  pxfntvty     length=3     label="Allocation flag for PEFNTVTY";         
attrib  pxinusyr     length=3     label="Allocation flag for PEINUSYR";         
attrib  perrp        length=3     label="Expanded relationship categories";     
attrib  i_mig3       length=3     label="Imputation flag.";                     
attrib  hi           length=3     label="Covered by a health plan provided";    
attrib  hityp        length=3     label="Health insurance plan type.";          
attrib  dephi        length=3     label="Covered by a health plan through";     
attrib  hilin1       length=3     label="Line number of policyholder, 1st";     
attrib  hilin2       length=3     label="Line number of policyholder, 2nd";     
attrib  paid         length=3     label="Did ...'s former or current employer o";
attrib  hiout        length=3     label="Employer or union plan covered someone";
attrib  priv         length=3     label="Covered by a plan that they purchased";
attrib  prityp       length=3     label="Private health insurance plan type.";  
attrib  depriv       length=3     label="Covered by private plan not related to";
attrib  pilin1       length=3     label="Line number of policyholder, 1st";     
attrib  pilin2       length=3     label="Line number of policyholder, 2nd";     
attrib  pout         length=3     label="Private plan covered someone outside"; 
attrib  out          length=3     label="Covered by the health plan of someone";
attrib  care         length=3     label="Covered by medicare, the health";      
attrib  caid         length=3     label="Covered by (medicaid/local name), the";
attrib  mon          length=3     label="Number of months covered by medicaid"; 
attrib  oth          length=3     label="Covered by any other kind of health";  
attrib  otyp_1       length=3     label="Covered by TRICARE, CHAMPUS, or milita";
attrib  otyp_2       length=3     label="Covered by CHAMPVA.";                  
attrib  otyp_3       length=3     label="Covered by VA.";                       
attrib  otyp_4       length=3     label="Covered by Indian health.";            
attrib  otyp_5       length=3     label="Covered by other.";                    
attrib  othstper     length=3     label="Covered by other type of health";      
attrib  othstyp1     length=3     label="Other type of health insurance include";
attrib  othstyp2     length=3     label="";                                     
attrib  othstyp3     length=3     label="";                                     
attrib  othstyp4     length=3     label="";                                     
attrib  othstyp5     length=3     label="";                                     
attrib  othstyp6     length=3     label="";                                     
attrib  hea          length=3     label="Would you say ...'s health in general";
attrib  i_hi         length=3     label="Imputation item: HI";                  
attrib  i_dephi      length=3     label="Imputation item: DEPHI";               
attrib  i_paid       length=3     label="Imputation item: PAID";                
attrib  i_hiout      length=3     label="Imputation item: HIOUT";               
attrib  i_priv       length=3     label="Imputation item: PRIV";                
attrib  i_depriv     length=3     label="Imputation item: DEPRIV";              
attrib  i_pout       length=3     label="Imputation item: POUT";                
attrib  i_out        length=3     label="Imputation item: OUT";                 
attrib  i_care       length=3     label="Imputation item: CARE";                
attrib  i_caid       length=3     label="Imputation item: CAID";                
attrib  i_mon        length=3     label="Imputation item: MON";                 
attrib  i_oth        length=3     label="Imputation item: oth";                 
attrib  i_otyp       length=3     label="Imputation items: OTYP-1, ..., OTYP-5.";
attrib  i_ostper     length=3     label="Imputation item: OTHSTPER";            
attrib  i_ostyp      length=3     label="Imputation items: OTHSTYP1, ...,";     
attrib  i_hea        length=3     label="Imputation item: HEA";                 
attrib  ssi_val      length=4     label="Item 57c - How much did ... receive in";
attrib  ws_val       length=4     label="Item 49b - Other wage and salary";     
attrib  se_val       length=4     label="Item 49b - Other work - Own business"; 
attrib  ihsflg       length=3     label="Recode:  Covered by Indian Health";    
attrib  tsurval1     length=3     label="Survivors income, source 1,";          
attrib  tsurval2     length=3     label="Survivors income, source 2,";          
attrib  tdisval1     length=3     label="Disability income, source 1,";         
attrib  tdisval2     length=3     label="Disability income, source 2,";         
attrib  tretval1     length=3     label="Retirement income, source 1,";         
attrib  tretval2     length=3     label="Retirement income, source 2,";         
attrib  tint_val     length=3     label="Interest income";                      
attrib  tdiv_val     length=3     label="Dividend income";                      
attrib  trnt_val     length=3     label="Rent income";                          
attrib  ted_val      length=3     label="Education assistance";                 
attrib  tcsp_val     length=3     label="Child support payments";               
attrib  talm_val     length=3     label="Alimony payments";                     
attrib  tfin_val     length=3     label="Financial assistance";                 
attrib  nxtres       length=3     label="What was ... main reason for moving?"; 
attrib  i_nxtres     length=3     label="Imputation flag";                      
attrib  frm_val      length=4     label="Item 49b - Farm self-employment earnin";
attrib  paidccyn     length=3     label="Which children needed paid-care while";
attrib  paidcyna     length=3     label="PAIDCCYN allocation flag.";            
attrib  ahiper       length=3     label="Does person with no coverage reported";
attrib  iahiper      length=3     label="AHIPER allocation flag.";              
attrib  ahityp1      length=3     label="";                                     
attrib  ahityp2      length=3     label="";                                     
attrib  ahityp3      length=3     label="";                                     
attrib  ahityp4      length=3     label="";                                     
attrib  ahityp5      length=3     label="";                                     
attrib  ahityp6      length=3     label="What type of insurance (was/were)";    
attrib  iahityp      length=3     label="AHITYP allocation flag.";              
attrib  pchip        length=3     label="Was child under age 19 covered by";    
attrib  i_pchip      length=3     label="PCHIP allocation flag.";               
attrib  resnss1      length=3     label="What were the reasons (you/name)";     
attrib  resnss2      length=3     label="What were the reasons (you/name)";     
attrib  resnssa      length=3     label="RESNSS1-2 allocation flag";            
attrib  resnssi1     length=3     label="What were the reasons (you/name)";     
attrib  resnssi2     length=3     label="What were the reasons (you/name)";     
attrib  resnssia     length=3     label="RESNSSI1-2 allocation flag";           
attrib  ssikidyn     length=3     label="Which children under age 18 were";     
attrib  ssikdyna     length=3     label="SSIKIDYN allocation flag";             
attrib  sskidyn      length=3     label="Which children under age 19 were";     
attrib  sskidyna     length=3     label="SSKIDYN allocation flag";              
attrib  wicyn        length=3     label="Who received WIC?";                    
attrib  wicyna       length=3     label="WICYN allocation flag";                
attrib  industry     length=4     label="Industry of longest job";              
attrib  occup        length=4     label="Occupation of longest job";            
attrib  peridnum     length=$22   label="22 digit Unique Person identifier";    
attrib  fedtax_bc    length=4     label="Federal income tax liability, before"; 
attrib  fedtax_ac    length=4     label="Federal income tax liability, after al";
attrib  statetax_bc  length=4     label="State income tax liability, before cre";
attrib  statetax_ac  length=4     label="State income tax liability, after all";
attrib  pecohab      length=3     label="Demographics line number of cohabiting";
attrib  pelnmom      length=3     label="Demographics line number of Mother";   
attrib  pelndad      length=3     label="Demographics line number of Father";   
attrib  pemomtyp     length=3     label="Demographics type of Mother";          
attrib  pedadtyp     length=3     label="Demographics type of Father";          
attrib  pxcohab      length=3     label="Demographics allocation flag for PECOH";
attrib  pxlnmom      length=3     label="Demographics  Allocation flag for";    
attrib  pxlndad      length=3     label="Demographics  Allocation flag for";    
attrib  pxmomtyp     length=3     label="Demographics  Allocation flag for PEMO";
attrib  pxdadtyp     length=3     label="Demographics  Allocation flag for PEDA";
attrib  pedisear     length=3     label="Is...deaf or does ...have serious";    
attrib  pediseye     length=3     label="Is...blind or does...have serious";    
attrib  pedisrem     length=3     label="Because of a physical, mental, or";    
attrib  pedisphy     length=3     label="Does...have serious difficulty";       
attrib  pedisdrs     length=3     label="Does...have difficulty dressing or";   
attrib  pedisout     length=3     label="Because of a physical, mental, or";    
attrib  prdisflg     length=3     label="Does this person have any of these";   
attrib  pxdisear     length=3     label="Allocation Flag";                      
attrib  pxdiseye     length=3     label="Allocation Flag";                      
attrib  pxdisrem     length=3     label="Allocation Flag";                      
attrib  pxdisphy     length=3     label="Allocation Flag";                      
attrib  pxdisdrs     length=3     label="Allocation Flag";                      
attrib  pxdisout     length=3     label="Allocation Flag";                      
attrib  m5g_cbst     length=3     label="Metropolitan statistical area status"; 
attrib  m5g_dscp     length=3     label="Recode - CBSA status of residence 5";  
attrib  m5gsame      length=3     label="Was ... living in this house (apt.) 5";
attrib  m5g_reg      length=3     label="Recode - Region of previous residence";
attrib  m5g_st       length=3     label="Recode - FIPS State code of previous"; 
attrib  m5g_div      length=3     label="Recode - Census division of previous"; 
attrib  m5g_mtr1     length=3     label="";                                     
attrib  m5g_mtr3     length=3     label="";                                     
attrib  m5g_mtr4     length=3     label="";                                     
attrib  i_m5g1       length=3     label="M5GSAME imputation flag.";             
attrib  i_m5g2       length=3     label="M5G-ST imputation flag.";              
attrib  i_m5g3       length=3     label="Imputation flag.";                     


INPUT @1 rectype 1. @;        /* Hold the data line */
if rectype = 1 then do;       /* HOUSEHOLD RECORDS  */

INPUT
@1    hrecord          1. 
@2    h_seq            5. 
@7    hhpos            2. 
@9    hunits           1. 
@10   hefaminc         2. 
@12   h_respnm         2. 
@14   h_year           4. 
@20   h_hhtype         1. 
@21   h_numper         2. 
@23   hnumfam          2. 
@25   h_type           1. 
@26   h_month          2. 
@29   h_mis            1. 
@30   h_hhnum          1. 
@31   h_livqrt         2. 
@33   h_typebc         2. 
@35   h_tenure         1. 
@36   h_telhhd         1. 
@37   h_telavl         1. 
@38   h_telint         1. 
@39   gereg            1. 
@40   gestcen          2. 
@42   gestfips         2. 
@44   gtcbsa           5. 
@49   gtco             3. 
@52   gtcbsast         1. 
@53   gtmetsta         1. 
@54   gtindvpc         1. 
@55   gtcbsasz         1. 
@56   gtcsa            3. 
@60   hunder15         2. 
@68   hh5to18          2. 
@70   hhotlun          1. 
@71   hhotno           1. 
@72   hflunch          1. 
@73   hflunno          1. 
@74   hpublic          1. 
@75   hlorent          1. 
@76   hfoodsp          1. 
@77   hfoodno          1. 
@79   hfoodmo          2. 
@85   hengast          1. 
@86   hengval          4. 
@90   hinc_ws          1. 
@91   hwsval           7. 
@98   hinc_se          1. 
@99   hseval           7. 
@106  hinc_fr          1. 
@107  hfrval           7. 
@114  hinc_uc          1. 
@115  hucval           7. 
@122  hinc_wc          1. 
@123  hwcval           7. 
@130  hss_yn           1. 
@131  hssval           7. 
@138  hssi_yn          1. 
@139  hssival          6. 
@145  hpaw_yn          1. 
@146  hpawval          6. 
@152  hvet_yn          1. 
@153  hvetval          7. 
@160  hsur_yn          1. 
@161  hsurval          7. 
@168  hdis_yn          1. 
@169  hdisval          7. 
@176  hret_yn          1. 
@177  hretval          7. 
@184  hint_yn          1. 
@185  hintval          7. 
@192  hdiv_yn          1. 
@193  hdivval          7. 
@200  hrnt_yn          1. 
@201  hrntval          7. 
@208  hed_yn           1. 
@209  hedval           7. 
@216  hcsp_yn          1. 
@217  hcspval          7. 
@224  halm_yn          1. 
@225  halmval          7. 
@232  hfin_yn          1. 
@233  hfinval          7. 
@240  hoi_yn           1. 
@241  hoival           7. 
@248  htotval          8. 
@256  hearnval         8. 
@264  hothval          8. 
@272  hhinc            2. 
@274  hmcare           1. 
@275  hmcaid           1. 
@276  hchamp           1. 
@277  hhi_yn           1. 
@278  hhstatus         1. 
@279  hunder18         2. 
@281  htop5pct         1. 
@282  hpctcut          2. 
@287  hsup_wgt        8.2 
@295  h1tenure         1. 
@297  h1livqrt         1. 
@299  h1telhhd         1. 
@300  h1telavl         1. 
@301  h1telint         1. 
@308  i_hhotlu         1. 
@309  i_hhotno         1. 
@310  i_hflunc         1. 
@311  i_hflunn         1. 
@312  i_hpubli         1. 
@313  i_hloren         1. 
@314  i_hfoods         1. 
@315  i_hfdval         1. 
@316  i_hfoodn         1. 
@317  i_hfoodm         1. 
@318  i_hengas         1. 
@319  i_hengva         1. 
@320  h_idnum2        $5. 
@332  prop_tax         5. 
@337  housret          5. 
@342  hrhtype          2. 
@344  h_idnum1       $15. 
@359  i_hunits         1. 
@367  hrpaidcc         1. 
@383  hrnumwic         2. 
@386  hrwicyn          1. 
@387  hfdval           5. 

;
end;
else if rectype = 2 then do;  /* FAMILY RECORDS */

INPUT
@1    frecord          1. 
@2    fh_seq           5. 
@7    ffpos            2. 
@9    fkind            1. 
@10   ftype            1. 
@11   fpersons         2. 
@13   fheadidx         2. 
@15   fwifeidx         2. 
@17   fhusbidx         2. 
@19   fspouidx         2. 
@21   flastidx         2. 
@23   fmlasidx         2. 
@25   fownu6           1. 
@27   fownu18          1. 
@28   frelu6           1. 
@29   frelu18          1. 
@30   fpctcut          2. 
@32   fpovcut          5. 
@37   famlis           1. 
@38   povll            2. 
@40   frspov           2. 
@42   frsppct          5. 
@47   finc_ws          1. 
@48   fwsval           7. 
@55   finc_se          1. 
@56   fseval           7. 
@63   finc_fr          1. 
@64   ffrval           7. 
@71   finc_uc          1. 
@72   fucval           7. 
@79   finc_wc          1. 
@80   fwcval           7. 
@87   finc_ss          1. 
@88   fssval           7. 
@95   finc_ssi         1. 
@96   fssival          6. 
@102  finc_paw         1. 
@103  fpawval          6. 
@109  finc_vet         1. 
@110  fvetval          7. 
@117  finc_sur         1. 
@118  fsurval          7. 
@125  finc_dis         1. 
@126  fdisval          7. 
@133  finc_ret         1. 
@134  fretval          7. 
@141  finc_int         1. 
@142  fintval          7. 
@149  finc_div         1. 
@150  fdivval          7. 
@157  finc_rnt         1. 
@158  frntval          7. 
@165  finc_ed          1. 
@166  fedval           7. 
@173  finc_csp         1. 
@174  fcspval          7. 
@181  finc_alm         1. 
@182  falmval          7. 
@189  finc_fin         1. 
@190  ffinval          7. 
@197  finc_oi          1. 
@198  foival           7. 
@205  ftotval          8. 
@213  fearnval         8. 
@221  fothval          8. 
@229  ftot_r           2. 
@231  fspanish         1. 
@233  fsup_wgt        8.2 
@241  ffposold         2. 
@243  f_mv_fs          4. 
@247  f_mv_sl          4. 
@251  ffngcare         5. 
@256  ffngcaid         5. 
@261  fhoussub         3. 
@264  ffoodreq         4. 
@268  fhousreq         4. 


;
end ;

else if rectype = 3 then do;  /* PERSON RECORDS */

INPUT
@1    precord          1. 
@2    ph_seq           5. 
@7    pppos            2. 
@9    a_lineno         2. 
@11   a_parent         2. 
@13   a_exprrp         2. 
@15   a_age            2. 
@17   a_maritl         1. 
@18   a_spouse         2. 
@20   a_sex            1. 
@22   a_hga            2. 
@24   prdtrace         2. 
@26   p_stat           1. 
@27   pehspnon         1. 
@28   prdthsp          1. 
@29   a_famnum         2. 
@31   a_famtyp         1. 
@32   a_famrel         1. 
@33   a_pfrel          1. 
@34   hhdrel           1. 
@35   famrel           2. 
@37   hhdfmx           2. 
@39   parent           1. 
@40   age1             2. 
@44   phf_seq          2. 
@46   pf_seq           2. 
@50   a_fnlwgt        8.2 
@58   a_ernlwt        8.2 
@66   marsupwt        8.2 
@76   a_hrs1           2. 
@79   a_uslft          1. 
@85   a_whyabs         1. 
@86   a_payabs         1. 
@87   peioind          4. 
@91   peioocc          4. 
@96   a_wkslk          3. 
@102  a_whenlj         1. 
@109  a_clswkr         1. 
@110  ppposold         2. 
@112  a_nlflj          1. 
@114  a_wantjb         1. 
@118  peafever         2. 
@120  peafwhn1         2. 
@122  peafwhn2         2. 
@124  peafwhn3         2. 
@126  peafwhn4         2. 
@128  a_uslhrs         2. 
@130  a_hrlywk         1. 
@131  a_hrspay        4.2 
@135  a_grswk          4. 
@139  a_unmem          1. 
@140  a_uncov          1. 
@142  a_enrlw          1. 
@143  a_hscol          1. 
@144  a_ftpt           1. 
@145  a_lfsr           1. 
@146  a_untype         1. 
@149  a_wkstat         1. 
@150  a_explf          1. 
@151  a_wksch          1. 
@152  a_civlf          1. 
@153  a_ftlf           1. 
@155  a_mjind          2. 
@157  a_dtind          2. 
@159  mjocc            2. 
@161  a_dtocc          2. 
@163  prerelg          1. 
@165  workyn           1. 
@166  wtemp            1. 
@167  nwlook           1. 
@168  nwlkwk           2. 
@170  rsnnotw          1. 
@171  wkswork          2. 
@173  wkcheck          1. 
@174  losewks          1. 
@175  lknone           1. 
@176  lkweeks          2. 
@178  lkstrch          1. 
@179  pyrsn            1. 
@180  phmemprs         1. 
@181  hrswk            2. 
@183  hrcheck          1. 
@184  ptyn             1. 
@185  ptweeks          2. 
@187  ptrsn            1. 
@189  ljcw             1. 
@196  wexp             2. 
@198  wewkrs           1. 
@199  welknw           1. 
@200  weuemp           1. 
@201  earner           1. 
@202  clwk             1. 
@203  weclw            1. 
@204  poccu2           2. 
@206  wemocg           2. 
@208  weind            2. 
@210  wemind           2. 
@213  mig_cbst         1. 
@214  migsame          1. 
@215  mig_reg          1. 
@216  mig_st           2. 
@218  mig_dscp         1. 
@219  gediv            1. 
@220  mig_div          2. 
@222  mig_mtr1         2. 
@224  mig_mtr3         1. 
@225  mig_mtr4         1. 
@226  noemp            1. 
@227  ern_yn           1. 
@228  ern_val          6. 
@234  ern_srce         1. 
@235  ern_otr          1. 
@236  wageotr          1. 
@237  prswkxpns        4. 
@242  wsal_yn          1. 
@243  wsal_val         6. 
@249  seotr            1. 
@255  semp_yn          1. 
@256  semp_val         6. 
@262  frmotr           1. 
@268  frse_yn          1. 
@269  frse_val         6. 
@275  uc_yn            1. 
@276  subuc            1. 
@277  strkuc           1. 
@278  uc_val           5. 
@283  wc_yn            1. 
@284  wc_type          1. 
@285  wc_val           5. 
@290  ss_yn            1. 
@291  ss_val           5. 
@296  ssi_yn           1. 
@301  paw_yn           1. 
@302  paw_typ          1. 
@303  paw_mon          2. 
@305  paw_val          5. 
@310  vet_yn           1. 
@311  vet_typ1         1. 
@312  vet_typ2         1. 
@313  vet_typ3         1. 
@314  vet_typ4         1. 
@315  vet_typ5         1. 
@316  vet_qva          1. 
@317  vet_val          5. 
@322  sur_yn           1. 
@323  sur_sc1          2. 
@325  sur_sc2          2. 
@327  sur_val1         5. 
@332  sur_val2         5. 
@337  srvs_val         6. 
@343  dis_hp           1. 
@344  dis_cs           1. 
@345  dis_yn           1. 
@346  dis_sc1          2. 
@348  dis_sc2          2. 
@350  dis_val1         5. 
@355  dis_val2         5. 
@360  dsab_val         6. 
@366  ret_yn           1. 
@367  ret_sc1          1. 
@368  ret_sc2          1. 
@369  ret_val1         5. 
@374  ret_val2         5. 
@379  rtm_val          6. 
@385  int_yn           1. 
@386  int_val          5. 
@391  div_yn           1. 
@392  div_non          1. 
@393  div_val          5. 
@398  rnt_yn           1. 
@399  rnt_val          5. 
@404  ed_yn            1. 
@405  oed_typ1         1. 
@406  oed_typ2         1. 
@407  oed_typ3         1. 
@408  ed_val           5. 
@414  csp_yn           1. 
@415  csp_val          5. 
@420  alm_yn           1. 
@421  alm_val          5. 
@426  fin_yn           1. 
@427  fin_val          5. 
@432  oi_off           2. 
@434  oi_yn            1. 
@435  oi_val           5. 
@440  ptotval          8. 
@448  pearnval         8. 
@457  pothval          8. 
@465  fl_665           1. 
@466  ptot_r           2. 
@468  perlis           1. 
@469  mcare            1. 
@470  mcaid            1. 
@471  champ            1. 
@472  hi_yn            1. 
@473  hiown            1. 
@474  hiemp            1. 
@475  hipaid           1. 
@481  wrk_ck           1. 
@482  penplan          1. 
@483  penincl          1. 
@484  cov_gh           1. 
@485  cov_hi           1. 
@486  ch_mc            1. 
@487  ch_hi            1. 
@489  a1rrp            1. 
@491  a1age            1. 
@492  a1maritl         1. 
@493  a1spouse         1. 
@494  a1sex            1. 
@496  a1hga            1. 
@498  pxrace1          2. 
@500  a1lfsr           1. 
@501  pxhspnon         2. 
@503  a1hrs            1. 
@506  pxafever         2. 
@508  pxafwhn1         2. 
@510  a1whyabs         1. 
@511  a1payabs         1. 
@523  a1clswkr         1. 
@526  a1nlflj          1. 
@532  a1uslhrs         1. 
@533  a1hrlywk         1. 
@534  prwernal         1. 
@535  prhernal         1. 
@536  a1unmem          1. 
@537  a1uncov          1. 
@539  a1enrlw          1. 
@540  a1hscol          1. 
@541  a1ftpt           1. 
@542  i_ernyn          1. 
@543  i_ernval         1. 
@544  i_wsyn           1. 
@545  i_wsval          1. 
@546  i_seyn           1. 
@547  i_seval          1. 
@548  i_frmyn          1. 
@549  i_frmval         1. 
@550  i_ucyn           1. 
@551  i_ucval          1. 
@552  i_wcyn           1. 
@553  i_wctyp          1. 
@554  i_wcval          1. 
@555  i_ssyn           1. 
@556  i_ssval          1. 
@557  i_ssiyn          1. 
@558  i_ssival         1. 
@559  i_pawyn          1. 
@560  i_pawtyp         1. 
@561  i_pawval         1. 
@562  i_pawmo          1. 
@563  i_vetyn          1. 
@564  i_vettyp         1. 
@565  i_vetval         1. 
@566  i_vetqva         1. 
@567  i_suryn          1. 
@569  i_sursc1         1. 
@570  i_sursc2         1. 
@571  i_survl1         1. 
@572  i_survl2         1. 
@573  i_dissc1         1. 
@574  i_dissc2         1. 
@575  i_dishp          1. 
@576  i_discs          1. 
@577  i_disyn          1. 
@578  toi_val          1. 
@579  i_disvl1         1. 
@580  i_disvl2         1. 
@581  i_retyn          1. 
@582  i_retsc1         1. 
@583  i_retsc2         1. 
@584  i_retvl1         1. 
@585  i_retvl2         1. 
@586  i_intyn          1. 
@587  i_intval         1. 
@588  i_divyn          1. 
@589  i_divval         1. 
@590  i_rntyn          1. 
@591  i_rntval         1. 
@592  i_edyn           1. 
@593  i_edtyp1         1. 
@594  i_edtyp2         1. 
@595  i_oedval         1. 
@596  i_cspyn          1. 
@597  i_cspval         1. 
@598  i_almyn          1. 
@599  i_almval         1. 
@600  i_finyn          1. 
@601  i_finval         1. 
@602  i_oival          1. 
@603  i_nwlook         1. 
@604  i_nwlkwk         1. 
@605  i_rsnnot         1. 
@606  i_losewk         1. 
@607  i_lkweek         1. 
@608  i_lkstr          1. 
@609  i_pyrsn          1. 
@610  i_phmemp         1. 
@611  i_hrswk          1. 
@612  i_hrchk          1. 
@613  i_ptyn           1. 
@614  i_ptwks          1. 
@615  i_ptrsn          1. 
@616  i_ljcw           1. 
@617  i_indus          1. 
@618  i_occup          1. 
@619  i_workyn         1. 
@620  i_wtemp          1. 
@621  i_wkswk          1. 
@622  i_wkchk          1. 
@623  i_ernsrc         1. 
@624  i_noemp          1. 
@631  i_mig2           2. 
@633  i_penpla         1. 
@634  i_peninc         1. 
@635  i_mig1           1. 
@637  tcernval         1. 
@638  tcwsval          1. 
@639  tcseval          1. 
@640  tcffmval         1. 
@641  a_werntf         1. 
@642  a_herntf         1. 
@643  p_mvcare         5. 
@648  p_mvcaid         5. 
@653  emcontrb         4. 
@657  filestat         1. 
@658  dep_stat         2. 
@660  ctc_crd          4. 
@665  eit_cred         4. 
@669  actc_crd         4. 
@674  fica             5. 
@679  fed_ret          5. 
@684  agi              5. 
@689  erp_val          3. 
@692  mwp_val          3. 
@698  tax_inc          5. 
@703  marg_tax         2. 
@705  pemlr            1. 
@706  pruntype         1. 
@707  prwkstat         2. 
@709  prptrea          2. 
@711  prdisc           1. 
@712  prcow1           1. 
@713  prpertyp         1. 
@714  peabsrsn         2. 
@716  peio1cow         2. 
@718  prnlfsch         1. 
@719  pehruslt         3. 
@722  penatvty         3. 
@725  pemntvty         3. 
@728  pefntvty         3. 
@731  peinusyr         2. 
@733  prcitshp         1. 
@734  pxnatvty         2. 
@736  pxmntvty         2. 
@738  pxfntvty         2. 
@740  pxinusyr         2. 
@742  perrp            2. 
@747  i_mig3           1. 
@748  hi               1. 
@749  hityp            1. 
@750  dephi            1. 
@751  hilin1           2. 
@753  hilin2           2. 
@755  paid             1. 
@756  hiout            1. 
@757  priv             1. 
@758  prityp           1. 
@759  depriv           1. 
@760  pilin1           2. 
@762  pilin2           2. 
@764  pout             1. 
@765  out              1. 
@766  care             1. 
@767  caid             1. 
@768  mon              2. 
@770  oth              1. 
@771  otyp_1           1. 
@772  otyp_2           1. 
@773  otyp_3           1. 
@774  otyp_4           1. 
@775  otyp_5           1. 
@776  othstper         1. 
@777  othstyp1         2. 
@779  othstyp2         2. 
@781  othstyp3         2. 
@783  othstyp4         2. 
@785  othstyp5         2. 
@787  othstyp6         2. 
@800  hea              1. 
@801  i_hi             1. 
@802  i_dephi          1. 
@803  i_paid           1. 
@804  i_hiout          1. 
@805  i_priv           1. 
@806  i_depriv         1. 
@807  i_pout           1. 
@808  i_out            1. 
@809  i_care           1. 
@810  i_caid           1. 
@811  i_mon            1. 
@812  i_oth            1. 
@813  i_otyp           1. 
@814  i_ostper         1. 
@815  i_ostyp          1. 
@818  i_hea            1. 
@819  ssi_val          5. 
@824  ws_val           6. 
@830  se_val           6. 
@836  ihsflg           1. 
@837  tsurval1         1. 
@838  tsurval2         1. 
@839  tdisval1         1. 
@840  tdisval2         1. 
@841  tretval1         1. 
@842  tretval2         1. 
@843  tint_val         1. 
@844  tdiv_val         1. 
@845  trnt_val         1. 
@846  ted_val          1. 
@847  tcsp_val         1. 
@848  talm_val         1. 
@849  tfin_val         1. 
@850  nxtres           2. 
@852  i_nxtres         1. 
@853  frm_val          6. 
@863  paidccyn         1. 
@864  paidcyna         1. 
@865  ahiper           1. 
@866  iahiper          1. 
@867  ahityp1          2. 
@869  ahityp2          2. 
@871  ahityp3          2. 
@873  ahityp4          2. 
@875  ahityp5          2. 
@877  ahityp6          2. 
@879  iahityp          1. 
@880  pchip            1. 
@881  i_pchip          1. 
@882  resnss1          1. 
@883  resnss2          1. 
@884  resnssa          1. 
@885  resnssi1         1. 
@886  resnssi2         1. 
@887  resnssia         1. 
@888  ssikidyn         1. 
@889  ssikdyna         1. 
@890  sskidyn          1. 
@891  sskidyna         1. 
@900  wicyn            1. 
@901  wicyna           1. 
@904  industry         4. 
@908  occup            4. 
@912  peridnum       $22. 
@934  fedtax_bc        5. 
@939  fedtax_ac        5. 
@944  statetax_bc       5. 
@949  statetax_ac       5. 
@954  pecohab          2. 
@956  pelnmom          2. 
@958  pelndad          2. 
@960  pemomtyp         2. 
@962  pedadtyp         2. 
@964  pxcohab          2. 
@966  pxlnmom          2. 
@968  pxlndad          2. 
@970  pxmomtyp         2. 
@972  pxdadtyp         2. 
@974  pedisear         2. 
@976  pediseye         2. 
@978  pedisrem         2. 
@980  pedisphy         2. 
@982  pedisdrs         2. 
@984  pedisout         2. 
@986  prdisflg         2. 
@988  pxdisear         2. 
@990  pxdiseye         2. 
@992  pxdisrem         2. 
@994  pxdisphy         2. 
@996  pxdisdrs         2. 
@998  pxdisout         2. 
@1000 m5g_cbst         1. 
@1001 m5g_dscp         1. 
@1002 m5gsame          1. 
@1003 m5g_reg          1. 
@1004 m5g_st           2. 
@1006 m5g_div          2. 
@1008 m5g_mtr1         2. 
@1010 m5g_mtr3         1. 
@1011 m5g_mtr4         1. 
@1012 i_m5g1           1. 
@1013 i_m5g2           2. 
@1015 i_m5g3           1. 
;

output;
end;
drop rectype;


LABEL

	h_seq     = "Household sequence number"             
	hhpos     = "Trailer portion of unique household"   
	hunits    = "Item 78 - How many units in the"       
	hefaminc  = "Family income"                         
	h_respnm  = "Line number of household"              
	h_year    = "Year of survey"                        
	h_hhtype  = "Type of household"                     
	h_numper  = "Number of persons in household"        
	hnumfam   = "Number of families in household"       
	h_type    = "Household type"                        
	h_month   = "Month of survey"                       
	h_mis     = "Month in sample"                       
	h_hhnum   = "Household number"                      
	h_livqrt  = "Item 4 - Type of living quarters ("    
	h_typebc  = "Item 15 - Type B/C"                    
	h_tenure  = "Tenure"                                
	h_telhhd  = "Telephone in household"                
	h_telavl  = "Telephone available"                   
	h_telint  = "Telephone interview acceptable"        
	gereg     = "Region"                                
	gestcen   = "1960 Census State Code"                
	gestfips  = "State FIPS code"                       
	gtcbsa    = "Metropolitan CBSA FIPS CODE"           
	gtco      = "FIPS County Code"                      
	gtcbsast  = "Principal city/Balance status"         
	gtmetsta  = "Metropolitan status"                   
	gtindvpc  = "Individual Principal City Code"        
	gtcbsasz  = "Metropolitan area (CBSA) size"         
	gtcsa     = "Consolidated Statistical Area (CSA)"   
	hunder15  = "Recode"                                
	hh5to18   = "Recode"                                
	hhotlun   = "Item 83 - During 20.. how many of the" 
	hhotno    = "Item 83 - Number of children in"       
	hflunch   = "Item 86 - During 20.. how many of the" 
	hflunno   = "Item 86 - Number receiving free lunch" 
	hpublic   = "Item 88 - Is this a public housing"    
	hlorent   = "Item 89 - Are you paying lower rent"   
	hfoodsp   = "Item 90 - Did anyone in this household"
	hfoodno   = "Item 91 - Number of children covered"  
	hfoodmo   = "Item 92 - Number months covered by"    
	hengast   = "Item 94 - Since October 1, 20.., has"  
	hengval   = "Item 95 - Altogether, how much energy" 
	hinc_ws   = "Recode - Wage and Salary"              
	hwsval    = "Recode - HHLD income - Wages and"      
	hseval    = "Recode - HHLD income - self employment"
	hinc_fr   = "Recode - Farm self-employment"         
	hfrval    = "Recode - HHLD income - Farm income"    
	hinc_uc   = "Recode - Unemployment compensation"    
	hucval    = "Recode - HHLD income - Unemployment"   
	hinc_wc   = "Recode - Worker's compensation"        
	hwcval    = "Recode - HHLD income - Worker's"       
	hss_yn    = "Recode - Social Security payments"     
	hssval    = "Recode - HHLD income - Social Security"
	hssi_yn   = "Recode - Supplemental Security benefit"
	hssival   = "Recode - HHLD income - Supplemental"   
	hpaw_yn   = "Recode - Public Assistance"            
	hpawval   = "Recode - HHLD income - Public"         
	hvet_yn   = "Recode - Veterans' Payments"           
	hvetval   = "Recode - HHLD income - Veteran Payment"
	hsur_yn   = "Recode - Survivor Benefits"            
	hsurval   = "Recode - HHLD income - survivor income"
	hdis_yn   = "Recode - Disability benefits"          
	hdisval   = "Recode - HHLD income - Disability inco"
	hretval   = "Recode - HHLD income - Retirement"     
	hint_yn   = "Recode -interest payments"             
	hintval   = "Recode - HHLD income - Interest income"
	hdiv_yn   = "Recode - Dividend payments"            
	hdivval   = "Recode - HHLD income - dividend income"
	hrnt_yn   = "Recode - Rental payments"              
	hrntval   = "Recode - HHLD income - Rent income"    
	hed_yn    = "Recode - Educational assistance"       
	hedval    = "Recode - HHLD income - Education incom"
	hcsp_yn   = "Recode - Child support payments"       
	hcspval   = "Recode - HHLD income - child support"  
	halm_yn   = "Recode - Alimony payments"             
	halmval   = "Recode - HHLD income - alimony"        
	hfin_yn   = "Recode - Financial assistance payments"
	hfinval   = "Recode - HHLD income - Financial"      
	hoi_yn    = "Other income payments"                 
	hoival    = "Recode - HHLD income - Other income"   
	htotval   = "Recode - Total household income"       
	hearnval  = "Recode - Total household earnings"     
	hothval   = "All other types of income except"      
	hmcare    = "Anyone in HHLD covered by Medicare"    
	hmcaid    = "Anyone in HHLD covered by Medicaid"    
	hchamp    = "CHAMPUS, VA, or military health care"  
	hhi_yn    = "Anyone in HHLD have health insurance"  
	hhstatus  = "Recode - Household status"             
	hunder18  = "Recode - Number of persons in HHLD"    
	htop5pct  = "Recode - Household income percentiles" 
	hpctcut   = "Recode - HHLD income percentiles -"    
	hsup_wgt  = "Final weight (2 implied decimal places"
	h_idnum2  = "Second part of household id number."   
	prop_tax  = "Annual property taxes"                 
	housret   = "Return to home equity"                 
	hrhtype   = "Household type"                        
	h_idnum1  = "First part of household id number."    
	i_hunits  = "Allocation flag for HUNITS"            
	hrpaidcc  = "DID (YOU/ANYONE IN THIS HOUSEHOLD) PAY"
	hrnumwic  = "NUMBER OF PEOPLE IN THE HOUSEHOLD"     
	hrwicyn   = "AT ANY TIME LAST YEAR, (WERE YOU/WAS"  
	hfdval    = "Item 93 - What was the value of all"   
	fh_seq    = "Household sequence number"             
	ffpos     = "Unique family identifier"              
	fkind     = "Kind of family"                        
	ftype     = "Family type"                           
	fpersons  = "Number of persons in family"           
	fheadidx  = "Index to person record of family head" 
	fwifeidx  = "Index to person record of family wife" 
	fhusbidx  = "Index to person record of family"      
	fspouidx  = "Index to person record of family spous"
	flastidx  = "Index to person record of last"        
	fmlasidx  = "Index to person record of last"        
	fownu6    = "Own children in family under 6"        
	fownu18   = "Number of own never married children"  
	frelu6    = "Related persons in family under 6"     
	frelu18   = "Related persons in family under 18"    
	fpctcut   = "Income percentiles"                    
	fpovcut   = "Low income cutoff dollar amount"       
	famlis    = "Ratio of family income to low-income"  
	povll     = "Ratio of family income to low-income"  
	frspov    = "Ratio of related subfamily income to"  
	frsppct   = "Low income cutoff dollar amount of"    
	finc_ws   = "Wage and salary"                       
	fwsval    = "Family income - wages and salaries"    
	finc_se   = "Own business self-employment"          
	fseval    = "Family income - self employment income"
	finc_fr   = "Farm self-employment"                  
	ffrval    = "Family income - Farm income"           
	finc_uc   = "Unemployment compensation"             
	fucval    = "Family income - Unemployment"          
	finc_wc   = "Worker's compensation"                 
	fwcval    = "Family income - Worker's compensation" 
	finc_ss   = "Social Security Benefits"              
	fssval    = "Family income - Social Security"       
	finc_ssi  = "Supplemental Security Benefits"        
	fssival   = "Family income - Supplemental Security" 
	finc_paw  = "Public assistance or welfare benefits" 
	fpawval   = "Family income - public assistance"     
	finc_vet  = "Veterans' Benefits"                    
	fvetval   = "Family income - veteran payments"      
	finc_sur  = "Survivor's payments"                   
	fsurval   = "Family income - Survivor income"       
	finc_dis  = "Disability payments"                   
	fdisval   = "Family income - Disability income"     
	finc_ret  = "Retirement payments"                   
	fretval   = "Family income - Retirement income"     
	finc_int  = "Interest payments"                     
	fintval   = "Family income - Interest income"       
	finc_div  = "Dividend payments"                     
	fdivval   = "Family income - Dividend income"       
	finc_rnt  = "Rental payments"                       
	frntval   = "Family income - Rental income"         
	finc_ed   = "Education benefits"                    
	fedval    = "Family income - Education income"      
	finc_csp  = "Child support payments"                
	fcspval   = "Family income - Child support"         
	finc_alm  = "Alimony payments"                      
	falmval   = "Family income - Alimony"               
	finc_fin  = "Financial assistance payments"         
	ffinval   = "Family income - Financial assistance"  
	finc_oi   = "Other income payments"                 
	foival    = "Family income - Other income"          
	ftotval   = "Total family income"                   
	fearnval  = "Total family earnings"                 
	fothval   = "Total other family income"             
	ftot_r    = "Total family income recode"            
	fspanish  = "Reference person or spouse of Spanish" 
	fsup_wgt  = "Householder or reference person weight"
	ffposold  = "Trailer portion of unique household ID"
	f_mv_fs   = "Family market value of food stamps"    
	f_mv_sl   = "Family market value of school lunch"   
	ffngcare  = "Family fungible value of medicare"     
	ffngcaid  = "Family fungible value of medicaid"     
	fhoussub  = "Family market value of housing subsidy"
	ffoodreq  = "Based on USDA figures"                 
	fhousreq  = "Used to compute fungible value of"     
	ph_seq    = "Household seq number"                  
	pppos     = "Trailer portion of unique household ID"
	a_lineno  = "Item 18a - Line number"                
	a_parent  = "Item 18c - Parent's line number"       
	a_exprrp  = "Expanded relationship code"            
	a_age     = "Item 18d - Age"                        
	a_maritl  = "Item 18e - Marital status"             
	a_spouse  = "Item 18f - Spouse's line number"       
	a_sex     = "Item 18g - Sex"                        
	a_hga     = "Item 18h - Educational attainment"     
	prdtrace  = "Race"                                  
	p_stat    = "Status of person identifier"           
	pehspnon  = "Are you Spanish, Hispanic, or Latino?" 
	prdthsp   = "Detailed Hispanic recode"              
	a_famnum  = "Family number"                         
	a_famtyp  = "Family type"                           
	a_famrel  = "Family relationship"                   
	a_pfrel   = "Primary family relationship"           
	hhdrel    = "Detailed household summary"            
	famrel    = "Family relationship"                   
	hhdfmx    = "Detailed household and family status"  
	parent    = "Family members under 18 (excludes"     
	age1      = "Age recode - Persons 15+ years"        
	phf_seq   = "Pointer to the sequence number of own" 
	pf_seq    = "Pointer to the sequence number of fami"
	a_fnlwgt  = "Final weight (2 implied decimal places"
	a_ernlwt  = "Earnings/not in labor force weight"    
	marsupwt  = "Supplement final weight (2 implied"    
	a_hrs1    = "How many hrs did ... work last week"   
	a_uslft   = "Does ... usually work 35 hrs or more a"
	a_whyabs  = "Why was ... absent from work last week"
	a_payabs  = "Is ... receiving wages or salary for"  
	peioind   = "Industry"                              
	peioocc   = "Occupation"                            
	a_wkslk   = "Duration of unemployment"              
	a_whenlj  = "When did ... last work?"               
	a_clswkr  = "Class of worker"                       
	ppposold  = "Trailer portion of unique household id"
	a_nlflj   = "When did ... last work for pay at a"   
	a_wantjb  = "Does ... want a regular job now,"      
	peafever  = "Did you ever serve on active duty in"  
	peafwhn1  = "When did you serve?"                   
	peafwhn2  = "When did you serve?"                   
	peafwhn3  = "When did you serve?"                   
	peafwhn4  = "When did you serve?"                   
	a_uslhrs  = "How many hrs per week does ..."        
	a_hrlywk  = "Is ... paid by the hour on this job?"  
	a_hrspay  = "How much does ... earn per hour?"      
	a_grswk   = "How much does ... usually earn per"    
	a_unmem   = "On this job, is ... a member of a"     
	a_uncov   = "On this job, is ... covered by a union"
	a_enrlw   = "Last week was ... attending or"        
	a_ftpt    = "Is ... enrolled in school as a full-"  
	a_lfsr    = "Labor force status recode"             
	a_untype  = "Reason for unemployment"               
	a_wkstat  = "Full/part-time status"                 
	a_explf   = "Experienced labor force employment"    
	a_wksch   = "Labor force by time worked or lost"    
	a_civlf   = "Civilian labor force"                  
	a_ftlf    = "Full/time labor force"                 
	a_mjind   = "Major industry code"                   
	a_dtind   = "Detailed industry recode"              
	mjocc     = "Major occupation recode"               
	a_dtocc   = "Detailed occupation recode"            
	prerelg   = "Earnings eligibility flag"             
	workyn    = "Item 29a - Did ... work at a job or"   
	wtemp     = "Item 29b - Did ... do any temporary,"  
	nwlook    = "Item 30 - Even though ... did not work"
	nwlkwk    = "Item 31 - How may different weeks"     
	rsnnotw   = "Item 32 - What was the main"           
	wkswork   = "Item 33 - During 20.. in how many week"
	wkcheck   = "Item 34 - Interviewer check item -"    
	losewks   = "Item 35 Did ... lose any full weeks of"
	lknone    = "Item 36 -  You said... worked about"   
	lkweeks   = "Item 36 - Weeks was ... looking for"   
	lkstrch   = "Item 37 - Were the (entry in item 36)" 
	pyrsn     = "Item 38 - What was the main reason ..."
	phmemprs  = "Item 39 - For how many employers did ."
	hrswk     = "Item 41 - In the weeks that ... worked"
	hrcheck   = "Item 41 - Interviewer check item -"    
	ptyn      = "Item 43 - Did ... work less than"      
	ptweeks   = "Item 44 - How many weeks did ... work" 
	ptrsn     = "Item 45 - What was the main reason ..."
	ljcw      = "Item 46e - Class of worker"            
	wexp      = "Recode -  Worker/nonworker recode -"   
	wewkrs    = "Recode -  Worker/nonworker recode -"   
	welknw    = "Recode -  Worker/nonworker recode -"   
	weuemp    = "Recode - Worker/nonworker recode - Par"
	earner    = "Recode - Earner status"                
	clwk      = "Recode - Longest job class of worker"  
	weclw     = "Recode - Longest job class of worker"  
	poccu2    = "Recode - Occupation of longest job by" 
	wemocg    = "Recode - Occupation of longest job by" 
	weind     = "Recode - Industry of longest job by"   
	wemind    = "Recode - Industry of longest job by"   
	mig_cbst  = "Item 55a - Metropolitan statistical ar"
	migsame   = "Was ... living in this house (apt.) 1" 
	mig_reg   = "Recode - Region of previous residence" 
	mig_st    = "Recode - FIPS State code of previous"  
	mig_dscp  = "Recode - CBSA status of residence 1 ye"
	gediv     = "Recode - Census division of current"   
	mig_div   = "Recode - Census division of previous"  
	noemp     = "Item 47 - Counting all locations where"
	ern_yn    = "Earnings from longest job recode"      
	ern_val   = "Item 48a &  b - How much did ... earn" 
	ern_srce  = "Earnings  recode"                      
	ern_otr   = "Item 49a - Did ... earn money from oth"
	wageotr   = "Item 49b -Other wage and salary earnin"
	prswkxpns = "Recode"                                
	wsal_yn   = "Recode"                                
	wsal_val  = "Recode - Total wage and salary earning"
	seotr     = "Item 49b - Other work - Own business"  
	semp_yn   = "Recode - Any own business self-"       
	semp_val  = "ERN-YN = 1 or SEOTR = 1"               
	frmotr    = "Item 49b- Farm self-employment"        
	frse_yn   = "Any own farm self-employment in ERN-YN"
	frse_val  = "Recode - Total amount of farm self-"   
	uc_yn     = "Item 52a - At any time during 20.."    
	subuc     = "Item 52a - At any time during 20.."    
	strkuc    = "Item 52a -At any time during 20.."     
	uc_val    = "Item 52b - How much did ... receive in"
	wc_yn     = "Item 53a - During 20.. did ... receive"
	wc_type   = "Item 53b"                              
	wc_val    = "Item 53c - How much compensation did"  
	ss_yn     = "Item 56b - Did ... receive s.s.?"      
	ss_val    = "Item 56c - How much did ... receive in"
	ssi_yn    = "Item 57b - Did ... receive SSI?"       
	paw_yn    = "Item 59b - Did ... receive public"     
	paw_typ   = "Item 59c - Did ... receive tanf/AFDC o"
	paw_mon   = "Item 59d - In how many months of 20.." 
	paw_val   = "Item 59e - How much did ... receive in"
	vet_yn    = "Item 60b - Did ... receive veterans'"  
	vet_typ1  = "Item 60c - Disability compensation"    
	vet_typ2  = "Item 60c - Survivor benefits"          
	vet_typ3  = "Item 60c - Veterans' pension"          
	vet_typ4  = "Item 60c - Education assistance"       
	vet_typ5  = "Item 60c - Other veterans' payments"   
	vet_qva   = "Item 60d - Is ... required to fill out"
	vet_val   = "Item 60e - How much did ... receive fr"
	sur_yn    = "Item 61b - Other than social security" 
	sur_sc1   = "Item 61c - What was the source of this"
	sur_sc2   = "Item 61d - Any other pension or"       
	sur_val1  = "Item 61e - how much did ... receive fr"
	sur_val2  = "Item 61g - How much did ... receive"   
	srvs_val  = "Recode total amount of survivor's inco"
	dis_hp    = "Item 62b -  Does ... have a health"    
	dis_cs    = "Item 62c - Did ... retire or leave a j"
	dis_yn    = "Item 64b - Other than social security "
	dis_sc1   = "Item 64c - What was the source of inco"
	dis_sc2   = "Item 64c - Any other disability income"
	dis_val1  = "Item 64e - How much did ... receive fr"
	dis_val2  = "Item 64g - How much did ... receive fr"
	dsab_val  = "Recode total amount of disability inco"
	ret_yn    = "Item 65b - Other than social security" 
	ret_sc1   = "Item 65c - What was the source of"     
	ret_sc2   = "Item 65c - Any other retirement income"
	ret_val1  = "Item 65e - How much did ... receive fr"
	ret_val2  = "Item 65g - How much did ... receive fr"
	rtm_val   = "Recode total amount of retirement inco"
	int_yn    = "Item 66b - Did... own any interest"    
	int_val   = "Item 66c - How much did ... receive in"
	div_yn    = "Item 67b - Did ... own any shares of s"
	div_non   = "Item 67c - No dividends received"      
	div_val   = "Item 67c - How much did ... receive in"
	rnt_yn    = "Item 68b - Did ... own any land,"      
	rnt_val   = "Item 68c - How much did ... receive in"
	ed_yn     = "Item 69c - Did ... receive educational"
	oed_typ1  = "Item Q66d(2,3,&  4) - Source of"       
	oed_typ2  = "Item Q66d(5) - Source of educational"  
	oed_typ3  = "Item Q66d(6)- Source of educational"   
	ed_val    = "Item 69h - Total amount of educational"
	csp_yn    = "Item 70b - Did ... receive child suppo"
	csp_val   = "Item 70c - How much did ... receive in"
	alm_yn    = "Item 71b - Did .. rec’v alimony paymnt"
	alm_val   = "Item 71c - How much did ... receive in"
	fin_yn    = "Item 72b - Did ... receive financial"  
	fin_val   = "Item 72c - How much did ... receive in"
	oi_off    = "Item 73c"                              
	oi_yn     = "Item 73b - Did ... receive other incom"
	oi_val    = "Item 73d - How much did ... receive in"
	ptotval   = "Recode - Total persons income"         
	pearnval  = "Recode - Total persons earnings"       
	pothval   = "Recode - Total other persons income"   
	ptot_r    = "Recode - Total person income recode"   
	perlis    = "Recode - Low-income level of persons"  
	mcare     = "Item 74b - Was ... covered by medicare"
	mcaid     = "Item 74d - Was ... covered by medicaid"
	champ     = "Item 74f - Was ... covered by CHAMPUS,"
	hi_yn     = "Item 75b - Was ... covered by private" 
	hiown     = "Item 75c - Was this health insurance"  
	hiemp     = "Item 75d - Was this health insurance"  
	hipaid    = "Item 75e - Did ...'s employer or union"
	wrk_ck    = "Item 76 - Interviewer check item worke"
	penplan   = "Item 76a - Other than social security" 
	penincl   = "Item 76b - Was ... included in that"   
	cov_gh    = "Recode - Includes dependents included" 
	cov_hi    = "Recode - Includes dependents covered b"
	ch_mc     = "A-AGE less than 15"                    
	ch_hi     = "A-AGE less than 15"                    
	a1rrp     = "Relationship to reference person"      
	a1age     = "Age allocation flag"                   
	a1maritl  = "Marital status allocation flag"        
	a1spouse  = "Spouse's line number allocation flag"  
	a1sex     = "Sex allocation flag"                   
	a1hga     = "Highest grade attended allocation flag"
	pxrace1   = "Allocation flag for PRDTRACE"          
	a1lfsr    = "Labor force status recode allocation"  
	pxhspnon  = "Allocation flag for PEHSPNON"          
	pxafever  = "Allocation flag for PEAFEVER"          
	pxafwhn1  = "Allocation flag for PEAFWHN1"          
	toi_val   = "Other income"                          
	i_mig2    = "MIG-ST imputation flag."               
	i_mig1    = "MIGSAME imputation flag."              
	tcernval  = "Earnings from employer or self-"       
	tcwsval   = "Wage and salary income topcoded flag"  
	tcseval   = "Nonfarm self employment income"        
	tcffmval  = "Farm self employment income topcoded"  
	a_werntf  = "Current earnings - Weekly pay"         
	a_herntf  = "Current earnings - Hourly pay"         
	p_mvcare  = "Person market value of medicare"       
	p_mvcaid  = "Person market value of medicaid"       
	emcontrb  = "Employer contribution for health"      
	filestat  = "Tax Filer status"                      
	dep_stat  = "Dependency status pointer"             
	ctc_crd   = "Child Tax Credit"                      
	eit_cred  = "Earn income tax credit"                
	actc_crd  = "Additional Child tax credit"           
	fica      = "Social security retirement payroll"    
	fed_ret   = "Federal retirement payroll deduction"  
	agi       = "Adjusted gross income"                 
	erp_val   = "Amount received from Economic"         
	mwp_val   = "Credit received from Making Work Pay"  
	tax_inc   = "Taxable income amount"                 
	marg_tax  = "Federal Income Marginal tax rate"      
	pemlr     = "Major labor force recode"              
	pruntype  = "Reason for unemployment"               
	prwkstat  = "Full/part-time work status"            
	prptrea   = "Detailed reason for part-time"         
	prdisc    = "Discouraged worker recode"             
	prcow1    = "Class of worker recode-job 1"          
	prpertyp  = "Type of person record recode"          
	peabsrsn  = "What was the main reason...was absent" 
	peio1cow  = "Individual class of worker on first jo"
	prnlfsch  = "NLF activity in school or not in schoo"
	pehruslt  = "Hours usually worked last week"        
	penatvty  = "In what country were you born?"        
	pemntvty  = "In what country was your mother born?" 
	pefntvty  = "In what country was your father born?" 
	peinusyr  = "When did you come to the U.S. to stay?"
	pxnatvty  = "Allocation flag for PENATVTY"          
	pxmntvty  = "Allocation flag for PEMNTVTY"          
	pxfntvty  = "Allocation flag for PEFNTVTY"          
	pxinusyr  = "Allocation flag for PEINUSYR"          
	perrp     = "Expanded relationship categories"      
	i_mig3    = "Imputation flag."                      
	hi        = "Covered by a health plan provided"     
	hityp     = "Health insurance plan type."           
	dephi     = "Covered by a health plan through"      
	hilin1    = "Line number of policyholder, 1st"      
	hilin2    = "Line number of policyholder, 2nd"      
	paid      = "Did ...'s former or current employer o"
	hiout     = "Employer or union plan covered someone"
	priv      = "Covered by a plan that they purchased" 
	prityp    = "Private health insurance plan type."   
	depriv    = "Covered by private plan not related to"
	pilin1    = "Line number of policyholder, 1st"      
	pilin2    = "Line number of policyholder, 2nd"      
	pout      = "Private plan covered someone outside"  
	out       = "Covered by the health plan of someone" 
	care      = "Covered by medicare, the health"       
	caid      = "Covered by (medicaid/local name), the" 
	mon       = "Number of months covered by medicaid"  
	oth       = "Covered by any other kind of health"   
	otyp_1    = "Covered by TRICARE, CHAMPUS, or milita"
	otyp_2    = "Covered by CHAMPVA."                   
	otyp_3    = "Covered by VA."                        
	otyp_4    = "Covered by Indian health."             
	otyp_5    = "Covered by other."                     
	othstper  = "Covered by other type of health"       
	othstyp1  = "Other type of health insurance include"
	hea       = "Would you say ...'s health in general" 
	i_hi      = "Imputation item: HI"                   
	i_dephi   = "Imputation item: DEPHI"                
	i_paid    = "Imputation item: PAID"                 
	i_hiout   = "Imputation item: HIOUT"                
	i_priv    = "Imputation item: PRIV"                 
	i_depriv  = "Imputation item: DEPRIV"               
	i_pout    = "Imputation item: POUT"                 
	i_out     = "Imputation item: OUT"                  
	i_care    = "Imputation item: CARE"                 
	i_caid    = "Imputation item: CAID"                 
	i_mon     = "Imputation item: MON"                  
	i_oth     = "Imputation item: oth"                  
	i_otyp    = "Imputation items: OTYP-1, ..., OTYP-5."
	i_ostper  = "Imputation item: OTHSTPER"             
	i_ostyp   = "Imputation items: OTHSTYP1, ...,"      
	i_hea     = "Imputation item: HEA"                  
	ssi_val   = "Item 57c - How much did ... receive in"
	ws_val    = "Item 49b - Other wage and salary"      
	se_val    = "Item 49b - Other work - Own business"  
	ihsflg    = "Recode:  Covered by Indian Health"     
	tsurval1  = "Survivors income, source 1,"           
	tsurval2  = "Survivors income, source 2,"           
	tdisval1  = "Disability income, source 1,"          
	tdisval2  = "Disability income, source 2,"          
	tretval1  = "Retirement income, source 1,"          
	tretval2  = "Retirement income, source 2,"          
	tint_val  = "Interest income"                       
	tdiv_val  = "Dividend income"                       
	trnt_val  = "Rent income"                           
	ted_val   = "Education assistance"                  
	tcsp_val  = "Child support payments"                
	talm_val  = "Alimony payments"                      
	tfin_val  = "Financial assistance"                  
	nxtres    = "What was ... main reason for moving?"  
	i_nxtres  = "Imputation flag"                       
	frm_val   = "Item 49b - Farm self-employment earnin"
	paidccyn  = "Which children needed paid-care while" 
	paidcyna  = "PAIDCCYN allocation flag."             
	ahiper    = "Does person with no coverage reported" 
	iahiper   = "AHIPER allocation flag."               
	ahityp6   = "What type of insurance (was/were)"     
	iahityp   = "AHITYP allocation flag."               
	pchip     = "Was child under age 19 covered by"     
	i_pchip   = "PCHIP allocation flag."                
	resnss1   = "What were the reasons (you/name)"      
	resnss2   = "What were the reasons (you/name)"      
	resnssa   = "RESNSS1-2 allocation flag"             
	resnssi1  = "What were the reasons (you/name)"      
	resnssi2  = "What were the reasons (you/name)"      
	resnssia  = "RESNSSI1-2 allocation flag"            
	ssikidyn  = "Which children under age 18 were"      
	ssikdyna  = "SSIKIDYN allocation flag"              
	sskidyn   = "Which children under age 19 were"      
	sskidyna  = "SSKIDYN allocation flag"               
	wicyn     = "Who received WIC?"                     
	wicyna    = "WICYN allocation flag"                 
	industry  = "Industry of longest job"               
	occup     = "Occupation of longest job"             
	peridnum  = "22 digit Unique Person identifier"     
	fedtax_bc = "Federal income tax liability, before"  
	fedtax_ac = "Federal income tax liability, after al"
	statetax_bc= "State income tax liability, before cre"
	statetax_ac= "State income tax liability, after all" 
	pecohab   = "Demographics line number of cohabiting"
	pelnmom   = "Demographics line number of Mother"    
	pelndad   = "Demographics line number of Father"    
	pemomtyp  = "Demographics type of Mother"           
	pedadtyp  = "Demographics type of Father"           
	pxcohab   = "Demographics allocation flag for PECOH"
	pxlnmom   = "Demographics  Allocation flag for"     
	pxlndad   = "Demographics  Allocation flag for"     
	pxmomtyp  = "Demographics  Allocation flag for PEMO"
	pxdadtyp  = "Demographics  Allocation flag for PEDA"
	pedisear  = "Is...deaf or does ...have serious"     
	pediseye  = "Is...blind or does...have serious"     
	pedisrem  = "Because of a physical, mental, or"     
	pedisphy  = "Does...have serious difficulty"        
	pedisdrs  = "Does...have difficulty dressing or"    
	pedisout  = "Because of a physical, mental, or"     
	prdisflg  = "Does this person have any of these"    
	pxdisear  = "Allocation Flag"                       
	pxdiseye  = "Allocation Flag"                       
	pxdisrem  = "Allocation Flag"                       
	pxdisphy  = "Allocation Flag"                       
	pxdisdrs  = "Allocation Flag"                       
	pxdisout  = "Allocation Flag"                       
	m5g_cbst  = "Metropolitan statistical area status"  
	m5g_dscp  = "Recode - CBSA status of residence 5"   
	m5gsame   = "Was ... living in this house (apt.) 5" 
	m5g_reg   = "Recode - Region of previous residence" 
	m5g_st    = "Recode - FIPS State code of previous"  
	m5g_div   = "Recode - Census division of previous"  
	i_m5g1    = "M5GSAME imputation flag."              
	i_m5g2    = "M5G-ST imputation flag."               
	i_m5g3    = "Imputation flag."                      
; 


/*----------------------------------------------

The PROC FORMAT statement will store the formats
in a sas data set called fcpmar10 .
To use the stored formats in a subsequent program,
include something like this:

proc format cntlin=library.fcpmar10;
PROC freq;
        tables PULAYCK1 ;
        format PULAYCK1   PULAYCKa.;

For more information, consult the PROC FORMAT
section of the SAS Procedures Guide

  ----------------------------------------------*/

PROC FORMAT cntlout=library.fcpmar10;

;
VALUE hrecord 	(default=32)
	1         =  "Household record"              
;
VALUE hunits  	(default=32)
	1         =  "1 Unit"                        
	2         =  "2 Units"                       
	3         =  "3 - 4 Units"                   
	4         =  "5 - 9 Units"                   
	5         =  "10+ Units"                     
;
VALUE hefaminc	(default=32)
	-1        =  "Not in universe"               
	1         =  "Less than $5,000"              
	2         =  "$5,000 to $7,499"              
	3         =  "$7,500 to $9,999"              
	4         =  "$10,000 to $12,499"            
	5         =  "$12,500 to $14,999"            
	6         =  "$15,000 to $19,999"            
	7         =  "$20,000 to $24,999"            
	8         =  "$25,000 to $29,999"            
	9         =  "$30,000 to $34,999"            
	10        =  "$35,000 to $39,999"            
	11        =  "$40,000 to $49,999"            
	12        =  "$50,000 to $59,999"            
	13        =  "$60,000 to $74,999"            
	14        =  "$75,000 to $99,999"            
	15        =  "$100,000 to $149,999"          
	16        =  "$150,000 and over"             
;
VALUE h_respnm	(default=32)
	-1        =  "Not in universe (non-interview)"
	0         =  "Blank or impossible"           
;
VALUE h_hhtype	(default=32)
	1         =  "Interview"                     
	2         =  "Type A non-interview"          
	3         =  "Type B/C non-interview"        
;
VALUE h_numper	(default=32)
	0         =  "Noninterview household"        
;
VALUE hnumfam 	(default=32)
	0         =  "Noninterview household"        
;
VALUE h_type  	(default=32)
	0         =  "Non-interview household"       
	1         =  "Husband/wife primary family"   
	2         =  "Husband/wife primary family"   
	3         =  "Unmarried civilian male"       
	4         =  "Unmarried civilian female"     
	5         =  "Primary family household -"    
	6         =  "Civilian male nonfamily"       
	7         =  "Civilian female nonfamily"     
	8         =  "Nonfamily householder"         
	9         =  "Group quarters"                
;
VALUE h_month 	(default=32)
	3         =  "March"                         
;
VALUE h_hhnum 	(default=32)
	0         =  "Blank"                         
;
VALUE h_livqrt	(default=32)
	1         =  "House, apt., flat"             
	2         =  "HU in nontransient hotel, etc."
	3         =  "HU, perm,  in trans. hotel,"   
	4         =  "HU in rooming house"           
	5         =  "Mobile home or trailer with no"
	6         =  "Mobile home or trailer with 1" 
	7         =  "HU not specified above"        
	8         =  "Qtrs not hu in rooming or"     
	9         =  "Unit not perm in trans. hotel,"
	10        =  "Tent or trailer site"          
	11        =  "Student quarters in college"   
	12        =  "Other not HU"                  
;
VALUE h_typebc	(default=32)
	0         =  "Interviewed, or Type A"        
	1         =  "Vacant - regular"              
	2         =  "Vacant - storage of HHLD"      
	3         =  "Temp occ by persons with URE"  
	4         =  "Unfit or to be demolished"     
	5         =  "Under construction, not ready" 
	6         =  "Converted to temp business or" 
	7         =  "Occ by AF members or persons"  
	8         =  "Unocc tent or trailer site"    
	9         =  "Permit granted, construction"  
	10        =  "Other"                         
	11        =  "Demolished"                    
	12        =  "House or trailer moved"        
	13        =  "Outside segment"               
	14        =  "Converted to perm business"    
	15        =  "Merged"                        
	16        =  "Condemned"                     
	17        =  "Built after April 1, 1980"     
	18        =  "Unused line of listing sheet"  
	19        =  "Other"                         
;
VALUE h_tenure	(default=32)
	0         =  "Not in universe"               
	1         =  "Owned or being bought"         
	2         =  "Rent"                          
	3         =  "No cash rent"                  
;
VALUE h_telhhd	(default=32)
	0         =  "Not in universe (non-interview)"
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE h_telavl	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE h_telint	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE gereg   	(default=32)
	1         =  "Northeast"                     
	2         =  "Midwest"                       
	3         =  "South"                         
	4         =  "West"                          
;
VALUE gestcen 	(default=32)
	11        =  "Maine"                         
	12        =  "New Hampshire"                 
	13        =  "Vermont"                       
	14        =  "Massachusetts"                 
	15        =  "Rhode Island"                  
	16        =  "Connecticut"                   
	21        =  "New York"                      
	22        =  "New Jersey"                    
	23        =  "Pennsylvania"                  
	31        =  "Ohio"                          
	32        =  "Indiana"                       
	33        =  "Illinois"                      
	34        =  "Michigan"                      
	35        =  "Wisconsin"                     
	41        =  "Minnesota"                     
	42        =  "Iowa"                          
	43        =  "Missouri"                      
	44        =  "North Dakota"                  
	45        =  "South Dakota"                  
	46        =  "Nebraska"                      
	47        =  "Kansas"                        
	51        =  "Delaware"                      
	52        =  "Maryland"                      
	53        =  "District Of Columbia"          
	54        =  "Virginia"                      
	55        =  "West Virginia"                 
	56        =  "North Carolina"                
	57        =  "South Carolina"                
	58        =  "Georgia"                       
	59        =  "Florida"                       
	61        =  "Kentucky"                      
	62        =  "Tennessee"                     
	63        =  "Alabama"                       
	64        =  "Mississippi"                   
	71        =  "Arkansas"                      
	72        =  "Louisiana"                     
	73        =  "Oklahoma"                      
	74        =  "Texas"                         
	81        =  "Montana"                       
	82        =  "Idaho"                         
	83        =  "Wyoming"                       
	84        =  "Colorado"                      
	85        =  "New Mexico"                    
	86        =  "Arizona"                       
	87        =  "Utah"                          
	88        =  "Nevada"                        
	91        =  "Washington"                    
	92        =  "Oregon"                        
	93        =  "California"                    
	94        =  "Alaska"                        
	95        =  "Hawaii"                        
;
VALUE gtcbsa  	(default=32)
	0         =  "Non-met or not identified"     
;
VALUE gtco    	(default=32)
	0         =  "Not identified"                
;
VALUE gtcbsast	(default=32)
	1         =  "Principal city"                
	2         =  "Balance of CBSA"               
	3         =  "Non CBSA"                      
	4         =  "Not identified"                
;
VALUE gtmetsta	(default=32)
	1         =  "Metropolitan"                  
	2         =  "Non-metropolitan"              
	3         =  "Not identified"                
;
VALUE gtindvpc	(default=32)
	0         =  "Not identified, non-met, or"   
;
VALUE gtcbsasz	(default=32)
	0         =  "Not identified or"             
	2         =  "100,000 - 249,999"             
	3         =  "250,000 - 499,999"             
	4         =  "500,000 - 999,999"             
	5         =  "1,000,000 - 2,499,999"         
	6         =  "2,500,000 - 4,999,999"         
	7         =  "5,000,000+"                    
;
VALUE gtcsa   	(default=32)
	0         =  "Non-met or not identified"     
;
VALUE hunder1e	(default=32)
	0         =  "None"                          
;
VALUE hh5to18l	(default=32)
	0         =  "None"                          
;
VALUE hhotlun 	(default=32)
	0         =  "Not in universe"               
	1         =  "All or some"                   
	2         =  "None"                          
;
VALUE hhotno  	(default=32)
	0         =  "Not in universe"               
	1         =  "1 child"                       
	9         =  "9 or more children"            
;
VALUE hflunch 	(default=32)
	0         =  "Not in universe"               
	1         =  "Some or all"                   
	2         =  "None"                          
;
VALUE hflunno 	(default=32)
	0         =  "Not in universe"               
	1         =  "1"                             
	9         =  "9 or more"                     
;
VALUE hpublic 	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hlorent 	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hfoodsp 	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hfoodno 	(default=32)
	0         =  "Not in universe"               
	1         =  "1"                             
	9         =  "9 or more"                     
;
VALUE hfoodmo 	(default=32)
	0         =  "Not in universe"               
	1         =  "1 month"                       
	12        =  "12 Months"                     
;
VALUE hengast 	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hengval 	(default=32)
	0         =  "Not in universe"               
;
VALUE hinc_ws 	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hwsval  	(default=32)
	0         =  "None or not in universe"       
;
VALUE hinc_se 	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hseval  	(default=32)
	0         =  "None or not in universe"       
;
VALUE hinc_fr 	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hfrval  	(default=32)
	0         =  "None or not in universe"       
;
VALUE hinc_uc 	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hucval  	(default=32)
	0         =  "None or not in universe"       
;
VALUE hinc_wc 	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hwcval  	(default=32)
	0         =  "None or not in universe"       
;
VALUE hss_yn  	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hssval  	(default=32)
	0         =  "None or not in universe"       
;
VALUE hssi_yn 	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hssival 	(default=32)
	0         =  "None"                          
;
VALUE hpaw_yn 	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hpawval 	(default=32)
	0         =  "None"                          
;
VALUE hvet_yn 	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hvetval 	(default=32)
	0         =  "None or not in universe"       
;
VALUE hsur_yn 	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hsurval 	(default=32)
	0         =  "None or not in universe"       
;
VALUE hdis_yn 	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hdisval 	(default=32)
	0         =  "None or not in universe"       
;
VALUE hret_yn 	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hretval 	(default=32)
	0         =  "None or not in universe"       
;
VALUE hint_yn 	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hintval 	(default=32)
	0         =  "None or not in universe"       
;
VALUE hdiv_yn 	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hdivval 	(default=32)
	0         =  "None or not in universe"       
;
VALUE hrnt_yn 	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hrntval 	(default=32)
	0         =  "None or not in universe"       
;
VALUE hed_yn  	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hedval  	(default=32)
	0         =  "None or not in universe"       
;
VALUE hcsp_yn 	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hcspval 	(default=32)
	0         =  "None or not in universe"       
;
VALUE halm_yn 	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE halmval 	(default=32)
	0         =  "None or not in universe"       
;
VALUE hfin_yn 	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hfinval 	(default=32)
	0         =  "None or not in universe"       
;
VALUE hoi_yn  	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hoival  	(default=32)
	0         =  "None or not in universe"       
;
VALUE htotval 	(default=32)
	0         =  "None or not in universe"       
;
VALUE hearnval	(default=32)
	0         =  "None or not in universe"       
;
VALUE hothval 	(default=32)
	0         =  "None or not in universe"       
;
VALUE hhinc   	(default=32)
	0         =  "Not in universe"               
	1         =  "Under $2,500"                  
	2         =  "$2,500 to $4,999"              
	3         =  "$5,000 to $7,499"              
	4         =  "$7,500 to $9,999"              
	5         =  "$10,000 to $12,499"            
	6         =  "$12,500 to $14,999"            
	7         =  "$15,000 to $17,499"            
	8         =  "$17,500 to $19,999"            
	9         =  "$20,000 to $22,499"            
	10        =  "$22,500 to $24,999"            
	11        =  "$25,000 to $27,499"            
	12        =  "$27,500 to $29,999"            
	13        =  "$30,000 to $32,499"            
	14        =  "$32,500 to $34,999"            
	15        =  "$35,000 to $37,499"            
	16        =  "$37,500 to $39,999"            
	17        =  "$40,000 to $42,499"            
	18        =  "$42,500 to $44,999"            
	19        =  "$45,000 to $47,499"            
	20        =  "$47,500 to $49,999"            
	21        =  "$50,000 to $52,499"            
	22        =  "$52,500 to $54,999"            
	23        =  "$55,000 to $57,499"            
	24        =  "$57,500 to $59,999"            
	25        =  "$60,000 to $62,499"            
	26        =  "$62,500 to $64,999"            
	27        =  "$65,000 to $67,499"            
	28        =  "$67,500 to $69,999"            
	29        =  "$70,000 to $72,499"            
	30        =  "$72,500 to $74,999"            
	31        =  "$75,000 to $77,499"            
	32        =  "$77,500 to $79,999"            
	33        =  "$80,000 to $82,499"            
	34        =  "$82,500 to $84,999"            
	35        =  "$85,000 to $87,499"            
	36        =  "$87,500 to $89,999"            
	37        =  "$90,000 to $92,499"            
	38        =  "$92,500 to $94,999"            
	39        =  "$95,000 to $97,499"            
	40        =  "$97,500 to $99,999"            
	41        =  "$100,000 and over"             
;
VALUE hmcare  	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hmcaid  	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hchamp  	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hhi_yn  	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hhstatus	(default=32)
	0         =  "Not in universe (group"        
	1         =  "Primary family"                
	2         =  "Nonfamily householder living"  
	3         =  "Nonfamily householder living"  
;
VALUE hunder1h	(default=32)
	0         =  "None"                          
;
VALUE htop5pct	(default=32)
	0         =  "Not in universe (group"        
	1         =  "In top 5 percent"              
	2         =  "Not in top 5 percent"          
;
VALUE hpctcut 	(default=32)
	0         =  "Not in universe (group"        
	1         =  "Lowest 5 percent"              
	2         =  "Second 5 percent"              
	20        =  "Top 5 percent"                 
;
VALUE h1tenure	(default=32)
	0         =  "No change"                     
	1         =  "Value to blank"                
	4         =  "Allocated"                     
;
VALUE h1livqrt	(default=32)
	0         =  "No change"                     
	4         =  "Allocated"                     
	7         =  "Blank to NA - no error"        
;
VALUE h1telhhd	(default=32)
	0         =  "No change"                     
	1         =  "Value to blank"                
	4         =  "Allocated"                     
;
VALUE h1telavl	(default=32)
	0         =  "No change"                     
	1         =  "Value to blank"                
	4         =  "Allocated"                     
;
VALUE h1telint	(default=32)
	0         =  "No change"                     
	1         =  "Value to blank"                
	4         =  "Allocated"                     
;
VALUE i_hhotlu	(default=32)
	0         =  "No change"                     
	1         =  "Allocated"                     
;
VALUE i_hhotno	(default=32)
	0         =  "No change"                     
	1         =  "Allocated"                     
;
VALUE i_hflunc	(default=32)
	0         =  "No change"                     
	1         =  "Allocated"                     
;
VALUE i_hflunn	(default=32)
	0         =  "No change"                     
	1         =  "Allocated"                     
;
VALUE i_hpubli	(default=32)
	0         =  "No change"                     
	1         =  "Allocated"                     
;
VALUE i_hloren	(default=32)
	0         =  "No change"                     
	1         =  "Allocated"                     
;
VALUE i_hfoods	(default=32)
	0         =  "No change"                     
	1         =  "Allocated"                     
;
VALUE i_hfdval	(default=32)
	0         =  "No change"                     
	1         =  "Allocated"                     
;
VALUE i_hfoodn	(default=32)
	0         =  "No change"                     
	1         =  "Allocated"                     
;
VALUE i_hfoodm	(default=32)
	0         =  "No change"                     
	1         =  "Allocated"                     
;
VALUE i_hengas	(default=32)
	0         =  "No change"                     
	1         =  "Allocated"                     
;
VALUE i_hengva	(default=32)
	0         =  "No change"                     
	1         =  "Allocated"                     
;
VALUE prop_tax	(default=32)
	0         =  "None"                          
;
VALUE housret 	(default=32)
	0         =  "None"                          
;
VALUE hrhtype 	(default=32)
	0         =  "Non-interview household"       
	1         =  "Husband/wife primary family"   
	2         =  "Husband/wife primary family"   
	3         =  "Unmarried civilian male"       
	4         =  "Unmarried civilian female"     
	5         =  "Primary family household -"    
	6         =  "Civilian male nonfamily"       
	7         =  "Civilian female nonfamily"     
	8         =  "Nonfamily householder"         
	9         =  "Group quarters with actual"    
	10        =  "Group quarters with secondary" 
;
VALUE i_hunits	(default=32)
	0         =  "No change"                     
	1         =  "Allocated"                     
;
VALUE hrpaidcc	(default=32)
	0         =  "NIU"                           
	1         =  "YES"                           
	2         =  "NO"                            
;
VALUE hrwicyn 	(default=32)
	0         =  "NIU"                           
	1         =  "YES"                           
	2         =  "NO"                            
;
VALUE hfdval  	(default=32)
	0         =  "Not in universe"               
;
VALUE frecord 	(default=32)
	2         =  "Family record"                 
;
VALUE fkind   	(default=32)
	1         =  "Husband-wife family"           
	2         =  "Male reference person"         
	3         =  "Female reference person"       
;
VALUE ftype   	(default=32)
	1         =  "Primary family"                
	2         =  "Nonfamily householder"         
	3         =  "Related subfamily"             
	4         =  "Unrelated subfamily"           
	5         =  "Secondary individual"          
;
VALUE fwifeidx	(default=32)
	0         =  "No wife"                       
;
VALUE fhusbidx	(default=32)
	0         =  "No husband"                    
;
VALUE fspouidx	(default=32)
	0         =  "No spouse"                     
;
VALUE fownu6l 	(default=32)
	0         =  "None, not in universe"         
	1         =  "1"                             
	2         =  "2"                             
	6         =  "6+"                            
;
VALUE fownu18l	(default=32)
	0         =  "None, not in universe"         
	1         =  "1"                             
	9         =  "9 or more"                     
;
VALUE frelu6l 	(default=32)
	0         =  "None, not in universe"         
	1         =  "1"                             
	2         =  "2"                             
	6         =  "6+"                            
;
VALUE frelu18l	(default=32)
	0         =  "None, not in universe"         
	1         =  "1"                             
	2         =  "2"                             
	9         =  "9+"                            
;
VALUE fpctcut 	(default=32)
	0         =  "NIU (FTYPE=2+)"                
	1         =  "Lowest 5 percent"              
	2         =  "Second 5 percent"              
	20        =  "Top 5 percent"                 
;
VALUE famlis  	(default=32)
	1         =  "Below low-income level"        
	2         =  "100 - 124 percent of the low-" 
	3         =  "125 - 149 percent of the low-" 
	4         =  "150 percent and above the"     
;
VALUE povll   	(default=32)
	1         =  "Under .50"                     
	2         =  ".50 to .74"                    
	3         =  ".75 to .99"                    
	4         =  "1.00 to 1.24"                  
	5         =  "1.25 to 1.49"                  
	6         =  "1.50 to 1.74"                  
	7         =  "1.75 to 1.99"                  
	8         =  "2.00 to 2.49"                  
	9         =  "2.50 to 2.99"                  
	10        =  "3.00 to 3.49"                  
	11        =  "3.50 to 3.99"                  
	12        =  "4.00 to 4.49"                  
	13        =  "4.50 to 4.99"                  
	14        =  "5.00 and over"                 
;
VALUE frspov  	(default=32)
	0         =  "Not in universe"               
	1         =  "Under .50"                     
	2         =  ".50 to .74"                    
	3         =  ".75 to .99"                    
	4         =  "1.00 to 1.24"                  
	5         =  "1.25 to 1.49"                  
	6         =  "1.50 to 1.74"                  
	7         =  "1.75 to 1.99"                  
	8         =  "2.00 to 2.49"                  
	9         =  "2.50 to 2.99"                  
	10        =  "3.00 to 3.49"                  
	11        =  "3.50 to 3.99"                  
	12        =  "4.00 to 4.49"                  
	13        =  "4.50 to 4.99"                  
	14        =  "5.00 and over"                 
;
VALUE finc_ws 	(default=32)
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE finc_se 	(default=32)
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE fseval  	(default=32)
	0         =  "None or not in universe"       
;
VALUE finc_fr 	(default=32)
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE ffrval  	(default=32)
	0         =  "None or not in universe"       
;
VALUE finc_uc 	(default=32)
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE fucval  	(default=32)
	0         =  "None or not in universe"       
;
VALUE finc_wc 	(default=32)
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE fwcval  	(default=32)
	0         =  "None or not in universe"       
;
VALUE finc_ss 	(default=32)
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE fssval  	(default=32)
	0         =  "None or not in universe"       
;
VALUE finc_ssi	(default=32)
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE fssival 	(default=32)
	0         =  "None"                          
;
VALUE finc_paw	(default=32)
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE fpawval 	(default=32)
	0         =  "None"                          
;
VALUE finc_vet	(default=32)
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE fvetval 	(default=32)
	0         =  "None or not in universe"       
;
VALUE finc_sur	(default=32)
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE fsurval 	(default=32)
	0         =  "None or not in universe"       
;
VALUE finc_dis	(default=32)
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE fdisval 	(default=32)
	0         =  "None or not in universe"       
;
VALUE finc_ret	(default=32)
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE fretval 	(default=32)
	0         =  "None or not in universe"       
;
VALUE finc_int	(default=32)
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE fintval 	(default=32)
	0         =  "None or not in universe"       
;
VALUE finc_div	(default=32)
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE fdivval 	(default=32)
	0         =  "None or not in universe"       
;
VALUE finc_rnt	(default=32)
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE frntval 	(default=32)
	0         =  "None or not in universe"       
;
VALUE finc_ed 	(default=32)
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE fedval  	(default=32)
	0         =  "None or not in universe"       
;
VALUE finc_csp	(default=32)
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE fcspval 	(default=32)
	0         =  "None or not in universe"       
;
VALUE finc_alm	(default=32)
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE falmval 	(default=32)
	0         =  "None or not in universe"       
;
VALUE finc_fin	(default=32)
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE ffinval 	(default=32)
	0         =  "None or not in universe"       
;
VALUE finc_oi 	(default=32)
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE foival  	(default=32)
	0         =  "None or not in universe"       
;
VALUE ftotval 	(default=32)
	0         =  "None or not in universe"       
;
VALUE fearnval	(default=32)
	0         =  "None or not in universe"       
;
VALUE fothval 	(default=32)
	0         =  "None"                          
;
VALUE ftot_r  	(default=32)
	1         =  "Under $2,500"                  
	2         =  "$2,500 to $4,999"              
	3         =  "$5,000 to $7,499"              
	4         =  "$7,500 to $9,999"              
	5         =  "$10,000 to $12,499"            
	6         =  "$12,500 to $14,999"            
	7         =  "$15,000 to $17,499"            
	8         =  "$17,500 to $19,999"            
	9         =  "$20,000 to $22,499"            
	10        =  "$22,500 to $24,999"            
	11        =  "$25,000 to $27,499"            
	12        =  "$27,500 to $29,999"            
	13        =  "$30,000 to $32,499"            
	14        =  "$32,500 to $34,999"            
	15        =  "$35,000 to $37,499"            
	16        =  "$37,500 to $39,999"            
	17        =  "$40,000 to $42,499"            
	18        =  "$42,500 to $44,999"            
	19        =  "$45,000 to $47,499"            
	20        =  "$47,500 to $49,999"            
	21        =  "$50,000 to $52,499"            
	22        =  "$52,500 to $54,999"            
	23        =  "$55,000 to $57,499"            
	24        =  "$57,500 to $59,999"            
	25        =  "$60,000 to $62,499"            
	26        =  "$62,500 to $64,999"            
	27        =  "$65,000 to $67,499"            
	28        =  "$67,500 to $69,999"            
	29        =  "$70,000 to $72,499"            
	30        =  "$72,500 to $74,999"            
	31        =  "$75,000 to $77,499"            
	32        =  "$77,500 to $79,999"            
	33        =  "$80,000 to $82,499"            
	34        =  "$82,500 to $84,999"            
	35        =  "$85,000 to $87,499"            
	36        =  "$87,500 to $89,999"            
	37        =  "$90,000 to $92,499"            
	38        =  "$92,500 to $94,999"            
	39        =  "$95,000 to $97,499"            
	40        =  "$97,500 to $99,999"            
	41        =  "$100,000 and over"             
;
VALUE fspanish	(default=32)
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE f_mv_fs 	(default=32)
	0         =  "None"                          
;
VALUE f_mv_sl 	(default=32)
	0         =  "None"                          
;
VALUE ffngcare	(default=32)
	0         =  "None"                          
;
VALUE ffngcaid	(default=32)
	0         =  "None"                          
;
VALUE fhoussub	(default=32)
	0         =  "None"                          
;
VALUE ffoodreq	(default=32)
	0         =  "None"                          
;
VALUE fhousreq	(default=32)
	0         =  "None"                          
;
VALUE precord 	(default=32)
	3         =  "Person record"                 
;
VALUE a_parent	(default=32)
	0         =  "None"                          
;
VALUE a_exprrp	(default=32)
	1         =  "Reference person with relatives"
	2         =  "Reference person without"      
	3         =  "Husband"                       
	4         =  "Wife"                          
	5         =  "Own child"                     
	7         =  "Grandchild"                    
	8         =  "Parent"                        
	9         =  "Brother/sister"                
	10        =  "Other relative"                
	11        =  "Foster child"                  
	12        =  "Nonrelative with relatives"    
	13        =  "Partner/roommate"              
	14        =  "Nonrelative without relatives" 
;
VALUE a_age   	(default=32)
	80        =  "80-84 years of age"            
	85        =  "85+ years of age"              
;
VALUE a_maritl	(default=32)
	1         =  "Married - civilian spouse"     
	2         =  "Married - AF spouse present"   
	3         =  "Married - spouse absent (exc." 
	4         =  "Widowed"                       
	5         =  "Divorced"                      
	6         =  "Separated"                     
	7         =  "Never married"                 
;
VALUE a_spouse	(default=32)
	0         =  "None or children"              
;
VALUE a_sex   	(default=32)
	1         =  "Male"                          
	2         =  "Female"                        
;
VALUE a_hga   	(default=32)
	0         =  "Children"                      
	31        =  "Less than 1st grade"           
	32        =  "1st,2nd,3rd,or 4th grade"      
	33        =  "5th or 6th grade"              
	34        =  "7th and 8th grade"             
	35        =  "9th grade"                     
	36        =  "10th grade"                    
	37        =  "11th grade"                    
	38        =  "12th grade no diploma"         
	39        =  "High school graduate - high"   
	40        =  "Some college but no degree"    
	41        =  "Associate degree in college -" 
	42        =  "Associate degree in college -" 
	43        =  "Bachelor's degree (for"        
	44        =  "Master's degree (for"          
	45        =  "Professional school degree (for"
	46        =  "Doctorate degree (for"         
;
VALUE prdtrace	(default=32)
	1         =  "White only"                    
	2         =  "Black only"                    
	3         =  "American Indian,"              
	4         =  "Asian only"                    
	5         =  "Hawaiian/Pacific Islander"     
	6         =  "White-Black"                   
	7         =  "White-AI"                      
	8         =  "White-Asian"                   
	9         =  "White-HP"                      
	10        =  "Black-AI"                      
	11        =  "Black-Asian"                   
	12        =  "Black-HP"                      
	13        =  "AI-Asian"                      
	14        =  "Asian-HP"                      
	15        =  "White-Black-AI"                
	16        =  "White-Black-Asian"             
	17        =  "White-AI-Asian"                
	18        =  "White-Asian-HP"                
	19        =  "White-Black-AI-Asian"          
	20        =  "2 or 3 races"                  
	21        =  "4 or 5 races"                  
;
VALUE p_stat  	(default=32)
	1         =  "Civilian 15+"                  
	2         =  "Armed Forces"                  
	3         =  "Children 0 - 14"               
;
VALUE pehspnon	(default=32)
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE prdthsp 	(default=32)
	0         =  "Not in universe"               
	1         =  "Mexican"                       
	2         =  "Puerto Rican"                  
	3         =  "Cuban"                         
	4         =  "Central/South American"        
	5         =  "Other Spanish"                 
;
VALUE a_famnum	(default=32)
	0         =  "Not a family member"           
	1         =  "Primary family member only"    
;
VALUE a_famtyp	(default=32)
	1         =  "Primary family"                
	2         =  "Nonfamily householder"         
	3         =  "Related subfamily"             
	4         =  "Unrelated subfamily"           
	5         =  "Secondary individual"          
;
VALUE a_famrel	(default=32)
	0         =  "Not a family member"           
	1         =  "Reference person"              
	2         =  "Spouse"                        
	3         =  "Child"                         
	4         =  "Other relative (primary"       
;
VALUE a_pfrel 	(default=32)
	0         =  "Not in primary family"         
	1         =  "Husband"                       
	2         =  "Wife"                          
	3         =  "Own child"                     
	4         =  "Other relative"                
	5         =  "Unmarried reference person"    
;
VALUE hhdrel  	(default=32)
	1         =  "Householder"                   
	2         =  "Spouse of householder"         
	3         =  "Under 18 years, single (never" 
	4         =  "Under 18 years, ever married"  
	5         =  "18 years and over"             
	6         =  "Other relative of householder" 
	7         =  "Nonrelative of householder"    
	8         =  "Secondary individual"          
;
VALUE famrel  	(default=32)
	1         =  "Reference person of family"    
	2         =  "Spouse of reference person"    
	3         =  "Under 18 years, single (never" 
	4         =  "Under 18 years, ever married"  
	5         =  "18 years and over"             
	6         =  "Grandchild of reference person"
	7         =  "Under 18 years, single (never" 
	8         =  "Under 18 years, ever married"  
	9         =  "18 years and over"             
	10        =  "Nonfamily householder"         
	11        =  "Secondary individual"          
;
VALUE hhdfmx  	(default=32)
	1         =  "Householder"                   
	2         =  "Spouse of householder"         
	3         =  "Reference person of subfamily" 
	4         =  "Not in a subfamily"            
	5         =  "Reference person of subfamily" 
	6         =  "Spouse of subfamily reference" 
	7         =  "Not in a subfamily"            
	8         =  "Head of a subfamily"           
	9         =  "Not in a subfamily"            
	10        =  "Reference person of subfamily" 
	11        =  "Spouse of subfamily reference" 
	12        =  "Not in a subfamily"            
	23        =  "Reference person of subfamily" 
	24        =  "Child of a subfamily"          
	25        =  "Not in a subfamily"            
	26        =  "Reference person of subfamily" 
	27        =  "Spouse of subfamily reference" 
	28        =  "Not used"                      
	29        =  "Not in a subfamily"            
	30        =  "Reference person of a subfamily"
	31        =  "Not in a subfamily"            
	32        =  "Reference person of subfamily" 
	33        =  "Spouse of subfamily reference" 
	34        =  "Not in a subfamily"            
	35        =  "Reference person of subfamily" 
	36        =  "Child of subfamily reference"  
	37        =  "Not in a subfamily"            
	38        =  "Reference person of subfamily" 
	39        =  "Spouse of subfamily reference" 
	40        =  "Not in a subfamily"            
	41        =  "Reference person of a subfamily"
	42        =  "Not in a subfamily"            
	43        =  "Reference person of subfamily" 
	44        =  "Spouse of subfamily reference" 
	45        =  "Not in a subfamily"            
	46        =  "Reference person of unrelated" 
	47        =  "Spouse of unrelated subfamily" 
	48        =  "Child < 18, single (never-"    
	49        =  "Nonfamily householder"         
	50        =  "Secondary individual"          
	51        =  "In group quarters"             
;
VALUE parent  	(default=32)
	0         =  "Not in universe"               
	1         =  "Both parents present"          
	2         =  "Mother only present"           
	3         =  "Father only present"           
	4         =  "Neither parent present"        
;
VALUE age1l   	(default=32)
	0         =  "Not in universe"               
	1         =  "15 years"                      
	2         =  "16 and 17 years"               
	3         =  "18 and 19 years"               
	4         =  "20 and 21 years"               
	5         =  "22 to 24 years"                
	6         =  "25 to 29 years"                
	7         =  "30 to 34 years"                
	8         =  "35 to 39 years"                
	9         =  "40 to 44 years"                
	10        =  "45 to 49 years"                
	11        =  "50 to 54 years"                
	12        =  "55 to 59 years"                
	13        =  "60 to 61 years"                
	14        =  "62 to 64 years"                
	15        =  "65 to 69 years"                
	16        =  "70 to 74 years"                
	17        =  "75 years and over"             
;
VALUE a_fnlwgt	(default=32)
	0         =  "Supplemental Spanish sample"   
;
VALUE a_ernlwt	(default=32)
	0         =  "Not in universe or children and"
;
VALUE a_hrs1l 	(default=32)
	-1        =  "Not in universe"               
	0         =  "Children and Armed Forces"     
;
VALUE a_uslft 	(default=32)
	0         =  "Not in universe or children and"
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE a_whyabs	(default=32)
	0         =  "Not in universe or children and"
	1         =  "Own illness"                   
	2         =  "On vacation"                   
	3         =  "Bad weather"                   
	4         =  "Labor dispute"                 
	8         =  "Other"                         
;
VALUE a_payabs	(default=32)
	0         =  "Not in universe or children and"
	1         =  "Yes"                           
	2         =  "No"                            
	3         =  "Self-employed"                 
;
VALUE peioind 	(default=32)
	0         =  "Not in universe or children"   
;
VALUE peioocc 	(default=32)
	-001      =  "Not in universe or children"   
;
VALUE a_wkslk 	(default=32)
	-1        =  "Not in universe"               
	0         =  "Children or Armed Forces"      
;
VALUE a_whenlj	(default=32)
	0         =  "Not in universe or children and"
	1         =  "In last 12 months"             
	2         =  "More than 12 months ago"       
	5         =  "Never worked at all"           
;
VALUE a_clswkr	(default=32)
	0         =  "Not in universe or children and"
	1         =  "Private"                       
	2         =  "Federal government"            
	3         =  "State government"              
	4         =  "Local government"              
	5         =  "Self-employed-incorporated"    
	6         =  "Self-employed-not incorporated"
	7         =  "Without pay"                   
	8         =  "Never worked"                  
;
VALUE a_nlflj 	(default=32)
	0         =  "Not in universe or children and"
	1         =  "Within a past 12 months"       
	3         =  "More than 12 months ago"       
	7         =  "Never worked"                  
;
VALUE a_wantjb	(default=32)
	0         =  "Not in universe or children and"
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE peafever	(default=32)
	-1        =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE peafwhna	(default=32)
	-1        =  "Not in universe"               
	1         =  "September 2001 or later"       
	2         =  "August 1990 to August 2001"    
	3         =  "May 1975 to July 1990"         
	4         =  "Vietnam Era (August 1964 to"   
	5         =  "February 1955 to July 1964"    
	6         =  "Korean War (July 1950 to"      
	7         =  "January 1947 to June 1950"     
	8         =  "World War II (December 1941"   
	9         =  "November 1941 or earlier"      
;
VALUE peafwhnb	(default=32)
	-1        =  "Not in universe"               
	1         =  "September 2001 or later"       
	2         =  "August 1990 to August 2001"    
	3         =  "May 1975 to July 1990"         
	4         =  "Vietnam Era (August 1964 to"   
	5         =  "February 1955 to July 1964"    
	6         =  "Korean War (July 1950 to"      
	7         =  "January 1947 to June 1950"     
	8         =  "World War II (December 1941"   
	9         =  "November 1941 or earlier"      
;
VALUE peafwhnc	(default=32)
	-1        =  "Not in universe"               
	1         =  "September 2001 or later"       
	2         =  "August 1990 to August 2001"    
	3         =  "May 1975 to July 1990"         
	4         =  "Vietnam Era (August 1964 to"   
	5         =  "February 1955 to July 1964"    
	6         =  "Korean War (July 1950 to"      
	7         =  "January 1947 to June 1950"     
	8         =  "World War II (December 1941"   
	9         =  "November 1941 or earlier"      
;
VALUE peafwhnd	(default=32)
	-1        =  "Not in universe"               
	1         =  "September 2001 or later"       
	2         =  "August 1990 to August 2001"    
	3         =  "May 1975 to July 1990"         
	4         =  "Vietnam Era (August 1964 to"   
	5         =  "February 1955 to July 1964"    
	6         =  "Korean War (July 1950 to"      
	7         =  "January 1947 to June 1950"     
	8         =  "World War II (December 1941"   
	9         =  "November 1941 or earlier"      
;
VALUE a_uslhrs	(default=32)
	-4        =  "Hours vary"                    
	-1        =  "Not in universe"               
	0         =  "None, no hours"                
;
VALUE a_hrlywk	(default=32)
	0         =  "Not in universe or children and"
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE a_hrspay	(default=32)
	0         =  "Not in universe or children and"
;
VALUE a_grswk 	(default=32)
	0         =  "Not in universe or children or"
;
VALUE a_unmem 	(default=32)
	0         =  "Not in universe or children and"
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE a_uncov 	(default=32)
	0         =  "Not in universe or children and"
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE a_enrlw 	(default=32)
	0         =  "Not in universe or children and"
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE a_hscol 	(default=32)
	0         =  "Not in universe or children and"
	1         =  "High school"                   
	2         =  "College or univ."              
;
VALUE a_ftpt  	(default=32)
	0         =  "Not in universe or children and"
	1         =  "Full time"                     
	2         =  "Part time"                     
;
VALUE a_lfsr  	(default=32)
	0         =  "Children or Armed Forces"      
	3         =  "Unemployed, looking for work"  
	4         =  "Unemployed, on layoff"         
	7         =  "Nilf"                          
;
VALUE a_untype	(default=32)
	0         =  "Not in universe or children"   
	1         =  "Job loser - on layoff"         
	2         =  "Other job loser"               
	3         =  "Job leaver"                    
	4         =  "Re-entrant"                    
	5         =  "New entrant"                   
;
VALUE a_wkstat	(default=32)
	0         =  "Children or Armed Forces"      
	1         =  "Not in labor force"            
	2         =  "Full-time schedules"           
	3         =  "Part-time for economic reasons,"
	4         =  "Part-time for non-economic"    
	5         =  "Part-time for economic reasons,"
	6         =  "Unemployed FT"                 
	7         =  "Unemployed PT"                 
;
VALUE a_explf 	(default=32)
	0         =  "Not in experienced labor force"
	1         =  "Employed"                      
	2         =  "Unemployed"                    
;
VALUE a_wksch 	(default=32)
	0         =  "Not in universe"               
	1         =  "At work"                       
	2         =  "With job, not at work"         
	3         =  "Unemployed, seeks FT"          
	4         =  "Unemployed, seeks PT"          
;
VALUE a_civlf 	(default=32)
	0         =  "Not in universe or children and"
	1         =  "In universe"                   
;
VALUE a_ftlf  	(default=32)
	0         =  "Not in universe or children and"
	1         =  "In universe"                   
;
VALUE a_mjind 	(default=32)
	0         =  "Not in universe, or children"  
	1         =  "Agriculture, forestry,"        
	2         =  "Mining"                        
	3         =  "Construction"                  
	4         =  "Manufacturing"                 
	5         =  "Wholesale and retail trade"    
	6         =  "Transportation and utilities"  
	7         =  "Information"                   
	8         =  "Financial activities"          
	9         =  "Professional and business"     
	10        =  "Educational and health services"
	11        =  "Leisure and hospitality"       
	12        =  "Other services"                
	13        =  "Public administration"         
	14        =  "Armed Forces"                  
;
VALUE a_dtind 	(default=32)
	0         =  "Not in universe or children or"
;
VALUE mjocc   	(default=32)
	0         =  "Not in universe or children"   
	1         =  "Management, business, and"     
	2         =  "Professional and related"      
	3         =  "Service occupations"           
	4         =  "Sales and related occupations" 
	5         =  "Office and administrative"     
	6         =  "Farming, fishing, and"         
	7         =  "Construction and extraction"   
	8         =  "Installation, maintenance,"    
	9         =  "Production occupations"        
	10        =  "Transportation and material"   
	11        =  "Armed Forces"                  
;
VALUE a_dtocc 	(default=32)
	0         =  "Not in universe for children or"
;
VALUE prerelg 	(default=32)
	0         =  "Not earnings eligible"         
	1         =  "Earnings eligible"             
;
VALUE workyn  	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE wtemp   	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE nwlook  	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE nwlkwk  	(default=32)
	0         =  "Not in universe"               
	1         =  "1 week"                        
	52        =  "52 weeks"                      
;
VALUE rsnnotw 	(default=32)
	0         =  "Not in universe"               
	1         =  "Ill or disabled"               
	2         =  "Retired"                       
	3         =  "Taking care of home or family" 
	4         =  "Going to school"               
	5         =  "Could not find work"           
	6         =  "Other"                         
;
VALUE wkswork 	(default=32)
	0         =  "Not in universe"               
	1         =  "1 week"                        
	52        =  "52 weeks"                      
;
VALUE wkcheck 	(default=32)
	0         =  "Not in universe"               
	1         =  "1-49 weeks"                    
	2         =  "50-51 weeks"                   
	3         =  "52 weeks"                      
;
VALUE losewks 	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE lknone  	(default=32)
	0         =  "Not in universe"               
	1         =  "No weeks looking for work or on"
;
VALUE lkweeks 	(default=32)
	0         =  "Not in universe"               
	1         =  "01 weeks"                      
	51        =  "51 weeks"                      
;
VALUE lkstrch 	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes, 1 stretch"                
	2         =  "No, 2 stretches"               
	3         =  "No, 3 plus stretches"          
;
VALUE pyrsn   	(default=32)
	0         =  "Not in universe"               
	1         =  "Ill or disabled"               
	2         =  "Taking care of home"           
	3         =  "Going to school"               
	4         =  "Retired"                       
	5         =  "No work available"             
	6         =  "Other"                         
;
VALUE phmemprs	(default=32)
	0         =  "Not in universe"               
	1         =  "1 employer"                    
	2         =  "2"                             
	3         =  "3 plus"                        
;
VALUE hrswk   	(default=32)
	0         =  "Not in universe"               
	1         =  "1 hour"                        
	99        =  "99 hours plus"                 
;
VALUE hrcheck 	(default=32)
	0         =  "Not in universe"               
	1         =  "Part time (1-34)"              
	2         =  "Full time (35+)"               
;
VALUE ptyn    	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE ptweeks 	(default=32)
	0         =  "Not in universe"               
	1         =  "1 week"                        
	52        =  "52 weeks"                      
;
VALUE ptrsn   	(default=32)
	0         =  "Not in universe"               
	1         =  "Could only find PT job"        
	2         =  "Wanted part time"              
	3         =  "Slack work"                    
	4         =  "Other"                         
;
VALUE ljcw    	(default=32)
	0         =  "Not in universe"               
	1         =  "Private"                       
	2         =  "Federal"                       
	3         =  "State"                         
	4         =  "Local"                         
	5         =  "Self employed incorporated, yes"
	6         =  "Self employed incorporated, no"
	7         =  "Without pay"                   
;
VALUE wexp    	(default=32)
	0         =  "Not in universe"               
	1         =  "50 to 52 weeks"                
	2         =  "48 to 49 weeks"                
	3         =  "40 to 47 weeks"                
	4         =  "27 to 39 weeks"                
	5         =  "14 to 26 weeks"                
	6         =  "13 weeks or less"              
	7         =  "50 to 52 weeks"                
	8         =  "48 to 49 weeks"                
	9         =  "40 to 47 weeks"                
	10        =  "27 to 39 weeks"                
	11        =  "14 to 26 weeks"                
	12        =  "13 weeks or less"              
	13        =  "Nonworker"                     
;
VALUE wewkrs  	(default=32)
	0         =  "Not in universe"               
	1         =  "Full time"                     
	2         =  "Part time"                     
	3         =  "Full time"                     
	4         =  "Part time"                     
	5         =  "Nonworker"                     
;
VALUE welknw  	(default=32)
	0         =  "Children"                      
	1         =  "None (not looking for work)"   
	2         =  "1 to 4 weeks looking"          
	3         =  "5 to 14 weeks looking"         
	4         =  "15 to 26 weeks looking"        
	5         =  "27 to 39 weeks looking"        
	6         =  "40 or more weeks looking"      
	7         =  "Workers"                       
;
VALUE weuemp  	(default=32)
	0         =  "Not in universe"               
	1         =  "None"                          
	2         =  "1 to 4 weeks"                  
	3         =  "5 to 10 weeks"                 
	4         =  "11 to 14 weeks"                
	5         =  "15 to 26 weeks"                
	6         =  "27 to 39 weeks"                
	7         =  "40 or more weeks"              
	8         =  "Full year worker"              
	9         =  "Nonworker"                     
;
VALUE earner  	(default=32)
	0         =  "Not in universe"               
	1         =  "Earner (pearnval ne 0)"        
	2         =  "Nonearner"                     
;
VALUE clwk    	(default=32)
	0         =  "Not in universe"               
	1         =  "Private (includes self-"       
	2         =  "Government"                    
	3         =  "Self-employed"                 
	4         =  "Without pay"                   
	5         =  "Never worked"                  
;
VALUE weclw   	(default=32)
	0         =  "Not in universe"               
	1         =  "Wage and salary"               
	2         =  "Self-employed"                 
	3         =  "Unpaid"                        
	4         =  "Private household"             
	5         =  "Other private"                 
	6         =  "Government"                    
	7         =  "Self-employed"                 
	8         =  "Unpaid"                        
	9         =  "Never worked"                  
;
VALUE mig_cbst	(default=32)
	0         =  "NIU, nonmover"                 
	1         =  "CBSA"                          
	2         =  "non CBSA"                      
	3         =  "Abroad"                        
	4         =  "Not identifiable"              
;
VALUE migsame 	(default=32)
	0         =  "NIU"                           
	1         =  "Yes (nonmover)"                
	2         =  "No, difference house in U.S."  
	3         =  "No, outside the U.S. (mover)"  
;
VALUE mig_reg 	(default=32)
	0         =  "Not in universe under 1 year"  
	1         =  "Northeast"                     
	2         =  "Midwest"                       
	3         =  "South"                         
	4         =  "West"                          
	5         =  "Abroad"                        
;
VALUE mig_st  	(default=32)
	0         =  "Nonmatch"                      
	1         =  "Alabama"                       
	2         =  "Alaska"                        
	4         =  "Arizona"                       
	5         =  "Arkansas"                      
	6         =  "California"                    
	8         =  "Colorado"                      
	9         =  "Connecticut"                   
	10        =  "Delaware"                      
	11        =  "District of Columbia"          
	12        =  "Florida"                       
	13        =  "Georgia"                       
	15        =  "Hawaii"                        
	16        =  "Idaho"                         
	17        =  "Illinois"                      
	18        =  "Indiana"                       
	19        =  "Iowa"                          
	20        =  "Kansas"                        
	21        =  "Kentucky"                      
	22        =  "Louisiana"                     
	23        =  "Maine"                         
	24        =  "Maryland"                      
	25        =  "Massachusetts"                 
	26        =  "Michigan"                      
	27        =  "Minnesota"                     
	28        =  "Mississippi"                   
	29        =  "Missouri"                      
	30        =  "Montana"                       
	31        =  "Nebraska"                      
	32        =  "Nevada"                        
	33        =  "New Hampshire"                 
	34        =  "New Jersey"                    
	35        =  "New Mexico"                    
	36        =  "New York"                      
	37        =  "North Carolina"                
	38        =  "North Dakota"                  
	39        =  "Ohio"                          
	40        =  "Oklahoma"                      
	41        =  "Oregon"                        
	42        =  "Pennsylvania"                  
	44        =  "Rhode Island"                  
	45        =  "South Carolina"                
	46        =  "South Dakota"                  
	47        =  "Tennessee"                     
	48        =  "Texas"                         
	49        =  "Utah"                          
	50        =  "Vermont"                       
	51        =  "Virginia"                      
	53        =  "Washington"                    
	54        =  "West Virginia"                 
	55        =  "Wisconsin"                     
	56        =  "Wyoming"                       
	96        =  "Abroad"                        
;
VALUE mig_dscp	(default=32)
	0         =  "NIU (under 1 year old,"        
	1         =  "Principal city of a CBSA"      
	2         =  "Balance of a CBSA"             
	3         =  "Non-metro"                     
	4         =  "Abroad"                        
	5         =  "Not identified"                
;
VALUE gediv   	(default=32)
	1         =  "New England"                   
	2         =  "Middle Atlantic"               
	3         =  "East North Central"            
	4         =  "West North Central"            
	5         =  "South Atlantic"                
	6         =  "East South Central"            
	7         =  "West South Central"            
	8         =  "Mountain"                      
	9         =  "Pacific"                       
;
VALUE mig_div 	(default=32)
	0         =  "Not in universe (under 1 year" 
	1         =  "New England"                   
	2         =  "Middle Atlantic"               
	3         =  "East North Central"            
	4         =  "West North Central"            
	5         =  "South Atlantic"                
	6         =  "East South Central"            
	7         =  "West South Central"            
	8         =  "Mountain"                      
	9         =  "Pacific"                       
	10        =  "Aboard"                        
;
VALUE mig_mtra	(default=32)
	1         =  "Nonmover"                      
	2         =  "Metro to metro"                
	3         =  "Metro to non-metro"            
	4         =  "Non-metro to metro"            
	5         =  "Non-metro to non-metro"        
	6         =  "Abroad to metro"               
	7         =  "Abroad to non-metro"           
	8         =  "Not in universe (Children"     
	9         =  "Not identifiable"              
;
VALUE mig_mtrc	(default=32)
	1         =  "Nonmover"                      
	2         =  "Same county"                   
	3         =  "Different county, same state"  
	4         =  "Different state, same division"
	5         =  "Different division, same"      
	6         =  "Different region"              
	7         =  "Abroad"                        
	8         =  "Not in universe (children"     
;
VALUE mig_mtrd	(default=32)
	1         =  "Nonmover"                      
	2         =  "Same county"                   
	3         =  "Different county, same state"  
	4         =  "Different state in Northeast"  
	5         =  "Different state in Midwest"    
	6         =  "Different state in South"      
	7         =  "Different state in West"       
	8         =  "Abroad, foreign country"       
	9         =  "Not in universe (children"     
;
VALUE noemp   	(default=32)
	0         =  "Not in universe"               
	1         =  "Under 10"                      
	2         =  "10 - 24"                       
	3         =  "25 - 99"                       
	4         =  "100 - 499"                     
	5         =  "500 - 999"                     
	6         =  "1000+"                         
;
VALUE ern_yn  	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE ern_val 	(default=32)
	0         =  "None or not in universe"       
;
VALUE ern_srce	(default=32)
	0         =  "Not in universe"               
	1         =  "Wage and salary"               
	2         =  "Self employment"               
	3         =  "Farm self employment"          
	4         =  "Without pay"                   
;
VALUE ern_otr 	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE wageotr 	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE wsal_yn 	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE wsal_val	(default=32)
	0         =  "None or not in universe"       
;
VALUE seotr   	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE semp_yn 	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE semp_val	(default=32)
	0         =  "None or not in universe"       
;
VALUE frmotr  	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE frse_yn 	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE frse_val	(default=32)
	0         =  "None or not in universe"       
;
VALUE uc_yn   	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE subuc   	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE strkuc  	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE uc_val  	(default=32)
	0         =  "None or not in universe"       
;
VALUE wc_yn   	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE wc_type 	(default=32)
	0         =  "Not in universe"               
	1         =  "State worker's compensation"   
	2         =  "Employer or employers insurance"
	3         =  "Own insurance"                 
	4         =  "Other"                         
;
VALUE wc_val  	(default=32)
	0         =  "None or not in universe"       
;
VALUE ss_yn   	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE ss_val  	(default=32)
	0         =  "None or not in universe"       
;
VALUE ssi_yn  	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE paw_yn  	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE paw_typ 	(default=32)
	0         =  "Not in universe"               
	1         =  "TANF/AFDC"                     
	2         =  "Other"                         
	3         =  "Both"                          
;
VALUE paw_mon 	(default=32)
	0         =  "Not in universe"               
	1         =  "One"                           
	12        =  "Twelve"                        
;
VALUE paw_val 	(default=32)
	0         =  "None or not in universe"       
;
VALUE vet_yn  	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE vet_typa	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE vet_typb	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE vet_typc	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE vet_typd	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE vet_type	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE vet_qva 	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE vet_val 	(default=32)
	0         =  "None or not in universe"       
;
VALUE sur_yn  	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE sur_sc1l	(default=32)
	0         =  "None or not in universe"       
	1         =  "Company or union survivor"     
	2         =  "Federal government"            
	3         =  "Us military retirement"        
	4         =  "State or local government"     
	5         =  "Us railroad retirement"        
	6         =  "Worker's compensation survivor"
	7         =  "Black Lung Survivor Pension"   
	8         =  "Regular payments from estates" 
	9         =  "Regular payments from"         
	10        =  "Other or don't know"           
;
VALUE sur_vala	(default=32)
	0         =  "None or not in universe"       
;
VALUE sur_valb	(default=32)
	0         =  "None or not in universe"       
;
VALUE srvs_val	(default=32)
	0         =  "None or not in universe"       
;
VALUE dis_hp  	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE dis_cs  	(default=32)
	0         =  "Not in universe or children"   
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE dis_yn  	(default=32)
	0         =  "Not in universe or children"   
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE dis_sc1l	(default=32)
	0         =  "Not in universe"               
	1         =  "Worker's compensation"         
	2         =  "Company or union disability"   
	3         =  "Federal government disability" 
	4         =  "Us military retirement"        
	5         =  "State or local gov't employee" 
	6         =  "Us railroad retirement"        
	7         =  "Accident or disability"        
	8         =  "Black Lung miner’s disability" 
	9         =  "State temporary sickness"      
	10        =  "Other or don't know"           
;
VALUE dis_vala	(default=32)
	0         =  "None or not in universe"       
;
VALUE dis_valb	(default=32)
	0         =  "None or not in universe"       
;
VALUE dsab_val	(default=32)
	0         =  "None or not in universe"       
;
VALUE ret_yn  	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE ret_sc1l	(default=32)
	0         =  "None or not in universe"       
	1         =  "Company or union pension"      
	2         =  "Federal government retirement" 
	3         =  "US military retirement"        
	4         =  "State or local government"     
	5         =  "US railroad retirement"        
	6         =  "Regular payments from annuities"
	7         =  "Regular payments from ira,"    
	8         =  "Other sources or don't know"   
;
VALUE ret_vala	(default=32)
	0         =  "None or not in universe"       
;
VALUE ret_valb	(default=32)
	0         =  "None or not in universe"       
;
VALUE rtm_val 	(default=32)
	0         =  "None or not in universe"       
;
VALUE int_yn  	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE int_val 	(default=32)
	0         =  "None or not in universe"       
;
VALUE div_yn  	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE div_non 	(default=32)
	0         =  "Not in universe"               
	1         =  "None"                          
;
VALUE div_val 	(default=32)
	0         =  "None or not in universe"       
;
VALUE rnt_yn  	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE rnt_val 	(default=32)
	0         =  "None or not in universe"       
;
VALUE ed_yn   	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE oed_typa	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE oed_typb	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE oed_typc	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE ed_val  	(default=32)
	0         =  "None or not in universe"       
;
VALUE csp_yn  	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE csp_val 	(default=32)
	0         =  "None or not in universe"       
;
VALUE alm_yn  	(default=32)
	0         =  "None or not in universe"       
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE alm_val 	(default=32)
	0         =  "None or not in universe"       
;
VALUE fin_yn  	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE fin_val 	(default=32)
	0         =  "None or not in universe"       
;
VALUE oi_off  	(default=32)
	0         =  "NIU"                           
	1         =  "Social security"               
	2         =  "Private pensions"              
	3         =  "AFDC"                          
	4         =  "Other public assistance"       
	5         =  "Interest"                      
	6         =  "Dividends"                     
	7         =  "Rents or royalties"            
	8         =  "Estates or trusts"             
	9         =  "State disability payments"     
	10        =  "Disability payments (own"      
	11        =  "Unemployment compensation"     
	12        =  "Strike benefits"               
	13        =  "Annuities or paid up insurance"
	14        =  "Not income"                    
	15        =  "Longest job"                   
	16        =  "Wages or salary"               
	17        =  "Nonfarm self-employment"       
	19        =  "Anything else"                 
;
VALUE oi_yn   	(default=32)
	0         =  "None or not in universe"       
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE oi_val  	(default=32)
	0         =  "None or not in universe"       
;
VALUE ptotval 	(default=32)
	0         =  "None or not in universe"       
;
VALUE pearnval	(default=32)
	0         =  "None or not in universe"       
;
VALUE pothval 	(default=32)
	0         =  "None"                          
;
VALUE fl_665l 	(default=32)
	0         =  "Complete nonresponse to"       
	1         =  "Supplement interview"          
	2         =  "Some supplement response but"  
	3         =  "Supplement interview but not"  
;
VALUE ptot_r  	(default=32)
	0         =  "Not in universe"               
	1         =  "Under $2,500"                  
	2         =  "$2,500 to $4,999"              
	3         =  "$5,000 to $7,499"              
	4         =  "$7,500 to $9,999"              
	5         =  "$10,000 to $12,499"            
	6         =  "$12,500 to $14,999"            
	7         =  "$15,000 to $17,499"            
	8         =  "$17,500 to $19,999"            
	9         =  "$20,000 to $22,499"            
	10        =  "$22,500 to $24,999"            
	11        =  "$25,000 to $27,499"            
	12        =  "$27,500 to $29,999"            
	13        =  "$30,000 to $32,499"            
	14        =  "$32,500 to $34,999"            
	15        =  "$35,000 to $37,499"            
	16        =  "$37,500 to $39,999"            
	17        =  "$40,000 to $42,499"            
	18        =  "$42,500 to $44,999"            
	19        =  "$45,000 to $47,499"            
	20        =  "$47,500 to $49,999"            
	21        =  "$50,000 to $52,499"            
	22        =  "$52,500 to $54,999"            
	23        =  "$55,000 to $57,499"            
	24        =  "$57,500 to $59,999"            
	25        =  "$60,000 to $62,499"            
	26        =  "$62,500 to $64,999"            
	27        =  "$65,000 to $67,499"            
	28        =  "$67,500 to $69,999"            
	29        =  "$70,000 to $72,499"            
	30        =  "$72,500 to $74,999"            
	31        =  "$75,000 to $77,499"            
	32        =  "$77,500 to $79,999"            
	33        =  "$80,000 to $82,499"            
	34        =  "$82,500 to $84,999"            
	35        =  "$85,000 to $87,499"            
	36        =  "$87,500 to $89,999"            
	37        =  "$90,000 to $92,499"            
	38        =  "$92,500 to $94,999"            
	39        =  "$95,000 to $97,499"            
	40        =  "$97,500 to $99,999"            
	41        =  "$100,000 and over"             
;
VALUE perlis  	(default=32)
	1         =  "Below low-income level"        
	2         =  "100 - 124 percent of the low-" 
	3         =  "125 - 149 percent of the low-" 
	4         =  "150 and above the low-income"  
;
VALUE mcare   	(default=32)
	0         =  "NIU (children under 15)"       
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE mcaid   	(default=32)
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE champ   	(default=32)
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hi_yn   	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hiown   	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hiemp   	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hipaid  	(default=32)
	0         =  "Not in universe"               
	1         =  "All"                           
	2         =  "Part"                          
	3         =  "None"                          
;
VALUE wrk_ck  	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE penplan 	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE penincl 	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE cov_gh  	(default=32)
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE cov_hi  	(default=32)
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE ch_mc   	(default=32)
	0         =  "Not child's record"            
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE ch_hi   	(default=32)
	0         =  "Not child's record"            
	1         =  "Covered by person in household"
	2         =  "Covered by person outside of"  
	3         =  "Not covered"                   
;
VALUE a1rrp   	(default=32)
	0         =  "No change"                     
	2         =  "Blank to value"                
	3         =  "Value to value"                
;
VALUE a1age   	(default=32)
	0         =  "No change"                     
	4         =  "Allocated"                     
;
VALUE a1maritl	(default=32)
	0         =  "No change"                     
	4         =  "Allocated"                     
;
VALUE a1spouse	(default=32)
	0         =  "No change"                     
	2         =  "Blank to value"                
	3         =  "Value to value"                
;
VALUE a1sex   	(default=32)
	0         =  "No change"                     
	4         =  "Allocated"                     
;
VALUE a1hga   	(default=32)
	0         =  "No change"                     
	4         =  "Allocated"                     
;
VALUE pxrace1l	(default=32)
	0         =  "Not allocated"                 
	1         =  "Blank - no change"             
	2         =  "Don't know - no change"        
	3         =  "Refused - no change"           
	10        =  "Value to value"                
	11        =  "Blank to value"                
	12        =  "Don't know to value"           
	13        =  "Refused to value"              
	20        =  "Value to longitudinal value"   
	21        =  "Blank to longitudinal value"   
	22        =  "Don't know to longitudinal"    
	23        =  "Refused to longitudinal value" 
	30        =  "Value to allocated value long" 
	31        =  "Blank to allocated value long" 
	32        =  "Don't know to allocated value" 
	33        =  "Refused to allocated value long"
	40        =  "Value to allocated value"      
	41        =  "Blank to allocated value"      
	42        =  "Don't know to allocated value" 
	43        =  "Refused to allocated value"    
	50        =  "Value to blank"                
	52        =  "Don't know to blank"           
	53        =  "Refused to blank"              
;
VALUE a1lfsr  	(default=32)
	0         =  "No change or children or armed"
	4         =  "Allocated"                     
;
VALUE pxhspnon	(default=32)
	0         =  "Not allocated"                 
	1         =  "Blank - no change"             
	2         =  "Don't know - no change"        
	3         =  "Refused - no change"           
	10        =  "Value to value"                
	11        =  "Blank to value"                
	12        =  "Don't know to value"           
	13        =  "Refused to value"              
	20        =  "Value to longitudinal value"   
	21        =  "Blank to longitudinal value"   
	22        =  "Don't know to longitudinal"    
	23        =  "Refused to longitudinal value" 
	30        =  "Value to allocated value long" 
	31        =  "Blank to allocated value long" 
	32        =  "Don't know to allocated value" 
	33        =  "Refused to allocated value long"
	40        =  "Value to allocated value"      
	41        =  "Blank to allocated value"      
	42        =  "Don't know to allocated value" 
	43        =  "Refused to allocated value"    
	50        =  "Value to blank"                
	52        =  "Don't know to blank"           
	53        =  "Refused to blank"              
;
VALUE a1hrs   	(default=32)
	0         =  "No change or children or armed"
	4         =  "Allocated"                     
;
VALUE pxafever	(default=32)
	-1        =  "Not allocated"                 
	0         =  "Value - no change"             
	1         =  "Blank - no change"             
	2         =  "Don’t know - no change"        
	3         =  "Refused - no change"           
	10        =  "Value to value"                
	11        =  "Blank to value"                
	12        =  "Don’t know to value"           
	13        =  "Refused to value"              
	20        =  "Value to longitudinal value"   
	21        =  "Blank to longitudinal value"   
	22        =  "Don’t know to longitudinal"    
	23        =  "Refused to longitudinal value" 
	30        =  "Value to allocated value long" 
	31        =  "Blank to allocated value long" 
	32        =  "Don’t know to allocated value" 
	33        =  "Refused to allocated value long"
	40        =  "Value to allocated value"      
	41        =  "Blank to allocated value"      
	42        =  "Don’t know to allocated value" 
	43        =  "Refused to allocated value"    
	50        =  "Value to blank"                
	52        =  "Don’t know to blank"           
	53        =  "Refused to blank"              
;
VALUE pxafwhna	(default=32)
	-1        =  "Not allocated"                 
	0         =  "Value - no change"             
	1         =  "Blank - no change"             
	2         =  "Don’t know - no change"        
	3         =  "Refused - no change"           
	10        =  "Value to value"                
	11        =  "Blank to value"                
	12        =  "Don’t know to value"           
	13        =  "Refused to value"              
	20        =  "Value to longitudinal value"   
	21        =  "Blank to longitudinal value"   
	22        =  "Don’t know to longitudinal"    
	23        =  "Refused to longitudinal value" 
	30        =  "Value to allocated value long" 
	31        =  "Blank to allocated value long" 
	32        =  "Don’t know to allocated value" 
	33        =  "Refused to allocated value long"
	40        =  "Value to allocated value"      
	41        =  "Blank to allocated value"      
	42        =  "Don’t know to allocated value" 
	43        =  "Refused to allocated value"    
	50        =  "Value to blank"                
	52        =  "Don’t know to blank"           
	53        =  "Refused to blank"              
;
VALUE a1whyabs	(default=32)
	0         =  "No change or children or armed"
	4         =  "Allocated"                     
;
VALUE a1payabs	(default=32)
	0         =  "No change or children or armed"
	4         =  "Allocated"                     
;
VALUE a1clswkr	(default=32)
	0         =  "No change or children or armed"
	4         =  "Allocated"                     
;
VALUE a1nlflj 	(default=32)
	0         =  "No change or children or armed"
	4         =  "Allocated"                     
;
VALUE a1uslhrs	(default=32)
	0         =  "No change or children or armed"
	4         =  "Allocated"                     
;
VALUE a1hrlywk	(default=32)
	0         =  "No change or children or armed"
	4         =  "Allocated"                     
;
VALUE prwernal	(default=32)
	0         =  "Not allocated"                 
	1         =  "Allocated"                     
;
VALUE prhernal	(default=32)
	0         =  "Not allocated"                 
	1         =  "Allocated"                     
;
VALUE a1unmem 	(default=32)
	0         =  "No change or children or armed"
	4         =  "Allocated"                     
;
VALUE a1uncov 	(default=32)
	0         =  "No change or children or armed"
	4         =  "Allocated"                     
;
VALUE a1enrlw 	(default=32)
	0         =  "No change or children or armed"
	4         =  "Allocated"                     
;
VALUE a1hscol 	(default=32)
	0         =  "No change or children or armed"
	4         =  "Allocated"                     
;
VALUE a1ftpt  	(default=32)
	0         =  "No change or children or armed"
	4         =  "Allocated"                     
;
VALUE i_ernyn 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_ernval	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_wsyn  	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_wsval 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_seyn  	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_seval 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_frmyn 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_frmval	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_ucyn  	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_ucval 	(default=32)
	0         =  "No allocation"                 
	1         =  "Allocated from hot deck"       
	2         =  "Allocated a loss"              
	3         =  "Statistically matched at"      
	4         =  "Statistically matched at"      
;
VALUE i_wcyn  	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_wctyp 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_wcval 	(default=32)
	0         =  "No allocation"                 
	1         =  "Allocated from hot deck"       
	2         =  "Allocated a loss"              
	3         =  "Statistically matched at Level 1"
	4         =  "Statistically matched at Level 2"
;
VALUE i_ssyn  	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_ssval 	(default=32)
	0         =  "No allocation"                 
	1         =  "Allocated from hot deck"       
	2         =  "Allocated a loss"              
	3         =  "Statistically matched at Level 1"
	4         =  "Statistically matched at Level 2"
;
VALUE i_ssiyn 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_ssival	(default=32)
	0         =  "No allocation"                 
	1         =  "Allocated from hot deck"       
	2         =  "Allocated a loss"              
	3         =  "Statistically matched at Level 1"
	4         =  "Statistically matched at Level 2"
;
VALUE i_pawyn 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_pawtyp	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_pawval	(default=32)
	0         =  "No allocation"                 
	1         =  "Allocated from hot deck"       
	2         =  "Allocated a loss"              
	3         =  "Statistically matched at Level 1"
	4         =  "Statistically matched at Level 2"
;
VALUE i_pawmo 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_vetyn 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_vettyp	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_vetval	(default=32)
	0         =  "No allocation"                 
	1         =  "Allocated from hot deck"       
	2         =  "Allocated a loss"              
	3         =  "Statistically matched at Level 1"
	4         =  "Statistically matched at Level 2"
;
VALUE i_vetqva	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_suryn 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_sursca	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_surscb	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_survla	(default=32)
	0         =  "No allocation"                 
	1         =  "Allocated from hot deck"       
	2         =  "Allocated a loss"              
	3         =  "Statistically matched at"      
	4         =  "Statistically matched at"      
;
VALUE i_survlb	(default=32)
	0         =  "No allocation"                 
	1         =  "Allocated from hot deck"       
	2         =  "Allocated a loss"              
	3         =  "Statistically matched at"      
	4         =  "Statistically matched at"      
;
VALUE i_dissca	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_disscb	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_dishp 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_discs 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_disyn 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE toi_val 	(default=32)
	0         =  "Not topcoded"                  
	1         =  "Topcoded"                      
;
VALUE i_disvla	(default=32)
	0         =  "No allocation"                 
	1         =  "Allocated from hot deck"       
	2         =  "Allocated a loss"              
	3         =  "Statistically matched at"      
	4         =  "Statistically matched at"      
;
VALUE i_disvlb	(default=32)
	0         =  "No allocation"                 
	1         =  "Allocated from hot deck"       
	2         =  "Allocated a loss"              
	3         =  "Statistically matched at Level 1"
	4         =  "Statistically matched at Level 2"
;
VALUE i_retyn 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_retsca	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_retscb	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_retvla	(default=32)
	0         =  "No allocation"                 
	1         =  "Allocated from hot deck"       
	2         =  "Allocated a loss"              
	3         =  "Statistically matched at Level 1"
	4         =  "Statistically matched at Level 2"
;
VALUE i_retvlb	(default=32)
	0         =  "No allocation"                 
	1         =  "Allocated from hot deck"       
	2         =  "Allocated a loss"              
	3         =  "Statistically matched at Level 1"
	4         =  "Statistically matched at Level 2"
;
VALUE i_intyn 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_intval	(default=32)
	0         =  "No allocation"                 
	1         =  "Allocated from hot deck"       
	2         =  "Allocated a loss"              
	3         =  "Statistically matched at Level 1"
	4         =  "Statistically matched at Level 2"
;
VALUE i_divyn 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_divval	(default=32)
	0         =  "No allocation"                 
	1         =  "Allocated from hot deck"       
	2         =  "Allocated a loss"              
	3         =  "Statistically matched at Level 1"
	4         =  "Statistically matched at Level 2"
;
VALUE i_rntyn 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_rntval	(default=32)
	0         =  "No allocation"                 
	1         =  "Allocated from hot deck"       
	2         =  "Allocated a loss"              
	3         =  "Statistically matched at Level 1"
	4         =  "Statistically matched at Level 2"
;
VALUE i_edyn  	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_edtypa	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_edtypb	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_oedval	(default=32)
	0         =  "No allocation"                 
	1         =  "Allocated from hot deck"       
	2         =  "Allocated a loss"              
	3         =  "Statistically matched at"      
	4         =  "Statistically matched at"      
;
VALUE i_cspyn 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_cspval	(default=32)
	0         =  "No allocation"                 
	1         =  "Allocated from hot deck"       
	2         =  "Allocated a loss"              
	3         =  "Statistically matched at"      
	4         =  "Statistically matched at"      
;
VALUE i_almyn 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_almval	(default=32)
	0         =  "No allocation"                 
	1         =  "Allocated from hot deck"       
	2         =  "Allocated a loss"              
	3         =  "Statistically matched at"      
	4         =  "Statistically matched at"      
;
VALUE i_finyn 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_finval	(default=32)
	0         =  "No allocation"                 
	1         =  "Allocated from hot deck"       
	2         =  "Allocated a loss"              
	3         =  "Statistically matched at"      
	4         =  "Statistically matched at"      
;
VALUE i_oival 	(default=32)
	0         =  "No allocation"                 
	1         =  "Allocated from hot deck"       
	2         =  "Allocated a loss"              
	3         =  "Statistically matched at"      
	4         =  "Statistically matched at"      
;
VALUE i_nwlook	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_nwlkwk	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_rsnnot	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_losewk	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_lkweek	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_lkstr 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_pyrsn 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_phmemp	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_hrswk 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_hrchk 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_ptyn  	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_ptwks 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_ptrsn 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_ljcw  	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_indus 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_occup 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_workyn	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_wtemp 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_wkswk 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_wkchk 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_ernsrc	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_noemp 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_mig2l 	(default=32)
	0         =  "NIU, or not changed."          
	1         =  "Assigned from householder"     
	2         =  "Assigned from spouse"          
	3         =  "Assigned from mother"          
	4         =  "Assigned from father"          
	5         =  "Allocated from matrix MIG1"    
	6         =  "Allocated from matrix MIG2"    
	7         =  "Allocated from MIG3"           
	8         =  "Allocated from MIG4"           
	9         =  "Allocated from MIG5"           
	10        =  "Allocated from MIG6"           
;
VALUE i_penpla	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_peninc	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_mig1l 	(default=32)
	0         =  "NIU, or not changed."          
	1         =  "Assigned from householder."    
	2         =  "Assigned from spouse"          
	3         =  "Assign from mother"            
	4         =  "Assign from father"            
	5         =  "Allocated from matrix mob"     
;
VALUE p_mvcare	(default=32)
	0         =  "None"                          
;
VALUE p_mvcaid	(default=32)
	0         =  "None"                          
;
VALUE emcontrb	(default=32)
	0         =  "None"                          
;
VALUE filestat	(default=32)
	1         =  "Joint, both <65"               
	2         =  "Joint, one <65 &  one 65+"     
	3         =  "Joint, both 65+"               
	4         =  "Head of household"             
	5         =  "Single"                        
	6         =  "Nonfiler"                      
;
VALUE dep_stat	(default=32)
	0         =  "Not a dependent"               
;
VALUE ctc_crd 	(default=32)
	0         =  "None"                          
;
VALUE eit_cred	(default=32)
	0         =  "None"                          
;
VALUE actc_crd	(default=32)
	0         =  "None"                          
;
VALUE fica    	(default=32)
	0         =  "None"                          
;
VALUE fed_ret 	(default=32)
	0         =  "None"                          
;
VALUE agi     	(default=32)
	0         =  "None or not in universe"       
;
VALUE erp_val 	(default=32)
	0         =  "None or not in universe"       
;
VALUE mwp_val 	(default=32)
	0         =  "None or not in universe"       
;
VALUE tax_inc 	(default=32)
	0         =  "None"                          
;
VALUE marg_tax	(default=32)
	0         =  "None"                          
;
VALUE pemlr   	(default=32)
	0         =  "NIU"                           
	1         =  "Employed - at work"            
	2         =  "Employed - absent"             
	3         =  "Unemployed - on layoff"        
	4         =  "Unemployed - looking"          
	5         =  "Not in labor force - retired"  
	6         =  "Not in labor force - disabled" 
	7         =  "Not in labor force - other"    
;
VALUE pruntype	(default=32)
	0         =  "NIU"                           
	1         =  "Job loser/on layoff"           
	2         =  "Other job loser"               
	3         =  "Temporary job ended"           
	4         =  "Job leaver"                    
	5         =  "Re-entrant"                    
	6         =  "New-entrant"                   
;
VALUE prwkstat	(default=32)
	0         =  "NIU"                           
	1         =  "Not in labor force"            
	2         =  "FT hours (35+), usually FT"    
	3         =  "PT for economic reasons,"      
	4         =  "PT for non-economic reasons,"  
	5         =  "Not at work, usually FT"       
	6         =  "PT hrs, usually PT for economic"
	7         =  "PT hrs, usually PT for non-"   
	8         =  "FT hours, usually PT for"      
	9         =  "FT hours, usually PT for non-" 
	10        =  "Not at work, usually part-time"
	11        =  "Unemployed FT"                 
	12        =  "Unemployed PT"                 
;
VALUE prptrea 	(default=32)
	-1        =  "NIU - adult civilian"          
	0         =  "NIU - children or Armed Forces"
	1         =  "Usually FT - slack work/"      
	2         =  "Usually FT - seasonal work"    
	3         =  "Usually FT - job started/ended"
	4         =  "Usually FT - vacation/personal"
	5         =  "Usually FT - own illness/"     
	6         =  "Usually FT - holiday"          
	7         =  "Usually FT - child care"       
	8         =  "Usually FT - other fam/pers"   
	9         =  "Usually FT - labor dispute"    
	10        =  "Usually FT - weather affected" 
	11        =  "Usually FT - school/training"  
	12        =  "Usually FT - civic/military"   
	13        =  "Usually FT - other reason"     
	14        =  "Usually PT - slack"            
	15        =  "Usually PT - PT could only find"
	16        =  "Usually PT - seasonal work"    
	17        =  "Usually PT - child care"       
	18        =  "Usually PT - other fam/pers"   
	19        =  "Usually PT - health/medical"   
	20        =  "Usually PT - school/training"  
	21        =  "Usually PT - retired/social"   
	22        =  "Usually PT - workweek <35 hours"
	23        =  "Usually PT - other reason"     
;
VALUE prdisc  	(default=32)
	0         =  "NIU"                           
	1         =  "Discouraged worker"            
	2         =  "Conditionally interested"      
	3         =  "Not available"                 
;
VALUE prcow1l 	(default=32)
	0         =  "NIU"                           
	1         =  "Federal govt"                  
	2         =  "State govt"                    
	3         =  "Local govt"                    
	4         =  "Private (incl. self-employed"  
	5         =  "Self-employed, unincorp."      
	6         =  "Without pay"                   
;
VALUE prpertyp	(default=32)
	1         =  "Child household member"        
	2         =  "Adult civilian household member"
	3         =  "Adult Armed Forces household"  
;
VALUE peabsrsn	(default=32)
	-1        =  "NIU - adult civilian"          
	0         =  "NIU - children or Armed Forces"
	2         =  "Slack work/business conditions"
	4         =  "Vacation/personal days"        
	5         =  "Own illness/injury/medical"    
	6         =  "Child care problems"           
	7         =  "Other family/personal"         
	8         =  "Maternity/paternity leave"     
	9         =  "Labor dispute"                 
	10        =  "Weather affected job"          
	11        =  "School/training"               
	12        =  "Civic/military duty"           
	13        =  "Does not work in the business" 
	14        =  "Other (specify)"               
;
VALUE peio1cow	(default=32)
	0         =  "NIU"                           
	1         =  "Government-federal"            
	2         =  "Government-state"              
	3         =  "Government - local"            
	4         =  "Private, for profit"           
	5         =  "Private, nonprofit"            
	6         =  "Self-employed, incorporated"   
	7         =  "Self-employed, unincorporated" 
	8         =  "Without pay"                   
;
VALUE prnlfsch	(default=32)
	0         =  "NIU"                           
	1         =  "In school"                     
	2         =  "Not in school"                 
;
VALUE pehruslt	(default=32)
	-4        =  "Hours vary"                    
	-1        =  "NIU - adult civilian"          
	0         =  "NIU - children or Armed Forces"
;
VALUE peinusyr	(default=32)
	0         =  "NIU"                           
	1         =  "Before 1950"                   
	2         =  "1950-1959"                     
	3         =  "1960-1964"                     
	4         =  "1965-1969"                     
	5         =  "1970-1974"                     
	6         =  "1975-1979"                     
	7         =  "1980-1981"                     
	8         =  "1982-1983"                     
	9         =  "1984-1985"                     
	10        =  "1986-1987"                     
	11        =  "1988-1989"                     
	12        =  "1990-1991"                     
	13        =  "1992-1993"                     
	14        =  "1994-1995"                     
	15        =  "1996-1997"                     
	16        =  "1998-1999"                     
	17        =  "2000-2001"                     
	18        =  "2002-2003"                     
	19        =  "2004-2005"                     
	20        =  "2006-2007"                     
	21        =  "2008-2010"                     
;
VALUE prcitshp	(default=32)
	1         =  "Native, born in the United"    
	2         =  "Native, born in Puerto Rico or"
	3         =  "Native, born abroad of American"
	4         =  "Foreign born, U.S. citizen by" 
	5         =  "Foreign born, not a citizen of"
;
VALUE pxnatvty	(default=32)
	-1        =  "Not allocated"                 
	0         =  "Value - no change"             
	1         =  "Blank - no change"             
	2         =  "Don't know - no change"        
	3         =  "Refused - no change"           
	10        =  "Value to value"                
	11        =  "Blank to value"                
	12        =  "Don't know to value"           
	13        =  "Refused to value"              
	20        =  "Value to longitudinal value"   
	21        =  "Blank to longitudinal value"   
	22        =  "Don't know to longitudinal"    
	23        =  "Refused to longitudinal value" 
	30        =  "Value to allocated value long."
	31        =  "Blank to allocated value long."
	32        =  "Don't know to allocated value" 
	33        =  "Refused to allocated value"    
	40        =  "Value to allocated value"      
	41        =  "Blank to allocated value"      
	42        =  "Don't know to allocated value" 
	43        =  "Refused to allocated value"    
	50        =  "Value to blank"                
	52        =  "Don't know to blank"           
	53        =  "Refused to blank"              
;
VALUE perrp   	(default=32)
	1         =  "Reference person w/rels."      
	2         =  "Reference person w/o rels."    
	3         =  "Spouse"                        
	4         =  "Child"                         
	5         =  "Grandchild"                    
	6         =  "Parent"                        
	7         =  "Brother/sister"                
	8         =  "Other rel. of ref. person"     
	9         =  "Foster child"                  
	10        =  "Nonrel. of ref. person w/rels."
	11        =  "Not used"                      
	12        =  "Nonrel. of ref. person w/o"    
	13        =  "Unmarried partner w/rels."     
	14        =  "Unmarried partner w/o rels."   
	15        =  "Housemate/roommate w/rels."    
	16        =  "Housemate/roommate w/o rels."  
	17        =  "Roomer/boarder w/rels."        
	18        =  "Roomer/boarder w/o rels."      
;
VALUE i_mig3l 	(default=32)
	0         =  "NIU, or not changed."          
	1         =  "State and below assigned"      
	2         =  "County and below assigned"     
	3         =  "MCD and below assigned"        
	4         =  "Place only"                    
	5         =  "County in New York City"       
;
VALUE hi      	(default=32)
	0         =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hityp   	(default=32)
	0         =  "NIU"                           
	1         =  "Family plan"                   
	2         =  "Self-only"                     
;
VALUE dephi   	(default=32)
	0         =  "NIU"                           
	1         =  "Yes"                           
;
VALUE hilin1l 	(default=32)
	0         =  "NIU"                           
;
VALUE hilin2l 	(default=32)
	0         =  "NIU"                           
;
VALUE paid    	(default=32)
	0         =  "NIU"                           
	1         =  "All"                           
	2         =  "Part"                          
	3         =  "None"                          
;
VALUE hiout   	(default=32)
	0         =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE priv    	(default=32)
	0         =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE prityp  	(default=32)
	0         =  "NIU"                           
	1         =  "Family plan"                   
	2         =  "Self-only"                     
;
VALUE depriv  	(default=32)
	0         =  "No or NIU"                     
	1         =  "Yes"                           
;
VALUE pilin1l 	(default=32)
	0         =  "NIU"                           
;
VALUE pilin2l 	(default=32)
	0         =  "NIU"                           
;
VALUE pout    	(default=32)
	0         =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE out     	(default=32)
	0         =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE care    	(default=32)
	0         =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE caid    	(default=32)
	0         =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE mon     	(default=32)
	0         =  "NIU"                           
;
VALUE oth     	(default=32)
	0         =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE otyp_1l 	(default=32)
	0         =  "No"                            
	1         =  "Yes"                           
;
VALUE otyp_2l 	(default=32)
	0         =  "No"                            
	1         =  "Yes"                           
;
VALUE otyp_3l 	(default=32)
	0         =  "No"                            
	1         =  "Yes"                           
;
VALUE otyp_4l 	(default=32)
	0         =  "No"                            
	1         =  "Yes"                           
;
VALUE otyp_5l 	(default=32)
	0         =  "No"                            
	1         =  "Yes"                           
;
VALUE othstper	(default=32)
	0         =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE othstypa	(default=32)
	0         =  "NIU"                           
	1         =  "Medicare"                      
	2         =  "Medicaid"                      
	3         =  "CHAMPUS"                       
	4         =  "CHAMPVA"                       
	5         =  "VA health care"                
	6         =  "Military health care"          
	7         =  "State Children's Health"       
	8         =  "Indian health service"         
	9         =  "Other government health care"  
	10        =  "Employer/union-provided"       
	11        =  "Employer/union-provided (as"   
	12        =  "Privately purchased"           
	13        =  "Privately purchased (as"       
	14        =  "Plan of someone outside the"   
	15        =  "Other"                         
;
VALUE hea     	(default=32)
	0         =  "NIU"                           
	1         =  "Excellent"                     
	2         =  "Very good"                     
	3         =  "Good"                          
	4         =  "Fair"                          
	5         =  "Poor"                          
;
VALUE i_hi    	(default=32)
	0         =  "No"                            
	1         =  "Allocated"                     
;
VALUE i_dephi 	(default=32)
	0         =  "No"                            
	1         =  "Allocated"                     
;
VALUE i_paid  	(default=32)
	0         =  "No"                            
	1         =  "Allocated"                     
;
VALUE i_hiout 	(default=32)
	0         =  "No"                            
	1         =  "Allocated"                     
;
VALUE i_priv  	(default=32)
	0         =  "No"                            
	1         =  "Allocated"                     
;
VALUE i_depriv	(default=32)
	0         =  "No"                            
	1         =  "Allocated"                     
;
VALUE i_pout  	(default=32)
	0         =  "No"                            
	1         =  "Allocated"                     
;
VALUE i_out   	(default=32)
	0         =  "No"                            
	1         =  "Allocated"                     
;
VALUE i_care  	(default=32)
	0         =  "No"                            
	1         =  "Allocated"                     
	2         =  "Logical imputed"               
;
VALUE i_caid  	(default=32)
	0         =  "No"                            
	1         =  "Allocated"                     
	2         =  "Logical imputed"               
;
VALUE i_mon   	(default=32)
	0         =  "No"                            
	1         =  "Allocated"                     
;
VALUE i_oth   	(default=32)
	0         =  "No"                            
	1         =  "Allocated"                     
	2         =  "Logical imputed"               
;
VALUE i_otyp  	(default=32)
	0         =  "No"                            
	1         =  "Allocated"                     
	2         =  "Logical imputed"               
;
VALUE i_ostper	(default=32)
	0         =  "No"                            
	1         =  "Allocated"                     
;
VALUE i_ostyp 	(default=32)
	0         =  "No"                            
	1         =  "Allocated"                     
;
VALUE i_hea   	(default=32)
	0         =  "No"                            
	1         =  "Allocated"                     
;
VALUE ssi_val 	(default=32)
	0         =  "None or not in universe"       
;
VALUE ws_val  	(default=32)
	0         =  "None or not in universe"       
;
VALUE se_val  	(default=32)
	0         =  "None or not in universe"       
;
VALUE ihsflg  	(default=32)
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE tsurvala	(default=32)
	0         =  "Not topcoded"                  
	1         =  "Topcoded"                      
;
VALUE tsurvalb	(default=32)
	0         =  "Not topcoded"                  
	1         =  "Topcoded"                      
;
VALUE tdisvala	(default=32)
	0         =  "Not topcoded"                  
	1         =  "Topcoded"                      
;
VALUE tdisvalb	(default=32)
	0         =  "Not topcoded"                  
	1         =  "Topcoded"                      
;
VALUE tretvala	(default=32)
	0         =  "Not topcoded"                  
	1         =  "Topcoded"                      
;
VALUE tretvalb	(default=32)
	0         =  "Not topcoded"                  
	1         =  "Topcoded"                      
;
VALUE tint_val	(default=32)
	0         =  "Not topcoded"                  
	1         =  "Topcoded"                      
;
VALUE tdiv_val	(default=32)
	0         =  "Not topcoded"                  
	1         =  "Topcoded"                      
;
VALUE trnt_val	(default=32)
	0         =  "Not topcoded"                  
	1         =  "Topcoded"                      
;
VALUE ted_val 	(default=32)
	0         =  "Not topcoded"                  
	1         =  "Topcoded"                      
;
VALUE tcsp_val	(default=32)
	0         =  "Not topcoded"                  
	1         =  "Topcoded"                      
;
VALUE talm_val	(default=32)
	0         =  "Not topcoded"                  
	1         =  "Topcoded"                      
;
VALUE tfin_val	(default=32)
	0         =  "Not topcoded"                  
	1         =  "Topcoded"                      
;
VALUE nxtres  	(default=32)
	0         =  "NIU"                           
	1         =  "Change in marital status"      
	2         =  "To establish own household"    
	3         =  "Other family reason"           
	4         =  "New job or job transfer"       
	5         =  "To look for work or lost job"  
	6         =  "To be closer to work/easier"   
	7         =  "Retired"                       
	8         =  "Other job-related reason"      
	9         =  "Wanted to own home, not rent"  
	10        =  "Wanted new or better house/"   
	11        =  "Wanted better neighborhood"    
	12        =  "Cheaper housing"               
	13        =  "Other housing reason"          
	14        =  "Attend/leave college"          
	15        =  "Change of climate"             
	16        =  "Health reasons"                
	17        =  "Natural disaster"              
	18        =  "Other reason"                  
;
VALUE i_nxtres	(default=32)
	0         =  "NIU, or not changed"           
	1         =  "Assigned from householder"     
	2         =  "Assigned from spouse"          
	3         =  "Assigned from mother"          
	4         =  "Assigned from father"          
	5         =  "Allocated from matrix"         
;
VALUE frm_val 	(default=32)
	0         =  "None or not in universe"       
;
VALUE paidccyn	(default=32)
	0         =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE paidcyna	(default=32)
	0         =  "Not imputed or NIU"            
	1         =  "Imputed"                       
;
VALUE ahiper  	(default=32)
	0         =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE iahiper 	(default=32)
	0         =  "Not imputed OR NIU"            
	1         =  "Imputed"                       
;
VALUE ahityp6l	(default=32)
	0         =  "NIU"                           
	1         =  "Medicare"                      
	2         =  "Medicaid"                      
	3         =  "Tricare or champus"            
	4         =  "CAMPVA ('CHAMPVA' is the"      
	5         =  "Va health care"                
	6         =  "Military health care"          
	7         =  "Children's health insurance"   
	8         =  "Indian health service"         
	9         =  "Other government health care"  
	10        =  "Employer/union-provided"       
	11        =  "Employer/union-provided (as"   
	12        =  "Privately purchased"           
	13        =  "Privately purchased (as"       
	14        =  "Plan of someone outside the"   
	15        =  "Other"                         
;
VALUE iahityp 	(default=32)
	0         =  "Not imputed OR NIU"            
	1         =  "NIU"                           
;
VALUE pchip   	(default=32)
	0         =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE i_pchip 	(default=32)
	0         =  "Not imputed or NIU"            
	1         =  "Imputed"                       
;
VALUE resnss1l	(default=32)
	0         =  "NIU"                           
	1         =  "Retired"                       
	2         =  "Disabled (adult or child)"     
	3         =  "Widowed"                       
	4         =  "Spouse"                        
	5         =  "Surviving child"               
	6         =  "Dependent child"               
	7         =  "on behalf of surviving,"       
	8         =  "Other (adult or child)"        
;
VALUE resnss2l	(default=32)
	0         =  "NIU"                           
	1         =  "Retired"                       
	2         =  "Disabled (adult or child)"     
	3         =  "Widowed"                       
	4         =  "Spouse"                        
	5         =  "Surviving child"               
	6         =  "Dependent child"               
	7         =  "On behalf of surviving,"       
	8         =  "Other (adult or child)"        
;
VALUE resnssa 	(default=32)
	0         =  "Not imputed or not in universe"
	1         =  "Imputed"                       
;
VALUE resnssia	(default=32)
	0         =  "NIU"                           
	1         =  "Disabled (adult or child)"     
	2         =  "Blind (adult or child)"        
	3         =  "On behalf of a disabled child" 
	4         =  "On behalf of a blind child"    
	5         =  "Other (adult or child)"        
;
VALUE resnssib	(default=32)
	0         =  "NIU"                           
	1         =  "Disabled (adult or child)"     
	2         =  "Blind (adult or child)"        
	3         =  "On behalf of a disabled child" 
	4         =  "On behalf of a blind child"    
	5         =  "Other (adult or child)"        
;
VALUE resnssix	(default=32)
	0         =  "Not imputed or not in universe"
	1         =  "Imputed"                       
;
VALUE ssikidyn	(default=32)
	0         =  "NIU"                           
	1         =  "Received SSI"                  
	2         =  "Did not receive SSI"           
;
VALUE ssikdyna	(default=32)
	0         =  "Not imputed or not in universe"
	1         =  "Imputed"                       
;
VALUE sskidyn 	(default=32)
	0         =  "NIU"                           
	1         =  "Received SS"                   
	2         =  "Did not receive SS"            
;
VALUE sskidyna	(default=32)
	0         =  "Not imputed or not in universe"
	1         =  "Imputed"                       
;
VALUE wicyn   	(default=32)
	0         =  "NIU"                           
	1         =  "Received WIC"                  
	2         =  "Did not receive WIC"           
;
VALUE wicyna  	(default=32)
	0         =  "Not imputed or not in universe"
	1         =  "Imputed"                       
;
VALUE industry	(default=32)
	0         =  "Not in universe or children"   
;
VALUE occup   	(default=32)
	0         =  "Not in universe or children"   
;
VALUE fedtax_bc	(default=32)
	0         =  "None"                          
;
VALUE fedtax_ac	(default=32)
	0         =  "None"                          
;
VALUE statetax_bc	(default=32)
	0         =  "None"                          
;
VALUE statetax_ac	(default=32)
	0         =  "None"                          
;
VALUE pecohab 	(default=32)
	-1        =  "No Partner present"            
;
VALUE pelnmom 	(default=32)
	-1        =  "No Mother present"             
	1         =  "Min Value"                     
	16        =  "Max Value"                     
;
VALUE pelndad 	(default=32)
	-1        =  "No Father present"             
;
VALUE pemomtyp	(default=32)
	-1        =  "No Mother present"             
	1         =  "Biological"                    
	2         =  "Step"                          
	3         =  "Adopted"                       
;
VALUE pedadtyp	(default=32)
	-1        =  "No Father present"             
	1         =  "Biological"                    
	2         =  "Step"                          
	3         =  "Adopted"                       
;
VALUE pxcohab 	(default=32)
	-1        =  "Not allocated"                 
	0         =  "Value - No change"             
	1         =  "Blank - No change"             
	2         =  "Don’t know - No change"        
	3         =  "Refused - No change"           
	10        =  "Value to Value"                
	11        =  "Blank to Value"                
	12        =  "Don’t know to Value"           
	13        =  "Refused to Value"              
	20        =  "Value to Longitudinal value"   
	21        =  "Blank to Longitudinal value"   
	22        =  "Don't know to Longitudinal"    
	23        =  "Refused to Longitudinal value" 
	30        =  "Value to Allocated value long."
	31        =  "Blank to Allocated value long."
	32        =  "Don't know to Allocated value" 
	33        =  "Refused to Allocated value"    
	40        =  "Value to Allocated value"      
	41        =  "Blank to Allocated value"      
	42        =  "Don't know to Allocated value" 
	43        =  "Refused to Allocated value"    
	50        =  "Value to Blank"                
	52        =  "Don't know to Blank"           
	53        =  "Refused to Blank"              
;
VALUE pxlndad 	(default=32)
	0         =  "Value - No change"             
	1         =  "Blank - No change"             
	2         =  "Don't know - No change"        
	3         =  "Refused - No change"           
	10        =  "Value to Value"                
	11        =  "Blank to Value"                
	12        =  "Don't know to Value"           
	13        =  "Refused to Value"              
	20        =  "Value to Longitudinal value"   
	21        =  "Blank to Longitudinal value"   
	22        =  "Don't know to Longitudinal"    
	23        =  "Refused to Longitudinal value" 
	30        =  "Value to Allocated value long."
	31        =  "Blank to Allocated value long."
	32        =  "Don't know to Allocated value" 
	33        =  "Refused to Allocated value"    
	40        =  "Value to Allocated value"      
	41        =  "Blank to Allocated value"      
	42        =  "Don't know to Allocated value" 
	43        =  "Refused to Allocated value"    
	50        =  "Value to Blank"                
	52        =  "Don't know to Blank"           
	53        =  "Refused to Blank"              
;
VALUE pedisear	(default=32)
	-1        =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE pediseye	(default=32)
	-1        =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE pedisrem	(default=32)
	-1        =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE pedisphy	(default=32)
	-1        =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE pedisdrs	(default=32)
	-1        =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE pedisout	(default=32)
	-1        =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE prdisflg	(default=32)
	-1        =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE m5g_cbst	(default=32)
	0         =  "NIU, nonmover"                 
	1         =  "CBSA"                          
	2         =  "non CBSA"                      
	3         =  "Abroad"                        
	4         =  "Not identifiable"              
;
VALUE m5g_dscp	(default=32)
	0         =  "NIU (under 5 years old,"       
	1         =  "Principal city of a CBSA"      
	2         =  "Balance of a CBSA"             
	3         =  "Non-metro"                     
	4         =  "Abroad"                        
	5         =  "Not identified"                
;
VALUE m5gsame 	(default=32)
	0         =  "NIU"                           
	1         =  "Yes (nonmover)"                
	2         =  "No, difference house in U.S."  
	3         =  "No, outside the U.S. (mover)"  
;
VALUE m5g_reg 	(default=32)
	0         =  "Not in universe under 5 years" 
	1         =  "Northeast"                     
	2         =  "Midwest"                       
	3         =  "South"                         
	4         =  "West"                          
	5         =  "Abroad"                        
;
VALUE m5g_st  	(default=32)
	0         =  "Nonmatch"                      
	1         =  "Alabama"                       
	2         =  "Alaska"                        
	4         =  "Arizona"                       
	5         =  "Arkansas"                      
	6         =  "California"                    
	8         =  "Colorado"                      
	9         =  "Connecticut"                   
	10        =  "Delaware"                      
	11        =  "District of Columbia"          
	12        =  "Florida"                       
	13        =  "Georgia"                       
	15        =  "Hawaii"                        
	16        =  "Idaho"                         
	17        =  "Illinois"                      
	18        =  "Indiana"                       
	19        =  "Iowa"                          
	20        =  "Kansas"                        
	21        =  "Kentucky"                      
	22        =  "Louisiana"                     
	23        =  "Maine"                         
	24        =  "Maryland"                      
	25        =  "Massachusetts"                 
	26        =  "Michigan"                      
	27        =  "Minnesota"                     
	28        =  "Mississippi"                   
	29        =  "Missouri"                      
	30        =  "Montana"                       
	31        =  "Nebraska"                      
	32        =  "Nevada"                        
	33        =  "New Hampshire"                 
	34        =  "New Jersey"                    
	35        =  "New Mexico"                    
	36        =  "New York"                      
	37        =  "North Carolina"                
	38        =  "North Dakota"                  
	39        =  "Ohio"                          
	40        =  "Oklahoma"                      
	41        =  "Oregon"                        
	42        =  "Pennsylvania"                  
	44        =  "Rhode Island"                  
	45        =  "South Carolina"                
	46        =  "South Dakota"                  
	47        =  "Tennessee"                     
	48        =  "Texas"                         
	49        =  "Utah"                          
	50        =  "Vermont"                       
	51        =  "Virginia"                      
	53        =  "Washington"                    
	54        =  "West Virginia"                 
	55        =  "Wisconsin"                     
	56        =  "Wyoming"                       
	96        =  "Abroad"                        
;
VALUE m5g_div 	(default=32)
	0         =  "Not in universe (under 5 years"
	1         =  "New England"                   
	2         =  "Middle Atlantic"               
	3         =  "East North Central"            
	4         =  "West North Central"            
	5         =  "South Atlantic"                
	6         =  "East South Central"            
	7         =  "West South Central"            
	8         =  "Mountain"                      
	9         =  "Pacific"                       
	10        =  "Aboard"                        
;
VALUE m5g_mtra	(default=32)
	1         =  "Nonmover"                      
	2         =  "CBSA to CBSA"                  
	3         =  "CBSA to nonCBSA"               
	4         =  "NonCBSA to CBSA"               
	5         =  "NonCBSA to nonCBSA"            
	6         =  "Abroad to CBSA"                
	7         =  "Abroad to nonCBSA"             
	8         =  "Not in universe (Children"     
	9         =  "Not identifiable"              
;
VALUE m5g_mtrc	(default=32)
	1         =  "Nonmover"                      
	2         =  "Same county"                   
	3         =  "Different county, same state"  
	4         =  "Different state, same division"
	5         =  "Different division, same region"
	6         =  "Different region"              
	7         =  "Abroad"                        
	8         =  "Not in universe (children under"
;
VALUE m5g_mtrd	(default=32)
	1         =  "Nonmover"                      
	2         =  "Same county"                   
	3         =  "Different county, same state"  
	4         =  "Different state in Northeast"  
	5         =  "Different state in midwest"    
	6         =  "Different state in South"      
	7         =  "Different state in west"       
	8         =  "Abroad, foreign country"       
	9         =  "Not in universe (children under"
;
VALUE i_m5g1l 	(default=32)
	0         =  "NIU, or not changed."          
	1         =  "Assigned from householder."    
	2         =  "Assigned from spouse"          
	3         =  "Assign from mother"            
	4         =  "Assign from father"            
	5         =  "Allocated from matrix mob"     
;
VALUE i_m5g2l 	(default=32)
	0         =  "NIU, or not changed."          
	1         =  "Assigned from householder"     
	2         =  "Assigned from spouse"          
	3         =  "Assigned from mother"          
	4         =  "Assigned from father"          
	5         =  "Allocated from matrix M5G1"    
	6         =  "Allocated from matrix M5G2"    
	7         =  "Allocated from M5G3"           
	8         =  "Allocated from M5G4"           
	9         =  "Allocated from M5G5"           
	10        =  "Allocated from M5G6"           
;
VALUE i_m5g3l 	(default=32)
	0         =  "NIU, or not changed."          
	1         =  "State and below assigned"      
	2         =  "County and below assigned"     
	3         =  "MCD and below assigned"        
	4         =  "Place only"                    
	5         =  "County in New York City"       
;

proc print data=library.cpsmar10 (obs=6);


FORMAT
	hrecord    hrecord.  
	hunits     hunits.   
	hefaminc   hefaminc. 
	h_respnm   h_respnm. 
	h_hhtype   h_hhtype. 
	h_numper   h_numper. 
	hnumfam    hnumfam.  
	h_type     h_type.   
	h_month    h_month.  
	h_hhnum    h_hhnum.  
	h_livqrt   h_livqrt. 
	h_typebc   h_typebc. 
	h_tenure   h_tenure. 
	h_telhhd   h_telhhd. 
	h_telavl   h_telavl. 
	h_telint   h_telint. 
	gereg      gereg.    
	gestcen    gestcen.  
	gtcbsa     gtcbsa.   
	gtco       gtco.     
	gtcbsast   gtcbsast. 
	gtmetsta   gtmetsta. 
	gtindvpc   gtindvpc. 
	gtcbsasz   gtcbsasz. 
	gtcsa      gtcsa.    
	hunder15   hunder1e. 
	hh5to18    hh5to18l. 
	hhotlun    hhotlun.  
	hhotno     hhotno.   
	hflunch    hflunch.  
	hflunno    hflunno.  
	hpublic    hpublic.  
	hlorent    hlorent.  
	hfoodsp    hfoodsp.  
	hfoodno    hfoodno.  
	hfoodmo    hfoodmo.  
	hengast    hengast.  
	hengval    hengval.  
	hinc_ws    hinc_ws.  
	hwsval     hwsval.   
	hinc_se    hinc_se.  
	hseval     hseval.   
	hinc_fr    hinc_fr.  
	hfrval     hfrval.   
	hinc_uc    hinc_uc.  
	hucval     hucval.   
	hinc_wc    hinc_wc.  
	hwcval     hwcval.   
	hss_yn     hss_yn.   
	hssval     hssval.   
	hssi_yn    hssi_yn.  
	hssival    hssival.  
	hpaw_yn    hpaw_yn.  
	hpawval    hpawval.  
	hvet_yn    hvet_yn.  
	hvetval    hvetval.  
	hsur_yn    hsur_yn.  
	hsurval    hsurval.  
	hdis_yn    hdis_yn.  
	hdisval    hdisval.  
	hret_yn    hret_yn.  
	hretval    hretval.  
	hint_yn    hint_yn.  
	hintval    hintval.  
	hdiv_yn    hdiv_yn.  
	hdivval    hdivval.  
	hrnt_yn    hrnt_yn.  
	hrntval    hrntval.  
	hed_yn     hed_yn.   
	hedval     hedval.   
	hcsp_yn    hcsp_yn.  
	hcspval    hcspval.  
	halm_yn    halm_yn.  
	halmval    halmval.  
	hfin_yn    hfin_yn.  
	hfinval    hfinval.  
	hoi_yn     hoi_yn.   
	hoival     hoival.   
	htotval    htotval.  
	hearnval   hearnval. 
	hothval    hothval.  
	hhinc      hhinc.    
	hmcare     hmcare.   
	hmcaid     hmcaid.   
	hchamp     hchamp.   
	hhi_yn     hhi_yn.   
	hhstatus   hhstatus. 
	hunder18   hunder1h. 
	htop5pct   htop5pct. 
	hpctcut    hpctcut.  
	h1tenure   h1tenure. 
	h1livqrt   h1livqrt. 
	h1telhhd   h1telhhd. 
	h1telavl   h1telavl. 
	h1telint   h1telint. 
	i_hhotlu   i_hhotlu. 
	i_hhotno   i_hhotno. 
	i_hflunc   i_hflunc. 
	i_hflunn   i_hflunn. 
	i_hpubli   i_hpubli. 
	i_hloren   i_hloren. 
	i_hfoods   i_hfoods. 
	i_hfdval   i_hfdval. 
	i_hfoodn   i_hfoodn. 
	i_hfoodm   i_hfoodm. 
	i_hengas   i_hengas. 
	i_hengva   i_hengva. 
	prop_tax   prop_tax. 
	housret    housret.  
	hrhtype    hrhtype.  
	i_hunits   i_hunits. 
	hrpaidcc   hrpaidcc. 
	hrwicyn    hrwicyn.  
	hfdval     hfdval.   
	frecord    frecord.  
	fkind      fkind.    
	ftype      ftype.    
	fwifeidx   fwifeidx. 
	fhusbidx   fhusbidx. 
	fspouidx   fspouidx. 
	fownu6     fownu6l.  
	fownu18    fownu18l. 
	frelu6     frelu6l.  
	frelu18    frelu18l. 
	fpctcut    fpctcut.  
	famlis     famlis.   
	povll      povll.    
	frspov     frspov.   
	finc_ws    finc_ws.  
	finc_se    finc_se.  
	fseval     fseval.   
	finc_fr    finc_fr.  
	ffrval     ffrval.   
	finc_uc    finc_uc.  
	fucval     fucval.   
	finc_wc    finc_wc.  
	fwcval     fwcval.   
	finc_ss    finc_ss.  
	fssval     fssval.   
	finc_ssi   finc_ssi. 
	fssival    fssival.  
	finc_paw   finc_paw. 
	fpawval    fpawval.  
	finc_vet   finc_vet. 
	fvetval    fvetval.  
	finc_sur   finc_sur. 
	fsurval    fsurval.  
	finc_dis   finc_dis. 
	fdisval    fdisval.  
	finc_ret   finc_ret. 
	fretval    fretval.  
	finc_int   finc_int. 
	fintval    fintval.  
	finc_div   finc_div. 
	fdivval    fdivval.  
	finc_rnt   finc_rnt. 
	frntval    frntval.  
	finc_ed    finc_ed.  
	fedval     fedval.   
	finc_csp   finc_csp. 
	fcspval    fcspval.  
	finc_alm   finc_alm. 
	falmval    falmval.  
	finc_fin   finc_fin. 
	ffinval    ffinval.  
	finc_oi    finc_oi.  
	foival     foival.   
	ftotval    ftotval.  
	fearnval   fearnval. 
	fothval    fothval.  
	ftot_r     ftot_r.   
	fspanish   fspanish. 
	f_mv_fs    f_mv_fs.  
	f_mv_sl    f_mv_sl.  
	ffngcare   ffngcare. 
	ffngcaid   ffngcaid. 
	fhoussub   fhoussub. 
	ffoodreq   ffoodreq. 
	fhousreq   fhousreq. 
	precord    precord.  
	a_parent   a_parent. 
	a_exprrp   a_exprrp. 
	a_age      a_age.    
	a_maritl   a_maritl. 
	a_spouse   a_spouse. 
	a_sex      a_sex.    
	a_hga      a_hga.    
	prdtrace   prdtrace. 
	p_stat     p_stat.   
	pehspnon   pehspnon. 
	prdthsp    prdthsp.  
	a_famnum   a_famnum. 
	a_famtyp   a_famtyp. 
	a_famrel   a_famrel. 
	a_pfrel    a_pfrel.  
	hhdrel     hhdrel.   
	famrel     famrel.   
	hhdfmx     hhdfmx.   
	parent     parent.   
	age1       age1l.    
	a_fnlwgt   a_fnlwgt. 
	a_ernlwt   a_ernlwt. 
	a_hrs1     a_hrs1l.  
	a_uslft    a_uslft.  
	a_whyabs   a_whyabs. 
	a_payabs   a_payabs. 
	peioind    peioind.  
	peioocc    peioocc.  
	a_wkslk    a_wkslk.  
	a_whenlj   a_whenlj. 
	a_clswkr   a_clswkr. 
	a_nlflj    a_nlflj.  
	a_wantjb   a_wantjb. 
	peafever   peafever. 
	peafwhn1   peafwhna. 
	peafwhn2   peafwhnb. 
	peafwhn3   peafwhnc. 
	peafwhn4   peafwhnd. 
	a_uslhrs   a_uslhrs. 
	a_hrlywk   a_hrlywk. 
	a_hrspay   a_hrspay. 
	a_grswk    a_grswk.  
	a_unmem    a_unmem.  
	a_uncov    a_uncov.  
	a_enrlw    a_enrlw.  
	a_hscol    a_hscol.  
	a_ftpt     a_ftpt.   
	a_lfsr     a_lfsr.   
	a_untype   a_untype. 
	a_wkstat   a_wkstat. 
	a_explf    a_explf.  
	a_wksch    a_wksch.  
	a_civlf    a_civlf.  
	a_ftlf     a_ftlf.   
	a_mjind    a_mjind.  
	a_dtind    a_dtind.  
	mjocc      mjocc.    
	a_dtocc    a_dtocc.  
	prerelg    prerelg.  
	workyn     workyn.   
	wtemp      wtemp.    
	nwlook     nwlook.   
	nwlkwk     nwlkwk.   
	rsnnotw    rsnnotw.  
	wkswork    wkswork.  
	wkcheck    wkcheck.  
	losewks    losewks.  
	lknone     lknone.   
	lkweeks    lkweeks.  
	lkstrch    lkstrch.  
	pyrsn      pyrsn.    
	phmemprs   phmemprs. 
	hrswk      hrswk.    
	hrcheck    hrcheck.  
	ptyn       ptyn.     
	ptweeks    ptweeks.  
	ptrsn      ptrsn.    
	ljcw       ljcw.     
	wexp       wexp.     
	wewkrs     wewkrs.   
	welknw     welknw.   
	weuemp     weuemp.   
	earner     earner.   
	clwk       clwk.     
	weclw      weclw.    
	mig_cbst   mig_cbst. 
	migsame    migsame.  
	mig_reg    mig_reg.  
	mig_st     mig_st.   
	mig_dscp   mig_dscp. 
	gediv      gediv.    
	mig_div    mig_div.  
	mig_mtr1   mig_mtra. 
	mig_mtr3   mig_mtrc. 
	mig_mtr4   mig_mtrd. 
	noemp      noemp.    
	ern_yn     ern_yn.   
	ern_val    ern_val.  
	ern_srce   ern_srce. 
	ern_otr    ern_otr.  
	wageotr    wageotr.  
	wsal_yn    wsal_yn.  
	wsal_val   wsal_val. 
	seotr      seotr.    
	semp_yn    semp_yn.  
	semp_val   semp_val. 
	frmotr     frmotr.   
	frse_yn    frse_yn.  
	frse_val   frse_val. 
	uc_yn      uc_yn.    
	subuc      subuc.    
	strkuc     strkuc.   
	uc_val     uc_val.   
	wc_yn      wc_yn.    
	wc_type    wc_type.  
	wc_val     wc_val.   
	ss_yn      ss_yn.    
	ss_val     ss_val.   
	ssi_yn     ssi_yn.   
	paw_yn     paw_yn.   
	paw_typ    paw_typ.  
	paw_mon    paw_mon.  
	paw_val    paw_val.  
	vet_yn     vet_yn.   
	vet_typ1   vet_typa. 
	vet_typ2   vet_typb. 
	vet_typ3   vet_typc. 
	vet_typ4   vet_typd. 
	vet_typ5   vet_type. 
	vet_qva    vet_qva.  
	vet_val    vet_val.  
	sur_yn     sur_yn.   
	sur_sc1    sur_sc1l. 
	sur_val1   sur_vala. 
	sur_val2   sur_valb. 
	srvs_val   srvs_val. 
	dis_hp     dis_hp.   
	dis_cs     dis_cs.   
	dis_yn     dis_yn.   
	dis_sc1    dis_sc1l. 
	dis_val1   dis_vala. 
	dis_val2   dis_valb. 
	dsab_val   dsab_val. 
	ret_yn     ret_yn.   
	ret_sc1    ret_sc1l. 
	ret_val1   ret_vala. 
	ret_val2   ret_valb. 
	rtm_val    rtm_val.  
	int_yn     int_yn.   
	int_val    int_val.  
	div_yn     div_yn.   
	div_non    div_non.  
	div_val    div_val.  
	rnt_yn     rnt_yn.   
	rnt_val    rnt_val.  
	ed_yn      ed_yn.    
	oed_typ1   oed_typa. 
	oed_typ2   oed_typb. 
	oed_typ3   oed_typc. 
	ed_val     ed_val.   
	csp_yn     csp_yn.   
	csp_val    csp_val.  
	alm_yn     alm_yn.   
	alm_val    alm_val.  
	fin_yn     fin_yn.   
	fin_val    fin_val.  
	oi_off     oi_off.   
	oi_yn      oi_yn.    
	oi_val     oi_val.   
	ptotval    ptotval.  
	pearnval   pearnval. 
	pothval    pothval.  
	fl_665     fl_665l.  
	ptot_r     ptot_r.   
	perlis     perlis.   
	mcare      mcare.    
	mcaid      mcaid.    
	champ      champ.    
	hi_yn      hi_yn.    
	hiown      hiown.    
	hiemp      hiemp.    
	hipaid     hipaid.   
	wrk_ck     wrk_ck.   
	penplan    penplan.  
	penincl    penincl.  
	cov_gh     cov_gh.   
	cov_hi     cov_hi.   
	ch_mc      ch_mc.    
	ch_hi      ch_hi.    
	a1rrp      a1rrp.    
	a1age      a1age.    
	a1maritl   a1maritl. 
	a1spouse   a1spouse. 
	a1sex      a1sex.    
	a1hga      a1hga.    
	pxrace1    pxrace1l. 
	a1lfsr     a1lfsr.   
	pxhspnon   pxhspnon. 
	a1hrs      a1hrs.    
	pxafever   pxafever. 
	pxafwhn1   pxafwhna. 
	a1whyabs   a1whyabs. 
	a1payabs   a1payabs. 
	a1clswkr   a1clswkr. 
	a1nlflj    a1nlflj.  
	a1uslhrs   a1uslhrs. 
	a1hrlywk   a1hrlywk. 
	prwernal   prwernal. 
	prhernal   prhernal. 
	a1unmem    a1unmem.  
	a1uncov    a1uncov.  
	a1enrlw    a1enrlw.  
	a1hscol    a1hscol.  
	a1ftpt     a1ftpt.   
	i_ernyn    i_ernyn.  
	i_ernval   i_ernval. 
	i_wsyn     i_wsyn.   
	i_wsval    i_wsval.  
	i_seyn     i_seyn.   
	i_seval    i_seval.  
	i_frmyn    i_frmyn.  
	i_frmval   i_frmval. 
	i_ucyn     i_ucyn.   
	i_ucval    i_ucval.  
	i_wcyn     i_wcyn.   
	i_wctyp    i_wctyp.  
	i_wcval    i_wcval.  
	i_ssyn     i_ssyn.   
	i_ssval    i_ssval.  
	i_ssiyn    i_ssiyn.  
	i_ssival   i_ssival. 
	i_pawyn    i_pawyn.  
	i_pawtyp   i_pawtyp. 
	i_pawval   i_pawval. 
	i_pawmo    i_pawmo.  
	i_vetyn    i_vetyn.  
	i_vettyp   i_vettyp. 
	i_vetval   i_vetval. 
	i_vetqva   i_vetqva. 
	i_suryn    i_suryn.  
	i_sursc1   i_sursca. 
	i_sursc2   i_surscb. 
	i_survl1   i_survla. 
	i_survl2   i_survlb. 
	i_dissc1   i_dissca. 
	i_dissc2   i_disscb. 
	i_dishp    i_dishp.  
	i_discs    i_discs.  
	i_disyn    i_disyn.  
	toi_val    toi_val.  
	i_disvl1   i_disvla. 
	i_disvl2   i_disvlb. 
	i_retyn    i_retyn.  
	i_retsc1   i_retsca. 
	i_retsc2   i_retscb. 
	i_retvl1   i_retvla. 
	i_retvl2   i_retvlb. 
	i_intyn    i_intyn.  
	i_intval   i_intval. 
	i_divyn    i_divyn.  
	i_divval   i_divval. 
	i_rntyn    i_rntyn.  
	i_rntval   i_rntval. 
	i_edyn     i_edyn.   
	i_edtyp1   i_edtypa. 
	i_edtyp2   i_edtypb. 
	i_oedval   i_oedval. 
	i_cspyn    i_cspyn.  
	i_cspval   i_cspval. 
	i_almyn    i_almyn.  
	i_almval   i_almval. 
	i_finyn    i_finyn.  
	i_finval   i_finval. 
	i_oival    i_oival.  
	i_nwlook   i_nwlook. 
	i_nwlkwk   i_nwlkwk. 
	i_rsnnot   i_rsnnot. 
	i_losewk   i_losewk. 
	i_lkweek   i_lkweek. 
	i_lkstr    i_lkstr.  
	i_pyrsn    i_pyrsn.  
	i_phmemp   i_phmemp. 
	i_hrswk    i_hrswk.  
	i_hrchk    i_hrchk.  
	i_ptyn     i_ptyn.   
	i_ptwks    i_ptwks.  
	i_ptrsn    i_ptrsn.  
	i_ljcw     i_ljcw.   
	i_indus    i_indus.  
	i_occup    i_occup.  
	i_workyn   i_workyn. 
	i_wtemp    i_wtemp.  
	i_wkswk    i_wkswk.  
	i_wkchk    i_wkchk.  
	i_ernsrc   i_ernsrc. 
	i_noemp    i_noemp.  
	i_mig2     i_mig2l.  
	i_penpla   i_penpla. 
	i_peninc   i_peninc. 
	i_mig1     i_mig1l.  
	p_mvcare   p_mvcare. 
	p_mvcaid   p_mvcaid. 
	emcontrb   emcontrb. 
	filestat   filestat. 
	dep_stat   dep_stat. 
	ctc_crd    ctc_crd.  
	eit_cred   eit_cred. 
	actc_crd   actc_crd. 
	fica       fica.     
	fed_ret    fed_ret.  
	agi        agi.      
	erp_val    erp_val.  
	mwp_val    mwp_val.  
	tax_inc    tax_inc.  
	marg_tax   marg_tax. 
	pemlr      pemlr.    
	pruntype   pruntype. 
	prwkstat   prwkstat. 
	prptrea    prptrea.  
	prdisc     prdisc.   
	prcow1     prcow1l.  
	prpertyp   prpertyp. 
	peabsrsn   peabsrsn. 
	peio1cow   peio1cow. 
	prnlfsch   prnlfsch. 
	pehruslt   pehruslt. 
	peinusyr   peinusyr. 
	prcitshp   prcitshp. 
	pxnatvty   pxnatvty. 
	perrp      perrp.    
	i_mig3     i_mig3l.  
	hi         hi.       
	hityp      hityp.    
	dephi      dephi.    
	hilin1     hilin1l.  
	hilin2     hilin2l.  
	paid       paid.     
	hiout      hiout.    
	priv       priv.     
	prityp     prityp.   
	depriv     depriv.   
	pilin1     pilin1l.  
	pilin2     pilin2l.  
	pout       pout.     
	out        out.      
	care       care.     
	caid       caid.     
	mon        mon.      
	oth        oth.      
	otyp_1     otyp_1l.  
	otyp_2     otyp_2l.  
	otyp_3     otyp_3l.  
	otyp_4     otyp_4l.  
	otyp_5     otyp_5l.  
	othstper   othstper. 
	othstyp1   othstypa. 
	hea        hea.      
	i_hi       i_hi.     
	i_dephi    i_dephi.  
	i_paid     i_paid.   
	i_hiout    i_hiout.  
	i_priv     i_priv.   
	i_depriv   i_depriv. 
	i_pout     i_pout.   
	i_out      i_out.    
	i_care     i_care.   
	i_caid     i_caid.   
	i_mon      i_mon.    
	i_oth      i_oth.    
	i_otyp     i_otyp.   
	i_ostper   i_ostper. 
	i_ostyp    i_ostyp.  
	i_hea      i_hea.    
	ssi_val    ssi_val.  
	ws_val     ws_val.   
	se_val     se_val.   
	ihsflg     ihsflg.   
	tsurval1   tsurvala. 
	tsurval2   tsurvalb. 
	tdisval1   tdisvala. 
	tdisval2   tdisvalb. 
	tretval1   tretvala. 
	tretval2   tretvalb. 
	tint_val   tint_val. 
	tdiv_val   tdiv_val. 
	trnt_val   trnt_val. 
	ted_val    ted_val.  
	tcsp_val   tcsp_val. 
	talm_val   talm_val. 
	tfin_val   tfin_val. 
	nxtres     nxtres.   
	i_nxtres   i_nxtres. 
	frm_val    frm_val.  
	paidccyn   paidccyn. 
	paidcyna   paidcyna. 
	ahiper     ahiper.   
	iahiper    iahiper.  
	ahityp6    ahityp6l. 
	iahityp    iahityp.  
	pchip      pchip.    
	i_pchip    i_pchip.  
	resnss1    resnss1l. 
	resnss2    resnss2l. 
	resnssa    resnssa.  
	resnssi1   resnssia. 
	resnssi2   resnssib. 
	resnssia   resnssix. 
	ssikidyn   ssikidyn. 
	ssikdyna   ssikdyna. 
	sskidyn    sskidyn.  
	sskidyna   sskidyna. 
	wicyn      wicyn.    
	wicyna     wicyna.   
	industry   industry. 
	occup      occup.    
	fedtax_bc  fedtax_bc.
	fedtax_ac  fedtax_ac.
	statetax_bc statetax_bc.
	statetax_ac statetax_ac.
	pecohab    pecohab.  
	pelnmom    pelnmom.  
	pelndad    pelndad.  
	pemomtyp   pemomtyp. 
	pedadtyp   pedadtyp. 
	pxcohab    pxcohab.  
	pxlndad    pxlndad.  
	pedisear   pedisear. 
	pediseye   pediseye. 
	pedisrem   pedisrem. 
	pedisphy   pedisphy. 
	pedisdrs   pedisdrs. 
	pedisout   pedisout. 
	prdisflg   prdisflg. 
	m5g_cbst   m5g_cbst. 
	m5g_dscp   m5g_dscp. 
	m5gsame    m5gsame.  
	m5g_reg    m5g_reg.  
	m5g_st     m5g_st.   
	m5g_div    m5g_div.  
	m5g_mtr1   m5g_mtra. 
	m5g_mtr3   m5g_mtrc. 
	m5g_mtr4   m5g_mtrd. 
	i_m5g1     i_m5g1l.  
	i_m5g2     i_m5g2l.  
	i_m5g3     i_m5g3l.  
;
proc contents data=library.cpsmar10;
run;
/*
Copyright 2013 shared by the National Bureau of Economic Research and Jean Roth

National Bureau of Economic Research.
1050 Massachusetts Avenue
Cambridge, MA 02138
jroth@nber.org

This program and all programs referenced in it are free software. You
can redistribute the program or modify it under the terms of the GNU
General Public License as published by the Free Software Foundation;
either version 2 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307
USA.
*/

******************** END OF PROGRAM INSERT ********************;


%Cps_finish_new()

run;
