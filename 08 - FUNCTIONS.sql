-- PESQUISAR PACIENTE USANDO FUNÇÃO AO INVES DE PROCEDURE

CREATE FUNCTION fn_buscar_paciente_por_nome (@nome VARCHAR(100))
RETURNS TABLE
AS
RETURN
(
SELECT * FROM paciente
WHERE nome LIKE '%' + @nome + '%'
)
GO
-- TESTE PARA FUNCTION fn_buscar_paciente_por_nome
SELECT * FROM fn_buscar_paciente_por_nome('Sarah Simone Assunção')



-- FUNÇÃO QUE RECEBE A DATA DO AGENDAMENTO E CALCULA QUANTOS DIAS FALTAM ATÉ O AGENDAMENTO MARCADO

CREATE FUNCTION fn_dias_ate_o_agendamento(@AGENDAMENTO DATETIME)
RETURNS INT
AS
BEGIN
	
    DECLARE @dataAtual DATETIME
    DECLARE @dataInformada DATETIME   
    DECLARE @resultado INT
   
   SET @dataInformada = @AGENDAMENTO
   SET @dataAtual = GETDATE()
   
   SET @resultado = CONVERT(INTEGER, @dataInformada - @dataAtual) 

	RETURN  @resultado

END


-- TESTE PARA FUNCTION fn_dias_ate_o_agendamento
SELECT PAC.nome AS 'Nome do Paciente', AG.data AS 'Agendamento', dbo.fn_dias_ate_o_agendamento (AG.data) AS 'Dias até o agendamento' FROM paciente AS PAC
INNER JOIN agendamento AS AG
ON PAC.id_paciente = AG.id_paciente
WHERE AG.data > GETDATE()  