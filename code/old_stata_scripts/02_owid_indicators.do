***********************************************************************
					// OWID Indicators//
***********************************************************************

global data Data
global results Output 

***********************************************************************
					//Poverty Measures //
***********************************************************************

pip, clear povline(1 2.15 3.65 6.85 10 20 30 40) year(all) count(all) // fillgaps /*Specify fillgaps if want interpolated values*/


replace population=population/1000000
gen pop_in_poverty=headcount*population

ren poverty_gap poverty_gap_index

gen total_shortfall=poverty_gap_index*poverty_line*population 
gen avg_shortfall=total_shortfall/ headcount

gen income_gap_ratio=(total_shortfall/headcount)/poverty_line

foreach var in headcount income_gap_ratio poverty_gap_index{
	replace `var'=`var'*100
}

keep country_code year welfare_type reporting_level headcount poverty_line pop_in_poverty poverty_gap_index total_shortfall avg_shortfall income_gap_ratio

//Missing headcount for GNB 1991-drop
drop if headcount==.

tostring poverty_line , gen(l)
replace l="215" if l=="2.15"
replace l="365" if l=="3.65"
replace l="685" if l=="6.85"

foreach value in 1 2.15 3.36 6.85 10 20 30 40{
	replace l="l`value'" if l=="`value'"
}
drop poverty_line 

reshape wide headcount pop_in_poverty poverty_gap_index total_shortfall avg_shortfall income_gap_ratio, i(country_code year welfare_type reporting_level) j(l, string)

save $data/poverty, replace 

********************************************************************
//Indicators already available in pip that don't depend on poverty line 
********************************************************************
pip, clear count(all) year(all)


keep country_code country_name region_code year welfare_time welfare_type reporting_level survey_coverage cpi ppp comparable_spell survey_comparability distribution_type gini mld decile* polarization mean median 


***********************************************************************
// Renaming variables to match OWID//
***********************************************************************

forvalues i=1/10{
	ren decile`i' decile`i'_share
}

***********************************************************************
// Merge with poverty measures:
***********************************************************************
merge 1:1 country_code year welfare_type reporting_level using $data/poverty, nogen 

***********************************************************************
// Merge with shares of population at relative lines:
***********************************************************************

//merge 1:1 country_code year welfare_type reporting_level using median_shares.dta , nogen

***********************************************************************
// Merge with deciles thresholds:
***********************************************************************
merge m:1 country_code year welfare_type reporting_level using $data/deciles_thr.dta , nogen 

***********************************************************************
	// Percentiles ratios //
***********************************************************************

gen palma_ratio = decile10_share/(decile1_share+decile2_share+decile3_share+decile4_share)
gen s80_s20_ratio= (decile9_share+ decile10_share)/(decile1_share+decile2_share)

gen p90_p10_ratio=decile9_thr/decile1_thr
gen p90_p50_ratio=decile9_thr/decile5_thr
gen p50_p10_ratio=decile5_thr/decile1_thr
