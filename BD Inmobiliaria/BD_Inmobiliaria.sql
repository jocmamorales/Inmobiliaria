
Create database Inmobiliaria

GO

USE Inmobiliaria;

GO

--Tipos de propiedades: Departamento, Oficina, Local,Cochera, Ph, Baulera
CREATE TABLE TiposDePropiedades (
   IdTipo int IDENTITY(1,1) PRIMARY KEY,
   Descripcion varchar(50) 
);
--Perfiles: 1-Interesado 2-Propietario. Estado 1- activo 2-inactivo 
CREATE TABLE Perfiles (
   IdPerfil int PRIMARY KEY,
   Descripcion varchar(50),
   Estado bit 
   
);
CREATE TABLE Empleados (
   IdLegajo int IDENTITY(1,1) PRIMARY KEY,
   Apellido varchar(50),
   Nombre varchar(50),
   Email varchar(50),
   Telefono varchar(50),
   FechaIngreso DATE NOT NULL   
);

--Contactos: Interesados o Propietarios
CREATE TABLE Contactos (
   IdContacto int IDENTITY(1,1) PRIMARY KEY,
   Apellido varchar(50),
   Nombre varchar(50),
   Email varchar(50),
   Telefono varchar(50),
   FechaIngreso DATE NOT NULL,
   IdPerfil int foreign key REFERENCES Perfiles(IdPerfil)
);


CREATE TABLE Paises (
   IdPais int IDENTITY(1,1) PRIMARY KEY,
   Nombre varchar(50)
);

CREATE TABLE Provincias (
   IdProvincia int PRIMARY KEY,
   Nombre varchar(50),
   IdPais int foreign key REFERENCES Paises(IdPais)
);

--IdLocalidad es el codigo postal
CREATE TABLE Localidades (
   IdLocalidad int PRIMARY KEY,  
   Localidad  varchar(50),   
   IdProvincia int foreign key REFERENCES Provincias(IdProvincia)
);
---En un Domicilio puede haber mas de una propiedad Edificio por ejemplo VER ESO
CREATE TABLE Domicilios (
   IdDomicilio int IDENTITY(1,1) PRIMARY KEY,
   Direccion  varchar(50),
   Numero int,
   Piso char,
   Letra char,
   IdLocalidad int foreign key REFERENCES Localidades(IdLocalidad)
);
CREATE TABLE Propiedades (
   IdPropiedad int IDENTITY(1,1) PRIMARY KEY,
   IdDomicilio int foreign key REFERENCES Domicilios(IdDomicilio),  
   IdTipo int foreign key REFERENCES TiposDePropiedades (IdTipo),
   IdCreador int foreign key REFERENCES Empleados(IdLegajo),
   IdPropietario int foreign key REFERENCES Contactos(IdContacto),
   FechaCreacion date,
   Ambiente int,
   Dormitorio int,
   Banio int,
   Toilete int,
   Cochera int,
   Antiguedad int,
   Expensa money,
   Orientacion varchar(50),
   Disposicion varchar(50),
   Descripcion varchar(200),
   Estado bit,
   PrecioVenta money,
   PrecioAlquiler money
);


CREATE TABLE TiposDeEventos(
	IdTipo int not null Primary Key,
	Descripcion varchar (20)
);
--Estado: 1-Activo 2-Realizado 3-Eliminado
CREATE TABLE EVENTOS(	
	IdEvento INT NOT NULL PRIMARY KEY,
	Descripcion varchar (200),
	IdTipo int not null FOREIGN KEY REFERENCES TiposDeEventos(IdTipo),	
	FechaHora DATETIME NOT NULL,
	IdLegajo INT NOT NULL FOREIGN KEY REFERENCES Empleados (IdLegajo),
	IdContacto INT NOT NULL FOREIGN KEY REFERENCES Contactos (IdContacto),
	IdPropiedad int NOT NULL FOREIGN KEY REFERENCES Propiedades (IdPropiedad),
	Duracion INT NOT NULL CHECK (Duracion > 0), -- EN MINUTOS 
	Estado bit not null CHECK (Estado >0)
);
