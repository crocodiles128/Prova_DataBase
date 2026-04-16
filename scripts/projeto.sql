-- reset que deu meuito erro kk
DROP DATABASE IF EXISTS academico;
CREATE DATABASE academico;
USE academico;





CREATE TABLE aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(255),
    endereco VARCHAR(255),
    ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE docente (
    id_docente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE disciplina (
    cod_disciplina VARCHAR(10) PRIMARY KEY,
    nome VARCHAR(255),
    carga_h INT,
    ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE operador (
    id_operador VARCHAR(10) PRIMARY KEY
);

CREATE TABLE turma (
    id_turma INT AUTO_INCREMENT PRIMARY KEY,
    cod_disciplina VARCHAR(10),
    id_docente INT,
    ciclo VARCHAR(10),
    ativo BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (cod_disciplina) REFERENCES disciplina(cod_disciplina),
    FOREIGN KEY (id_docente) REFERENCES docente(id_docente)
);

CREATE TABLE matricula (
    id_matricula INT PRIMARY KEY,
    id_aluno INT,
    data_ingresso DATE,
    id_operador VARCHAR(10),
    ativo BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_operador) REFERENCES operador(id_operador)
);

CREATE TABLE matricula_turma (
    id_matricula INT,
    id_turma INT,
    score_final DECIMAL(3,1),
    PRIMARY KEY (id_matricula, id_turma),
    FOREIGN KEY (id_matricula) REFERENCES matricula(id_matricula),
    FOREIGN KEY (id_turma) REFERENCES turma(id_turma)
);










INSERT INTO aluno (nome, email, endereco) VALUES
('Ana Beatriz Lima','ana.lima@aluno.edu.br','Braganca Paulista/SP'),
('Bruno Henrique Souza','bruno.souza@aluno.edu.br','Atibaia/SP'),
('Camila Ferreira','camila.ferreira@aluno.edu.br','Jundiai/SP'),
('Diego Martins','diego.martins@aluno.edu.br','Campinas/SP'),
('Eduarda Nunes','eduarda.nunes@aluno.edu.br','Itatiba/SP'),
('Felipe Araujo','felipe.araujo@aluno.edu.br','Louveira/SP'),
('Gabriela Torres','gabriela.torres@aluno.edu.br','Nazare Paulista/SP'),
('Helena Rocha','helena.rocha@aluno.edu.br','Piracaia/SP'),
('Igor Santana','igor.santana@aluno.edu.br','Jarinu/SP');

INSERT INTO docente (nome) VALUES
('Prof. Carlos Mendes'),
('Profa. Juliana Castro'),
('Prof. Eduardo Pires'),
('Prof. Renato Alves'),
('Profa. Marina Lopes'),
('Prof. Ricardo Faria');

INSERT INTO disciplina VALUES
('ADS101','Banco de Dados',80,TRUE),
('ADS102','Engenharia de Software',80,TRUE),
('ADS103','Algoritmos',60,TRUE),
('ADS104','Redes de Computadores',60,TRUE),
('ADS105','Sistemas Operacionais',60,TRUE),
('ADS106','Estruturas de Dados',80,TRUE);

INSERT INTO operador VALUES
('OP9001'),('OP9002'),('OP9003'),('OP9004'),('OP8999'),('OP9000');

INSERT INTO turma (cod_disciplina, id_docente, ciclo) VALUES
('ADS101',1,'2026/1'),
('ADS102',2,'2026/1'),
('ADS105',3,'2026/1'),
('ADS103',4,'2026/1'),
('ADS104',5,'2026/1'),
('ADS106',6,'2026/1'),
('ADS101',1,'2025/2'),
('ADS102',2,'2025/2'),
('ADS103',4,'2025/2'),
('ADS104',5,'2025/2'),
('ADS105',3,'2025/2'),
('ADS106',6,'2025/2');

INSERT INTO matricula VALUES
(2026001,1,'2026-01-20','OP9001',TRUE),
(2026002,2,'2026-01-21','OP9002',TRUE),
(2026003,3,'2026-01-22','OP9001',TRUE),
(2026004,4,'2026-01-23','OP9003',TRUE),
(2026005,5,'2026-01-24','OP9002',TRUE),
(2026006,6,'2026-01-25','OP9004',TRUE),
(2025010,7,'2025-08-05','OP8999',TRUE),
(2025011,8,'2025-08-06','OP8999',TRUE),
(2025012,9,'2025-08-07','OP9000',TRUE);

INSERT INTO matricula_turma VALUES
(2026001,1,9.1),(2026001,2,8.4),(2026001,3,8.9),
(2026002,1,7.3),(2026002,4,6.8),(2026002,5,7.0),
(2026003,1,5.9),(2026003,2,7.5),(2026003,6,6.1),
(2026004,4,4.7),(2026004,5,6.2),(2026004,3,5.8),
(2026005,2,9.5),(2026005,5,8.1),(2026005,6,8.7),
(2026006,1,6.4),(2026006,4,5.6),(2026006,3,6.9),
(2025010,7,6.4),(2025010,8,7.1),
(2025011,9,8.8),(2025011,10,7.9),
(2025012,11,5.5),(2025012,12,6.3);