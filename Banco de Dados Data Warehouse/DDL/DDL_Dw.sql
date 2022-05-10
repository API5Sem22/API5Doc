CREATE TABLE Dim_Cidade (
    cid_id int IDENTITY(1, 1),
    cid_id_origem int,
    cid_nome varchar(50),
    cid_estado varchar(2),
    cid_regiao varchar(10),
    CONSTRAINT pk_cidade PRIMARY KEY  (cid_id)
);

CREATE TABLE Dim_Cnae (
    cne_id int IDENTITY(1, 1),
    cne_id_origem int,
    cne_cod varchar(10),
    cne_descricao varchar(150),
    CONSTRAINT pk_cnae PRIMARY KEY  (cne_id)
);

CREATE TABLE Dim_Empresa (
    emp_id int IDENTITY(1, 1),
    emp_id_origem  int,
    emp_cnpj varchar(30),
    emp_origem varchar(30),
    emp_nome varchar(150),
    emp_porte varchar(200),
    emp_tipo varchar(50),
    emp_situacao varchar(50),
    emp_data_abertura varchar(50),
    emp_email varchar(80),
    emp_telefone varchar(80),
    emp_natureza varchar(100),
    emp_nivel varchar(20),
    emp_prospecao varchar(30),
    CONSTRAINT pk_empresa PRIMARY KEY  (emp_id)
);

CREATE TABLE Dim_Produto (
    prd_id int IDENTITY(1, 1),
    prd_codigo int,
    CONSTRAINT pk_produto PRIMARY KEY  (prd_id)
);

CREATE TABLE Dim_Tempo (
    tmp_id int IDENTITY(1, 1),
    tmp_mes_referencia varchar(100),
    CONSTRAINT pk_tempo PRIMARY KEY  (tmp_id)
);

CREATE TABLE FatoConsumo (
    Dim_Cidade_cid_id int,
    Dim_Cnae_cne_id int,
    Dim_Tempo_tmp_id int,
    Dim_Produto_prd_id int,
    Dim_Empresa_emp_id int,
    consumo int  NOT NULL,
    CONSTRAINT FatoConsumo_pk PRIMARY KEY  (Dim_Cidade_cid_id,Dim_Cnae_cne_id,Dim_Tempo_tmp_id,Dim_Produto_prd_id,Dim_Empresa_emp_id)
);

ALTER TABLE FatoConsumo ADD CONSTRAINT fk_cidade_consumo_cid_id
    FOREIGN KEY (Dim_Cidade_cid_id)
    REFERENCES Dim_Cidade (cid_id);

ALTER TABLE FatoConsumo ADD CONSTRAINT fk_cnae_consumo_cnae_id
    FOREIGN KEY (Dim_Cnae_cne_id)
    REFERENCES Dim_Cnae (cne_id);

ALTER TABLE FatoConsumo ADD CONSTRAINT fk_empresa_id_emp_id
    FOREIGN KEY (Dim_Empresa_emp_id)
    REFERENCES Dim_Empresa (emp_id);

ALTER TABLE FatoConsumo ADD CONSTRAINT fk_produto_consumo_prd_id
    FOREIGN KEY (Dim_Produto_prd_id)
    REFERENCES Dim_Produto (prd_id);

ALTER TABLE FatoConsumo ADD CONSTRAINT fk_tempo_consumo_tmp_id
    FOREIGN KEY (Dim_Tempo_tmp_id)
    REFERENCES Dim_Tempo (tmp_id);


