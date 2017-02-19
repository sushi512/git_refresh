cd "C:\Users\andreasfuchs\Dropbox\Forschung\+Other\Tag der Vermögensverwalter\stata"
* By partner country
insheet using "aiddata2-1_thin.csv", clear
gen end=year
keep if year>=2005
collapse (sum) comm (min) year (max) end, by(donor recipient)
gsort + donor - comm
drop if donor==donor[_n-15]

* By sector
insheet using "aiddata2-1_thin.csv", clear
gen end=year
keep if year>=2005
drop if coalesced_purpose_code<10000
tostring coalesced_purpose_code, replace
gen crscode=substr(coalesced_purpose_code,1,3)
replace crscode="110" if crscode=="111" | crscode=="112" | crscode=="113" | crscode=="114"
replace crscode="120" if crscode=="121" | crscode=="122"
replace crscode="150" if crscode=="151" | crscode=="152"
replace crscode="310" if crscode=="311" | crscode=="312" | crscode=="313"
replace crscode="320" if crscode=="321" | crscode=="322" | crscode=="323"
replace crscode="400" if crscode=="410" | crscode=="430"
replace crscode="500" if crscode=="510" | crscode=="520" | crscode=="530"
replace crscode="700" if crscode=="720" | crscode=="730" | crscode=="740"
replace crscode="400" if crscode=="410" | crscode=="430"
collapse (sum) comm (min) year (max) end, by(donor crscode)
gsort + donor - comm
drop if donor==donor[_n-15]
order donor crscode com year end



