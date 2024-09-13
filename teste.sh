#!/bin/bash

. inituser

# Criar um arquivo de exemplo

## Timestamp 
agoramesmo=$(date +%s%3N)
arquivo_exemplo_base=exemplo_$agoramesmo
arquivo_exemplo=$arquivo_exemplo_base.mmd

echo "graph TD" > $LOCAL_SRC_DIR/$arquivo_exemplo
echo "   X[Entidade X] --> Y[Entidade Y]" >> $LOCAL_SRC_DIR/$arquivo_exemplo
echo "   Y --> Z[Entidade Z]" >> $LOCAL_SRC_DIR/$arquivo_exemplo
echo "   Z --> X" >> $LOCAL_SRC_DIR/$arquivo_exemplo

# Substituir as variáveis de ambiente e iniciar os containers
# docker compose up -d
docker compose build --no-cache && docker compose up -d

# Monitorar o log para a mensagem de conclusão
tail -F $LOCAL_LOG_DIR/kroki-client.log | while read LOGLINE
do
   [[ "${LOGLINE}" == *"Processing complete"* ]] && pkill -P $$ tail
done

# Finalizar
docker compose down

echo "Well done! Processamento concluído."

echo "Arquivos Originais:"
tree $LOCAL_SRC_DIR
echo " " 
echo "Arquivos Gerados:"
tree $LOCAL_BUILD_DIR

echo "firefox $LOCAL_BUILD_DIR/$arquivo_exemplo_base.svg &"