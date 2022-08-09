
-- VIEW DADOS PUBLICOS DO DENTISTA
CREATE VIEW vw_dados_publicos_dentista AS(
SELECT DEN.nome, DEN.cro FROM dentista AS DEN);

SELECT * FROM vw_dados_publicos_dentista




-- VIEW AGENDAMENTOS DO DIA Relatório do dia -> todos os pacientes com todos os dentistas no dia de hoje
CREATE VIEW vw_agendamentos_do_dia AS(
SELECT PAC.nome AS 'Nome do Paciente', AG.data AS 'Agendamento', DEN.nome AS 'Dentista' FROM paciente AS PAC
INNER JOIN agendamento AS AG
ON PAC.id_paciente = AG.id_paciente
INNER JOIN dentista AS DEN
ON AG.id_dentista = DEN.id_dentista
WHERE DAY(AG.data) = DAY(GETDATE())
);

SELECT * FROM vw_agendamentos_do_dia;