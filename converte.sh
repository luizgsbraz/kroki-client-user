#!/bin/bash

. inituser

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

