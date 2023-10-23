#!/bin/bash

## O QUE ESSE SCRIPT FAZ
# Deploy automatico

## POR QUE USAR ESTE SCRIPT
# Travis

# echo -e "\033[0;32m[Publicando commit]\033[0m"
# if [ "$TRAVIS_PULL_REQUEST" != "false" ]; then
# 	echo -e "\033[0;33m[Passo ignorado: Pull Request]\033[0m"
# 	exit 0
# fi

USER='maratona@sites.ime.usp.br'
DEST='/home/spec/maratona/www/'

echo '-----BEGIN OPENSSH PRIVATE KEY-----' >> ~/.ssh/maratona
echo $SSH_PRIVATE_KEY >> ~/.ssh/maratona
echo '-----END OPENSSH PRIVATE KEY-----' >> ~/.ssh/maratona

# Envia o arquivo pro usuário
echo -e "\033[0;32m[Enviando arquivos para a rede IME]\033[0m"
rsync -azv -e "ssh -i ~/.ssh/maratona" _site/ $USER:$DEST -r
