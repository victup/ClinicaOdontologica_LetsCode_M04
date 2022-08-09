-- PROCEDURE CRIAR PACIENTE
CREATE PROCEDURE pr_cadastrar_paciente(@nome VARCHAR(100), @telefone VARCHAR(20))
AS
BEGIN

	DECLARE @msg VARCHAR(100)

	IF ((@nome IS NOT NULL AND @telefone IS NOT NULL) AND (@nome != '' AND @telefone != '' ))
		BEGIN
		   INSERT INTO paciente VALUES(@nome, @telefone);
		   SET @msg = 'Paciente inserido com sucesso';
		   PRINT @msg
		END
		--ELSE
		ELSE
		BEGIN
			SET @msg = 'Não foi possivel inserir o paciente, pois um ou mais parâmetros está(ão) vazios.';
			PRINT @msg
		END
END

EXECUTE pr_cadastrar_paciente 'Mario', '0119999222556'; 
SELECT * FROM paciente;



-- PROCEDURE ATUALIZAR PACIENTE
CREATE PROCEDURE pr_atualizar_paciente(@id_paciente INTEGER, @nome VARCHAR(100), @telefone VARCHAR(20))
AS
BEGIN

	DECLARE @msg VARCHAR(100)

	IF ((@nome IS NOT NULL AND @telefone IS NOT NULL AND @id_paciente IS NOT NULL) AND (@nome != '' AND @telefone != '' AND @id_paciente != '' ))
		BEGIN
			UPDATE paciente
			SET nome = @nome, telefone = @telefone
			WHERE id_paciente = @id_paciente

		   SET @msg = 'Paciente atualizado com sucesso'

		   PRINT @msg
		END
		--ELSE
		ELSE
		BEGIN
			SET @msg = 'Não foi possivel atualizar o paciente, pois um ou mais parâmetros está(ão) vazios.';
			PRINT @msg
		END
END


EXECUTE pr_atualizar_paciente 21,'Mario Santos', '6161616'; 
SELECT * FROM paciente;






-- PROCEDURE APAGAR PACIENTE
CREATE PROCEDURE pr_apagar_paciente(@id_paciente INTEGER)
AS
BEGIN

	DECLARE @msg VARCHAR(100)
	DECLARE @id_para_apagar INTEGER
	
	SELECT @id_para_apagar = id_paciente FROM paciente WHERE id_paciente = @id_paciente

	IF ((@id_para_apagar IS NOT NULL) AND (@id_para_apagar != '' ))
		BEGIN


			DELETE FROM paciente WHERE id_paciente = @id_para_apagar;

		   SET @msg = 'Paciente apagado da base de dados'

		   PRINT @msg
		END
		--ELSE
		ELSE
		BEGIN
			SET @msg = 'Não foi possivel apagar o paciente, o ID informado pode não corresponder a nenhum dado contido no BD.';
			PRINT @msg
		END
END

EXECUTE pr_apagar_paciente 21; 
SELECT * FROM paciente;
