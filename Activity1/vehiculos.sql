/* Estos comandos establecen conexión con la DB y confirman la conexión */
USE bwuyuah9no0japy742v9;
SHOW DATABASES;

/* Eliminación de Tablas */
DROP TABLE colores;
DROP TABLE marcas;
DROP TABLE tipos_vehiculos;
drop table vehiculos;

          /* Tabla de Colores */
/* Se crea como entidad independiente */
CREATE TABLE colores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    color VARCHAR(45)
);

INSERT INTO colores (color)
VALUES
('Azul'),
('Verde');


            /* Tabla de Marcas */
/* Se crea como un entidad independiente relacionada a muchos tipos de vehiculos */
CREATE TABLE marcas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    marca VARCHAR(45)
);

INSERT INTO marcas (marca)
    VALUES
    ('BMW'),
    ('Lamborguini');


            /* Tipos de vehiculos */
/* Se crea como un conjunto relacionado con una única marca */
CREATE TABLE tipos_vehiculos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo_vehiculo VARCHAR(45),
    /* foreign key */
    idMarcas INT
);
ALTER TABLE tipos_vehiculos ADD FOREIGN KEY (idMarcas) REFERENCES marcas(id);

INSERT INTO tipos_vehiculos (tipo_vehiculo)
    VALUES
    ('Carro'),
    ('Moto');


                        /* Vehiculos */
/* Se crea como una entidad débil correlacionada con dos tablas */
CREATE TABLE vehiculos (
    idVehiculo INT PRIMARY KEY AUTO_INCREMENT,
    modelo VARCHAR(45),
    placa VARCHAR(45),
    /* foreign keys */
    idColores INT,
    idTipo_vehiculo INT,
    idMarcasTipo_vehiculo INT
);

                        /* Foreign Keys */
ALTER TABLE vehiculos ADD FOREIGN KEY (idColores) REFERENCES colores(id);
ALTER TABLE vehiculos ADD FOREIGN KEY (idTipo_vehiculo) REFERENCES tipos_vehiculos(id);
ALTER TABLE vehiculos ADD FOREIGN KEY (idMarcasTipo_vehiculo) REFERENCES marcas(id);


INSERT INTO vehiculos (modelo, placa, idColores, idTipo_vehiculo, idMarcasTipo_vehiculo)
    VALUES
    (2023, 'ESE-123', 1, 2, 1),
    (2020, 'ESS-384', 2, 2, 2),
    (2021, 'ESA-643', 1, 2, 2),
    (2020, 'DSE-673', 1, 1, 1),
    (2022, 'EFS-693', 2, 2, 1),
    (2022, 'HFE-803', 1, 2, 1),
    (2020, 'HHE-773', 2, 2, 1),
    (2023, 'HYE-128', 2, 2, 2),
    (2022, 'JRE-193', 1, 2, 2),
    (2023, 'EYE-823', 2, 1, 2);


                        /* Extracción de Datos */
/* Extracción General */
SELECT * FROM vehiculos;

/* Extracción de Colores */
/* Se realiza join para relacionar y extraer datos de otras tablas */
SELECT * FROM vehiculos INNER JOIN colores WHERE vehiculos.idColores = colores.id;

/* Extracción de Marca se gun el tipo de vehículo */
SELECT * FROM vehiculos INNER JOIN tipos_vehículos WHERE vehiculos.idMarcasTipo_vehiculo = tipo_vehiculo.idMarca;