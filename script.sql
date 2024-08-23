-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE CLIENTE (
	numeroID 	int PRIMARY KEY NOT NULL,
	nome 		varchar(100) NOT NULL,
	endereco 	varchar(100) NOT NULL,
	telefone 	varchar(15)  NOT NULL,
	email 		varchar(100) NOT NULL,
	dataCadastro date NOT NULL,
	status 		varchar(15) NOT NULL
);

CREATE TABLE PESSOA_FISICA (
	numeroID 	int PRIMARY KEY NOT NULL, -- CHAVE ESTRANGEIRA
	sexo 		char NOT NULL,
	estadoCivil varchar(10) NOT NULL,
	habilitacao varchar(15) NOT NULL,
	profissao 	varchar(50) NULL,
	cpf 		varchar(15) NOT NULL,
	rg 			varchar(15) NOT NULL,
	faixaRenda 	decimal(9,2) NULL,
	dataNasc 	date NOT NULL,
	FOREIGN KEY(numeroID) REFERENCES CLIENTE (numeroID)
);

CREATE TABLE PESSOA_JURIDICA (
	numeroID 			int PRIMARY KEY NOT NULL, -- CHAVE ESTRANFEIRA
	razaoSocial 		varchar(100) NOT NULL,
	cnpj 				varchar(15)  NOT NULL,
	inscricaoEstadual 	varchar(15)  NOT NULL,
	contatoResponsavel  varchar(100) NULL,
	ramoAtividade 		varchar(50)  NULL,
	FOREIGN KEY(numeroID) REFERENCES CLIENTE (numeroID)
);

CREATE TABLE VEICULO (
	numeroRegistro 	int PRIMARY KEY NOT NULL,
	marca 			varchar(20) NOT NULL,
	modelo 			varchar(20) NOT NULL,
	anoFabricacao 	int NOT NULL,
	tipo 			varchar(20) NOT NULL,
	placa 			varchar(10) NOT NULL,
	IDCliente 		int NOT NULL, -- CHAVE ESTRANGEIRA
	FOREIGN KEY(numeroID) REFERENCES CLIENTE (numeroID)
);

CREATE TABLE ACIDENTE (
	numeroID 		int PRIMARY KEY NOT NULL,
	dataAcidente 	date NOT NULL,
	hora 			time NOT NULL,
	localAcidente 	varchar(100) NOT NULL,
	descricao 		varchar(200) NOT NULL,
	numeroVeiculo 	int NOT NULL, -- chave ESTRANGEIRA
	FOREIGN KEY(numeroRegistro) REFERENCES VEICULO (numeroRegistro)
);

CREATE TABLE APOLICE (
	numeroApolice 	int PRIMARY KEY NOT NULL,
	descricao 		varchar(100) NOT NULL,
	valor 			decimal(9,2) NOT NULL,
	numeroVeiculo 	int NOT NULL, -- CHAVE ESTRANGEIRA
	FOREIGN KEY(numeroRegistro) REFERENCES VEICULO (numeroRegistro)
);

