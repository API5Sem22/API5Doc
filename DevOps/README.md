<html>
  <body>
  
  <h2 align="center"> Data Rangers - DevOps </h2>
  
 <p align="center"> <img src="https://img.shields.io/badge/GitHub-Versionamento-181717?style=for-the-badge&logo=github"> <img src="https://img.shields.io/badge/CircleCI-CI/CD-515A5A?style=for-the-badge&logo=circleci"> <img src="https://img.shields.io/badge/Maven-Build-FF5733?style=for-the-badge&logo=ApacheMaven"> <img src="https://img.shields.io/badge/Selenium-Testes Integrados-28B463?style=for-the-badge&logo=selenium"> <img src="https://img.shields.io/badge/Liquibase-Migração BD-B03A2E?style=for-the-badge&logo=liquibase"> <img src="https://img.shields.io/badge/Heroku-Cloud-8E44AD?style=for-the-badge&logo=heroku"> <img src="https://img.shields.io/badge/Docker-Deploy-3498DB?style=for-the-badge&logo=docker"> <img src="https://img.shields.io/badge/Swagger-Documentação Rotas-1E8449?style=for-the-badge&logo=swagger"> </p>
   
 <p align="center"> <img src="https://github.com/guiftavares/Registro-de-Livros/blob/main/Group%2040linha.png"></p>
   
 <h2 style="font-family:roboto;"> Git Workflows</h2>
 <p align="justify" style="font-family:roboto;"> O versionamento de código se deu em 3 tipos de branchs:</p>
 
   * main - Código de produção, só pondendo ter mudanças por pull requests da branch develop.
   * develop - Branch destinada para testes de funcionalidades e da ferramenta como um todo, só pode ter mudanças por meio de pull requests das features.
   * features - Branchs com objetivo de desenvolvimentos das funcionalidades do software.
   
 <p align="center"> <img src="https://github.com/guiftavares/Registro-de-Livros/blob/main/Group%2040linha.png"></p>
   
 <h2 style="font-family:roboto;"> Pipelines </h2>
 <p align="justify" style="font-family:roboto;"> O CD/CI foi realizado pela ferramenta <a href="https://circleci.com/">CircleCI</a>, tendo 3 jobs para as branchs:</p>
 
   * build-and-test - Realiza o build e testes unitários, rodando apenas nas branchs features e develop.
      <details>
      <summary>Job Build e Testes unitários</summary>
   
      ```yaml
      build-and-test:
        docker:
          - image: cimg/openjdk:11.0
        steps:
          - checkout
          - run:
              name: Build
              command: mvn clean package
          - run:
              name: Unit Tests
              command: mvn -Dtest="dw.servico.**" test
      ```
      </details>

   * integration-test - Realiza os testes integrados do projeto utilizando Selenium, que testam a aplicação como um todo (Front-end e Back-end), rodando apenas na branch develop.
      <details>
      <summary>Job Testes Integrados</summary>
   
      ```yaml
      integration-test:
        docker:
          - image: cimg/openjdk:11.0.10-browsers
        steps:
          - browser-tools/install-browser-tools
          - checkout
          - run:
              name: Download Selenium
              command: curl -O http://selenium-release.storage.googleapis.com/3.141/selenium-server-standalone-3.141.59.jar
          - run:
              name: Start Selenium Server
              command: java -jar selenium-server-standalone-3.141.59.jar
              background: true
          - run:
              name: Integration Tests
              command: mvn -Dtest="dw.integracaoTestes.**" test
      ```
      </details>

* build-deploy - Realiza o deploy do código para nuvem no Heroku, rodando apenas na branch main.
      <details>
      <summary>Job Deploy</summary>
   
    ```yaml
    build-deploy:
      machine: true
      steps:
        - checkout
        - run:
            name: Build and push Docker image to Heroku
            command: |
              set -x
              sudo curl https://cli-assets.heroku.com/install.sh | sh
              HEROKU_API_KEY=${HEROKU_API_KEY} heroku container:login
              HEROKU_API_KEY=${HEROKU_API_KEY} heroku container:push -a datawarriors-back web
              HEROKU_API_KEY=${HEROKU_API_KEY} heroku container:release -a datawarriors-back web
    ```
     </details>
   
<p align="center"> <img src="https://github.com/guiftavares/Registro-de-Livros/blob/main/Group%2040linha.png"></p>
   
 <h2 style="font-family:roboto;"> Migração Banco de Dados</h2>
 <p align="justify" style="font-family:roboto;"> A migração do banco de dados foi realizado pela ferramenta <a href="https://www.liquibase.org/">Liquibase</a>.</p>
 
<details>
  <summary>Dml.sql</summary>
   
   ```yaml
    --liquibase formatted sql
    --changeset Gabriel Ferraz:1

    insert into Carteira(crt_descricao) values('Junior');
    insert into Carteira(crt_descricao) values('Pleno');
    insert into Carteira(crt_descricao) values('Senior');
    insert into Carteira(crt_descricao) values('Especialista');

    --changeset Gabriel Ferraz:2

    insert into Cargo(car_descricao) values('Vendedor');
    insert into Cargo(car_descricao) values('Admin');
    insert into Cargo(car_descricao) values('Analista de negócios');
  ```
</details>
   
<p align="center"> <img src="https://github.com/guiftavares/Registro-de-Livros/blob/main/Group%2040linha.png"></p>
 
<h2 style="font-family:roboto;"> Documentação de rotas</h2>
<p align="justify" style="font-family:roboto;"> A documentação das rotas fornecidades pelo back-end foi realizada pela ferramenta <a href="https://swagger.io/">Swagger</a>.</p>
 
 <html>
