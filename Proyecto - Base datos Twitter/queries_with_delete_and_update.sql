-- DELETE
DELETE FROM tweets 
WHERE
    tweet_id = 1;
    
DELETE FROM tweets 
WHERE
    user_id = 1;
    
DELETE FROM tweets 
WHERE
    tweet_text LIKE '%Elon Musk%';


-- UPDATE
UPDATE tweets 
SET 
    num_comments = num_comments + 1
WHERE
    tweet_id = 2;
 
 -- Reemplazar un texto
UPDATE tweets 
SET 
    tweet_text = REPLACE(tweet_text,
        'Attending',
        'Hello,world!')
WHERE
    tweet_text LIKE '%Attending%';
