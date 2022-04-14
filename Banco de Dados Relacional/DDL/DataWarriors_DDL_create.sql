CREATE TABLE Cargo (
    car_id int IDENTITY(1, 1),
    car_descricao varchar(50)  NOT NULL,
    CONSTRAINT uk_cargo_descricao UNIQUE (car_descricao),
    CONSTRAINT pk_cargo PRIMARY KEY  (car_id)
);

CREATE TABLE Carteira (
    crt_id int IDENTITY(1, 1),
    crt_descricao varchar(50)  NOT NULL,
    CONSTRAINT uk_carteira_descricao UNIQUE (crt_descricao),
    CONSTRAINT pk_carteira_id PRIMARY KEY  (crt_id)
);

CREATE TABLE Cidade (
    cid_id int,
    cid_nome varchar(50),
    cid_estado varchar(2),
    cid_regiao varchar(10),
    CONSTRAINT pk_cidade PRIMARY KEY  (cid_id)
);

CREATE TABLE Cnae (
    cne_id int,
    cne_cod int,
    cne_descricao varchar(150),
    CONSTRAINT pk_cnae PRIMARY KEY  (cne_id)
);

CREATE TABLE Consumo (
    csm_id int IDENTITY(1, 1),
    emp_cnpj_d varchar(30),
    csm_mes_referencia varchar(15),
    csm_id_produto varchar(100),
    csm_quantidade_consumo int,
    CONSTRAINT Consumo_pk PRIMARY KEY  (csm_id)
);

CREATE TABLE Empresa (
    emp_id int IDENTITY(1, 1),
    emp_cnpj_d varchar(30),
    cid_id int,
    cne_id int,
    usu_email varchar(80),
    emp_nivel varchar(5),
    emp_origem varchar(30),
    CONSTRAINT pk_empresa PRIMARY KEY  (emp_id)
);

CREATE TABLE Empresa_Descricao (
    emp_cnpj_d varchar(30),
    emp_nome_d varchar(100),
    emp_porte_d varchar(10),
    emp_tipo_d varchar(10),
    emp_situacao_d varchar(10),
    emp_data_abertura_d varchar(10),
    emp_email_d varchar(80),
    emp_telefone_d varchar(20),
    emp_natureza_juridica_d varchar(50),
    CONSTRAINT pk_empresa_descricao PRIMARY KEY  (emp_cnpj_d)
);

CREATE TABLE Usuario (
    usu_email varchar(80),
    usu_nome varchar(80)  NOT NULL,
    usu_senha varchar(30)  NOT NULL,
    usu_departamento varchar(80),
    car_id int,
    crt_id int,
    CONSTRAINT pk_usuario_email PRIMARY KEY  (usu_email)
);

ALTER TABLE Consumo ADD CONSTRAINT Consumo_Empresa_Descricao
    FOREIGN KEY (emp_cnpj_d)
    REFERENCES Empresa_Descricao (emp_cnpj_d);

ALTER TABLE Empresa ADD CONSTRAINT fk_cidade_empresa_cid_id
    FOREIGN KEY (cid_id)
    REFERENCES Cidade (cid_id);

ALTER TABLE Empresa ADD CONSTRAINT fk_cnae_empresa_cne_id
    FOREIGN KEY (cne_id)
    REFERENCES Cnae (cne_id);

ALTER TABLE Empresa ADD CONSTRAINT fk_empresa_descricao_empresa_emp_cnpj_d
    FOREIGN KEY (emp_cnpj_d)
    REFERENCES Empresa_Descricao (emp_cnpj_d);

ALTER TABLE Usuario ADD CONSTRAINT fk_usuario_cargo_car_id
    FOREIGN KEY (car_id)
    REFERENCES Cargo (car_id);

ALTER TABLE Usuario ADD CONSTRAINT fk_usuario_carteira_crt_id
    FOREIGN KEY (crt_id)
    REFERENCES Carteira (crt_id);

ALTER TABLE Empresa ADD CONSTRAINT fk_usuario_empresa_usu_email
    FOREIGN KEY (usu_email)
    REFERENCES Usuario (usu_email);

-- End of file.

