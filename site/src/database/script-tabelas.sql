DROP DATABASE IF EXISTS sonicMatters;
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
	idVoto INT AUTO_INCREMENT,
    escolha VARCHAR(45),
    fkUsuario INT,
	CONSTRAINT fkVotoUsuario FOREIGN KEY (fkUsuario)
		REFERENCES usuario(idUsuario),
	fkVotacao INT,
	CONSTRAINT fkVotoVotacao FOREIGN KEY (fkVotacao)
		REFERENCES votacao(idVotacao),
	CONSTRAINT pkCompostaVoto PRIMARY KEY (idVoto, fkUsuario, fkVotacao)
) AUTO_INCREMENT = 100;
        
INSERT into votacao values 
	(null, 'Melhor Personagem'),
    (null, 'Melhor Jogo'),
    (null, 'Melhor Era'),
    (null, 'Melhor Trilha Sonora');

DESC usuario;
DESC votacao;
DESC voto;

SELECT * from usuario;
SELECT * from votacao;
SELECT * from voto;

select escolha, count(escolha) as totalVotos
        from voto
        where fkVotacao = 10
        group by escolha;