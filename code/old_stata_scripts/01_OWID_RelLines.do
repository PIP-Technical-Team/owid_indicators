***********************************************************************
						//Paths
***********************************************************************
global data Data
global results Output 

***********************************************************************
//Share of the population living under % of the median
***********************************************************************
pip, clear year(all) count(all) 

// Some countries have missing medians: drop them to run the loop, these should be available in Percentiles file. 
drop if median==. 

//Generate relative lines
foreach share in 40 50 60{
    gen median_`share'=median*`share'/100
}

drop if inlist(country_code, "CHN", "IND", "IDN")

gen coverage="rural" if survey_coverage==1
replace coverage="urban" if survey_coverage==2
replace coverage="national" if survey_coverage==3

keep country_code year coverage welfare_type median_*

// Reshape long //
reshape long median_, i(country_code year welfare_type coverage) j(share)
ren median_ poverty_line 

//query share of population at those values of the line
save $data/lines_to_query.dta, replace 

//query headcounts at values of line --> this is very slow
*Create a file to collect poverty estimates
capture erase $data/query.dta
drop _all
save $data/query.dta, empty

use $data/lines_to_query.dta, clear
count
forvalues row=1/`r(N)' {

// Finds what survey to query
	use $data/lines_to_query.dta , clear
	loc ccc = country_code[`row']
	loc yyy	= year[`row']
	loc pl = poverty_line[`row']
	loc cov=coverage[`row']
// Loads the data at required income value//

	pip, count(`ccc') year(`yyy') povline(`pl') coverage(`cov')  clear 
	
	keep country_code survey_coverage welfare_time year reporting_level poverty_line headcount poverty_gap watts poverty_severity  
	tempfile hc 
	save `hc'
	
	append using $data/query.dta 
	save $data/median_shares.dta, replace 
	}
	
// reshape wide so that we have one obs per country-year-welfare_type-reporting_level