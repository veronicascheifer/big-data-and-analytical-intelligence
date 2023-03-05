set sql_safe_updates = 0;

create database techlogica;

use techlogica;

create table Role (
	idRole int not null auto_increment,
    Name varchar(45) not null,
    Description varchar(250) not null,
    Supervisor tinyint not null,
	primary key(idRole)
);

create table Departament (
	idDepartament int not null auto_increment,
    Name varchar(100) not null,
    PhoneNumber varchar(10) not null,
    Budget float not null,
    primary key(idDepartament)
);

create table Project (
	idProject int not null auto_increment,
    Name varchar(50) not null, 
    StartDate date not null, 
    EndDate date null,
    idDepartament int,
    primary key(idProject),
    foreign key(IdDepartament) references Departament (idDepartament)
);

create table Stage (
	idStage int not null auto_increment,
    Name varchar(45) not null,
    StartDate datetime not null,
    EndDate datetime null,
    IdProject int not null,
    primary key(idStage),
    foreign key(IdProject) references Project (idProject)

);

create table Meeting (
	idMeeting int not null auto_increment,
    Ata text not null,
    DataMeeting datetime not null,
    idStage int not null,
    primary key(idMeeting),
    foreign key(IdStage) references Stage (idStage)

);

create table Employee (
	idEmployee int not null auto_increment, 
    Name varchar(100) not null,
	LastName varchar(100) not null,
    BirthDate date not null,
    Salary float not null,
    Rg varchar(20) not null,
    Cpf varchar(11) not null,
    Gender tinyint not null,
    idDepartament int not null,
    idRole int not null,
    primary key(idEmployee),
    foreign key(idDepartament) references Departament (idDepartament),
    foreign key(idRole) references Role (idRole)
    
    );
    
create table Address (
	idAddress int not null auto_increment,
    Street varchar(100) not null, 
    Number varchar(10) not null, 
    CEP varchar(8) null,
    Complement varchar(20) null,
    District varchar(45) not null,
    City varchar(45) not null,
    State varchar(2) not null,
    idEmployee int not null,
    primary key(idAddress),
    foreign key(idEmployee) references Employee (idEmployee)
    
);

create table Relative (
	idRelative int not null auto_increment,
    Name varchar(100) not null,
    BirthDate date not null,
    LastName varchar(100) not null,
    idEmployee int not null,
    primary key(idRelative),
    foreign key(idEmployee) references Employee (idEmployee)
);

create table EmployeeProject (
	idEmployeeProject int not null auto_increment,
    idEmployee int not null,
    idProject int not null,
    primary key(idEmployeeProject),
    foreign key(idEmployee) references Employee (idEmployee),
    foreign key(idProject) references Project (idProject)
    
);

insert into Role (idRole, Name, Description, Supervisor) values (1, "Data Analyst", "Produces analysis of company data", 0);
insert into Role (idRole, Name, Description, Supervisor) values (2, "Data Scientist", "Create analyzes using mathematical models", 0);
insert into Role (idRole, Name, Description, Supervisor) values (3, "Data Engineer", "Develop company database", 0);
insert into Role (idRole, Name, Description, Supervisor) values (4, "Data Manager", "Manage the data team", 1);
insert into Role (idRole, Name, Description, Supervisor) values (5, "HR Analyst", "Work to hire new employes", 0);
insert into Role (idRole, Name, Description, Supervisor) values (6, "Accounting Analyst", "Take care of the accounting part of the company", 0);
insert into Role (idRole, Name, Description, Supervisor) values (7, "HR Manager", "Manage HR", 1);
insert into Role (idRole, Name, Description, Supervisor) values (8, "Marketing Analyst 1", "Works in the sales team", 0);
insert into Role (idRole, Name, Description, Supervisor) values (9, "Marketing Analyst 2", "Take care of the company's image", 0);
insert into Role (idRole, Name, Description, Supervisor) values (10, "Marketing Manager", "Manage the Marketing team", 1);
insert into Role (idRole, Name, Description, Supervisor) values (11, "Software engineer 1", "Develop company systems", 0);
insert into Role (idRole, Name, Description, Supervisor) values (12, "Software engineer 2", "Develop company systems", 0);
insert into Role (idRole, Name, Description, Supervisor) values (13, "Software engineer 3", "Develop company systems", 0);
insert into Role (idRole, Name, Description, Supervisor) values (14, "Software engineer 4", "Develop company systems", 0);
insert into Role (idRole, Name, Description, Supervisor) values (15, "IT Manager", "Manage the IT team", 1);

insert into Departament (idDepartament, Name, PhoneNumber, Budget) values (1, "Data", "4100000001", 1000.00);
insert into Departament (idDepartament, Name, PhoneNumber, Budget) values (2, "HR", "4100000002", 2000.00);
insert into Departament (idDepartament, Name, PhoneNumber, Budget) values (3, "Marketing", "4100000003", 3000.00);
insert into Departament (idDepartament, Name, PhoneNumber, Budget) values (4, "IT", "4100000004", 4000.00);

insert into Project (idProject, Name, StartDate, idDepartament) values (1, "Project Lana", 01/03/2020, 1);
insert into Project (idProject, Name, StartDate, idDepartament) values (2, "Project Katia", 02/03/2020, 2);
insert into Project (idProject, Name, StartDate, idDepartament) values (3, "Project Linear", 03/03/2020, 3);
insert into Project (idProject, Name, StartDate, idDepartament) values (4, "Project Simple", 04/03/2020, 4);
insert into Project (idProject, Name, StartDate, idDepartament) values (5, "Project Complex", 05/03/2020, 1);
insert into Project (idProject, Name, StartDate, idDepartament) values (6, "Project Doctor", 06/03/2020, 2);
insert into Project (idProject, Name, StartDate, idDepartament) values (7, "Project You", 07/03/2020, 3);
insert into Project (idProject, Name, StartDate, idDepartament) values (8, "Project Sales", 08/03/2020, 4);
insert into Project (idProject, Name, StartDate, idDepartament) values (9, "Project Maria", 09/03/2020, 1);
insert into Project (idProject, Name, StartDate, idDepartament) values (10, "Project Dave", 10/03/2020, 2);
insert into Project (idProject, Name, StartDate, idDepartament) values (11, "Project Life", 11/03/2020, 3);
insert into Project (idProject, Name, StartDate, idDepartament) values (12, "Project All", 12/03/2020, 4);
insert into Project (idProject, Name, StartDate, idDepartament) values (13, "Project Everything", 13/03/2020, 1);
insert into Project (idProject, Name, StartDate, idDepartament) values (14, "Project World", 14/03/2020, 2);
insert into Project (idProject, Name, StartDate, idDepartament) values (15, "Project Life", 15/03/2020, 3);



insert into Stage (idStage, Name, StartDate, IdProject) values (1, "Stage 1", 01/03/2020, 1);
insert into Stage (idStage, Name, StartDate, IdProject) values (2, "Stage 2", 02/03/2020, 2);
insert into Stage (idStage, Name, StartDate, IdProject) values (3, "Stage 3", 03/03/2020, 3);
insert into Stage (idStage, Name, StartDate, IdProject) values (4, "Stage 4", 04/03/2020, 4);
insert into Stage (idStage, Name, StartDate, IdProject) values (5, "Stage 5", 06/03/2020, 5);
insert into Stage (idStage, Name, StartDate, IdProject) values (6, "Stage 6", 06/03/2020, 6);
insert into Stage (idStage, Name, StartDate, IdProject) values (7, "Stage 7", 07/03/2020, 7);
insert into Stage (idStage, Name, StartDate, IdProject) values (8, "Stage 8", 08/03/2020, 8);
insert into Stage (idStage, Name, StartDate, IdProject) values (9, "Stage 9", 09/03/2020, 9);
insert into Stage (idStage, Name, StartDate, IdProject) values (10, "Stage 10", 10/03/2020, 10);
insert into Stage (idStage, Name, StartDate, IdProject) values (11, "Stage 11", 11/03/2020, 11);
insert into Stage (idStage, Name, StartDate, IdProject) values (12, "Stage 12", 12/03/2020, 12);
insert into Stage (idStage, Name, StartDate, IdProject) values (13, "Stage 13", 13/03/2020, 13);
insert into Stage (idStage, Name, StartDate, IdProject) values (14, "Stage 12", 14/03/2020, 14);
insert into Stage (idStage, Name, StartDate, IdProject) values (15, "Stage 14", 15/03/2020, 15);

insert into Meeting (idMeeting, Ata, DataMeeting, idStage) values (1, "This meeting was held to define some stages, Stages x, y, z", 01/03/2020, 1);
insert into Meeting (idMeeting, Ata, DataMeeting, idStage) values (2, "This meeting was held to define some stages, Stages x, y, z", 02/03/2020, 2);
insert into Meeting (idMeeting, Ata, DataMeeting, idStage) values (3, "This meeting was held to define some stages, Stages x, y, z", 03/03/2020, 3);
insert into Meeting (idMeeting, Ata, DataMeeting, idStage) values (4, "This meeting was held to define some stages, Stages x, y, z", 04/03/2020, 4);
insert into Meeting (idMeeting, Ata, DataMeeting, idStage) values (5, "This meeting was held to define some stages, Stages x, y, z", 05/03/2020, 5);
insert into Meeting (idMeeting, Ata, DataMeeting, idStage) values (6, "This meeting was held to define some stages, Stages x, y, z", 06/03/2020, 6);
insert into Meeting (idMeeting, Ata, DataMeeting, idStage) values (7, "This meeting was held to define some stages, Stages x, y, z", 07/03/2020, 7);
insert into Meeting (idMeeting, Ata, DataMeeting, idStage) values (8, "This meeting was held to define some stages, Stages x, y, z", 08/03/2020, 8);
insert into Meeting (idMeeting, Ata, DataMeeting, idStage) values (9, "This meeting was held to define some stages, Stages x, y, z", 09/03/2020, 9);
insert into Meeting (idMeeting, Ata, DataMeeting, idStage) values (10, "This meeting was held to define some stages, Stages x, y, z", 10/03/2020, 10);
insert into Meeting (idMeeting, Ata, DataMeeting, idStage) values (11, "This meeting was held to define some stages, Stages x, y, z", 11/03/2020, 11);
insert into Meeting (idMeeting, Ata, DataMeeting, idStage) values (12, "This meeting was held to define some stages, Stages x, y, z", 12/03/2020, 12);
insert into Meeting (idMeeting, Ata, DataMeeting, idStage) values (13, "This meeting was held to define some stages, Stages x, y, z", 13/03/2020, 13);
insert into Meeting (idMeeting, Ata, DataMeeting, idStage) values (14, "This meeting was held to define some stages, Stages x, y, z", 14/03/2020, 14);
insert into Meeting (idMeeting, Ata, DataMeeting, idStage) values (15, "This meeting was held to define some stages, Stages x, y, z", 15/03/2020, 15);

insert into Employee (idEmployee, Name, LastName, BirthDate, Salary, Rg, Cpf, Gender, idDepartament, idRole) values (1, "Larissa", "Montenegro", 19/10/1990, 2456.00, "190092325", "02499944995", 1, 1, 1);
insert into Employee (idEmployee, Name, LastName, BirthDate, Salary, Rg, Cpf, Gender, idDepartament, idRole) values (2, "Angela", "Arantes", 20/10/1990, 5000.00, "190092326", "02499944996", 1, 1, 2);
insert into Employee (idEmployee, Name, LastName, BirthDate, Salary, Rg, Cpf, Gender, idDepartament, idRole) values (3, "Carla", "Leticia", 21/10/1990, 1900.00, "190092327", "02499944997", 1, 1, 3);
insert into Employee (idEmployee, Name, LastName, BirthDate, Salary, Rg, Cpf, Gender, idDepartament, idRole) values (4, "Lucas", "Lima", 22/10/1990, 1900.00, "190092328", "02499944998", 0, 1, 4);
insert into Employee (idEmployee, Name, LastName, BirthDate, Salary, Rg, Cpf, Gender, idDepartament, idRole) values (5, "Amanda", "Katia", 23/10/1990, 3000.00, "190092329", "02499944999", 1, 2, 5);
insert into Employee (idEmployee, Name, LastName, BirthDate, Salary, Rg, Cpf, Gender, idDepartament, idRole) values (6, "Jenifer", "Rocha", 24/10/1990, 1900.00, "190092330", "02499944920", 1, 2, 6);
insert into Employee (idEmployee, Name, LastName, BirthDate, Salary, Rg, Cpf, Gender, idDepartament, idRole) values (7, "Antunes", "Carlos", 25/10/1990, 1000.00, "190092331", "02499944921", 0, 2, 7);
insert into Employee (idEmployee, Name, LastName, BirthDate, Salary, Rg, Cpf, Gender, idDepartament, idRole) values (8, "Fernando", "Cassio", 26/10/1990, 1900.00, "190092332", "02499944929", 0, 3, 8);
insert into Employee (idEmployee, Name, LastName, BirthDate, Salary, Rg, Cpf, Gender, idDepartament, idRole) values (9, "Angelo", "Santos", 27/10/1990, 1900.00, "190092333", "02499944930", 0, 3, 9);
insert into Employee (idEmployee, Name, LastName, BirthDate, Salary, Rg, Cpf, Gender, idDepartament, idRole) values (10, "Mariana", "Silva", 28/10/1990, 6000.00, "190092334", "02499944931", 1, 3, 10);
insert into Employee (idEmployee, Name, LastName, BirthDate, Salary, Rg, Cpf, Gender, idDepartament, idRole) values (11, "Patrick", "Antoni", 29/10/1990, 3800.00, "190092335", "02499944932", 0, 4, 11);
insert into Employee (idEmployee, Name, LastName, BirthDate, Salary, Rg, Cpf, Gender, idDepartament, idRole) values (12, "Vanessa", "Cassia", 01/10/1990, 1900.00, "190092336", "02499944933", 1, 4, 12);
insert into Employee (idEmployee, Name, LastName, BirthDate, Salary, Rg, Cpf, Gender, idDepartament, idRole) values (13, "Karla", "Jucassia", 02/10/1990, 2500.00, "190092337", "02499944934", 1, 4, 13);
insert into Employee (idEmployee, Name, LastName, BirthDate, Salary, Rg, Cpf, Gender, idDepartament, idRole) values (14, "Valeria", "Mendes", 03/10/1990, 1900.00, "190092338", "02499944945", 1, 4, 14);
insert into Employee (idEmployee, Name, LastName, BirthDate, Salary, Rg, Cpf, Gender, idDepartament, idRole) values (15, "Isaac", "Newton", 09/10/1900, 15000.00, "190092338", "02499944945", 0, 4, 15);


insert into Address (idAddress, Street, Number, CEP, District, City, State, idEmployee) values (1, "Rua Amelia", "401", "80430080", "Centro", "Belo Horizonte", "MG", 1);
insert into Address (idAddress, Street, Number, CEP, District, City, State, idEmployee) values (2, "Rua Amelia", "402", "80430080", "Centro", "Belo Horizonte", "MG", 2);
insert into Address (idAddress, Street, Number, CEP, District, City, State, idEmployee) values (3, "Rua Amelia", "403", "80430080", "Centro", "Belo Horizonte", "MG", 3);
insert into Address (idAddress, Street, Number, CEP, District, City, State, idEmployee) values (4, "Rua Amelia", "404", "80430080", "Centro", "Belo Horizonte", "MG", 4);
insert into Address (idAddress, Street, Number, CEP, District, City, State, idEmployee) values (5, "Rua Amelia", "405", "80430080", "Centro", "Belo Horizonte", "MG", 5);
insert into Address (idAddress, Street, Number, CEP, District, City, State, idEmployee) values (6, "Rua Amelia", "406", "80430080", "Centro", "Belo Horizonte", "MG", 6);
insert into Address (idAddress, Street, Number, CEP, District, City, State, idEmployee) values (7, "Rua Amelia", "415", "80430080", "Centro", "Belo Horizonte", "MG", 7);
insert into Address (idAddress, Street, Number, CEP, District, City, State, idEmployee) values (8, "Rua Amelia", "407", "80430080", "Centro", "Belo Horizonte", "MG", 8);
insert into Address (idAddress, Street, Number, CEP, District, City, State, idEmployee) values (9, "Rua Amelia", "408", "80430080", "Centro", "Belo Horizonte", "MG", 9);
insert into Address (idAddress, Street, Number, CEP, District, City, State, idEmployee) values (10, "Rua Amelia", "409", "80430080", "Centro", "Belo Horizonte", "MG", 10);
insert into Address (idAddress, Street, Number, CEP, District, City, State, idEmployee) values (11, "Rua Amelia", "410", "80430080", "Centro", "Belo Horizonte", "MG", 11);
insert into Address (idAddress, Street, Number, CEP, District, City, State, idEmployee) values (12, "Rua Amelia", "411", "80430080", "Centro", "Belo Horizonte", "MG", 12);
insert into Address (idAddress, Street, Number, CEP, District, City, State, idEmployee) values (13, "Rua Amelia", "412", "80430080", "Centro", "Belo Horizonte", "MG", 13);
insert into Address (idAddress, Street, Number, CEP, District, City, State, idEmployee) values (14, "Rua Amelia", "413", "80430080", "Centro", "Belo Horizonte", "MG", 14);
insert into Address (idAddress, Street, Number, CEP, District, City, State, idEmployee) values (15, "Rua Amelia", "414", "80430080", "Centro", "Belo Horizonte", "MG", 15);


insert into Relative (idRelative, Name, BirthDate, LastName, idEmployee) values (1, "Bianca", 14/10/2005, "Montenegro", 1);
insert into Relative (idRelative, Name, BirthDate, LastName, idEmployee) values (2, "Cassia", 15/10/2005, "Arantes", 2);
insert into Relative (idRelative, Name, BirthDate, LastName, idEmployee) values (3, "Larissa", 16/10/2005, "Leticia", 3);
insert into Relative (idRelative, Name, BirthDate, LastName, idEmployee) values (4, "Lucas", 17/10/2005, "Lima", 4);
insert into Relative (idRelative, Name, BirthDate, LastName, idEmployee) values (5, "Murilo", 18/10/2005, "Katia", 5);
insert into Relative (idRelative, Name, BirthDate, LastName, idEmployee) values (6, "Angela", 19/10/2005, "Rocha", 6);
insert into Relative (idRelative, Name, BirthDate, LastName, idEmployee) values (7, "Leonardo", 20/10/2005, "Carlos", 7);
insert into Relative (idRelative, Name, BirthDate, LastName, idEmployee) values (8, "Kassia", 21/10/2005, "Cassio", 8);
insert into Relative (idRelative, Name, BirthDate, LastName, idEmployee) values (9, "Alana", 22/10/2005, "Santos", 9);
insert into Relative (idRelative, Name, BirthDate, LastName, idEmployee) values (10, "Jenifer", 22/10/2005, "Silva", 10);
insert into Relative (idRelative, Name, BirthDate, LastName, idEmployee) values (11, "Mateus", 23/10/2005, "Antoni", 11);
insert into Relative (idRelative, Name, BirthDate, LastName, idEmployee) values (12, "Danilo", 24/10/2005, "Cassia", 12);
insert into Relative (idRelative, Name, BirthDate, LastName, idEmployee) values (13, "Ana", 25/10/2005, "Jucassia", 13);
insert into Relative (idRelative, Name, BirthDate, LastName, idEmployee) values (14, "Maria", 26/10/2005, "Mendes", 14);
insert into Relative (idRelative, Name, BirthDate, LastName, idEmployee) values (15, "Luiza", 27/10/2005, "Newton", 15);

insert into EmployeeProject (idEmployeeProject, idEmployee, idProject) values (1, 1, 1);
insert into EmployeeProject (idEmployeeProject, idEmployee, idProject) values (2, 2, 1);
insert into EmployeeProject (idEmployeeProject, idEmployee, idProject) values (3, 3, 1);
insert into EmployeeProject (idEmployeeProject, idEmployee, idProject) values (4, 4, 2);
insert into EmployeeProject (idEmployeeProject, idEmployee, idProject) values (5, 5, 2);
insert into EmployeeProject (idEmployeeProject, idEmployee, idProject) values (6, 1, 2);
insert into EmployeeProject (idEmployeeProject, idEmployee, idProject) values (7, 7, 3);
insert into EmployeeProject (idEmployeeProject, idEmployee, idProject) values (8, 8, 3);
insert into EmployeeProject (idEmployeeProject, idEmployee, idProject) values (9, 2, 4);
insert into EmployeeProject (idEmployeeProject, idEmployee, idProject) values (10, 2, 4);
insert into EmployeeProject (idEmployeeProject, idEmployee, idProject) values (11, 11, 5);
insert into EmployeeProject (idEmployeeProject, idEmployee, idProject) values (12, 8, 6);
insert into EmployeeProject (idEmployeeProject, idEmployee, idProject) values (13, 1, 7);
insert into EmployeeProject (idEmployeeProject, idEmployee, idProject) values (14, 1, 8);
insert into EmployeeProject (idEmployeeProject, idEmployee, idProject) values (15, 15, 9);


select *
  from Role;

select *
  from Project;

select *
  from Departament;

select *
  from Stage;

select *
  from Meeting;

select *
  from Employee;

select *
  from Address;

select *
  from Relative;

select *
  from EmployeeProject;


delete 
  from EmployeeProject;

delete 
  from Relative;
  
delete 
  from Address;

delete 
  from Employee;

delete 
  from Meeting;
  
delete 
  from Stage; 
 
delete 
  from Project;

delete 
  from Departament;

delete 
  from Role;


insert into Role (idRole, Name, Description, Supervisor) values (1, "Data Analyst", "Produces analysis of company data", 0);
insert into Role (idRole, Name, Description, Supervisor) values (2, "Data Scientist", "Create analyzes using mathematical models", 0);
insert into Role (idRole, Name, Description, Supervisor) values (3, "Data Engineer", "Develop company database", 0);
insert into Role (idRole, Name, Description, Supervisor) values (4, "Data Manager", "Manage the data team", 1);
insert into Role (idRole, Name, Description, Supervisor) values (5, "HR Analyst", "Work to hire new employes", 0);
insert into Role (idRole, Name, Description, Supervisor) values (6, "Accounting Analyst", "Take care of the accounting part of the company", 0);
insert into Role (idRole, Name, Description, Supervisor) values (7, "HR Manager", "Manage HR", 1);
insert into Role (idRole, Name, Description, Supervisor) values (8, "Marketing Analyst 1", "Works in the sales team", 0);
insert into Role (idRole, Name, Description, Supervisor) values (9, "Marketing Analyst 2", "Take care of the company's image", 0);
insert into Role (idRole, Name, Description, Supervisor) values (10, "Marketing Manager", "Manage the Marketing team", 1);
insert into Role (idRole, Name, Description, Supervisor) values (11, "Software engineer 1", "Develop company systems", 0);
insert into Role (idRole, Name, Description, Supervisor) values (12, "Software engineer 2", "Develop company systems", 0);
insert into Role (idRole, Name, Description, Supervisor) values (13, "Software engineer 3", "Develop company systems", 0);
insert into Role (idRole, Name, Description, Supervisor) values (14, "Software engineer 4", "Develop company systems", 0);
insert into Role (idRole, Name, Description, Supervisor) values (15, "Gerente de TI", "Gerencia o time de TI", 1);

insert into Departament (idDepartament, Name, PhoneNumber, Budget) values (1, "Dados", "4100000001", 1000.00);
insert into Departament (idDepartament, Name, PhoneNumber, Budget) values (2, "HR", "4100000002", 2000.00);
insert into Departament (idDepartament, Name, PhoneNumber, Budget) values (3, "Marketing", "4100000003", 3000.00);
insert into Departament (idDepartament, Name, PhoneNumber, Budget) values (4, "IT", "4100000004", 4000.00);

insert into Project (idProject, Name, StartDate, idDepartament) values (1, "Project Lana", 01/03/2020, 1);
insert into Project (idProject, Name, StartDate, idDepartament) values (2, "Project Katia", 02/03/2020, 2);
insert into Project (idProject, Name, StartDate, idDepartament) values (3, "Project Linear", 03/03/2020, 3);
insert into Project (idProject, Name, StartDate, idDepartament) values (4, "Project Simple", 04/03/2020, 4);
insert into Project (idProject, Name, StartDate, idDepartament) values (5, "Project Complex", 05/03/2020, 1);
insert into Project (idProject, Name, StartDate, idDepartament) values (6, "Project Doctor", 06/03/2020, 2);
insert into Project (idProject, Name, StartDate, idDepartament) values (7, "Project You", 07/03/2020, 3);
insert into Project (idProject, Name, StartDate, idDepartament) values (8, "Project Sales", 08/03/2020, 4);
insert into Project (idProject, Name, StartDate, idDepartament) values (9, "Project Maria", 09/03/2020, 1);
insert into Project (idProject, Name, StartDate, idDepartament) values (10, "Project Dave", 10/03/2020, 2);
insert into Project (idProject, Name, StartDate, idDepartament) values (11, "Project Life", 11/03/2020, 3);
insert into Project (idProject, Name, StartDate, idDepartament) values (12, "Project All", 12/03/2020, 4);
insert into Project (idProject, Name, StartDate, idDepartament) values (13, "Project Everything", 13/03/2020, 1);
insert into Project (idProject, Name, StartDate, idDepartament) values (14, "Project World", 14/03/2020, 2);
insert into Project (idProject, Name, StartDate, idDepartament) values (15, "Project Life", 15/03/2020, 3);



insert into Stage (idStage, Name, StartDate, IdProject) values (1, "Stage 1", 01/03/2020, 1);
insert into Stage (idStage, Name, StartDate, IdProject) values (2, "Stage 2", 02/03/2020, 2);
insert into Stage (idStage, Name, StartDate, IdProject) values (3, "Stage 3", 03/03/2020, 3);
insert into Stage (idStage, Name, StartDate, IdProject) values (4, "Stage 4", 04/03/2020, 4);
insert into Stage (idStage, Name, StartDate, IdProject) values (5, "Stage 5", 06/03/2020, 5);
insert into Stage (idStage, Name, StartDate, IdProject) values (6, "Stage 6", 06/03/2020, 6);
insert into Stage (idStage, Name, StartDate, IdProject) values (7, "Stage 7", 07/03/2020, 7);
insert into Stage (idStage, Name, StartDate, IdProject) values (8, "Stage 8", 08/03/2020, 8);
insert into Stage (idStage, Name, StartDate, IdProject) values (9, "Stage 9", 09/03/2020, 9);
insert into Stage (idStage, Name, StartDate, IdProject) values (10, "Stage 10", 10/03/2020, 10);
insert into Stage (idStage, Name, StartDate, IdProject) values (11, "Stage 11", 11/03/2020, 11);
insert into Stage (idStage, Name, StartDate, IdProject) values (12, "Stage 12", 12/03/2020, 12);
insert into Stage (idStage, Name, StartDate, IdProject) values (13, "Stage 13", 13/03/2020, 13);
insert into Stage (idStage, Name, StartDate, IdProject) values (14, "Stage 12", 14/03/2020, 14);
insert into Stage (idStage, Name, StartDate, IdProject) values (15, "Stage 14", 15/03/2020, 15);

insert into Meeting (idMeeting, Ata, DataMeeting, idStage) values (1, "This meeting was held to define some stages, Stages x, y, z", 01/03/2020, 1);
insert into Meeting (idMeeting, Ata, DataMeeting, idStage) values (2, "This meeting was held to define some stages, Stages x, y, z", 02/03/2020, 2);
insert into Meeting (idMeeting, Ata, DataMeeting, idStage) values (3, "This meeting was held to define some stages, Stages x, y, z", 03/03/2020, 3);
insert into Meeting (idMeeting, Ata, DataMeeting, idStage) values (4, "This meeting was held to define some stages, Stages x, y, z", 04/03/2020, 4);
insert into Meeting (idMeeting, Ata, DataMeeting, idStage) values (5, "This meeting was held to define some stages, Stages x, y, z", 05/03/2020, 5);
insert into Meeting (idMeeting, Ata, DataMeeting, idStage) values (6, "This meeting was held to define some stages, Stages x, y, z", 06/03/2020, 6);
insert into Meeting (idMeeting, Ata, DataMeeting, idStage) values (7, "This meeting was held to define some stages, Stages x, y, z", 07/03/2020, 7);
insert into Meeting (idMeeting, Ata, DataMeeting, idStage) values (8, "This meeting was held to define some stages, Stages x, y, z", 08/03/2020, 8);
insert into Meeting (idMeeting, Ata, DataMeeting, idStage) values (9, "This meeting was held to define some stages, Stages x, y, z", 09/03/2020, 9);
insert into Meeting (idMeeting, Ata, DataMeeting, idStage) values (10, "This meeting was held to define some stages, Stages x, y, z", 10/03/2020, 10);
insert into Meeting (idMeeting, Ata, DataMeeting, idStage) values (11, "This meeting was held to define some stages, Stages x, y, z", 11/03/2020, 11);
insert into Meeting (idMeeting, Ata, DataMeeting, idStage) values (12, "This meeting was held to define some stages, Stages x, y, z", 12/03/2020, 12);
insert into Meeting (idMeeting, Ata, DataMeeting, idStage) values (13, "This meeting was held to define some stages, Stages x, y, z", 13/03/2020, 13);
insert into Meeting (idMeeting, Ata, DataMeeting, idStage) values (14, "This meeting was held to define some stages, Stages x, y, z", 14/03/2020, 14);
insert into Meeting (idMeeting, Ata, DataMeeting, idStage) values (15, "This meeting was held to define some stages, Stages x, y, z", 15/03/2020, 15);

insert into Employee (idEmployee, Name, LastName, BirthDate, Salary, Rg, Cpf, Gender, idDepartament, idRole) values (1, "Larissa", "Montenegro", 19/10/1990, 2456.00, "190092325", "02499944995", 1, 1, 1);
insert into Employee (idEmployee, Name, LastName, BirthDate, Salary, Rg, Cpf, Gender, idDepartament, idRole) values (2, "Angela", "Arantes", 20/10/1990, 5000.00, "190092326", "02499944996", 1, 1, 2);
insert into Employee (idEmployee, Name, LastName, BirthDate, Salary, Rg, Cpf, Gender, idDepartament, idRole) values (3, "Carla", "Leticia", 21/10/1990, 1900.00, "190092327", "02499944997", 1, 1, 3);
insert into Employee (idEmployee, Name, LastName, BirthDate, Salary, Rg, Cpf, Gender, idDepartament, idRole) values (4, "Lucas", "Lima", 22/10/1990, 1900.00, "190092328", "02499944998", 0, 1, 4);
insert into Employee (idEmployee, Name, LastName, BirthDate, Salary, Rg, Cpf, Gender, idDepartament, idRole) values (5, "Amanda", "Katia", 23/10/1990, 3000.00, "190092329", "02499944999", 1, 2, 5);
insert into Employee (idEmployee, Name, LastName, BirthDate, Salary, Rg, Cpf, Gender, idDepartament, idRole) values (6, "Jenifer", "Rocha", 24/10/1990, 1900.00, "190092330", "02499944920", 1, 2, 6);
insert into Employee (idEmployee, Name, LastName, BirthDate, Salary, Rg, Cpf, Gender, idDepartament, idRole) values (7, "Antunes", "Carlos", 25/10/1990, 1000.00, "190092331", "02499944921", 0, 2, 7);
insert into Employee (idEmployee, Name, LastName, BirthDate, Salary, Rg, Cpf, Gender, idDepartament, idRole) values (8, "Fernando", "Cassio", 26/10/1990, 1900.00, "190092332", "02499944929", 0, 3, 8);
insert into Employee (idEmployee, Name, LastName, BirthDate, Salary, Rg, Cpf, Gender, idDepartament, idRole) values (9, "Angelo", "Santos", 27/10/1990, 1900.00, "190092333", "02499944930", 0, 3, 9);
insert into Employee (idEmployee, Name, LastName, BirthDate, Salary, Rg, Cpf, Gender, idDepartament, idRole) values (10, "Mariana", "Silva", 28/10/1990, 6000.00, "190092334", "02499944931", 1, 3, 10);
insert into Employee (idEmployee, Name, LastName, BirthDate, Salary, Rg, Cpf, Gender, idDepartament, idRole) values (11, "Patrick", "Antoni", 29/10/1990, 3800.00, "190092335", "02499944932", 0, 4, 11);
insert into Employee (idEmployee, Name, LastName, BirthDate, Salary, Rg, Cpf, Gender, idDepartament, idRole) values (12, "Vanessa", "Cassia", 01/10/1990, 1900.00, "190092336", "02499944933", 1, 4, 12);
insert into Employee (idEmployee, Name, LastName, BirthDate, Salary, Rg, Cpf, Gender, idDepartament, idRole) values (13, "Karla", "Jucassia", 02/10/1990, 2500.00, "190092337", "02499944934", 1, 4, 13);
insert into Employee (idEmployee, Name, LastName, BirthDate, Salary, Rg, Cpf, Gender, idDepartament, idRole) values (14, "Valeria", "Mendes", 03/10/1990, 1900.00, "190092338", "02499944945", 1, 4, 14);
insert into Employee (idEmployee, Name, LastName, BirthDate, Salary, Rg, Cpf, Gender, idDepartament, idRole) values (15, "Isaac", "Newton", 09/10/1900, 15000.00, "190092338", "02499944945", 0, 4, 15);


insert into Address (idAddress, Street, Number, CEP, District, City, State, idEmployee) values (1, "Rua Amelia", "401", "80430080", "Centro", "Belo Horizonte", "MG", 1);
insert into Address (idAddress, Street, Number, CEP, District, City, State, idEmployee) values (2, "Rua Amelia", "402", "80430080", "Centro", "Belo Horizonte", "MG", 2);
insert into Address (idAddress, Street, Number, CEP, District, City, State, idEmployee) values (3, "Rua Amelia", "403", "80430080", "Centro", "Belo Horizonte", "MG", 3);
insert into Address (idAddress, Street, Number, CEP, District, City, State, idEmployee) values (4, "Rua Amelia", "404", "80430080", "Centro", "Belo Horizonte", "MG", 4);
insert into Address (idAddress, Street, Number, CEP, District, City, State, idEmployee) values (5, "Rua Amelia", "405", "80430080", "Centro", "Belo Horizonte", "MG", 5);
insert into Address (idAddress, Street, Number, CEP, District, City, State, idEmployee) values (6, "Rua Amelia", "406", "80430080", "Centro", "Belo Horizonte", "MG", 6);
insert into Address (idAddress, Street, Number, CEP, District, City, State, idEmployee) values (7, "Rua Amelia", "415", "80430080", "Centro", "Belo Horizonte", "MG", 7);
insert into Address (idAddress, Street, Number, CEP, District, City, State, idEmployee) values (8, "Rua Amelia", "407", "80430080", "Centro", "Belo Horizonte", "MG", 8);
insert into Address (idAddress, Street, Number, CEP, District, City, State, idEmployee) values (9, "Rua Amelia", "408", "80430080", "Centro", "Belo Horizonte", "MG", 9);
insert into Address (idAddress, Street, Number, CEP, District, City, State, idEmployee) values (10, "Rua Amelia", "409", "80430080", "Centro", "Belo Horizonte", "MG", 10);
insert into Address (idAddress, Street, Number, CEP, District, City, State, idEmployee) values (11, "Rua Amelia", "410", "80430080", "Centro", "Belo Horizonte", "MG", 11);
insert into Address (idAddress, Street, Number, CEP, District, City, State, idEmployee) values (12, "Rua Amelia", "411", "80430080", "Centro", "Belo Horizonte", "MG", 12);
insert into Address (idAddress, Street, Number, CEP, District, City, State, idEmployee) values (13, "Rua Amelia", "412", "80430080", "Centro", "Belo Horizonte", "MG", 13);
insert into Address (idAddress, Street, Number, CEP, District, City, State, idEmployee) values (14, "Rua Amelia", "413", "80430080", "Centro", "Belo Horizonte", "MG", 14);
insert into Address (idAddress, Street, Number, CEP, District, City, State, idEmployee) values (15, "Rua Amelia", "414", "80430080", "Centro", "Belo Horizonte", "MG", 15);


insert into Relative (idRelative, Name, BirthDate, LastName, idEmployee) values (1, "Bianca", 14/10/2005, "Montenegro", 1);
insert into Relative (idRelative, Name, BirthDate, LastName, idEmployee) values (2, "Cassia", 15/10/2005, "Arantes", 2);
insert into Relative (idRelative, Name, BirthDate, LastName, idEmployee) values (3, "Larissa", 16/10/2005, "Leticia", 3);
insert into Relative (idRelative, Name, BirthDate, LastName, idEmployee) values (4, "Lucas", 17/10/2005, "Lima", 4);
insert into Relative (idRelative, Name, BirthDate, LastName, idEmployee) values (5, "Murilo", 18/10/2005, "Katia", 5);
insert into Relative (idRelative, Name, BirthDate, LastName, idEmployee) values (6, "Angela", 19/10/2005, "Rocha", 6);
insert into Relative (idRelative, Name, BirthDate, LastName, idEmployee) values (7, "Leonardo", 20/10/2005, "Carlos", 7);
insert into Relative (idRelative, Name, BirthDate, LastName, idEmployee) values (8, "Kassia", 21/10/2005, "Cassio", 8);
insert into Relative (idRelative, Name, BirthDate, LastName, idEmployee) values (9, "Alana", 22/10/2005, "Santos", 9);
insert into Relative (idRelative, Name, BirthDate, LastName, idEmployee) values (10, "Jenifer", 22/10/2005, "Silva", 10);
insert into Relative (idRelative, Name, BirthDate, LastName, idEmployee) values (11, "Mateus", 23/10/2005, "Antoni", 11);
insert into Relative (idRelative, Name, BirthDate, LastName, idEmployee) values (12, "Danilo", 24/10/2005, "Cassia", 12);
insert into Relative (idRelative, Name, BirthDate, LastName, idEmployee) values (13, "Ana", 25/10/2005, "Jucassia", 13);
insert into Relative (idRelative, Name, BirthDate, LastName, idEmployee) values (14, "Maria", 26/10/2005, "Mendes", 14);
insert into Relative (idRelative, Name, BirthDate, LastName, idEmployee) values (15, "Luiza", 27/10/2005, "Newton", 15);

insert into EmployeeProject (idEmployeeProject, idEmployee, idProject) values (1, 1, 1);
insert into EmployeeProject (idEmployeeProject, idEmployee, idProject) values (2, 2, 1);
insert into EmployeeProject (idEmployeeProject, idEmployee, idProject) values (3, 3, 1);
insert into EmployeeProject (idEmployeeProject, idEmployee, idProject) values (4, 4, 2);
insert into EmployeeProject (idEmployeeProject, idEmployee, idProject) values (5, 5, 2);
insert into EmployeeProject (idEmployeeProject, idEmployee, idProject) values (6, 1, 2);
insert into EmployeeProject (idEmployeeProject, idEmployee, idProject) values (7, 7, 3);
insert into EmployeeProject (idEmployeeProject, idEmployee, idProject) values (8, 8, 3);
insert into EmployeeProject (idEmployeeProject, idEmployee, idProject) values (9, 2, 4);
insert into EmployeeProject (idEmployeeProject, idEmployee, idProject) values (10, 2, 4);
insert into EmployeeProject (idEmployeeProject, idEmployee, idProject) values (11, 11, 5);
insert into EmployeeProject (idEmployeeProject, idEmployee, idProject) values (12, 8, 6);
insert into EmployeeProject (idEmployeeProject, idEmployee, idProject) values (13, 1, 7);
insert into EmployeeProject (idEmployeeProject, idEmployee, idProject) values (14, 1, 8);
insert into EmployeeProject (idEmployeeProject, idEmployee, idProject) values (15, 15, 9);
