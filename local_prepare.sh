#!/bin/bash

mkdir -p $SRC_DIR
mkdir -p $BUILD_DIR
mkdir -p $LOG_DIR

touch $LOG_DIR/kroki-client.log

# Verifica se o Podman está disponível, caso contrário, usa Docker
if command -v podman &> /dev/null
then
    export CONTAINER_TOOL="podman"
else
    export CONTAINER_TOOL="docker"
fi
