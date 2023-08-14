SELECT 
    COUNT(*)
FROM
    authors;

DELETE FROM authors 
WHERE
    author_id = 1 LIMIT 1;

SELECT 
    name, client_id
FROM
    clients
WHERE
    active = '0';

SELECT 
    name, client_id, active
FROM
    clients
ORDER BY RAND()
LIMIT 10;

SELECT 
    *
FROM
    clients
WHERE
    client_id IN (80 , 7);

UPDATE clients 
SET 
    active = '0'
WHERE
    client_id = 80 LIMIT 1;

UPDATE clients 
SET 
    email = 'javier@gmail.com'
WHERE
    client_id = 80 LIMIT 1;

SELECT 
    *
FROM
    clients
WHERE
    client_id IN (1 , 6, 8, 27, 90)
        OR name LIKE '%Lopez%';

UPDATE clients 
SET 
    active = '0'
WHERE
    client_id IN (1 , 6, 8, 27, 90)
        OR name LIKE '%Lopez%';

DELETE FROM clients 
WHERE
    active = '0' LIMIT 1;