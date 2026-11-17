

CREATE DATABASE IF NOT EXISTS meu_ghibli CHARACTER SET utf8mb4;
USE meu_ghibli;


CREATE TABLE IF NOT EXISTS usuario (
    idUsuario     INT PRIMARY KEY AUTO_INCREMENT,
    nome          VARCHAR(80)  NOT NULL,
    email         VARCHAR(120) NOT NULL UNIQUE,
    senha         VARCHAR(255) NOT NULL,
    dataCadastro  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE IF NOT EXISTS filme (
    idFilme        INT PRIMARY KEY AUTO_INCREMENT,
    titulo         VARCHAR(120) NOT NULL,
    anoLancamento  INT          NOT NULL,
    duracaoMin     INT          NOT NULL
);


CREATE TABLE IF NOT EXISTS sentimento (
    idSentimento  INT PRIMARY KEY AUTO_INCREMENT,
    nome          VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS companhia (
    idCompanhia  INT PRIMARY KEY AUTO_INCREMENT,
    nome         VARCHAR(40) NOT NULL UNIQUE
);


CREATE TABLE IF NOT EXISTS sessao (
    idSessao      INT PRIMARY KEY AUTO_INCREMENT,
    fkUsuario     INT  NOT NULL,
    fkFilme       INT  NOT NULL,
    fkSentimento  INT  NOT NULL,
    fkCompanhia   INT  NOT NULL,
    dataSessao    DATE NOT NULL,
    observacao    VARCHAR(255),
    FOREIGN KEY (fkUsuario)    REFERENCES usuario(idUsuario)       ON DELETE CASCADE,
    FOREIGN KEY (fkFilme)      REFERENCES filme(idFilme),
    FOREIGN KEY (fkSentimento) REFERENCES sentimento(idSentimento),
    FOREIGN KEY (fkCompanhia)  REFERENCES companhia(idCompanhia)
);


CREATE TABLE IF NOT EXISTS fila (
    idFila      INT PRIMARY KEY AUTO_INCREMENT,
    fkUsuario   INT NOT NULL,
    fkFilme     INT NOT NULL,
    posicao     INT NOT NULL,
    dataAdicao  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (fkUsuario, fkFilme),
    FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario) ON DELETE CASCADE,
    FOREIGN KEY (fkFilme)   REFERENCES filme(idFilme)
);



INSERT INTO sentimento (nome) VALUES
    ('Nostalgia'), ('Conforto'), ('Reflexão'), ('Coragem'), ('Saudade');

INSERT INTO companhia (nome) VALUES
    ('Família'), ('Amigos'), ('Sozinho'), ('Primos');

-- Os 25 longas do estúdio (duração em minutos, aproximada)
INSERT INTO filme (titulo, anoLancamento, duracaoMin) VALUES
    ('Nausicaä do Vale do Vento', 1984, 117),
    ('O Castelo no Céu', 1986, 124),
    ('O Túmulo dos Vagalumes', 1988, 89),
    ('Meu Amigo Totoro', 1988, 86),
    ('O Serviço de Entregas da Kiki', 1989, 102),
    ('Memórias de Ontem', 1991, 118),
    ('Porco Rosso: O Último Herói Romântico', 1992, 94),
    ('Ocean Waves', 1993, 72),
    ('Pom Poko', 1994, 119),
    ('Sussurros do Coração', 1995, 111),
    ('Princesa Mononoke', 1997, 134),
    ('Meus Vizinhos os Yamadas', 1999, 104),
    ('A Viagem de Chihiro', 2001, 125),
    ('O Reino dos Gatos', 2002, 75),
    ('O Castelo Animado', 2004, 119),
    ('Contos de Terramar', 2006, 115),
    ('Ponyo: Uma Amizade que Veio do Mar', 2008, 101),
    ('O Mundo dos Pequeninos', 2010, 94),
    ('A Colina das Papoulas', 2011, 91),
    ('Vidas ao Vento', 2013, 126),
    ('O Conto da Princesa Kaguya', 2013, 137),
    ('As Memórias de Marnie', 2014, 103),
    ('A Tartaruga Vermelha', 2016, 80),
    ('Aya e a Bruxa', 2020, 82),
    ('O Menino e a Garça', 2023, 124);