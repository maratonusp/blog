#!/bin/bash

## O QUE ESSE SCRIPT FAZ
# Devido a problemas do forestry.io, estamos sendo obrigados a buildar e deployar o site na mao
# Entretanto, os posts podem ser criados pelo forestry e depois serem buildados e deployados por aqui.

## POR QUE USAR ESTE SCRIPT
# Com o rsync arquivos já presentes no servidor não são transferidos

## ANTES DE USAR O SCRIPT
# Cheque se você tem rsync na sua máquino local e na rede IME (acho que tem por padrão na rede IME)
# Tenha certeza que o seu usuário consegue acessar o usuario da maratona (rode sudo -u maratona -i)

echo -e "\033[0;32m[Insira um usuário válido da Rede IME com acesso ao usuário da maratona (usuario@ime.usp.br)]\033[0m"
read USER
echo -e "\033[0;32m[Insira um caminho para onde enviar a pasta _site dentro do seu usuário da Rede IME (ex: ~/)]\033[0m"
read DEST

# Atualiza o repo
echo -e "\033[0;32m[Sincronizando o site com o GitHub]\033[0m"
git pull origin master

# Build
echo -e "\033[0;32m[Buildando com jekyll]\033[0m"
jekyll build

# Envia o arquivo pro usuário
echo -e "\033[0;32m[Enviando arquivos para a rede IME]\033[0m"
rsync _site $USER:$DEST -r

# Envia o arquivo para o servidor final
echo -e "\033[0;32m[Copiando arquivos para o servidor final]\033[0m"
ssh $USER "sudo -u maratona rsync $DEST/_site/ /home/specmac/maratona/www -r"
