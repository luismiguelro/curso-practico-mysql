-- 1. ¿Qué nacionalidades hay?
SELECT DISTINCT nationality 
FROM authors
ORDER BY 1;

-- 2. ¿Cuántos escritores hay de cada nacionalidad?
SELECT 
    nationality,  COUNT(*) AS cantidad
FROM
    authors
WHERE
    nationality IS NOT NULL
GROUP BY nationality
ORDER BY cantidad;

-- 3. cuantos libros hay de cada nacionalidad
SELECT 
    a.nationality, COUNT(b.book_id) AS total
FROM
    books b
        INNER JOIN
    authors a ON a.author_id = b.author_id
GROUP BY a.nationality


-- 4. ¿Cual es el promedio/desviacion standard del precio de los libros
use platzi_operation;
SELECT 
    a.nationality,
    AVG(b.price) AS promedio,
    STDDEV(b.price) AS std
FROM
    books AS b
        JOIN
    authors AS a ON a.author_id = b.author_id
GROUP BY a.nationality
ORDER BY promedio DESC;

-- ¿Cuál es el promedio/desviación standard del precio de libros por nacionalidad?
-- Agrupar por la columna pivot

SELECT 
    a.nationality,
    COUNT(b.book_id) AS libros,
    AVG(b.price) AS promedio,
    STDDEV(b.price) AS std
FROM
    books AS b
        JOIN
    authors AS a ON a.author_id = b.author_id
GROUP BY a.nationality
ORDER BY libros DESC;

-- 5. cual es el precio minimo/maximo de un libro?
SELECT 
    title_book_max.title AS max_title,
    title_book_max.price AS max_price,
    title_book_min.title AS min_title,
    title_book_max.price AS min_price
FROM
    (SELECT 
        title, price
    FROM
        books
    ORDER BY price DESC
    LIMIT 1) AS title_book_max,
    (SELECT 
        title, price
    FROM
        books
    WHERE
        price IS NOT NULL
    ORDER BY price ASC
    LIMIT 1) AS title_book_min;

-- ¿Cuál es el precio máximo/mínimo de un libro(y el nombre)? por nacionalidad
SELECT 
    b.title, a.nationality, MAX(price), MIN(price)
FROM
    books AS b
        JOIN
    authors AS a ON a.author_id = b.author_id
GROUP BY  b.title,a.nationality;


-- Generar precios aleatorios
<UPDATE books 
  SET price = FLOOR(RAND()*(35-10+1))+10
  WHERE book_id between 1 and 198 >