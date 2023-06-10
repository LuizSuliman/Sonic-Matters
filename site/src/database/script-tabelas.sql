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

-- SELECT DO GRAFICO (IDVOTAÇÃO 10)
select escolha, count(escolha) as totalVotos
        from voto
        where fkVotacao = 10
        group by escolha;

-- INSERTS DE VOTOS PARA REALISMO (CRIE UM USUARIO ANTES DE INSERIR!)
INSERT INTO usuario VALUES
	(null, 'Sage', '1', '1', 'Dr. Eggman');

INSERT INTO voto VALUES
	(null, 'Sonic', 1, 10),
	(null, 'Sonic', 1, 10),
	(null, 'Sonic', 1, 10),
	(null, 'Sonic', 1, 10),
	(null, 'Sonic', 1, 10),
	(null, 'Tails', 1, 10),
	(null, 'Tails', 1, 10),
	(null, 'Tails', 1, 10),
	(null, 'Tails', 1, 10),
	(null, 'Knuckles', 1, 10),
	(null, 'Knuckles', 1, 10),
	(null, 'Knuckles', 1, 10),
	(null, 'Amy', 1, 10),
	(null, 'Amy', 1, 10),
	(null, 'Sonic Frontiers', 1, 11),
	(null, 'Sonic Frontiers', 1, 11),
	(null, 'Sonic Frontiers', 1, 11),
	(null, 'Sonic Frontiers', 1, 11),
	(null, 'Sonic Frontiers', 1, 11),
	(null, 'Sonic Mania', 1, 11),
	(null, 'Sonic Mania', 1, 11),
	(null, 'Sonic Mania', 1, 11),
	(null, 'Sonic Mania', 1, 11),
	(null, 'Sonic 2006', 1, 11),
	(null, 'Sonic 2006', 1, 11),
	(null, 'Sonic 2006', 1, 11),
	(null, 'Sonic Adventure 2', 1, 11),
	(null, 'Sonic Adventure 2', 1, 11),
	(null, 'Classic', 1, 12),
	(null, 'Classic', 1, 12),
	(null, 'Classic', 1, 12),
	(null, 'Classic', 1, 12),
	(null, 'Classic', 1, 12),
	(null, 'Classic', 1, 12),
	(null, 'Modern', 1, 12),
	(null, 'Modern', 1, 12),
	(null, 'Modern', 1, 12),
	(null, 'Modern', 1, 12),
	(null, 'Modern', 1, 12),
	(null, 'Open Zone', 1, 12),
	(null, 'Open Zone', 1, 12),
	(null, 'Open Zone', 1, 12),
	(null, 'Boom', 1, 12),
	(null, 'Boom', 1, 12),
	(null, 'Saturn', 1, 12),
	(null, 'Sonic CD', 1, 13),
	(null, 'Sonic CD', 1, 13),
	(null, 'Sonic CD', 1, 13),
	(null, 'Sonic CD', 1, 13),
	(null, 'Sonic CD', 1, 13),
	(null, 'Sonic CD', 1, 13),
	(null, 'Sonic CD', 1, 13),
	(null, 'Sonic Frontiers', 1, 13),
	(null, 'Sonic Frontiers', 1, 13),
	(null, 'Sonic Frontiers', 1, 13),
	(null, 'Sonic Frontiers', 1, 13),
	(null, 'Sonic Frontiers', 1, 13),
	(null, 'Sonic Colors', 1, 13),
	(null, 'Sonic Colors', 1, 13),
	(null, 'Sonic Colors', 1, 13),
	(null, 'Sonic Colors', 1, 13),
	(null, 'Sonic Heroes', 1, 13),
	(null, 'Sonic Heroes', 1, 13),
	(null, 'Sonic Heroes', 1, 13),
	(null, 'Sonic Mania', 1, 13),
	(null, 'Sonic Mania', 1, 13),
	(null, 'Sonic Runners', 1, 13);
    
-- DROP DASH/ATALHOS
-- TRUNCATE voto;