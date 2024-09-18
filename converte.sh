#!/bin/bash

# Default to $PWD/work
export baseworkdir=$PWD
export IN_DIR="$baseworkdir/in"
export OUT_DIR="$baseworkdir/out"
export LOG_DIR="$baseworkdir/log"

# Uncomment and set the following variables to override the defaults
# export IN_DIR="MYPROJECT_DIR/in"
# export OUT_DIR="/var/tmp/kroki-client/MYPROJECT/out"
# export LOG_DIR="/var/tmp/kroki-client/MYPROJECT/log" 

mkdir -p $IN_DIR
mkdir -p $OUT_DIR
mkdir -p $LOG_DIR

touch $LOG_DIR/kroki-client.log

# Verifica se o Podman está disponível, caso contrário, usa Docker
if command -v podman &> /dev/null
then
    export CONTAINER_TOOL="podman"
else
    export CONTAINER_TOOL="docker"
fi

$CONTAINER_TOOL compose up -d

# Monitorar o log para a mensagem de conclusão
tail -F $LOG_DIR/kroki-client.log | while read LOGLINE
do
   [[ "${LOGLINE}" == *"Processing complete"* ]] && pkill -P $$ tail
done

# Finalizar
$CONTAINER_TOOL compose down

echo "Well done! Your diagrams are ready!" 

echo "Original Files:"
tree $IN_DIR
echo " " 
echo "Built Files:"
tree $OUT_DIR

