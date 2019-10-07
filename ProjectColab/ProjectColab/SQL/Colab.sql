CREATE TABLE Laboratorios(
	id INT IDENTITY NOT NULL,
	nome VARCHAR(100) NOT NULL,	
	PRIMARY KEY(id)
)

CREATE TABLE Categoria(
	id int IDENTITY NOT NULL,
	nome VARCHAR(60) NOT NULL,
	PRIMARY KEY(id)
)
CREATE TABLE Usuario(
	id INT IDENTITY NOT NULL,
	nome VARCHAR(100) NOT NULL,
	login VARCHAR(100) NOT NULL,
	senha VARCHAR(100) NOT NULL,
	tipo INT NOT NULL, /* TIPO DE USUARIO : BOLSISTA(3), SERVIDOR(2), REQUISITANTE(4), ADMINISTRADOR(1) */
	foto image NOT NULL,
    	PRIMARY KEY(id)
)
CREATE TABLE Equipamento(
	id INT IDENTITY NOT NULL,
	laboratorio_id INT NOT NULL,
	laboratorio_nome VARCHAR(45) NOT NULL,
	modelo VARCHAR(45) NOT NULL,
	quantidade INT NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(laboratorio_id) REFERENCES Laboratorios(id)
)

CREATE TABLE Chamado(
	id INT IDENTITY NOT NULL,
	usuario_aberto_id INT ,
	usuario_atribuido_id INT,
	laboratorios_id INT ,
	categoria_id INT ,
	status INT NOT NULL,
	resumo VARCHAR(500) NOT NULL,
	quant_equipamentos_defeituosos INT NOT NULL,
	data DATE NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(usuario_aberto_id) REFERENCES Usuario(id),
	FOREIGN KEY(laboratorios_id) REFERENCES Laboratorios(id),
	FOREIGN KEY(categoria_id) REFERENCES Categoria(id)
)

CREATE TABLE Patrimonio(
	id INT IDENTITY NOT NULL,
	chamados_id INT,
	numero_patrimonio VARCHAR(45) NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(chamados_id) REFERENCES Chamado(id)
)
CREATE TABLE Comentario(
	id INT IDENTITY NOT NULL,
	usuario_id INT NOT NULL,
	chamados_id INT NOT NULL,
	data_hora DATETIME NOT NULL,
	descricao VARCHAR(256) NOT NULL,
	restricao VARCHAR(25) NOT NULL,
	PRIMARY KEY(id), 
	FOREIGN KEY(usuario_id) REFERENCES Usuario(id),
	FOREIGN KEY(chamados_id) REFERENCES Chamado(id)
)
CREATE TABLE Tutorial(
	id INT IDENTITY NOT NULL,
	usuario_id INT,
	tutorial_titulo VARCHAR(45) NOT NULL,
	arquivo varbinary(max) NOT NULL,
	status INT NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(usuario_id) REFERENCES Usuario(id)	
)

select * from tutorial

/*
SELECT *,
CASE WHEN status = 3 THEN 'SENDO ANALIZADO'
WHEN status = 2 THEN 'APROVADO'
ELSE 'NÃO APROVADO'
END AS statustext
FROM Tutorial;

SELECT *,
CASE WHEN status = 1 THEN 'ABERTO'
WHEN status = 2 THEN 'EM ATENDIMENTO'
WHEN status = 3 THEN 'FECHADO'
ELSE 'REABERTO'
END AS statustextchamado
FROM Chamado;



INSERT INTO Usuario(nome,login,senha,tipo,foto) values ('1','1','1',1,'1')
SELECT *,lab.nome

FROM Equipamento eqip
INNER JOIN Laboratorios lab ON lab.id = eqip.laboratorio_id

order by eqip.id

select id from Laboratorios 
	where nome = 'Lab13'

INSERT INTO Equipamento(laboratorio_id, laboratorio_nome, modelo, quantidade)

VALUES(4,'3','Modelo',2)

select * from Laboratorios
select * from Equipamento
*/



/* DANGER ZONE - CUIDADO
drop table Comentario
drop table Patrimonio
drop table Chamado
drop table Categoria
drop table Equipamento
drop table Laboratorios
drop table Tutorial
drop table Usuario
*/

-- INSERT DE USUARIOS - USAR PARA TESTES

	/* TIPOS DE USUARIO
		
		1 -	ADMINISTRADOR
		2 -	SERVIDOR 
		3 -	BOLSISTA 
		4 - REQUISITANTE

	*/

/*	
	INSERT INTO Usuario(nome,login,senha,tipo,foto)																											--senhas:
		values ('Diogo', 'diosgo01', 'cb206c19858b4bc15820c04b5faaccb0', 1, 'https://suap.ifrn.edu.br/media/alunos/197963.BwCp51rvMkMu.jpg')				--saintseya

	INSERT INTO Usuario(nome,login,senha,tipo,foto) 
		values ('Luenne', 'Luennia', '7948d34b40b3a90b8f926ebcf37c1d80', 2,'https://suap.ifrn.edu.br/media/alunos/194243.RusOjks8L25T.jpg')					--kpop4ever

	INSERT INTO Usuario(nome,login,senha,tipo,foto) 
		values ('Marcos', 'Pas0c4', '9a91473e3dcdf8bae307c9f4081f9b0a', 3, 'https://suap.ifrn.edu.br/media/alunos/193956.BIejA77cHAJJ.jpg')					--EZClap

	INSERT INTO Usuario(nome,login,senha,tipo,foto) 
		values ('Vitórias', 'Victorique', 'jwI5f1df35db605b479c2dde6a3b25529b8sLife', 4, 'https://suap.ifrn.edu.br/media/alunos/194384.ZwxkYFJoFdJb.jpg')	--jwIsLife
*/

--Select * from usuario
--Select * from laboratorios
--Select * from Chamado

/*
 --Teste da atribuição de chamados
 SELECT count(c1.id) as count, count(c2.id) as myCount


 --COUNT(*) as count 
	FROM Chamado c1 
	inner join chamado c2 on c1.id = c1.usuario_atribuido_id

select * from chamado
SELECT * FROM Chamado where usuario_atribuido_id = 2

select count(c1.id) as count, count(c2.id) as myCount
from chamado c1 inner join chamado c2
on c2.id = c1.id where usuario_atribuido_id = 2

SELECT COUNT(*) as count FROM Chamado
SELECT * FROM Chamado
SELECT COUNT(*) as count FROM Chamado where usuario_atribuido_id = 1

SELECT COUNT(*) as count FROM Chamado where usuario_atribuido_id = 2

SELECT COUNT(*) as count FROM Chamado where usuario_atribuido_id = 3

SELECT COUNT(*) as count FROM Chamado where usuario_atribuido_id = 4

insert into Chamado(usuario_aberto_id, usuario_atribuido_id, laboratorios_id, status, resumo, quant_equipamentos_defeituosos, data)
	values(1, 1, 1, 1, 'TESTE1', 1, GETDATE())

insert into Chamado(usuario_aberto_id, usuario_atribuido_id, laboratorios_id, status, resumo, quant_equipamentos_defeituosos, data)
	values(1, 1, 1, 1, 'TESTE2', 1, GETDATE())

insert into Chamado(usuario_aberto_id, usuario_atribuido_id, laboratorios_id, status, resumo, quant_equipamentos_defeituosos, data)
	values(1, 2, 1, 1, 'TESTE3', 1, GETDATE())

insert into Chamado(usuario_aberto_id, usuario_atribuido_id, laboratorios_id, status, resumo, quant_equipamentos_defeituosos, data)
	values(1, 3, 1, 1, 'TESTE4', 1, GETDATE())

insert into Chamado(usuario_aberto_id, usuario_atribuido_id, laboratorios_id, status, resumo, quant_equipamentos_defeituosos, data)
	values(1, 3, 1, 1, 'TESTE5', 1, GETDATE())


select * from usuario where tipo = 3 or tipo = 2

select * from Chamado


SELECT count(case when usuario_atribuido_id LIKE 3 then 1 end) as myCount, 
    count(*) as count,
	count(case when usuario_atribuido_id IS NULL then 1 end) as noCount
FROM Chamado 

*/

/*
INSERT INTO Usuario(nome,login,senha,tipo,foto)																											--senhas:
		values ('Diogo', 'diosgo01', '', 1, 'https://suap.ifrn.edu.br/media/alunos/197963.BwCp51rvMkMu.jpg')
		

SELECT id,usuario_aberto_id,laboratorios_id, usuario_atribuido_id, status,resumo,quant_equipamentos_defeituosos,data,CASE WHEN status = 1 THEN 'ABERTO'WHEN status = 2 THEN 'EM ATENDIMENTO'WHEN status = 3 THEN 'FECHADO'ELSE 'REABERTO' END AS statuschamado FROM Chamado where usuario_atribuido_id = 2	

select * from chamado*/

