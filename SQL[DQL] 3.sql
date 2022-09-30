/* Considerando o esquema da atividade 17, desenvolva as consultas necessárias.

Funcionarios (Codigo, PrimeiroNome,
SegundoNome, UltimoNome,
DataNasci, CPF, RG, Endereco, CEP,
Cidade, Fone, CodigoDepartamento,
Funcao, Salario) 
Departamentos (Codigo, Nome,
Localizacao,
CodigoFuncionarioGerente)  */

/* 1. Liste o nome e o departamento de todos os funcionários que ganham mais do que algum gerente. */

SELECT Funcionarios.PrimeiroNome, Funcionarios.SegundoNome, Departamentos.Nome 
FROM Funcionarios 
INNER JOIN Departamentos ON Funcionarios.CodigoDepartamento = Departamentos.Codigo 
WHERE Funcionarios.Salario > ANY (SELECT Salario FROM Funcionarios WHERE Codigo IN (SELECT CodigoFuncionarioGerente FROM Departamentos));

/* 2. Liste o nome do departamento e do funcionário ordenados por departamento e funcionário. */

SELECT Departamentos.Nome, Funcionarios.PrimeiroNome, Funcionarios.SegundoNome 
FROM Departamentos 
INNER JOIN Funcionarios ON Departamentos.Codigo = Funcionarios.CodigoDepartamento 
ORDER BY Departamentos.Nome, Funcionarios.PrimeiroNome;

/* 3. Liste o menor salário pago pela empresa em cada departamento. */

SELECT Departamentos.Nome, MIN(Funcionarios.Salario) FROM Funcionarios INNER JOIN Departamentos ON Funcionarios.CodigoDepartamento = Departamentos.Codigo;

/* 4. Liste os departamentos dos funcionários que têm a função de supervisor. */

SELECT Departamentos.Nome, Funcionarios.PrimeiroNome, Funcionarios.SegundoNome 
FROM Departamentos INNER JOIN Funcionarios ON Departamentos.Codigo = Funcionarios.CodigoDepartamento WHERE Funcionarios.Funcao = ‘Supervisor’;

/* 5.  Liste o valor da folha de pagamento de cada departamento (nome). */

SELECT Departamentos.Nome, SUM(Funcionarios.Salario) AS Valor_Total 
FROM Departamentos 
INNER JOIN Funcionarios ON Departamentos.Codigo = Funcionarios.CodigoDepartamento;

/* 6. Liste todos departamentos com seus respectivos gerentes. */

SELECT Departamentos.Nome, Funcionarios.PrimeiroNome, Funcionarios.SegundoNome 
FROM Departamentos 
INNER JOIN Funcionarios ON Departamentos.CodigoFuncionarioGerente = Funcionarios.Codigo;

/* 7. Liste o nome, o nome do departamento e a função de todos os funcionários. */

SELECT Funcionarios.PrimeiroNome, Funcionarios.SegundoNome, Departamentos.Nome, Funcionarios.Funcao 
FROM Funcionarios INNER JOIN Departamentos ON Funcionarios.CodigoDepartamento = Departamentos.Codigo;
