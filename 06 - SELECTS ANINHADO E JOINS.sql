-- SELECT ANINHADO 
--Busca por paciente -> quais datas de agendamento do paciente
SELECT data FROM agendamento
WHERE id_paciente IN (SELECT id_paciente FROM paciente WHERE nome LIKE 'Calebe Mário Martins');


-- SELECT COM JOINS
--Busca por pacientes do dentista -> quais os pacientes atendidos pelo dentista
SELECT  pac.nome, pac.telefone FROM paciente AS pac
INNER JOIN Agendamento AS ag
ON pac.id_paciente = ag.id_paciente
INNER JOIN dentista AS den
ON ag.id_dentista = den.id_dentista
WHERE den.nome = 'Nina Benedita Duarte';