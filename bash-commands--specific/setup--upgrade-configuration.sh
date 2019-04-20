#!/bin/bash

set -euo pipefail

source bash-util/functions.sh

prepare_local_environment ${@}

echo -E "Upgrading taiga-io configuration ..."

export HOST_SERVICE_SERVER_TAIGA_IO_COMMAND=upgrade
export HOST_SERVICE_SERVER_TAIGA_IO_RESTART=no

docker-compose --file ${HOST_PATH_TO_DOCKER_COMPOSE_FILE} \
               up

echo -e "Upgrading taiga-io configuration ... $( __done )"
