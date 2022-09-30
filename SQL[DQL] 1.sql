/* Com base nos esquemas abaixo responda as questões.
Funcionarios (Codigo, PrimeiroNome,
SegundoNome, UltimoNome,
DataNasci, CPF, RG, Endereco, CEP,
Cidade, Fone, CodigoDepartamento,
Funcao, Salario) 
Departamentos (Codigo, Nome,
Localizacao,
CodigoFuncionarioGerente)  */

/* 1. Listar nome e sobrenome ordenado por sobrenome. */

SELECT PrimeiroNome, UltimoNome FROM funcionario ORDER BY UltimoNome;  

/* 2. Listar todos os campos de funcionários ordenados por cidade. */

SELECT * FROM funcionario ORDER BY cidade;

/* 3. Liste os funcionários que têm salário superior a R$ 1.000,00 ordenados pelo primeiro nome. */

SELECT * FROM funcionario WHERE salario > 1000 ORDER BY PrimeiroNome;

/* 4. Liste a data de nascimento e o primeiro nome dos funcionários ordenados do mais novo para o mais velho. */

SELECT DataNasci, PrimeiroNome FROM funcionario ORDER BY DataNasci DESC;

/* 5. Liste o total da folha de pagamento. */

SELECT SUM (salario) AS Sal_Total FROM funcinario;

/* 6. Liste a quantidade de funcionários desta empresa. */

SELECT COUNT (Codigo) AS Qtd_Func FROM funcionario;

/* 7. Liste o salário médio pago pela empresa. */

SELECT AVG (salario) AS Med_Salario FROM funcionario;

/* 8. Liste os nomes dos funcionários que moram em Recife e que exerçam a função de Telefonista. */

SELECT PrimeiroNome, SegundoNome, UltimoNome, funcao, cidade FROM funcionario WHERE cidade = 'Recife' AND funcao = 'Telefonista';
