[![Build Status](https://travis-ci.org/maratonime/blog.svg?branch=master)](https://travis-ci.org/maratonime/blog)
# MaratonUSP
Esse é o [blog do maratonUSP](http://www.ime.usp.br/~maratona/) feito na plataforma [Jekyll](http://jekyllrb.com) baseado no tema [neo-hpstr](https://github.com/aron-bordin/neo-hpstr-jekyll-theme). Para o apoio às maratonas de programação na USP.

# Instalação
1. Instale o ruby e o rubygems (eu prefiro fazer isso pelo [rvm](https://rvm.io/), é o jeito mais fácil)
2. Instale o bundler `gem install bundle`
3. Clone o projeto
3. Entre na pasta do projeto
4. Instale as dependências `bundle install`

# Rodando
Com o jekyll instalado, rode `bundle exec jekyll serve` e visite [http://localhost:4000](http://localhost:4000). Voilá.

# Criando um post
Todos os posts estão em `_posts`. Basta copiar um dos posts já existentes e adaptá-lo.

# Editando as páginas de história
As [páginas de história](https://www.ime.usp.br/~maratona/historia) ficam dentro da pasta `pages`. Para adicionar novos itens à listagem, é necessário apenas alterar o YAML do cabeçalho copiando os modelos dos anos anteriores.

# Editando os cartões no começo da página
Olhe no começo do arquivo `index.html`, na parte `<section id="events">` e adicione uma figure seguindo o modelo das outras existentes. Os ícones ficam em https://fontawesome.com/v4.7.0/icons/.

# Editando o template
O site usa o [template neo-hpstr](https://github.com/aron-bordin/neo-hpstr-jekyll-theme) que tem um tutorial mais completo. Uma cópia dele está neste repositório em `theme-setup/index.md`. Para entender como alterar o template e tudo o mais, é interessante ler aquilo.

# Atualizando o servidor
Dê push na branch `master` que o [http://travis-ci.org](Travis) cuida do resto.
