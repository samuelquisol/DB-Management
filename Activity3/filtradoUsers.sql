USE bwuyuah9no0japy742v9;

/* 1. Listado usuarios de 20 años de edad */
SELECT nombres, apellidos, edad FROM users WHERE edad = 20;

/* 2. Listado mujeres entre 20 y 30 años */
SELECT nombres, apellidos, genero, edad FROM users WHERE genero = 'M' && edad >= 20 && edad <= 30;

/* 3. Persona con menos edad */
SELECT nombres, apellidos, edad FROM users ORDER BY edad ASC LIMIT 1;
SELECT nombres, apellidos, MIN(edad) FROM users;

/* 4. Cantidad de Usuarios Registrados en la base de datos. */
/* SELECT id FROM users ORDER BY id DESC LIMIT 1; */
SELECT COUNT(*) AS usuariosTotales FROM users;

/* 5. 5 primeros usuarios de la base de datos. */
SELECT nombres, apellidos, id FROM users ORDER BY id ASC LIMIT 5;

/* 6. 10 últimos usuarios de la base de datos. */
SELECT nombres, apellidos, id FROM users ORDER BY id DESC LIMIT 10;


/* 7. Listar usuarios que su correo finalice en .net. */
/* SELECT nombres, apellidos, correo FROM users WHERE correo CONTAINS('.net'); (no funcionó) */
/* SELECT COUNT(*) AS usuariosCorreoNet FROM users WHERE; (no funcionó) */
SELECT nombres, apellidos, correo FROM users WHERE LOWER(correo) like '%.net';

/* 8. Listar usuarios que no vivan en colombia. */
SELECT nombres, apellidos, pais FROM users WHERE pais != 'colombia';

/* 9. Listar usuarios que no vivan en ecuador y panama. */
SELECT nombres, apellidos, pais FROM users WHERE pais != 'ecuador' && pais != 'panama'; 

/* 10. Número de Usuarios de Colombia que les gusta el Rock. */
SELECT COUNT(*) AS colombianosRockeros FROM users WHERE pais = 'colombia' && musica = 'rock';

/* 11. Actualizar el género musical de todos los usuarios de la base de datos. De “metal” a “carranga”. */
UPDATE users SET musica = 'carranga' WHERE musica = 'metal';

/* 12. Listado de hombres que les gusta la “carranga” sean de Colombia y tengan entre 10 y 20 años de edad. */
SELECT nombres, apellidos, musica FROM users WHERE musica = 'carranga'; 

/* 13. Actualizar todos los usuarios que tengan 99 años, su nuevo género musical favorito será la “carranga”. */
UPDATE users SET musica = 'carranga' WHERE edad = 99;

/* 14. Listar todos los usuarios cuyo nombre inicie con “a”, “A”. */
SELECT nombres, apellidos FROM users WHERE LOWER(nombres) LIKE 'a%';

/* 15. Listar todos los usuarios cuyo apellido finalice con “z”, “Z”. */
SELECT nombres, apellidos FROM users WHERE LOWER(nombres) LIKE '%z';

/* 16. Actualizar los usuarios que tengan 50 años de edad su nuevo genero musical será NULL. */
UPDATE users SET musica = 'NULL' WHERE edad = 50;

/* 17. Listar todos los usuarios cuyo género musical sea NULL. */
SELECT nombres, apellidos, musica FROM users WHERE musica = 'NULL'

/* 18. Resultado de la suma de todas la edades de la base de datos. */
SELECT SUM(edad) As edadesSumadas FROM users;

/* 19. Cantidad de usuarios de ecuador. */
SELECT COUNT(*) AS ecuatorianos FROM users WHERE pais = 'ecuador';

/* 20. Cantidad de usuarios colombianos que les gusta el vallenato. */
SELECT COUNT(*) AS colombianosVallenateros FROM users WHERE pais = 'colombia' && musica = 'vallenato';