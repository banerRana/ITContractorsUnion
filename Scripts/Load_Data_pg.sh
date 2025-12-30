#!/bin/bash


sudo rm -f /tmp/load.csv
mariadb test  -e "select * from LCA_Disclosure_Data_2022To2025Q4 INTO OUTFILE '/tmp/load.csv';"
cp /tmp/load.csv .
sed -i -e 's/"//g' load.csv

/usr/local/pgsql/bin/psql -d lca_data < Create_LCA_Data_Table_pg.sql
/usr/local/pgsql/bin/psql -d lca_data -c "\COPY LCA_Disclosure_Data_2022To2025Q4 FROM 'load.csv' DELIMITER E'\t' CSV HEADER QUOTE '\"';"

sudo rm -f /tmp/load.csv
rm load.csv
