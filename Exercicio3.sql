select f.id_fabricante, p.descricao from fabricante f right join produto p on f.id_fabricante = p.id_fabricante;

select cid.descricao, count(cli.id_cidade) numero from cidade cid left join cliente cli on cid.id_cidade = cli.id_cidade
group by cid.descricao;

select cli.nome, cid.descricao from cliente cli left join cidade cid on cli.id_cidade = cid.id_cidade;

select distinct cli.nome from venda v left join cliente cli on v.id_cliente = cli.id_cliente;

select ven.nome, count(v.id_venda) vendas from vendedor ven left join venda v on v.id_vendedor = ven.id_vendedor
group by ven.nome order by vendas desc;

select p.descricao, f.descricao from produto p left join fabricante f on p.id_fabricante = f.id_fabricante
order by f.descricao asc;

select distinct cli.nome from cliente cli right join venda ven on cli.id_cliente = ven.id_cliente where ven.ano = 2011;

select v.nome, ven.* from venda ven left join vendedor v on ven.id_vendedor = v.id_vendedor where ven.ano >= 2011;

select v.nome, cid.descricao from vendedor v inner join cidade cid on v.id_cidade = cid.id_cidade order by cid.descricao asc;

select p.id_produto, p.descricao, p.valor from produto p where p.valor > p.valor;

select p.id_produto, p.descricao, p.valor from produto p
where p.valor = (select MIN(valor) from produto);

select p.id_produto, p.descricao from produto p where p.valor > (select avg(valor) from produto) order by p.valor desc;

select cli.nome, cli.pontos_prog_fidelidade, cli.ano_cadastro, case when cli.ano_cadastro < 2007 or cli.pontos_prog_fidelidade > 12
then 'Ouro' when cli.ano_cadastro between 2007 and 2010 or cli.pontos_prog_fidelidade between 8 and 11 then 'Bronze'
else 'Prata' end classificacao from cliente cli;

update vendedor set salario = case when salario <= 900 then salario * 1.15
when salario between 900 and 1500 then salario * 1.10
when salario > 1500 then salario * 1.05
else salario * 1.02 end;
