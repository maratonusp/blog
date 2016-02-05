# maratonIME
Esse é o [blog do maratonIME](http://www.ime.usp.br/~maratona/) feito na plataforma [Jekyll](http://jekyllrb.com) baseado no tema [neo-hpstr](https://github.com/aron-bordin/neo-hpstr-jekyll-theme). Para o apoio às maratonas de programação no IME-USP.

# Instruções
## Instalação
1. Instale o ruby e o rubygems (eu prefiro fazer isso pelo [rvm](https://rvm.io/), é o jeito mais fácil)
2. Instale o bundler `gem install bundle`
3. Clone o projeto
3. Entre na pasta do projeto
4. Instale as dependências `bundle install`

## Instruções Avançadas
O template tem, por padrão, um tutorial mais completo e ele está em `theme-setup/index.md`. Para entender como alterar o template e tudo o mais, é interessante ler aquilo. Para criar posts basta ler isso.

## Posts
Todos os posts estão em `_posts`. Basta copiar um dos posts já existentes e adaptá-los para criar um novo post.

## Testes Locais
Com o jekyll instalado, rode `jekyll serve` e visite [http://localhost:4000](http://localhost:4000). Voilá.

## Atualizando o servidor
Eu não consegui inventar um jeito bom de atualizar o servidor, se alguém tiver um melhor, sugira. No momento o que eu faço é compilar o site localmente e enviar para a máquina.

1. No arquivo `_config.yml`, mude a url do projeto de `http://localhost:4000/~maratona/` para `http://www.ime.usp.br/~maratona`
2. Rode `jekyll build`
3. No servidor, substitua o conteúdo de `www` pelo conteúdo da pasta `_site` que foi gerada no passo 2
