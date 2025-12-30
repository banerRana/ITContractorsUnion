#!/bin/bash

IFS=,
PSQL_PAGER=''

states='Alabama:AL,Alaska:AK,Arizona:AZ,Arkansas:AR,California:CA,Colorado:CO,Connecticut:CT,Delaware:DE,Florida:FL,Georgia:GA,Hawaii:HI,Idaho:ID,Illinois:IL,Indiana:IN,Iowa:IA,Kansas:KS,Kentucky:KY,Louisiana:LA,Maine:ME,Maryland:MD,Massachusetts:MA,Michigan:MI,Minnesota:MN,Mississippi:MS,Missouri:MO,Montana:MT,Nebraska:NE,Nevada:NV,New Hampshire:NH,New Jersey:NJ,New Mexico:NM,New York:NY,North Carolina:NC,North Dakota:ND,Ohio:OH,Oklahoma:OK,Oregon:OR,Pennsylvania:PA,Rhode Island:RI,South Carolina:SC,South Dakota:SD,Tennessee:TN,Texas:TX,Utah:UT,Vermont:VT,Virginia:VA,Washington:WA,West Virginia:WV,Wisconsin:WI,Wyoming:WY'

run_query () {

q="select
CASE_NUMBER,
JOB_TITLE, 
EMPLOYER_NAME,
SECONDARY_ENTITY_BUSINESS_NAME,
EMPLOYER_POC_EMAIL,
EMPLOYER_POC_PHONE,
EMPLOYER_POC_FIRST_NAME,
EMPLOYER_POC_LAST_NAME,
WORKSITE_ADDRESS1,
WORKSITE_ADDRESS2,
WORKSITE_CITY,
WORKSITE_COUNTY,
LAWFIRM_NAME_BUSINESS_NAME,
EMPLOYER_ADDRESS1,
EMPLOYER_ADDRESS2,
EMPLOYER_CITY,
EMPLOYER_STATE,
EMPLOYER_POSTAL_CODE,
BEGIN_DATE,
END_DATE,
TOTAL_WORKER_POSITIONS,
SOC_CODE,
H_1B_DEPENDENT

from LCA_Disclosure_Data_2022To2025Q4

where
WORKSITE_STATE = '$abbr'

order by 
SECONDARY_ENTITY_BUSINESS_NAME,
EMPLOYER_NAME,
WORKSITE_COUNTY;"

/usr/local/pgsql/bin/psql -A -d lca_data -c "$q" > ../H1B_Jobs_By_State/$fname"_H1B_Jobs.csv"
/usr/local/pgsql/bin/psql -H -d lca_data -c "$q" > ../H1B_Jobs_By_State/$fname"_H1B_Jobs.html"
/usr/local/pgsql/bin/psql -x -d lca_data -c "$q" > ../H1B_Jobs_By_State/$fname"_H1B_Jobs.txt"

}

for state in $states
do
	name=`echo "$state" | cut -d: -f1`
	abbr=`echo "$state" | cut -d: -f2`
	fname=`echo "$name" | tr -d ' '`

	run_query
done

# Files Larger Than 100M Are Too Big For GitHub Without Git LFS
bigfiles="Illinois_H1B_Jobs.txt,California_H1B_Jobs.csv,Washington_H1B_Jobs.html,NewJersey_H1B_Jobs.txt,Washington_H1B_Jobs.txt,NewYork_H1B_Jobs.html,NewYork_H1B_Jobs.txt,Texas_H1B_Jobs.html,Texas_H1B_Jobs.txt,California_H1B_Jobs.html,California_H1B_Jobs.txt,NewJersey_H1B_Jobs.html"

for file in $bigfiles
do
	zip -m ../H1B_Jobs_By_State/$file".zip"  ../H1B_Jobs_By_State/$file
done
