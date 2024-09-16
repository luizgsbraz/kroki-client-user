#!/bin/bash

workdir=$(pwd)/mywork 

export SRC_DIR="$workdir/src"
export BUILD_DIR="$workdir/build"
export LOG_DIR="$workdir/log"

. local_prepare.sh

. processa.sh
