#!/bin/bash

# copy kernel options and activate them

cp /setup/postgres/30-postgresql-shm.conf /etc/sysctl.d/
sysctl -p /etc/sysctl.d/30-postgresql-shm.conf

# copy configuration files
cp /setup/postgres/postgresql.conf /etc/postgresql/9.3/main/postgresql.conf
cp /setup/postgres/pg_hba.conf  /etc/postgresql/9.3/main/pg_hba.conf
cp /setup/postgres/pgbouncer.ini /etc/pgbouncer/
cp /setup/postgres/userlist.txt /etc/pgbouncer/
cp /setup/postgres/pgbouncer.default /etc/default/pgbouncer
cp /setup/postgres/.psqlrc /var/lib/postgresql/
chown -R postgres /etc/postgresql
chown -R postgres /etc/pgbouncer

# create the archiving and backup directory
mkdir /var/lib/postgresql/wal_archive
mkdir /var/lib/postgresql/9.3/replica
mkdir /var/lib/postgresql/backup
chown postgres:postgres /var/lib/postgresql/*.*
chmod 700 /var/lib/postgresql/9.3/replica

#link pg_ctl
ln -s /usr/lib/postgresql/9.3/bin/pg_ctl /usr/bin/pg_ctl
ln -s /usr/lib/postgresql/9.3/bin/initdb /usr/bin/initdb

# restart postgresql
service postgresql restart

# load the libdata database
psql -U postgres -f /setup/postgres/libdata.users.sql postgres
pg_restore -e -U postgres -d libdata /setup/postgres/libdata.dump

# stop postgresql
service postgresql stop

exit 0
