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