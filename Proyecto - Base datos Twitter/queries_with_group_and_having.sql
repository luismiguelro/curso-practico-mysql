-- cuantos tweets ha hecho un usuario?
SELECT 
    user_id, COUNT(*) AS tweet_count
FROM
    tweets
GROUP BY user_id;

-- subconsultas
-- Obtener los tweets de los usuarios que tienen mas de dos seguidores

SELECT 
    tweet_id, tweet_text, user_id
FROM
    tweets
WHERE
    user_id IN (SELECT 
            following_id
        FROM
            followers
        GROUP BY following_id
        HAVING COUNT(*)  > 2)
