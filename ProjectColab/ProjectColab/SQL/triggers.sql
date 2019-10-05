--validar dados de laboratório
drop trigger validar_lab
go
create trigger validar_lab on Laboratorios
for insert, update
as
begin

	--Declaracao de nome
	declare @nome varchar(100)

	select @nome = nome
	from Laboratorios

	--Validar nome
	if(rtrim(ltrim(@nome)) = '')
	begin
		rollback transaction
		raiserror('O novo laboratorio deve possuir um nome', 0, 0)
	end

	--Validar repetição de nome (Sem ideias de como fazer)
end
--validar dados de equipamento
drop trigger validar_equipamento
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

	select 
		@nome = laboratorio_nome,
		@modelo = modelo,
		@quant = quantidade,
		@erro = 0
	from Equipamento

	--Validar nome
	if(rtrim(ltrim(@nome)) = '')
	begin
		--rollback transaction
		raiserror('O equipamento inserido deve pertencer a algum laboratorio', 16, 1)
		select erro = 1 from Equipamento
		--return
	end	
	
	--Validar modelo
	if(rtrim(ltrim(@modelo)) = '')
	begin
		--rollback transaction
		raiserror('O modelo do equipamento nao pode ser vazio', 16, 1)
		select erro = 1 from Equipamento
		--return
	end	
	
	--Validar quantidade
	if(@quant <= 0)
	begin
		--rollback transaction
		raiserror('A quantidade de equipamento deve ser um número maior que 0', 16, 1)
		select erro = 1 from Equipamento
		--return
	end	

	--Validar erro
	if(@erro = 1)
	begin
		rollback transaction
	end
end
--validar dados de usuario
drop trigger validar_usuario
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

	select 
		@nome = nome,
		@login = login,
		@senha = senha,
		@tipo = tipo,
		@erro = 0

	from Usuario

	--Validar nome
	if(rtrim(ltrim(@nome)) = '')
	begin
		--rollback transaction
		raiserror('O nome do usuario nao deve ser vazio', 16, 1)
		select erro = 1 from Usuario
		--return
	end	
	
	--Validar login
	if(rtrim(ltrim(@login)) = '')
	begin
		--rollback transaction
		raiserror('O login do usuario nao pode ser vazio', 16, 1)
		select erro = 1 from Usuario
		--return
	end	
	
	--Validar senha
	if(len(@senha) > 20)  or (rtrim(ltrim(@senha)) = '')
	begin
		--rollback transaction
		raiserror('A senha deve ter menos que 20 caracteres e nao pode ser vazia', 16, 1)
		select erro = 1 from Usuario
		--return
	end	
	--Validar tipo
	if(@tipo > 4 or @tipo < 1)
	begin
		--rollback transaction
		raiserror('tipo invalido(tipo 2 = servirdor, tipo 3 = bolsita, tipo 4 = professor', 16, 1)
		select erro = 1 from Usuario
		--return
	end	

end