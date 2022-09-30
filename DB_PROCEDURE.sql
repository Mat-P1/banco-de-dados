CREATE DATABASE DB_PROCEDURE;
USE DB_PROCEDURE;

CREATE TABLE faculdade (
	idFaculdade INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(155),
	email VARCHAR(155),
	localizacao VARCHAR(155)
);

CREATE TABLE aluno (
	idAluno INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(155),
	cidade VARCHAR(155),
	idFaculdade INT
);

ALTER TABLE aluno ADD CONSTRAINT fk_faculdade FOREIGN KEY (idFaculdade) REFERENCES faculdade (idFaculdade);

DELIMITER /
CREATE PROCEDURE criar_faculdade (nome VARCHAR(155), email VARCHAR(155), localizacao VARCHAR(155))
BEGIN
	INSERT INTO faculdade (nome, email, localizacao) VALUES (nome, email, localizacao);
END /
DELIMITER ;

DELIMITER /
CREATE PROCEDURE atualizar_faculdade (id INT, nome VARCHAR(155), email VARCHAR(155), localizacao VARCHAR(155))
BEGIN
	UPDATE faculdade SET nome = nome, email = email, localizacao = localizacao WHERE id = idFaculdade;
END /
DELIMITER ;

DELIMITER /
CREATE PROCEDURE deletar_faculdade(id INT)
BEGIN
	DELETE FROM faculdade WHERE id = idFaculdade;
END /
DELIMITER ;

DELIMITER /
CREATE PROCEDURE mostrar_faculdades ()
BEGIN
	SELECT * FROM faculdade;
END /
DELIMITER ;

DELIMITER /
CREATE PROCEDURE criar_aluno(nome VARCHAR(155), cidade VARCHAR(155), idFaculdade INT)
BEGIN
	INSERT INTO aluno (nome, cidade, idFaculdade) VALUES (nome, cidade, idFaculdade);
END /
DELIMITER ;

DELIMITER /
CREATE PROCEDURE atualizar_aluno (id INT, nome VARCHAR(155), cidade VARCHAR(155), idFaculdade INT)
BEGIN
	UPDATE aluno SET nome = nome, cidade = cidade, idFaculdade = idFaculdade WHERE id = idAluno;
END /
DELIMITER ;

DELIMITER /
CREATE PROCEDURE deletar_aluno (id INT)
BEGIN
	DELETE FROM aluno WHERE id = idAluno;
END /
DELIMITER ;

DELIMITER /
CREATE PROCEDURE mostrar_aluno ()
BEGIN
	SELECT * FROM aluno;
END /
DELIMITER ;

CALL criar_faculdade ('SENAI', 'senai@gmail.com', 'Jacarecanga');
CALL criar_faculdade ('ESTÁCIO', 'estacio@gmail.com', 'Parangaba');
CALL criar_faculdade ('UFC', 'ufc@gmail.com', 'Maracanaú');
CALL criar_faculdade ('UECE', 'uece@gmail.com', 'Itaperi');
CALL criar_faculdade ('Unifametro', 'unifametro@gmail.com', 'Jacarecanga');
CALL criar_faculdade ('UNIFOR', 'unifor@gmail.com', 'Edson Queiroz');

CALL mostrar_faculdades ();

CALL deletar_faculdade (6);

CALL atualizar_faculdade (5, 'Uninassau', 'uninassau@gmail.com', 'Parangaba');

CALL criar_aluno('Bárbara', 'Fortaleza', 1);
CALL criar_aluno('Thamyres', 'Fortaleza', 2);
CALL criar_aluno('Moisés', 'Maracanaú', 3);
CALL criar_aluno('Rodrigo', 'Fortaleza', 4);
CALL criar_aluno('Gabrielly', 'Maracanaú', 5);
CALL criar_aluno('Robson', 'Fortaleza', 5);

CALL mostrar_aluno ();

CALL deletar_aluno (6);

CALL atualizar_aluno (5, 'Gabrielly', 'Fortaleza', 4);
