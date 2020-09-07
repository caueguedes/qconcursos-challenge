# QConcursos-Challenge




Tools | Versions
--------- | ------
ruby        | 2.7.1 alpine
rails       | 6.0


Este projeto também inclui um banco de dados Postgres e um banco Redis utilizado para caching.


## Rodando Localmente
### Instruções de deploy


- docker-compose up -d


### Criação do banco de dados


O projeto inclui um container responsável pela migração do banco de desenvolvimento.


O projeto inclui uma task responsável por realizar o carregamento dos arquivos de Json disponibilizados


para carregar o banco de dados:


- `docker-compose run --rm web bin/rails database:import_data`


para limpar o banco de dados:


- `docker-compose run --rm web bin/rails database:clean`


### Rodando testes


- `docker-compose run --rm web bin/rails db:create RAILS_ENV=test`
- `docker-compose run --rm web bin/rails db:migrate RAILS_ENV=test`
- `docker-compose run --rm  web bundle exec rspec`




## Decisões do projeto


### Estrutura
Foram utilizados Query Objects para encapsular as queries de Most Viewed e Hot Topics. ( estão em: "app/queries/*")


Foi utilizado o Padrão Policy para encapsular a decisão de quando cachear a response da query. (estão em: "app/policies/*")




### Caching
Devido ao grande número de acessos descrito no desafio, foi decidido a utilização de um banco de cache para salvar a reposta das querys, diminuindo o tempo de resposta e o número de requisições realizadas ao banco.


- Foi utilizado Low-level-caching utilizando um banco de redis.
- Serão cacheados as 10 primeiras páginas de cada busca.
- O cache expira em 2 minutos.


### QueryObjects
Os objetos de query retornam uma relação, fazendo com que possam ser utilizados em conjunto com outros filtros,
como pode ser visto no projeto utilizando os tópicos com Most Viewed e paginação.




### Notas
- O arquivo de JSON de questões fornecidos possui 48 chaves duplicadas, ao realizar o carregamento do banco as chaves duplicadas são logadas em 'log/import.log'


- A estrutura do banco fornecida mistura características de entidades diferentes,
retirando o campo "daily access" da entidade "Questions" e a movendo para a entidade "QuestionA accesses"
com um registro do dia em questão as queries podem ser filtradas e agrupadas de maneira mais eficientes.


- O projeto possui serializados já definidos, então a utilização em uma aplicação frontend usando javascript já é possível.
Para aumentar o desempenho do sistema a divisão do sistema em aplicações frontend/backend é uma opção o que faz com que a renderização da aplicação não seja mais de responsabilidade do servidor backend.


### Senhas


As senhas dos bancos e pgadmin estão definidos em .env/development 


