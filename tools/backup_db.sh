# backup_db.sh
#!/bin/bash
# Backup PostgreSQL database
# Usage: ./backup_db.sh dbname backup_file.sql

DBNAME=$1
BACKUP_FILE=$2

pg_dump $DBNAME > $BACKUP_FILE
echo "Backup saved to $BACKUP_FILE"
