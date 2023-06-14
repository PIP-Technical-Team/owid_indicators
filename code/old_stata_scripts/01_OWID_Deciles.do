***********************************************************************
						//Paths
***********************************************************************
global data Data
global results Output 
***********************************************************************
				// Deciles thresholds // 
***********************************************************************
pip, clear count(all) year(all) popshare(0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1)

keep country_code year welfare_type reporting_level poverty_line headcount
bys country_code year welfare_type reporting_level : gen decile=_n
tab decile 
drop headcount

reshape wide poverty_line , i(country_code year welfare_type reporting_level) j(decile)

forvalues i=1/10{
    ren poverty_line`i' decile_thr`i'
}

save $data/deciles_thr.dta, replace 
