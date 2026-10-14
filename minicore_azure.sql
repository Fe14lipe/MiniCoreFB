-- Para Azure SQL: conectarte a la base "minicore" ya creada en el portal y ejecutar esto.
IF OBJECT_ID('ventas') IS NOT NULL DROP TABLE ventas;
IF OBJECT_ID('usuarios') IS NOT NULL DROP TABLE usuarios;

CREATE TABLE usuarios (
    idusuarios INT IDENTITY(1,1) PRIMARY KEY,
    nombre     NVARCHAR(100),
    apellido   NVARCHAR(100)
);
CREATE TABLE ventas (
    idventas   INT IDENTITY(1,1) PRIMARY KEY,
    idusuario  INT FOREIGN KEY REFERENCES usuarios(idusuarios),
    monto      FLOAT,
    fecha      DATE
);

INSERT INTO usuarios (nombre, apellido) VALUES
(N'Juan',N'Pérez'),(N'Ana',N'Martínez'),(N'Carlos',N'Gómez'),(N'Lucía',N'Sánchez'),(N'Pedro',N'Ramírez');
INSERT INTO ventas (idusuario, monto, fecha) VALUES
(1,120.50,'2025-06-01'),(1,380.00,'2025-06-02'),(2,150.00,'2025-06-03'),(2,500.00,'2025-06-05'),
(3,75.00,'2025-06-07'),(3,95.00,'2025-06-09'),(4,300.00,'2025-06-10'),(4,600.00,'2025-06-12'),
(5,210.00,'2025-06-15'),(5,800.00,'2025-06-17');

SELECT * FROM ventas