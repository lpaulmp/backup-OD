#! /bin/bash

# MAKE OPEN DIRECTORY DB BACKUP EVERY DAY
path="/Users/pmontero/Documents"
dateDB=`date "+%Y_%m_%d_%H_%M"`
dateDir=`date "+%Y_%m_%H"`

# IF NOT EXIST CREATE A FOLDER PER MONTH 
[ ! -d  $path/OpenDiretoryDB_$dateDir ] && `mkdir -p $path/OpenDiretoryDB_$dateDir`
# BACKUP DB OPEN DIRECTORY
#sudo slapconfig -backupdb $path/OpenDirtoryDB_$dateDir/db_backup_$dateDB >> $path/db_backup.log 2>&1 && \
touch $path/OpenDiretoryDB_$dateDir/db_backup_$dateDB >> $path/db_backup.log 2>&1 && \
echo "db_backup_$dateDB" >> $path/db_backup.log 2>&1
