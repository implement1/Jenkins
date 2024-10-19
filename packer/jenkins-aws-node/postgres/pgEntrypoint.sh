#!/bin/bash

PGDATA=/data
adduser postgres || true
mkdir -p "$PGDATA"
chown -R postgres "$PGDATA"
chmod 700 "$PGDATA"

echo "postgres" > /tmp/pw.txt

su --preserve-environment postgres -c "$(cat <<EOF
	PATH=$PATH
	initdb -D '$PGDATA' --username=postgres --pwfile=/tmp/pw.txt
EOF
)"

cat > /data/postgresql.conf <<EOF
listen_addresses = '*'
max_wal_size = 1GB
min_wal_size = 80MB
log_timezone = 'UTC'
datestyle = 'iso, mdy'
timezone = 'UTC'
default_text_search_config = 'pg_catalog.english'
shared_preload_libraries = 'pg_stat_statements'
pg_stat_statements.max = 10000
pg_stat_statements.track = all
EOF

cat > /data/pg_hba.conf <<EOF
local   all             all                                     trust
host    all             all             127.0.0.1/32            trust
host    all             all             ::1/128                 trust
local   replication     all                                     trust
host    replication     all             127.0.0.1/32            trust
host    replication     all             ::1/128                 trust
host all all 0.0.0.0/0 md5
EOF

su --preserve-environment postgres -c "$(cat <<EOF
	PATH=$PATH
	postgres -D '$PGDATA'
EOF
)"
