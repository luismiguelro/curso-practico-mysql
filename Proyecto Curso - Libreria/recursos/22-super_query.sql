-- Obtener nacionalidades únicas de los autores
SELECT DISTINCT
    nationality
FROM
    authors;

-- Calcular la cantidad total de libros en la tabla "books"
SELECT 
    COUNT(book_id)
FROM
    books;

-- Calcular la cantidad total de libros en la tabla "books" (con suma constante)
SELECT 
    COUNT(book_id), SUM(1)
FROM
    books;

-- Calcular la suma de precios de libros vendibles
SELECT 
    SUM(price)
FROM
    books
WHERE
    sellable = 1;

-- Calcular la suma de ingresos por libros vendibles
SELECT 
    SUM(price * copies)
FROM
    books
WHERE
    sellable = 1;

-- Calcular la suma de ingresos por libros vendibles agrupados por la columna "sellable"
SELECT 
    sellable, SUM(price * copies)
FROM
    books
GROUP BY sellable;

-- Realizar un análisis de libros basado en el año de publicación y la nacionalidad del autor
SELECT 
    nationality,
    SUM(IF(year < 1950, 1, 0)) AS '<1950',
    SUM(IF(year >= 1950 AND year < 1990, 1, 0)) AS '<1990',
    SUM(IF(year >= 1990 AND year < 2000, 1, 0)) AS '<2000',
    SUM(IF(year >= 2000, 1, 0)) AS '<TODAY',
    COUNT(book_id) AS cantidad_libros
FROM
    books b
        JOIN
    authors a ON a.author_id = b.author_id
WHERE
    a.nationality IS NOT NULL
GROUP BY nationality
ORDER BY cantidad_libros DESC;
