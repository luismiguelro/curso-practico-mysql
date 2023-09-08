-- Para obtener un “FULL OUTER JOIN”, 
-- se pueden unir un “LEFT JOIN” y un “RIGHT JOIN” usando la palabra clave “UNION”.
SELECT
    a.author_id,
    a.name,
    a.nationality,
    b.title
FROM
    authors AS a
    LEFT JOIN books AS b ON b.author_id = a.author_id
WHERE
    a.author_id BETWEEN 1
    AND 10
UNION
SELECT
    a.author_id,
    a.name,
    a.nationality,
    b.title
FROM
    authors AS a
    RIGHT JOIN books AS b ON b.author_id = a.author_id
WHERE
    a.author_id BETWEEN 1
    AND 10 -- CROSS JOIN devuelve todas las combinaciones posibles de filas de las tablas izquierda y derecha.
SELECT
    *
FROM
    books
    CROSS JOIN authors;

-- RIGHT JOIN :Esta consulta retorna todas las filas de la tabla B y ademas si hay filas en la tabla A que coinciden también va a traer estas filas de la tabla A.
SELECT
    a.author_id,
    a.name,
    a.nationality,
    b.title
FROM
    authors AS a
    RIGHT JOIN books AS b ON b.author_id = a.author_id
WHERE
    a.author_id BETWEEN 1
    AND 5
ORDER BY
    a.author_id;

--  Left excluding join:  Esta consulta retorna todas las filas de la tabla de la izquierda, es decir la tabla A que no tienen ninguna coincidencia con la tabla de la derecha, es decir la tabla B.
SELECT
    a.author_id,
    a.name,
    a.nationality,
    b.book_id
FROM
    authors AS a
    LEFT JOIN books AS b ON b.author_id = a.author_id
WHERE
    b.book_id IS NULL
ORDER BY
    a.author_id;