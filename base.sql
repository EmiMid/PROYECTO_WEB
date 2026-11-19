DROP DATABASE IF EXISTS SistemaPedidos;
CREATE DATABASE SistemaPedidos CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE SistemaPedidos;

CREATE TABLE TipoUsuario (
    idTipo INT PRIMARY KEY AUTO_INCREMENT,
    Tipo VARCHAR(20) NOT NULL
);

CREATE TABLE Usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    idTipo INT DEFAULT 2,
    Nombre VARCHAR(50) NOT NULL,
    ApellidoP VARCHAR(30) DEFAULT '',
    ApellidoM VARCHAR(30) DEFAULT '',
    Correo VARCHAR(100) NOT NULL UNIQUE,
    Contrasena VARCHAR(255) NOT NULL,
    Telefono VARCHAR(15),
    Estado BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (idTipo) REFERENCES TipoUsuario(idTipo)
);

CREATE TABLE Direcciones (
    idDireccion INT PRIMARY KEY AUTO_INCREMENT,
    idUsuario INT NOT NULL,
    Calle VARCHAR(60),
    NumExt VARCHAR(15),
    NumInterior VARCHAR(15),
    Colonia VARCHAR(60),
    Municipio VARCHAR(60),
    Edificio VARCHAR(30),
    Avenida VARCHAR(60),
    CodigoPostal VARCHAR(10),
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);

CREATE TABLE Color (
    idColor INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(30),
    Codigo VARCHAR(7)
);

CREATE TABLE Tela (
    idTela INT PRIMARY KEY AUTO_INCREMENT,
    Tela VARCHAR(40)
);

CREATE TABLE Estilo (
    idEstilo INT PRIMARY KEY AUTO_INCREMENT,
    Estilo VARCHAR(40)
);

CREATE TABLE Cortes (
    idCorte INT PRIMARY KEY AUTO_INCREMENT,
    Corte VARCHAR(40)
);

CREATE TABLE Talla (
    idTalla INT PRIMARY KEY AUTO_INCREMENT,
    Talla VARCHAR(20)
);

CREATE TABLE Galeria (
    idGaleria INT PRIMARY KEY AUTO_INCREMENT,
    idUsuario INT,
    HistorialCambios TEXT,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);

CREATE TABLE Inventario (
    idInventario INT PRIMARY KEY AUTO_INCREMENT,
    FchActualizacion DATE,
    cantidadDisponible INT DEFAULT 0
);

CREATE TABLE ProductoCatalogo (
    idProductoC INT PRIMARY KEY AUTO_INCREMENT,
    idInventario INT,
    idColor INT,
    idTela INT,
    idTalla INT,
    idEstilo INT,
    idCorte INT,
    Nombre VARCHAR(100),
    TipoPrenda VARCHAR(30) DEFAULT 'playera',
    descripcion VARCHAR(255),
    CostoBase DECIMAL(10,2),
    FOREIGN KEY (idInventario) REFERENCES Inventario(idInventario),
    FOREIGN KEY (idColor) REFERENCES Color(idColor),
    FOREIGN KEY (idTela) REFERENCES Tela(idTela),
    FOREIGN KEY (idTalla) REFERENCES Talla(idTalla),
    FOREIGN KEY (idEstilo) REFERENCES Estilo(idEstilo),
    FOREIGN KEY (idCorte) REFERENCES Cortes(idCorte)
);

CREATE TABLE ProductoGaleria (
    idProductoG INT PRIMARY KEY AUTO_INCREMENT,
    idGaleria INT,
    idProducto INT,
    Titulo VARCHAR(80),
    Estampado LONGBLOB,
    TipoImagen VARCHAR(50),
    CostoAnadido DECIMAL(10,2),
    FOREIGN KEY (idGaleria) REFERENCES Galeria(idGaleria),
    FOREIGN KEY (idProducto) REFERENCES ProductoCatalogo(idProductoC)
);

CREATE TABLE ProductoPersonalizado (
    idProductoP INT PRIMARY KEY AUTO_INCREMENT,
    idGaleria INT,
    idProducto INT,
    idUsuario INT,
    Estampado LONGBLOB,
    NombreArchivo VARCHAR(150),
    TipoImagen VARCHAR(50),
    CostoAnadido DECIMAL(10,2),
    TextoPersonalizado VARCHAR(255),
    FOREIGN KEY (idGaleria) REFERENCES Galeria(idGaleria),
    FOREIGN KEY (idProducto) REFERENCES ProductoCatalogo(idProductoC),
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);

CREATE TABLE Pedidos (
    idPedido INT PRIMARY KEY AUTO_INCREMENT,
    Folio VARCHAR(20) UNIQUE,
    idUsuario INT,
    idDireccion INT,
    fchConfirmacion DATE,
    fchEntrega DATE,
    EstadoPedido VARCHAR(30) DEFAULT 'produccion',
    Total DECIMAL(10,2) DEFAULT 0.00,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
    FOREIGN KEY (idDireccion) REFERENCES Direcciones(idDireccion)
);

CREATE TABLE DetallesPedido (
    idDetallesPedido INT PRIMARY KEY AUTO_INCREMENT,
    idPedido INT,
    idInventario INT,
    idPedidoPersonalizado INT,
    idProductoG INT,
    Cantidad INT DEFAULT 1,
    Subtotal DECIMAL(10,2) DEFAULT 0.00,
    FOREIGN KEY (idPedido) REFERENCES Pedidos(idPedido),
    FOREIGN KEY (idInventario) REFERENCES Inventario(idInventario),
    FOREIGN KEY (idPedidoPersonalizado) REFERENCES ProductoPersonalizado(idProductoP),
    FOREIGN KEY (idProductoG) REFERENCES ProductoGaleria(idProductoG)
);

INSERT INTO TipoUsuario (idTipo, Tipo) VALUES (1, 'Administrador'), (2, 'Cliente');

INSERT INTO Color (Nombre, Codigo) VALUES
('Negro', '#000000'),
('Blanco', '#FFFFFF'),
('Morado', '#6F42C1'),
('Rosa', '#E83E8C'),
('Cian', '#0DCAF0');

INSERT INTO Tela (Tela) VALUES
('Algodón'),
('Poliéster'),
('Mezcla');

INSERT INTO Estilo (Estilo) VALUES
('Clásica'),
('Oversize'),
('Manga larga');

INSERT INTO Cortes (Corte) VALUES
('Recto'),
('Slim Fit'),
('Cuello Redondo'),
('Cuello V');

INSERT INTO Talla (Talla) VALUES
('CH'),
('M'),
('G'),
('XG');

INSERT INTO Inventario (FchActualizacion, cantidadDisponible) VALUES (CURDATE(), 200);

INSERT INTO ProductoCatalogo (idInventario, idColor, idTela, idTalla, idEstilo, idCorte, Nombre, TipoPrenda, descripcion, CostoBase) VALUES
(1, 3, 1, 2, 1, 3, 'Playera Neón', 'playera', 'Playera de algodón en tono morado', 180.00),
(1, 1, 1, 2, 1, 3, 'Playera Medianoche', 'playera', 'Playera clásica negra de algodón', 180.00),
(1, 4, 1, 2, 1, 3, 'Playera Flamingo', 'playera', 'Playera rosa de algodón', 190.00),
(1, 5, 2, 2, 1, 3, 'Playera Océano', 'playera', 'Playera deportiva cian de poliéster', 200.00),
(1, 3, 1, 2, 2, 3, 'Sudadera Violeta', 'sudadera', 'Sudadera oversize morada de algodón', 380.00),
(1, 1, 3, 2, 2, 3, 'Sudadera Noche', 'sudadera', 'Sudadera negra mezcla de fibras', 400.00),
(1, 4, 2, 2, 1, 3, 'Playera Sport Rosa', 'playera', 'Playera ligera rosa de poliéster', 210.00),
(1, 5, 2, 2, 2, 3, 'Sudadera Cian', 'sudadera', 'Sudadera cian de poliéster', 390.00);
