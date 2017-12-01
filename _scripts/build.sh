#!/bin/bash

# Deps
echo -e "\033[0;32m[Instalando dependências]\033[0m"
bundle install

# Build
echo -e "\033[0;32m[Buildando com jekyll]\033[0m"
bundle exec jekyll build
