CREATE DATABASE ecommerce -- CREAMOS LA BASE DE DATOS "ECOMMERCE"
GO

USE ecommerce -- LE DECIMOS AL SQL QUE QUEREMOS USAR LA BASE DE DATOS "ECOMMERCE" PARA PODER AHÍ CREAR LAS TABLAS
GO

CREATE TABLE administrador ( -- CREAMOS LA TABLA "ADMINISTRADOR"
  id_administrador INT PRIMARY KEY IDENTITY(1,1),
  nombre_administrado VARCHAR(25),
  app_administrador VARCHAR(30),
  apm_administrado VARCHAR(30),
  correo_electronico VARCHAR(50),
  contrasena VARCHAR(20),
  fecha_creacion DATE
)
GO

CREATE TABLE vendedor ( -- CREAMOS LA TABLA "VENDEDOR"
  id_vendedor INT PRIMARY KEY IDENTITY(1,1),
  nombre_vendedor VARCHAR(25),
  app_vendedor VARCHAR(30),
  apm_vendedor VARCHAR(30),
  correo_electronico VARCHAR(50),
  contrasena VARCHAR(20),
  telefono INT,
  fecha_creacion DATE,
  id_estatus INT
)
GO

CREATE TABLE producto ( -- CREAMOS LA TABLA "PRODUCTO"
  id_producto INT PRIMARY KEY,
  nombre_producto VARCHAR(25),
  id_marca INT,
  modelo VARCHAR(25),
  stock INT,
  precio_provedor INT,
  precio_publico INT,
  descripcion VARCHAR(255),
  id_vendedor INT,
  fecha_creacion DATE,
  id_estatus INT
)
GO

CREATE TABLE estatus ( -- CREAMOS LA TABLA "ESTATUS"
  id_estatus INT PRIMARY KEY,
  nombre_estatus VARCHAR(25)
)
GO

CREATE TABLE marca ( -- CREAMOS LA TABLA "MARCA"
  id_marca INT PRIMARY KEY,
  nombre_marca VARCHAR(25),
  fecha_creacion DATE
)
GO

CREATE TABLE cliente ( -- CREAMOS LA TABLA "CLIENTE"
  id_cliente INT PRIMARY KEY IDENTITY(1,1),
  nombre_cliente VARCHAR(25),
  app_cliente VARCHAR(30),
  apm_cliente VARCHAR(30),
  correo_electronico VARCHAR(50),
  contrasena VARCHAR(20),
  telefono INT,
  fecha_creacion DATE,
  id_estatus INT
)
GO

CREATE TABLE ubicacion ( -- CREAMOS LA TABLA "UBICACIÓN"
  id_ubicacion INT PRIMARY KEY IDENTITY(1,1),
  nombre_contacto VARCHAR(25),
  numero_contacto INT,
  region VARCHAR(20),
  manzana VARCHAR(255),
  numero_INTerior INT,
  numero_exterior INT,
  codigo_postal INT,
  calles VARCHAR(255),
  referencia VARCHAR(255),
  id_cliente INT
)
GO

CREATE TABLE ventas ( -- CREAMOS LA TABLA "VENTAS"
  id_venta INT PRIMARY KEY IDENTITY(1,1),
  id_vendedor INT,
  id_cliente INT,
  id_producto INT,
  cantidad_producto INT,
  fecha_venta DATE
)
GO

CREATE TABLE ubicacion_cliente ( -- CREAMOS LA TABLA "UBICACIÓN-CLIENTE" POR BUENA PRACTICA, POR EL TEMA DE LAS LLAVES FORANEAS, NO DEBERIA HABER TABLAS QUE SEAN DE MUCHOS A MUCHOS.
  ubicacion_id_cliente INT,
  cliente_id_cliente INT,
  PRIMARY KEY (ubicacion_id_cliente, cliente_id_cliente)
)
GO

-- AQUÍ ABAJO ALTERAMOS / MODIFICAMOS CADA UNAS DE LAS TABLAS QUE FUERON REQUERIDAS PARA TENER LLAVES FORANEAS.

ALTER TABLE vendedor ADD FOREIGN KEY (id_estatus) REFERENCES estatus (id_estatus)
GO

ALTER TABLE producto ADD FOREIGN KEY (id_marca) REFERENCES marca (id_marca)
GO

ALTER TABLE producto ADD FOREIGN KEY (id_vendedor) REFERENCES vendedor (id_vendedor)
GO

ALTER TABLE producto ADD FOREIGN KEY (id_estatus) REFERENCES estatus (id_estatus)
GO

ALTER TABLE cliente ADD FOREIGN KEY (id_estatus) REFERENCES estatus (id_estatus)
GO

ALTER TABLE ventas ADD FOREIGN KEY (id_vendedor) REFERENCES vendedor (id_vendedor)
GO

ALTER TABLE ventas ADD FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
GO

ALTER TABLE ventas ADD FOREIGN KEY (id_producto) REFERENCES producto (id_producto)
GO

-- AQUÍ ABAJO CREAMOS LOS QRYS "SELECT * FROM (NOMBRE DE LA TABLA) PARA PODER CORROBORRAR QUE LAS TABLAS FUERON CREADAS EXITOSAMENTE.

SELECT * FROM administrador
GO

SELECT * FROM vendedor
GO

SELECT * FROM producto
GO

SELECT * FROM estatus
GO 

SELECT * FROM marca
GO

SELECT * FROM cliente
GO

SELECT * FROM ubicacion
GO

SELECT * FROM ventas
GO

SELECT * FROM ubicacion_cliente
GO
