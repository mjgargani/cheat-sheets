#!/bin/bash

# Nome do repositório
REPO_NAME="md_cheat-sheets"

# Diretório (se for o caso)
REPO_DIR="./"

# Verifica se o diretório existe
if [ ! -d "$REPO_DIR" ]; then
  echo "Erro: O diretório '$REPO_DIR' não foi encontrado."
  exit 1
fi

# Cria um timestamp no formato AAAA-MM-DD_HH-MM-SS
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Nome do arquivo ZIP
ZIP_FILE="${REPO_NAME}_${TIMESTAMP}.zip"

# Compacta o repositório com alta compressão (-9)
zip -r -9 "$ZIP_FILE" "$REPO_DIR"

# Verifica se o arquivo foi criado com sucesso
if [ $? -eq 0 ]; then
  echo "Arquivo ZIP criado com sucesso: $ZIP_FILE"
else
  echo "Erro ao criar o arquivo ZIP."
fi
