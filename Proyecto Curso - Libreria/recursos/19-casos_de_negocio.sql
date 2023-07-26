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
SELECT 
    AVG(price) AS avg_price, STDDEV(price) AS stddev_price
FROM
    books;

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


