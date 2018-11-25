#!/bin/bash

declare tools="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"  
declare -r conf_file=/var/lib/postgresql/data/postgresql.conf 
declare -r conf_entry="shared_preload_libraries = 'timescaledb'"

if ! grep -q "$conf_entry" "$conf_file" ; then
    echo "Adding shared_preload_libraries = 'timescaledb' to /var/lib/postgresql/data/postgresql.conf"
    echo "$conf_entry" >> "$conf_file"
    echo "Restarting postgresql"
    pg_ctl restart
fi

if [ -e "${tools}/.setup-CTD_data.sql" ]; then
    psql -v ON_ERROR_STOP=1 \
         --username postgres \
         --dbname ctd_datalake \
         -f "${tools}/.setup-CTD_data.sql" 
fi