CREATE TABLE Dim_Cidade (
    cid_id int IDENTITY(1, 1),
    cid_nome varchar(50)  NULL,
    cid_estado varchar(2)  NULL,
    cid_regiao varchar(10)  NULL,
    CONSTRAINT pk_cidade PRIMARY KEY  (cid_id)
);

CREATE TABLE Dim_Cnae (
    cne_id int IDENTITY(1, 1),
    cne_cod varchar(10)  NULL,
    cne_descricao varchar(150)  NULL,
    CONSTRAINT pk_cnae PRIMARY KEY  (cne_id)
);

CREATE TABLE Dim_Empresa (
    emp_cnpj varchar(30),
    emp_origem varchar(15)  NULL,
    emp_nome varchar(100)  NULL,
    emp_porte varchar(10)  NULL,
    emp_tipo varchar(10)  NULL,
    emp_situacao varchar(10)  NULL,
    emp_data_abertura varchar(10)  NULL,
    emp_email varchar(80)  NULL,
    emp_telefone varchar(20)  NULL,
    emp_natureza varchar(50)  NULL,
    CONSTRAINT pk_empresa PRIMARY KEY  (emp_cnpj)
);

CREATE TABLE Dim_Produto (
    prd_id int IDENTITY(1, 1),
    prd_codigo int  NULL,
    CONSTRAINT pk_produto PRIMARY KEY  (prd_id)
);

CREATE TABLE Dim_Tempo (
    tmp_id int IDENTITY(1, 1),
    tmp_dia varchar(2)  NULL,
    tmp_mes varchar(2)  NULL,
    tmp_ano varchar(4)  NULL,
    CONSTRAINT pk_tempo PRIMARY KEY  (tmp_id)
);

CREATE TABLE Fato_Consumo (
    Dim_Cidade_cid_id int,
    Dim_Cnae_cne_id int,
    Dim_Empresa_emp_cnpj varchar(30),
    Dim_Tempo_tmp_id int,
    Dim_Produto_prd_id int,
    consumo int  NOT NULL,
    CONSTRAINT Fato_Consumo_pk PRIMARY KEY  (Dim_Cidade_cid_id,Dim_Cnae_cne_id,Dim_Empresa_emp_cnpj,Dim_Tempo_tmp_id,Dim_Produto_prd_id)
);

ALTER TABLE Fato_Consumo ADD CONSTRAINT fk_cidade_consumo_cid_id
    FOREIGN KEY (Dim_Cidade_cid_id)
    REFERENCES Dim_Cidade (cid_id);

ALTER TABLE Fato_Consumo ADD CONSTRAINT fk_cnae_consumo_cnae_id
    FOREIGN KEY (Dim_Cnae_cne_id)
    REFERENCES Dim_Cnae (cne_id);

ALTER TABLE Fato_Consumo ADD CONSTRAINT fk_empresa_consumo_emp_cnpj
    FOREIGN KEY (Dim_Empresa_emp_cnpj)
    REFERENCES Dim_Empresa (emp_cnpj);

ALTER TABLE Fato_Consumo ADD CONSTRAINT fk_produto_consumo_prd_id
    FOREIGN KEY (Dim_Produto_prd_id)
    REFERENCES Dim_Produto (prd_id);

ALTER TABLE Fato_Consumo ADD CONSTRAINT fk_tempo_consumo_tmp_id
    FOREIGN KEY (Dim_Tempo_tmp_id)
    REFERENCES Dim_Tempo (tmp_id);


