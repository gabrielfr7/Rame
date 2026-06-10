

CREATE DATABASE IF NOT EXISTS rame;
USE rame;

-- =====================
-- TABELA ALUNO
-- =====================
CREATE TABLE aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(20) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL
);

-- =====================
-- TABELA NUTRICIONISTA
-- =====================
CREATE TABLE nutricionista (
    id_nutricionista INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    login VARCHAR(20) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL
);

-- =====================
-- TABELA RESTRICAO
-- =====================
CREATE TABLE restricao (
    id_restricao INT AUTO_INCREMENT PRIMARY KEY,
    nome_restricao VARCHAR(100) NOT NULL
);

-- =====================
-- RELAÇÃO ALUNO x RESTRIÇÃO
-- =====================
CREATE TABLE aluno_restricao (
    id_aluno INT NOT NULL,
    id_restricao INT NOT NULL,

    PRIMARY KEY (id_aluno, id_restricao),

    FOREIGN KEY (id_aluno)
        REFERENCES aluno(id_aluno)
        ON DELETE CASCADE,

    FOREIGN KEY (id_restricao)
        REFERENCES restricao(id_restricao)
        ON DELETE CASCADE
);

-- =====================
-- TABELA CARDÁPIO
-- =====================
CREATE TABLE cardapio (
    id_cardapio INT AUTO_INCREMENT PRIMARY KEY,
    dia_semana VARCHAR(20) NOT NULL,
    prato VARCHAR(100) NOT NULL,
    descricao TEXT,

    id_nutricionista INT NOT NULL,

    FOREIGN KEY (id_nutricionista)
        REFERENCES nutricionista(id_nutricionista)
);
    
-- =====================
-- TABELA AVALIAÇÃO
-- =====================
CREATE TABLE avaliacao (
    id_avaliacao INT AUTO_INCREMENT PRIMARY KEY,

    id_aluno INT NOT NULL,
    id_cardapio INT NOT NULL,

    nota INT NOT NULL,
    comentario TEXT,

    data_avaliacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (id_aluno)
        REFERENCES aluno(id_aluno),

    FOREIGN KEY (id_cardapio)
        REFERENCES cardapio(id_cardapio)
);

-- =====================
-- DADOS DE TESTE
-- =====================

INSERT INTO nutricionista (nome, login, senha)
VALUES
('Maria Silva', 'N001', '123456');

INSERT INTO aluno (nome, matricula, senha)
VALUES
('Gabriel Freire', '20250001', '123456');

INSERT INTO restricao (nome_restricao)
VALUES
('Lactose'),
('Gluten'),
('Amendoim'),
('Vegetariano');

INSERT INTO aluno_restricao (id_aluno, id_restricao)
VALUES
(1, 1);

INSERT INTO cardapio
(dia_semana, prato, descricao, id_nutricionista)
VALUES
('Segunda', 'Arroz, Feijão e Frango', 'Refeição balanceada', 1),
('Terça', 'Macarrão com Carne', 'Macarrão ao molho', 1),
('Quarta', 'Peixe com Purê', 'Peixe grelhado e purê', 1),
('Quinta', 'Strogonoff de Frango', 'Acompanhado de arroz', 1),
('Sexta', 'Feijoada', 'Feijoada tradicional', 1);

INSERT INTO avaliacao
(id_aluno, id_cardapio, nota, comentario)
VALUES
(1, 1, 5, 'Ótima refeição!');
