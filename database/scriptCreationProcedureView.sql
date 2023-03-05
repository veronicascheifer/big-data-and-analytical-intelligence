#Criação da procedure
DELIMITER |
create procedure aumento_salario (IN aumento float)
begin
	start transaction;
    update empregado
       set salario = salario + (salario * (aumento/100));
	commit;
end;

|
DELIMITER ;

call aumento_salario(10);



DELIMITER |
# Criação da view 
create view dados_empregado as 
select e.nome as nome_empregado
      , d.nome as nome_dependente
  from empregado e
 inner join dependente d 
    on e.idEmpregado = d.idEmpregado;
|
DELIMITER ;


# o nome do empregado com maior salário;  
select q1.nome
  from (
select nome 
	 , max(salario)
  from empregado) q1;

#o nome do empregado com maior salário e o valor deste;
select nome
     , max(salario)
  from empregado;

#o nome do empregado e respectivo salário, ordenando do maior para o menor valor;

select nome 
     , salario
  from empregado
 order by salario; 

#a média de salário de empregados do gênero masculino;
select AVG(salario)
     , genero 
  from empregado
 where genero = 0;
 
#a média de salário de empregados do gênero feminino;
select AVG(salario)
     , genero 
  from empregado
 where genero = 1;

#o nome dos empregados que são gerentes;
select e.nome
  from empregado e
 inner join cargo c
    on e.idCargo = c.idCargo
 where c.supervisor = 1;

#o nome dos empregados que trabalham em um ou mais projetos;
select distinct e.nome
  from empregado e 
 inner join EmpregadoProjeto p 
    on e.idEmpregado = p.idEmpregado;
