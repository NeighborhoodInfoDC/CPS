/**************************************************************************
 Program:  Cps_formats.sas
 Library:  CPS
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  11/08/05
 Version:  SAS 8.2
 Environment:  Windows
 
 Description:  Create formats for CPS data sets.

 Modifications:
**************************************************************************/

%include "K:\Metro\PTatian\DCData\SAS\Inc\Stdhead.sas";
***%include "C:\DCData\SAS\Inc\Stdhead.sas";

** Define libraries **;
%DCData_lib( CPS )

PROC FORMAT library=cps;

  /** Comparison cities **/
  value comp_cit
    1 = 'Washington, D.C.'
    2 = 'Baltimore'
    3 = 'Boston'
    4 = 'Cleveland'
    5 = 'Dallas'
    6 = 'Detroit'
    7 = 'Milwaukee'
    8 = 'New Orleans'
    9 = 'Oakland'
    10 = 'Philadelphia'
    11 = 'St. Louis';
    
VALUE A_RACE  
	1         =  "White"                         
	2         =  "Black"                         
	3         =  "American Indian, Aleut Eskimo" 
	4         =  "Asian or Pacific Island"       
;

VALUE hrecord 
	1         =  "Household record"              
;
VALUE hunits  
	1         =  "1 Unit"                        
	2         =  "2 Units"                       
	3         =  "3 - 4 Units"                   
	4         =  "5 - 9 Units"                   
	5         =  "10+ Units"                     
;
VALUE hufaminc
	-3        =  "Refused"                       
	-2        =  "Don't know"                    
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
VALUE h_respnm
	-1        =  "Not in universe (non-interview)"
	0         =  "Blank or impossible"           
;
VALUE h_hhtype
	1         =  "Interview"                     
	2         =  "Type A non-interview"          
	3         =  "Type B/C non-interview"        
;
VALUE h_numper
	0         =  "Noninterview household"        
;
VALUE hnumfam 
	0         =  "Noninterview household"        
;
VALUE h_type  
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
VALUE h_month 
	3         =  "March"                         
;
VALUE h_hhnum 
	0         =  "Blank"                         
;
VALUE h_livqrt
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
VALUE h_typebc
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
VALUE h_tenure
	0         =  "Not in universe"               
	1         =  "Owned or being bought"         
	2         =  "Rent"                          
	3         =  "No cash rent"                  
;
VALUE h_telhhd
	0         =  "Not in universe (non-interview)"
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE h_telavl
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE h_telint
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE gereg   
	1         =  "Northeast"                     
	2         =  "Midwest"                       
	3         =  "South"                         
	4         =  "West"                          
;
VALUE gestcen 
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
VALUE gtcbsa  
	0         =  "Non-met or not identified"     
;
VALUE gtco    
	0         =  "Not identified"                
;
VALUE gtcbsast
	1         =  "Principal city"                
	2         =  "Balance of CBSA"               
	3         =  "Non CBSA"                      
	4         =  "Not identified"                
;
VALUE gtmetsta
	1         =  "Metropolitan"                  
	2         =  "Non-metropolitan"              
	3         =  "Not identified"                
;
/****PT****
VALUE gtindvpc
	0         =  "Not identified, non-met, or"   
;
*****/
VALUE gtcbsasz
	0         =  "Not identified or"             
	2         =  "100,000 - 249,999"             
	3         =  "250,000 - 499,999"             
	4         =  "500,000 - 999,999"             
	5         =  "1,000,000 - 2,499,999"         
	6         =  "2,500,000 - 4,999,999"         
	7         =  "5,000,000+"                    
;
/****PT****
VALUE gtcsa   
	0         =  "Non-met or not identified"     
;
VALUE hunder1e
	0         =  "None"                          
;
********/
VALUE hcmcare 
	0         =  "Not in universe"               
	1         =  "All or some"                   
	2         =  "None"                          
;
VALUE hcmceno 
	0         =  "Not in universe"               
	1         =  "1 child"                       
	9         =  "9 or more children"            
;
VALUE hchi    
	0         =  "Not in universe"               
	1         =  "All or some"                   
	2         =  "None"                          
;
VALUE hchino  
	0         =  "Not in universe  HCHI =  2"    
	1         =  "1 Child"                       
	9         =  "9 or more children"            
;
VALUE hchinrh 
	0         =  "Not in universe"               
	1         =  "All or some"                   
	2         =  "None"                          
;
VALUE hchinno 
	0         =  "Not in universe  HCHINRH= 2"   
	1         =  "1 Child"                       
	9         =  "9 or more children"            
;
VALUE hh5to18l
	0         =  "None"                          
;
VALUE hhotlun 
	0         =  "Not in universe"               
	1         =  "All or some"                   
	2         =  "None"                          
;
VALUE hhotno  
	0         =  "Not in universe"               
	1         =  "1 child"                       
	9         =  "9 or more children"            
;
VALUE hflunch 
	0         =  "Not in universe"               
	1         =  "Some or all"                   
	2         =  "None"                          
;
VALUE hflunno 
	0         =  "Not in universe"               
	1         =  "1"                             
	9         =  "9 or more"                     
;
VALUE hpublic 
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hlorent 
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hfoodsp 
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hfoodno 
	0         =  "Not in universe"               
	1         =  "1"                             
	9         =  "9 or more"                     
;
VALUE hfoodmo 
	0         =  "Not in universe"               
	1         =  "1 month"                       
	12        =  "12 Months"                     
;
VALUE hfdval  
	0         =  "Not in universe"               
;
VALUE hengast 
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hengval 
	0         =  "Not in universe"               
;
VALUE hinc_ws 
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hwsval  
	0         =  "None or not in universe"       
;
VALUE hinc_se 
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hseval  
	0         =  "None or not in universe"       
;
VALUE hinc_fr 
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hfrval  
	0         =  "None or not in universe"       
;
VALUE hinc_uc 
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hucval  
	0         =  "None or not in universe"       
;
VALUE hinc_wc 
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hwcval  
	0         =  "None or not in universe"       
;
VALUE hss_yn  
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hssval  
	0         =  "None or not in universe"       
;
VALUE hssi_yn 
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hssival 
	0         =  "None"                          
;
VALUE hpaw_yn 
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hpawval 
	0         =  "None"                          
;
VALUE hvet_yn 
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hvetval 
	0         =  "None or not in universe"       
;
VALUE hsur_yn 
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hsurval 
	0         =  "None or not in universe"       
;
VALUE hdis_yn 
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hdisval 
	0         =  "None or not in universe"       
;
VALUE hret_yn 
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hretval 
	0         =  "None or not in universe"       
;
VALUE hint_yn 
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hintval 
	0         =  "None or not in universe"       
;
VALUE hdiv_yn 
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hdivval 
	0         =  "None or not in universe"       
;
VALUE hrnt_yn 
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hrntval 
	0         =  "None or not in universe"       
;
VALUE hed_yn  
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hedval  
	0         =  "None or not in universe"       
;
VALUE hcsp_yn 
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hcspval 
	0         =  "None or not in universe"       
;
VALUE halm_yn 
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE halmval 
	0         =  "None or not in universe"       
;
VALUE hfin_yn 
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hfinval 
	0         =  "None or not in universe"       
;
VALUE hoi_yn  
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hoival  
	0         =  "None or not in universe"       
;
VALUE htotval 
	0         =  "None or not in universe"       
;
VALUE hearnval
	0         =  "None or not in universe"       
;
VALUE hothval 
	0         =  "None or not in universe"       
;
VALUE hhinc   
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
VALUE hmcare  
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hmcaid  
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hchamp  
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hhi_yn  
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hhstatus
	0         =  "Not in universe (group"        
	1         =  "Primary family"                
	2         =  "Nonfamily householder living"  
	3         =  "Nonfamily householder living"  
;
VALUE hunder1h
	0         =  "None"                          
;
VALUE htop5pct
	0         =  "Not in universe (group"        
	1         =  "In top 5 percent"              
	2         =  "Not in top 5 percent"          
;
VALUE hpctcut 
	0         =  "Not in universe (group"        
	1         =  "Lowest 5 percent"              
	2         =  "Second 5 percent"              
	20        =  "Top 5 percent"                 
;
VALUE hptenure
	0         =  "No change"                     
	1         =  "Value to blank"                
	4         =  "Allocated"                     
;
VALUE hplivqrt
	0         =  "No change"                     
	4         =  "Allocated"                     
	7         =  "Blank to NA - no error"        
;
VALUE hptelhhd
	0         =  "No change"                     
	1         =  "Value to blank"                
	4         =  "Allocated"                     
;
VALUE hptelavl
	0         =  "No change"                     
	1         =  "Value to blank"                
	4         =  "Allocated"                     
;
VALUE hptelint
	0         =  "No change"                     
	1         =  "Value to blank"                
	4         =  "Allocated"                     
;
VALUE i_hhotlu
	0         =  "No change"                     
	1         =  "Allocated"                     
;
VALUE i_hhotno
	0         =  "No change"                     
	1         =  "Allocated"                     
;
VALUE i_hflunc
	0         =  "No change"                     
	1         =  "Allocated"                     
;
VALUE i_hflunn
	0         =  "No change"                     
	1         =  "Allocated"                     
;
VALUE i_hpubli
	0         =  "No change"                     
	1         =  "Allocated"                     
;
VALUE i_hloren
	0         =  "No change"                     
	1         =  "Allocated"                     
;
VALUE i_hfoods
	0         =  "No change"                     
	1         =  "Allocated"                     
;
VALUE i_hfdval
	0         =  "No change"                     
	1         =  "Allocated"                     
;
VALUE i_hfoodn
	0         =  "No change"                     
	1         =  "Allocated"                     
;
VALUE i_hfoodm
	0         =  "No change"                     
	1         =  "Allocated"                     
;
VALUE i_hengas
	0         =  "No change"                     
	1         =  "Allocated"                     
;
VALUE i_hengva
	0         =  "No change"                     
	1         =  "Allocated"                     
;
VALUE prop_tax
	0         =  "None"                          
;
VALUE housret 
	0         =  "None"                          
;
VALUE hrhtype 
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
VALUE i_hunits
	0         =  "No change"                     
	1         =  "Allocated"                     
;
VALUE hrtayn  
	0         =  "NIU"                           
	1         =  "YES"                           
	2         =  "NO"                            
;
VALUE hrnumta 
	0         =  "NIU"                           
;
VALUE hrccayn 
	0         =  "NIU"                           
	1         =  "YES"                           
	2         =  "NO"                            
;
VALUE hrnumcc 
	0         =  "NIU"                           
;
VALUE hrpaidcc
	0         =  "NIU"                           
	1         =  "YES"                           
	2         =  "NO"                            
;
VALUE hrcmsryn
	0         =  "NIU"                           
	1         =  "YES"                           
	2         =  "NO"                            
;
VALUE hrjcyn  
	0         =  "NIU"                           
	1         =  "YES"                           
	2         =  "NO"                            
;
VALUE hrjryn  
	0         =  "NIU"                           
	1         =  "YES"                           
	2         =  "NO"                            
;
VALUE hrjtyn  
	0         =  "NIU"                           
	1         =  "YES"                           
	2         =  "NO"                            
;
VALUE hrschlyn
	0         =  "NIU"                           
	1         =  "YES"                           
	2         =  "NO"                            
;
VALUE hrwicyn 
	0         =  "NIU"                           
	1         =  "YES"                           
	2         =  "NO"                            
;
VALUE frecord 
	2         =  "Family record"                 
;
VALUE fkind   
	1         =  "Husband-wife family"           
	2         =  "Male reference person"         
	3         =  "Female reference person"       
;
VALUE ftype   
	1         =  "Primary family"                
	2         =  "Nonfamily householder"         
	3         =  "Related subfamily"             
	4         =  "Unrelated subfamily"           
	5         =  "Secondary individual"          
;
VALUE fwifeidx
	0         =  "No wife"                       
;
VALUE fhusbidx
	0         =  "No husband"                    
;
VALUE fspouidx
	0         =  "No spouse"                     
;
VALUE fownu6l 
	0         =  "None, not in universe"         
	1         =  "1"                             
	2         =  "2"                             
	6         =  "6+"                            
;
VALUE fownu18l
	0         =  "None, not in universe"         
	1         =  "1"                             
	9         =  "9 or more"                     
;
VALUE frelu6l 
	0         =  "None, not in universe"         
	1         =  "1"                             
	2         =  "2"                             
	6         =  "6+"                            
;
VALUE frelu18l
	0         =  "None, not in universe"         
	1         =  "1"                             
	2         =  "2"                             
	9         =  "9+"                            
;
VALUE fpctcut 
	0         =  "NIU (FTYPE=2+)"                
	1         =  "Lowest 5 percent"              
	2         =  "Second 5 percent"              
	20        =  "Top 5 percent"                 
;
VALUE famlis  
	1         =  "Below low-income level"        
	2         =  "100 - 124 percent of the low-" 
	3         =  "125 - 149 percent of the low-" 
	4         =  "150 percent and above the"     
;
VALUE povll   
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
VALUE frspov  
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
VALUE finc_ws 
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE finc_se 
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE fseval  
	0         =  "None or not in universe"       
;
VALUE finc_fr 
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE ffrval  
	0         =  "None or not in universe"       
;
VALUE finc_uc 
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE fucval  
	0         =  "None or not in universe"       
;
VALUE finc_wc 
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE fwcval  
	0         =  "None or not in universe"       
;
VALUE finc_ss 
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE fssval  
	0         =  "None or not in universe"       
;
VALUE finc_ssi
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE fssival 
	0         =  "None"                          
;
VALUE finc_paw
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE fpawval 
	0         =  "None"                          
;
VALUE finc_vet
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE fvetval 
	0         =  "None or not in universe"       
;
VALUE finc_sur
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE fsurval 
	0         =  "None or not in universe"       
;
VALUE finc_dis
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE fdisval 
	0         =  "None or not in universe"       
;
VALUE finc_ret
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE fretval 
	0         =  "None or not in universe"       
;
VALUE finc_int
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE fintval 
	0         =  "None or not in universe"       
;
VALUE finc_div
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE fdivval 
	0         =  "None or not in universe"       
;
VALUE finc_rnt
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE frntval 
	0         =  "None or not in universe"       
;
VALUE finc_ed 
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE fedval  
	0         =  "None or not in universe"       
;
VALUE finc_csp
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE fcspval 
	0         =  "None or not in universe"       
;
VALUE finc_alm
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE falmval 
	0         =  "None or not in universe"       
;
VALUE finc_fin
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE ffinval 
	0         =  "None or not in universe"       
;
VALUE finc_oi 
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE foival  
	0         =  "None or not in universe"       
;
VALUE ftotval 
	0         =  "None or not in universe"       
;
VALUE fearnval
	0         =  "None or not in universe"       
;
VALUE fothval 
	0         =  "None"                          
;
VALUE ftot_r  
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
VALUE fspanish
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE f_mv_fs 
	0         =  "None"                          
;
VALUE f_mv_sl 
	0         =  "None"                          
;
VALUE ffngcare
	0         =  "None"                          
;
VALUE ffngcaid
	0         =  "None"                          
;
VALUE fhoussub
	0         =  "None"                          
;
VALUE ffoodreq
	0         =  "None"                          
;
VALUE fhousreq
	0         =  "None"                          
;
VALUE precord 
	3         =  "Person record"                 
;
VALUE a_parent
	0         =  "None"                          
;
VALUE a_exprrp
	1         =  "Reference person with relatives"
	2         =  "Reference person without relatives"      
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
VALUE a_age   
	80        =  "80-84 years of age"            
	85        =  "85+ years of age"              
;
VALUE a_maritl
	1         =  "Married - civilian spouse"     
	2         =  "Married - AF spouse present"   
	3         =  "Married - spouse absent (exc"  
	4         =  "Widowed"                       
	5         =  "Divorced"                      
	6         =  "Separated"                     
	7         =  "Never married"                 
;
VALUE a_spouse
	0         =  "None or children"              
;
VALUE a_sex   
	1         =  "Male"                          
	2         =  "Female"                        
;
VALUE a_vet   
	0         =  "Children or Armed Forces"      
	1         =  "Vietnam"                       
	2         =  "Korean war"                    
	3         =  "World War II"                  
	4         =  "World War I"                   
	5         =  "Other service"                 
	6         =  "Nonveteran"                    
;
VALUE a_hga   
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
VALUE prdtrace
	1         =  "White only"                    
	2         =  "Black only"                    
	3         =  "American Indian,"              
	4         =  "Asian only"                    
	5         =  "Hawaiin/Pacific Islander"      
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
VALUE p_stat  
	1         =  "Civilian 15+"                  
	2         =  "Armed Forces"                  
	3         =  "Children 0 - 14"               
;
VALUE pehspnon
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE prdthsp 
	0         =  "Not in universe"               
	1         =  "Mexican"                       
	2         =  "Puerto Rican"                  
	3         =  "Cuban"                         
	4         =  "Central/South American"        
	5         =  "Other Spanish"                 
;
VALUE a_famnum
	0         =  "Not a family member"           
	1         =  "Primary family member only"    
;
VALUE a_famtyp
	1         =  "Primary family"                
	2         =  "Nonfamily householder"         
	3         =  "Related subfamily"             
	4         =  "Unrelated subfamily"           
	5         =  "Secondary individual"          
;
VALUE a_famrel
	0         =  "Not a family member"           
	1         =  "Reference person"              
	2         =  "Spouse"                        
	3         =  "Child"                         
	4         =  "Other relative (primary"       
;
VALUE a_pfrel 
	0         =  "Not in primary family"         
	1         =  "Husband"                       
	2         =  "Wife"                          
	3         =  "Own child"                     
	4         =  "Other relative"                
	5         =  "Unmarried reference person"    
;
VALUE hhdrel  
	1         =  "Householder"                   
	2         =  "Spouse of householder"         
	3         =  "Under 18 years, single (never" 
	4         =  "Under 18 years, ever married"  
	5         =  "18 years and over"             
	6         =  "Other relative of householder" 
	7         =  "Nonrelative of householder"    
	8         =  "Secondary individual"          
;
VALUE famrel  
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
VALUE hhdfmx  
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
VALUE parent  
	0         =  "Not in universe"               
	1         =  "Both parents present"          
	2         =  "Mother only present"           
	3         =  "Father only present"           
	4         =  "Neither parent present"        
;
VALUE age1l   
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
VALUE a_fnlwgt
	0         =  "Supplemental Spanish sample"   
;
VALUE a_ernlwt
	0         =  "Not in universe or children and"
;
VALUE a_hrs1l 
	-1        =  "Not in universe"               
	0         =  "Children and Armed Forces"     
;
VALUE a_uslft 
	0         =  "Not in universe or children and"
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE a_whyabs
	0         =  "Not in universe or children and"
	1         =  "Own illness"                   
	2         =  "On vacation"                   
	3         =  "Bad weather"                   
	4         =  "Labor dispute"                 
	8         =  "Other"                         
;
VALUE a_payabs
	0         =  "Not in universe or children and"
	1         =  "Yes"                           
	2         =  "No"                            
	3         =  "Self-employed"                 
;
VALUE peioind 
	0         =  "Not in universe or children"   
;
VALUE peioocc 
	0         =  "Not in universe or children"   
;
VALUE a_wkslk 
	-1        =  "Not in universe"               
	0         =  "Children or Armed Forces"      
;
VALUE a_whenlj
	0         =  "Not in universe or children and"
	1         =  "In last 12 months"             
	2         =  "More than 12 months ago"       
	5         =  "Never worked at all"           
;
VALUE a_clswkr
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
VALUE a_nlflj 
	0         =  "Not in universe or children and"
	1         =  "Within a past 12 months"       
	3         =  "More than 12 months ago"       
	7         =  "Never worked"                  
;
VALUE a_wantjb
	0         =  "Not in universe or children and"
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE a_uslhrs
	-4        =  "Hours vary"                    
	-1        =  "Not in universe"               
	0         =  "None, no hours"                
;
VALUE a_hrlywk
	0         =  "Not in universe or children and"
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE a_hrspay
	0         =  "Not in universe or children and"
;
VALUE a_grswk 
	0         =  "Not in universe or children or"
;
VALUE a_unmem 
	0         =  "Not in universe or children and"
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE a_uncov 
	0         =  "Not in universe or children and"
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE a_enrlw 
	0         =  "Not in universe or children and"
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE a_hscol 
	0         =  "Not in universe or children and"
	1         =  "High school"                   
	2         =  "College or univ."              
;
VALUE a_ftpt  
	0         =  "Not in universe or children and"
	1         =  "Full time"                     
	2         =  "Part time"                     
;
VALUE a_lfsr  
	0         =  "Children or Armed Forces"
	1         =  "Working"
	2         =  "With job, not at work"
	3         =  "Unemployed, looking for work"  
	4         =  "Unemployed, on layoff"         
	7         =  "NILF"                          
;
VALUE a_untype
	0         =  "Not in universe or children and"
	1         =  "Job loser - on layoff"         
	2         =  "Other job loser"               
	3         =  "Job leaver"                    
	4         =  "Re-entrant"                    
	5         =  "New entrant"                   
;
VALUE a_wkstat
	0         =  "Children or Armed Forces"      
	1         =  "Not in labor force"            
	2         =  "Full-time schedules"           
	3         =  "Part-time for economic reasons,"
	4         =  "Part-time for non-economic"    
	5         =  "Part-time for economic reasons,"
	6         =  "Unemployed FT"                 
	7         =  "Unemployed PT"                 
;
VALUE a_explf 
	0         =  "Not in experienced labor force"
	1         =  "Employed"                      
	2         =  "Unemployed"                    
;
VALUE a_wksch 

	0         =  "Not in universe"               
	1         =  "At work"                       
	2         =  "With job, not at work"         
	3         =  "Unemployed, seeks FT"          
	4         =  "Unemployed, seeks PT"          
;
VALUE a_civlf 
	0         =  "Not in universe or children and"
	1         =  "In universe"                   
;
VALUE a_ftlf  
	0         =  "Not in universe or children and"
	1         =  "In universe"                   
;
VALUE a_mjind 
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
VALUE a_dtind 
	0         =  "Not in universe or children or"
;
VALUE a_mjocc 
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
VALUE a_dtocc 
	0         =  "Not in universe for children or"
;
VALUE prerelg 
	0         =  "Not earnings eligible"         
	1         =  "Earnings eligible"             
;
VALUE workyn  
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE wtemp   
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE nwlook  
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE nwlkwk  
	0         =  "Not in universe"               
	1         =  "1 week"                        
	52        =  "52 weeks"                      
;
VALUE rsnnotw 
	0         =  "Not in universe"               
	1         =  "Ill or disabled"               
	2         =  "Retired"                       
	3         =  "Taking care of home or family" 
	4         =  "Going to school"               
	5         =  "Could not find work"           
	6         =  "Other"                         
;
VALUE wkswork 
	0         =  "Not in universe"               
	1         =  "1 week"                        
	52        =  "52 weeks"                      
;
VALUE wkcheck 
	0         =  "Not in universe"               
	1         =  "1-49 weeks"                    
	2         =  "50-51 weeks"                   
	3         =  "52 weeks"                      
;
VALUE losewks 
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE lknone  
	0         =  "Not in universe"               
	1         =  "No weeks looking for work or on"
;
VALUE lkweeks 
	0         =  "Not in universe"               
	1         =  "01 weeks"                      
	51        =  "51 weeks"                      
;
VALUE lkstrch 
	0         =  "Not in universe"               
	1         =  "Yes, 1 stretch"                
	2         =  "No, 2 stretches"               
	3         =  "No, 3 plus stretches"          
;
VALUE pyrsn   
	0         =  "Not in universe"               
	1         =  "Ill or disabled"               
	2         =  "Taking care of home"           
	3         =  "Going to school"               
	4         =  "Retired"                       
	5         =  "No work available"             
	6         =  "Other"                         
;
VALUE phmemprs
	0         =  "Not in universe"               
	1         =  "1 employer"                    
	2         =  "2"                             
	3         =  "3 plus"                        
;
VALUE hrswk   
	0         =  "Not in universe"               
	1         =  "1 hour"                        
	99        =  "99 hours plus"                 
;
VALUE hrcheck 
	0         =  "Not in universe"               
	1         =  "Part time (1-34)"              
	2         =  "Full time (35+)"               
;
VALUE ptyn    
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE ptweeks 
	0         =  "Not in universe"               
	1         =  "1 week"                        
	52        =  "52 weeks"                      
;
VALUE ptrsn   
	0         =  "Not in universe"               
	1         =  "Could only find PT job"        
	2         =  "Wanted part time"              
	3         =  "Slack work"                    
	4         =  "Other"                         
;
VALUE ljcw    
	0         =  "Not in universe"               
	1         =  "Private"                       
	2         =  "Federal"                       
	3         =  "State"                         
	4         =  "Local"                         
	5         =  "Self employed incorporated, yes"
	6         =  "Self employed incorporated, no"
	7         =  "Without pay"                   
;
VALUE wexp    
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
VALUE wewkrs  
	0         =  "Not in universe"               
	1         =  "Full time"                     
	2         =  "Part time"                     
	3         =  "Full time"                     
	4         =  "Part time"                     
	5         =  "Nonworker"                     
;
VALUE welknw  
	0         =  "Children"                      
	1         =  "None (not looking for work)"   
	2         =  "1 to 4 weeks looking"          
	3         =  "5 to 14 weeks looking"         
	4         =  "15 to 26 weeks looking"        
	5         =  "27 to 39 weeks looking"        
	6         =  "40 or more weeks looking"      
	7         =  "Workers"                       
;
VALUE weuemp  
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
VALUE earner  
	0         =  "Not in universe"               
	1         =  "Earner (pearnval ne 0)"        
	2         =  "Nonearner"                     
;
VALUE clwk    
	0         =  "Not in universe"               
	1         =  "Private (includes self-"       
	2         =  "Government"                    
	3         =  "Self-employed"                 
	4         =  "Without pay"                   
	5         =  "Never worked"                  
;
VALUE weclw   
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
VALUE poccu2l 
	0         =  "Not in universe (children)"    
	1         =  "Chief executives,"             
	2         =  "Human Resources/Industrial"    
	3         =  "Education Administrators,"     
	4         =  "Agents and Business Managers"  
	5         =  "Business Operations Specialists"
	6         =  "Accountants and Auditors"      
	7         =  "Financial Specialists"         
	8         =  "Computer scientist, Systems"   
	9         =  "Actuaries, Mathematicians,"    
	10        =  "Architects, except Naval"      
	11        =  "Surveyors, Cartographer, and"  
	12        =  "Aerospace/Agricultural/"       
	13        =  "Agricultural/Food/"            
	14        =  "Econonists, Market And Survey" 
	15        =  "Psychologists, Sociologists,"  
	16        =  "Agricultural/Food Science/"    
	17        =  "Community And Social Services" 
	18        =  "Lawyers, Judges, Magistrates," 
	19        =  "Paralegals &  Legal Assistants,"
	20        =  "Postsecondary Teachers"        
	21        =  "Preschool &  Kindergarden/"    
	22        =  "Archivists, Curators, Museum"  
	23        =  "Arts, Design, Entertainment,"  
	24        =  "Chiropractors, Dentists,"      
	25        =  "Registered Nurses,"            
	26        =  "Veterinarians"                 
	27        =  "Health Diagnosing/Treating/"   
	28        =  "Nursing, Psychiatric, &"       
	29        =  "First-Line Supervisors/"       
	30        =  "Fire Fighters &  Inspectors,"  
	31        =  "Animal Control Workers,"       
	32        =  "Chefs And Head Cooks, First"   
	33        =  "Food Preparation/Server"       
	34        =  "First-Line Supervisors/"       
	35        =  "Janitors/Building/Maid/"       
	36        =  "First-Line Supervisors/"       
	37        =  "Animal Trainers, Nonfarm"      
	38        =  "First-Line Supervisors/"       
	39        =  "Cashiers, Counter And"         
	40        =  "Office &  Admin. Support"      
	41        =  "Farming, Fishing, &  Forestry" 
	42        =  "First-Line Supervisors/"       
	43        =  "Carpenters"                    
	44        =  "Carpet, Floor, &"              
	45        =  "Electricians"                  
	46        =  "Glaziers, Insulation Workers," 
	47        =  "Extraction Workers"            
	48        =  "Installation, Maintenace, &"   
	49        =  "Production Occupations"        
	50        =  "Supervisors, Transportation &" 
	51        =  "Ambulance Drivers &"           
	52        =  "Armed Forces &  Military"      
	53        =  "Never Worked"                  
;
VALUE wemocg  
	0         =  "Not in universe (children)"    
	1         =  "Management occupations"        
	2         =  "Business and Financial"        
	3         =  "Computer and Mathematical"     
	4         =  "Architecture and Engineering"  
	5         =  "Life, Physical, and Social"    
	6         =  "Community and social services" 
	7         =  "Legal occupations"             
	8         =  "Education, Training, and"      
	9         =  "Arts, Design, Entertainment,"  
	10        =  "Healthcare Practitioner and"   
	11        =  "Healthcare Support occupations"
	12        =  "Protective Service occupations"
	13        =  "Food Preparation and Serving"  
	14        =  "Building and Grounds Cleaning" 
	15        =  "Personal Care and Service"     
	16        =  "Sales and Related occupations" 
	17        =  "Office and Administrative"     
	18        =  "Farming, Fishing, and"         
	19        =  "Construction Trades and"       
	20        =  "Installation, Maintenance,"    
	21        =  "Production occupations"        
	22        =  "Transportation and Material"   
	23        =  "Armed Forces and Military"     
	24        =  "Never worked"                  
;
VALUE weind   
	0         =  "Not in universe (children)"    
	1         =  "Agriculture, Forestry,"        
	2         =  "Mining"                        
	3         =  "Construction"                  
	4         =  "Durable goods manufacturing"   
	5         =  "Non-durable goods manufacturing"
	6         =  "Wholesale trade"               
	7         =  "Retail trade"                  
	8         =  "Transportation and Warehousing"
	9         =  "Utilities"                     
	10        =  "Information"                   
	11        =  "Finance and Insurance"         
	12        =  "Real Estate and Rental and"    
	13        =  "Professional, Scientific,"     
	14        =  "Management, Administrative"    
	15        =  "Educational Services"          
	16        =  "Health Care and Social"        
	17        =  "Art, Entertainment, and"       
	18        =  "Accommodations and Food"       
	19        =  "Private Households"            
	20        =  "Other Services, except"        
	21        =  "Public Administration"         
	22        =  "Armed Forces and active"       
	23        =  "Never worked"                  
;
VALUE wemind  
	0         =  "Not in universe (children)"    
	1         =  "Agriculture, Forestry,"        
	2         =  "Mining"                        
	3         =  "Construction"                  
	4         =  "Manufacturing"                 
	5         =  "Wholesale and Retail Trade"    
	6         =  "Transportation and Utilities"  
	7         =  "Information"                   
	8         =  "Financial, Insurance,"         
	9         =  "Professional, Scientific,"     
	10        =  "Educational, Health, and"      
	11        =  "Arts, Entertainment,"          
	12        =  "Other Services (except"        
	13        =  "Public Administration"         
	14        =  "Armed Forces and Active"       
	15        =  "Never Worked"                  
;
VALUE mig_cbst
	0         =  "NIU, nonmover"                 
	1         =  "CBSA"                          
	2         =  "non CBSA"                      
	3         =  "Abroad"                        
	4         =  "Not identifiable"              
;
VALUE migsame 
	0         =  "NIU"                           
	1         =  "Yes (nonmover)"                
	2         =  "No, difference house in U.S."  
	3         =  "No, outside the U.S. (mover)"  
;
VALUE mig_reg 
	0         =  "Not in universe under 1 year"  
	1         =  "Northeast"                     
	2         =  "Midwest"                       
	3         =  "South"                         
	4         =  "West"                          
	5         =  "Abroad"                        
;
VALUE mig_st  
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
VALUE mig_dscp
	0         =  "NIU (under 1 year old,"        
	1         =  "Principal city of a CBSA"      
	2         =  "Balance of a CBSA"             
	3         =  "Non-metro"                     
	4         =  "Abroad"                        
	5         =  "Not identified"                
;
VALUE gediv   
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
VALUE mig_div 
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
VALUE mig_mtra
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
VALUE mig_mtrc
	1         =  "Nonmover"                      
	2         =  "Same county"                   
	3         =  "Different county, same state"  
	4         =  "Different state, same division"
	5         =  "Different division, same region"
	6         =  "Different region"              
	7         =  "Abroad"                        
	8         =  "Not in universe (children under"
;
VALUE mig_mtrd
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
VALUE noemp   
	0         =  "Not in universe"               
	1         =  "Under 10"                      
	2         =  "10 - 24"                       
	3         =  "25 - 99"                       
	4         =  "100 - 499"                     
	5         =  "500 - 999"                     
	6         =  "1000+"                         
;
VALUE ern_yn  
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE ern_val 
	0         =  "None or not in universe"       
;
VALUE ern_srce
	0         =  "Not in universe"               
	1         =  "Wage and salary"               
	2         =  "Self employment"               
	3         =  "Farm self employment"          
	4         =  "Without pay"                   
;
VALUE ern_otr 
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE wageotr 
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE wsal_yn 
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE wsal_val
	0         =  "None or not in universe"       
;
VALUE seotr   
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE semp_yn 
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE semp_val
	0         =  "None or not in universe"       
;
VALUE frmotr  
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE frse_yn 
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE frse_val
	0         =  "None or not in universe"       
;
VALUE uc_yn   
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE subuc   
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE strkuc  
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE uc_val  
	0         =  "None or not in universe"       
;
VALUE wc_yn   
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE wc_type 
	0         =  "Not in universe"               
	1         =  "State worker's compensation"   
	2         =  "Employer or employers insurance"
	3         =  "Own insurance"                 
	4         =  "Other"                         
;
VALUE wc_val  
	0         =  "None or not in universe"       
;
VALUE ss_yn   
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE ss_val  
	0         =  "None or not in universe"       
;
VALUE ssi_yn  
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE paw_yn  
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE paw_typ 
	0         =  "Not in universe"               
	1         =  "TANF/AFDC"                     
	2         =  "Other"                         
	3         =  "Both"                          
;
VALUE paw_mon 
	0         =  "Not in universe"               
	1         =  "One"                           
	12        =  "Twelve"                        
;
VALUE paw_val 
	0         =  "None or not in universe"       
;
VALUE vet_yn  
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE vet_typa
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE vet_typb
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;

VALUE vet_typc
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE vet_typd
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE vet_type
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE vet_qva 
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE vet_val 
	0         =  "None or not in universe"       
;
VALUE sur_yn  
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE sur_sc1l
	0         =  "None or not in universe"       
	1         =  "Company or union survivor"     
	2         =  "Federal government"            
	3         =  "Us military retirement survivor"
	4         =  "State or local gov't survivor" 
	5         =  "Us railroad retirement survivor"
	6         =  "Worker's compensation survivor"
	7         =  "Black Lung Survivor Pension"   
	8         =  "Regular payments from estates" 
	9         =  "Regular payments from annuities"
	10        =  "Other or don't know"           
;
VALUE sur_vala
	0         =  "None or not in universe"       
;
VALUE sur_valb
	0         =  "None or not in universe"       
;
VALUE srvs_val
	0         =  "None or not in universe"       
;
VALUE dis_hp  
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE dis_cs  
	0         =  "Not in universe or children"   
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE dis_yn  
	0         =  "Not in universe or children"   
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE dis_sc1l
	0         =  "Not in universe"               
	1         =  "Worker's compensation"         
	2         =  "Company or union disability"   
	3         =  "Federal government disability" 
	4         =  "Us military retirement"        
	5         =  "State or local gov't employee" 
	6         =  "Us railroad retirement"        
	7         =  "Accident or disability"        
	8         =  "Black Lung miner's disability" 
	9         =  "State temporary sickness"      
	10        =  "Other or don't know"           
;
VALUE dis_vala
	0         =  "None or not in universe"       
;
VALUE dis_valb
	0         =  "None or not in universe"       
;
VALUE dsab_val
	0         =  "None or not in universe"       
;
VALUE ret_yn  
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE ret_sc1l
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
VALUE ret_vala
	0         =  "None or not in universe"       
;
VALUE ret_valb
	0         =  "None or not in universe"       
;
VALUE rtm_val 
	0         =  "None or not in universe"       
;
VALUE int_yn  
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE int_val 
	0         =  "None or not in universe"       
;
VALUE div_yn  
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE div_non 
	0         =  "Not in universe"               
	1         =  "None"                          
;
VALUE div_val 
	0         =  "None or not in universe"       
;
VALUE rnt_yn  
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE rnt_val 
	0         =  "None or not in universe"       
;
VALUE ed_yn   
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE oed_typa
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE oed_typb
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE oed_typc
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE ed_val  
	0         =  "None or not in universe"       
;
VALUE csp_yn  
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE csp_val 
	0         =  "None or not in universe"       
;
VALUE alm_yn  
	0         =  "None or not in universe"       
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE alm_val 
	0         =  "None or not in universe"       
;
VALUE fin_yn  
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE fin_val 
	0         =  "None or not in universe"       
;
VALUE oi_off  
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
	18        =  "Farm self-employment"          
	19        =  "Anything else"                 
;
VALUE oi_yn   
	0         =  "None or not in universe"       
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE oi_val  
	0         =  "None or not in universe"       
;
VALUE ptotval 
	0         =  "None or not in universe"       
;
VALUE pearnval
	0         =  "None or not in universe"       
;
VALUE pothval 
	0         =  "None"                          
;
VALUE fl_665l 
	0         =  "No 665 person match"           
	1         =  "665 person match"              
	2         =  "Non-interview 665 matched to"  
	3         =  "Match not enough data"         
;
VALUE ptot_r  
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
VALUE perlis  
	1         =  "Below low-income level"        
	2         =  "100 - 124 percent of the low-" 
	3         =  "125 - 149 percent of the low-" 
	4         =  "150 and above the low-income"  
;
VALUE mcare   
	0         =  "NIU (children under 15)"       
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE mcaid   
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE champ   
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hi_yn   
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hiown   
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hiemp   
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hipaid  
	0         =  "Not in universe"               
	1         =  "All"                           
	2         =  "Part"                          
	3         =  "None"                          
;
VALUE wrk_ck  
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE penplan 
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE penincl 
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE cov_gh  
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE cov_hi  
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE ch_mc   
	0         =  "Not child's record"            
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE ch_hi   
	0         =  "Not child's record"            
	1         =  "Covered by person in household"
	2         =  "Covered by person outside of"  
	3         =  "Not covered"                   
;
VALUE aprrp   
	0         =  "No change"                     
	2         =  "Blank to value"                
	3         =  "Value to value"                
;
VALUE apparent
	0         =  "No change"                     
	2         =  "Blank to value"                
	3         =  "Value to value"                
;
VALUE apage   
	0         =  "No change"                     
	4         =  "Allocated"                     
;
VALUE apmaritl
	0         =  "No change"                     
	4         =  "Allocated"                     
;
VALUE apspouse
	0         =  "No change"                     
	2         =  "Blank to value"                
	3         =  "Value to value"                
;
VALUE apsex   
	0         =  "No change"                     
	4         =  "Allocated"                     
;
VALUE apvet   
	0         =  "No change"                     
	4         =  "Allocated"                     
;
VALUE aphga   
	0         =  "No change"                     
	4         =  "Allocated"                     
;
VALUE aplfsr  
	0         =  "No change or children or armed"
	4         =  "Allocated"                     
;
VALUE aphrs   
	0         =  "No change or children or armed"
	4         =  "Allocated"                     
;
VALUE apwhyabs
	0         =  "No change or children or armed"
	4         =  "Allocated"                     
;
VALUE appayabs
	0         =  "No change or children or armed"
	4         =  "Allocated"                     
;
VALUE apclswkr
	0         =  "No change or children or armed"
	4         =  "Allocated"                     
;
VALUE apnlflj 
	0         =  "No change or children or armed"
	4         =  "Allocated"                     
;
VALUE apuslhrs
	0         =  "No change or children or armed"
	4         =  "Allocated"                     
;
VALUE aphrlywk
	0         =  "No change or children or armed"
	4         =  "Allocated"                     
;
VALUE prwernal
	0         =  "Not allocated"                 
	1         =  "Allocated"                     
;
VALUE prhernal
	0         =  "Not allocated"                 
	1         =  "Allocated"                     
;
VALUE apunmem 
	0         =  "No change or children or armed"
	4         =  "Allocated"                     
;
VALUE apuncov 
	0         =  "No change or children or armed"
	4         =  "Allocated"                     
;
VALUE apenrlw 
	0         =  "No change or children or armed"
	4         =  "Allocated"                     
;
VALUE aphscol 
	0         =  "No change or children or armed"
	4         =  "Allocated"                     
;
VALUE apftpt  
	0         =  "No change or children or armed"
	4         =  "Allocated"                     
;
VALUE i_ernyn 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_ernval
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_wsyn  
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_wsval 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_seyn  
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_seval 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_frmyn 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_frmval
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_ucyn  
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_ucval 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_wcyn  
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_wctyp 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_wcval 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_ssyn  
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_ssval 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_ssiyn 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_ssival
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_pawyn 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_pawtyp
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_pawval
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_pawmo 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_vetyn 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_vettyp
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_vetval
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_vetqva
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_suryn 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_sursca
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_surscb
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_survla
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_survlb
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_dissca
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_disscb
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_dishp 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_discs 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_disyn 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE toi_val 
	0         =  "Not topcoded"                  
	1         =  "Topcoded"                      
;
VALUE i_disvla
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_disvlb
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_retyn 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_retsca
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_retscb
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_retvla
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_retvlb
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_intyn 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_intval
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_divyn 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_divval
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_rntyn 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_rntval
	0         =  "Not in universe"               
	1         =  "Allocated"                     
	2         =  "Not allocated"                 
;
VALUE i_edyn  
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_edtypa
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_edtypb
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_oedval
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_cspyn 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_cspval
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_almyn 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_almval
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_finyn 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_finval
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_oival 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_nwlook
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_nwlkwk
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_rsnnot
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_losewk
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_lkweek
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_lkstr 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_pyrsn 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_phmemp
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_hrswk 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_hrchk 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_ptyn  
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_ptwks 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_ptrsn 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_ljcw  
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_indus 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_occup 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_workyn
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_wtemp 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_wkswk 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_wkchk 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_ernsrc
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_noemp 
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_mig2l 
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
VALUE i_penpla
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_peninc
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_mig1l 
	0         =  "NIU, or not changed."          
	1         =  "Assigned from householder."    
	2         =  "Assigned from spouse"          
	3         =  "Assign from mother"            
	4         =  "Assign from father"            
	5         =  "Allocated from matrix mob"     
;
VALUE p_mvcare
	0         =  "None"                          
;
VALUE p_mvcaid
	0         =  "None"                          
;
VALUE emcontrb
	0         =  "None"                          
;
VALUE filestat
	1         =  "Joint, both <65"               
	2         =  "Joint, one <65 &  one 65+"     
	3         =  "Joint, both 65+"               
	4         =  "Head of household"             
	5         =  "Single"                        
	6         =  "Nonfiler"                      
;
VALUE dep_stat
	0         =  "Not a dependent"               
;
VALUE ctc_crd 
	0         =  "None"                          
;
VALUE eit_cred
	0         =  "None"                          
;
VALUE actc_crd
	0         =  "None"                          
;
VALUE fica    
	0         =  "None"                          
;
VALUE fed_ret 
	0         =  "None"                          
;
VALUE agi     
	0         =  "None or not in universe"       
;
VALUE cap_gain
	0         =  "None"                          
;
VALUE cap_loss
	0         =  "None"                          
;
VALUE tax_inc 
	0         =  "None"                          
;
VALUE marg_tax
	0         =  "None"                          
;
VALUE pemlr   
	0         =  "NIU"                           
	1         =  "Employed - at work"            
	2         =  "Employed - absent"             
	3         =  "Unemployed - on layoff"        
	4         =  "Unemployed - looking"          
	5         =  "Not in labor force - retired"  
	6         =  "Not in labor force - disabled" 
	7         =  "Not in labor force - other"    
;
VALUE pruntype
	0         =  "NIU"                           
	1         =  "Job loser/on layoff"           
	2         =  "Other job loser"               
	3         =  "Temporary job ended"           
	4         =  "Job leaver"                    
	5         =  "Re-entrant"                    
	6         =  "New-entrant"                   
;
VALUE prwkstat
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
VALUE prptrea 
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
VALUE prdisc  
	0         =  "NIU"                           
	1         =  "Discouraged worker"            
	2         =  "Conditionally interested"      
	3         =  "Not available"                 
;
VALUE prcow1l 
	0         =  "NIU"                           
	1         =  "Federal govt"                  
	2         =  "State govt"                    
	3         =  "Local govt"                    
	4         =  "Private (incl. self-employed"  
	5         =  "Self-employed, unincorp."      
	6         =  "Without pay"                   
;
VALUE prpertyp
	1         =  "Child household member"        
	2         =  "Adult civilian household member"
	3         =  "Adult Armed Forces household"  
;
VALUE peabsrsn
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
VALUE peio1cow
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
VALUE prnlfsch
	0         =  "NIU"                           
	1         =  "In school"                     
	2         =  "Not in school"                 
;
VALUE pehruslt
	-4        =  "Hours vary"                    
	-1        =  "NIU - adult civilian"          
	0         =  "NIU - children or Armed Forces"
;
VALUE peinusyr
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
	18        =  "2002-2005"                     
;
VALUE prcitshp
	1         =  "Native, born in the United"    
	2         =  "Native, born in Puerto Rico or"
	3         =  "Native, born abroad of American"
	4         =  "Foreign born, U.S. citizen by" 
	5         =  "Foreign born, not a citizen of"
;
VALUE pxnatvty
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
VALUE perrp   
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
VALUE i_mig3l 
	0         =  "NIU, or not changed."          
	1         =  "State and below assigned"      
	2         =  "County and below assigned"     
	3         =  "MCD and below assigned"        
	4         =  "Place only"                    
	5         =  "County in New York City"       
;
VALUE hi      
	0         =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE hityp   
	0         =  "NIU"                           
	1         =  "Family plan"                   
	2         =  "Self-only"                     
;
VALUE dephi   
	0         =  "NIU"                           
	1         =  "Yes"                           
;
VALUE hilin1l 
	0         =  "NIU"                           
;
VALUE hilin2l 
	0         =  "NIU"                           
;
VALUE paid    
	0         =  "NIU"                           
	1         =  "All"                           
	2         =  "Part"                          
	3         =  "None"                          
;
VALUE hiout   
	0         =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE priv    
	0         =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE prityp  
	0         =  "NIU"                           
	1         =  "Family plan"                   
	2         =  "Self-only"                     
;
VALUE depriv  
	0         =  "No or NIU"                     
	1         =  "Yes"                           
;
VALUE pilin1l 
	0         =  "NIU"                           
;
VALUE pilin2l 
	0         =  "NIU"                           
;
VALUE pout    
	0         =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE out     
	0         =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE care    
	0         =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE caid    
	0         =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE mon     
	0         =  "NIU"                           
;
VALUE oth     
	0         =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE otyp_1l 
	0         =  "No"                            
	1         =  "Yes"                           
;
VALUE otyp_2l 
	0         =  "No"                            
	1         =  "Yes"                           
;
VALUE otyp_3l 
	0         =  "No"                            
	1         =  "Yes"                           
;
VALUE otyp_4l 
	0         =  "No"                            
	1         =  "Yes"                           
;
VALUE otyp_5l 
	0         =  "No"                            
	1         =  "Yes"                           
;
VALUE othstper
	0         =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE othstypa
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
VALUE hea     
	0         =  "NIU"                           
	1         =  "Excellent"                     
	2         =  "Very good"                     
	3         =  "Good"                          
	4         =  "Fair"                          
	5         =  "Poor"                          
;
VALUE i_hi    
	0         =  "No"                            
	1         =  "Allocated"                     
;
VALUE i_dephi 
	0         =  "No"                            
	1         =  "Allocated"                     
;
VALUE i_paid  
	0         =  "No"                            
	1         =  "Allocated"                     
;
VALUE i_hiout 
	0         =  "No"                            
	1         =  "Allocated"                     
;
VALUE i_priv  
	0         =  "No"                            
	1         =  "Allocated"                     
;
VALUE i_depriv
	0         =  "No"                            
	1         =  "Allocated"                     
;
VALUE i_pout  
	0         =  "No"                            
	1         =  "Allocated"                     
;
VALUE i_out   
	0         =  "No"                            
	1         =  "Allocated"                     
;
VALUE i_care  
	0         =  "No"                            
	1         =  "Allocated"                     
	2         =  "Logical imputed"               
;
VALUE i_caid  
	0         =  "No"                            
	1         =  "Allocated"                     
	2         =  "Logical imputed"               
;
VALUE i_mon   
	0         =  "No"                            
	1         =  "Allocated"                     
;
VALUE i_oth   
	0         =  "No"                            
	1         =  "Allocated"                     
	2         =  "Logical imputed"               
;
VALUE i_otyp  
	0         =  "No"                            
	1         =  "Allocated"                     
	2         =  "Logical imputed"               
;
VALUE i_ostper
	0         =  "No"                            
	1         =  "Allocated"                     
;
VALUE i_ostyp 
	0         =  "No"                            
	1         =  "Allocated"                     
;
VALUE i_hea   
	0         =  "No"                            
	1         =  "Allocated"                     
;
VALUE ssi_val 
	0         =  "None or not in universe"       
;
VALUE ws_val  
	0         =  "None or not in universe"       
;
VALUE se_val  
	0         =  "None or not in universe"       
;
VALUE ihsflg  
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE tsurvala
	0         =  "Not topcoded"                  
	1         =  "Topcoded"                      
;
VALUE tsurvalb
	0         =  "Not topcoded"                  
	1         =  "Topcoded"                      
;
VALUE tdisvala
	0         =  "Not topcoded"                  
	1         =  "Topcoded"                      
;
VALUE tdisvalb
	0         =  "Not topcoded"                  
	1         =  "Topcoded"                      
;
VALUE tretvala
	0         =  "Not topcoded"                  
	1         =  "Topcoded"                      
;
VALUE tretvalb
	0         =  "Not topcoded"                  
	1         =  "Topcoded"                      
;
VALUE tint_val
	0         =  "Not topcoded"                  
	1         =  "Topcoded"                      
;
VALUE tdiv_val
	0         =  "Not topcoded"                  
	1         =  "Topcoded"                      
;
VALUE trnt_val
	0         =  "Not topcoded"                  
	1         =  "Topcoded"                      
;
VALUE ted_val 
	0         =  "Not topcoded"                  
	1         =  "Topcoded"                      
;
VALUE tcsp_val
	0         =  "Not topcoded"                  
	1         =  "Topcoded"                      
;
VALUE talm_val
	0         =  "Not topcoded"                  
	1         =  "Topcoded"                      
;
VALUE tfin_val
	0         =  "Not topcoded"                  
	1         =  "Topcoded"                      
;
VALUE nxtres  
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
	17        =  "Other reasons"                 
;
VALUE i_nxtres
	0         =  "NIU, or not changed"           
	1         =  "Assigned from householder"     
	2         =  "Assigned from spouse or mother"
	3         =  "Allocated from matrix"         
;
VALUE frm_val 
	0         =  "None or not in universe"       
;
VALUE tranyn  
	0         =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE tranyna 
	0         =  "Not imputed or NIU"            
	1         =  "Imputed"                       
;
VALUE ccayn   
	0         =  "NIU"                           
	1         =  "Yes"                           
	2         =  "no"                            
;
VALUE ccayna  
	0         =  "Not imputed or NIU"            
	1         =  "Imputed"                       
;
VALUE paidccyn
	0         =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE paidcyna
	0         =  "Not imputed or NIU"            
	1         =  "Imputed"                       
;
VALUE ahiper  
	0         =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE iahiper 
	0         =  "Not imputed OR NIU"            
	1         =  "NIU"                           
;
VALUE ahityp6l
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
VALUE iahityp 
	0         =  "Not imputed OR NIU"            
	1         =  "NIU"                           
;
VALUE pchip   
	0         =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE i_pchip 
	0         =  "Not imputed or NIU"            
	1         =  "Imputed"                       
;
VALUE resnss1l
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
VALUE resnss2l
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
VALUE resnssa 
	0         =  "Not imputed or not in universe"
	1         =  "Imputed"                       
;
VALUE resnssia
	0         =  "NIU"                           
	1         =  "Disabled (adult or child)"     
	2         =  "Blind (adult or child)"        
	3         =  "On behalf of a disabled child" 
	4         =  "On behalf of a blind child"    
	5         =  "Other (adult or child)"        
;
VALUE resnssib
	0         =  "NIU"                           
	1         =  "Disabled (adult or child)"     
	2         =  "Blind (adult or child)"        
	3         =  "On behalf of a disabled child" 
	4         =  "On behalf of a blind child"    
	5         =  "Other (adult or child)"        
;
VALUE resnssix
	0         =  "Not imputed or not in universe"
	1         =  "Imputed"                       
;
VALUE ssikidyn
	0         =  "NIU"                           
	1         =  "Received SSI"                  
	2         =  "Did not receive SSI"           
;
VALUE ssikdyna
	0         =  "Not imputed or not in universe"
	1         =  "Imputed"                       
;
VALUE sskidyn 
	0         =  "NIU"                           
	1         =  "Received SS"                   
	2         =  "Did not receive SS"            
;
VALUE sskidyna
	0         =  "Not imputed or not in universe"
	1         =  "Imputed"                       
;
VALUE jcyn    
	0         =  "NIU"                           
	1         =  "Attended a job search program" 
	2         =  "Did not"                       
;
VALUE jcyna   
	0         =  "Not imputed or not in universe"
	1         =  "Imputed"                       
;
VALUE jryn    
	0         =  "NIU"                           
	1         =  "Attended job readiness"        
	2         =  "Did not attend"                
;
VALUE jryna   
	0         =  "Not imputed or not in universe"
	1         =  "Imputed"                       
;
VALUE jtyn    
	0         =  "NIU"                           
	1         =  "Attended a training program to"
	2         =  "Did not attend"                
;
VALUE jtyna   
	0         =  "Not imputed or not in universe"
	1         =  "Imputed"                       
;
VALUE schoolyn
	0         =  "NIU"                           
	1         =  "Attended GED classes or"       
	2         =  "Did not attend"                
;
VALUE scholyna
	0         =  "Not imputed or not in universe"
	1         =  "Imputed"                       
;
VALUE wicyn   
	0         =  "NIU"                           
	1         =  "Received WIC"                  
	2         =  "Did not receive WIC"           
;
VALUE wicyna  
	0         =  "Not imputed or not in universe"
	1         =  "Imputed"                       
;
VALUE comsrvyn
	0         =  "NIU"                           
	1         =  "Participated in work programs" 
	2         =  "Did not participate"           
;
VALUE cmsrvyna
	0         =  "Not imputed or not in universe"
	1         =  "Imputed"                       
;
VALUE industry
	0         =  "Not in universe or children"   
;
VALUE occup   
	0         =  "Not in universe or children"   
;
/****PT****
VALUE fedtax_bc
	0         =  "None"                          
;
VALUE fedtax_ac
	0         =  "None"                          
;
VALUE statetax_b
	0         =  "None"                          
;
VALUE statetax_a
	0         =  "None"                          
;
*****/
VALUE m5g_cbst
	0         =  "NIU, nonmover"                 
	1         =  "CBSA"                          
	2         =  "non CBSA"                      
	3         =  "Abroad"                        
	4         =  "Not identifiable"              
;
VALUE m5g_dscp
	0         =  "NIU (under 5 years old,"       
	1         =  "Principal city of a CBSA"      
	2         =  "Balance of a CBSA"             
	3         =  "Non-metro"                     
	4         =  "Abroad"                        
	5         =  "Not identified"                
;
VALUE m5gsame 
	0         =  "NIU"                           
	1         =  "Yes (nonmover)"                
	2         =  "No, difference house in U.S."  
	3         =  "No, outside the U.S. (mover)"  
;
VALUE m5g_reg 
	0         =  "Not in universe under 5 years" 
	1         =  "Northeast"                     
	2         =  "Midwest"                       
	3         =  "South"                         
	4         =  "West"                          
	5         =  "Abroad"                        
;
VALUE m5g_st  
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
VALUE m5g_div 
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
VALUE m5g_mtra
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
VALUE m5g_mtrc
	1         =  "Nonmover"                      
	2         =  "Same county"                   
	3         =  "Different county, same state"  
	4         =  "Different state, same division"
	5         =  "Different division, same region"
	6         =  "Different region"              
	7         =  "Abroad"                        
	8         =  "Not in universe (children under"
;
VALUE m5g_mtrd
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
VALUE i_m5g1l 
	0         =  "NIU, or not changed."          
	1         =  "Assigned from householder."    
	2         =  "Assigned from spouse"          
	3         =  "Assign from mother"            
	4         =  "Assign from father"            
	5         =  "Allocated from matrix mob"     
;
VALUE i_m5g2l 
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
VALUE i_m5g3l 
	0         =  "NIU, or not changed."          
	1         =  "State and below assigned"      
	2         =  "County and below assigned"     
	3         =  "MCD and below assigned"        
	4         =  "Place only"                    
	5         =  "County in New York City"       
;



run;
