Overview
========

Its a simple bash script to make a backup of Open Directory from Mac Server app. It create a folder per month and save the backup there.
Cron Jobs adjust the period of execution of the script.

The follow steps help to create the a job and ajust to your preferences

* `$ EDITOR=vim/nano/emacs crontab -e`
* ` 00 06 * * *  /your/path/script/`  Will run the job one time per day at 6 am

Also will need a control of population of files - with a cronjob which will remove files olders for more than year.

* `* * * 1 *     /bin/bash find /path/of/db_back/OpenDirtoryDB_* -mtime +360 -exec rm -rf {} \;` 
