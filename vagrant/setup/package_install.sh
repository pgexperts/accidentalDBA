#!/usr/bin/env bash

# install wget
apt-get update
apt-get -y -q install wget

# setup apt-get to pull from apt.postgresql.org
echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

# update apt
apt-get update
apt-get -y -q install pgdg-keyring

# install postgresql and a bunch of accessories
apt-get -y -q install postgresql-9.4
apt-get -y -q install postgresql-server-dev-9.4
apt-get -y -q install postgresql-contrib-9.4
apt-get -y -q install postgresql-plpython-9.4
apt-get -y -q install pgbouncer
apt-get -y -q install libtext-csv-perl libjson-xs-perl
apt-get -y -q install pgbadger
apt-get -y -q install rsync

# install alternate editors and tmux
apt-get -y -q install joe vim nano
apt-get -y -q install tmux

# delete files
apt-get clean

echo ''
echo 'image loaded and ready for tutorial'
echo 'version 0.7 of AccidentalDBA environment'
echo 'with Postgres 9.4 and Docker support'

exit 0