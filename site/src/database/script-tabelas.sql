/*
comandos para mysql - banco local - ambiente de desenvolvimento
*/

CREATE DATABASE sonicMatters;
USE sonicMatters;

CREATE TABLE usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    email VARCHAR(45),
    senha VARCHAR(45),
    personagem VARCHAR(25)
);

CREATE TABLE votacao (
	idVotacao INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(45)
) AUTO_INCREMENT = 10;

CREATE TABLE voto (
	idVoto INT PRIMARY KEY AUTO_INCREMENT,
    escolha VARCHAR(45),
    fkUsuario INT,
	CONSTRAINT fkVotoUsuario FOREIGN KEY (fkUsuario)
		REFERENCES usuario(idUsuario),
	fkVotacao INT,
	CONSTRAINT fkVotoVotacao FOREIGN KEY (fkVotacao)
		REFERENCES votacao(idVotacao)
) AUTO_INCREMENT = 100;


/*
DA API ORIGINAL
comando para sql server - banco remoto - ambiente de produção
*/

CREATE TABLE usuario (
	id INT PRIMARY KEY IDENTITY(1,1),
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50),
);

CREATE TABLE aviso (
	id INT PRIMARY KEY IDENTITY(1,1),
	titulo VARCHAR(100),
	descricao VARCHAR(150),
	fk_usuario INT FOREIGN KEY REFERENCES usuario(id)
);

create table aquario (
/* em nossa regra de negócio, um aquario tem apenas um sensor */
	id INT PRIMARY KEY IDENTITY(1,1),
	descricao VARCHAR(300)
);

/* esta tabela deve estar de acordo com o que está em INSERT de sua API do arduino - dat-acqu-ino */

CREATE TABLE medida (
	id INT PRIMARY KEY IDENTITY(1,1),
	dht11_umidade DECIMAL,
	dht11_temperatura DECIMAL,
	luminosidade DECIMAL,
	lm35_temperatura DECIMAL,
	chave TINYINT,
	momento DATETIME,
	fk_aquario INT FOREIGN KEY REFERENCES aquario(id)
);

/*
comandos para criar usuário em banco de dados azure, sqlserver,
com permissão de insert + update + delete + select
*/

CREATE USER [usuarioParaAPIWebDataViz_datawriter_datareader]
WITH PASSWORD = '#Gf_senhaParaAPIWebDataViz',
DEFAULT_SCHEMA = dbo;

EXEC sys.sp_addrolemember @rolename = N'db_datawriter',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';

EXEC sys.sp_addrolemember @rolename = N'db_datareader',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';
