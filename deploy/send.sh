#!/bin/bash

## PORQUE USAR ESTE SCRIPT
# Com o rsync arquivos já presentes no servidor não são transferidos

## ANTES DE USAR O SCRIPT
# Cheque se você tem rsync na sua máquino local e na rede IME (acho que tem por padrão na rede IME)
# Tenha certeza que o seu usuário consegue acessar o usuario da maratona (rode sudo -u maratona -i)

echo "Insira um usuário válido da Rede IME com acesso ao usuário da maratona (usuario@ime.usp.br)"
read USER
echo "Insira um caminho para onde enviar a pasta _site dentro do seu usuário da Rede IME (ex: ~/)"
read DEST

# Seta o url de build como a do servidor
tail _config.yml -n+2 > deploy/_temp_config.yml
cat deploy/host-remote deploy/_temp_config.yml > _config.yml

# Build
jekyll build

# Retorna a url de build para local
cat deploy/host-local deploy/_temp_config.yml > _config.yml
rm deploy/_temp_config.yml

# Envia o arquivo pro usuário
rsync _site $USER:$DEST -r

# Envia o arquivo para o servidor final
ssh $USER "sudo -u maratona rsync $DEST/_site/ /home/specmac/maratona/www -r"
