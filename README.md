# kroki-client-user

Usa a imagem do kroki-client guardada no docker hub para processar arquivos mermaid.

## Requisitos

Ter o docker e o docker composer (ou podman)

Ter uma imagem kroki-client

```bash
$ docker images | grep kroki-client
kroki-client                                     latest    9e97a19f8ec9   8 days ago      13.1MB
```

Ou construir você mesmo!

## Instalação

```
git clone https://github.com/luizgsbraz/kroki-client-user.git
./teste.sh
```

## Uso

* copie os diagramas para ./mywork/src
* converte.sh

## Alterar pastas de trabalho

Edite o arquivo [inituser](inituser)  

```
# uncomment to have custom variables
export LOCAL_SRC_DIR=$HOME/THE_PROJECT/mermaid
export LOCAL_BUILD_DIR=./build
export LOCAL_LOG_DIR=./log
```
