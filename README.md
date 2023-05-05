# postgresql-wal-generation-trend
Procedure for tracking Postgresql wal generation to analyze pg_wal switches like Oracle log switch frequency map.

Comparing the number of wal productions gives a lot of clues to understand the workload of the database.


You can add this procedure to crontab or pgcron whatever you use for running hourly. 

For crontab : 
0 * * * * /usr/pgsql-11/bin/psql -d postgres -c 'call count_wal_files_last_hour();'

