# SIN5005 - Tópicos em Engenharia de Software

Disciplina SIN5005_topicos_eng_software repositório criado para realizar as atividades solicitadas pelo professor. O grupo fará um trabalho com o tema: "Mercado Livre da construção civil"

# Integrantes
* Adilson Lopes Khouri - NUSP 6411994
* Alberto Dumont Alves Oliveira - NUSP 9408481
* Francisco Wallison Carlos Rocha - NUSP 11312711
* Luciano Gonçalves de Carvalho - NUSP 9412079

# Arcabouço Desenvolvimento

1. [Cucumber](https://cucumber.io/docs/installation/ruby/)
2. [Jasmine](https://jasmine.github.io/pages/getting_started.html)
3. [Coveralls](https://coveralls.io/github/WallisonCarlos/sin5005)
4. [Travis](https://travis-ci.org/WallisonCarlos/sin5005)
5. [CodeClimate](https://codeclimate.com/github/WallisonCarlos/sin5005)
6. [Rspec e Capibara](https://medium.com/@anchietajunior/instala%C3%A7%C3%A3o-e-configura%C3%A7%C3%A3o-b%C3%A1sica-rspec-e-capybara-no-rails-5-3865437c86d0)
7. [HEROKU -  https://infinite-fjord-71543.herokuapp.com/](https://infinite-fjord-71543.herokuapp.com/)
8. [HEROKU -  https://infinite-fjord-71543.herokuapp.com/](https://infinite-fjord-71543.herokuapp.com/)

# Badges

Coveralls:
[![Coverage Status](https://coveralls.io/repos/github/WallisonCarlos/sin5005/badge.svg?branch=master)](https://coveralls.io/github/WallisonCarlos/sin5005?branch=master)

Travis:
[![Build Status](https://travis-ci.org/WallisonCarlos/sin5005.svg?branch=master)](https://travis-ci.org/WallisonCarlos/sin5005)

Code Climate Maintainability:
[![Maintainability](https://api.codeclimate.com/v1/badges/307cd1872c40fd5ffc35/maintainability)](https://codeclimate.com/github/WallisonCarlos/sin5005/maintainability)

Code Climate Test Coverage:
[![Test Coverage](https://api.codeclimate.com/v1/badges/307cd1872c40fd5ffc35/test_coverage)](https://codeclimate.com/github/WallisonCarlos/sin5005/test_coverage)

# Instalação e execução

- Obs.: O passo 4 sempre é executado para subir a aplicação. Do Passo 5 até o passo 9 basta executar uma vez. O passo de e 11 é sempre que mudar algo na estrutura do meu banco de dados é necessário atualizar rodando as minhas migrates.

- 1. Download do projeto:

 - `git clone https://github.com/WallisonCarlos/sin5005.git`
 
- 2. Entrar no diretório raiz do projeto:

 - `cd sin5005/`

- 3. Com o Docker iniciado, executar o seguinte comando para construir as imagens.

 - `docker-compose build`
 
- 4. Executar o seguinte comando para subir os containers e executar a aplicação.

 - `docker-compose up`
 
- 5. Entrar no container do banco de dados (PostgreSQL).

 - `docker-compose run --rm postgres`
 
- 6. Dentro do container executar PostrgreSQL.

 - `psql -U postgres`
 
- 7. Criar banco de dados.

 - `CREATE DATABASE construbem_development;`

- 8. Sair do PostgreSQL.

 - `exit`
- 9. Sair do container.

 - `exit`
 
- 10. Entrar no container da aplicação.

 - `docker-compose run --rm web`

- 11. Executar as migrations para criar as tabelas no bando de dados.
 
 - `rake db:migrate`


# Soluções de Contorno (Problemas e Soluções)

Para instalar o rspec e capibara clique nesse  [Link](https://medium.com/@anchietajunior/instala%C3%A7%C3%A3o-e-configura%C3%A7%C3%A3o-b%C3%A1sica-rspec-e-capybara-no-rails-5-3865437c86d0)

Para configurar o Travis clique nesse  [Link](https://medium.com/full-taxx/how-to-setup-travis-ci-for-a-rails-application-78a453963300)

Problema com o rack features, basta adicionar o gem data-cleaner para funcionar corretamente. Ver  [Issue no Github](https://github.com/cucumber/cucumber-rails/issues/127)

Lembrar de não fazer commit direto no github é desagradável corrigir no git.

