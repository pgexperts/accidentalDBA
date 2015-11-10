#!/bin/bash

ARCHIVEDIR=/var/lib/postgresql/wal_archive
WALFROM=$1
WALDEST=$2
NOARCHIVEFILE=/etc/postgresql/9.4/main/NOARCHIVING

# See whether we want all archiving off
test -f ${NOARCHIVEFILE} && exit 0

rsync --quiet --archive ${WALFROM} ${ARCHIVEDIR}/${WALDEST}
if [ $? -ne 0 ]; then
        exit 1
fi

exit 0