#!/bin/bash

## O QUE ESSE SCRIPT FAZ
# Deploy automatico

## POR QUE USAR ESTE SCRIPT
# Travis

if [ "$TRAVIS_BRANCH" != "master" ]; then
	exit 0
fi

USER=$USER_IME@ime.usp.br
DEST=/home/gradmac/$USER_IME/_temp_site_maratona/

# Envia o arquivo pro usuário
echo -e "\033[0;32m[Enviando arquivos para a rede IME]\033[0m"
rsync -e "sshpass -p $PSWD ssh -o StrictHostKeyChecking=no" _site/ $USER:$DEST -r

# Envia o arquivo para o servidor final
echo -e "\033[0;32m[Copiando arquivos para o servidor final]\033[0m"
sshpass -p $PSWD ssh -o StrictHostKeyChecking=no $USER "sudo -u maratona rsync $DEST /home/specmac/maratona/www -r"
