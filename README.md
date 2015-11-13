# maratonIME
Esse é o [blog do maratonIME](http://www.ime.usp.br/~maratona/) feito na plataforma [Jekyll](http://jekyllrb.com) baseado no tema [neo-hpstr](https://github.com/aron-bordin/neo-hpstr-jekyll-theme). Para o apoio às maratonas de programação no IME-USP.

# Instruções
## Instalação
- Instale o ruby e o rubygems
- Instale o bundler `gem install bundle`
- Clone o projeto
- Entre na pasta do projeto
- Instale as dependências `bundle install`

## Jekyll Serve
Para testar o site na sua máquina, basta rodar `jekyll serve` na pasta do projeto e acessar [http://localhost:4000](http://localhost:4000).

## Atualizando o servidor
Para enviar a atualização para o servidor, vá no arquivo `_config.yml`, comente a linha  
`url: http://localhost:4000/~maratona/`  
e comente a linha  
`url: http://www.ime.usp.br/~maratona/`  
depois rode `jekyll build` e substitua, no servidor a pasta `www` pela pasta `_site` gerada.
