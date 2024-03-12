
/*                          Actividad Práctica */

/* Conectarse con el servidor */
USE bwuyuah9no0japy742v9;

/* Crear tabla con las variables de almacenaje */
CREATE TABLE deportistas(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombres VARCHAR(45),
    apellidos VARCHAR(45),
    correo VARCHAR(150),
    contraseña VARCHAR(8),
    fecha_nacimiento DATE,
    sexo VARCHAR(10),
    altura VARCHAR(10),
    peso VARCHAR(45)
);

/* Si necesito borrar */
DROP TABLE deportistas;

/* Insertar nueva información */
INSERT INTO deportistas (nombres, apellidos, correo, contraseña, fecha_nacimiento, sexo, altura, peso)
    VALUES('Sebastian', 'Quiroz Atehortúa', 'SQA@gmail.com', 'riwi2023', '2000-09-18', 'Masculino', '1.80', '60');

/* Mostrar tabla para verificar datos */
SELECT * FROM deportistas;
