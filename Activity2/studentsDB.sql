USE bwuyuah9no0japy742v9;

/* Students */
CREATE TABLE students (
    /* Auto Increment for automatic id generation */
    idStudent INT PRIMARY KEY AUTO_INCREMENT,
    nameStudent VARCHAR(50) NOT NULL
);

INSERT INTO students (idStudent, nameStudent)
    VALUES
    (idStudent, 'student1'),
    (idStudent, 'student2'),
    (idStudent, 'student3'),
    (idStudent, 'student4'),
    (idStudent, 'student5'),
    (idStudent, 'student6'),
    (idStudent, 'student7'),
    (idStudent, 'student8'),
    (idStudent, 'student9'),
    (idStudent, 'student10');

/* Data on DB Verifications */
SELECT idStudent FROM students;
SELECT nameStudent FROM students;


/* Subjects and Grades */
CREATE TABLE materias (
    idMateria INT PRIMARY KEY AUTO_INCREMENT,
    nameMateria VARCHAR(50) NOT NULL
);

INSERT INTO materias (idMateria, nameMateria)
    VALUES
    (idMateria, 'materia1'),
    (idMateria, 'materia2'),
    (idMateria, 'materia3'),
    (idMateria, 'materia4'),
    (idMateria, 'materia5'),
    (idMateria, 'materia6'),
    (idMateria, 'materia7'),
    (idMateria, 'materia8'),
    (idMateria, 'materia9'),
    (idMateria, 'materia10');

/* Data on DB Verifications */
SELECT idMateria FROM materias;
SELECT nameMateria FROM materias;


CREATE TABLE grades (
    PRIMARY KEY (idStudent, idMateria),
    grade DECIMAL(4,2),
    /* foreign keys */
    idStudent INT,
    idMateria INT,
    Foreign Key (idStudent) REFERENCES students(idStudent),
    Foreign Key (idMateria) REFERENCES materias(idMateria)
);

INSERT INTO grades (idStudent, idMateria, grade)
    VALUES
    (1, 1, 5),
    (1, 2, 5),
    (1, 3, 5),
    (1, 4, 5),
    (1, 5, 5),
    (1, 6, 5),
    (1, 7, 5),
    (1, 8, 5),
    (1, 9, 5),
    (1, 10, 5),
    (2, 1, 5),
    (2, 2, 5),
    (2, 3, 5),
    (2, 4, 5),
    (2, 5, 5),
    (2, 6, 5),
    (2, 7, 5),
    (2, 8, 5),
    (2, 9, 5),
    (2, 10, 5),
    (3, 1, 5),
    (3, 2, 5),
    (3, 3, 5),
    (3, 4, 5),
    (3, 5, 5),
    (3, 6, 5),
    (3, 7, 5),
    (3, 8, 5),
    (3, 9, 5),
    (3, 10, 5),
    (4, 1, 5),
    (4, 2, 5),
    (4, 3, 5),
    (4, 4, 5),
    (4, 5, 5),
    (4, 6, 5),
    (4, 7, 5),
    (4, 8, 5),
    (4, 9, 5),
    (4, 10, 5),
    (5, 1, 5),
    (5, 2, 5),
    (5, 3, 5),
    (5, 4, 5),
    (5, 5, 5),
    (5, 6, 5),
    (5, 7, 5),
    (5, 8, 5),
    (5, 9, 5),
    (5, 10, 5),
    (6, 1, 5),
    (6, 2, 5),
    (6, 3, 5),
    (6, 4, 5),
    (6, 5, 5),
    (6, 6, 5),
    (6, 7, 5),
    (6, 8, 5),
    (6, 9, 5),
    (6, 10, 5),
    (7, 1, 5),
    (7, 2, 5),
    (7, 3, 5),
    (7, 4, 5),
    (7, 5, 5),
    (7, 6, 5),
    (7, 7, 5),
    (7, 8, 5),
    (7, 9, 5),
    (7, 10, 5),
    (8, 1, 5),
    (8, 2, 5),
    (8, 3, 5),
    (8, 4, 5),
    (8, 5, 5),
    (8, 6, 5),
    (8, 7, 5),
    (8, 8, 5),
    (8, 9, 5),
    (8, 10, 5),
    (9, 1, 5),
    (9, 2, 5),
    (9, 3, 5),
    (9, 4, 5),
    (9, 5, 5),
    (9, 6, 5),
    (9, 7, 5),
    (9, 8, 5),
    (9, 9, 5),
    (9, 10, 5),
    (10, 1, 5),
    (10, 2, 5),
    (10, 3, 5),
    (10, 4, 5),
    (10, 5, 5),
    (10, 6, 5),
    (10, 7, 5),
    (10, 8, 5),
    (10, 9, 5),
    (10, 10, 5);

/* Data on DB Verifications */
SELECT idStudent, idMateria, grade FROM grades;