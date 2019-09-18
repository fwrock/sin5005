# SIN5005 - Tópicos em Engenharia de Software

Disciplina sin5005 repositório criado para realizar as atividades solicitadas pelo professor. O grupo fará um trabalho com o tema: "Mercado Livre da construção civil".

[HEROKU - Link da aplicação](https://construbem.herokuapp.com)

# Integrantes
* Adilson Lopes Khouri - NUSP 6411994
* Alberto Dumont Alves Oliveira - NUSP 9408481
* Francisco Wallison Carlos Rocha - NUSP 11312711
* Luciano Gonçalves de Carvalho - NUSP 9412079

# Kanban ([Trello](https://trello.com)) 

1. Product Backlog
  
  - [Acessar Product Backlog](https://trello.com/b/c9Hobl8m/product-backlog)

2. Sprints
  
  - [Sprint #1](https://trello.com/b/PBo4hSWH/sprint-1)

# Ferramentas de teste

1. [Cucumber](https://cucumber.io/docs/installation/ruby/)
2. [Jasmine](https://jasmine.github.io/pages/getting_started.html)
3. [Coveralls](https://coveralls.io/github/WallisonCarlos/sin5005)
4. [Travis](https://travis-ci.org/WallisonCarlos/sin5005)
5. [CodeClimate](https://codeclimate.com/github/WallisonCarlos/sin5005)
6. [Rspec e Capibara](https://medium.com/@anchietajunior/instala%C3%A7%C3%A3o-e-configura%C3%A7%C3%A3o-b%C3%A1sica-rspec-e-capybara-no-rails-5-3865437c86d0)
7. [Rubocop](http://www.rubocop.org/en/stable/)

# Badges

Coveralls:
[![Coverage Status](https://coveralls.io/repos/github/WallisonCarlos/sin5005/badge.svg?branch=master)](https://coveralls.io/github/WallisonCarlos/sin5005?branch=master)

Travis:
[![Build Status](https://travis-ci.org/WallisonCarlos/sin5005.svg?branch=master)](https://travis-ci.org/WallisonCarlos/sin5005)

Code Climate Maintainability:
[![Maintainability](https://api.codeclimate.com/v1/badges/307cd1872c40fd5ffc35/maintainability)](https://codeclimate.com/github/WallisonCarlos/sin5005/maintainability)

Code Climate Test Coverage:
[![Test Coverage](https://api.codeclimate.com/v1/badges/307cd1872c40fd5ffc35/test_coverage)](https://codeclimate.com/github/WallisonCarlos/sin5005/test_coverage)


# Arquitetura da nossa infra
Temos dois dockers configurados um para banco de dados (postgresql) e outro para servidor web (rails).
O primeiro passo é instalar o docker, em seguida teremos que fazer algumas configurações em ambos os dockers para poder começar a desenvolver.

## Container
Para verificar quais conteiners estão executando: docker ps -l e pegar seus ids. Para entrar em um conteiner específico: "docker exec -it CONTEINER_ID bash"


# Instalação e execução

- Obs.: O passo 4 sempre é executado para subir a aplicação. Do Passo 5 até o passo 9 basta executar uma vez. O passo de e 11 é sempre que mudar algo na estrutura do meu banco de dados é necessário atualizar rodando as minhas migrates.

1. Download do projeto:

  - `git clone https://github.com/WallisonCarlos/sin5005.git`
 
2. Entrar no diretório raiz do projeto:

  - `cd sin5005/`

3. Com o Docker iniciado, executar o seguinte comando para construir as imagens (facilitou minha vida abrir um terminal para cada comando docker).

  - `docker-compose build`
 
4. Executar o seguinte comando para subir os containers e executar a aplicação.

  - `docker-compose up`
 
5. Entrar no container do banco de dados (PostgreSQL).

  - `docker-compose run --rm postgres`
 
6. Dentro do container executar PostrgreSQL.

  - `psql -U postgres`
 
7. Criar banco de dados.

  - `CREATE DATABASE construbem_development;`

8. Sair do PostgreSQL.

  - `\q`
9. Sair do container.

  - `exit`
 
10. Entrar no container da aplicação.

  - `docker-compose run --rm web`

11. Executar as migrations para criar as tabelas no bando de dados (Não precisa fazer isso no primeiro momento, pode esperar para fazer depois).
 
  - `rake db:migrate`
  
12. Caso o servidor o container do Webpack suba e caia, executar esse comando dentro do container web(Não precisa fazer isso no primeiro momento, pode esperar para fazer depois).
 
  - `bundle exec rails webpacker:install`

13. Para verificar se a 'instalação' foi bem sucedida, entre no servidor de aplicação (web) e digite: 
* rails -v (6.0)
* ruby -v (2.6)
* No navegador da SUA máquina (localhost:3000) endereço da aplicação

# Soluções de Contorno (Problemas e Soluções)

Para instalar o rspec e capibara clique nesse  [Link](https://medium.com/@anchietajunior/instala%C3%A7%C3%A3o-e-configura%C3%A7%C3%A3o-b%C3%A1sica-rspec-e-capybara-no-rails-5-3865437c86d0)

Para configurar o Travis clique nesse  [Link](https://medium.com/full-taxx/how-to-setup-travis-ci-for-a-rails-application-78a453963300)

Problema com o rack features, basta adicionar o gem data-cleaner para funcionar corretamente. Ver  [Issue no Github](https://github.com/cucumber/cucumber-rails/issues/127)

Lembrar de não fazer commit direto no github é desagradável corrigir no git.

# Como fazer commit's no git
1. Crie e troque para uma nova branch
 - `git checkout -b BRANCH_NOVA`
2. Realize suas alterações, modificações...
3. Rode os testes, eles devem ficar verde.
4. Adicione as mudanças no stage area
- `git add .`
5. Realize o commit de tudo que está no stagging area
- `git commit -m "pequena descrição do commit"`
6. Troque para o branch master
- `git checkout master`
7. Realize o merge
- `git merge BRANCH_NOVA`
8. Atualize o github
- `git push origin master`
9. Atualize o git dentro do heroku 
- `git push heroku`
 
# Boas práticas de codificação Ruby
[Ruby_Best_Practices](https://github.com/github/rubocop-github/blob/master/STYLEGUIDE.md)
