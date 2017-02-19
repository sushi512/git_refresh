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

collapse (sum) comm (min) year (max) end, by(donor crscode)
gsort + donor - comm
drop if donor==donor[_n-15]
order donor crscode com year end

further adding some code here and deleting some on top of this section

Adding yet more code.



