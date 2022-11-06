CREATE DATABASE STUDENT_MANAGEMENT;
use STUDENT_MANAGEMENT;
create table Filieres( 
    id int PRIMARY KEY IDENTITY(1,1),
    code varchar(10) UNIQUE,
    designation varchar(100)
);
create table Modules( 
    id int PRIMARY KEY IDENTITY(1,1),
    code varchar(10) UNIQUE,
    designation varchar(100),
    niveau VARCHAR(10),
    semestre VARCHAR(10),
    code_fil varchar(10) FOREIGN KEY REFERENCES filieres(code)
);
create table Matieres(
    id int PRIMARY KEY IDENTITY(1,1),
    code varchar(10) UNIQUE,
    designation VARCHAR(100),
    VH int,
    code_module varchar(10) FOREIGN KEY REFERENCES modules(code)
);
create table Eleves (
    id int PRIMARY KEY IDENTITY(1,1),
    code VARCHAR(10) UNIQUE,
    nom VARCHAR(50),
    prenom varchar(50),
    niveau varchar(10),
    code_fil varchar(10) FOREIGN KEY REFERENCES filieres(code),
);
create table Notes(
    id int PRIMARY KEY IDENTITY(1,1),
    code_eleve varchar(10) FOREIGN KEY REFERENCES eleves(code),
    code_mat varchar(10) FOREIGN KEY REFERENCES matieres(code),
    note decimal(9,2),
    CONSTRAINT ucNote UNIQUE NONCLUSTERED ( code_eleve, code_mat )

);
create table Moyennes(
    id int PRIMARY KEY IDENTITY(1,1),
    code_eleve varchar(10) FOREIGN KEY REFERENCES eleves(code),
    code_fil varchar(10) FOREIGN KEY REFERENCES filieres(code) ,
    niveau varchar(10),
    moyenne decimal(9,2),
    CONSTRAINT ucMoyenne UNIQUE NONCLUSTERED ( code_eleve, code_fil, niveau )
);