CREATE TABLE paciente(
	id_paciente INTEGER NOT NULL IDENTITY (1,1),
	nome VARCHAR (100) NOT NULL,
	telefone VARCHAR (20) NOT NULL,
	CONSTRAINT PK_id_paciente PRIMARY KEY (id_paciente)
);

CREATE TABLE endereco (
   id_endereco INTEGER NOT NULL IDENTITY (1,1) PRIMARY KEY,
   cep VARCHAR (9) NOT NULL,
   uf char (2) NULL,
   cidade VARCHAR (100) NULL,
   bairro VARCHAR (100) NULL,
   rua VARCHAR (100) NULL,
   numero INTEGER NULL,
   id_paciente INTEGER,
   CONSTRAINT FK_id_paciente FOREIGN KEY (id_paciente) 
                REFERENCES paciente (id_paciente)
);
  


CREATE TABLE dentista (
   id_dentista INTEGER NOT NULL IDENTITY (1,1),
   nome VARCHAR (100) NOT NULL,
   cro VARCHAR (10) NOT NULL,
   telefone VARCHAR (20) NOT NULL,
   PRIMARY KEY (id_dentista)
); 

CREATE TABLE agendamento (
   id_agendamento INTEGER NOT NULL IDENTITY (1,1),
   data DATETIME NOT NULL,
   desc_consulta VARCHAR (100) NOT NULL,
   id_paciente INTEGER NOT NULL,
   id_dentista INTEGER NOT NULL,
   CONSTRAINT PK_id_agendamento PRIMARY KEY (id_agendamento),
   FOREIGN KEY (id_paciente)
       REFERENCES paciente (id_paciente), 
   CONSTRAINT FK_id_dentista FOREIGN KEY (id_dentista)
	   REFERENCES dentista (id_dentista)
);

SELECT * FROM PACIENTE;
SELECT * FROM ENDERECO;
SELECT * FROM DENTISTA;
SELECT * FROM AGENDAMENTO;