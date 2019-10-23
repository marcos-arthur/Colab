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
	categoria_id INT ,	
	status INT NOT NULL,
	statusEI INT not null,
	resumo VARCHAR(500) NOT NULL,
	quant_equipamentos_defeituosos INT NOT NULL,
	data DATE NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(usuario_aberto_id) REFERENCES Usuario(id),
	FOREIGN KEY(sala_id) REFERENCES Salas(id),
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

/* DANGER ZONE - CUIDADO
drop table Comentario
drop table Tutorial
drop table Equipamento
drop table Chamado
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

		
INSERT INTO Usuario(nome,login,senha,tipo,status)									        --SENHAS:
	values	   
			('Administrador', 'admin', '21232f297a57a5a743894a0e4a801fc3', 1,1),			-- admin			
			('Servidor da Silva', 'serv', '27d08e8e003330f1880f0ff5d418c6f8', 2,1),		    -- serv
			('Bolsita Andrade', 'bols', '1b98a6a467a4f28e5292f187d202342d', 3,1),		    -- bols
			('Professor Soares', 'prof', 'd450c5dbcc10db0749277efc32f15f9f', 4, 1)	        -- prof

	

insert into categoria (nome) 
	values
		('Instalar software'),
		('Instalar sistema operacional'),
		('HD sem espaço de armazenamento'),
		('Computador não liga')
