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
	login VARCHAR(20) NOT NULL,
	senha VARCHAR(20) NOT NULL,
	tipo INT NOT NULL, /* TIPO DE USUARIO : BOLSISTA,SERVIDOR,REQUISITANTE,ADMINISTRADOR */
	foto image NOT NULL,
    	PRIMARY KEY(id)
)
CREATE TABLE Equipamento(
	id INT IDENTITY NOT NULL,
	laboratorio_id INT NOT NULL,
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
	arquivo VARCHAR(500) NOT NULL,
	status INT NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(usuario_id) REFERENCES Usuario(id)	
)
SELECT id, status,
CASE WHEN status = 3 THEN 'SENDO ANALIZADO'
WHEN status = 2 THEN 'APROVADO'
ELSE 'NÃO APROVADO'
END AS statustext
FROM Tutorial;

INSERT INTO Usuario(nome,login,senha,tipo,foto) values ('1','1','1',1,'1')
SELECT *,lab.nome

FROM Equipamento eqip
INNER JOIN Laboratorios lab ON lab.id = eqip.laboratorio_id

order by eqip.id