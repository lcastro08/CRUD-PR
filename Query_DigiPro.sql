
create database Alumnos_DiPro

use Alumnos_DiPro

create table dbo.Tbl_usuarios
(ID_usr int PRIMARY KEY NOT NULL,  
    Nombre varchar(35) NOT NULL,
	Apellido varchar(35) NOT NULL,
	Usr varchar(8),
	Pwd varchar(15),
	Bandera varchar(15))

	insert into Tbl_usuarios (ID_usr,Nombre,Apellido,Usr,Pwd,Bandera)
	values (1,'Luis','Castro','lcastro','AbC1','1')

	
create table dbo.Tbl_Alumnos
	(ID_alumno int IDENTITY(1,1) PRIMARY KEY NOT NULL,  
    Nombre varchar(45) NOT NULL,
	Apellidos varchar(45) NOT NULL,
	Edad int,
	Nivel varchar(25),
	Mail varchar(46),
	Stat varchar(40),
	Matricula varchar(25))