#!/bin/bash

REPO_NAME="md_cheat-sheets"
REPO_DIR="./"
IGNORE_LIST=("*.zip" "./ghostwriter/*" "./.git/*" "./ghostwriter" "./.git")

if [ ! -d "$REPO_DIR" ]; then
  echo "Erro: O diretório '$REPO_DIR' não foi encontrado."
  exit 1
fi

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
ZIP_FILE="${REPO_NAME}_${TIMESTAMP}.zip"

EXCLUDE_ARGS=()
for ITEM in "${IGNORE_LIST[@]}"; do
  EXCLUDE_ARGS+=("-x" "$ITEM")
done

zip -r -9 "$ZIP_FILE" "$REPO_DIR" "${EXCLUDE_ARGS[@]}"

if [ $? -eq 0 ]; then
  echo "Arquivo ZIP criado com sucesso: $ZIP_FILE"
else
  echo "Erro ao criar o arquivo ZIP."
fi
