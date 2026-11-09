-- Criação e seleção do Banco de Dados do Jogo de RPG
CREATE DATABASE JogoRPG;
GO

USE JogoRPG;
GO

-- 1. Tabela USUARIOS
CREATE TABLE USUARIOS (
    UsuarioId INT IDENTITY(1,1) PRIMARY KEY,
    Email VARCHAR(100) NOT NULL,
    Senha VARCHAR(100) NOT NULL
);
GO

-- 2. Tabela CLASSES
CREATE TABLE CLASSES (
    ClasseId INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Descricao VARCHAR(255)
);
GO

-- 3. Tabela HABILIDADES
CREATE TABLE HABILIDADES (
    HabilidadeId INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);
GO

-- 4. Tabela PERSONAGENS (Relacionada com USUARIOS e CLASSES)
CREATE TABLE PERSONAGENS (
    PersonagemId INT IDENTITY(1,1) PRIMARY KEY,
    NomePersonagem VARCHAR(50) NOT NULL,
    UsuarioId INT NOT NULL,
    ClasseId INT NOT NULL,
    FOREIGN KEY (UsuarioId) REFERENCES USUARIOS(UsuarioId),
    FOREIGN KEY (ClasseId) REFERENCES CLASSES(ClasseId)
);
GO

-- 5. Tabela CLASSES_HABILIDADES (Tabela associativa N:N entre CLASSES e HABILIDADES)
CREATE TABLE CLASSES_HABILIDADES (
    ClasseId INT NOT NULL,
    HabilidadeId INT NOT NULL,
    PRIMARY KEY (ClasseId, HabilidadeId),
    FOREIGN KEY (ClasseId) REFERENCES CLASSES(ClasseId),
    FOREIGN KEY (HabilidadeId) REFERENCES HABILIDADES(HabilidadeId)
);
GO