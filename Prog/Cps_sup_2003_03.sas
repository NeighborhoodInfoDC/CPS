/**************************************************************************
 Program:  Cps_sup_2003_03.sas
 Library:  CPS
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  09/05/06
 Version:  SAS 8.2
 Environment:  Windows
 
 Description:  Read CPS 2003 March Supplement from raw data into SAS
 data set.

 Based on Cpsmar03.sas written by Jean Roth and downloaded from the
 NBER web site (http://www.nber.org/data/cps_progs.html) 11/8/05.

 Modifications:
  09/06/06 PAT Changed output data sets to _was & _comp.
**************************************************************************/

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";

** Define libraries **;
%DCData_lib( CPS )

*options obs=1000;

%let month = 03;
%let year = 2003;
%let outlib = cps;
%let inpath = D:\DCData\Libraries\CPS\Raw\cpsmar03.zip;
%let infile = cpsmar03.dat;
%let out = &outlib..Cps_sup_&year._&month;

/*------------------------------------------------------------------------------------*/
/*by Jean Roth	Fri Oct  3 10:52:35 EDT 2003
  Please report errors to jroth@nber.org
  This program produces a dataset of all Person records with their respective Household
  and Family data appended.
  Remember, household and family data are repeated for each person in the output dataset
  Five steps:
       (1)   Uncomment the 'options compress=yes' statement if desired to save space
       (2)   Uncomment 'LENGTH' statement if desired to save space
       (3)   Specify output directories in 'libname' statements
       (4)   Specify the input file name/location in the 'filename' statement.
             On a PC, use backslashes as in C:\
       (5)   Read in the compressed or uncompressed raw data file.  See the
             'filename' and 'INFILE' statements.
  Other changes may be user and platform specific.                                    
  NOTE:  A value of -1 (or -1/# of decimals) usually indicates 'Not in Universe'      
  NOTE:  This program is distributed under the GNU GPL. See end of
  this file and http://www.gnu.org/licenses/ for details.
*/
/*------------------------------------------------------------------------------------*/

*options obs=100;
*options compress=yes;
*change compress=no if converting data to another format with a transfer package;
*options pagesize=59 linesize=72;

/*------------------------------------------------------------------------------------*/
/* A -1 means Blank; Not in Universe; or In Universe, Met No Conditions;
   Sometimes, -1 is present but not described in the codebook.
   If the variable has a decimal, it will be resolved as -1/# of decimals
   These are usually 'Not in Universe' values also.                                   */
/*------------------------------------------------------------------------------------*/

/***PT***libname library './';******/
*See the codebook for more detail;

/***PT***Proc Format section deleted.******/

/***PT***filename raw pipe "unzip -p /homes/data/cps/cpsmar03.zip  ";******/
filename raw "&inpath\&infile";

/***PT***data library.cpsmar03;*****/
data 
  &out._was (label="CPS March Supplement, &year, DC/MD/VA/WV" drop=comp_city)
  &out._comp (label="CPS March Supplement, &year, comparison cities")
  ;

RETAIN

HRECORD
H_SEQ
HHPOS
HUNITS
H_FAMINC
H_RESPNM
H_YEAR
H_HHTYPE
H_NUMPER
HNUMFAM
H_TYPE
H_MONTH
H_MIS
H_HHNUM
H_LIVQRT
H_TYPEBC
H_TENURE
H_TELHHD
H_TELAVL
H_TELINT
HG_REG
HG_ST60
GESTFIPS
HG_MSAC
GECO
HG_CMSA
HMSSZ
HPMSASZ
HMSA_R
HCCC_R
HUNDER15
HCMCARE
HCMCENO
HCHI
HCHINO
HCHINRH
HCHINNO
HH5TO18
HHOTLUN
HHOTNO
HFLUNCH
HFLUNNO
HPUBLIC
HLORENT
HFOODSP
HFOODNO
HFOODMO
HFDVAL
HENGAST
HENGVAL
HINC_WS
HWSVAL
HINC_SE
HSEVAL
HINC_FR
HFRVAL
HINC_UC
HUCVAL
HINC_WC
HWCVAL
HSS_YN
HSSVAL
HSSI_YN
HSSIVAL
HPAW_YN
HPAWVAL
HVET_YN
HVETVAL
HSUR_YN
HSURVAL
HDIS_YN
HDISVAL
HRET_YN
HRETVAL
HINT_YN
HINTVAL
HDIV_YN
HDIVVAL
HRNT_YN
HRNTVAL
HED_YN
HEDVAL
HCSP_YN
HCSPVAL
HALM_YN
HALMVAL
HFIN_YN
HFINVAL
HOI_YN
HOIVAL
HTOTVAL
HEARNVAL
HOTHVAL
HHINC
HMCARE
HMCAID
HCHAMP
HHI_YN
HHSTATUS
HUNDER18
HTOP5PCT
HPCTCUT
INDCCODE
HSUP_WGT
HPTENURE
HPLIVQRT
HPTELHHD
HPTELAVL
HPTELINT
I_HHOTLU
I_HHOTNO
I_HFLUNC
I_HFLUNN
I_HPUBLI
I_HLOREN
I_HFOODS
I_HFDVAL
I_HFOODN
I_HFOODM
I_HENGAS
I_HENGVA
PROP_TAX
HOUSRET
HRHTYPE
H_IDNUM
I_HUNITS
HRTAYN
HRNUMTA
HRCCAYN
HRNUMCC
HRPAIDCC
HRCMSRYN
HRJCYN
HRJRYN
HRJTYN
HRNUMCSV
HRNUMJC
HRNUMJR
HRNUMJT
HRNUMSC
HRNUMWIC
HRSCHLYN
HRWICYN
FRECORD
FH_SEQ
FFPOS
FKIND
FTYPE
FPERSONS
FHEADIDX
FWIFEIDX
FHUSBIDX
FSPOUIDX
FLASTIDX
FMLASIDX
FOWNU6
FOWNU18
FRELU6
FRELU18
FPCTCUT
FPOVCUT
FAMLIS
POVLL
FRSPOV
FRSPPCT
FINC_WS
FWSVAL
FINC_SE
FSEVAL
FINC_FR
FFRVAL
FINC_UC
FUCVAL
FINC_WC
FWCVAL
FINC_SS
FSSVAL
FINC_SSI
FSSIVAL
FINC_PAW
FPAWVAL
FINC_VET
FVETVAL
FINC_SUR
FSURVAL
FINC_DIS
FDISVAL
FINC_RET
FRETVAL
FINC_INT
FINTVAL
FINC_DIV
FDIVVAL
FINC_RNT
FRNTVAL
FINC_ED
FEDVAL
FINC_CSP
FCSPVAL
FINC_ALM
FALMVAL
FINC_FIN
FFINVAL
FINC_OI
FOIVAL
FTOTVAL
FEARNVAL
FOTHVAL
FTOT_R
FSPANISH
FSUP_WGT
FFPOSOLD
F_MV_FS
F_MV_SL
FFNGCARE
FFNGCAID
FHOUSSUB
FFOODREQ
FHOUSREQ
;

missing A;
/***PT***infile raw lrecl = 1300 missover ;*****/
infile raw lrecl = 1300 stopover ;

* To read in uncompressed file, uncomment INFILE & comment filename & infile lines;
*INFILE '/home/data/cps/cpsmar03.raw' LRECL=1300 missover;


*LENGTH
H_SEQ      4    
H_YEAR     4    
HG_MSAC    4    
HFDVAL     4    
HENGVAL    4    
HWSVAL     5    
HSEVAL     5    
HFRVAL     5    
HUCVAL     5    
HWCVAL     5    
HSSVAL     5    
HSSIVAL    4    
HPAWVAL    4    
HVETVAL    5    
HSURVAL    5    
HDISVAL    5    
HRETVAL    5    
HINTVAL    5    
HDIVVAL    5    
HRNTVAL    5    
HEDVAL     5    
HCSPVAL    5    
HALMVAL    5    
HFINVAL    5    
HOIVAL     5    
HTOTVAL    5    
HEARNVAL   5    
HOTHVAL    5    
HSUP_WGT   8    
PROP_TAX   4    
HOUSRET    4    
H_IDNUM    $15  
FH_SEQ     4    
FPOVCUT    4    
FRSPPCT    4    
FWSVAL     5    
FSEVAL     5    
FFRVAL     5    
FUCVAL     5    
FWCVAL     5    
FSSVAL     5    
FSSIVAL    4    
FPAWVAL    4    
FVETVAL    5    
FSURVAL    5    
FDISVAL    5    
FRETVAL    5    
FINTVAL    5    
FDIVVAL    5    
FRNTVAL    5    
FEDVAL     5    
FCSPVAL    5    
FALMVAL    5    
FFINVAL    5    
FOIVAL     5    
FTOTVAL    5    
FEARNVAL   5    
FOTHVAL    5    
FSUP_WGT   8    
F_MV_FS    4    
F_MV_SL    4    
FFNGCARE   4    
FFNGCAID   4    
FFOODREQ   4    
FHOUSREQ   4    
PH_SEQ     4    
A_FNLWGT   8    
A_ERNLWT   8    
MARSUPWT   8    
PEIOIND    4    
PEIOOCC    4    
A_HRSPAY   8    
A_GRSWK    4    
ERN_VAL    4    
WSAL_VAL   4    
SEMP_VAL   4    
FRSE_VAL   4    
UC_VAL     4    
WC_VAL     4    
SS_VAL     4    
PAW_VAL    4    
VET_VAL    4    
SUR_VAL1   4    
SUR_VAL2   4    
SRVS_VAL   4    
DIS_VAL1   4    
DIS_VAL2   4    
DSAB_VAL   4    
RET_VAL1   4    
RET_VAL2   4    
RTM_VAL    4    
INT_VAL    4    
DIV_VAL    4    
RNT_VAL    4    
ED_VAL     4    
CSP_VAL    4    
ALM_VAL    4    
FIN_VAL    4    
OI_VAL     4    
PTOTVAL    5    
PEARNVAL   5    
POTHVAL    5    
P_MVCARE   4    
P_MVCAID   4    
EMCONTRB   4    
FED_TAX    4    
EIT_CRED   4    
STATETAX   4    
FICA       4    
FED_RET    4    
AGI        4    
CAP_GAIN   4    
CAP_LOSS   4    
TAX_INC    4    
SSI_VAL    4    
WS_VAL     4    
SE_VAL     4    
FRM_VAL    4    
INDUSTRY   4    
OCCUP      4    
PERIDNUM   $21  
DEFAULT=3;

INPUT @1 rectype 1. @;        /* Hold the data line */
if rectype = 1 then do;       /* HOUSEHOLD RECORDS  */

/*-------------------------------------------------------------------------------------*/
/* To make the SAS program run, the following changes in variable names have been made:
       '$' to 'd';            '-' to '_';                    '%' to 'p';
       ($ = unedited data;     - = edited data;               % = allocated data)
   Note:  Variable names in SAS are not case-sensitive                                 */
/*-------------------------------------------------------------------------------------*/

INPUT
@1    HRECORD          1. 
@2    H_SEQ            5. 
@7    HHPOS            2. 
@9    HUNITS           1. 
@10   H_FAMINC         2. 
@12   H_RESPNM         2. 
@14   H_YEAR           4. 
@20   H_HHTYPE         1. 
@21   H_NUMPER         2. 
@23   HNUMFAM          2. 
@25   H_TYPE           1. 
@26   H_MONTH          2. 
@29   H_MIS            1. 
@30   H_HHNUM          1. 
@31   H_LIVQRT         2. 
@33   H_TYPEBC         2. 
@35   H_TENURE         1. 
@36   H_TELHHD         1. 
@37   H_TELAVL         1. 
@38   H_TELINT         1. 
@39   HG_REG           1. 
@40   HG_ST60          2. 
@42   GESTFIPS         2. 
@44   HG_MSAC          4. 
@50   GECO             3. 
@53   HG_CMSA          2. 
@55   HMSSZ            1. 
@56   HPMSASZ          1. 
@57   HMSA_R           1. 
@58   HCCC_R           1. 
@60   HUNDER15         2. 
@62   HCMCARE          1. 
@63   HCMCENO          1. 
@64   HCHI             1. 
@65   HCHINO           1. 
@66   HCHINRH          1. 
@67   HCHINNO          1. 
@68   HH5TO18          2. 
@70   HHOTLUN          1. 
@71   HHOTNO           1. 
@72   HFLUNCH          1. 
@73   HFLUNNO          1. 
@74   HPUBLIC          1. 
@75   HLORENT          1. 
@76   HFOODSP          1. 
@77   HFOODNO          1. 
@79   HFOODMO          2. 
@81   HFDVAL           4. 
@85   HENGAST          1. 
@86   HENGVAL          4. 
@90   HINC_WS          1. 
@91   HWSVAL           7. 
@98   HINC_SE          1. 
@99   HSEVAL           7. 
@106  HINC_FR          1. 
@107  HFRVAL           7. 
@114  HINC_UC          1. 
@115  HUCVAL           7. 
@122  HINC_WC          1. 
@123  HWCVAL           7. 
@130  HSS_YN           1. 
@131  HSSVAL           7. 
@138  HSSI_YN          1. 
@139  HSSIVAL          6. 
@145  HPAW_YN          1. 
@146  HPAWVAL          6. 
@152  HVET_YN          1. 
@153  HVETVAL          7. 
@160  HSUR_YN          1. 
@161  HSURVAL          7. 
@168  HDIS_YN          1. 
@169  HDISVAL          7. 
@176  HRET_YN          1. 
@177  HRETVAL          7. 
@184  HINT_YN          1. 
@185  HINTVAL          7. 
@192  HDIV_YN          1. 
@193  HDIVVAL          7. 
@200  HRNT_YN          1. 
@201  HRNTVAL          7. 
@208  HED_YN           1. 
@209  HEDVAL           7. 
@216  HCSP_YN          1. 
@217  HCSPVAL          7. 
@224  HALM_YN          1. 
@225  HALMVAL          7. 
@232  HFIN_YN          1. 
@233  HFINVAL          7. 
@240  HOI_YN           1. 
@241  HOIVAL           7. 
@248  HTOTVAL          8. 
@256  HEARNVAL         8. 
@264  HOTHVAL          8. 
@272  HHINC            2. 
@274  HMCARE           1. 
@275  HMCAID           1. 
@276  HCHAMP           1. 
@277  HHI_YN           1. 
@278  HHSTATUS         1. 
@279  HUNDER18         2. 
@281  HTOP5PCT         1. 
@282  HPCTCUT          2. 
@285  INDCCODE         1. 
@287  HSUP_WGT        8.2 
@295  HPTENURE         1. 
@297  HPLIVQRT         1. 
@299  HPTELHHD         1. 
@300  HPTELAVL         1. 
@301  HPTELINT         1. 
@308  I_HHOTLU         1. 
@309  I_HHOTNO         1. 
@310  I_HFLUNC         1. 
@311  I_HFLUNN         1. 
@312  I_HPUBLI         1. 
@313  I_HLOREN         1. 
@314  I_HFOODS         1. 
@315  I_HFDVAL         1. 
@316  I_HFOODN         1. 
@317  I_HFOODM         1. 
@318  I_HENGAS         1. 
@319  I_HENGVA         1. 
@332  PROP_TAX         5. 
@337  HOUSRET          5. 
@342  HRHTYPE          2. 
@344  H_IDNUM        $15. 
@359  I_HUNITS         1. 
@361  HRTAYN           1. 
@362  HRNUMTA          2. 
@364  HRCCAYN          1. 
@365  HRNUMCC          2. 
@367  HRPAIDCC         1. 
@369  HRCMSRYN         1. 
@370  HRJCYN           1. 
@371  HRJRYN           1. 
@372  HRJTYN           1. 
@373  HRNUMCSV         2. 
@375  HRNUMJC          2. 
@377  HRNUMJR          2. 
@379  HRNUMJT          2. 
@381  HRNUMSC          2. 
@383  HRNUMWIC         2. 
@385  HRSCHLYN         1. 
@386  HRWICYN          1. 

;
end;
else if rectype = 2 then do;  /* FAMILY RECORDS */

INPUT
@1    FRECORD          1. 
@2    FH_SEQ           5. 
@7    FFPOS            2. 
@9    FKIND            1. 
@10   FTYPE            1. 
@11   FPERSONS         2. 
@13   FHEADIDX         2. 
@15   FWIFEIDX         2. 
@17   FHUSBIDX         2. 
@19   FSPOUIDX         2. 
@21   FLASTIDX         2. 
@23   FMLASIDX         2. 
@25   FOWNU6           1. 
@27   FOWNU18          1. 
@28   FRELU6           1. 
@29   FRELU18          1. 
@30   FPCTCUT          2. 
@32   FPOVCUT          5. 
@37   FAMLIS           1. 
@38   POVLL            2. 
@40   FRSPOV           2. 
@42   FRSPPCT          5. 
@47   FINC_WS          1. 
@48   FWSVAL           7. 
@55   FINC_SE          1. 
@56   FSEVAL           7. 
@63   FINC_FR          1. 
@64   FFRVAL           7. 
@71   FINC_UC          1. 
@72   FUCVAL           7. 
@79   FINC_WC          1. 
@80   FWCVAL           7. 
@87   FINC_SS          1. 
@88   FSSVAL           7. 
@95   FINC_SSI         1. 
@96   FSSIVAL          6. 
@102  FINC_PAW         1. 
@103  FPAWVAL          6. 
@109  FINC_VET         1. 
@110  FVETVAL          7. 
@117  FINC_SUR         1. 
@118  FSURVAL          7. 
@125  FINC_DIS         1. 
@126  FDISVAL          7. 
@133  FINC_RET         1. 
@134  FRETVAL          7. 
@141  FINC_INT         1. 
@142  FINTVAL          7. 
@149  FINC_DIV         1. 
@150  FDIVVAL          7. 
@157  FINC_RNT         1. 
@158  FRNTVAL          7. 
@165  FINC_ED          1. 
@166  FEDVAL           7. 
@173  FINC_CSP         1. 
@174  FCSPVAL          7. 
@181  FINC_ALM         1. 
@182  FALMVAL          7. 
@189  FINC_FIN         1. 
@190  FFINVAL          7. 
@197  FINC_OI          1. 
@198  FOIVAL           7. 
@205  FTOTVAL          8. 
@213  FEARNVAL         8. 
@221  FOTHVAL          8. 
@229  FTOT_R           2. 
@231  FSPANISH         1. 
@233  FSUP_WGT        8.2 
@241  FFPOSOLD         2. 
@243  F_MV_FS          4. 
@247  F_MV_SL          4. 
@251  FFNGCARE         5. 
@256  FFNGCAID         5. 
@261  FHOUSSUB         3. 
@264  FFOODREQ         4. 
@268  FHOUSREQ         4. 


;
end ;

else if rectype = 3 then do;  /* PERSON RECORDS */

INPUT
@1    PRECORD          1. 
@2    PH_SEQ           5. 
@7    PPPOS            2. 
@9    A_LINENO         2. 
@11   A_PARENT         2. 
@13   A_EXPRRP         2. 
@15   A_AGE            2. 
@17   A_MARITL         1. 
@18   A_SPOUSE         2. 
@20   A_SEX            1. 
@21   A_VET            1. 
@22   A_HGA            2. 
@24   PRDTRACE         2. 
@26   P_STAT           1. 
@27   PEHSPNON         1. 
@28   PRDTHSP          1. 
@29   A_FAMNUM         2. 
@31   A_FAMTYP         1. 
@32   A_FAMREL         1. 
@33   A_PFREL          1. 
@34   HHDREL           1. 
@35   FAMREL           2. 
@37   HHDFMX           2. 
@39   PARENT           1. 
@40   AGE1             2. 
@44   PHF_SEQ          2. 
@46   PF_SEQ           2. 
@48   PRNT_PTR         2. 
@50   A_FNLWGT        8.2 
@58   A_ERNLWT        8.2 
@66   MARSUPWT        8.2 
@76   A_HRS1           2. 
@79   A_USLFT          1. 
@85   A_WHYABS         1. 
@86   A_PAYABS         1. 
@87   PEIOIND          4. 
@91   PEIOOCC          4. 
@96   A_WKSLK          3. 
@102  A_WHENLJ         1. 
@109  A_CLSWKR         1. 
@110  PPPOSOLD         2. 
@112  A_NLFLJ          1. 
@114  A_WANTJB         1. 
@128  A_USLHRS         2. 
@130  A_HRLYWK         1. 
@131  A_HRSPAY        4.2 
@135  A_GRSWK          4. 
@139  A_UNMEM          1. 
@140  A_UNCOV          1. 
@142  A_ENRLW          1. 
@143  A_HSCOL          1. 
@144  A_FTPT           1. 
@145  A_LFSR           1. 
@146  A_UNTYPE         1. 
@149  A_WKSTAT         1. 
@150  A_EXPLF          1. 
@151  A_WKSCH          1. 
@152  A_CIVLF          1. 
@153  A_FTLF           1. 
@155  A_MJIND          2. 
@157  A_DTIND          2. 
@159  MJOCC            2. 
@161  A_DTOCC          2. 
@163  PRERELG          1. 
@164  A_RCOW           1. 
@165  WORKYN           1. 
@166  WTEMP            1. 
@167  NWLOOK           1. 
@168  NWLKWK           2. 
@170  RSNNOTW          1. 
@171  WKSWORK          2. 
@173  WKCHECK          1. 
@174  LOSEWKS          1. 
@175  LKNONE           1. 
@176  LKWEEKS          2. 
@178  LKSTRCH          1. 
@179  PYRSN            1. 
@180  PHMEMPRS         1. 
@181  HRSWK            2. 
@183  HRCHECK          1. 
@184  PTYN             1. 
@185  PTWEEKS          2. 
@187  PTRSN            1. 
@189  LJCW             1. 
@196  WEXP             2. 
@198  WEWKRS           1. 
@199  WELKNW           1. 
@200  WEUEMP           1. 
@201  EARNER           1. 
@202  CLWK             1. 
@203  WECLW            1. 
@204  POCCU2           2. 
@206  WEMOCG           2. 
@208  WEIND            2. 
@210  WEMIND           2. 
@213  MIGPLAC          1. 
@214  MIGSAME          1. 
@215  MIG_REG          1. 
@216  MIG_ST           2. 
@218  PLACDSCP         1. 
@219  GEDIV            1. 
@220  MIG_DIV          2. 
@222  MIG_MTR1         2. 
@224  MIG_MTR3         1. 
@225  MIG_MTR4         1. 
@226  NOEMP            1. 
@227  ERN_YN           1. 
@228  ERN_VAL          6. 
@234  ERN_SRCE         1. 
@235  ERN_OTR          1. 
@236  WAGEOTR          1. 
@242  WSAL_YN          1. 
@243  WSAL_VAL         6. 
@249  SEOTR            1. 
@255  SEMP_YN          1. 
@256  SEMP_VAL         6. 
@262  FRMOTR           1. 
@268  FRSE_YN          1. 
@269  FRSE_VAL         6. 
@275  UC_YN            1. 
@276  SUBUC            1. 
@277  STRKUC           1. 
@278  UC_VAL           5. 
@283  WC_YN            1. 
@284  WC_TYPE          1. 
@285  WC_VAL           5. 
@290  SS_YN            1. 
@291  SS_VAL           5. 
@296  SSI_YN           1. 
@301  PAW_YN           1. 
@302  PAW_TYP          1. 
@303  PAW_MON          2. 
@305  PAW_VAL          5. 
@310  VET_YN           1. 
@311  VET_TYP1         1. 
@312  VET_TYP2         1. 
@313  VET_TYP3         1. 
@314  VET_TYP4         1. 
@315  VET_TYP5         1. 
@316  VET_QVA          1. 
@317  VET_VAL          5. 
@322  SUR_YN           1. 
@323  SUR_SC1          2. 
@325  SUR_SC2          2. 
@327  SUR_VAL1         5. 
@332  SUR_VAL2         5. 
@337  SRVS_VAL         6. 
@343  DIS_HP           1. 
@344  DIS_CS           1. 
@345  DIS_YN           1. 
@346  DIS_SC1          2. 
@348  DIS_SC2          2. 
@350  DIS_VAL1         5. 
@355  DIS_VAL2         5. 
@360  DSAB_VAL         6. 
@366  RET_YN           1. 
@367  RET_SC1          1. 
@368  RET_SC2          1. 
@369  RET_VAL1         5. 
@374  RET_VAL2         5. 
@379  RTM_VAL          6. 
@385  INT_YN           1. 
@386  INT_VAL          5. 
@391  DIV_YN           1. 
@392  DIV_NON          1. 
@393  DIV_VAL          5. 
@398  RNT_YN           1. 
@399  RNT_VAL          5. 
@404  ED_YN            1. 
@405  OED_TYP1         1. 
@406  OED_TYP2         1. 
@407  OED_TYP3         1. 
@408  ED_VAL           5. 
@414  CSP_YN           1. 
@415  CSP_VAL          5. 
@420  ALM_YN           1. 
@421  ALM_VAL          5. 
@426  FIN_YN           1. 
@427  FIN_VAL          5. 
@432  OI_OFF           2. 
@434  OI_YN            1. 
@435  OI_VAL           5. 
@440  PTOTVAL          8. 
@448  PEARNVAL         8. 
@457  POTHVAL          8. 
@465  FL_665           1. 
@466  PTOT_R           2. 
@468  PERLIS           1. 
@469  MCARE            1. 
@470  MCAID            1. 
@471  CHAMP            1. 
@472  HI_YN            1. 
@473  HIOWN            1. 
@474  HIEMP            1. 
@475  HIPAID           1. 
@481  WRK_CK           1. 
@482  PENPLAN          1. 
@483  PENINCL          1. 
@484  COV_GH           1. 
@485  COV_HI           1. 
@486  CH_MC            1. 
@487  CH_HI            1. 
@489  APRRP            1. 
@490  APPARENT         1. 
@491  APAGE            1. 
@492  APMARITL         1. 
@493  APSPOUSE         1. 
@494  APSEX            1. 
@495  APVET            1. 
@496  APHGA            1. 
@500  APLFSR           1. 
@503  APHRS            1. 
@510  APWHYABS         1. 
@511  APPAYABS         1. 
@523  APCLSWKR         1. 
@526  APNLFLJ          1. 
@532  APUSLHRS         1. 
@533  APHRLYWK         1. 
@534  PRWERNAL         1. 
@535  PRHERNAL         1. 
@536  APUNMEM          1. 
@537  APUNCOV          1. 
@539  APENRLW          1. 
@540  APHSCOL          1. 
@541  APFTPT           1. 
@542  I_ERNYN          1. 
@543  I_ERNVAL         1. 
@544  I_WSYN           1. 
@545  I_WSVAL          1. 
@546  I_SEYN           1. 
@547  I_SEVAL          1. 
@548  I_FRMYN          1. 
@549  I_FRMVAL         1. 
@550  I_UCYN           1. 
@551  I_UCVAL          1. 
@552  I_WCYN           1. 
@553  I_WCTYP          1. 
@554  I_WCVAL          1. 
@555  I_SSYN           1. 
@556  I_SSVAL          1. 
@557  I_SSIYN          1. 
@558  I_SSIVAL         1. 
@559  I_PAWYN          1. 
@560  I_PAWTYP         1. 
@561  I_PAWVAL         1. 
@562  I_PAWMO          1. 
@563  I_VETYN          1. 
@564  I_VETTYP         1. 
@565  I_VETVAL         1. 
@566  I_VETQVA         1. 
@567  I_SURYN          1. 
@569  I_SURSC1         1. 
@570  I_SURSC2         1. 
@571  I_SURVL1         1. 
@572  I_SURVL2         1. 
@573  I_DISSC1         1. 
@574  I_DISSC2         1. 
@575  I_DISHP          1. 
@576  I_DISCS          1. 
@577  I_DISYN          1. 
@578  TOI_VAL          1. 
@579  I_DISVL1         1. 
@580  I_DISVL2         1. 
@581  I_RETYN          1. 
@582  I_RETSC1         1. 
@583  I_RETSC2         1. 
@584  I_RETVL1         1. 
@585  I_RETVL2         1. 
@586  I_INTYN          1. 
@587  I_INTVAL         1. 
@588  I_DIVYN          1. 
@589  I_DIVVAL         1. 
@590  I_RNTYN          1. 
@591  I_RNTVAL         1. 
@592  I_EDYN           1. 
@593  I_EDTYP1         1. 
@594  I_EDTYP2         1. 
@595  I_OEDVAL         1. 
@596  I_CSPYN          1. 
@597  I_CSPVAL         1. 
@598  I_ALMYN          1. 
@599  I_ALMVAL         1. 
@600  I_FINYN          1. 
@601  I_FINVAL         1. 
@602  I_OIVAL          1. 
@603  I_NWLOOK         1. 
@604  I_NWLKWK         1. 
@605  I_RSNNOT         1. 
@606  I_LOSEWK         1. 
@607  I_LKWEEK         1. 
@608  I_LKSTR          1. 
@609  I_PYRSN          1. 
@610  I_PHMEMP         1. 
@611  I_HRSWK          1. 
@612  I_HRCHK          1. 
@613  I_PTYN           1. 
@614  I_PTWKS          1. 
@615  I_PTRSN          1. 
@616  I_LJCW           1. 
@617  I_INDUS          1. 
@618  I_OCCUP          1. 
@619  I_WORKYN         1. 
@620  I_WTEMP          1. 
@621  I_WKSWK          1. 
@622  I_WKCHK          1. 
@623  I_ERNSRC         1. 
@624  I_NOEMP          1. 
@633  I_PENPLA         1. 
@634  I_PENINC         1. 
@635  I_MIG1           1. 
@636  I_MIG2           1. 
@637  TCERNVAL         1. 
@638  TCWSVAL          1. 
@639  TCSEVAL          1. 
@640  TCFFMVAL         1. 
@641  A_WERNTF         1. 
@642  A_HERNTF         1. 
@643  P_MVCARE         5. 
@648  P_MVCAID         5. 
@653  EMCONTRB         4. 
@657  FILESTAT         1. 
@658  DEP_STAT         2. 
@660  FED_TAX          5. 
@665  EIT_CRED         4. 
@669  STATETAX         5. 
@674  FICA             5. 
@679  FED_RET          5. 
@684  AGI              5. 
@689  CAP_GAIN         5. 
@694  CAP_LOSS         4. 
@698  TAX_INC          5. 
@703  MARG_TAX         2. 
@705  PEMLR            1. 
@706  PRUNTYPE         1. 
@707  PRWKSTAT         2. 
@709  PRPTREA          2. 
@711  PRDISC           1. 
@712  PRCOW1           1. 
@713  PRPERTYP         1. 
@714  PEABSRSN         2. 
@716  PEIO1COW         2. 
@718  PRNLFSCH         1. 
@719  PEHRUSLT         3. 
@722  PENATVTY         3. 
@725  PEMNTVTY         3. 
@728  PEFNTVTY         3. 
@731  PEINUSYR         2. 
@733  PRCITSHP         1. 
@734  PXNATVTY         2. 
@736  PXMNTVTY         2. 
@738  PXFNTVTY         2. 
@740  PXINUSYR         2. 
@742  PERRP            2. 
@744  MIG_CNT          3. 
@747  I_MIG3           1. 
@748  HI               1. 
@749  HITYP            1. 
@750  DEPHI            1. 
@751  HILIN1           2. 
@753  HILIN2           2. 
@755  PAID             1. 
@756  HIOUT            1. 
@757  PRIV             1. 
@758  PRITYP           1. 
@759  DEPRIV           1. 
@760  PILIN1           2. 
@762  PILIN2           2. 
@764  POUT             1. 
@765  OUT              1. 
@766  CARE             1. 
@767  CAID             1. 
@768  MON              2. 
@770  OTH              1. 
@771  OTYP_1           1. 
@772  OTYP_2           1. 
@773  OTYP_3           1. 
@774  OTYP_4           1. 
@775  OTYP_5           1. 
@776  OTHSTPER         1. 
@777  OTHSTYP1         2. 
@779  OTHSTYP2         2. 
@781  OTHSTYP3         2. 
@783  OTHSTYP4         2. 
@785  OTHSTYP5         2. 
@787  OTHSTYP6         2. 
@800  HEA              1. 
@801  I_HI             1. 
@802  I_DEPHI          1. 
@803  I_PAID           1. 
@804  I_HIOUT          1. 
@805  I_PRIV           1. 
@806  I_DEPRIV         1. 
@807  I_POUT           1. 
@808  I_OUT            1. 
@809  I_CARE           1. 
@810  I_CAID           1. 
@811  I_MON            1. 
@812  I_OTH            1. 
@813  I_OTYP           1. 
@814  I_OSTPER         1. 
@815  I_OSTYP          1. 
@818  I_HEA            1. 
@819  SSI_VAL          5. 
@824  WS_VAL           6. 
@830  SE_VAL           6. 
@836  IHSFLG           1. 
@837  TSURVAL1         1. 
@838  TSURVAL2         1. 
@839  TDISVAL1         1. 
@840  TDISVAL2         1. 
@841  TRETVAL1         1. 
@842  TRETVAL2         1. 
@843  TINT_VAL         1. 
@844  TDIV_VAL         1. 
@845  TRNT_VAL         1. 
@846  TED_VAL          1. 
@847  TCSP_VAL         1. 
@848  TALM_VAL         1. 
@849  TFIN_VAL         1. 
@850  NXTRES           2. 
@852  I_NXTRES         1. 
@853  FRM_VAL          6. 
@859  TRANYN           1. 
@860  TRANYNA          1. 
@861  CCAYN            1. 
@862  CCAYNA           1. 
@863  PAIDCCYN         1. 
@864  PAIDCYNA         1. 
@865  AHIPER           1. 
@866  IAHIPER          1. 
@867  AHITYP1          2. 
@869  AHITYP2          2. 
@871  AHITYP3          2. 
@873  AHITYP4          2. 
@875  AHITYP5          2. 
@877  AHITYP6          2. 
@879  IAHITYP          1. 
@880  PCHIP            1. 
@881  I_PCHIP          1. 
@882  RESNSS1          1. 
@883  RESNSS2          1. 
@884  RESNSSA          1. 
@885  RESNSSI1         1. 
@886  RESNSSI2         1. 
@887  RESNSSIA         1. 
@888  SSIKIDYN         1. 
@889  SSIKDYNA         1. 
@890  SSKIDYN          1. 
@891  SSKIDYNA         1. 
@892  JCYN             1. 
@893  JCYNA            1. 
@894  JRYN             1. 
@895  JRYNA            1. 
@896  JTYN             1. 
@897  JTYNA            1. 
@898  SCHOOLYN         1. 
@899  SCHOLYNA         1. 
@900  WICYN            1. 
@901  WICYNA           1. 
@902  COMSRVYN         1. 
@903  CMSRVYNA         1. 
@904  INDUSTRY         4. 
@908  OCCUP            4. 
@912  PERIDNUM       $21. 
;

*****PT Additional variables *****;

count = 1;

label count = "Population count";

%statecd( gestfips )
%ucounty( gestfips, geco )
%a_race( prdtrace )

/*****PT output;*****/

select ( statecd );
  when ( "11" ) output &out._was;
  when ( "24" ) output &out._was;
  when ( "51" ) output &out._was;
  when ( "54" ) output &out._was;
  otherwise
    /** Not DC, MD, VA, or WV **/;
end;

** Comparison file **;
if statecd = "11" then comp_city = 1;
else if ( statecd = "24" and geco = 510 ) or ( HG_MSAC = 0720 and INDCCODE = 1 ) then comp_city = 2; /** Baltimore **/
else if ( HG_MSAC = 1120 and INDCCODE = 1 ) then comp_city = 3; /** Boston **/
else if ( HG_MSAC = 1680 and INDCCODE = 1 ) then comp_city = 4; /** Cleveland **/
else if ( HG_MSAC = 1920 and INDCCODE = 1 ) then comp_city = 5; /** Dallas **/
else if ( HG_MSAC = 2160 and INDCCODE = 1 ) then comp_city = 6;  /** Detroit **/
else if ( HG_MSAC = 5080 and INDCCODE = 1 ) then comp_city = 7;  /** Milwaukee **/
else if ( HG_MSAC = 5560 and INDCCODE = 1 ) then comp_city = 8;  /** New Orleans **/
else if ( HG_MSAC = 5775 and INDCCODE = 1 ) then comp_city = 9;  /** Oakland **/
else if ( statecd = "42" and geco = 101 ) then comp_city = 10;  /** Philadelphia **/
else if ( statecd = "29" and geco = 510 ) or ( HG_MSAC = 7040 and INDCCODE = 1 ) then comp_city = 11;  /** St. Louis **/

label comp_city = 'Comparison city';
format comp_city comp_cit.;

if not( missing( comp_city ) ) then output &out._comp;

end;

drop rectype;


LABEL

	H_SEQ     = "Household sequence number"             
	HHPOS     = "Trailer portion of unique household"   
	HUNITS    = "Item 78 - How many units in the struct"
	H_FAMINC  = "Family income"                         
	H_RESPNM  = "Line number of household"              
	H_YEAR    = "Year of survey"                        
	H_HHTYPE  = "Type of household"                     
	H_NUMPER  = "Number of persons in household"        
	HNUMFAM   = "Number of families in household"       
	H_TYPE    = "Household type"                        
	H_MONTH   = "Month of survey"                       
	H_MIS     = "Month in sample"                       
	H_HHNUM   = "Household number"                      
	H_LIVQRT  = "Item 4 - Type of living quarters (reco"
	H_TYPEBC  = "Item 15 - Type B/C"                    
	H_TENURE  = "Tenure"                                
	H_TELHHD  = "Telephone in household"                
	H_TELAVL  = "Telephone available"                   
	H_TELINT  = "Telephone interview acceptable"        
	HG_REG    = "Region"                                
	HG_ST60   = "1960 Census State Code"                
	GESTFIPS  = "State FIPS code"                       
	HG_MSAC   = "MSA or PMSA FIPS code"                 
	GECO      = "FIPS County Code"                      
	HG_CMSA   = "Specific CMSA code (See Appendix E)"   
	HMSSZ     = "CMSA/MSA size"                         
	HPMSASZ   = "MSA/PMSA size"                         
	HMSA_R    = "Modified metropolitan statistical"     
	HCCC_R    = "Central city metropolitan"             
	HUNDER15  = "Recode"                                
	HCMCARE   = "Item 80 - During 20.. how many of the" 
	HCMCENO   = "Item 80 - Number of children in"       
	HCHI      = "Item 81 - during 20.. how"             
	HCHINO    = "Item 81 - Number of"                   
	HCHINRH   = "Item 81a - During 20.. how many of the"
	HCHINNO   = "Item 81a - During 20.."                
	HH5TO18   = "Recode"                                
	HHOTLUN   = "Item 83 - During 20.. how many of the" 
	HHOTNO    = "Item 83 - Number of children in househ"
	HFLUNCH   = "Item 86 - During 20.. how many of the" 
	HFLUNNO   = "Item 86 - Number receiving free lunch" 
	HPUBLIC   = "Item 88 - Is this a public housing"    
	HLORENT   = "Item 89 - Are you paying lower rent"   
	HFOODSP   = "Item 90 - Did anyone in this household"
	HFOODNO   = "Item 91 - Number of children covered"  
	HFOODMO   = "Item 92 - Number months covered by"    
	HFDVAL    = "Item 93 - What was the value of all"   
	HENGAST   = "Item 94 - Since october 1, 20.., has t"
	HENGVAL   = "Item 95 - Altogether, how much energy" 
	HINC_WS   = "Recode - Wage and Salary"              
	HWSVAL    = "Recode - HHLD income - Wages and Salar"
	HSEVAL    = "Recode - HHLD income - self employment"
	HINC_FR   = "Recode - Farm self-employment"         
	HFRVAL    = "Recode - HHLD income - Farm income"    
	HINC_UC   = "Recode - Unemployment compensation"    
	HUCVAL    = "Recode - HHLD income - Unemployment"   
	HINC_WC   = "Recode - Worker's compensation"        
	HWCVAL    = "Recode - HHLD income - Worker's"       
	HSS_YN    = "Recode - Social Security payments"     
	HSSVAL    = "Recode - HHLD income - Social Security"
	HSSI_YN   = "Recode - Supplemental Security benefit"
	HSSIVAL   = "Recode - HHLD income - Supplemental"   
	HPAW_YN   = "Recode - Public Assistance"            
	HPAWVAL   = "Recode - HHLD income - Public"         
	HVET_YN   = "Recode - Veterans' Payments"           
	HVETVAL   = "Recode - HHLD income - Veteran Payment"
	HSUR_YN   = "Recode - Survivor Benefits"            
	HSURVAL   = "Recode - HHLD income - survivor income"
	HDIS_YN   = "Recode - Disability benefits"          
	HDISVAL   = "Recode - HHLD income - Disability inco"
	HRETVAL   = "Recode - HHLD income - Retirement inco"
	HINT_YN   = "Recode -interest payments"             
	HINTVAL   = "Recode - HHLD income - Interest income"
	HDIV_YN   = "Recode - Dividend payments"            
	HDIVVAL   = "Recode - HHLD income - dividend income"
	HRNT_YN   = "Recode - Rental payments"              
	HRNTVAL   = "Recode - HHLD income - Rent income"    
	HED_YN    = "Recode - Educational assistance"       
	HEDVAL    = "Recode - HHLD income - Education incom"
	HCSP_YN   = "Recode - Child support payments"       
	HCSPVAL   = "Recode - HHLD income - child support"  
	HALM_YN   = "Recode - Alimony payments"             
	HALMVAL   = "Recode - HHLD income - alimony"        
	HFIN_YN   = "Recode - Financial assistance payments"
	HFINVAL   = "Recode - HHLD income - Financial"      
	HOI_YN    = "Other income payments"                 
	HOIVAL    = "Recode - HHLD income - Other income"   
	HTOTVAL   = "Recode - Total household income"       
	HEARNVAL  = "Recode - Total household earnings"     
	HOTHVAL   = "All other types of income except HEARN"
	HMCARE    = "Anyone in HHLD covered by Medicare"    
	HMCAID    = "Anyone in HHLD covered by Medicaid"    
	HCHAMP    = "CHAMPUS, VA, or military health care"  
	HHI_YN    = "Anyone in HHLD have health insurance"  
	HHSTATUS  = "Recode - Household status"             
	HUNDER18  = "Recode - Number of persons in HHLD"    
	HTOP5PCT  = "Recode - Household income percentiles" 
	HPCTCUT   = "Recode - HHLD income percentiles -"    
	INDCCODE  = "Filler"                                
	HSUP_WGT  = "Final weight (2 implied decimal places"
	HPLIVQRT  = "Filler"                                
	HPTELHHD  = "Filler"                                
	I_HHOTLU  = "Filler"                                
	PROP_TAX  = "Annual property taxes"                 
	HOUSRET   = "Return to home equity"                 
	HRHTYPE   = "Household type"                        
	H_IDNUM   = "Household identification number"       
	I_HUNITS  = "Allocation flag for HUNITS"            
	HRTAYN    = "AT ANY TIME DURING 20.. DID"           
	HRNUMTA   = "NUMBER OF PEOPLE IN THIS HOUSEHOLD"    
	HRCCAYN   = "AT ANY TIME DURING 20.. DID"           
	HRNUMCC   = "NUMBER OF PEOPLE IN THIS HOUSEHOLD"    
	HRPAIDCC  = "DID (YOU/ANYONE IN THIS HOUSEHOLD) PAY"
	HRCMSRYN  = "AT ANY TIME LAST YEAR, DID (YOU/ANYONE"
	HRJCYN    = "AT ANY TIME LAST YEAR, DID (YOU/ANYONE"
	HRJRYN    = "AT ANY TIME LAST YEAR, DID (YOU/ANYONE"
	HRJTYN    = "AT ANY TIME LAST YEAR, DID (YOU/ANYONE"
	HRNUMCSV  = "NUMBER OF PEOPLE IN THE HOUSEHOLD"     
	HRNUMJC   = "NUMBER OF PEOPLE IN THE HOUSEHOLD"     
	HRNUMJR   = "NUMBER OF PEOPLE IN THE HOUSEHOLD WHO" 
	HRNUMJT   = "NUMBER OF PEOPLE IN THE HOUSEHOLD WHO" 
	HRNUMSC   = "NUMBER OF PEOPLE IN THE HOUSEHOLD WHO" 
	HRNUMWIC  = "NUMBER OF PEOPLE IN THE HOUSEHOLD"     
	HRSCHLYN  = "AT ANY TIME LAST YEAR, DID (YOU/ANYONE"
	HRWICYN   = "AT ANY TIME LAST YEAR, (WERE YOU/WAS"  
	FRECORD   = "FILLER"                                
	FH_SEQ    = "Household sequence number"             
	FFPOS     = "Unique family identifier"              
	FKIND     = "Kind of family"                        
	FTYPE     = "Family type"                           
	FPERSONS  = "Number of persons in family"           
	FHEADIDX  = "Index to person record of family head" 
	FWIFEIDX  = "Index to person record of family wife" 
	FHUSBIDX  = "Index to person record of family"      
	FSPOUIDX  = "Index to person record of family spous"
	FLASTIDX  = "Index to person record of last"        
	FMLASIDX  = "Index to person record of last"        
	FOWNU6    = "Own children in family under 6"        
	FOWNU18   = "Number of own never married children"  
	FRELU6    = "Related persons in family under 6"     
	FRELU18   = "Related persons in family under 18"    
	FPCTCUT   = "Income percentiles"                    
	FPOVCUT   = "Low income cutoff dollar amount"       
	FAMLIS    = "Ratio of family income to low-income"  
	POVLL     = "Ratio of family income to low-income"  
	FRSPOV    = "Ratio of related subfamily income to"  
	FRSPPCT   = "Low income cutoff dollar amount of"    
	FINC_WS   = "Wage and salary"                       
	FWSVAL    = "Family income - wages and salaries"    
	FINC_SE   = "Own business self-employment"          
	FSEVAL    = "Family income - self employment income"
	FINC_FR   = "Farm self-employment"                  
	FFRVAL    = "Family income - Farm income"           
	FINC_UC   = "Unemployment compensation"             
	FUCVAL    = "Family income - Unemployment"          
	FINC_WC   = "Worker's compensation"                 
	FWCVAL    = "Family income - Worker's compensation" 
	FINC_SS   = "Social Security Benefits"              
	FSSVAL    = "Family income - Social Security"       
	FINC_SSI  = "Supplemental Security Benefits"        
	FSSIVAL   = "Family income - Supplemental Security" 
	FINC_PAW  = "Public assistance or welfare benefits" 
	FPAWVAL   = "Family income - public assistance inco"
	FINC_VET  = "Veterans' Benefits"                    
	FVETVAL   = "Family income - veteran payments"      
	FINC_SUR  = "Survivor's payments"                   
	FSURVAL   = "Family income - Survivor income"       
	FINC_DIS  = "Disability payments"                   
	FDISVAL   = "Family income - Disability income"     
	FINC_RET  = "Retirement payments"                   
	FRETVAL   = "Family income - Retirement income"     
	FINC_INT  = "Interest payments"                     
	FINTVAL   = "Family income - Interest income"       
	FINC_DIV  = "Dividend payments"                     
	FDIVVAL   = "Family income - Dividend income"       
	FINC_RNT  = "Rental payments"                       
	FRNTVAL   = "Family income - Rental income"         
	FINC_ED   = "Education benefits"                    
	FEDVAL    = "Family income - Education income"      
	FINC_CSP  = "Child support payments"                
	FCSPVAL   = "Family income - Child support"         
	FINC_ALM  = "Alimony payments"                      
	FALMVAL   = "Family income - Alimony"               
	FINC_FIN  = "Financial assistance payments"         
	FFINVAL   = "Family income - Financial assistance"  
	FINC_OI   = "Other income payments"                 
	FOIVAL    = "Family income - Other income"          
	FTOTVAL   = "Total family income"                   
	FEARNVAL  = "Total family earnings"                 
	FOTHVAL   = "Total other family income"             
	FTOT_R    = "Total family income recode"            
	FSPANISH  = "Reference person or spouse of Spanish" 
	FSUP_WGT  = "Householder or reference person weight"
	FFPOSOLD  = "Trailer portion of unique household ID"
	F_MV_FS   = "Family market value of food stamps"    
	F_MV_SL   = "Family market value of school lunch"   
	FFNGCARE  = "Family fungible value of medicare"     
	FFNGCAID  = "Family fungible value of medicaid"     
	FHOUSSUB  = "Family market value of housing subsidy"
	FFOODREQ  = "Based on USDA figures"                 
	FHOUSREQ  = "Used to compute fungible value of"     
	PRECORD   = "Filler"                                
	PH_SEQ    = "Household seq number"                  
	PPPOS     = "Trailer portion of unique household ID"
	A_LINENO  = "Item 18a - Line number"                
	A_PARENT  = "Item 18c - Parent's line number"       
	A_EXPRRP  = "Expanded relationship code"            
	A_AGE     = "Item 18d - Age"                        
	A_MARITL  = "Item 18e - Marital status"             
	A_SPOUSE  = "Item 18f - Spouse's line number"       
	A_SEX     = "Item 18g - Sex"                        
	A_VET     = "Veteran status"                        
	A_HGA     = "Item 18h - Educational attainment"     
	PRDTRACE  = "Race"                                  
	P_STAT    = "Status of person identifier"           
	PEHSPNON  = "Are you Spanish, Hispanic, or Latino?" 
	PRDTHSP   = "Detailed Hispanic recode"              
	A_FAMNUM  = "Family number"                         
	A_FAMTYP  = "Family type"                           
	A_FAMREL  = "Family relationship"                   
	A_PFREL   = "Primary family relationship"           
	HHDREL    = "Detailed household summary"            
	FAMREL    = "Family relationship"                   
	HHDFMX    = "Detailed household and family status"  
	PARENT    = "Family members under 18 (excludes"     
	AGE1      = "Age recode - Persons 15+ years"        
	PHF_SEQ   = "Pointer to the sequence number of own" 
	PF_SEQ    = "Pointer to the sequence number of fami"
	PRNT_PTR  = "Sequence number of parent in hhld"     
	A_FNLWGT  = "Final weight (2 implied decimal places"
	A_ERNLWT  = "Earnings/not in labor force weight"    
	MARSUPWT  = "Supplement final weight (2 implied"    
	A_HRS1    = "How many hrs did ... work last week"   
	A_USLFT   = "Does ... usually work 35 hrs or more a"
	A_WHYABS  = "Why was ... absent from work last week"
	A_PAYABS  = "Is ... receiving wages or salary for"  
	PEIOIND   = "Industry"                              
	PEIOOCC   = "Occupation"                            
	A_WKSLK   = "Duration of unemployment"              
	A_WHENLJ  = "When did ... last work?"               
	A_CLSWKR  = "Class of worker"                       
	PPPOSOLD  = "Trailer portion of unique household id"
	A_NLFLJ   = "When did ... last work for pay at a"   
	A_WANTJB  = "Does ... want a regular job now,"      
	A_USLHRS  = "How many hrs per week does ..."        
	A_HRLYWK  = "Is ... paid by the hour on this job?"  
	A_HRSPAY  = "How much does ... earn per hour?"      
	A_GRSWK   = "How much does ... usually earn per"    
	A_UNMEM   = "On this job, is ... a member of a"     
	A_UNCOV   = "On this job, is ... covered by a union"
	A_ENRLW   = "Last week was ... attending or"        
	A_FTPT    = "Is ... enrolled in school as a full-"  
	A_LFSR    = "Labor force status recode"             
	A_UNTYPE  = "Reason for unemployment"               
	A_WKSTAT  = "Full/part-time status"                 
	A_EXPLF   = "Experienced labor force employment"    
	A_WKSCH   = "Labor force by time worked or lost"    
	A_CIVLF   = "Civilian labor force"                  
	A_FTLF    = "Full/time labor force"                 
	A_MJIND   = "Major industry code"                   
	A_DTIND   = "Detailed industry recode"              
	MJOCC     = "Major occupation recode"               
	A_DTOCC   = "Detailed occupation recode"            
	PRERELG   = "Earnings eligibility flag"             
	A_RCOW    = "Class of worker recode"                
	WORKYN    = "Item 29a - Did ... work at a job or"   
	WTEMP     = "Item 29b - Did ... do any temporary,"  
	NWLOOK    = "Item 30 - Even though ... did not work"
	NWLKWK    = "Item 31 - How may different weeks"     
	RSNNOTW   = "Item 32 - What was the main"           
	WKSWORK   = "Item 33 - During 20.. in how many week"
	WKCHECK   = "Item 34 - Interviewer check item -"    
	LOSEWKS   = "Item 35 Did ... lose any full weeks of"
	LKNONE    = "Item 36 -  You said... worked about"   
	LKWEEKS   = "Item 36 - Weeks was ... looking for"   
	LKSTRCH   = "Item 37 - Were the (entry in item 36)" 
	PYRSN     = "Item 38 - What was the main reason ..."
	PHMEMPRS  = "Item 39 - For how many employers did ."
	HRSWK     = "Item 40 - In the weeks that ... worked"
	HRCHECK   = "Item 41 - Interviewer check item -"    
	PTYN      = "Item 42 - Did ... work less than 35 ho"
	PTWEEKS   = "Item 43 - How many weeks did ... work" 
	PTRSN     = "Item 44 - What was the main reason ..."
	LJCW      = "Item 46e - Class of worker"            
	WEXP      = "Recode -  Worker/nonworker recode -"   
	WEWKRS    = "Recode -  Worker/nonworker recode -"   
	WELKNW    = "Recode -  Worker/nonworker recode -"   
	WEUEMP    = "Recode - Worker/nonworker recode - Par"
	EARNER    = "Recode - Earner status"                
	CLWK      = "Recode - Longest job class of worker"  
	WECLW     = "Recode - Longest job class of worker"  
	POCCU2    = "Recode - Occupation of longest job by" 
	WEMOCG    = "Recode - Occupation of longest job by" 
	WEIND     = "Recode - Industry of longest job by"   
	WEMIND    = "Recode - Industry of longest job by"   
	MIGPLAC   = "Item 55a - Metropolitan statistical ar"
	MIGSAME   = "Was ... living in this house (apt.) 1" 
	MIG_REG   = "Recode - Region of previous residence" 
	MIG_ST    = "Recode - FIPS State code of previous"  
	PLACDSCP  = "Recode - MSA status of residence 1 yea"
	GEDIV     = "Recode - Census division of current"   
	MIG_DIV   = "Recode - Census division of previous"  
	NOEMP     = "Item 47 - Counting all locations where"
	ERN_YN    = "Earnings from longest job recode"      
	ERN_VAL   = "Item 48a &  b - How much did ... earn "
	ERN_SRCE  = "Earnings  recode"                      
	ERN_OTR   = "Item 49a - Did ... earn money from oth"
	WAGEOTR   = "Item 49b -Other wage and salary earnin"
	WSAL_YN   = "Recode"                                
	WSAL_VAL  = "Recode - Total wage and salary earning"
	SEOTR     = "Item 49b - Other work - Own business"  
	SEMP_YN   = "Recode - Any own business self-employm"
	SEMP_VAL  = "ERN-YN = 1 or SEOTR = 1"               
	FRMOTR    = "Item 49b- Farm self-employment"        
	FRSE_YN   = "Any own farm self-employment in ERN-YN"
	FRSE_VAL  = "Recode - Total amount of farm self-"   
	UC_YN     = "Item 52a - At any time during 20.."    
	SUBUC     = "Item 52a - At any time during 20.."    
	STRKUC    = "Item 52a -At any time during 20.."     
	UC_VAL    = "Item 52b - How much did ... receive in"
	WC_YN     = "Item 53a - During 20.. did ... receive"
	WC_TYPE   = "Item 53b"                              
	WC_VAL    = "Item 53c - How much compensation did ."
	SS_YN     = "Item 56b - Did ... receive s.s.?"      
	SS_VAL    = "Item 56c - How much did ... receive in"
	SSI_YN    = "Item 57b - Did ... receiveSSI?"        
	PAW_YN    = "Item 59b - Did ... receive public"     
	PAW_TYP   = "Item 59c - Did ... receive tanf/AFDC o"
	PAW_MON   = "Item 59d - In how many months of 20.." 
	PAW_VAL   = "Item 59e - How much did ... receive in"
	VET_YN    = "Item 60b - Did ... receive veterans'"  
	VET_TYP1  = "Item 60c - Disability compensation"    
	VET_TYP2  = "Item 60c - Survivor benefits"          
	VET_TYP3  = "Item 60c - Veterans' pension"          
	VET_TYP4  = "Item 60c - Education assistance"       
	VET_TYP5  = "Item 60c - Other veterans' payments"   
	VET_QVA   = "Item 60d - Is ... required to fill out"
	VET_VAL   = "Item 60e - How much did ... receive fr"
	SUR_YN    = "Item 61b - Other than social security "
	SUR_SC1   = "Item 61c - What was the source of this"
	SUR_SC2   = "Item 61d - Any other pension or"       
	SUR_VAL1  = "Item 61e - how much did ... receive fr"
	SUR_VAL2  = "Item 61g - How much did ... receive"   
	SRVS_VAL  = "Recode total amount of survivor's inco"
	DIS_HP    = "Item 62b -  Does ... have a health"    
	DIS_CS    = "Item 62c - Did ... retire or leave a j"
	DIS_YN    = "Item 64b - Other than social security "
	DIS_SC1   = "Item 64c - What was the source of inco"
	DIS_SC2   = "Item 64c - Any other disability income"
	DIS_VAL1  = "Item 64e - How much did ... receive fr"
	DIS_VAL2  = "Item 64g - How much did ... receive fr"
	DSAB_VAL  = "Recode total amount of disability inco"
	RET_YN    = "Item 65b - Other than social security "
	RET_SC1   = "Item 65c - What was the source of"     
	RET_SC2   = "Item 65c - Any other retirement income"
	RET_VAL1  = "Item 65e - How much did ... receive fr"
	RET_VAL2  = "Item 65g - How much did ... receive fr"
	RTM_VAL   = "Recode total amount of retirement inco"
	INT_YN    = "Item 66b - Did ... receive interest?"  
	INT_VAL   = "Item 66c - How much did ... receive in"
	DIV_YN    = "Item 67b - Did ... receive dividends?" 
	DIV_NON   = "Item 67c - No dividends received"      
	DIV_VAL   = "Item 67c - How much did ... receive in"
	RNT_YN    = "Item 68b - Did ... received rent?"     
	RNT_VAL   = "Item 68c - How much did ... receive in"
	ED_YN     = "Item 69c - Did ... receive educational"
	OED_TYP1  = "Item 69d(1) &  (2) - Source of educati"
	OED_TYP2  = "Item 69d(3) - Source of educational"   
	OED_TYP3  = "Item 69d(4)- Source of educational"    
	ED_VAL    = "Item 69h - Total amount of educational"
	CSP_YN    = "Item 70b - Did ... receive child suppo"
	CSP_VAL   = "Item 70c - How much did ... receive in"
	ALM_YN    = "Item 71b - Did ... receive alimony"    
	ALM_VAL   = "Item 71c - How much did ... receive in"
	FIN_YN    = "Item 72b - Did ... receive financial"  
	FIN_VAL   = "Item 72c - How much did ... receive in"
	OI_OFF    = "Item 73c"                              
	OI_YN     = "Item 73b - Did ... receive other incom"
	OI_VAL    = "Item 73d - How much did ... receive in"
	PTOTVAL   = "Recode - Total persons income"         
	PEARNVAL  = "Recode - Total persons earnings"       
	POTHVAL   = "Recode - Total other persons income"   
	PTOT_R    = "Recode - Total person income recode"   
	PERLIS    = "Recode - Low-income level of persons"  
	MCARE     = "Item 74b - Was ... covered by medicare"
	MCAID     = "Item 74d - Was ... covered by medicaid"
	CHAMP     = "Item 74f - Was ... covered by CHAMPUS,"
	HI_YN     = "Item 75b - Was ... covered by private" 
	HIOWN     = "Item 75c - Was this health insurance"  
	HIEMP     = "Item 75d - Was this health insurance p"
	HIPAID    = "Item 75e - Did ...'s employer or union"
	WRK_CK    = "Item 76 - Interviewer check item worke"
	PENPLAN   = "Item 76a - Other than social security "
	PENINCL   = "Item 76b - Was ... included in that pl"
	COV_GH    = "Recode - Includes dependents included "
	COV_HI    = "Recode - Includes dependents covered b"
	CH_MC     = "A-AGE less than 15"                    
	CH_HI     = "A-AGE less than 15"                    
	APRRP     = "Relationship to reference person"      
	APPARENT  = "Parent's line number allocation flag"  
	APAGE     = "Age allocation flag"                   
	APMARITL  = "Marital status allocation flag"        
	APSPOUSE  = "Spouse's line number allocation flag"  
	APSEX     = "Sex allocation flag"                   
	APVET     = "Veteran status allocation flag"        
	APHGA     = "Highest grade attended allocation flag"
	APLFSR    = "Labor force status recode allocation"  
	APHRS     = "Filler"                                
	APWHYABS  = "Filler"                                
	APCLSWKR  = "Filler"                                
	APNLFLJ   = "Filler"                                
	APUSLHRS  = "Filler"                                
	APENRLW   = "Filler"                                
	I_SURSC1  = "Filler"                                
	TOI_VAL   = "Other income"                          
	I_PENPLA  = "Filler"                                
	I_MIG1    = "MIGSAME imputation flag."              
	I_MIG2    = "MIG-ST imputation flag."               
	TCERNVAL  = "Earnings from employer or self-"       
	TCWSVAL   = "Wage and salary income topcoded flag"  
	TCSEVAL   = "Nonfarm self employment income"        
	TCFFMVAL  = "Farm self employment income topcoded"  
	A_WERNTF  = "Current earnings - Weekly pay"         
	A_HERNTF  = "Current earnings - Hourly pay"         
	P_MVCARE  = "Person market value of medicare"       
	P_MVCAID  = "Person market value of medicaid"       
	EMCONTRB  = "Employer contribution for health"      
	FILESTAT  = "Tax Filer status"                      
	DEP_STAT  = "Dependency status pointer"             
	FED_TAX   = "Federal income tax liability"          
	EIT_CRED  = "Earn income tax credit"                
	STATETAX  = "State income tax liability"            
	FICA      = "Social security retirement payroll"    
	FED_RET   = "Federal retirement payroll deduction"  
	AGI       = "Adjusted gross income"                 
	CAP_GAIN  = "Amount of capital gains"               
	CAP_LOSS  = "Amount of capital losses"              
	TAX_INC   = "Taxable income amount"                 
	MARG_TAX  = "Federal Income Marginal tax rate"      
	PEMLR     = "Major labor force recode"              
	PRUNTYPE  = "Reason for unemployment"               
	PRWKSTAT  = "Full/part-time work status"            
	PRPTREA   = "Detailed reason for part-time"         
	PRDISC    = "Discouraged worker recode"             
	PRCOW1    = "Class of worker recode-job 1"          
	PRPERTYP  = "Type of person record recode"          
	PEABSRSN  = "What was the main reason...was absent" 
	PEIO1COW  = "Individual class of worker on first jo"
	PRNLFSCH  = "NLF activity in school or not in schoo"
	PEHRUSLT  = "Hours usually worked last week"        
	PENATVTY  = "In what country were you born?"        
	PEMNTVTY  = "In what country was your mother born?" 
	PEFNTVTY  = "In what country was your father born?" 
	PEINUSYR  = "When did you come to the U.S. to stay?"
	PXNATVTY  = "Allocation flag for PENATVTY"          
	PXMNTVTY  = "Allocation flag for PEMNTVTY"          
	PXFNTVTY  = "Allocation flag for PEFNTVTY"          
	PXINUSYR  = "Allocation flag for PEINUSYR"          
	PERRP     = "Expanded relationship categories"      
	MIG_CNT   = "Country of previous residence."        
	I_MIG3    = "Imputation flag."                      
	HI        = "Covered by a health plan provided"     
	HITYP     = "Health insurance plan type."           
	DEPHI     = "Covered by a health plan through"      
	HILIN1    = "Line number of policyholder of health" 
	HILIN2    = "Line number of policyholder of health" 
	PAID      = "Did ...'s former or current employer o"
	HIOUT     = "Employer or union plan covered someone"
	PRIV      = "Covered by a plan that they purchased" 
	PRITYP    = "Private health insurance plan type."   
	DEPRIV    = "Covered by private plan not related to"
	PILIN1    = "Line number of first policyholder of"  
	PILIN2    = "Line number of second policyholder of" 
	POUT      = "Private plan covered someone outside t"
	OUT       = "Covered by the health plan of someone" 
	CARE      = "Covered by medicare, the health"       
	CAID      = "Covered by (medicaid/local name), the" 
	MON       = "Number of months covered by medicaid ("
	OTH       = "Covered by any other kind of health"   
	OTYP_1    = "Covered by CHAMPUS."                   
	OTYP_2    = "Covered by CHAMPVA."                   
	OTYP_3    = "Covered by VA or military health care."
	OTYP_4    = "Covered by Indian health."             
	OTYP_5    = "Covered by other."                     
	OTHSTPER  = "Covered by other type of health"       
	OTHSTYP1  = "Other type of health insurance include"
	HEA       = "Would you say ...'s health in general" 
	I_HI      = "Imputation item: HI"                   
	I_DEPHI   = "Imputation item: DEPHI"                
	I_PAID    = "Imputation item: PAID"                 
	I_HIOUT   = "Imputation item: HIOUT"                
	I_PRIV    = "Imputation item: PRIV"                 
	I_DEPRIV  = "Imputation item: DEPRIV"               
	I_POUT    = "Imputation item: POUT"                 
	I_OUT     = "Imputation item: OUT"                  
	I_CARE    = "Imputation item: CARE"                 
	I_CAID    = "Imputation item: CAID"                 
	I_MON     = "Imputation item: MON"                  
	I_OTH     = "Imputation item: oth"                  
	I_OTYP    = "Imputation items: OTYP-1, ..., OTYP-5."
	I_OSTPER  = "Imputation item: OTHSTPER"             
	I_OSTYP   = "Imputation items: OTHSTYP1, ...,"      
	I_HEA     = "Imputation item: HEA"                  
	SSI_VAL   = "Item 57c - How much did ... receive in"
	WS_VAL    = "Item 49b - Other wage and salary earni"
	SE_VAL    = "Item 49b - Other work - Own business"  
	IHSFLG    = "Recode:  Covered by Indian Health"     
	TSURVAL1  = "Survivors income, source 1,"           
	TSURVAL2  = "Survivors income, source 2,"           
	TDISVAL1  = "Disability income, source 1,"          
	TDISVAL2  = "Disability income, source 2,"          
	TRETVAL1  = "Retirement income, source 1,"          
	TRETVAL2  = "Retirement income, source 2,"          
	TINT_VAL  = "Interest income"                       
	TDIV_VAL  = "Dividend income"                       
	TRNT_VAL  = "Rent income"                           
	TED_VAL   = "Education assistance"                  
	TCSP_VAL  = "Child support payments"                
	TALM_VAL  = "Alimony payments"                      
	TFIN_VAL  = "Financial assistance"                  
	NXTRES    = "What was ... main reason for moving?"  
	I_NXTRES  = "Imputation flag"                       
	FRM_VAL   = "Item 49b - Farm self-employment earnin"
	TRANYN    = "Received transportation assistance ?"  
	TRANYNA   = "TRANSPORTATION ASSISTANCE ALLOCATION"  
	CCAYN     = "Receive child care services ?"         
	CCAYNA    = "Child care assistance allocation flag."
	PAIDCCYN  = "Which children needed care while their"
	PAIDCYNA  = "PAIDCCYN allocation flag."             
	AHIPER    = "Does person with no coverage reported" 
	IAHIPER   = "AHIPER allocation flag."               
	AHITYP6   = "What type of insurance (was/were)"     
	IAHITYP   = "AHITYP allocation flag."               
	PCHIP     = "Was child under age 19 and with no"    
	I_PCHIP   = "PCHIP allocation flag."                
	RESNSS1   = "What were the reasons (you/name)"      
	RESNSS2   = "What were the reasons (you/name)"      
	RESNSSA   = "RESNSS1-2 allocation flag"             
	RESNSSI1  = "What were the reasons (you/name)"      
	RESNSSI2  = "What were the reasons (you/name)"      
	RESNSSIA  = "RESNSSI1-2 allocation flag"            
	SSIKIDYN  = "Which children under age 18 were"      
	SSIKDYNA  = "SSIKIDYN allocation flag"              
	SSKIDYN   = "Which children under age 19 were"      
	SSKIDYNA  = "SSKIDYN allocation flag"               
	JCYN      = "Who attended a job search program or"  
	JCYNA     = "JCYN allocation flag"                  
	JRYN      = "Who attended job readiness training to"
	JRYNA     = "JRYN allocation flag"                  
	JTYN      = "Who attended a training program to"    
	JTYNA     = "JTYN allocation flag"                  
	SCHOOLYN  = "Who attended GED classes or received"  
	SCHOLYNA  = "SCHOOLYN allocation flag"              
	WICYN     = "Who received WIC?"                     
	WICYNA    = "WICYN allocation flag"                 
	COMSRVYN  = "Who participated in work programs such"
	CMSRVYNA  = "COMSRVYN allocation flag"              
	INDUSTRY  = "Industry of longest job"               
	OCCUP     = "Occupation of longest job"             
	PERIDNUM  = "21 digit Unique Person identifier"     
;

/***PT***proc print data=library.cpsmar03 (obs=6);*****/


FORMAT
	HRECORD    HRECORD.  
	HUNITS     HUNITS.   
	H_FAMINC   H_FAMINC. 
	H_RESPNM   H_RESPNM. 
	H_HHTYPE   H_HHTYPE. 
	H_NUMPER   H_NUMPER. 
	HNUMFAM    HNUMFAM.  
	H_TYPE     H_TYPE.   
	H_MONTH    H_MONTH.  
	H_HHNUM    H_HHNUM.  
	H_LIVQRT   H_LIVQRT. 
	H_TYPEBC   H_TYPEBC. 
	H_TENURE   H_TENURE. 
	H_TELHHD   H_TELHHD. 
	H_TELAVL   H_TELAVL. 
	H_TELINT   H_TELINT. 
	HG_REG     HG_REG.   
	HG_ST60    HG_ST60L. 
	HG_MSAC    HG_MSAC.  
	GECO       GECO.     
	HG_CMSA    HG_CMSA.  
	HMSSZ      HMSSZ.    
	HPMSASZ    HPMSASZ.  
	HMSA_R     HMSA_R.   
	HCCC_R     HCCC_R.   
	HUNDER15   HUNDER1E. 
	HCMCARE    HCMCARE.  
	HCMCENO    HCMCENO.  
	HCHI       HCHI.     
	HCHINO     HCHINO.   
	HCHINRH    HCHINRH.  
	HCHINNO    HCHINNO.  
	HH5TO18    HH5TO18L. 
	HHOTLUN    HHOTLUN.  
	HHOTNO     HHOTNO.   
	HFLUNCH    HFLUNCH.  
	HFLUNNO    HFLUNNO.  
	HPUBLIC    HPUBLIC.  
	HLORENT    HLORENT.  
	HFOODSP    HFOODSP.  
	HFOODNO    HFOODNO.  
	HFOODMO    HFOODMO.  
	HFDVAL     HFDVAL.   
	HENGAST    HENGAST.  
	HENGVAL    HENGVAL.  
	HINC_WS    HINC_WS.  
	HWSVAL     HWSVAL.   
	HINC_SE    HINC_SE.  
	HSEVAL     HSEVAL.   
	HINC_FR    HINC_FR.  
	HFRVAL     HFRVAL.   
	HINC_UC    HINC_UC.  
	HUCVAL     HUCVAL.   
	HINC_WC    HINC_WC.  
	HWCVAL     HWCVAL.   
	HSS_YN     HSS_YN.   
	HSSVAL     HSSVAL.   
	HSSI_YN    HSSI_YN.  
	HSSIVAL    HSSIVAL.  
	HPAW_YN    HPAW_YN.  
	HPAWVAL    HPAWVAL.  
	HVET_YN    HVET_YN.  
	HVETVAL    HVETVAL.  
	HSUR_YN    HSUR_YN.  
	HSURVAL    HSURVAL.  
	HDIS_YN    HDIS_YN.  
	HDISVAL    HDISVAL.  
	HRET_YN    HRET_YN.  
	HRETVAL    HRETVAL.  
	HINT_YN    HINT_YN.  
	HINTVAL    HINTVAL.  
	HDIV_YN    HDIV_YN.  
	HDIVVAL    HDIVVAL.  
	HRNT_YN    HRNT_YN.  
	HRNTVAL    HRNTVAL.  
	HED_YN     HED_YN.   
	HEDVAL     HEDVAL.   
	HCSP_YN    HCSP_YN.  
	HCSPVAL    HCSPVAL.  
	HALM_YN    HALM_YN.  
	HALMVAL    HALMVAL.  
	HFIN_YN    HFIN_YN.  
	HFINVAL    HFINVAL.  
	HOI_YN     HOI_YN.   
	HOIVAL     HOIVAL.   
	HTOTVAL    HTOTVAL.  
	HEARNVAL   HEARNVAL. 
	HOTHVAL    HOTHVAL.  
	HHINC      HHINC.    
	HMCARE     HMCARE.   
	HMCAID     HMCAID.   
	HCHAMP     HCHAMP.   
	HHI_YN     HHI_YN.   
	HHSTATUS   HHSTATUS. 
	HUNDER18   HUNDER1H. 
	HTOP5PCT   HTOP5PCT. 
	HPCTCUT    HPCTCUT.  
	INDCCODE   INDCCODE. 
	HPTENURE   HPTENURE. 
	HPLIVQRT   HPLIVQRT. 
	HPTELHHD   HPTELHHD. 
	HPTELAVL   HPTELAVL. 
	HPTELINT   HPTELINT. 
	I_HHOTLU   I_HHOTLU. 
	I_HHOTNO   I_HHOTNO. 
	I_HFLUNC   I_HFLUNC. 
	I_HFLUNN   I_HFLUNN. 
	I_HPUBLI   I_HPUBLI. 
	I_HLOREN   I_HLOREN. 
	I_HFOODS   I_HFOODS. 
	I_HFDVAL   I_HFDVAL. 
	I_HFOODN   I_HFOODN. 
	I_HFOODM   I_HFOODM. 
	I_HENGAS   I_HENGAS. 
	I_HENGVA   I_HENGVA. 
	PROP_TAX   PROP_TAX. 
	HOUSRET    HOUSRET.  
	HRHTYPE    HRHTYPE.  
	I_HUNITS   I_HUNITS. 
	HRTAYN     HRTAYN.   
	HRNUMTA    HRNUMTA.  
	HRCCAYN    HRCCAYN.  
	HRNUMCC    HRNUMCC.  
	HRPAIDCC   HRPAIDCC. 
	HRCMSRYN   HRCMSRYN. 
	HRJCYN     HRJCYN.   
	HRJRYN     HRJRYN.   
	HRJTYN     HRJTYN.   
	HRSCHLYN   HRSCHLYN. 
	HRWICYN    HRWICYN.  
	FRECORD    FRECORD.  
	FKIND      FKIND.    
	FTYPE      FTYPE.    
	FWIFEIDX   FWIFEIDX. 
	FHUSBIDX   FHUSBIDX. 
	FSPOUIDX   FSPOUIDX. 
	FOWNU6     FOWNU6L.  
	FOWNU18    FOWNU18L. 
	FRELU6     FRELU6L.  
	FRELU18    FRELU18L. 
	FPCTCUT    FPCTCUT.  
	FAMLIS     FAMLIS.   
	POVLL      POVLL.    
	FRSPOV     FRSPOV.   
	FINC_WS    FINC_WS.  
	FINC_SE    FINC_SE.  
	FSEVAL     FSEVAL.   
	FINC_FR    FINC_FR.  
	FFRVAL     FFRVAL.   
	FINC_UC    FINC_UC.  
	FUCVAL     FUCVAL.   
	FINC_WC    FINC_WC.  
	FWCVAL     FWCVAL.   
	FINC_SS    FINC_SS.  
	FSSVAL     FSSVAL.   
	FINC_SSI   FINC_SSI. 
	FSSIVAL    FSSIVAL.  
	FINC_PAW   FINC_PAW. 
	FPAWVAL    FPAWVAL.  
	FINC_VET   FINC_VET. 
	FVETVAL    FVETVAL.  
	FINC_SUR   FINC_SUR. 
	FSURVAL    FSURVAL.  
	FINC_DIS   FINC_DIS. 
	FDISVAL    FDISVAL.  
	FINC_RET   FINC_RET. 
	FRETVAL    FRETVAL.  
	FINC_INT   FINC_INT. 
	FINTVAL    FINTVAL.  
	FINC_DIV   FINC_DIV. 
	FDIVVAL    FDIVVAL.  
	FINC_RNT   FINC_RNT. 
	FRNTVAL    FRNTVAL.  
	FINC_ED    FINC_ED.  
	FEDVAL     FEDVAL.   
	FINC_CSP   FINC_CSP. 
	FCSPVAL    FCSPVAL.  
	FINC_ALM   FINC_ALM. 
	FALMVAL    FALMVAL.  
	FINC_FIN   FINC_FIN. 
	FFINVAL    FFINVAL.  
	FINC_OI    FINC_OI.  
	FOIVAL     FOIVAL.   
	FTOTVAL    FTOTVAL.  
	FEARNVAL   FEARNVAL. 
	FOTHVAL    FOTHVAL.  
	FTOT_R     FTOT_R.   
	FSPANISH   FSPANISH. 
	F_MV_FS    F_MV_FS.  
	F_MV_SL    F_MV_SL.  
	FFNGCAID   FFNGCAID. 
	FHOUSSUB   FHOUSSUB. 
	FFOODREQ   FFOODREQ. 
	FHOUSREQ   FHOUSREQ. 
	PRECORD    PRECORD.  
	A_PARENT   A_PARENT. 
	A_EXPRRP   A_EXPRRP. 
	A_MARITL   A_MARITL. 
	A_SPOUSE   A_SPOUSE. 
	A_SEX      A_SEX.    
	A_VET      A_VET.    
	A_HGA      A_HGA.    
	PRDTRACE   PRDTRACE. 
	P_STAT     P_STAT.   
	PEHSPNON   PEHSPNON. 
	PRDTHSP    PRDTHSP.  
	A_FAMNUM   A_FAMNUM. 
	A_FAMTYP   A_FAMTYP. 
	A_FAMREL   A_FAMREL. 
	A_PFREL    A_PFREL.  
	HHDREL     HHDREL.   
	FAMREL     FAMREL.   
	HHDFMX     HHDFMX.   
	PARENT     PARENT.   
	AGE1       AGE1L.    
	A_FNLWGT   A_FNLWGT. 
	A_ERNLWT   A_ERNLWT. 
	A_HRS1     A_HRS1L.  
	A_USLFT    A_USLFT.  
	A_WHYABS   A_WHYABS. 
	A_PAYABS   A_PAYABS. 
	PEIOIND    PEIOIND.  
	PEIOOCC    PEIOOCC.  
	A_WKSLK    A_WKSLK.  
	A_WHENLJ   A_WHENLJ. 
	A_CLSWKR   A_CLSWKR. 
	A_NLFLJ    A_NLFLJ.  
	A_WANTJB   A_WANTJB. 
	A_USLHRS   A_USLHRS. 
	A_HRLYWK   A_HRLYWK. 
	A_HRSPAY   A_HRSPAY. 
	A_GRSWK    A_GRSWK.  
	A_UNMEM    A_UNMEM.  
	A_UNCOV    A_UNCOV.  
	A_ENRLW    A_ENRLW.  
	A_HSCOL    A_HSCOL.  
	A_FTPT     A_FTPT.   
	A_LFSR     A_LFSR.   
	A_UNTYPE   A_UNTYPE. 
	A_WKSTAT   A_WKSTAT. 
	A_EXPLF    A_EXPLF.  
	A_WKSCH    A_WKSCH.  
	A_CIVLF    A_CIVLF.  
	A_FTLF     A_FTLF.   
	A_MJIND    A_MJIND.  
	A_DTIND    A_DTIND.  
	MJOCC      MJOCC.    
	A_DTOCC    A_DTOCC.  
	PRERELG    PRERELG.  
	A_RCOW     A_RCOW.   
	WORKYN     WORKYN.   
	WTEMP      WTEMP.    
	NWLOOK     NWLOOK.   
	NWLKWK     NWLKWK.   
	RSNNOTW    RSNNOTW.  
	WKSWORK    WKSWORK.  
	WKCHECK    WKCHECK.  
	LOSEWKS    LOSEWKS.  
	LKNONE     LKNONE.   
	LKWEEKS    LKWEEKS.  
	LKSTRCH    LKSTRCH.  
	PYRSN      PYRSN.    
	PHMEMPRS   PHMEMPRS. 
	HRSWK      HRSWK.    
	HRCHECK    HRCHECK.  
	PTYN       PTYN.     
	PTWEEKS    PTWEEKS.  
	PTRSN      PTRSN.    
	LJCW       LJCW.     
	WEXP       WEXP.     
	WEWKRS     WEWKRS.   
	WELKNW     WELKNW.   
	WEUEMP     WEUEMP.   
	EARNER     EARNER.   
	CLWK       CLWK.     
	WECLW      WECLW.    
	POCCU2     POCCU2L.  
	WEMOCG     WEMOCG.   
	WEIND      WEIND.    
	WEMIND     WEMIND.   
	MIGPLAC    MIGPLAC.  
	MIGSAME    MIGSAME.  
	MIG_REG    MIG_REG.  
	MIG_ST     MIG_ST.   
	PLACDSCP   PLACDSCP. 
	GEDIV      GEDIV.    
	MIG_DIV    MIG_DIV.  
	MIG_MTR1   MIG_MTRA. 
	MIG_MTR3   MIG_MTRC. 
	MIG_MTR4   MIG_MTRD. 
	NOEMP      NOEMP.    
	ERN_YN     ERN_YN.   
	ERN_VAL    ERN_VAL.  
	ERN_SRCE   ERN_SRCE. 
	ERN_OTR    ERN_OTR.  
	WAGEOTR    WAGEOTR.  
	WSAL_YN    WSAL_YN.  
	WSAL_VAL   WSAL_VAL. 
	SEOTR      SEOTR.    
	SEMP_YN    SEMP_YN.  
	SEMP_VAL   SEMP_VAL. 
	FRMOTR     FRMOTR.   
	FRSE_YN    FRSE_YN.  
	FRSE_VAL   FRSE_VAL. 
	UC_YN      UC_YN.    
	SUBUC      SUBUC.    
	STRKUC     STRKUC.   
	UC_VAL     UC_VAL.   
	WC_YN      WC_YN.    
	WC_TYPE    WC_TYPE.  
	WC_VAL     WC_VAL.   
	SS_YN      SS_YN.    
	SS_VAL     SS_VAL.   
	SSI_YN     SSI_YN.   
	PAW_YN     PAW_YN.   
	PAW_TYP    PAW_TYP.  
	PAW_MON    PAW_MON.  
	PAW_VAL    PAW_VAL.  
	VET_YN     VET_YN.   
	VET_TYP1   VET_TYPA. 
	VET_TYP2   VET_TYPB. 
	VET_TYP3   VET_TYPC. 
	VET_TYP4   VET_TYPD. 
	VET_TYP5   VET_TYPE. 
	VET_QVA    VET_QVA.  
	VET_VAL    VET_VAL.  
	SUR_YN     SUR_YN.   
	SUR_SC1    SUR_SC1L. 
	SUR_VAL1   SUR_VALA. 
	SUR_VAL2   SUR_VALB. 
	SRVS_VAL   SRVS_VAL. 
	DIS_HP     DIS_HP.   
	DIS_CS     DIS_CS.   
	DIS_YN     DIS_YN.   
	DIS_SC1    DIS_SC1L. 
	DIS_VAL1   DIS_VALA. 
	DIS_VAL2   DIS_VALB. 
	DSAB_VAL   DSAB_VAL. 
	RET_YN     RET_YN.   
	RET_SC1    RET_SC1L. 
	RET_VAL1   RET_VALA. 
	RET_VAL2   RET_VALB. 
	RTM_VAL    RTM_VAL.  
	INT_YN     INT_YN.   
	INT_VAL    INT_VAL.  
	DIV_YN     DIV_YN.   
	DIV_NON    DIV_NON.  
	DIV_VAL    DIV_VAL.  
	RNT_YN     RNT_YN.   
	RNT_VAL    RNT_VAL.  
	ED_YN      ED_YN.    
	OED_TYP1   OED_TYPA. 
	OED_TYP2   OED_TYPB. 
	OED_TYP3   OED_TYPC. 
	ED_VAL     ED_VAL.   
	CSP_YN     CSP_YN.   
	CSP_VAL    CSP_VAL.  
	ALM_YN     ALM_YN.   
	ALM_VAL    ALM_VAL.  
	FIN_YN     FIN_YN.   
	FIN_VAL    FIN_VAL.  
	OI_OFF     OI_OFF.   
	OI_YN      OI_YN.    
	OI_VAL     OI_VAL.   
	PTOTVAL    PTOTVAL.  
	PEARNVAL   PEARNVAL. 
	POTHVAL    POTHVAL.  
	FL_665     FL_665L.  
	PTOT_R     PTOT_R.   
	PERLIS     PERLIS.   
	MCARE      MCARE.    
	MCAID      MCAID.    
	CHAMP      CHAMP.    
	HI_YN      HI_YN.    
	HIOWN      HIOWN.    
	HIEMP      HIEMP.    
	HIPAID     HIPAID.   
	WRK_CK     WRK_CK.   
	PENPLAN    PENPLAN.  
	PENINCL    PENINCL.  
	COV_GH     COV_GH.   
	COV_HI     COV_HI.   
	CH_MC      CH_MC.    
	CH_HI      CH_HI.    
	APRRP      APRRP.    
	APPARENT   APPARENT. 
	APAGE      APAGE.    
	APMARITL   APMARITL. 
	APSPOUSE   APSPOUSE. 
	APSEX      APSEX.    
	APVET      APVET.    
	APHGA      APHGA.    
	APLFSR     APLFSR.   
	APHRS      APHRS.    
	APWHYABS   APWHYABS. 
	APPAYABS   APPAYABS. 
	APCLSWKR   APCLSWKR. 
	APNLFLJ    APNLFLJ.  
	APUSLHRS   APUSLHRS. 
	APHRLYWK   APHRLYWK. 
	PRWERNAL   PRWERNAL. 
	PRHERNAL   PRHERNAL. 
	APUNMEM    APUNMEM.  
	APUNCOV    APUNCOV.  
	APENRLW    APENRLW.  
	APHSCOL    APHSCOL.  
	APFTPT     APFTPT.   
	I_ERNYN    I_ERNYN.  
	I_ERNVAL   I_ERNVAL. 
	I_WSYN     I_WSYN.   
	I_WSVAL    I_WSVAL.  
	I_SEYN     I_SEYN.   
	I_SEVAL    I_SEVAL.  
	I_FRMYN    I_FRMYN.  
	I_FRMVAL   I_FRMVAL. 
	I_UCYN     I_UCYN.   
	I_UCVAL    I_UCVAL.  
	I_WCYN     I_WCYN.   
	I_WCTYP    I_WCTYP.  
	I_WCVAL    I_WCVAL.  
	I_SSYN     I_SSYN.   
	I_SSVAL    I_SSVAL.  
	I_SSIYN    I_SSIYN.  
	I_SSIVAL   I_SSIVAL. 
	I_PAWYN    I_PAWYN.  
	I_PAWTYP   I_PAWTYP. 
	I_PAWVAL   I_PAWVAL. 
	I_PAWMO    I_PAWMO.  
	I_VETYN    I_VETYN.  
	I_VETTYP   I_VETTYP. 
	I_VETVAL   I_VETVAL. 
	I_VETQVA   I_VETQVA. 
	I_SURYN    I_SURYN.  
	I_SURSC1   I_SURSCA. 
	I_SURSC2   I_SURSCB. 
	I_SURVL1   I_SURVLA. 
	I_SURVL2   I_SURVLB. 
	I_DISSC1   I_DISSCA. 
	I_DISSC2   I_DISSCB. 
	I_DISHP    I_DISHP.  
	I_DISCS    I_DISCS.  
	I_DISYN    I_DISYN.  
	TOI_VAL    TOI_VAL.  
	I_DISVL1   I_DISVLA. 
	I_DISVL2   I_DISVLB. 
	I_RETYN    I_RETYN.  
	I_RETSC1   I_RETSCA. 
	I_RETSC2   I_RETSCB. 
	I_RETVL1   I_RETVLA. 
	I_RETVL2   I_RETVLB. 
	I_INTYN    I_INTYN.  
	I_INTVAL   I_INTVAL. 
	I_DIVYN    I_DIVYN.  
	I_DIVVAL   I_DIVVAL. 
	I_RNTYN    I_RNTYN.  
	I_RNTVAL   I_RNTVAL. 
	I_EDYN     I_EDYN.   
	I_EDTYP1   I_EDTYPA. 
	I_EDTYP2   I_EDTYPB. 
	I_OEDVAL   I_OEDVAL. 
	I_CSPYN    I_CSPYN.  
	I_CSPVAL   I_CSPVAL. 
	I_ALMYN    I_ALMYN.  
	I_ALMVAL   I_ALMVAL. 
	I_FINYN    I_FINYN.  
	I_FINVAL   I_FINVAL. 
	I_OIVAL    I_OIVAL.  
	I_NWLOOK   I_NWLOOK. 
	I_NWLKWK   I_NWLKWK. 
	I_RSNNOT   I_RSNNOT. 
	I_LOSEWK   I_LOSEWK. 
	I_LKWEEK   I_LKWEEK. 
	I_LKSTR    I_LKSTR.  
	I_PYRSN    I_PYRSN.  
	I_PHMEMP   I_PHMEMP. 
	I_HRSWK    I_HRSWK.  
	I_HRCHK    I_HRCHK.  
	I_PTYN     I_PTYN.   
	I_PTWKS    I_PTWKS.  
	I_PTRSN    I_PTRSN.  
	I_LJCW     I_LJCW.   
	I_INDUS    I_INDUS.  
	I_OCCUP    I_OCCUP.  
	I_WORKYN   I_WORKYN. 
	I_WTEMP    I_WTEMP.  
	I_WKSWK    I_WKSWK.  
	I_WKCHK    I_WKCHK.  
	I_ERNSRC   I_ERNSRC. 
	I_NOEMP    I_NOEMP.  
	I_PENPLA   I_PENPLA. 
	I_PENINC   I_PENINC. 
	I_MIG1     I_MIG1L.  
	I_MIG2     I_MIG2L.  
	P_MVCARE   P_MVCARE. 
	P_MVCAID   P_MVCAID. 
	EMCONTRB   EMCONTRB. 
	FILESTAT   FILESTAT. 
	DEP_STAT   DEP_STAT. 
	FED_TAX    FED_TAX.  
	EIT_CRED   EIT_CRED. 
	STATETAX   STATETAX. 
	FICA       FICA.     
	FED_RET    FED_RET.  
	AGI        AGI.      
	CAP_GAIN   CAP_GAIN. 
	CAP_LOSS   CAP_LOSS. 
	TAX_INC    TAX_INC.  
	MARG_TAX   MARG_TAX. 
	PEMLR      PEMLR.    
	PRUNTYPE   PRUNTYPE. 
	PRWKSTAT   PRWKSTAT. 
	PRPTREA    PRPTREA.  
	PRDISC     PRDISC.   
	PRCOW1     PRCOW1L.  
	PRPERTYP   PRPERTYP. 
	PEABSRSN   PEABSRSN. 
	PEIO1COW   PEIO1COW. 
	PRNLFSCH   PRNLFSCH. 
	PEHRUSLT   PEHRUSLT. 
	PEINUSYR   PEINUSYR. 
	PRCITSHP   PRCITSHP. 
	PXNATVTY   PXNATVTY. 
	PERRP      PERRP.    
	I_MIG3     I_MIG3L.  
	HI         HI.       
	HITYP      HITYP.    
	DEPHI      DEPHI.    
	HILIN1     HILIN1L.  
	HILIN2     HILIN2L.  
	PAID       PAID.     
	HIOUT      HIOUT.    
	PRIV       PRIV.     
	PRITYP     PRITYP.   
	DEPRIV     DEPRIV.   
	PILIN1     PILIN1L.  
	PILIN2     PILIN2L.  
	POUT       POUT.     
	OUT        OUT.      
	CARE       CARE.     
	CAID       CAID.     
	MON        MON.      
	OTH        OTH.      
	OTYP_1     OTYP_1L.  
	OTYP_2     OTYP_2L.  
	OTYP_3     OTYP_3L.  
	OTYP_4     OTYP_4L.  
	OTYP_5     OTYP_5L.  
	OTHSTPER   OTHSTPER. 
	OTHSTYP1   OTHSTYPA. 
	HEA        HEA.      
	I_HI       I_HI.     
	I_DEPHI    I_DEPHI.  
	I_PAID     I_PAID.   
	I_HIOUT    I_HIOUT.  
	I_PRIV     I_PRIV.   
	I_DEPRIV   I_DEPRIV. 
	I_POUT     I_POUT.   
	I_OUT      I_OUT.    
	I_CARE     I_CARE.   
	I_CAID     I_CAID.   
	I_MON      I_MON.    
	I_OTH      I_OTH.    
	I_OTYP     I_OTYP.   
	I_OSTPER   I_OSTPER. 
	I_OSTYP    I_OSTYP.  
	I_HEA      I_HEA.    
	SSI_VAL    SSI_VAL.  
	WS_VAL     WS_VAL.   
	SE_VAL     SE_VAL.   
	IHSFLG     IHSFLG.   
	TSURVAL1   TSURVALA. 
	TSURVAL2   TSURVALB. 
	TDISVAL1   TDISVALA. 
	TDISVAL2   TDISVALB. 
	TRETVAL1   TRETVALA. 
	TRETVAL2   TRETVALB. 
	TINT_VAL   TINT_VAL. 
	TDIV_VAL   TDIV_VAL. 
	TRNT_VAL   TRNT_VAL. 
	TED_VAL    TED_VAL.  
	TCSP_VAL   TCSP_VAL. 
	TALM_VAL   TALM_VAL. 
	TFIN_VAL   TFIN_VAL. 
	NXTRES     NXTRES.   
	I_NXTRES   I_NXTRES. 
	FRM_VAL    FRM_VAL.  
	TRANYN     TRANYN.   
	TRANYNA    TRANYNA.  
	CCAYN      CCAYN.    
	CCAYNA     CCAYNA.   
	PAIDCCYN   PAIDCCYN. 
	PAIDCYNA   PAIDCYNA. 
	AHIPER     AHIPER.   
	IAHIPER    IAHIPER.  
	AHITYP6    AHITYP6L. 
	IAHITYP    IAHITYP.  
	PCHIP      PCHIP.    
	I_PCHIP    I_PCHIP.  
	RESNSS1    RESNSS1L. 
	RESNSS2    RESNSS2L. 
	RESNSSA    RESNSSA.  
	RESNSSI1   RESNSSIA. 
	RESNSSI2   RESNSSIB. 
	RESNSSIA   RESNSSIX. 
	SSIKIDYN   SSIKIDYN. 
	SSIKDYNA   SSIKDYNA. 
	SSKIDYN    SSKIDYN.  
	SSKIDYNA   SSKIDYNA. 
	JCYN       JCYN.     
	JCYNA      JCYNA.    
	JRYN       JRYN.     
	JRYNA      JRYNA.    
	JTYN       JTYN.     
	JTYNA      JTYNA.    
	SCHOOLYN   SCHOOLYN. 
	SCHOLYNA   SCHOLYNA. 
	WICYN      WICYN.    
	WICYNA     WICYNA.   
	COMSRVYN   COMSRVYN. 
	CMSRVYNA   CMSRVYNA. 
	INDUSTRY   INDUSTRY. 
	OCCUP      OCCUP.    
;

run;                         /***PT*** Added ******/

filename raw clear;     /***PT*** Added to clear fileref ******/


/***PT***
proc contents data=library.cpsmar03;
*****/
/*
Copyright 2003 shared by the National Bureau of Economic Research and Jean Roth

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

/***PT*** ADDED *****/

proc sort data=&out._was;
  by ph_seq a_lineno;

proc sort data=&out._comp;
  by ph_seq a_lineno;

%File_info( data=&out._was, printobs=0, freqvars=gestfips geco statecd ucounty )

proc freq data=&out._was;
  tables PRDTRACE * a_race / list missing;

run;

proc tabulate data=&out._was format=comma12.0 noseps missing;
  class statecd a_race;
  var count;
  weight marsupwt;
  table statecd, all='Total' a_race, count=' ' * ( sum='Population' colpctsum='Pct.' )
   / condense;
  title2;
  title3 "CPS March Supplement, &year";

run;

** Comparison data set summary **;

*proc contents data=&out._comp;

proc freq data=&out._comp;
  tables comp_city comp_city * statecd * geco * HG_MSAC * INDCCODE / list missing;
  format comp_city comp_cit. statecd $fstab.;
  title2;
  title3 "CPS March Supplement, &year, Comparison Cities Data Set";
  
run;

title2;
