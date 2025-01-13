#!/bin/bash

# Nome do repositório (ou diretório)
REPO_DIR="md_cheat-sheets"

# Verifica se o diretório existe
if [ ! -d "$REPO_DIR" ]; then
  echo "Erro: O diretório '$REPO_DIR' não foi encontrado."
  exit 1
fi

# Cria um timestamp no formato AAAA-MM-DD_HH-MM-SS
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Nome do arquivo ZIP
ZIP_FILE="${REPO_DIR}_${TIMESTAMP}.zip"

# Compacta o repositório com alta compressão (-9)
zip -r -9 "$ZIP_FILE" "$REPO_DIR"

# Verifica se o arquivo foi criado com sucesso
if [ $? -eq 0 ]; then
  echo "Arquivo ZIP criado com sucesso: $ZIP_FILE"
else
  echo "Erro ao criar o arquivo ZIP."
fi
