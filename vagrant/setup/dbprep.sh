#!/bin/bash

# copy configuration files
cp /setup/postgres/postgresql.conf /etc/postgresql/9.4/main/postgresql.conf
cp /setup/postgres/pg_hba.conf  /etc/postgresql/9.4/main/pg_hba.conf
cp /setup/postgres/pgbouncer.ini /etc/pgbouncer/
cp /setup/postgres/userlist.txt /etc/pgbouncer/
cp /setup/postgres/pgbouncer.default /etc/default/pgbouncer
cp /setup/postgres/.psqlrc /var/lib/postgresql/
cp -r /setup/pgbench /var/lib/postgresql/
cp -r /setup/postgres/archive /var/lib/postgresql/
cp /setup/postgres/archive_logs.sh /var/lib/postgresql/archive/
cp /setup/postgres/explain_quarterly_report.sql /var/lib/postgresql/archive/
chmod +x /var/lib/postgresql/archive/archive_logs.sh
chmod +x /var/lib/postgresql/pgbench/*.sh
chown -R postgres /etc/postgresql
chown -R postgres /etc/pgbouncer

# create the archiving and backup directory
mkdir /var/lib/postgresql/wal_archive
mkdir /var/lib/postgresql/9.4/replica
mkdir /var/lib/postgresql/backup
chown postgres:postgres /var/lib/postgresql/*.*
chown -R postgres:postgres /var/lib/postgresql
chmod 700 /var/lib/postgresql/9.4/replica

#link pg_ctl
ln -s /usr/lib/postgresql/9.4/bin/pg_ctl /usr/bin/pg_ctl
ln -s /usr/lib/postgresql/9.4/bin/initdb /usr/bin/initdb

# restart postgresql
service postgresql restart

# load the libdata database
psql -U postgres -f /setup/postgres/libdata.users.sql postgres
pg_restore -e -U postgres -d libdata /setup/postgres/libdata.dump

# stop postgresql
service postgresql stop

exit 0
