# Clinica Odontológica

O projeto visa aplicar conceitos da matéria de Banco de Dados. Criando um sistema para agendamento de uma clinica odontológica.

  * Visa organizar o fluxo de atendimento de uma clinica odontológica;
  * Guarda apenas dados essenciais para  a realização do agendamento;
  * Permite cruzar dados para eficiência dos atendimentos;
  * Ajuda a criar gráficos de desempenho dos profissionais;
  * Organiza a agenda diária da clinica;
  * Etc. 
 
## Sobre a descrição do projeto:
### Descrição

* Desenvolva um projeto em grupo (tema livre) que aplique todo o conteúdo deste módulo.
* Banco de Dados (defina um modelo de dados consistente com sua aplicação)
* Scripts de inicialização dos dados: defina um arquivo data.sql para realizar os inserts iniciais da aplicação.
* Crie um arquivo README.md explicando o escopo do seu projeto e adicione os diagramas que vier a criar.
* Sugestão*: Aplicação .NET usando Entity Framework para comunicar com o banco de dados.
* Seu banco de dados deve definir mais de uma tabela, relacionamentos e constraints (FKs).
* Defina pelo menos um CRUD (Create, Read, Update and Delete) em SQL(Create, Select, Update and Delete).
### Avaliação
* O grupo será avaliado pela coerência do projeto e aplicação dos seus conceitos vistos em aula.
Cada membro do grupo será avaliado individualmente por seus commits no repositório.
### Prazo
* Até o dia 03/08/2022 antes da aula para apresentar.
* Entrega final para o dia 08/08/2022

## Orientações para configuração do Banco de dados
1) No SQL Server, crie um banco de dados com nome de sua preferência (Exemplo: CREATE DATABASE Clinica_Odontologica)
2) Execute cada script, um por um.
   Obs: Os scpts foram divididos em categorias, e devem ser rodados na ordem a qual os arquivos estão enumerados, pois existe dependência entre as tabelas.
3) Existe comentários em cada script referenciando a função desenvolvida.
4) Atentar-se ao que determinada função ou busca traz como resultado, pois algumas delas retornam podem não retornar registros dependendo da data em que estiver. 
Exemplo: A função que retorna os dias até o agendamento só retornará resultados se houver cadastrado na base uma data posterior ao dia atual. 
Caso não exista, será necessário inserir novos agendamentos futuros para que a busca retorne algo. Existem agendamentos lançados próximos à data de publicação deste projeto, mas dependendo de quando você estiver rodando-o, esses registros não vão atender à algumas funções ou buscas. 


## Modelo Conceitual
![image](https://user-images.githubusercontent.com/38474570/182737190-6f3f8849-0c72-4a4f-9e2c-4be30814de70.png)


## Modelo Lógico
![image](https://user-images.githubusercontent.com/38474570/182737212-4f21f4ca-28ba-491a-bde2-14dcd99c554a.png)

## Modelo Físico
![image](https://user-images.githubusercontent.com/38474570/183547790-bdac03b5-2c03-4071-84a2-614c4611313b.png)
