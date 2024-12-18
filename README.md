# Entendendo

## Gerando a imagem

No arquivo `Dockerfile`, criamos uma imagem de um banco de dados usando o MySQL 8.1. Esta imagem configura também uma senha para o usuário `root`, que é `faeng`, e expõe o serviço na porta `3306` do container. Além disso, ela copia o conteúdo do arquivo `iniciar.sql` para inserir registros no banco de dados já em sua criação. 

Para prosseguirmos, precisamos gerar a build dessa imagem, com o seguinte comando: 

```bash
docker build -t bancofaeng .
```

## Criando o docker-compose

Agora que já temos a imagem gerada, definimos no arquivo `docker-compose.yml` quais serão os serviços (containers) a serem criados para a execução de nossa aplicação. Como nosso interesse agora é apenas a replicação de banco de dados, criamos apenas dois serviços: `principal` e `replica`. Na criação desses containers, estamos atualizando a senha do usuário root (apenas para mostrar que isso é possível). Também criamos, no `principal`, um usuário `replicador`. 

Também configuramos um script SQL para cada container, seguindo a seguinte lógica:
- no `principal`, redefinimos a senha do usuário `replicador` e atribuímos o privilégio de `slave` a ele;
- no `replica`, informamos quem é seu `master`, passando informações como o arquivo e a posição do backup.

```bash
docker-compose up -d
```

### Outros comandos úteis

Para parar os containers, excluindo os volumes por  eles utilizados:

```bash
docker compose down -v
````

Executar o bash no principal:

```bash
docker exec -it principal bash
````
Executar o MySQL no principal:

```bash
docker exec -it principal mysql -u root -p
````

Executar o MySQL na réplica:

```bash
docker exec -it principal replica -u root -p
````

## Comandos SQL


```bash
INSERT INTO ufmt.curso(nome) VALUES ("Eng. Transportes");
````

```bash
SELECT * FROM ufmt.curso(nome);
````
