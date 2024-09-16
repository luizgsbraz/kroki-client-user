# kroki-client-user

Usa a imagem do [kroki-client](https://github.com/luizgsbraz/kroki-client-docker) para processar arquivos mermaid.

## Requisitos

1. Ter o docker e o docker composer (ou podman)
1. Ter uma imagem kroki-client instalado
```bash
$ docker images | grep kroki-client
kroki-client                                     latest    9e97a19f8ec9   8 days ago      13.1MB
```

Ou construir a imagem você mesmo a partir dos código fonte (https://github.com/luizgsbraz/kroki-client-docker.git)

## Instalação

```
git clone https://github.com/luizgsbraz/kroki-client-user.git
```

## Uso

* crie o diretorio ./mywork/src e copie os diagramas a converter para a pasta e execute o script converte.sh

```bash
mkdir -p mywork/src
cp MEU_DIAGRAMA.mmd ./mywork/src
. converte.sh
```

## Alterar pastas de trabalho

Edite as linhas abaixo no arquivo [converte.sh](converte.sh)  

```
workdir=$(pwd)/mywork 

export SRC_DIR="$workdir/src"
export BUILD_DIR="$workdir/build"
export LOG_DIR="$workdir/log"
```
