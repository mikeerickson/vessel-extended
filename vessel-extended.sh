#!/usr/bin/env bash

# Colors used for status updates
ESC_SEQ="\x1b["
COL_RESET=${ESC_SEQ}"39;49;00m"
COL_RED=${ESC_SEQ}"0;31m"
COL_CYAN=${ESC_SEQ}"0;36m"
COL_YELLOW=${ESC_SEQ}"0;33m"

VESSEL_VERSION="3.0.2-extended-2019.03.10"

# show vessel patched version
if [[ "$1" == "version" || "$1" == "--version" || "$1" == "-V" ]]; then
    printf "\n$COL_CYAN 🚧 Vessel Extended v$VESSEL_VERSION $COL_RESET\n"
    exit 0;
fi

# show environment variables
if [[ "$1" == "vars" || "$1" == "env" ]]; then
    printf "\n$COL_CYAN"
    printf "App Container Environment Variables\n"
    printf "===================================\n"
    printf "\n$COL_YELLOW"
    docker-compose exec app env
    printf "$COL_RESET"
    exit 0;
fi

# rebuild images and restart service
if [ "$1" == "rebuild" ]; then
    $COMPOSE down
    docker image rm vessel/app
    docker image rm vessel/node
    # docker image rm ubuntu
    docker-compose build
    $COMPOSE up -d
fi

if [[ "$1" == "mysql" || "$1" == "db" ]]; then
    ./vessel exec mysql mysql -u$DB_USERNAME -p$DB_PASSWORD -h$DB_HOST
fi

 if [[ "$1" == "mycli" || "$1" == "dbcli" ]]; then
    if [ -e /usr/local/bin/mycli ]
    then
        mycli -u$DB_USERNAME -p$DB_PASSWORD -P$MYSQL_PORT -hlocalhost
    else
        printf "\n$COL_RED  🚫  MyCLI not installed\n $COL_RESET"
        printf "$COL_CYAN Please visit https://www.mycli.net/ for installation instructions\n\n $COL_RESET"
    fi
 fi

# directory listing
if [ "$1" == "dir" ]; then
    $COMPOSE exec app ls -la --color=always
    exit 0;
fi
