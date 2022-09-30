CREATE DATABASE desafio;
USE desafio;

CREATE TABLE candidates (

id INT PRIMARY KEY NOT NULL,
name VARCHAR(155),
email VARCHAR(155),
created_at TIME,
updated_at TIME
);

CREATE TABLE jobs (

id INT PRIMARY KEY NOT NULL,
title VARCHAR(55),
positions INT,
created_at TIME,
updated_at TIME
);

CREATE TABLE applications (

id INT PRIMARY KEY NOT NULL,
candidate_id INT NOT NULL,
job_id INT NOT NULL,
score DECIMAL,
created_at TIME,
updated_at TIME
);

ALTER TABLE applications ADD CONSTRAINT fk_candidate_id FOREIGN KEY (candidate_id) REFERENCES candidates (id);

ALTER TABLE applications ADD CONSTRAINT fk_job_id FOREIGN KEY (job_id) REFERENCES jobs (id);

INSERT INTO candidates VALUES
(1,  'John Snow', 'john@snow', now()+1, now()+1),
(2,  'Bob Ross', 'bob@ross',  now()+2, now()+2),
(3,  'Kim Possible', 'kim@possible', now()+3, now()+3),
(4,  'Ash Ketchum', 'ash@ketchum',  now()+4, now()+4),
(5,  'Goku Son', 'goku@son', now()+5, now()+5),
(6,  'Mortimer Smith', 'morty@smh', now()+6, now()+6);

INSERT INTO jobs VALUES
(1, 'Night Watch Commander', 1, now()+11, now()+11),
(2, 'Pokemon Master', 8, now()+12, now()+12),
(3, 'Blessed Painter', 100, now()+13, now()+13);

INSERT INTO applications VALUES
(1,  1,  1,  90, now()+21, now()+21),             
(2,  1,  3,  80, now()+22, now()+22),
(3,  2,  1,  10, now()+23, now()+23),
(4,  2,  2,  10, now()+24, now()+24),
(5,  2,  3,  99, now()+25, now()+25),
(6,  3,  1,  60, now()+26, now()+26),
(7,  3,  2,  70, now()+27, now()+27),
(8,  3,  3,  50, now()+28, now()+28),
(9,  4,  2,  90, now()+29, now()+29),
(10, 5,  1,  9000, now()+30, now()+30);

/* -- Atribuições:
--
-- 1. Os nomes e número de candidaturas de candidatos que se inscreveram para 
--    menos de 3 vagas.
--
-- Expected output:
-- name             count
-- John Snow        2
-- Goku Son         1
-- Ash Ketchum      1
-- Mortimer Smith   1 */

SELECT candidates.name AS Name, COUNT(candidates.id) 
FROM candidates LEFT JOIN applications ON candidates.id = applications.candidate_id 
GROUP BY candidates.name HAVING COUNT(applications.candidate_id) < 3 ORDER BY COUNT(applications.candidate_id) DESC;

/* -- 2. Os nomes, o título do trabalho da sua pontuação máxima de aplicação e a pontuação para
--    essa candidatura para cada candidato que tenha pelo menos uma candidatura.
--    (se houver um empate, escolha a candidatura que foi criada por último)
-- 
-- Expected output:
-- name             title                   score
-- Ash Ketchum      Pokemon Master          90
-- Bob Ross         Blessed Painter         99
-- Goku Son         Night Watch Commander   9000
-- John Snow        Night Watch Commander   90
-- Kim Possible     Pokemon Master          70 */

SELECT candidates.name AS Name, jobs.title AS Title, MAX(applications.score) AS Score 
FROM applications INNER JOIN candidates ON applications.candidate_id=candidates.id 
INNER JOIN jobs ON applications.job_id=jobs.id GROUP BY candidates.name HAVING MAX(applications.created_at);

/* -- 3. Para cada trabalho: título, quantidade de candidatos com pontuação superior a 25,
-- quantidade de candidatos com pontuação superior a 50, quantidade de candidatos com pontuação superior a 75.
--
-- Expected output:
-- title                    over25  over50  over75
-- Blessed Painter          3       2       2
-- Pokemon Master           2       2       1
-- Night Watch Commander    3       3       2 */

SELECT jobs.title as Title, COUNT((CASE WHEN applications.score > 25 THEN 1 END)) AS Over25, 
COUNT((CASE WHEN applications.score > 50 THEN 1 END)) AS Over50, 
COUNT((CASE WHEN applications.score > 75 THEN 1 END)) AS Over75 
FROM applications INNER JOIN jobs ON applications.job_id=jobs.id GROUP BY jobs.positions ORDER BY jobs.positions DESC;
