--drop function validarCPF

create function validarCpf(@cpf varchar(11))
returns bit --BIT aceita somente 0 (false) ou 1 (true) 
as 
begin
	--declara variavel de retorno com valor 0 (false)
	declare @verificacao bit = 0
	if @cpf like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' --verifica se os campos do cpf estão preenchidos corretamente
	begin

		--declaração de variaveis
		declare @pnverificacao float = 0
		declare @soma1 int = 0
		declare @soma2 int = 0
		declare @i int = 0
		declare @digito1 int = 0
		declare @digito2 int = 0
		--fim da declaração de variaveis


		while( @i < 9)
			--multiplica os nove primeiros digitos do cpf por 10,9,8,7... 
			begin
				set @soma1 = @soma1 + convert(int,substring(@cpf,@i +1,1)) * (10 - @i)    
				set @i = @i + 1
			end
			--fim do while
		--se o resto for menor que 2 execute
		if (@soma1%11 < 2 )
		begin
			set @digito1 = 0
		end
		--fim do if

		--se o resto for maior que 2 execute
		else
			begin
				set @digito1 = 11 - @soma1%11
			end
		--fim do if


		set @i = 0 --reseta o valor de "i"
		while( @i < 10)
			--multiplica os dez primeiros digitos do cpf por 11,10,9,8,7... 
			begin
				set @soma2 = @soma2 + convert(int,substring(@cpf,@i +1,1)) * (11 - @i)   
				set @i = @i + 1
			end
			--fim do while
		
		--se o resto for menor que 2 execute
		if (@soma2%11 < 2 )
		begin
			set @digito2 = 0
		end
		--fim do if

		--se o resto for maior que 2 execute
		else
			begin
				set @digito2 = 11 - @soma2%11
			end
		--fim do if
		--verifica se o 10 e o 11 digitos do cpf estão corretos
		if(convert(int,substring(@cpf,10,1)) = @digito1 and convert(int,substring(@cpf,11,1)) = @digito2)
		begin
			set @verificacao = 1
		end
		else
		begin
			set @verificacao = 0
		end
		--fim da verificação

	end
	--return @verificacao
	--return @digito1
	return @verificacao
end
GO
