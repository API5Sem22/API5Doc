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
    cid_nome varchar(50)  NULL,
    cid_estado varchar(2)  NULL,
    cid_regiao varchar(10)  NULL,
    CONSTRAINT pk_cidade PRIMARY KEY  (cid_id)
);

CREATE TABLE Cnae (
    cne_id int,
    cne_cod int  NULL,
    cne_descricao varchar(150)  NULL,
    CONSTRAINT pk_cnae PRIMARY KEY  (cne_id)
);

CREATE TABLE Consumo (
    csm_id int IDENTITY(1, 1),
    emp_cnpj_d varchar(30)  NULL,
    csm_mes_referencia varchar(15)  NULL,
    csm_id_produto varchar(100)  NULL,
    csm_quantidade_consumo int  NULL,
    CONSTRAINT Consumo_pk PRIMARY KEY  (csm_id)
);

CREATE TABLE Empresa (
    emp_cnpj_d varchar(30),
    cid_id int  NULL,
    cne_id int  NULL,
    usu_email varchar(80)  NULL,
    emp_nivel varchar(5)  NULL,
    emp_origem varchar(30)  NULL,
    CONSTRAINT pk_empresa PRIMARY KEY  (emp_cnpj_d)
);

CREATE TABLE Empresa_Descricao (
    emp_cnpj_d varchar(30),
    emp_nome_d varchar(100)  NULL,
    emp_porte_d varchar(10)  NULL,
    emp_tipo_d varchar(10)  NULL,
    emp_situacao_d varchar(10)  NULL,
    emp_data_abertura_d varchar(10)  NULL,
    emp_email_d varchar(80)  NULL,
    emp_telefone_d varchar(20)  NULL,
    emp_natureza_juridica_d varchar(50)  NULL,
    CONSTRAINT pk_empresa_descricao PRIMARY KEY  (emp_cnpj_d)
);

CREATE TABLE Usuario (
    usu_email varchar(80),
    usu_nome varchar(80)  NOT NULL,
    usu_senha varchar(30)  NOT NULL,
    usu_departamento varchar(80)  NULL,
    car_id int  NULL,
    crt_id int  NULL,
    CONSTRAINT pk_usuario_email PRIMARY KEY  (usu_email)
);

ALTER TABLE Empresa ADD CONSTRAINT fk_cidade_empresa_cid_id
    FOREIGN KEY (cid_id)
    REFERENCES Cidade (cid_id);

ALTER TABLE Empresa ADD CONSTRAINT fk_cnae_empresa_cne_id
    FOREIGN KEY (cne_id)
    REFERENCES Cnae (cne_id);

ALTER TABLE Consumo ADD CONSTRAINT fk_empresa_consumo_emp_cnpj_d
    FOREIGN KEY (emp_cnpj_d)
    REFERENCES Empresa (emp_cnpj_d);

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


