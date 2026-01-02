#!/bin/bash
# Import all CSV files from datasets/ into PostgreSQL
# Usage: ./import_csv.sh dbname

DBNAME=$1

for csvfile in ../datasets/*.csv
do
  table_name=$(basename $csvfile .csv)
  echo "Importing $csvfile into table $table_name..."
  psql -d $DBNAME -c "\copy $table_name FROM '$csvfile' DELIMITER ',' CSV HEADER;"
done

echo "All CSV files imported successfully!"
