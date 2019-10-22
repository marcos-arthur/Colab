--validar dados de salas
--drop trigger validar_salas
go
create trigger validar_salas on Salas
for insert, update
as
begin

	--Declaracao de nome
	declare @nome varchar(100)

	select @nome = nome
	from inserted

	--Validar nome
	if(rtrim(ltrim(@nome)) = '')
	begin
		rollback transaction
		raiserror('A nova sala deve possuir um nome', 0, 0)
	end

	--Validar repetição de nome (Sem ideias de como fazer)
end
--validar dados de equipamento
--drop trigger validar_equipamento
go
create trigger validar_equipamento on Equipamento
for insert, update
as
begin

	--Declaracao de variaveis
	declare @nome varchar(45)
	declare @modelo varchar(45)
	declare @quant int
	declare @erro bit
	set @erro = 0 --controle para erros

	select 
		@nome = sala_nome,
		@modelo = modelo,
		@quant = quantidade	
	from inserted

	--Validar nome
	if(rtrim(ltrim(@nome)) = '')
	begin
		--rollback transaction
		raiserror('O equipamento inserido deve pertencer a alguma sala', 16, 1)
		set @erro = 1
		--return
	end	
	
	--Validar modelo
	if(rtrim(ltrim(@modelo)) = '')
	begin
		--rollback transaction
		raiserror('O modelo do equipamento nao pode ser vazio', 16, 1)
		set @erro = 1
		--return
	end	
	
	--Validar quantidade
	if(@quant <= 0)
	begin
		--rollback transaction
		raiserror('A quantidade de equipamento deve ser um número maior que 0', 16, 1)
		set @erro = 1
		--return
	end	

	--Validar erro
	if(@erro = 1)
	begin
		rollback transaction
	end
end
--validar dados de usuario
--drop trigger validar_usuario
go
create trigger validar_usuario on Usuario
for insert, update
as
begin

	--Declaracao de variaveis
	declare @nome varchar(100)
	declare @login varchar(20)
	declare @senha varchar (20)
	declare @tipo int
	declare @erro bit
	set @erro = 0 --controle para erros

	select 
		@nome = nome,
		@login = login,
		@senha = senha,
		@tipo = tipo
	from inserted

	--Validar nome
	if(rtrim(ltrim(@nome)) = '')
	begin
		--rollback transaction
		raiserror('O nome do usuario nao deve ser vazio', 16, 1)
		set @erro = 1
		--return
	end	
	
	--Validar login
	if(rtrim(ltrim(@login)) = '')
	begin
		--rollback transaction
		raiserror('O login do usuario nao pode ser vazio', 16, 1)
		set @erro = 1
		--return
	end
	
	--Validar senha
	if(len(@senha) > 20)  or (rtrim(ltrim(@senha)) = '')
	begin
		--rollback transaction
		raiserror('A senha deve ter menos que 20 caracteres e nao pode ser vazia', 16, 1)
		set @erro = 1
		--return
	end	

	--Validar tipo
	if(@tipo > 4 or @tipo < 1)
	begin
		--rollback transaction
		raiserror('tipo invalido(tipo 2 = servirdor, tipo 3 = bolsita, tipo 4 = professor', 16, 1)
		set @erro = 1
		--return
	end	
	--Validar erro
	if(@erro = 1)
	begin
		rollback transaction
	end
end
--validar dados de usuario
--drop trigger validar_tutorial
go
create trigger validar_tutorial on Tutorial
for insert, update
as
begin

	--Declaracao de variaveis
	declare @tutorial_titulo varchar(45)
	declare @status int
	declare @arquivo varbinary(max)
	declare @erro bit
	set @erro = 0

	select 
		@tutorial_titulo = tutorial_titulo,
		@status = status,
		@arquivo = arquivo
	from inserted

	--Validar nome
	if(rtrim(ltrim(@tutorial_titulo)) = '')
	begin
		--rollback transaction
		raiserror('O titulo do tutorial nao deve ser vazio', 16, 1)
		set @erro = 1 
		--return
	end	
	
	--Validar status
	if(@status > 3 or @status < 1)
	begin
		--rollback transaction
		raiserror('statuts invalido(1 - aguardando autorização, 2- nao autorizado, 3 - autorizado)', 16, 1)
		set @erro = 1 
		--return
	end	
	
	--Validar arquivo
	if(@arquivo = 0x)
	begin
		--rollback transaction
		raiserror('voce deve adiconar um arquivo ao novo tutorial', 16, 1)
		set @erro = 1 
		--return
	end	

	--Validar erro
	if(@erro = 1)
	begin
		rollback transaction
	end
	
end

--validar dados de chamado
--drop trigger validar_chamado
go
create trigger validar_chamado on Chamado
for insert, update
as
begin   

	--Declaracao de variaveis
	declare @resumo varchar(500)
	declare @quant_equipamentos_defeituosos int
    declare @sala_id varchar
	declare @erro bit
	set @erro = 0

	select 
		@resumo = resumo,
		@quant_equipamentos_defeituosos = quant_equipamentos_defeituosos,
		@sala_id = sala_id	
		
	from inserted
	DECLARE @totalmaq INT 
 select @totalmaq = SUM(quantidade) from equipamento where sala_id  = @sala_id
	

	--Validar o resumo
	if(rtrim(ltrim(@resumo)) = '')
	begin
		--rollback transaction
		raiserror('Para abrir um chamado você deve indicar o problema', 16, 1)
		set @erro = 1
		--return
	end	
	
	--Validar salas 
	if(@sala_id = '') or (@sala_id = 0)
	begin
		--rollback transaction
		raiserror('Voce deve selecionar a sala que possui equipamentos com defeito', 16, 1)
		set @erro = 1
		--return
	end	
	
	--Validar quantidade de maquinas com defeitos
	if(@quant_equipamentos_defeituosos < 1) 
	begin
		--rollback transaction
		raiserror('A quantidade de equipamentos deve ser um número maior que 0', 16, 1)
		set @erro = 1
		--return
	end	
	--Validar quantidade de maquinas com defeitos
	if(@quant_equipamentos_defeituosos > @totalmaq ) 
	begin
		--rollback transaction
		raiserror('Numero maximo de maquinas excedido', 16, 1)
		set @erro = 1
		--return
	end	

	--Validar erro
	if(@erro = 1)
	begin
		rollback transaction
	end
end

go
--drop trigger validar_comentario
create trigger validar_comentario on Comentario
for insert, update
as
begin
--Declaracao de variaveis
	declare @descricao varchar(256)
	declare @erro bit
	set @erro = 0

		select 
		@descricao = descricao
	from inserted

	--Validar o resumo
	if(rtrim(ltrim(@descricao)) = '')
	begin
		--rollback transaction
		raiserror('Insira um comentário', 16, 1)
		set @erro = 1
		--return
	end	

	--Validar erro
	if(@erro = 1)
	begin
		rollback transaction
	end
end