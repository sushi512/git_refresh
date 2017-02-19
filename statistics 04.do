clear
drop _all
clear matrix
version 12.1
set mem 700m
set mat 2000

set more off


***********************************************************************************
local DIR = "C:\Users\andreasfuchs\Dropbox\Forschung\+Other\Tag der Vermögensverwalter\Stata"
cd "`DIR'"
***********************************************************************************
***********************************************************************************

*** Sector
use "work_dataset_CDF.dta", clear
keep if year>=2005 & year<=2011
replace crs_sector_name="Support to NGOs and GOs" if crs_sector_name=="Support to Non-governmental Organizations (NGOs) and Government Organizations"
replace crs_sector_name="Population / Reproductive Health" if crs_sector_name=="Population Policies / Programmes and Reproductive Health"
replace crs_sector_name="Developmental Food Aid" if crs_sector_name=="Developmental Food Aid/Food Security Assistance"

tostring crs_sector, gen(crscode)

replace crscode="110" if crscode=="111" | crscode=="112" | crscode=="113" | crscode=="114"
replace crscode="120" if crscode=="121" | crscode=="122"
replace crscode="150" if crscode=="151" | crscode=="152"
replace crscode="400" if crscode=="410" | crscode=="430"
replace crscode="500" if crscode=="510" | crscode=="520" | crscode=="530"
replace crscode="700" if crscode=="720" | crscode=="730" | crscode=="740"
replace crscode="400" if crscode=="410" | crscode=="430"

graph hbar (sum) usd_defl_m, over(crs_sector_name, sort((sum) usd_defl_m) descending) scale(0.5) ///
	ytitle("Amount in millions of 2009 US$") blabel(bar, format(%12.0f)) scheme(s1color)
