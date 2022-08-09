-- TRIGGER LOGS AGENDAMENTO

CREATE TRIGGER dispara_logs_agendamento
ON agendamento
AFTER INSERT,UPDATE, DELETE
AS
	BEGIN
	DECLARE @comando CHAR(6)
	SET @comando = CASE
		WHEN EXISTS (SELECT * FROM inserted) AND EXISTS(SELECT * FROM deleted)
            THEN 'Update'
        WHEN EXISTS(SELECT * FROM inserted)
            THEN 'Insert'
        WHEN EXISTS(SELECT * FROM deleted)
            THEN 'Delete'
        ELSE NULL
    END 
IF @comando = 'Delete'
        INSERT INTO agendamento_logs (comando, data_log, coluna_anterior, coluna_atual, coluna_valor_anterior, coluna_valor_atual, usuario)
        SELECT @comando, GETDATE(), d.data, d.desc_consulta, d.id_paciente, d.id_dentista, USER_NAME() 
        FROM deleted AS d
    IF @comando = 'Insert'
        INSERT INTO agendamento_logs (comando, data_log, coluna_anterior, coluna_atual, coluna_valor_anterior, coluna_valor_atual, usuario)
        SELECT @comando, GETDATE(), i.data, i.desc_consulta, i.id_paciente, i.id_dentista, USER_NAME() 
        FROM inserted AS i
    IF @comando = 'Update'
        INSERT INTO agendamento_logs (comando, data_log, coluna_anterior, coluna_atual, coluna_valor_anterior, coluna_valor_atual, usuario)
        SELECT @comando, GETDATE(), di.data, di.desc_consulta, di.id_paciente, di.id_dentista,USER_NAME() -- i.data, i.desc_consulta, i.id_paciente, i.id_dentista,  
        FROM deleted, inserted AS di --, inserted AS i
END


-- TRIGGER MENSAGEM QUANDO FEZ UPDATE EM NOME OU TELEFONE DE DENTISTA

CREATE TRIGGER atualização_cadastro_dentista
ON dentista
AFTER UPDATE
AS
IF (UPDATE (nome) OR UPDATE (telefone))
	BEGIN
		PRINT ('PRONTO! Os dados do dentista foram alterados')
	END
ELSE
	BEGIN
		PRINT 'Os dados NÃO foram alterados'
	END


UPDATE 
	dentista
SET	
	telefone = '74 99989-7717',
	nome = 'Lourdes Reis'
WHERE
	id_dentista = 2


-- TRIGGER MENSAGEM QUANDO FEZ UPDATE EM NOME OU TELEFONE DE PACIENTE

CREATE TRIGGER atualização_cadastro_paciente
ON Paciente 
AFTER UPDATE
AS
IF (UPDATE (nome) OR UPDATE (telefone))
	BEGIN
		PRINT 'PRONTO!Os dados do paciente foram alterados'
	END
ELSE
	BEGIN
		PRINT 'Os dados NÃO foram alterados'
		END

		

UPDATE 
	paciente
SET	
	telefone = '64 99989-6712',
	nome = 'Eduardo Moscovis'
WHERE
	id_paciente = 2

-- TRIGGER MENSAGEM QUANDO FEZ UPDATE EM DATA DO AGENDAMENTO

CREATE TRIGGER atualização_data_agendamento
ON Agendamento
AFTER UPDATE
AS
IF (UPDATE (data))
	BEGIN
		PRINT 'PRONTO! Data de agendamento alterada'
	END
ELSE
	BEGIN
		PRINT 'NÃO foi possível alter a data'
	END

	

UPDATE 
	agendamento
SET	
	data = '2022/08/05'	
WHERE
	id_agendamento = 2
