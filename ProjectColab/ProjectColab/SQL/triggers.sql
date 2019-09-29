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

	select 
		@nome = laboratorio_nome,
		@modelo = modelo,
		@quant = quantidade
	from Equipamento

	--Validar nome
	if(rtrim(ltrim(@nome)) = '')
	begin
		rollback transaction
		raiserror('O equipamento inserido deve pertencer a algum laboratorio', 0, 0)
	end	

	--Validar modelo
	if(rtrim(ltrim(@modelo)) = '')
	begin
		rollback transaction
		raiserror('O modelo do equipamento nao pode ser vazio', 0, 0)
	end	
	
	--Validar quantidade
	if(@quant <= 0)
	begin
		rollback transaction
		raiserror('A quantidade de equipamento deve ser um número maior que 0', 0, 0)
	end	

end