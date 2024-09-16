$CONTAINER_TOOL compose up -d

# Monitorar o log para a mensagem de conclusão
tail -F $LOG_DIR/kroki-client.log | while read LOGLINE
do
   [[ "${LOGLINE}" == *"Processing complete"* ]] && pkill -P $$ tail
done

# Finalizar
$CONTAINER_TOOL compose down

echo "Well done! Processamento concluído."

echo "Arquivos Originais:"
tree $SRC_DIR
echo " " 
echo "Arquivos Gerados:"
tree $BUILD_DIR


