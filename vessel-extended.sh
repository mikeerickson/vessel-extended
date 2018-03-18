#!/usr/bin/env bash

VESSEL_VERSION="3.0.1-ext-2018.03.18"

# show vessel patched version
if [[ "$1" == "version" || "$1" == "--version" || "$1" == "-V" ]]; then
    echo "Vessel version $VESSEL_VERSION"
    exit 0;
fi

# show environment variables
if [[ "$1" == "vars" || "$1" == "env" ]]; then
    docker-compose exec app env
    exit 0;
fi

# rebuild images and restart service
if [ "$1" == "rebuild" ]; then
    $COMPOSE down
    docker image rm vessel/app
    # docker image rm ubuntu
    docker-compose build
    $COMPOSE up -d
fi

if [ $1 == "mysql" ]; then
    ./vessel exec mysql mysql -u$DB_USERNAME -p$DB_PASSWORD -h$DB_HOST
fi
