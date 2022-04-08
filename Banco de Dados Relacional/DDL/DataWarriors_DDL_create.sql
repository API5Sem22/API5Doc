CREATE TABLE Cargo (
    car_id int IDENTITY(1, 1),
    car_descricao varchar(50)  NOT NULL,
    CONSTRAINT uk_cargo_descricao UNIQUE (car_descricao),
    CONSTRAINT pk_cargo PRIMARY KEY (car_id)
);

CREATE TABLE Carteira (
    crt_id int IDENTITY(1, 1),
    crt_descricao varchar(50)  NOT NULL,
    CONSTRAINT uk_carteira_descricao UNIQUE (crt_descricao),
    CONSTRAINT pk_carteira_id PRIMARY KEY (crt_id)
);

CREATE TABLE Usuario (
    usu_email varchar(80),
    usu_nome varchar(80)  NOT NULL,
    usu_senha varchar(30)  NOT NULL,
    usu_departamento varchar(80) NULL,
    car_id int  NOT NULL,
    crt_id int  NULL,
    CONSTRAINT pk_usuario_email PRIMARY KEY (usu_email)
);

ALTER TABLE Usuario ADD CONSTRAINT fk_usuario_cargo_car_id
    FOREIGN KEY (car_id)
    REFERENCES Cargo (car_id);

ALTER TABLE Usuario ADD CONSTRAINT fk_usuario_carteira_crt_id
    FOREIGN KEY (crt_id)
    REFERENCES Carteira (crt_id);

