--- 1

SELECT tipodoc, documento, nombre, apellido, legajo
FROM persona
    JOIN alumno ON persona.identificador = alumno.idpersona;

--- 2

SELECT P.tipodoc, P.documento, P.nombre, P.apellido, A.legajo, I.fechainscripcion, C.nombre
FROM persona P
    JOIN alumno A ON P.identificador = A.idpersona
    JOIN inscripciones_carrera I ON I.idalumno = A.idpersona
    JOIN carrera C ON I.idcarrera = C.identificador
ORDER BY A.legajo DESC;

--- 3

SELECT CU.nombre, CU.cupomaximo, CA.nombre, SUM(idalumno) AS cantidad
FROM curso CU
    JOIN carrera CA ON CA.identificador = CU.idcarrera
    JOIN inscripciones_curso INS ON INS.idcurso = CU.identificador
GROUP BY CU.nombre, CU.cupomaximo, CA.nombre;

--- 4

SELECT CU.nombre, CU.cupomaximo, CA.nombre, SUM(idalumno) AS cantidad
FROM curso CU
    JOIN carrera CA ON CA.identificador = CU.idcarrera
    JOIN inscripciones_curso INS ON INS.idcurso = CU.identificador
GROUP BY CU.nombre, CU.cupomaximo, CA.nombre
HAVING SUM(idalumno) > CU.cupomaximo;

--- 5

UPDATE curso
    SET cupomaximo = 10
WHERE cupomaximo < 5;

--- 6

UPDATE inscripciones_curso SET fechainscripcion = LOCALTIMESTAMP
WHERE fechainscripcion = (SELECT INS_CUR.fechainscripcion AS curso
FROM inscripciones_curso INS_CUR JOIN inscripciones_carrera INS_CAR ON INS_CUR.idalumno = INS_CAR.idalumno
WHERE INS_CUR.fechainscripcion < INS_CAR.fechainscripcion);


--- 7

INSERT INTO persona
VALUES
    (6, 'DNI', 34141657, 'Favio', 'Tschanz', '1989-04-16');

INSERT INTO alumno
VALUES
    (6, 6, 34141);

INSERT INTO inscripciones_carrera
VALUES
    (6, 1, '2018-01-01');

INSERT INTO inscripciones_curso
VALUES
    (6, 4, '2018-02-01');

INSERT INTO inscripciones_curso
VALUES
    (6, 3, '2018-02-01');

--- 8

-- [ El nuevo dato de la direccion del alumno, deberia crearse justamente sobre la tabla de 'persona', y asociar a cada persona/alumno esa dirección
-- ya que esto contribuye a la homogeneidad de datos ]

