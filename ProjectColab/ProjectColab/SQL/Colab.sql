CREATE TABLE Salas(
id INT IDENTITY NOT NULL,
nome VARCHAR(100) NOT NULL,
status int not null,
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
tipo INT NOT NULL,
status int not null,
PRIMARY KEY(id)
)

CREATE TABLE Equipamento(
id INT IDENTITY NOT NULL,
sala_id INT NOT NULL,
sala_nome VARCHAR(45) NOT NULL,
modelo VARCHAR(45) NOT NULL,
quantidade INT NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY(sala_id) REFERENCES Salas(id)
)

CREATE TABLE Chamado(
id INT IDENTITY NOT NULL,
usuario_aberto_id INT ,
usuario_atribuido_id INT,
sala_id INT ,
equip_id INT,
tombamento VARCHAR(500),
categoria_id INT ,
status INT NOT NULL,
statusEI INT not null,
resumo VARCHAR(500) NOT NULL,
quant_equipamentos_defeituosos INT NOT NULL,
data DATE NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY(usuario_aberto_id) REFERENCES Usuario(id),
FOREIGN KEY(sala_id) REFERENCES Salas(id),
FOREIGN KEY(equip_id) REFERENCES Equipamento(id),
FOREIGN KEY(categoria_id) REFERENCES Categoria(id)
)

CREATE TABLE Comentario(
id INT IDENTITY NOT NULL,
usuario_id INT NOT NULL,
chamados_id INT NOT NULL,
data_hora DATETIME NOT NULL,
descricao VARCHAR(256) NOT NULL,
restricao VARCHAR(25) NOT NULL,
status int NOT NULL,
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
CREATE TABLE Assunto(
	id INT IDENTITY NOT NULL,
	titulo VARCHAR(100) NOT NULL,
	PRIMARY KEY(id)
)

CREATE TABLE Tutorial_Assunto(
	tutorial_id INT NOT NULL,
	assunto_id INT NOT NULL,
	FOREIGN KEY (tutorial_id) REFERENCES Tutorial(id),
	FOREIGN KEY (assunto_id) REFERENCES Assunto(id)
)

/* DANGER ZONE - CUIDADO
drop table Comentario
drop table Tutorial_Assunto
drop table Tutorial
drop table Assunto
drop table Chamado
drop table Equipamento
drop table Categoria
drop table Salas
drop table Usuario
*/

-- INSERT DE USUARIOS - USAR PARA TESTES

/* TIPOS DE USUARIO

1 -	ADMINISTRADOR
2 -	SERVIDOR 
3 -	BOLSISTA 
4 - REQUISITANTE
*/

/* Status de Chamados

1 - Aberto
2 - Em andamento
3 - Fechado
4 - Reaberto
*/
INSERT INTO Usuario(nome,login,senha,tipo,status) --SENHAS:
values
('Administrador', 'admin', '21232f297a57a5a743894a0e4a801fc3', 1,1), -- admin
('Servidor da Silva', 'serv', '27d08e8e003330f1880f0ff5d418c6f8', 2,1), -- serv
('Bolsita Andrade', 'bols', '1b98a6a467a4f28e5292f187d202342d', 3,1), -- bols
('Professor Soares', 'prof', 'd450c5dbcc10db0749277efc32f15f9f', 4, 1) -- prof

insert into Categoria (nome) 
	values
		('Instalar software'),
		('Instalar sistema operacional'),
		('HD sem espaço de armazenamento'),
		('Computador não liga')

insert into Assunto(titulo) 
	values
		('Instalar software'),
		('Instalar sistema operacional'),
		('HD sem espaço de armazenamento'),
		('Computador não liga')

insert into Tutorial_Assunto(tutorial_id, assunto_id)
	values
		(2, 4)

select * from tutorial
select * from assunto



select	tut.*,
		Assun.titulo as Assunto,
		Assun.id as idAssunto

from Tutorial as tut
inner join Tutorial_Assunto as TA on tut.id = TA.tutorial_id
inner join Assunto as Assun on Assun.id = TA.assunto_id
where tut.tutorial_titulo like '%lattes%' and Assun.id = 2


--tutorial_titulo like '%" + titulo + "%' and Assun.titulo = assunto

select * from Chamado