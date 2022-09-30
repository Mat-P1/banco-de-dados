/* 1. Construa um banco de dados para uma clínica. Nesta clínica, deverão ser cadastrados todos os médicos, além de suas especialidades.
Mesmo que o médico possua mais de uma especialidade, ele deverá escolher apenas uma delas para trabalhar na clínica. Todos os pacientes
também deverão ser cadastrados com todos os seus dados. Os dados das
consultas deverão ser armazenados também no banco de dados: a data
em que a consulta aconteceu, o médico que atendeu o paciente, bem
como o diagnóstico feito pelo médico. */

CREATE DATABASE clinica;
USE clinica;

CREATE TABLE medico (
    idMedico INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    CRM VARCHAR(20) UNIQUE NOT NULL,
    CPF VARCHAR(15) UNIQUE NOT NULL,
    nome VARCHAR(155) NOT NULL,
    especialidade VARCHAR(30) NOT NULL
);

CREATE TABLE paciente (
    idPaciente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    CPF VARCHAR(15) UNIQUE NOT NULL,
    nome VARCHAR(155) NOT NULL,
    endereco VARCHAR(155) NOT NULL,
    telefone VARCHAR(20) NOT NULL
);

CREATE TABLE consulta (
    idConsulta INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    idMedico INT NOT NULL,
    idPaciente INT NOT NULL,
    dtConsulta DATE NOT NULL,
    diagnostico VARCHAR(255) NOT NULL
);

ALTER TABLE consulta ADD CONSTRAINT fk_idMedico FOREIGN KEY (idMedico) REFERENCES medico (idMedico);
ALTER TABLE consulta ADD CONSTRAINT fk_idPaciente FOREIGN KEY (idPaciente) REFERENCES paciente (idPaciente);

/* A partir do banco de dados da questão anterior e utilizando a linguagem
SQL, responda as questões: 

Altere a tabela médico, adicionando a coluna “nome_conjuge”. */

ALTER TABLE medico ADD COLUMN nome_conjuge VARCHAR(155) NOT NULL;

/* Insira, pelo menos, dois registros em cada uma das tabelas. */

INSERT INTO medico (CPF, CRM, especialidade, nome, nome_conjuge)
VALUES ('014.222.131.65', '131785CE', 'Cirurgia geral', 'Francisco Filho de Albuquerque', 'Maria Lourdes de Albuquerque'),
('951.552.231.01', '235787CE', 'Cardiologista', 'Maria Lourdes de Albuquerque', 'Francisco Filho de Albuquerque');

INSERT INTO paciente (CPF, endereco, nome, telefone)
VALUES ('055.231.453.11', 'Rua Bahia, 551', 'Davi Santos', '85991235566'),
('122.648.353.01', 'Rua Ceará, 133', 'Ebenezer Xavier', '85981831536');

INSERT INTO consulta (diagnostico, dtConsulta, idMedico, idPaciente)
VALUES ('Necessário cirurgia no braço quebrado', '2022-10-14', 1, 2),
('Engano. Não vai ser necessário cirurgia.', '2022-10-14', 2, 1);

/* Delete um registro da tabela especialidade. Obs.: mantenha a integridade referencial. */

DELETE FROM especialidade WHERE idEspecialidade = 2;
