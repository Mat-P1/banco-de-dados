/* Desenvolva e relacione as tabelas conforme dados abaixo: 

Cliente, Vendedor, Veículo e Marca

Questões: */

/* 1 - Exiba a marca e modelo do veículo mais barato */

SELECT marca.nome, veiculo.modelo, veiculo.valor FROM veiculo INNER JOIN marca ON veiculo.idmarca = marca.idmarca HAVING MIN(veiculo.valor);

/* 2 - Exiba o modelo e a quantidade do veículo mais vendido. */

SELECT COUNT(venda.idveiculo), veiculo.modelo FROM venda INNER JOIN veiculo ON venda.idveiculo = veiculo.idveiculo GROUP BY veiculo.modelo;

/* 3 - Exiba os nomes dos clientes que compraram o veículo Palio */

SELECT cliente.nome, veiculo.modelo 
FROM venda INNER JOIN cliente ON venda.idcliente = cliente.idcliente INNER JOIN veiculo ON venda.idveiculo = veiculo.idveiculo WHERE veiculo.modelo = 'Palio';

/* 4 - Exiba o nome do cliente que comprou o carro mais caro */

SELECT cliente.nome, veiculo.modelo, veiculo.valor 
FROM venda INNER JOIN cliente ON venda.idcliente = cliente.idcliente INNER JOIN veiculo ON venda.idveiculo = veiculo.idveiculo HAVING MAX(veiculo.valor);

/* 5 - Exiba o nome e o total de veículos vendidos por cada vendedor */

SELECT COUNT(venda.idveiculo), vendedor.nome, veiculo.modelo 
FROM venda INNER JOIN veiculo ON veiculo.idveiculo = venda.idveiculo INNER JOIN vendedor ON vendedor.idvendedor = venda.idvendedor GROUP BY vendedor.nome;

/* 6 - Exiba o nome e a quantidade de vendas de cada vendedor com idade superior a 40 anos */

SELECT COUNT(venda.idveiculo), vendedor.nome, veiculo.modelo 
FROM venda INNER JOIN veiculo ON veiculo.idveiculo = venda.idveiculo INNER JOIN vendedor ON vendedor.idvendedor = venda.idvendedor WHERE vendedor.idade > 40;

/* 7 - Exiba todos os clientes que compraram carros no valor superior a 30 mil. */

SELECT cliente.nome, veiculo.modelo, veiculo.valor 
FROM venda INNER JOIN cliente ON venda.idcliente = cliente.idcliente INNER JOIN veiculo ON venda.idveiculo = veiculo.idveiculo WHERE veiculo.valor > 30000;
