set sql_safe_updates = 0;

create database techlogica;

use techlogica;

create table Cargo (
	idCargo int not null auto_increment,
    Nome varchar(45) not null,
    Descricao varchar(250) not null,
    Supervisor tinyint not null,
	primary key(idCargo)
);

create table Departamento (
	idDepartamento int not null auto_increment,
    Nome varchar(100) not null,
    Telefone varchar(10) not null,
    Budget float not null,
    primary key(idDepartamento)
);

create table Projeto (
	idProjeto int not null auto_increment,
    Nome varchar(50) not null, 
    DataInicio date not null, 
    DataFim date null,
    idDepartamento int,
    primary key(idProjeto),
    foreign key(IdDepartamento) references Departamento (idDepartamento)
);

create table Etapa (
	idEtapa int not null auto_increment,
    Nome varchar(45) not null,
    DataInicio datetime not null,
    DataFim datetime null,
    IdProjeto int not null,
    primary key(idEtapa),
    foreign key(IdProjeto) references Projeto (idProjeto)

);

create table Reuniao (
	idReuniao int not null auto_increment,
    Ata text not null,
    DataReuniao datetime not null,
    idEtapa int not null,
    primary key(idReuniao),
    foreign key(IdEtapa) references Etapa (idEtapa)

);

create table Empregado (
	idEmpregado int not null auto_increment, 
    Nome varchar(100) not null,
	Sobrenome varchar(100) not null,
    DataNascimento date not null,
    Salario float not null,
    Rg varchar(20) not null,
    Cpf varchar(11) not null,
    Genero tinyint not null,
    idDepartamento int not null,
    idCargo int not null,
    primary key(idEmpregado),
    foreign key(idDepartamento) references Departamento (idDepartamento),
    foreign key(idCargo) references Cargo (idCargo)
    
    );
    
create table Endereco (
	idEndereco int not null auto_increment,
    Logradouro varchar(100) not null, 
    Numero varchar(10) not null, 
    CEP varchar(8) null,
    Complemento varchar(20) null,
    Bairro varchar(45) not null,
    Cidade varchar(45) not null,
    Estado varchar(2) not null,
    idEmpregado int not null,
    primary key(idEndereco),
    foreign key(idEmpregado) references Empregado (idEmpregado)
    
);

create table Dependente (
	idDependente int not null auto_increment,
    Nome varchar(100) not null,
    DataNascimento date not null,
    Sobrenome varchar(100) not null,
    idEmpregado int not null,
    primary key(idDependente),
    foreign key(idEmpregado) references Empregado (idEmpregado)
);

create table EmpregadoProjeto (
	idEmpregadoProjeto int not null auto_increment,
    idEmpregado int not null,
    idProjeto int not null,
    primary key(idEmpregadoProjeto),
    foreign key(idEmpregado) references Empregado (idEmpregado),
    foreign key(idProjeto) references Projeto (idProjeto)
    
);

insert into Cargo (idCargo, Nome, Descricao, Supervisor) values (1, "Analista de Dados", "Produz analises de dados da empresa", 0);
insert into Cargo (idCargo, Nome, Descricao, Supervisor) values (2, "Cientista de Dados", "Cria analises utilizando modelos matematicos", 0);
insert into Cargo (idCargo, Nome, Descricao, Supervisor) values (3, "Engenheiro de Dados", "Desenvolve banco de dados da empresa", 0);
insert into Cargo (idCargo, Nome, Descricao, Supervisor) values (4, "Gerente de Dados", "Gerencia a equipe de dados", 1);
insert into Cargo (idCargo, Nome, Descricao, Supervisor) values (5, "Analista de RH", "Trabalha com as contratacoes", 0);
insert into Cargo (idCargo, Nome, Descricao, Supervisor) values (6, "Analista contabil", "Cuida da parte contabil da empresa", 0);
insert into Cargo (idCargo, Nome, Descricao, Supervisor) values (7, "Gerente de RH", "Gerencia o RH", 1);
insert into Cargo (idCargo, Nome, Descricao, Supervisor) values (8, "Analista de Marketing 1", "Trabalha na equipe de vendas", 0);
insert into Cargo (idCargo, Nome, Descricao, Supervisor) values (9, "Analista de Marketing 2", "Cuida da imagem da empresa", 0);
insert into Cargo (idCargo, Nome, Descricao, Supervisor) values (10, "Gerente de Marketing", "Gerencia a equipe do Marketing", 1);
insert into Cargo (idCargo, Nome, Descricao, Supervisor) values (11, "Engenheiro de Software 1", "Desenvolve sistemas da empresa", 0);
insert into Cargo (idCargo, Nome, Descricao, Supervisor) values (12, "Engenheiro de Software 2", "Trabalha com o desenvolvimento dos sistemas", 0);
insert into Cargo (idCargo, Nome, Descricao, Supervisor) values (13, "Engenheiro de Software 3", "Presta suporte aos sistemas", 0);
insert into Cargo (idCargo, Nome, Descricao, Supervisor) values (14, "Engenheiro de Software 4", "Atua no frontend do desenvolvimento", 0);
insert into Cargo (idCargo, Nome, Descricao, Supervisor) values (15, "Gerente de TI", "Gerencia o time de TI", 1);

insert into Departamento (idDepartamento, Nome, Telefone, Budget) values (1, "Dados", "4100000001", 1000.00);
insert into Departamento (idDepartamento, Nome, Telefone, Budget) values (2, "RH", "4100000002", 2000.00);
insert into Departamento (idDepartamento, Nome, Telefone, Budget) values (3, "Marketing", "4100000003", 3000.00);
insert into Departamento (idDepartamento, Nome, Telefone, Budget) values (4, "TI", "4100000004", 4000.00);

insert into Projeto (idProjeto, Nome, DataInicio, idDepartamento) values (1, "Projeto Lana", 01/03/2020, 1);
insert into Projeto (idProjeto, Nome, DataInicio, idDepartamento) values (2, "Projeto Katia", 02/03/2020, 2);
insert into Projeto (idProjeto, Nome, DataInicio, idDepartamento) values (3, "Projeto Linear", 03/03/2020, 3);
insert into Projeto (idProjeto, Nome, DataInicio, idDepartamento) values (4, "Projeto Simples", 04/03/2020, 4);
insert into Projeto (idProjeto, Nome, DataInicio, idDepartamento) values (5, "Projeto Complexo", 05/03/2020, 1);
insert into Projeto (idProjeto, Nome, DataInicio, idDepartamento) values (6, "Projeto Medico", 06/03/2020, 2);
insert into Projeto (idProjeto, Nome, DataInicio, idDepartamento) values (7, "Projeto You", 07/03/2020, 3);
insert into Projeto (idProjeto, Nome, DataInicio, idDepartamento) values (8, "Projeto Vendas", 08/03/2020, 4);
insert into Projeto (idProjeto, Nome, DataInicio, idDepartamento) values (9, "Projeto Maria", 09/03/2020, 1);
insert into Projeto (idProjeto, Nome, DataInicio, idDepartamento) values (10, "Projeto Dave", 10/03/2020, 2);
insert into Projeto (idProjeto, Nome, DataInicio, idDepartamento) values (11, "Projeto Life", 11/03/2020, 3);
insert into Projeto (idProjeto, Nome, DataInicio, idDepartamento) values (12, "Projeto All", 12/03/2020, 4);
insert into Projeto (idProjeto, Nome, DataInicio, idDepartamento) values (13, "Projeto Tudo", 13/03/2020, 1);
insert into Projeto (idProjeto, Nome, DataInicio, idDepartamento) values (14, "Projeto Mundo", 14/03/2020, 2);
insert into Projeto (idProjeto, Nome, DataInicio, idDepartamento) values (15, "Projeto Vida", 15/03/2020, 3);



insert into Etapa (idEtapa, Nome, DataInicio, IdProjeto) values (1, "Etapa 1", 01/03/2020, 1);
insert into Etapa (idEtapa, Nome, DataInicio, IdProjeto) values (2, "Etapa 2", 02/03/2020, 2);
insert into Etapa (idEtapa, Nome, DataInicio, IdProjeto) values (3, "Etapa 3", 03/03/2020, 3);
insert into Etapa (idEtapa, Nome, DataInicio, IdProjeto) values (4, "Etapa 4", 04/03/2020, 4);
insert into Etapa (idEtapa, Nome, DataInicio, IdProjeto) values (5, "Etapa 5", 06/03/2020, 5);
insert into Etapa (idEtapa, Nome, DataInicio, IdProjeto) values (6, "Etapa 6", 06/03/2020, 6);
insert into Etapa (idEtapa, Nome, DataInicio, IdProjeto) values (7, "Etapa 7", 07/03/2020, 7);
insert into Etapa (idEtapa, Nome, DataInicio, IdProjeto) values (8, "Etapa 8", 08/03/2020, 8);
insert into Etapa (idEtapa, Nome, DataInicio, IdProjeto) values (9, "Etapa 9", 09/03/2020, 9);
insert into Etapa (idEtapa, Nome, DataInicio, IdProjeto) values (10, "Etapa 10", 10/03/2020, 10);
insert into Etapa (idEtapa, Nome, DataInicio, IdProjeto) values (11, "Etapa 11", 11/03/2020, 11);
insert into Etapa (idEtapa, Nome, DataInicio, IdProjeto) values (12, "Etapa 12", 12/03/2020, 12);
insert into Etapa (idEtapa, Nome, DataInicio, IdProjeto) values (13, "Etapa 13", 13/03/2020, 13);
insert into Etapa (idEtapa, Nome, DataInicio, IdProjeto) values (14, "Etapa 12", 14/03/2020, 14);
insert into Etapa (idEtapa, Nome, DataInicio, IdProjeto) values (15, "Etapa 14", 15/03/2020, 15);

insert into Reuniao (idReuniao, Ata, DataReuniao, idEtapa) values (1, "Essa reunião foi realizada para definir algumas etapas, etapas x, y, z", 01/03/2020, 1);
insert into Reuniao (idReuniao, Ata, DataReuniao, idEtapa) values (2, "Essa reunião foi realizada para definir algumas etapas, etapas x, y, z", 02/03/2020, 2);
insert into Reuniao (idReuniao, Ata, DataReuniao, idEtapa) values (3, "Essa reunião foi realizada para definir algumas etapas, etapas x, y, z", 03/03/2020, 3);
insert into Reuniao (idReuniao, Ata, DataReuniao, idEtapa) values (4, "Essa reunião foi realizada para definir algumas etapas, etapas x, y, z", 04/03/2020, 4);
insert into Reuniao (idReuniao, Ata, DataReuniao, idEtapa) values (5, "Essa reunião foi realizada para definir algumas etapas, etapas x, y, z", 05/03/2020, 5);
insert into Reuniao (idReuniao, Ata, DataReuniao, idEtapa) values (6, "Essa reunião foi realizada para definir algumas etapas, etapas x, y, z", 06/03/2020, 6);
insert into Reuniao (idReuniao, Ata, DataReuniao, idEtapa) values (7, "Essa reunião foi realizada para definir algumas etapas, etapas x, y, z", 07/03/2020, 7);
insert into Reuniao (idReuniao, Ata, DataReuniao, idEtapa) values (8, "Essa reunião foi realizada para definir algumas etapas, etapas x, y, z", 08/03/2020, 8);
insert into Reuniao (idReuniao, Ata, DataReuniao, idEtapa) values (9, "Essa reunião foi realizada para definir algumas etapas, etapas x, y, z", 09/03/2020, 9);
insert into Reuniao (idReuniao, Ata, DataReuniao, idEtapa) values (10, "Essa reunião foi realizada para definir algumas etapas, etapas x, y, z", 10/03/2020, 10);
insert into Reuniao (idReuniao, Ata, DataReuniao, idEtapa) values (11, "Essa reunião foi realizada para definir algumas etapas, etapas x, y, z", 11/03/2020, 11);
insert into Reuniao (idReuniao, Ata, DataReuniao, idEtapa) values (12, "Essa reunião foi realizada para definir algumas etapas, etapas x, y, z", 12/03/2020, 12);
insert into Reuniao (idReuniao, Ata, DataReuniao, idEtapa) values (13, "Essa reunião foi realizada para definir algumas etapas, etapas x, y, z", 13/03/2020, 13);
insert into Reuniao (idReuniao, Ata, DataReuniao, idEtapa) values (14, "Essa reunião foi realizada para definir algumas etapas, etapas x, y, z", 14/03/2020, 14);
insert into Reuniao (idReuniao, Ata, DataReuniao, idEtapa) values (15, "Essa reunião foi realizada para definir algumas etapas, etapas x, y, z", 15/03/2020, 15);

insert into Empregado (idEmpregado, Nome, Sobrenome, DataNascimento, Salario, Rg, Cpf, Genero, idDepartamento, idCargo) values (1, "Larissa", "Montenegro", 19/10/1990, 2456.00, "190092325", "02499944995", 1, 1, 1);
insert into Empregado (idEmpregado, Nome, Sobrenome, DataNascimento, Salario, Rg, Cpf, Genero, idDepartamento, idCargo) values (2, "Angela", "Arantes", 20/10/1990, 5000.00, "190092326", "02499944996", 1, 1, 2);
insert into Empregado (idEmpregado, Nome, Sobrenome, DataNascimento, Salario, Rg, Cpf, Genero, idDepartamento, idCargo) values (3, "Carla", "Leticia", 21/10/1990, 1900.00, "190092327", "02499944997", 1, 1, 3);
insert into Empregado (idEmpregado, Nome, Sobrenome, DataNascimento, Salario, Rg, Cpf, Genero, idDepartamento, idCargo) values (4, "Lucas", "Lima", 22/10/1990, 1900.00, "190092328", "02499944998", 0, 1, 4);
insert into Empregado (idEmpregado, Nome, Sobrenome, DataNascimento, Salario, Rg, Cpf, Genero, idDepartamento, idCargo) values (5, "Amanda", "Katia", 23/10/1990, 3000.00, "190092329", "02499944999", 1, 2, 5);
insert into Empregado (idEmpregado, Nome, Sobrenome, DataNascimento, Salario, Rg, Cpf, Genero, idDepartamento, idCargo) values (6, "Jenifer", "Rocha", 24/10/1990, 1900.00, "190092330", "02499944920", 1, 2, 6);
insert into Empregado (idEmpregado, Nome, Sobrenome, DataNascimento, Salario, Rg, Cpf, Genero, idDepartamento, idCargo) values (7, "Antunes", "Carlos", 25/10/1990, 1000.00, "190092331", "02499944921", 0, 2, 7);
insert into Empregado (idEmpregado, Nome, Sobrenome, DataNascimento, Salario, Rg, Cpf, Genero, idDepartamento, idCargo) values (8, "Fernando", "Cassio", 26/10/1990, 1900.00, "190092332", "02499944929", 0, 3, 8);
insert into Empregado (idEmpregado, Nome, Sobrenome, DataNascimento, Salario, Rg, Cpf, Genero, idDepartamento, idCargo) values (9, "Angelo", "Santos", 27/10/1990, 1900.00, "190092333", "02499944930", 0, 3, 9);
insert into Empregado (idEmpregado, Nome, Sobrenome, DataNascimento, Salario, Rg, Cpf, Genero, idDepartamento, idCargo) values (10, "Mariana", "Silva", 28/10/1990, 6000.00, "190092334", "02499944931", 1, 3, 10);
insert into Empregado (idEmpregado, Nome, Sobrenome, DataNascimento, Salario, Rg, Cpf, Genero, idDepartamento, idCargo) values (11, "Patrick", "Antoni", 29/10/1990, 3800.00, "190092335", "02499944932", 0, 4, 11);
insert into Empregado (idEmpregado, Nome, Sobrenome, DataNascimento, Salario, Rg, Cpf, Genero, idDepartamento, idCargo) values (12, "Vanessa", "Cassia", 01/10/1990, 1900.00, "190092336", "02499944933", 1, 4, 12);
insert into Empregado (idEmpregado, Nome, Sobrenome, DataNascimento, Salario, Rg, Cpf, Genero, idDepartamento, idCargo) values (13, "Karla", "Jucassia", 02/10/1990, 2500.00, "190092337", "02499944934", 1, 4, 13);
insert into Empregado (idEmpregado, Nome, Sobrenome, DataNascimento, Salario, Rg, Cpf, Genero, idDepartamento, idCargo) values (14, "Valeria", "Mendes", 03/10/1990, 1900.00, "190092338", "02499944945", 1, 4, 14);
insert into Empregado (idEmpregado, Nome, Sobrenome, DataNascimento, Salario, Rg, Cpf, Genero, idDepartamento, idCargo) values (15, "Isaac", "Newton", 09/10/1900, 15000.00, "190092338", "02499944945", 0, 4, 15);


insert into Endereco (idEndereco, Logradouro, Numero, CEP, Bairro, Cidade, Estado, idEmpregado) values (1, "Rua Amelia", "401", "80430080", "Centro", "Belo Horizonte", "MG", 1);
insert into Endereco (idEndereco, Logradouro, Numero, CEP, Bairro, Cidade, Estado, idEmpregado) values (2, "Rua Amelia", "402", "80430080", "Centro", "Belo Horizonte", "MG", 2);
insert into Endereco (idEndereco, Logradouro, Numero, CEP, Bairro, Cidade, Estado, idEmpregado) values (3, "Rua Amelia", "403", "80430080", "Centro", "Belo Horizonte", "MG", 3);
insert into Endereco (idEndereco, Logradouro, Numero, CEP, Bairro, Cidade, Estado, idEmpregado) values (4, "Rua Amelia", "404", "80430080", "Centro", "Belo Horizonte", "MG", 4);
insert into Endereco (idEndereco, Logradouro, Numero, CEP, Bairro, Cidade, Estado, idEmpregado) values (5, "Rua Amelia", "405", "80430080", "Centro", "Belo Horizonte", "MG", 5);
insert into Endereco (idEndereco, Logradouro, Numero, CEP, Bairro, Cidade, Estado, idEmpregado) values (6, "Rua Amelia", "406", "80430080", "Centro", "Belo Horizonte", "MG", 6);
insert into Endereco (idEndereco, Logradouro, Numero, CEP, Bairro, Cidade, Estado, idEmpregado) values (7, "Rua Amelia", "415", "80430080", "Centro", "Belo Horizonte", "MG", 7);
insert into Endereco (idEndereco, Logradouro, Numero, CEP, Bairro, Cidade, Estado, idEmpregado) values (8, "Rua Amelia", "407", "80430080", "Centro", "Belo Horizonte", "MG", 8);
insert into Endereco (idEndereco, Logradouro, Numero, CEP, Bairro, Cidade, Estado, idEmpregado) values (9, "Rua Amelia", "408", "80430080", "Centro", "Belo Horizonte", "MG", 9);
insert into Endereco (idEndereco, Logradouro, Numero, CEP, Bairro, Cidade, Estado, idEmpregado) values (10, "Rua Amelia", "409", "80430080", "Centro", "Belo Horizonte", "MG", 10);
insert into Endereco (idEndereco, Logradouro, Numero, CEP, Bairro, Cidade, Estado, idEmpregado) values (11, "Rua Amelia", "410", "80430080", "Centro", "Belo Horizonte", "MG", 11);
insert into Endereco (idEndereco, Logradouro, Numero, CEP, Bairro, Cidade, Estado, idEmpregado) values (12, "Rua Amelia", "411", "80430080", "Centro", "Belo Horizonte", "MG", 12);
insert into Endereco (idEndereco, Logradouro, Numero, CEP, Bairro, Cidade, Estado, idEmpregado) values (13, "Rua Amelia", "412", "80430080", "Centro", "Belo Horizonte", "MG", 13);
insert into Endereco (idEndereco, Logradouro, Numero, CEP, Bairro, Cidade, Estado, idEmpregado) values (14, "Rua Amelia", "413", "80430080", "Centro", "Belo Horizonte", "MG", 14);
insert into Endereco (idEndereco, Logradouro, Numero, CEP, Bairro, Cidade, Estado, idEmpregado) values (15, "Rua Amelia", "414", "80430080", "Centro", "Belo Horizonte", "MG", 15);


insert into Dependente (idDependente, Nome, DataNascimento, Sobrenome, idEmpregado) values (1, "Bianca", 14/10/2005, "Montenegro", 1);
insert into Dependente (idDependente, Nome, DataNascimento, Sobrenome, idEmpregado) values (2, "Cassia", 15/10/2005, "Arantes", 2);
insert into Dependente (idDependente, Nome, DataNascimento, Sobrenome, idEmpregado) values (3, "Larissa", 16/10/2005, "Leticia", 3);
insert into Dependente (idDependente, Nome, DataNascimento, Sobrenome, idEmpregado) values (4, "Lucas", 17/10/2005, "Lima", 4);
insert into Dependente (idDependente, Nome, DataNascimento, Sobrenome, idEmpregado) values (5, "Murilo", 18/10/2005, "Katia", 5);
insert into Dependente (idDependente, Nome, DataNascimento, Sobrenome, idEmpregado) values (6, "Angela", 19/10/2005, "Rocha", 6);
insert into Dependente (idDependente, Nome, DataNascimento, Sobrenome, idEmpregado) values (7, "Leonardo", 20/10/2005, "Carlos", 7);
insert into Dependente (idDependente, Nome, DataNascimento, Sobrenome, idEmpregado) values (8, "Kassia", 21/10/2005, "Cassio", 8);
insert into Dependente (idDependente, Nome, DataNascimento, Sobrenome, idEmpregado) values (9, "Alana", 22/10/2005, "Santos", 9);
insert into Dependente (idDependente, Nome, DataNascimento, Sobrenome, idEmpregado) values (10, "Jenifer", 22/10/2005, "Silva", 10);
insert into Dependente (idDependente, Nome, DataNascimento, Sobrenome, idEmpregado) values (11, "Mateus", 23/10/2005, "Antoni", 11);
insert into Dependente (idDependente, Nome, DataNascimento, Sobrenome, idEmpregado) values (12, "Danilo", 24/10/2005, "Cassia", 12);
insert into Dependente (idDependente, Nome, DataNascimento, Sobrenome, idEmpregado) values (13, "Ana", 25/10/2005, "Jucassia", 13);
insert into Dependente (idDependente, Nome, DataNascimento, Sobrenome, idEmpregado) values (14, "Maria", 26/10/2005, "Mendes", 14);
insert into Dependente (idDependente, Nome, DataNascimento, Sobrenome, idEmpregado) values (15, "Luiza", 27/10/2005, "Newton", 15);

insert into EmpregadoProjeto (idEmpregadoProjeto, idEmpregado, idProjeto) values (1, 1, 1);
insert into EmpregadoProjeto (idEmpregadoProjeto, idEmpregado, idProjeto) values (2, 2, 1);
insert into EmpregadoProjeto (idEmpregadoProjeto, idEmpregado, idProjeto) values (3, 3, 1);
insert into EmpregadoProjeto (idEmpregadoProjeto, idEmpregado, idProjeto) values (4, 4, 2);
insert into EmpregadoProjeto (idEmpregadoProjeto, idEmpregado, idProjeto) values (5, 5, 2);
insert into EmpregadoProjeto (idEmpregadoProjeto, idEmpregado, idProjeto) values (6, 1, 2);
insert into EmpregadoProjeto (idEmpregadoProjeto, idEmpregado, idProjeto) values (7, 7, 3);
insert into EmpregadoProjeto (idEmpregadoProjeto, idEmpregado, idProjeto) values (8, 8, 3);
insert into EmpregadoProjeto (idEmpregadoProjeto, idEmpregado, idProjeto) values (9, 2, 4);
insert into EmpregadoProjeto (idEmpregadoProjeto, idEmpregado, idProjeto) values (10, 2, 4);
insert into EmpregadoProjeto (idEmpregadoProjeto, idEmpregado, idProjeto) values (11, 11, 5);
insert into EmpregadoProjeto (idEmpregadoProjeto, idEmpregado, idProjeto) values (12, 8, 6);
insert into EmpregadoProjeto (idEmpregadoProjeto, idEmpregado, idProjeto) values (13, 1, 7);
insert into EmpregadoProjeto (idEmpregadoProjeto, idEmpregado, idProjeto) values (14, 1, 8);
insert into EmpregadoProjeto (idEmpregadoProjeto, idEmpregado, idProjeto) values (15, 15, 9);


select *
  from Cargo;

select *
  from Projeto;

select *
  from Departamento;

select *
  from Etapa;

select *
  from Reuniao;

select *
  from Empregado;

select *
  from Endereco;

select *
  from Dependente;

select *
  from EmpregadoProjeto;


delete 
  from EmpregadoProjeto;

delete 
  from Dependente;
  
delete 
  from Endereco;

delete 
  from Empregado;

delete 
  from Reuniao;
  
delete 
  from Etapa; 
 
delete 
  from Projeto;

delete 
  from Departamento;

delete 
  from Cargo;


insert into Cargo (idCargo, Nome, Descricao, Supervisor) values (1, "Analista de Dados", "Produz analises de dados da empresa", 0);
insert into Cargo (idCargo, Nome, Descricao, Supervisor) values (2, "Cientista de Dados", "Cria analises utilizando modelos matematicos", 0);
insert into Cargo (idCargo, Nome, Descricao, Supervisor) values (3, "Engenheiro de Dados", "Desenvolve banco de dados da empresa", 0);
insert into Cargo (idCargo, Nome, Descricao, Supervisor) values (4, "Gerente de Dados", "Gerencia a equipe de dados", 1);
insert into Cargo (idCargo, Nome, Descricao, Supervisor) values (5, "Analista de RH", "Trabalha com as contratacoes", 0);
insert into Cargo (idCargo, Nome, Descricao, Supervisor) values (6, "Analista contabil", "Cuida da parte contabil da empresa", 0);
insert into Cargo (idCargo, Nome, Descricao, Supervisor) values (7, "Gerente de RH", "Gerencia o RH", 1);
insert into Cargo (idCargo, Nome, Descricao, Supervisor) values (8, "Analista de Marketing 1", "Trabalha na equipe de vendas", 0);
insert into Cargo (idCargo, Nome, Descricao, Supervisor) values (9, "Analista de Marketing 2", "Cuida da imagem da empresa", 0);
insert into Cargo (idCargo, Nome, Descricao, Supervisor) values (10, "Gerente de Marketing", "Gerencia a equipe do Marketing", 1);
insert into Cargo (idCargo, Nome, Descricao, Supervisor) values (11, "Engenheiro de Software 1", "Desenvolve sistemas da empresa", 0);
insert into Cargo (idCargo, Nome, Descricao, Supervisor) values (12, "Engenheiro de Software 2", "Trabalha com o desenvolvimento dos sistemas", 0);
insert into Cargo (idCargo, Nome, Descricao, Supervisor) values (13, "Engenheiro de Software 3", "Presta suporte aos sistemas", 0);
insert into Cargo (idCargo, Nome, Descricao, Supervisor) values (14, "Engenheiro de Software 4", "Atua no frontend do desenvolvimento", 0);
insert into Cargo (idCargo, Nome, Descricao, Supervisor) values (15, "Gerente de TI", "Gerencia o time de TI", 1);

insert into Departamento (idDepartamento, Nome, Telefone, Budget) values (1, "Dados", "4100000001", 1000.00);
insert into Departamento (idDepartamento, Nome, Telefone, Budget) values (2, "RH", "4100000002", 2000.00);
insert into Departamento (idDepartamento, Nome, Telefone, Budget) values (3, "Marketing", "4100000003", 3000.00);
insert into Departamento (idDepartamento, Nome, Telefone, Budget) values (4, "TI", "4100000004", 4000.00);

insert into Projeto (idProjeto, Nome, DataInicio, idDepartamento) values (1, "Projeto Lana", 01/03/2020, 1);
insert into Projeto (idProjeto, Nome, DataInicio, idDepartamento) values (2, "Projeto Katia", 02/03/2020, 2);
insert into Projeto (idProjeto, Nome, DataInicio, idDepartamento) values (3, "Projeto Linear", 03/03/2020, 3);
insert into Projeto (idProjeto, Nome, DataInicio, idDepartamento) values (4, "Projeto Simples", 04/03/2020, 4);
insert into Projeto (idProjeto, Nome, DataInicio, idDepartamento) values (5, "Projeto Complexo", 05/03/2020, 1);
insert into Projeto (idProjeto, Nome, DataInicio, idDepartamento) values (6, "Projeto Medico", 06/03/2020, 2);
insert into Projeto (idProjeto, Nome, DataInicio, idDepartamento) values (7, "Projeto You", 07/03/2020, 3);
insert into Projeto (idProjeto, Nome, DataInicio, idDepartamento) values (8, "Projeto Vendas", 08/03/2020, 4);
insert into Projeto (idProjeto, Nome, DataInicio, idDepartamento) values (9, "Projeto Maria", 09/03/2020, 1);
insert into Projeto (idProjeto, Nome, DataInicio, idDepartamento) values (10, "Projeto Dave", 10/03/2020, 2);
insert into Projeto (idProjeto, Nome, DataInicio, idDepartamento) values (11, "Projeto Life", 11/03/2020, 3);
insert into Projeto (idProjeto, Nome, DataInicio, idDepartamento) values (12, "Projeto All", 12/03/2020, 4);
insert into Projeto (idProjeto, Nome, DataInicio, idDepartamento) values (13, "Projeto Tudo", 13/03/2020, 1);
insert into Projeto (idProjeto, Nome, DataInicio, idDepartamento) values (14, "Projeto Mundo", 14/03/2020, 2);
insert into Projeto (idProjeto, Nome, DataInicio, idDepartamento) values (15, "Projeto Vida", 15/03/2020, 3);



insert into Etapa (idEtapa, Nome, DataInicio, IdProjeto) values (1, "Etapa 1", 01/03/2020, 1);
insert into Etapa (idEtapa, Nome, DataInicio, IdProjeto) values (2, "Etapa 2", 02/03/2020, 2);
insert into Etapa (idEtapa, Nome, DataInicio, IdProjeto) values (3, "Etapa 3", 03/03/2020, 3);
insert into Etapa (idEtapa, Nome, DataInicio, IdProjeto) values (4, "Etapa 4", 04/03/2020, 4);
insert into Etapa (idEtapa, Nome, DataInicio, IdProjeto) values (5, "Etapa 5", 06/03/2020, 5);
insert into Etapa (idEtapa, Nome, DataInicio, IdProjeto) values (6, "Etapa 6", 06/03/2020, 6);
insert into Etapa (idEtapa, Nome, DataInicio, IdProjeto) values (7, "Etapa 7", 07/03/2020, 7);
insert into Etapa (idEtapa, Nome, DataInicio, IdProjeto) values (8, "Etapa 8", 08/03/2020, 8);
insert into Etapa (idEtapa, Nome, DataInicio, IdProjeto) values (9, "Etapa 9", 09/03/2020, 9);
insert into Etapa (idEtapa, Nome, DataInicio, IdProjeto) values (10, "Etapa 10", 10/03/2020, 10);
insert into Etapa (idEtapa, Nome, DataInicio, IdProjeto) values (11, "Etapa 11", 11/03/2020, 11);
insert into Etapa (idEtapa, Nome, DataInicio, IdProjeto) values (12, "Etapa 12", 12/03/2020, 12);
insert into Etapa (idEtapa, Nome, DataInicio, IdProjeto) values (13, "Etapa 13", 13/03/2020, 13);
insert into Etapa (idEtapa, Nome, DataInicio, IdProjeto) values (14, "Etapa 12", 14/03/2020, 14);
insert into Etapa (idEtapa, Nome, DataInicio, IdProjeto) values (15, "Etapa 14", 15/03/2020, 15);

insert into Reuniao (idReuniao, Ata, DataReuniao, idEtapa) values (1, "Essa reunião foi realizada para definir algumas etapas, etapas x, y, z", 01/03/2020, 1);
insert into Reuniao (idReuniao, Ata, DataReuniao, idEtapa) values (2, "Essa reunião foi realizada para definir algumas etapas, etapas x, y, z", 02/03/2020, 2);
insert into Reuniao (idReuniao, Ata, DataReuniao, idEtapa) values (3, "Essa reunião foi realizada para definir algumas etapas, etapas x, y, z", 03/03/2020, 3);
insert into Reuniao (idReuniao, Ata, DataReuniao, idEtapa) values (4, "Essa reunião foi realizada para definir algumas etapas, etapas x, y, z", 04/03/2020, 4);
insert into Reuniao (idReuniao, Ata, DataReuniao, idEtapa) values (5, "Essa reunião foi realizada para definir algumas etapas, etapas x, y, z", 05/03/2020, 5);
insert into Reuniao (idReuniao, Ata, DataReuniao, idEtapa) values (6, "Essa reunião foi realizada para definir algumas etapas, etapas x, y, z", 06/03/2020, 6);
insert into Reuniao (idReuniao, Ata, DataReuniao, idEtapa) values (7, "Essa reunião foi realizada para definir algumas etapas, etapas x, y, z", 07/03/2020, 7);
insert into Reuniao (idReuniao, Ata, DataReuniao, idEtapa) values (8, "Essa reunião foi realizada para definir algumas etapas, etapas x, y, z", 08/03/2020, 8);
insert into Reuniao (idReuniao, Ata, DataReuniao, idEtapa) values (9, "Essa reunião foi realizada para definir algumas etapas, etapas x, y, z", 09/03/2020, 9);
insert into Reuniao (idReuniao, Ata, DataReuniao, idEtapa) values (10, "Essa reunião foi realizada para definir algumas etapas, etapas x, y, z", 10/03/2020, 10);
insert into Reuniao (idReuniao, Ata, DataReuniao, idEtapa) values (11, "Essa reunião foi realizada para definir algumas etapas, etapas x, y, z", 11/03/2020, 11);
insert into Reuniao (idReuniao, Ata, DataReuniao, idEtapa) values (12, "Essa reunião foi realizada para definir algumas etapas, etapas x, y, z", 12/03/2020, 12);
insert into Reuniao (idReuniao, Ata, DataReuniao, idEtapa) values (13, "Essa reunião foi realizada para definir algumas etapas, etapas x, y, z", 13/03/2020, 13);
insert into Reuniao (idReuniao, Ata, DataReuniao, idEtapa) values (14, "Essa reunião foi realizada para definir algumas etapas, etapas x, y, z", 14/03/2020, 14);
insert into Reuniao (idReuniao, Ata, DataReuniao, idEtapa) values (15, "Essa reunião foi realizada para definir algumas etapas, etapas x, y, z", 15/03/2020, 15);

insert into Empregado (idEmpregado, Nome, Sobrenome, DataNascimento, Salario, Rg, Cpf, Genero, idDepartamento, idCargo) values (1, "Larissa", "Montenegro", 19/10/1990, 2456.00, "190092325", "02499944995", 1, 1, 1);
insert into Empregado (idEmpregado, Nome, Sobrenome, DataNascimento, Salario, Rg, Cpf, Genero, idDepartamento, idCargo) values (2, "Angela", "Arantes", 20/10/1990, 5000.00, "190092326", "02499944996", 1, 1, 2);
insert into Empregado (idEmpregado, Nome, Sobrenome, DataNascimento, Salario, Rg, Cpf, Genero, idDepartamento, idCargo) values (3, "Carla", "Leticia", 21/10/1990, 1900.00, "190092327", "02499944997", 1, 1, 3);
insert into Empregado (idEmpregado, Nome, Sobrenome, DataNascimento, Salario, Rg, Cpf, Genero, idDepartamento, idCargo) values (4, "Lucas", "Lima", 22/10/1990, 1900.00, "190092328", "02499944998", 0, 1, 4);
insert into Empregado (idEmpregado, Nome, Sobrenome, DataNascimento, Salario, Rg, Cpf, Genero, idDepartamento, idCargo) values (5, "Amanda", "Katia", 23/10/1990, 3000.00, "190092329", "02499944999", 1, 2, 5);
insert into Empregado (idEmpregado, Nome, Sobrenome, DataNascimento, Salario, Rg, Cpf, Genero, idDepartamento, idCargo) values (6, "Jenifer", "Rocha", 24/10/1990, 1900.00, "190092330", "02499944920", 1, 2, 6);
insert into Empregado (idEmpregado, Nome, Sobrenome, DataNascimento, Salario, Rg, Cpf, Genero, idDepartamento, idCargo) values (7, "Antunes", "Carlos", 25/10/1990, 1000.00, "190092331", "02499944921", 0, 2, 7);
insert into Empregado (idEmpregado, Nome, Sobrenome, DataNascimento, Salario, Rg, Cpf, Genero, idDepartamento, idCargo) values (8, "Fernando", "Cassio", 26/10/1990, 1900.00, "190092332", "02499944929", 0, 3, 8);
insert into Empregado (idEmpregado, Nome, Sobrenome, DataNascimento, Salario, Rg, Cpf, Genero, idDepartamento, idCargo) values (9, "Angelo", "Santos", 27/10/1990, 1900.00, "190092333", "02499944930", 0, 3, 9);
insert into Empregado (idEmpregado, Nome, Sobrenome, DataNascimento, Salario, Rg, Cpf, Genero, idDepartamento, idCargo) values (10, "Mariana", "Silva", 28/10/1990, 6000.00, "190092334", "02499944931", 1, 3, 10);
insert into Empregado (idEmpregado, Nome, Sobrenome, DataNascimento, Salario, Rg, Cpf, Genero, idDepartamento, idCargo) values (11, "Patrick", "Antoni", 29/10/1990, 3800.00, "190092335", "02499944932", 0, 4, 11);
insert into Empregado (idEmpregado, Nome, Sobrenome, DataNascimento, Salario, Rg, Cpf, Genero, idDepartamento, idCargo) values (12, "Vanessa", "Cassia", 01/10/1990, 1900.00, "190092336", "02499944933", 1, 4, 12);
insert into Empregado (idEmpregado, Nome, Sobrenome, DataNascimento, Salario, Rg, Cpf, Genero, idDepartamento, idCargo) values (13, "Karla", "Jucassia", 02/10/1990, 2500.00, "190092337", "02499944934", 1, 4, 13);
insert into Empregado (idEmpregado, Nome, Sobrenome, DataNascimento, Salario, Rg, Cpf, Genero, idDepartamento, idCargo) values (14, "Valeria", "Mendes", 03/10/1990, 1900.00, "190092338", "02499944945", 1, 4, 14);
insert into Empregado (idEmpregado, Nome, Sobrenome, DataNascimento, Salario, Rg, Cpf, Genero, idDepartamento, idCargo) values (15, "Isaac", "Newton", 09/10/1900, 15000.00, "190092338", "02499944945", 0, 4, 15);


insert into Endereco (idEndereco, Logradouro, Numero, CEP, Bairro, Cidade, Estado, idEmpregado) values (1, "Rua Amelia", "401", "80430080", "Centro", "Belo Horizonte", "MG", 1);
insert into Endereco (idEndereco, Logradouro, Numero, CEP, Bairro, Cidade, Estado, idEmpregado) values (2, "Rua Amelia", "402", "80430080", "Centro", "Belo Horizonte", "MG", 2);
insert into Endereco (idEndereco, Logradouro, Numero, CEP, Bairro, Cidade, Estado, idEmpregado) values (3, "Rua Amelia", "403", "80430080", "Centro", "Belo Horizonte", "MG", 3);
insert into Endereco (idEndereco, Logradouro, Numero, CEP, Bairro, Cidade, Estado, idEmpregado) values (4, "Rua Amelia", "404", "80430080", "Centro", "Belo Horizonte", "MG", 4);
insert into Endereco (idEndereco, Logradouro, Numero, CEP, Bairro, Cidade, Estado, idEmpregado) values (5, "Rua Amelia", "405", "80430080", "Centro", "Belo Horizonte", "MG", 5);
insert into Endereco (idEndereco, Logradouro, Numero, CEP, Bairro, Cidade, Estado, idEmpregado) values (6, "Rua Amelia", "406", "80430080", "Centro", "Belo Horizonte", "MG", 6);
insert into Endereco (idEndereco, Logradouro, Numero, CEP, Bairro, Cidade, Estado, idEmpregado) values (7, "Rua Amelia", "415", "80430080", "Centro", "Belo Horizonte", "MG", 7);
insert into Endereco (idEndereco, Logradouro, Numero, CEP, Bairro, Cidade, Estado, idEmpregado) values (8, "Rua Amelia", "407", "80430080", "Centro", "Belo Horizonte", "MG", 8);
insert into Endereco (idEndereco, Logradouro, Numero, CEP, Bairro, Cidade, Estado, idEmpregado) values (9, "Rua Amelia", "408", "80430080", "Centro", "Belo Horizonte", "MG", 9);
insert into Endereco (idEndereco, Logradouro, Numero, CEP, Bairro, Cidade, Estado, idEmpregado) values (10, "Rua Amelia", "409", "80430080", "Centro", "Belo Horizonte", "MG", 10);
insert into Endereco (idEndereco, Logradouro, Numero, CEP, Bairro, Cidade, Estado, idEmpregado) values (11, "Rua Amelia", "410", "80430080", "Centro", "Belo Horizonte", "MG", 11);
insert into Endereco (idEndereco, Logradouro, Numero, CEP, Bairro, Cidade, Estado, idEmpregado) values (12, "Rua Amelia", "411", "80430080", "Centro", "Belo Horizonte", "MG", 12);
insert into Endereco (idEndereco, Logradouro, Numero, CEP, Bairro, Cidade, Estado, idEmpregado) values (13, "Rua Amelia", "412", "80430080", "Centro", "Belo Horizonte", "MG", 13);
insert into Endereco (idEndereco, Logradouro, Numero, CEP, Bairro, Cidade, Estado, idEmpregado) values (14, "Rua Amelia", "413", "80430080", "Centro", "Belo Horizonte", "MG", 14);
insert into Endereco (idEndereco, Logradouro, Numero, CEP, Bairro, Cidade, Estado, idEmpregado) values (15, "Rua Amelia", "414", "80430080", "Centro", "Belo Horizonte", "MG", 15);


insert into Dependente (idDependente, Nome, DataNascimento, Sobrenome, idEmpregado) values (1, "Bianca", 14/10/2005, "Montenegro", 1);
insert into Dependente (idDependente, Nome, DataNascimento, Sobrenome, idEmpregado) values (2, "Cassia", 15/10/2005, "Arantes", 2);
insert into Dependente (idDependente, Nome, DataNascimento, Sobrenome, idEmpregado) values (3, "Larissa", 16/10/2005, "Leticia", 3);
insert into Dependente (idDependente, Nome, DataNascimento, Sobrenome, idEmpregado) values (4, "Lucas", 17/10/2005, "Lima", 4);
insert into Dependente (idDependente, Nome, DataNascimento, Sobrenome, idEmpregado) values (5, "Murilo", 18/10/2005, "Katia", 5);
insert into Dependente (idDependente, Nome, DataNascimento, Sobrenome, idEmpregado) values (6, "Angela", 19/10/2005, "Rocha", 6);
insert into Dependente (idDependente, Nome, DataNascimento, Sobrenome, idEmpregado) values (7, "Leonardo", 20/10/2005, "Carlos", 7);
insert into Dependente (idDependente, Nome, DataNascimento, Sobrenome, idEmpregado) values (8, "Kassia", 21/10/2005, "Cassio", 8);
insert into Dependente (idDependente, Nome, DataNascimento, Sobrenome, idEmpregado) values (9, "Alana", 22/10/2005, "Santos", 9);
insert into Dependente (idDependente, Nome, DataNascimento, Sobrenome, idEmpregado) values (10, "Jenifer", 22/10/2005, "Silva", 10);
insert into Dependente (idDependente, Nome, DataNascimento, Sobrenome, idEmpregado) values (11, "Mateus", 23/10/2005, "Antoni", 11);
insert into Dependente (idDependente, Nome, DataNascimento, Sobrenome, idEmpregado) values (12, "Danilo", 24/10/2005, "Cassia", 12);
insert into Dependente (idDependente, Nome, DataNascimento, Sobrenome, idEmpregado) values (13, "Ana", 25/10/2005, "Jucassia", 13);
insert into Dependente (idDependente, Nome, DataNascimento, Sobrenome, idEmpregado) values (14, "Maria", 26/10/2005, "Mendes", 14);
insert into Dependente (idDependente, Nome, DataNascimento, Sobrenome, idEmpregado) values (15, "Luiza", 27/10/2005, "Newton", 15);

insert into EmpregadoProjeto (idEmpregadoProjeto, idEmpregado, idProjeto) values (1, 1, 1);
insert into EmpregadoProjeto (idEmpregadoProjeto, idEmpregado, idProjeto) values (2, 2, 1);
insert into EmpregadoProjeto (idEmpregadoProjeto, idEmpregado, idProjeto) values (3, 3, 1);
insert into EmpregadoProjeto (idEmpregadoProjeto, idEmpregado, idProjeto) values (4, 4, 2);
insert into EmpregadoProjeto (idEmpregadoProjeto, idEmpregado, idProjeto) values (5, 5, 2);
insert into EmpregadoProjeto (idEmpregadoProjeto, idEmpregado, idProjeto) values (6, 1, 2);
insert into EmpregadoProjeto (idEmpregadoProjeto, idEmpregado, idProjeto) values (7, 7, 3);
insert into EmpregadoProjeto (idEmpregadoProjeto, idEmpregado, idProjeto) values (8, 8, 3);
insert into EmpregadoProjeto (idEmpregadoProjeto, idEmpregado, idProjeto) values (9, 2, 4);
insert into EmpregadoProjeto (idEmpregadoProjeto, idEmpregado, idProjeto) values (10, 2, 4);
insert into EmpregadoProjeto (idEmpregadoProjeto, idEmpregado, idProjeto) values (11, 11, 5);
insert into EmpregadoProjeto (idEmpregadoProjeto, idEmpregado, idProjeto) values (12, 8, 6);
insert into EmpregadoProjeto (idEmpregadoProjeto, idEmpregado, idProjeto) values (13, 1, 7);
insert into EmpregadoProjeto (idEmpregadoProjeto, idEmpregado, idProjeto) values (14, 1, 8);
insert into EmpregadoProjeto (idEmpregadoProjeto, idEmpregado, idProjeto) values (15, 15, 9);
