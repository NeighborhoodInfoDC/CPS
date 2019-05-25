/**************************************************************************
 Program:  Cps_formats_2018.sas
 Library:  CPS
 Project:  Urban-Greater DC
 Author:   P. Tatian
 Created:  05/25/19
 Version:  SAS 9.4
 Environment:  Local Windows session (desktop)
 GitHub issue:  2
 
 Description:  Create updated CPS formats based on 2018 data download. 

 Modifications:
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( CPS )

proc format library=CPS;

VALUE A_RACE  
	1         =  "White"                         
	2         =  "Black"                         
	3         =  "American Indian, Aleut Eskimo" 
	4         =  "Asian or Pacific Island"       
	5 = "Multiracial (not assignable)"  /** Urban-added category **/
;

VALUE RACE_ETHN
	1 = "White only non-Latino"
	2 = "Black only non-Latino"
	3 = "Latino/Hispanic"
	4 = "American Indian/Alaska Native only non-Latino"
	5 = "Asian only non-Latino"
	6 = "Multiracial/other non-Latino";

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
	1         =  "Husband/wife primary family (neither h"
	2         =  "Husband/wife primary family (husband a"
	3         =  "Unmarried civilian male primary family"
	4         =  "Unmarried civilian female primary fami"
	5         =  "Primary family household - reference p"
	6         =  "Civilian male nonfamily householder"
	7         =  "Civilian female nonfamily householder"
	8         =  "Nonfamily householder household-refere"
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
	3         =  "HU, perm,  in trans. hotel, motel, etc"
	4         =  "HU in rooming house"           
	5         =  "Mobile home or trailer with no permane"
	6         =  "Mobile home or trailer with 1 or more "
	7         =  "HU not specified above Other Unit"
	8         =  "Qtrs not hu in rooming or boarding hou"
	9         =  "Unit not perm in trans. hotel, motel, "
	10        =  "Tent or trailer site"          
	11        =  "Student quarters in college dormitory"
	12        =  "Other not HU"                  
;
VALUE h_typebc	(default=32)
	0         =  "Interviewed, or Type A"        
	1         =  "Vacant - regular"              
	2         =  "Vacant - storage of HHLD furniture"
	3         =  "Temp occ by persons with URE"  
	4         =  "Unfit or to be demolished"     
	5         =  "Under construction, not ready" 
	6         =  "Converted to temp business or storage"
	7         =  "Occ by AF members or persons under 15"
	8         =  "Unocc tent or trailer site"    
	9         =  "Permit granted, construction not start"
	10        =  "Other"                         
	11        =  "Demolished"                    
	12        =  "House or trailer moved"        
	13        =  "Outside segment"               
	14        =  "Converted to perm business or storage"
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
VALUE gestfips	(default=32)
	1         =  "AL"                            
	2         =  "AK"                            
	4         =  "AZ"                            
	5         =  "AR"                            
	6         =  "CA"                            
	8         =  "CO"                            
	9         =  "CT"                            
	10        =  "DE"                            
	11        =  "DC"                            
	12        =  "FL"                            
	13        =  "GA"                            
	15        =  "HI"                            
	16        =  "ID"                            
	17        =  "IL"                            
	18        =  "IN"                            
	19        =  "IA"                            
	20        =  "KS"                            
	21        =  "KY"                            
	22        =  "LA"                            
	23        =  "ME"                            
	24        =  "MD"                            
	25        =  "MA"                            
	26        =  "MI"                            
	27        =  "MN"                            
	28        =  "MS"                            
	29        =  "MO"                            
	30        =  "MT"                            
	31        =  "NE"                            
	32        =  "NV"                            
	33        =  "NH"                            
	34        =  "NJ"                            
	35        =  "NM"                            
	36        =  "NY"                            
	37        =  "NC"                            
	38        =  "ND"                            
	39        =  "OH"                            
	40        =  "OK"                            
	41        =  "OR"                            
	42        =  "PA"                            
	44        =  "RI"                            
	45        =  "SC"                            
	46        =  "SD"                            
	47        =  "TN"                            
	48        =  "TX"                            
	49        =  "UT"                            
	50        =  "VT"                            
	51        =  "VA"                            
	53        =  "WA"                            
	54        =  "WV"                            
	55        =  "WI"                            
	56        =  "WY"                            
;
VALUE gtcbsa  	(default=32)
	0         =  "Non-met or not identified"     
	10500     =  "Albany, GA (Baker, Terrell, and Worth "
	10580     =  "Albany-Schenectady-Troy, NY"   
	10740     =  "Albuquerque, NM"               
	10900     =  "Allentown-Bethlehem-Easton, PA-NJ"
	11020     =  "Altoona, PA"                   
	11100     =  "Amarillo, TX (Armstrong and Carson Cou"
	11300     =  "Anderson, IN"                  
	11340     =  "Anderson, SC"                  
	11460     =  "Ann Arbor, MI"                 
	11500     =  "Anniston-Oxford, AL"           
	11540     =  "Appleton, WI"                  
	11700     =  "Asheville, NC (Haywood and Madison Cou"
	12020     =  "Athens-Clarke County, GA (Oglethorpe C"
	12060     =  "Atlanta-Sandy Springs-Marietta, GA (Ha"
	12100     =  "Atlantic City, NJ"             
	12260     =  "Augusta-Richmond County, GA-SC"
	12420     =  "Austin-Round Rock, TX"         
	12540     =  "Bakersfield, CA"               
	12580     =  "Baltimore-Towson, MD"          
	12940     =  "Baton Rouge, LA"               
	13140     =  "Beaumont-Port Arthur, TX"      
	13380     =  "Bellingham, WA"                
	13460     =  "Bend, OR"                      
	13740     =  "Billings, MT (Carbon County not in sam"
	13780     =  "Binghamton, NY"                
	13820     =  "Birmingham-Hoover, AL"         
	14020     =  "Bloomington, IN (Owen County not in sa"
	14060     =  "Bloomington-Normal IL"         
	14260     =  "Boise City-Nampa, ID (Owyhee County no"
	14460     =  "Boston-Cambridge-Newton, MA-NH"
	14500     =  "Boulder, CO"                   
	14540     =  "Bowling Green, KY"             
	14740     =  "Bremerton-Silverdale, WA"      
	15180     =  "Brownsville-Harlingen, TX"     
	15380     =  "Buffalo-Niagara Falls, NY"     
	15940     =  "Canton-Massillon, OH"          
	15980     =  "Cape Coral-Fort Myers, FL"     
	16300     =  "Cedar Rapids, IA (Benton and Jones Cou"
	16580     =  "Champaign-Urbana, IL (Ford County not "
	16620     =  "Charleston, WV (Clay County not in sam"
	16700     =  "Charleston-North Charleston, SC"
	16740     =  "Charlotte-Gastonia-Concord, NC-SC (Ans"
	16860     =  "Chattanooga, TN-GA"            
	16980     =  "Chicago-Naperville-Joliet, IL-IN-WI (D"
	17020     =  "Chico, CA"                     
	17140     =  "Cincinnati-Middletown, OH-KY-IN (Frank"
	17460     =  "Cleveland-Elyria-Mentor, OH"   
	17660     =  "Coeur d'Alene, ID"             
	17820     =  "Colorado Springs, CO"          
	17860     =  "Columbia, MO (Howard County not in sam"
	17900     =  "Columbia, SC"                  
	17980     =  "Columbus, GA-AL (Harris County, GA and"
	18140     =  "Columbus, OH (Morrow County not in sam"
	18580     =  "Corpus Christi, TX"            
	19100     =  "Dallas-Fort Worth-Arlington, TX (Delta"
	19340     =  "Davenport-Moline-Rock Island, IA-IL"
	19380     =  "Dayton, OH"                    
	19460     =  "Decatur, Al"                   
	19500     =  "Decatur, IL"                   
	19660     =  "Deltona-Daytona Beach-Ormond Beach, FL"
	19740     =  "Denver-Aurora, CO"             
	19780     =  "Des Moines, IA"                
	19820     =  "Detroit-Warren-Livonia, MI"    
	20100     =  "Dover, DE"                     
	20260     =  "Duluth, MN-WI (Carlton County, MN not "
	20500     =  "Durham, NC"                    
	20740     =  "Eau Claire, WI"                
	20940     =  "El Centro, CA"                 
	21340     =  "El Paso, TX"                   
	21500     =  "Erie, PA"                      
	21660     =  "Eugene-Springfield, OR"        
	21780     =  "Evansville, IN-KY (Gibson County, IN a"
	22020     =  "Fargo, ND-MN (MN portion not identifie"
	22140     =  "Farmington, NM"                
	22180     =  "Fayetteville, NC"              
	22220     =  "Fayetteville-Springdale-Rogers, AR-MO "
	22420     =  "Flint, MI"                     
	22460     =  "Florence, AL"                  
	22660     =  "Fort Collins-Loveland, CO"     
	22900     =  "Fort Smith, AR-OK (Oklahoma portion no"
	23020     =  "Fort Walton Beach-Crestview-Destin, FL"
	23060     =  "Fort Wayne, IN"                
	23420     =  "Fresno, CA"                    
	23540     =  "Gainesville, FL (Gilchrist County not "
	24340     =  "Grand Rapids-Wyoming, MI"      
	24540     =  "Greeley, CO"                   
	24580     =  "Green Bay, WI (Oconto County not in sa"
	24660     =  "Greensboro-High Point, NC"     
	24860     =  "Greenville, SC (Laurens and Pickens Co"
	25060     =  "Gulfport-Biloxi, MS (Stone County not "
	25180     =  "Hagerstown-Martinsburg, MD-WV (Berkele"
	25420     =  "Harrisburg-Carlisle, PA"       
	25500     =  "Harrisonburg, VA"              
	25860     =  "Hickory-Morganton-Lenoir, NC (Caldwell"
	26100     =  "Holland-Grand Haven, MI"       
	26180     =  "Honolulu, HI"                  
	26420     =  "Houston-Baytown-Sugar Land, TX"
	26580     =  "Huntington-Ashland, WV-KY-OH (Kentucky"
	26620     =  "Huntsville, AL"                
	26900     =  "Indianapolis, IN"              
	26980     =  "Iowa City, IA (Washington County not i"
	27100     =  "Jackson, MI"                   
	27140     =  "Jackson, MS"                   
	27260     =  "Jacksonville, FL"              
	27340     =  "Jacksonville, NC"              
	27500     =  "Janesville, WI"                
	27740     =  "Johnson City, TN"              
	27780     =  "Johnstown, PA"                 
	27900     =  "Joplin, MO"                    
	28020     =  "Kalamazoo-Portage, MI"         
	28100     =  "Kankakee-Bradley, IL"          
	28140     =  "Kansas City, MO-KS (Franklin, KS; Leav"
	28660     =  "Killeen-Temple-Fort Hood, TX"  
	28700     =  "Kingsport-Bristol, TN-VA (Virginia por"
	28740     =  "Kingston, NY"                  
	28940     =  "Knoxville, TN (Anderson County not in "
	29100     =  "La Crosse, WI-MN (Houston County not i"
	29180     =  "Lafayette, LA"                 
	29340     =  "Lake Charles, LA (Cameron Parish not i"
	29460     =  "Lakeland-Winter Haven, FL"     
	29540     =  "Lancaster, PA"                 
	29620     =  "Lansing-East Lansing, MI"      
	29700     =  "Laredo, TX"                    
	29740     =  "Las Cruces, NM"                
	29820     =  "Las Vegas-Paradise, NV"        
	29940     =  "Lawrence, KS"                  
	30020     =  "Lawton, OK"                    
	30460     =  "Lexington-Fayette, KY"         
	30780     =  "Little Rock-North Little Rock, AR (Per"
	30980     =  "Longview, TX (Rusk and Upshur Counties"
	31100     =  "Los Angeles-Long Beach-Santa Ana, CA"
	31140     =  "Louisville, KY-IN (Washington, IN; Hen"
	31180     =  "Lubbock, TX (Crosby County not in samp"
	31340     =  "Lynchburg, VA (Appomattox and Bedford "
	31420     =  "Macon, GA (Crawford, Monroe, and Twigg"
	31460     =  "Madera, CA"                    
	31540     =  "Madison, WI (Iowa County not in sample"
	32580     =  "McAllen-Edinburg-Pharr, TX"    
	32780     =  "Medford, OR"                   
	32820     =  "Memphis, TN-MS-AR (Arkansas portion no"
	32900     =  "Merced, CA"                    
	33100     =  "Miami-Fort Lauderdale-Miami Beach, FL"
	33140     =  "Michigan City-La Porte, IN"    
	33260     =  "Midland, TX"                   
	33340     =  "Milwaukee-Waukesha-West Allis, WI"
	33460     =  "Minneapolis-St Paul-Bloomington, MN-WI"
	33660     =  "Mobile, AL"                    
	33700     =  "Modesto, CA"                   
	33740     =  "Monroe, LA"                    
	33780     =  "Monroe, MI"                    
	33860     =  "Montgomery, AL"                
	34740     =  "Muskegon-Norton Shores, MI"    
	34820     =  "Myrtle Beach-Conway-North Myrtle Beach"
	34900     =  "Napa, CA"                      
	34940     =  "Naples-Marco Island, FL"       
	34980     =  "Nashville-Davidson-Murfreesboro, TN (C"
	35380     =  "New Orleans-Metairie-Kenner, LA"
	35620     =  "New York-Northern New Jersey-Long Isla"
	35660     =  "Niles-Benton Harbor, MI"       
	36100     =  "Ocala, FL"                     
	36140     =  "Ocean City, NJ"                
	36260     =  "Ogden-Clearfield, UT"          
	36420     =  "Oklahoma City, OK"             
	36500     =  "Olympia, WA"                   
	36540     =  "Omaha-Council Bluffs, NE-IA"   
	36740     =  "Orlando, FL"                   
	36780     =  "Oshkosh-Neenah, WI"            
	37100     =  "Oxnard-Thousand Oaks-Ventura, CA"
	37340     =  "Palm Bay-Melbourne-Titusville, FL"
	37460     =  "Panama City-Lynn Haven, FL"    
	37860     =  "Pensacola-Ferry Pass-Brent, FL"
	37900     =  "Peoria, IL"                    
	37980     =  "Philadelphia-Camden-Wilmington, PA-NJ-"
	38060     =  "Phoenix-Mesa-Scottsdale, AZ"   
	38300     =  "Pittsburgh, PA"                
	38900     =  "Portland-Vancouver-Beaverton, OR-WA (Y"
	38940     =  "Port St. Lucie-Fort Pierce, FL"
	39100     =  "Poughkeepsie-Newburgh-Middletown, NY"
	39140     =  "Prescott, AZ"                  
	39340     =  "Provo-Orem, UT (Juab County not in sam"
	39380     =  "Pueblo, CO"                    
	39460     =  "Punta Gorda, FL"               
	39540     =  "Racine, WI"                    
	39580     =  "Raleigh-Cary, NC"              
	39740     =  "Reading, PA"                   
	39900     =  "Reno-Sparks, NV"               
	40060     =  "Richmond, VA (Cumberland County not in"
	40140     =  "Riverside-San Bernardino-Ontario, CA"
	40220     =  "Roanoke, VA (Craig and Franklin Counti"
	40380     =  "Rochester, NY"                 
	40420     =  "Rockford, IL"                  
	40900     =  "Sacramento--Arden-Arcade-Roseville, CA"
	40980     =  "Saginaw-Saginaw Township North, MI"
	41060     =  "St. Cloud, MN"                 
	41180     =  "St. Louis, MO-IL (Calhoun County, IL n"
	41420     =  "Salem, OR"                     
	41500     =  "Salinas, CA"                   
	41540     =  "Salisbury, MD"                 
	41620     =  "Salt Lake City, UT (Tooele County not "
	41700     =  "San Antonio, TX"               
	41740     =  "San Diego-Carlsbad-San Marcos, CA"
	41860     =  "San Francisco-Oakland-Fremont, CA"
	41940     =  "San Jose-Sunnyvale-Santa Clara, CA"
	42020     =  "San Luis Obispo-Paso Robles, CA"
	42060     =  "Santa Barbara-Santa Maria-Goleta, CA"
	42100     =  "Santa Cruz-Watsonville, CA"    
	42140     =  "Santa Fe, NM"                  
	42220     =  "Santa Rosa-Petaluma, CA"       
	42260     =  "Sarasota-Bradenton-Venice, FL" 
	42340     =  "Savannah, GA"                  
	42540     =  "Scranton-Wilkes-Barre, PA"     
	42660     =  "Seattle-Tacoma-Bellevue, WA"   
	43340     =  "Shreveport-Bossier City, LA"   
	43620     =  "Sioux Falls, SD"               
	43780     =  "South Bend-Mishawaka, IN-MI (Michigan "
	43900     =  "Spartanburg, SC"               
	44060     =  "Spokane, WA"                   
	44100     =  "Springfield, IL"               
	44180     =  "Springfield, MO (Dallas and Polk Count"
	44220     =  "Springfield, OH"               
	44700     =  "Stockton, CA"                  
	45060     =  "Syracuse, NY"                  
	45220     =  "Tallahassee, FL"               
	45300     =  "Tampa-St. Petersburg-Clearwater, FL"
	45780     =  "Toledo, OH (Ottawa County not in sampl"
	45820     =  "Topeka, KS (Jackson and Jefferson Coun"
	45940     =  "Trenton-Ewing, NJ"             
	46060     =  "Tucson, AZ"                    
	46140     =  "Tulsa, OK (Okmulgee County not in samp"
	46220     =  "Tuscaloosa, AL (Greene and Hale Counti"
	46540     =  "Utica-Rome, NY"                
	46660     =  "Valdosta, GA (Lanier County not in sam"
	46700     =  "Vallejo-Fairfield, CA"         
	46940     =  "Vero Beach, FL"                
	47020     =  "Victoria, TX"                  
	47220     =  "Vineland-Millville-Bridgeton, NJ"
	47260     =  "Virginia Beach-Norfolk-Newport News, V"
	47300     =  "Visalia-Porterville, CA"       
	47380     =  "Waco, TX"                      
	47580     =  "Warner Robins, GA"             
	47900     =  "Washington-Arlington-Alexandria, DC-VA"
	47940     =  "Waterloo-Cedar Falls, IA (Grundy Count"
	48140     =  "Wausau, WI"                    
	48620     =  "Wichita, KS"                   
	49180     =  "Winston-Salem, NC"             
	49420     =  "Yakima, WA"                    
	49620     =  "York-Hanover, PA"              
	49660     =  "Youngstown-Warren-Boardman, OH-PA (Pen"
	70750     =  "Bangor, ME"                    
	70900     =  "Barnstable Town, MA"           
	71650     =  "Boston-Cambridge-Quincy, MA-NH"
	71950     =  "Bridgeport-Stamford-Norwalk, CT"
	72400     =  "Burlington-South Burlington, VT"
	72850     =  "Danbury, CT"                   
	73450     =  "Hartford-West Hartford-East Hartford, "
	74500     =  "Leominster-Fitchburg-Gardner, MA"
	75700     =  "New Haven, CT"                 
	76450     =  "Norwich-New London, CT-RI (RI portion "
	76750     =  "Portland-South Portland, ME"   
	77200     =  "Providence-Fall River-Warwick, RI-MA"
	77350     =  "Rochester-Dover, NH-ME (Maine portion "
	78100     =  "Springfield, MA-CT (Connecticut portio"
	78700     =  "Waterbury, CT"                 
	79600     =  "Worcester, MA-CT (Connecticut portion "
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
	0         =  "Not identified or nonmetropolitan"
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
	0         =  "Not in universe (group quarters)"
	1         =  "Primary family"                
	2         =  "Nonfamily householder living alone"
	3         =  "Nonfamily householder living with nonr"
;
VALUE hunder1h	(default=32)
	0         =  "None"                          
;
VALUE htop5pct	(default=32)
	0         =  "Not in universe (group quarters)"
	1         =  "In top 5 percent"              
	2         =  "Not in top 5 percent"          
;
VALUE hpctcut 	(default=32)
	0         =  "Not in universe (group quarters)"
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
	1         =  "Husband/wife primary family (neither h"
	2         =  "Husband/wife primary family (husband a"
	3         =  "Unmarried civilian male primary family"
	4         =  "Unmarried civilian female primary fami"
	5         =  "Primary family household - reference p"
	6         =  "Civilian male nonfamily householder"
	7         =  "Civilian female nonfamily householder"
	8         =  "Nonfamily householder household - refe"
	9         =  "Group quarters with actual families  ("
	10        =  "Group quarters with secondary individu"
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
VALUE hprop_val	(default=32)
	0         =  "Not in universe"               
;
VALUE thprop_val	(default=32)
	0         =  "Not swapped"                   
	1         =  "Topcoded"                      
;
VALUE i_propval	(default=32)
	0         =  "No allocation"                 
	1         =  "Allocated"                     
;
VALUE hrwicyn 	(default=32)
	0         =  "NIU"                           
	1         =  "YES"                           
	2         =  "NO"                            
;
VALUE hfdval  	(default=32)
	0         =  "Not in universe"               
;
VALUE tcare_val	(default=32)
	0         =  "No change"                     
	1         =  "Topcoded"                      
;
VALUE care_val	(default=32)
	-1        =  "Not in universe"               
	0         =  "Not in universe"               
;
VALUE i_careval	(default=32)
	0         =  "No change"                     
	1         =  "Allocated"                     
;
VALUE hpres_mort	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
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
	2         =  "100 - 124 percent of the low-income le"
	3         =  "125 - 149 percent of the low-income le"
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
VALUE fhip_val	(default=32)
	0         =  "Not in Universe"               
;
VALUE fmoop   	(default=32)
	0         =  "Not in Universe"               
;
VALUE fotc_val	(default=32)
	0         =  " Not in Universe"              
;
VALUE fmed_val	(default=32)
	0         =  "Not in Universe"               
;
VALUE i_fhipval	(default=32)
	0         =  "No change"                     
	1         =  "Allocated"                     
;
VALUE precord 	(default=32)
	3         =  "Person record"                 
;
VALUE a_parent	(default=32)
	0         =  "None"                          
;
VALUE a_exprrp	(default=32)
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
	12        =  "Nonrel. of ref. person w/o rels."
	13        =  "Unmarried partner w/rels."     
	14        =  "Unmarried partner w/o rels."   
	15        =  "Housemate/roommate w/rels."    
	16        =  "Housemate/roommate w/o rels."  
	17        =  "Roomer/boarder w/rels."        
	18        =  "Roomer/boarder w/o rels."      
;
VALUE a_age   	(default=32)
	80        =  "80-84 years of age"            
	85        =  "85+ years of age"              
;
VALUE a_maritl	(default=32)
	1         =  "Married - civilian spouse present"
	2         =  "Married - AF spouse present"   
	3         =  "Married - spouse absent (exc. separate"
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
	39        =  "High school graduate - high school dip"
	40        =  "Some college but no degree"    
	41        =  "Associate degree in college - occupati"
	42        =  "Associate degree in college - academic"
	43        =  "Bachelor's degree (for example: BA,AB,"
	44        =  "Master's degree (for example: MA,MS,ME"
	45        =  "Professional school degree (for exampl"
	46        =  "Doctorate degree (for example: PHD,EDD"
;
VALUE prdtrace	(default=32)
	1         =  "White only"                    
	2         =  "Black only"                    
	3         =  "American Indian,Alaskan Native only (A"
	4         =  "Asian only"                    
	5         =  "Hawaiian/Pacific Islander only (HP)"
	6         =  "White-Black"                   
	7         =  "White-AI"                      
	8         =  "White-Asian"                   
	9         =  "White-HP"                      
	10        =  "Black-AI"                      
	11        =  "Black-Asian"                   
	12        =  "Black-HP"                      
	13        =  "AI-Asian"                      
	14        =  "AI-HP"                         
	15        =  "Asian-HP"                      
	16        =  "White-Black-AI"                
	17        =  "White-Black-Asian"             
	18        =  "White-Black-HP"                
	19        =  "White-AI-Asian"                
	20        =  "White-AI-HP"                   
	21        =  "White-Asian-HP"                
	22        =  "Black-AI-Asian"                
	23        =  "White-Black-AI-Asian"          
	24        =  "White-AI-Asian-HP"             
	25        =  "Other 3 race comb."            
	26        =  "Other 4 or 5 race comb."       
;
VALUE p_stat  	(default=32)
	1         =  "Civilian 15+"                  
	2         =  "Armed Forces"                  
	3         =  "Children 0 - 14"               
;
VALUE prpertyp	(default=32)
	1         =  "Child household member"        
	2         =  "Adult civilian household member"
	3         =  "Adult Armed Forces household member"
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
	4         =  "Dominican"                     
	5         =  "Salvadoran"                    
	6         =  "Central American, (exc. Salv)" 
	7         =  "South American"                
	8         =  "Other Hispanic"                
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
	4         =  "Other relative (primary family)"
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
	3         =  "Under 18 years, single (never married)"
	4         =  "Under 18 years, ever married"  
	5         =  "18 years and over"             
	6         =  "Other relative of householder" 
	7         =  "Nonrelative of householder"    
	8         =  "Secondary individual"          
;
VALUE famrel  	(default=32)
	1         =  "Reference person of family"    
	2         =  "Spouse of reference person"    
	3         =  "Under 18 years, single (never married)"
	4         =  "Under 18 years, ever married"  
	5         =  "18 years and over"             
	6         =  "Grandchild of reference person"
	7         =  "Under 18 years, single (never married)"
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
	6         =  "Spouse of subfamily reference person"
	7         =  "Not in a subfamily"            
	8         =  "Head of a subfamily"           
	9         =  "Not in a subfamily"            
	10        =  "Reference person of subfamily" 
	11        =  "Spouse of subfamily reference person"
	12        =  "Not in a subfamily"            
	23        =  "Reference person of subfamily" 
	24        =  "Child of a subfamily"          
	25        =  "Not in a subfamily"            
	26        =  "Reference person of subfamily" 
	27        =  "Spouse of subfamily reference person"
	28        =  "Not used"                      
	29        =  "Not in a subfamily"            
	30        =  "Reference person of a subfamily"
	31        =  "Not in a subfamily"            
	32        =  "Reference person of subfamily" 
	33        =  "Spouse of subfamily reference person"
	34        =  "Not in a subfamily"            
	35        =  "Reference person of subfamily" 
	36        =  "Child of subfamily reference person"
	37        =  "Not in a subfamily"            
	38        =  "Reference person of subfamily" 
	39        =  "Spouse of subfamily reference person"
	40        =  "Not in a subfamily"            
	41        =  "Reference person of a subfamily"
	42        =  "Not in a subfamily"            
	43        =  "Reference person of subfamily" 
	44        =  "Spouse of subfamily reference person"
	45        =  "Not in a subfamily"            
	46        =  "Reference person of unrelated subfamil"
	47        =  "Spouse of unrelated subfamily referenc"
	48        =  "Child < 18, single (never-married) of "
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
	4         =  "Vietnam Era (August 1964 to April 1975"
	5         =  "February 1955 to July 1964"    
	6         =  "Korean War (July 1950 to January 1955)"
	7         =  "January 1947 to June 1950"     
	8         =  "World War II (December 1941 to Decembe"
	9         =  "November 1941 or earlier"      
;
VALUE peafwhnb	(default=32)
	-1        =  "Not in universe"               
	1         =  "September 2001 or later"       
	2         =  "August 1990 to August 2001"    
	3         =  "May 1975 to July 1990"         
	4         =  "Vietnam Era (August 1964 to April 1975"
	5         =  "February 1955 to July 1964"    
	6         =  "Korean War (July 1950 to January 1955)"
	7         =  "January 1947 to June 1950"     
	8         =  "World War II (December 1941 to Decembe"
	9         =  "November 1941 or earlier"      
;
VALUE peafwhnc	(default=32)
	-1        =  "Not in universe"               
	1         =  "September 2001 or later"       
	2         =  "August 1990 to August 2001"    
	3         =  "May 1975 to July 1990"         
	4         =  "Vietnam Era (August 1964 to April 1975"
	5         =  "February 1955 to July 1964"    
	6         =  "Korean War (July 1950 to January 1955)"
	7         =  "January 1947 to June 1950"     
	8         =  "World War II (December 1941 to Decembe"
	9         =  "November 1941 or earlier"      
;
VALUE peafwhnd	(default=32)
	-1        =  "Not in universe"               
	1         =  "September 2001 or later"       
	2         =  "August 1990 to August 2001"    
	3         =  "May 1975 to July 1990"         
	4         =  "Vietnam Era (August 1964 to April 1975"
	5         =  "February 1955 to July 1964"    
	6         =  "Korean War (July 1950 to January 1955)"
	7         =  "January 1947 to June 1950"     
	8         =  "World War II (December 1941 to Decembe"
	9         =  "November 1941 or earlier"      
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
	21        =  "2008-2009"                     
	22        =  "2010-2011"                     
	23        =  "2012-2013"                     
	24        =  "2014-2015"                     
	25        =  "2016-2018"                     
;
VALUE prcitshp	(default=32)
	1         =  "Native, born in the United States"
	2         =  "Native, born in Puerto Rico or U.S. ou"
	3         =  "Native, born abroad of American parent"
	4         =  "Foreign born, U.S. citizen by naturali"
	5         =  "Foreign born, not a citizen of the Uni"
;
VALUE fl_665l 	(default=32)
	0         =  "Complete nonresponse to supplement"
	1         =  "Supplement interview"          
	2         =  "Some supplement response but not enoug"
	3         =  "Supplement interview but not enough in"
;
VALUE prdasian	(default=32)
	-1        =  "NIU"                           
	1         =  "Asian Indian"                  
	2         =  "Chinese"                       
	3         =  "Filipino"                      
	4         =  "Japanese"                      
	5         =  "Korean"                        
	6         =  "Vietnamese"                    
	7         =  "Other Asian"                   
;
VALUE pecert1l	(default=32)
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE pecert2l	(default=32)
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE pecert3l	(default=32)
	1         =  "Yes"                           
	2         =  "No"                            
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
	0         =  "Not in universe or children and Armed "
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE a_whyabs	(default=32)
	0         =  "Not in universe or children and Armed "
	1         =  "Own illness"                   
	2         =  "On vacation"                   
	3         =  "Bad weather"                   
	4         =  "Labor dispute"                 
	8         =  "Other"                         
;
VALUE a_payabs	(default=32)
	0         =  "Not in universe or children and Armed "
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
VALUE a_clswkr	(default=32)
	0         =  "Not in universe or children and Armed "
	1         =  "Private"                       
	2         =  "Federal government"            
	3         =  "State government"              
	4         =  "Local government"              
	5         =  "Self-employed-incorporated"    
	6         =  "Self-employed-not incorporated"
	7         =  "Without pay"                   
	8         =  "Never worked"                  
;
VALUE a_wkslk 	(default=32)
	-1        =  "Not in universe"               
	0         =  "Children or Armed Forces"      
;
VALUE a_whenlj	(default=32)
	0         =  "Not in universe or children and Armed "
	1         =  "In last 12 months"             
	2         =  "More than 12 months ago"       
	5         =  "Never worked at all"           
;
VALUE a_nlflj 	(default=32)
	0         =  "Not in universe or children and Armed "
	1         =  "Within a past 12 months"       
	3         =  "More than 12 months ago"       
	7         =  "Never worked"                  
;
VALUE a_wantjb	(default=32)
	0         =  "Not in universe or children and Armed "
	1         =  "Yes"                           
	2         =  "No"                            
	5         =  "February 1955 to July 1964"    
	6         =  "Korean War (July 1950 to January 1955)"
	7         =  "January 1947 to June 1950"     
	8         =  "World War II (December 1941 to Decembe"
	9         =  "November 1941 or earlier"      
;
VALUE prerelg 	(default=32)
	0         =  "Not earnings eligible"         
	1         =  "Earnings eligible"             
;
VALUE a_uslhrs	(default=32)
	-4        =  "Hours vary"                    
	-1        =  "Not in universe"               
	0         =  "None, no hours"                
;
VALUE a_hrlywk	(default=32)
	0         =  "Not in universe or children and Armed "
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE a_hrspay	(default=32)
	0         =  "Not in universe or children and Armed "
;
VALUE a_grswk 	(default=32)
	0         =  "Not in universe or children or Armed F"
;
VALUE a_unmem 	(default=32)
	0         =  "Not in universe or children and Armed "
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE a_uncov 	(default=32)
	0         =  "Not in universe or children and Armed "
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE a_enrlw 	(default=32)
	0         =  "Not in universe or children and Armed "
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE a_hscol 	(default=32)
	0         =  "Not in universe or children and Armed "
	1         =  "High school"                   
	2         =  "College or univ."              
;
VALUE a_ftpt  	(default=32)
	0         =  "Not in universe or children and Armed "
	1         =  "Full time"                     
	2         =  "Part time"                     
;
VALUE a_lfsr  	(default=32)
	0         =  "Children or Armed Forces"      
	1         =  "Working"                       
	2         =  "With job, not at work"         
	3         =  "Unemployed, looking for work"  
	4         =  "Unemployed, on layoff"         
	7         =  "Nilf"                          
;
VALUE a_untype	(default=32)
	0         =  "Not in universe or children and Armed "
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
	3         =  "Part-time for economic reasons, usuall"
	4         =  "Part-time for non-economic reasons, us"
	5         =  "Part-time for economic reasons, usuall"
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
	0         =  "Not in universe or children and Armed "
	1         =  "In universe"                   
;
VALUE a_ftlf  	(default=32)
	0         =  "Not in universe or children and Armed "
	1         =  "In universe"                   
;
VALUE a_mjind 	(default=32)
	0         =  "Not in universe, or children"  
	1         =  "Agriculture, forestry, fishing, and hu"
	2         =  "Mining"                        
	3         =  "Construction"                  
	4         =  "Manufacturing"                 
	5         =  "Wholesale and retail trade"    
	6         =  "Transportation and utilities"  
	7         =  "Information"                   
	8         =  "Financial activities"          
	9         =  "Professional and business services"
	10        =  "Educational and health services"
	11        =  "Leisure and hospitality"       
	12        =  "Other services"                
	13        =  "Public administration"         
	14        =  "Armed Forces"                  
;
VALUE a_dtind 	(default=32)
	0         =  "Not in universe or children or Armed F"
;
VALUE a_mjocc 	(default=32)
	0         =  "Not in universe or children"   
	1         =  "Management, business, and financial oc"
	2         =  "Professional and related occupations"
	3         =  "Service occupations"           
	4         =  "Sales and related occupations" 
	5         =  "Office and administrative support occu"
	6         =  "Farming, fishing, and forestry occupat"
	7         =  "Construction and extraction occupation"
	8         =  "Installation, maintenance, and repair "
	9         =  "Production occupations"        
	10        =  "Transportation and material moving occ"
	11        =  "Armed Forces"                  
;
VALUE a_dtocc 	(default=32)
	0         =  "Not in universe for children or Armed "
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
VALUE prcow1l 	(default=32)
	0         =  "NIU"                           
	1         =  "Federal govt"                  
	2         =  "State govt"                    
	3         =  "Local govt"                    
	4         =  "Private (incl. self-employed incorp.)"
	5         =  "Self-employed, unincorp."      
	6         =  "Without pay"                   
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
	3         =  "PT for economic reasons, usually FT"
	4         =  "PT for non-economic reasons, usually F"
	5         =  "Not at work, usually FT"       
	6         =  "PT hrs, usually PT for economic reason"
	7         =  "PT hrs, usually PT for non-economic"
	8         =  "FT hours, usually PT for economic reas"
	9         =  "FT hours, usually PT for non-economic "
	10        =  "Not at work, usually part-time"
	11        =  "Unemployed FT"                 
	12        =  "Unemployed PT"                 
;
VALUE prptrea 	(default=32)
	-1        =  "NIU - adult civilian"          
	0         =  "NIU - children or Armed Forces"
	1         =  "Usually FT - slack work/business condi"
	2         =  "Usually FT - seasonal work"    
	3         =  "Usually FT - job started/ended during "
	4         =  "Usually FT - vacation/personal day"
	5         =  "Usually FT - own illness/injury/medica"
	6         =  "Usually FT - holiday (religious or leg"
	7         =  "Usually FT - child care problems"
	8         =  "Usually FT - other fam/pers obligation"
	9         =  "Usually FT - labor dispute"    
	10        =  "Usually FT - weather affected job"
	11        =  "Usually FT - school/training"  
	12        =  "Usually FT - civic/military duty"
	13        =  "Usually FT - other reason"     
	14        =  "Usually PT - slack work/business condi"
	15        =  "Usually PT - PT could only find PT wor"
	16        =  "Usually PT - seasonal work"    
	17        =  "Usually PT - child care problems"
	18        =  "Usually PT - other fam/pers obligation"
	19        =  "Usually PT - health/medical limitation"
	20        =  "Usually PT - school/training"  
	21        =  "Usually PT - retired/social security l"
	22        =  "Usually PT - workweek <35 hours"
	23        =  "Usually PT - other reason"     
;
VALUE prdisc  	(default=32)
	0         =  "NIU"                           
	1         =  "Discouraged worker"            
	2         =  "Conditionally interested"      
	3         =  "Not available"                 
;
VALUE peabsrsn	(default=32)
	-1        =  "NIU - adult civilian"          
	0         =  "NIU - children or Armed Forces"
	2         =  "Slack work/business conditions"
	4         =  "Vacation/personal days"        
	5         =  "Own illness/injury/medical problems"
	6         =  "Child care problems"           
	7         =  "Other family/personal obligation"
	8         =  "Maternity/paternity leave"     
	9         =  "Labor dispute"                 
	10        =  "Weather affected job"          
	11        =  "School/training"               
	12        =  "Civic/military duty"           
	13        =  "Does not work in the business" 
	14        =  "Other (specify)"               
;
VALUE prnlfsch	(default=32)
	0         =  "NIU"                           
	1         =  "In school"                     
	2         =  "Not in school"                 
;
VALUE pehruslt	(default=32)
	-4        =  "Hours vary"                    
	-1        =  "NIU - adult civilian"          
	0         =  "NIU - children or Armed Forces or no h"
;
VALUE workyn  	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE wrk_ck  	(default=32)
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
	1         =  "Private (includes self-employment, inc"
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
VALUE ljcw    	(default=32)
	0         =  "Not in universe"               
	1         =  "Private"                       
	2         =  "Federal"                       
	3         =  "State"                         
	4         =  "Local"                         
	5         =  "Self employed incorporated, yes"
	6         =  "Self employed incorporated, no or farm"
	7         =  "Without pay"                   
;
VALUE industry	(default=32)
	0         =  "Not in universe or children"   
;
VALUE occup   	(default=32)
	0         =  "Not in universe or children"   
;
VALUE noemp   	(default=32)
	0         =  "Not in universe"               
	1         =  "Under 10"                      
	2         =  "10 - 49"                       
	3         =  "50 - 99"                       
	4         =  "100 - 499"                     
	5         =  "500 - 999"                     
	6         =  "1000+"                         
;
VALUE nxtres  	(default=32)
	0         =  "NIU"                           
	1         =  "Change in marital status"      
	2         =  "To establish own household"    
	3         =  "Other family reason"           
	4         =  "New job or job transfer"       
	5         =  "To look for work or lost job"  
	6         =  "To be closer to work/easier commute"
	7         =  "Retired"                       
	8         =  "Other job-related reason"      
	9         =  "Wanted to own home, not rent"  
	10        =  "Wanted new or better house/apartment"
	11        =  "Wanted better neighborhood"    
	12        =  "Cheaper housing"               
	13        =  "Foreclosure/eviction"          
	14        =  "Other housing reason"          
	15        =  "Attend/leave college"          
	16        =  "Change of climate"             
	17        =  "Health reasons"                
	18        =  "Natural disaster"              
	19        =  "Other reason"                  
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
	2         =  "No, difference house in U.S. (mover)"
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
	0         =  "NIU (under 1 year old, nonmover)"
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
	0         =  "Not in universe (under 1 year old)"
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
	8         =  "Not in universe (Children under 1 year"
	9         =  "Not identifiable"              
;
VALUE mig_mtrc	(default=32)
	1         =  "Nonmover"                      
	2         =  "Same county"                   
	3         =  "Different county, same state"  
	4         =  "Different state, same division"
	5         =  "Different division, same region"
	6         =  "Different region"              
	7         =  "Abroad"                        
	8         =  "Not in universe (children under 1 yr o"
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
	9         =  "Not in universe (children under 1 yr o"
;
VALUE ern_yn  	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
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
VALUE ern_val 	(default=32)
	0         =  "None or not in universe"       
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
VALUE ws_val  	(default=32)
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
VALUE se_val  	(default=32)
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
VALUE frm_val 	(default=32)
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
VALUE sskidyn 	(default=32)
	0         =  "NIU"                           
	1         =  "Received SS"                   
	2         =  "Did not receive SS"            
;
VALUE ssi_yn  	(default=32)
	0         =  "Not in universe"               
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE ssi_val 	(default=32)
	0         =  "None or not in universe"       
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
VALUE ssikidyn	(default=32)
	0         =  "NIU"                           
	1         =  "Received SSI"                  
	2         =  "Did not receive SSI"           
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
	4         =  "Us military retirement disability"
	5         =  "State or local gov't employee disabili"
	6         =  "US railroad retirement disability"
	7         =  "Accident or disability insurance"
	8         =  "Black Lung miner's disability" 
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
	4         =  "State or local government retirement"
	5         =  "US railroad retirement"        
	6         =  "Regular payments from annuities or pai"
	7         =  "Regular payments from IRA, KEOGH, or 4"
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
	9         =  "State disability payments (worker's co"
	10        =  "Disability payments (own insurance)"
	11        =  "Unemployment compensation"     
	12        =  "Strike benefits"               
	13        =  "Annuities or paid up insurance policie"
	14        =  "Not income"                    
	15        =  "Longest job"                   
	16        =  "Wages or salary"               
	17        =  "Nonfarm self-employment"       
	18        =  "Farm self-employment"          
	19        =  "Anything else"                 
	20        =  "Alimony"                       
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
	2         =  "100 - 124 percent of the low-income le"
	3         =  "125 - 149 percent of the low-income le"
	4         =  "150 and above the low-income level"
;
VALUE pov_univ	(default=32)
	0         =  "Person NIU"                    
	1         =  "Person in poverty universe"    
;
VALUE wicyn   	(default=32)
	0         =  "NIU"                           
	1         =  "Received WIC"                  
	2         =  "Did not receive WIC"           
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
VALUE emcontrb	(default=32)
	0         =  "None"                          
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
	3         =  "TRICARE"                       
	4         =  "CHAMPVA"                       
	5         =  "VA health care"                
	6         =  "Military health care"          
	7         =  "State Children's Health Insurance Prog"
	8         =  "Indian health service"         
	9         =  "Other government health care"  
	10        =  "Employer/union-provided (policyholder)"
	11        =  "Employer/union-provided (as dependent)"
	12        =  "Privately purchased (policyholder)"
	13        =  "Privately purchased (as dependent)"
	14        =  "Plan of someone outside the household"
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
VALUE ihsflg  	(default=32)
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE ahiper  	(default=32)
	0         =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE ahityp6l	(default=32)
	0         =  "NIU"                           
	1         =  "Medicare"                      
	2         =  "Medicaid"                      
	3         =  "Tricare"                       
	4         =  "CAMPVA ('CHAMPVA' is the civilian heal"
	5         =  "VA health care"                
	6         =  "Military health care"          
	7         =  "Children's health insurance program (c"
	8         =  "Indian health service"         
	9         =  "Other government health care"  
	10        =  "Employer/union-provided (policyholder)"
	11        =  "Employer/union-provided (as dependent)"
	12        =  "Privately purchased (policyholder)"
	13        =  "Privately purchased (as dependent)"
	14        =  "Plan of someone outside the household"
	15        =  "Other"                         
;
VALUE pchip   	(default=32)
	0         =  "NIU"                           
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
	2         =  "Covered by person outside of household"
	3         =  "Not covered"                   
;
VALUE marg_tax	(default=32)
	0         =  "None"                          
;
VALUE ctc_crd 	(default=32)
	0         =  "None"                          
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
VALUE tax_inc 	(default=32)
	0         =  "None"                          
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
VALUE paidccyn	(default=32)
	0         =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE paidcyna	(default=32)
	0         =  "Not imputed or NIU"            
	1         =  "Imputed"                       
;
VALUE moop    	(default=32)
	0         =  " NIU"                          
;
VALUE phip_val	(default=32)
	0         =  " NIU"                          
;
VALUE potc_val	(default=32)
	0         =  " NIU"                          
;
VALUE pmed_val	(default=32)
	0         =  " NIU"                          
;
VALUE chsp_val	(default=32)
	0         =  " NIU"                          
;
VALUE chsp_yn 	(default=32)
	0         =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE chelsew_yn	(default=32)
	0         =  "NIU"                           
	1         =  "Yes"                           
	2         =  "No"                            
;
VALUE pxcert1l	(default=32)
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
	22        =  "Don't know to longitudinal value"
	23        =  "Refused to longitudinal value" 
	30        =  "Value to allocated value long" 
	31        =  "Blank to allocated value long" 
	32        =  "Don't know to allocated value long"
	33        =  "Refused to allocated value long"
	40        =  "Value to allocated value"      
	41        =  "Blank to allocated value"      
	42        =  "Don't know to allocated value" 
	43        =  "Refused to allocated value"    
	50        =  "Value to blank"                
	52        =  "Don't know to blank"           
	53        =  "Refused to blank"              
;
VALUE axrrp   	(default=32)
	0         =  "No change"                     
	2         =  "Blank to value"                
	3         =  "Value to value"                
;
VALUE axage   	(default=32)
	0         =  "No change"                     
	4         =  "Allocated"                     
;
VALUE axmaritl	(default=32)
	0         =  "No change"                     
	4         =  "Allocated"                     
;
VALUE axspouse	(default=32)
	0         =  "No change"                     
	2         =  "Blank to value"                
	3         =  "Value to value"                
;
VALUE axsex   	(default=32)
	0         =  "No change"                     
	4         =  "Allocated"                     
;
VALUE axhga   	(default=32)
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
	22        =  "Don't know to longitudinal value"
	23        =  "Refused to longitudinal value" 
	30        =  "Value to allocated value long" 
	31        =  "Blank to allocated value long" 
	32        =  "Don't know to allocated value long"
	33        =  "Refused to allocated value long"
	40        =  "Value to allocated value"      
	41        =  "Blank to allocated value"      
	42        =  "Don't know to allocated value" 
	43        =  "Refused to allocated value"    
	50        =  "Value to blank"                
	52        =  "Don't know to blank"           
	53        =  "Refused to blank"              
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
	22        =  "Don't know to longitudinal value"
	23        =  "Refused to longitudinal value" 
	30        =  "Value to allocated value long" 
	31        =  "Blank to allocated value long" 
	32        =  "Don't know to allocated value long"
	33        =  "Refused to allocated value long"
	40        =  "Value to allocated value"      
	41        =  "Blank to allocated value"      
	42        =  "Don't know to allocated value" 
	43        =  "Refused to allocated value"    
	50        =  "Value to blank"                
	52        =  "Don't know to blank"           
	53        =  "Refused to blank"              
;
VALUE pxcohab 	(default=32)
	-1        =  "Not allocated"                 
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
	22        =  "Don't know to Longitudinal value"
	23        =  "Refused to Longitudinal value" 
	30        =  "Value to Allocated value long."
	31        =  "Blank to Allocated value long."
	32        =  "Don't know to Allocated value long."
	33        =  "Refused to Allocated value long."
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
	22        =  "Don't know to Longitudinal value"
	23        =  "Refused to Longitudinal value" 
	30        =  "Value to Allocated value long."
	31        =  "Blank to Allocated value long."
	32        =  "Don't know to Allocated value long."
	33        =  "Refused to Allocated value long."
	40        =  "Value to Allocated value"      
	41        =  "Blank to Allocated value"      
	42        =  "Don't know to Allocated value" 
	43        =  "Refused to Allocated value"    
	50        =  "Value to Blank"                
	52        =  "Don't know to Blank"           
	53        =  "Refused to Blank"              
;
VALUE pxafever	(default=32)
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
	22        =  "Don't know to longitudinal value"
	23        =  "Refused to longitudinal value" 
	30        =  "Value to allocated value long" 
	31        =  "Blank to allocated value long" 
	32        =  "Don't know to allocated value long"
	33        =  "Refused to allocated value long"
	40        =  "Value to allocated value"      
	41        =  "Blank to allocated value"      
	42        =  "Don't know to allocated value" 
	43        =  "Refused to allocated value"    
	50        =  "Value to blank"                
	52        =  "Don't know to blank"           
	53        =  "Refused to blank"              
;
VALUE pxafwhna	(default=32)
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
	22        =  "Don't know to longitudinal value"
	23        =  "Refused to longitudinal value" 
	30        =  "Value to allocated value long" 
	31        =  "Blank to allocated value long" 
	32        =  "Don't know to allocated value long"
	33        =  "Refused to allocated value long"
	40        =  "Value to allocated value"      
	41        =  "Blank to allocated value"      
	42        =  "Don't know to allocated value" 
	43        =  "Refused to allocated value"    
	50        =  "Value to blank"                
	52        =  "Don't know to blank"           
	53        =  "Refused to blank"              
;
VALUE pxdisear	(default=32)
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
	22        =  "Don't know to longitudinal value"
	23        =  "Refused to longitudinal value" 
	30        =  "Value to allocated value long" 
	31        =  "Blank to allocated value long" 
	32        =  "Don't know to allocated value long"
	33        =  "Refused to allocated value long"
	40        =  "Value to allocated value"      
	41        =  "Blank to allocated value"      
	42        =  "Don't know to allocated value" 
	43        =  "Refused to allocated value"    
	50        =  "Value to blank"                
	52        =  "Don't know to blank"           
	53        =  "Refused to blank"              
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
	22        =  "Don't know to longitudinal value"
	23        =  "Refused to longitudinal value" 
	30        =  "Value to allocated value long."
	31        =  "Blank to allocated value long."
	32        =  "Don't know to allocated value long."
	33        =  "Refused to allocated value long."
	40        =  "Value to allocated value"      
	41        =  "Blank to allocated value"      
	42        =  "Don't know to allocated value" 
	43        =  "Refused to allocated value"    
	50        =  "Value to blank"                
	52        =  "Don't know to blank"           
	53        =  "Refused to blank"              
;
VALUE prwernal	(default=32)
	0         =  "Not allocated"                 
	1         =  "Allocated"                     
;
VALUE prhernal	(default=32)
	0         =  "Not allocated"                 
	1         =  "Allocated"                     
;
VALUE axhrs   	(default=32)
	0         =  "No change or children or armed forces"
	4         =  "Allocated"                     
;
VALUE axwhyabs	(default=32)
	0         =  "No change or children or armed forces"
	4         =  "Allocated"                     
;
VALUE axpayabs	(default=32)
	0         =  "No change or children or armed forces"
	4         =  "Allocated"                     
;
VALUE axclswkr	(default=32)
	0         =  "No change or children or armed forces"
	4         =  "Allocated"                     
;
VALUE axnlflj 	(default=32)
	0         =  "No change or children or armed forces"
	4         =  "Allocated"                     
;
VALUE axuslhrs	(default=32)
	0         =  "No change or children or armed forces"
	4         =  "Allocated"                     
;
VALUE axhrlywk	(default=32)
	0         =  "No change or children or armed forces"
	4         =  "Allocated"                     
;
VALUE axunmem 	(default=32)
	0         =  "No change or children or armed forces"
	4         =  "Allocated"                     
;
VALUE axuncov 	(default=32)
	0         =  "No change or children or armed forces"
	4         =  "Allocated"                     
;
VALUE axenrlw 	(default=32)
	0         =  "No change or children or armed forces"
	4         =  "Allocated"                     
;
VALUE axhscol 	(default=32)
	0         =  "No change or children or armed forces"
	4         =  "Allocated"                     
;
VALUE axftpt  	(default=32)
	0         =  "No change or children or armed forces"
	4         =  "Allocated"                     
;
VALUE axlfsr  	(default=32)
	0         =  "No change or children or armed forces"
	4         =  "Allocated"                     
;
VALUE i_workyn	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_wtemp 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
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
VALUE i_wkswk 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_wkchk 	(default=32)
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
VALUE i_noemp 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_nxtres	(default=32)
	0         =  "NIU, or not changed"           
	1         =  "Assigned from householder"     
	2         =  "Assigned from spouse"          
	3         =  "Assigned from mother"          
	4         =  "Assigned from father"          
	5         =  "Allocated from matrix"         
;
VALUE i_mig1l 	(default=32)
	0         =  "NIU, or not changed."          
	1         =  "Assigned from householder."    
	2         =  "Assigned from spouse"          
	3         =  "Assign from mother"            
	4         =  "Assign from father"            
	5         =  "Allocated from matrix mob"     
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
VALUE i_mig3l 	(default=32)
	0         =  "NIU, or not changed."          
	1         =  "State and below assigned"      
	2         =  "County and below assigned"     
	3         =  "MCD and below assigned"        
	4         =  "Place only"                    
	5         =  "County in New York City assigned"
;
VALUE i_disyn 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_ernyn 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_ernsrc	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_ernval	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_retscb	(default=32)
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
	3         =  "Statistically matched at Level 1"
	4         =  "Statistically matched at Level 2"
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
VALUE resnssa 	(default=32)
	0         =  "Not imputed or not in universe"
	1         =  "Imputed"                       
;
VALUE i_ssiyn 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE sskidyna	(default=32)
	0         =  "Not imputed or not in universe"
	1         =  "Imputed"                       
;
VALUE i_ssival	(default=32)
	0         =  "No allocation"                 
	1         =  "Allocated from hot deck"       
	2         =  "Allocated a loss"              
	3         =  "Statistically matched at Level 1"
	4         =  "Statistically matched at Level 2"
;
VALUE resnssix	(default=32)
	0         =  "Not imputed or not in universe"
	1         =  "Imputed"                       
;
VALUE i_pawyn 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE ssikdyna	(default=32)
	0         =  "Not imputed or not in universe"
	1         =  "Imputed"                       
;
VALUE i_pawtyp	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_pawmo 	(default=32)
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
VALUE i_vetyn 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_vettyp	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_vetqva	(default=32)
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
	3         =  "Statistically matched at Level 1"
	4         =  "Statistically matched at Level 2"
;
VALUE i_survlb	(default=32)
	0         =  "No allocation"                 
	1         =  "Allocated from hot deck"       
	2         =  "Allocated a loss"              
	3         =  "Statistically matched at Level 1"
	4         =  "Statistically matched at Level 2"
;
VALUE i_dishp 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_discs 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_dissca	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_disscb	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_disvla	(default=32)
	0         =  "No allocation"                 
	1         =  "Allocated from hot deck"       
	2         =  "Allocated a loss"              
	3         =  "Statistically matched at Level 1"
	4         =  "Statistically matched at Level 2"
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
	3         =  "Statistically matched at Level 1"
	4         =  "Statistically matched at Level 2"
;
VALUE i_cspyn 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_cspval	(default=32)
	0         =  "No allocation"                 
	1         =  "Allocated from hot deck"       
	2         =  "Allocated a loss"              
	3         =  "Statistically matched at Level 1"
	4         =  "Statistically matched at Level 2"
;
VALUE i_finyn 	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_finval	(default=32)
	0         =  "No allocation"                 
	1         =  "Allocated from hot deck"       
	2         =  "Allocated a loss"              
	3         =  "Statistically matched at Level 1"
	4         =  "Statistically matched at Level 2"
;
VALUE i_oival 	(default=32)
	0         =  "No allocation"                 
	1         =  "Allocated from hot deck"       
	2         =  "Allocated a loss"              
	3         =  "Statistically matched at Level 1"
	4         =  "Statistically matched at Level 2"
;
VALUE wicyna  	(default=32)
	0         =  "Not imputed or not in universe"
	1         =  "Imputed"                       
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
VALUE iahiper 	(default=32)
	0         =  "Not imputed OR NIU"            
	1         =  "Imputed"                       
;
VALUE iahityp 	(default=32)
	0         =  "Not imputed OR NIU"            
	1         =  "NIU"                           
;
VALUE i_pchip 	(default=32)
	0         =  "Not imputed or NIU"            
	1         =  "Imputed"                       
;
VALUE i_penpla	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_peninc	(default=32)
	0         =  "No change or children"         
	1         =  "Allocated"                     
;
VALUE i_phipval	(default=32)
	0         =  "Valid response or niu"         
	1         =  "Allocated at family level (non-elderly"
	2         =  "Allocated at individual level (elderly"
	3         =  "Missing in family with at least one va"
	4         =  "Value changed to $0 because all family"
	5         =  "Logical imputation equal to $0 for eld"
;
VALUE i_potcval	(default=32)
	0         =  "No"                            
	1         =  "Allocated"                     
;
VALUE i_pmedval	(default=32)
	0         =  "No"                            
	1         =  "Allocated"                     
;
VALUE i_chspval	(default=32)
	0         =  "No"                            
	1         =  "Allocated"                     
;
VALUE i_chspyn	(default=32)
	0         =  "No"                            
	1         =  "Allocated"                     
;
VALUE i_chelsewyn	(default=32)
	0         =  "No"                            
	1         =  "Allocated"                     
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
VALUE tfin_val	(default=32)
	0         =  "Not topcoded"                  
	1         =  "Topcoded"                      
;
VALUE toi_val 	(default=32)
	0         =  "Not topcoded"                  
	1         =  "Topcoded"                      
;
VALUE tphip_val	(default=32)
	0         =  "Not topcoded"                  
	1         =  "Topcoded"                      
;
VALUE tpotc_val	(default=32)
	0         =  "Not topcoded"                  
	1         =  "Topcoded"                      
;
VALUE tpmed_val	(default=32)
	0         =  "Not topcoded"                  
	1         =  "Topcoded"                      
;
VALUE tchsp_val	(default=32)
	0         =  "Not topcoded"                  
	1         =  "Topcoded"                      
;

run;

proc catalog catalog=CPS.formats;
  contents;
quit;

run;
