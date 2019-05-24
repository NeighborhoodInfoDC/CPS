/**************************************************************************
 Program:  Cps_sup_2007_03.sas
 Library:  CPS
 Project:  NeighborhoodInfo DC
 Author:   E. Guernsey 
 Created:  10/29/2007 
 Version:  SAS 9.1
 Environment:  Windows
 
 Description:  Read CPS March Supplement from raw data into SAS.
 
 NB: ZIP Magic must be turned ON before running this program.

 Based on Cpsmar??.sas written by Jean Roth and downloaded from the
 NBER web site (http://www.nber.org/data/cps_progs.html).

 Modifications:
**************************************************************************/

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";

** Define libraries **;
%DCData_lib( CPS )

%let year = 2007;

*options obs=100;   *** NB: Uncomment this line to debug program. ***;


/***** DO NOT CHANGE *****/
%let month = 03;
%let outlib = cps;
%let out = &outlib..Cps_sup_&year._&month;
%let shyear = %substr( &year, 3, 2 );
%let inpath = &_dcdata_path\CPS\Raw\cpsmar&shyear..zip;
%let infile = cpsmar&shyear..dat;

%put _local_;

filename datafile "&inpath\&infile";


******************** START OF PROGRAM INSERT ********************;

*options obs=100;

/*------------------------------------------------
  by Jean Roth	Tue Aug 28 11:09:27 EDT 2007
  Report errors to jroth@nber.org
  This program is distributed under the GNU GPL.
  See end of this file and
  http://www.gnu.org/licenses/ for details.
 ----------------------------------------------- */

*  The following line should contain the directory
   where the SAS file is to be stored  ;

/*libname library "./";*/

*  The following line should contain
   the complete path and name of the raw data file.
   On a PC, use backslashes in paths as in C:\	 ;

/*FILENAME datafile pipe "unzip -p /homes/data/cps/cpsmar07.zip ";*/

*  The following line should contain the name of the SAS dataset ;

/*%let dataset = cpsmar07 ;*/

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

/*DATA library.&dataset ;*/
data 
   &out._was (label="CPS March Supplement, & year, DC/MD/VA/WV"
   drop=comp_city)
   &out._comp (label="CPS March Supplement, & year, comparison cities")
   ;

INFILE datafile LRECL = 2300 stopover;

/*----------------------------------------------*/

/*options nocenter ;*/
/**options compress=yes;*/
/**Choose compress=yes to save space ;*/
/**Choose compress=no if converting to another package using transfer software ;*/
/*options pagesize=59 linesize=72;*/

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
hufaminc
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
hcmcare
hcmceno
hchi
hchino
hchinrh
hchinno
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
hfdval
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
hrtayn
hrnumta
hrccayn
hrnumcc
hrpaidcc
hrcmsryn
hrjcyn
hrjryn
hrjtyn
hrnumcsv
hrnumjc
hrnumjr
hrnumjt
hrnumsc
hrnumwic
hrschlyn
hrwicyn
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
attrib  hufaminc     length=3     label="Family income";                        
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
attrib  gtindvpc     length=3     label="Individual Pricipal City Code";        
attrib  gtcbsasz     length=3     label="Metropolitan area (CBSA) size";        
attrib  gtcsa        length=3     label="Consolidated Statistical Area (CSA)";  
attrib  hunder15     length=3     label="Recode";                               
attrib  hcmcare      length=3     label="Item 80 - During 20.. how many of the";
attrib  hcmceno      length=3     label="Item 80 - Number of children in";      
attrib  hchi         length=3     label="Item 81 - during 20.. how";            
attrib  hchino       length=3     label="Item 81 - Number of";                  
attrib  hchinrh      length=3     label="Item 81a - During 20.. how many of the";
attrib  hchinno      length=3     label="Item 81a - During 20..";               
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
attrib  hfdval       length=4     label="Item 93 - What was the value of all";  
attrib  hengast      length=3     label="Item 94 - Since october 1, 20.., has"; 
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
attrib  h_idnum1     length=$15   label="First part of household id number.  Sa";
attrib  i_hunits     length=3     label="Allocation flag for HUNITS";           
attrib  hrtayn       length=3     label="AT ANY TIME DURING 20.. DID";          
attrib  hrnumta      length=3     label="NUMBER OF PEOPLE IN THIS HOUSEHOLD";   
attrib  hrccayn      length=3     label="AT ANY TIME DURING 20.. DID";          
attrib  hrnumcc      length=3     label="NUMBER OF PEOPLE IN THIS HOUSEHOLD";   
attrib  hrpaidcc     length=3     label="DID (YOU/ANYONE IN THIS HOUSEHOLD) PAY";
attrib  hrcmsryn     length=3     label="AT ANY TIME LAST YEAR, DID (YOU/ANYONE";
attrib  hrjcyn       length=3     label="AT ANY TIME LAST YEAR, DID (YOU/ANYONE";
attrib  hrjryn       length=3     label="AT ANY TIME LAST YEAR, DID (YOU/ANYONE";
attrib  hrjtyn       length=3     label="AT ANY TIME LAST YEAR, DID (YOU/ANYONE";
attrib  hrnumcsv     length=3     label="NUMBER OF PEOPLE IN THE HOUSEHOLD";    
attrib  hrnumjc      length=3     label="NUMBER OF PEOPLE IN THE HOUSEHOLD";    
attrib  hrnumjr      length=3     label="NUMBER OF PEOPLE IN THE HOUSEHOLD WHO";
attrib  hrnumjt      length=3     label="NUMBER OF PEOPLE IN THE HOUSEHOLD WHO";
attrib  hrnumsc      length=3     label="NUMBER OF PEOPLE IN THE HOUSEHOLD WHO";
attrib  hrnumwic     length=3     label="NUMBER OF PEOPLE IN THE HOUSEHOLD";    
attrib  hrschlyn     length=3     label="AT ANY TIME LAST YEAR, DID (YOU/ANYONE";
attrib  hrwicyn      length=3     label="AT ANY TIME LAST YEAR, (WERE YOU/WAS"; 
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
attrib  prnt_ptr     length=3     label="Sequence number of parent in hhld";    
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
attrib  div_yn       length=3     label="Item 67b - Did ... own any shares of"; 
attrib  div_non      length=3     label="Item 67c - No dividends received";     
attrib  div_val      length=4     label="Item 67c - How much did ... receive in";
attrib  rnt_yn       length=3     label="Item 68b - Did ... own any land,";     
attrib  rnt_val      length=4     label="Item 68c - How much did ... receive in";
attrib  ed_yn        length=3     label="Item 69c - Did ... receive educational";
attrib  oed_typ1     length=3     label="Item 69d(1) &  (2) - Source of";       
attrib  oed_typ2     length=3     label="Item 69d(3) - Source of educational";  
attrib  oed_typ3     length=3     label="Item 69d(4)- Source of educational";   
attrib  ed_val       length=4     label="Item 69h - Total amount of educational";
attrib  csp_yn       length=3     label="Item 70b - Did ... receive child suppo";
attrib  csp_val      length=4     label="Item 70c - How much did ... receive in";
attrib  alm_yn       length=3     label="Item 71b - Did .. rec'v alimony paymnt";
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
attrib  a1parent     length=3     label="Parent's line number allocation flag"; 
attrib  a1age        length=3     label="Age allocation flag";                  
attrib  a1maritl     length=3     label="Marital status allocation flag";       
attrib  a1spouse     length=3     label="Spouse's line number allocation flag"; 
attrib  a1sex        length=3     label="Sex allocation flag";                  
attrib  a1hga        length=3     label="Highest grade attended allocation flag";
attrib  a1lfsr       length=3     label="Labor force status recode allocation"; 
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
attrib  cap_gain     length=4     label="Amount of capital gains";              
attrib  cap_loss     length=4     label="Amount of capital losses";             
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
attrib  hilin1       length=3     label="Line number of policyholder of health";
attrib  hilin2       length=3     label="Line number of policyholder of health";
attrib  paid         length=3     label="Did ...'s former or current employer o";
attrib  hiout        length=3     label="Employer or union plan covered someone";
attrib  priv         length=3     label="Covered by a plan that they purchased";
attrib  prityp       length=3     label="Private health insurance plan type.";  
attrib  depriv       length=3     label="Covered by private plan not related to";
attrib  pilin1       length=3     label="Line number of first policyholder of"; 
attrib  pilin2       length=3     label="Line number of second policyholder of";
attrib  pout         length=3     label="Private plan covered someone outside t";
attrib  out          length=3     label="Covered by the health plan of someone";
attrib  care         length=3     label="Covered by medicare, the health";      
attrib  caid         length=3     label="Covered by (medicaid/local name), the";
attrib  mon          length=3     label="Number of months covered by medicaid (";
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
attrib  tranyn       length=3     label="Received transportation assistance?";  
attrib  tranyna      length=3     label="TRANSPORTATION ASSISTANCE ALLOCATION"; 
attrib  ccayn        length=3     label="Receive child care services?";         
attrib  ccayna       length=3     label="Child care assistance allocation flag.";
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
attrib  pchip        length=3     label="Was child under age 19 and with no";   
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
attrib  jcyn         length=3     label="Who attended a job search program or"; 
attrib  jcyna        length=3     label="JCYN allocation flag";                 
attrib  jryn         length=3     label="Who attended job readiness training to";
attrib  jryna        length=3     label="JRYN allocation flag";                 
attrib  jtyn         length=3     label="Who attended a training program to";   
attrib  jtyna        length=3     label="JTYN allocation flag";                 
attrib  schoolyn     length=3     label="Who attended GED classes or received"; 
attrib  scholyna     length=3     label="SCHOOLYN allocation flag";             
attrib  wicyn        length=3     label="Who received WIC?";                    
attrib  wicyna       length=3     label="WICYN allocation flag";                
attrib  comsrvyn     length=3     label="Who participated in work programs such";
attrib  cmsrvyna     length=3     label="COMSRVYN allocation flag";             
attrib  industry     length=4     label="Industry of longest job";              
attrib  occup        length=4     label="Occupation of longest job";            
attrib  peridnum     length=$22   label="22 digit Unique Person identifier";    
attrib  fedtax_bc    length=4     label="Federal income tax liability, before"; 
attrib  fedtax_ac    length=4     label="Federal income tax liability, after";  
attrib  statetax_bc  length=4     label="State income tax liability, before";   
attrib  statetax_ac  length=4     label="State income tax liability, after";    
attrib  pecohab      length=3     label="Demographics line number of cohabiting";
attrib  pelnmom      length=3     label="Demographics line number of Mother";   
attrib  pelndad      length=3     label="Demographics line number of Father";   
attrib  pemomtyp     length=3     label="Demographics type of Mother";          
attrib  pedadtyp     length=3     label="Demographics type of Father";          
attrib  pxcohab      length=3     label="Demographics allocation flag for PECOH";
attrib  pxlnmom      length=3     label="Demographics  Allocation flag for";    
attrib  pxlndad      length=3     label="Demographics  Allocation flag for";    
attrib  pxmomtyp     length=3     label="Demographics  Allocation flag for";    
attrib  pxdadtyp     length=3     label="Demographics  Allocation flag for";    


INPUT @1 rectype 1. @;        /* Hold the data line */
if rectype = 1 then do;       /* HOUSEHOLD RECORDS  */

INPUT
@1    hrecord          1. 
@2    h_seq            5. 
@7    hhpos            2. 
@9    hunits           1. 
@10   hufaminc         2. 
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
@62   hcmcare          1. 
@63   hcmceno          1. 
@64   hchi             1. 
@65   hchino           1. 
@66   hchinrh          1. 
@67   hchinno          1. 
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
@81   hfdval           4. 
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
@361  hrtayn           1. 
@362  hrnumta          2. 
@364  hrccayn          1. 
@365  hrnumcc          2. 
@367  hrpaidcc         1. 
@369  hrcmsryn         1. 
@370  hrjcyn           1. 
@371  hrjryn           1. 
@372  hrjtyn           1. 
@373  hrnumcsv         2. 
@375  hrnumjc          2. 
@377  hrnumjr          2. 
@379  hrnumjt          2. 
@381  hrnumsc          2. 
@383  hrnumwic         2. 
@385  hrschlyn         1. 
@386  hrwicyn          1. 

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
@48   prnt_ptr         2. 
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
@490  a1parent         1. 
@491  a1age            1. 
@492  a1maritl         1. 
@493  a1spouse         1. 
@494  a1sex            1. 
@496  a1hga            1. 
@500  a1lfsr           1. 
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
@689  cap_gain         5. 
@694  cap_loss         4. 
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
@859  tranyn           1. 
@860  tranyna          1. 
@861  ccayn            1. 
@862  ccayna           1. 
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
@892  jcyn             1. 
@893  jcyna            1. 
@894  jryn             1. 
@895  jryna            1. 
@896  jtyn             1. 
@897  jtyna            1. 
@898  schoolyn         1. 
@899  scholyna         1. 
@900  wicyn            1. 
@901  wicyna           1. 
@902  comsrvyn         1. 
@903  cmsrvyna         1. 
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
;

/*output;*/
%cps_output;
end;
drop rectype;


LABEL

	h_seq     = "Household sequence number"             
	hhpos     = "Trailer portion of unique household"   
	hunits    = "Item 78 - How many units in the"       
	hufaminc  = "Family income"                         
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
	gtindvpc  = "Individual Pricipal City Code"         
	gtcbsasz  = "Metropolitan area (CBSA) size"         
	gtcsa     = "Consolidated Statistical Area (CSA)"   
	hunder15  = "Recode"                                
	hcmcare   = "Item 80 - During 20.. how many of the" 
	hcmceno   = "Item 80 - Number of children in"       
	hchi      = "Item 81 - during 20.. how"             
	hchino    = "Item 81 - Number of"                   
	hchinrh   = "Item 81a - During 20.. how many of the"
	hchinno   = "Item 81a - During 20.."                
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
	hfdval    = "Item 93 - What was the value of all"   
	hengast   = "Item 94 - Since october 1, 20.., has"  
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
	h_idnum1  = "First part of household id number.  Sa"
	i_hunits  = "Allocation flag for HUNITS"            
	hrtayn    = "AT ANY TIME DURING 20.. DID"           
	hrnumta   = "NUMBER OF PEOPLE IN THIS HOUSEHOLD"    
	hrccayn   = "AT ANY TIME DURING 20.. DID"           
	hrnumcc   = "NUMBER OF PEOPLE IN THIS HOUSEHOLD"    
	hrpaidcc  = "DID (YOU/ANYONE IN THIS HOUSEHOLD) PAY"
	hrcmsryn  = "AT ANY TIME LAST YEAR, DID (YOU/ANYONE"
	hrjcyn    = "AT ANY TIME LAST YEAR, DID (YOU/ANYONE"
	hrjryn    = "AT ANY TIME LAST YEAR, DID (YOU/ANYONE"
	hrjtyn    = "AT ANY TIME LAST YEAR, DID (YOU/ANYONE"
	hrnumcsv  = "NUMBER OF PEOPLE IN THE HOUSEHOLD"     
	hrnumjc   = "NUMBER OF PEOPLE IN THE HOUSEHOLD"     
	hrnumjr   = "NUMBER OF PEOPLE IN THE HOUSEHOLD WHO" 
	hrnumjt   = "NUMBER OF PEOPLE IN THE HOUSEHOLD WHO" 
	hrnumsc   = "NUMBER OF PEOPLE IN THE HOUSEHOLD WHO" 
	hrnumwic  = "NUMBER OF PEOPLE IN THE HOUSEHOLD"     
	hrschlyn  = "AT ANY TIME LAST YEAR, DID (YOU/ANYONE"
	hrwicyn   = "AT ANY TIME LAST YEAR, (WERE YOU/WAS"  
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
	prnt_ptr  = "Sequence number of parent in hhld"     
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
	div_yn    = "Item 67b - Did ... own any shares of"  
	div_non   = "Item 67c - No dividends received"      
	div_val   = "Item 67c - How much did ... receive in"
	rnt_yn    = "Item 68b - Did ... own any land,"      
	rnt_val   = "Item 68c - How much did ... receive in"
	ed_yn     = "Item 69c - Did ... receive educational"
	oed_typ1  = "Item 69d(1) &  (2) - Source of"        
	oed_typ2  = "Item 69d(3) - Source of educational"   
	oed_typ3  = "Item 69d(4)- Source of educational"    
	ed_val    = "Item 69h - Total amount of educational"
	csp_yn    = "Item 70b - Did ... receive child suppo"
	csp_val   = "Item 70c - How much did ... receive in"
	alm_yn    = "Item 71b - Did .. rec'v alimony paymnt"
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
	a1parent  = "Parent's line number allocation flag"  
	a1age     = "Age allocation flag"                   
	a1maritl  = "Marital status allocation flag"        
	a1spouse  = "Spouse's line number allocation flag"  
	a1sex     = "Sex allocation flag"                   
	a1hga     = "Highest grade attended allocation flag"
	a1lfsr    = "Labor force status recode allocation"  
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
	cap_gain  = "Amount of capital gains"               
	cap_loss  = "Amount of capital losses"              
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
	hilin1    = "Line number of policyholder of health" 
	hilin2    = "Line number of policyholder of health" 
	paid      = "Did ...'s former or current employer o"
	hiout     = "Employer or union plan covered someone"
	priv      = "Covered by a plan that they purchased" 
	prityp    = "Private health insurance plan type."   
	depriv    = "Covered by private plan not related to"
	pilin1    = "Line number of first policyholder of"  
	pilin2    = "Line number of second policyholder of" 
	pout      = "Private plan covered someone outside t"
	out       = "Covered by the health plan of someone" 
	care      = "Covered by medicare, the health"       
	caid      = "Covered by (medicaid/local name), the" 
	mon       = "Number of months covered by medicaid ("
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
	tranyn    = "Received transportation assistance?"   
	tranyna   = "TRANSPORTATION ASSISTANCE ALLOCATION"  
	ccayn     = "Receive child care services?"          
	ccayna    = "Child care assistance allocation flag."
	paidccyn  = "Which children needed paid-care while" 
	paidcyna  = "PAIDCCYN allocation flag."             
	ahiper    = "Does person with no coverage reported" 
	iahiper   = "AHIPER allocation flag."               
	ahityp6   = "What type of insurance (was/were)"     
	iahityp   = "AHITYP allocation flag."               
	pchip     = "Was child under age 19 and with no"    
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
	jcyn      = "Who attended a job search program or"  
	jcyna     = "JCYN allocation flag"                  
	jryn      = "Who attended job readiness training to"
	jryna     = "JRYN allocation flag"                  
	jtyn      = "Who attended a training program to"    
	jtyna     = "JTYN allocation flag"                  
	schoolyn  = "Who attended GED classes or received"  
	scholyna  = "SCHOOLYN allocation flag"              
	wicyn     = "Who received WIC?"                     
	wicyna    = "WICYN allocation flag"                 
	comsrvyn  = "Who participated in work programs such"
	cmsrvyna  = "COMSRVYN allocation flag"              
	industry  = "Industry of longest job"               
	occup     = "Occupation of longest job"             
	peridnum  = "22 digit Unique Person identifier"     
	fedtax_bc = "Federal income tax liability, before"  
	fedtax_ac = "Federal income tax liability, after"   
	statetax_bc= "State income tax liability, before"    
	statetax_ac= "State income tax liability, after"     
	pecohab   = "Demographics line number of cohabiting"
	pelnmom   = "Demographics line number of Mother"    
	pelndad   = "Demographics line number of Father"    
	pemomtyp  = "Demographics type of Mother"           
	pedadtyp  = "Demographics type of Father"           
	pxcohab   = "Demographics allocation flag for PECOH"
	pxlnmom   = "Demographics  Allocation flag for"     
	pxlndad   = "Demographics  Allocation flag for"     
	pxmomtyp  = "Demographics  Allocation flag for"     
	pxdadtyp  = "Demographics  Allocation flag for"     
; 


/*----------------------------------------------

The PROC FORMAT statement will store the formats
in a sas data set called fcpmar07 .
To use the stored formats in a subsequent program,
include something like this:

proc format cntlin=library.fcpmar07;
PROC freq;
        tables PULAYCK1 ;
        format PULAYCK1   PULAYCKa.;

For more information, consult the PROC FORMAT
section of the SAS Procedures Guide

  ----------------------------------------------*/



/*proc print data=library.cpsmar07 (obs=6);*/


FORMAT
	hrecord    hrecord.  
	hunits     hunits.   
	hufaminc   hufaminc. 
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
	hcmcare    hcmcare.  
	hcmceno    hcmceno.  
	hchi       hchi.     
	hchino     hchino.   
	hchinrh    hchinrh.  
	hchinno    hchinno.  
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
	hfdval     hfdval.   
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
	hrtayn     hrtayn.   
	hrnumta    hrnumta.  
	hrccayn    hrccayn.  
	hrnumcc    hrnumcc.  
	hrpaidcc   hrpaidcc. 
	hrcmsryn   hrcmsryn. 
	hrjcyn     hrjcyn.   
	hrjryn     hrjryn.   
	hrjtyn     hrjtyn.   
	hrschlyn   hrschlyn. 
	hrwicyn    hrwicyn.  
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
	a1parent   a1parent. 
	a1age      a1age.    
	a1maritl   a1maritl. 
	a1spouse   a1spouse. 
	a1sex      a1sex.    
	a1hga      a1hga.    
	a1lfsr     a1lfsr.   
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
	cap_gain   cap_gain. 
	cap_loss   cap_loss. 
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
	tranyn     tranyn.   
	tranyna    tranyna.  
	ccayn      ccayn.    
	ccayna     ccayna.   
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
	jcyn       jcyn.     
	jcyna      jcyna.    
	jryn       jryn.     
	jryna      jryna.    
	jtyn       jtyn.     
	jtyna      jtyna.    
	schoolyn   schoolyn. 
	scholyna   scholyna. 
	wicyn      wicyn.    
	wicyna     wicyna.   
	comsrvyn   comsrvyn. 
	cmsrvyna   cmsrvyna. 
	industry   industry. 
	occup      occup.    
	/*fedtax_bc  fedtax_bc.*/
	/*fedtax_ac  fedtax_ac.*/
	/*statetax_bc statetax_bc.*/
	/*statetax_ac statetax_ac.*/
	pecohab    pecohab.  
	pelnmom    pelnmom.  
	pelndad    pelndad.  
	pemomtyp   pemomtyp. 
	pedadtyp   pedadtyp. 
	pxcohab    pxcohab.  
	pxlndad    pxlndad.  
;
run;
filename datafile clear;

/*proc contents data=library.cpsmar07;*/
/*
Copyright 2007 shared by the National Bureau of Economic Research and Jean Roth

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


%cps_finish;

run;

