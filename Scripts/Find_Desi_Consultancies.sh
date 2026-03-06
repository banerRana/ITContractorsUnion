#!/bin/bash

IFS=,
PSQL_PAGER=''

states='Alabama:AL,Alaska:AK,Arizona:AZ,Arkansas:AR,California:CA,Colorado:CO,Connecticut:CT,Delaware:DE,Florida:FL,Georgia:GA,Hawaii:HI,Idaho:ID,Illinois:IL,Indiana:IN,Iowa:IA,Kansas:KS,Kentucky:KY,Louisiana:LA,Maine:ME,Maryland:MD,Massachusetts:MA,Michigan:MI,Minnesota:MN,Mississippi:MS,Missouri:MO,Montana:MT,Nebraska:NE,Nevada:NV,New Hampshire:NH,New Jersey:NJ,New Mexico:NM,New York:NY,North Carolina:NC,North Dakota:ND,Ohio:OH,Oklahoma:OK,Oregon:OR,Pennsylvania:PA,Rhode Island:RI,South Carolina:SC,South Dakota:SD,Tennessee:TN,Texas:TX,Utah:UT,Vermont:VT,Virginia:VA,Washington:WA,West Virginia:WV,Wisconsin:WI,Wyoming:WY'

run_query () {

q="
select
	count(EMPLOYER_NAME) OVER (partition by upper(EMPLOYER_ADDRESS1)) as count,
	EMPLOYER_NAME,
	EMPLOYER_ADDRESS1,
	EMPLOYER_CITY,
	EMPLOYER_STATE
	from desiconsultancies
	where EMPLOYER_STATE = '$abbr'
	and NAICS_CODE like '541%'
	group by EMPLOYER_NAME, EMPLOYER_ADDRESS1, EMPLOYER_STATE, EMPLOYER_CITY
	order by count desc, EMPLOYER_NAME asc;
"
/usr/local/pgsql/bin/psql -A -d lca_data -c "$q" > ../Investigation/$fname"_Desi_Consultancy.csv"

}

for state in $states
do
	name=`echo "$state" | cut -d: -f1`
	abbr=`echo "$state" | cut -d: -f2`
	fname=`echo "$name" | tr -d ' '`

	run_query
done
