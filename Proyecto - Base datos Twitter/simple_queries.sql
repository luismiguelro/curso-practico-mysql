SELECT 
    follower_id, following_id
FROM
    followers;
_______________________________________________________
    SELECT 
    follower_id, following_id
FROM
    followers
    WHERE following_id = 50;
_______________________________________________________
   SELECT 
    COUNT(follower_id)
FROM
    followers
WHERE
    following_id = 13;
_______________________________________________________
   SELECT 
    u.first_name, COUNT(f.follower_id) AS followers
FROM
    followers f
    inner join users u on u.user_id = f.follower_id
GROUP BY f.following_id
ORDER BY followers DESC
LIMIT 3
_______________________________________________________

SELECT 
    u.user_id,
    u.user_handle,
    f.following_id,
    COUNT(f.follower_id) AS followers
FROM
    followers f
        INNER JOIN
    users u ON u.user_id = f.following_id
GROUP BY f.following_id
ORDER BY followers DESC
LIMIT 3;
_______________________________________________________
