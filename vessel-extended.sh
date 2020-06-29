#!/usr/bin/env bash

# Colors used for status updates
ESC_SEQ="\x1b["
COL_RED=${ESC_SEQ}"0;31m"
COL_CYAN=${ESC_SEQ}"0;36m"
COL_YELLOW=${ESC_SEQ}"0;33m"
COL_RESET=${ESC_SEQ}"39;49;00m"

source .env

COMPOSE="docker-compose"

VESSEL_VERSION="4.0.2"
VESSEL_VERSION_EXTENDED="Build 2020.06.29\n   Crafted with love by Codedungeon"

# show vessel patched version
if [[ "$1" == "version" || "$1" == "--version" || "$1" == "-V" ]]; then
    showVersion #this will invoke vessel version command
    printf "🚧$COL_CYAN Vessel Extended v$VESSEL_VERSION $COL_RESET"
    printf "\n$COL_YELLOW   $VESSEL_VERSION_EXTENDED $COL_RESET\n"
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

if [[ "$1" == "mycli" || "$1" == "dbcli" ]]; then
    if [ -e /usr/local/bin/mycli ]
    then
        if test -z "$DB_PASSWORD"
        then
            mycli -u$DB_USERNAME -P$MYSQL_PORT -hlocalhost -D$DB_DATABASE
        else
            mycli -u$DB_USERNAME -p$DB_PASSWORD -P$MYSQL_PORT -hlocalhost -D$DB_DATABASE
        fi
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
