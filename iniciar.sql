CREATE DATABASE ufmt;
USE ufmt;

CREATE TABLE curso(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

INSERT INTO curso(nome) VALUES ("Eng. Comp"), ("Eng. Cont. Aut.");