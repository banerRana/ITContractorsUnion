#!/bin/bash

# Way Faster To Use sed Than UPDATE In DB
sanitize_data () {
	echo Sanitizing Data Load From $f
	sed -i -E 's_([0-9]{1,2})/([0-9]{1,2})/([0-9]{4})_\3-\1-\2_'g  load.csv
	sed -i -e 's/\t//g' load.csv
	sed -i -e 's/\r//g' load.csv
	sed -i -e "s/'//g" load.csv
	sed -i -e 's/ //g' load.csv # Unicode Non-Breaking Space: \302 \240
	sed -i -e 's/\x9d\xc2//g' load.csv # Unicode U+009D: \302 \235
	sed -i -e 's/¿//g' load.csv
	sed -i -e 's/’//g' load.csv
	sed -i -e 's/”//g' load.csv
	sed -i -e 's/“//g' load.csv
	sed -i -e 's/•//g' load.csv
	sed -i -e 's/…//g' load.csv
	sed -i -e 's/‘//g' load.csv
	sed -i -e 's/:/ /g' load.csv
	sed -i -e 's/=/ /g' load.csv
	sed -i -e 's/`//g' load.csv
	sed -i -e 's/#/ /g' load.csv
	sed -i -e 's/|/ /g' load.csv
	sed -i -e 's/\\"/"/g' load.csv
}

load_data () {
	echo Loading Data From $f
	mariadb test -e "load data local infile '"load.csv"' into table LCA_Disclosure_Data_2022To2025Q4 fields TERMINATED BY ',' ENCLOSED BY '\"' IGNORE 1 LINES;"
}

mariadb test < ./Create_LCA_Data_Table_mdb.sql

for f in ../Data/LCA_Disclosure_Data_FY202{2,3}*
do
	zcat $f > load.csv
	sanitize_data
	load_data
done

mariadb test -e "alter table LCA_Disclosure_Data_2022To2025Q4 add column EMPLOYER_FEIN text AFTER EMPLOYER_PHONE_EXT;"
mariadb test -e "update LCA_Disclosure_Data_2022To2025Q4 set EMPLOYER_FEIN = 'N/A';"

for f in ../Data/LCA_Disclosure_Data_FY2024* ../Data/LCA_Disclosure_Data_FY2025_Q3*
do
	zcat $f > load.csv
	sanitize_data
	load_data
done

mariadb test -e "alter table LCA_Disclosure_Data_2022To2025Q4 add column LAWFIRM_BUSINESS_FEIN text AFTER LAWFIRM_NAME_BUSINESS_NAME;"
mariadb test -e "update LCA_Disclosure_Data_2022To2025Q4 set LAWFIRM_BUSINESS_FEIN = 'N/A';"

f="../Data/LCA_Disclosure_Data_FY2025_Q4.csv.gz"
zcat $f > load.csv
sanitize_data
load_data

echo Sanitizing Data In LCA_Disclosure_Data_2022To2025Q4 Table
mariadb test < Sanitize_Data.sql

echo Normalizing Data In LCA_Disclosure_Data_2022To2025Q4 Table
mariadb test < Normalize_Data.sql

echo "Removing Bad Records And Saving To Bad_Records.txt"
mariadb test -e "select * from LCA_Disclosure_Data_2022To2025Q4 where EMPLOYER_NAME = '' \G;" > Bad_Records.txt
mariadb test -e "DELETE FROM LCA_Disclosure_Data_2022To2025Q4 WHERE EMPLOYER_NAME = '';"

rm load.csv
rm -f sed??????
