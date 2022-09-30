/* Crie uma base de dados Universidade com as tabelas a seguir: 
Alunos (MAT, nome, endereço, cidade) 
Disciplinas (COD_DISC, nome_disc, carga_hor) 
Professores (COD_PROF, nome, endereço, cidade) 
Turma (COD_DISC, COD_TURMA, COD_PROF, ANO, horário) 
COD_DISC referencia Disciplinas 
COD_PROF referencia Professores 
Histórico (MAT, COD_DISC, COD_TURMA, COD_PROF, ANO, frequência, nota) MAT referencia Alunos 
COD_DISC, COD_TURMA, COD_PROF, ANO referencia Turma

INSIRA OS SEGUINTES REGISTROS: 
ALUNOS: 
(2015010101, JOSE DE ALENCAR, RUA DAS ALMAS, NATAL) (2015010102, JOÃO JOSÉ, AVENIDA RUY CARNEIRO, JOÃO PESSOA) (2015010103, MARIA JOAQUINA, RUA CARROSSEL, RECIFE) (2015010104, MARIA DAS DORES, RUA DAS LADEIRAS, FORTALEZA) (2015010105, JOSUÉ CLAUDINO DOS SANTOS, CENTRO, NATAL) (2015010106, JOSUÉLISSON CLAUDINO DOS SANTOS, CENTRO, NATAL) 
DISCIPLINAS: 
(BD, BANCO DE DADOS, 100) 
(POO, PROGRAMAÇÃO COM ACESSO A BANCO DE DADOS, 100) (WEB, AUTORIA WEB, 50) 
(ENG, ENGENHARIA DE SOFTWARE, 80) 
PROFESSORES: 
(212131, NICKERSON FERREIRA, RUA MANAÍRA, JOÃO PESSOA) (122135, ADORILSON BEZERRA, AVENIDA SALGADO FILHO, NATAL) (192011, DIEGO OLIVEIRA, AVENIDA ROBERTO FREIRE, NATAL) 
TURMA: 
(BD, 1, 212131, 2015, 11H-12H) 
(BD, 2, 212131, 2015, 13H-14H) 
(POO, 1, 192011, 2015, 08H-09H) 
(WEB, 1, 192011, 2015, 07H-08H) 
(ENG, 1, 122135, 2015, 10H-11H) 
HISTÓRICO: 
INSIRA VALORES PARA TODOS OS ALUNOS EM TODAS AS DISCIPLINAS */

/* a) Encontre a MAT dos alunos com nota em BD em 2015 menor que 5 (obs: BD = código da disciplinas). */

SELECT A.MAT AS Matricula, A.nome FROM alunos A JOIN historico H ON H.MAT=A.MAT WHERE H.COD_DISC='BD' AND H.nota < 5;

/* b) Encontre a MAT e calcule a média das notas dos alunos na disciplina de POO em 2015. */

SELECT A.MAT AS Matricula, A.nome, AVG(H.nota) FROM alunos A JOIN historico H ON H.MAT=A.MAT WHERE H.COD_DISC='POO';

/* c) Encontre a MAT e calcule a média das notas dos alunos na disciplina de POO em 2015 e que esta média seja superior a 6. */

SELECT A.MAT AS Matricula, A.nome, H.nota FROM alunos A JOIN historico H ON H.MAT=A.MAT WHERE H.COD_DISC='POO' GROUP BY H.nota HAVING AVG(H.nota) > 6;

/* d) Encontre quantos alunos não são de Natal. */

SELECT * FROM alunos WHERE cidade <> 'NATAL';
