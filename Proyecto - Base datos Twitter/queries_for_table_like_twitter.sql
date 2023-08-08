-- obtener numero de likes por tweet
SELECT 
    tweet_id, COUNT(*)
FROM
    tweet_likes
GROUP BY tweet_id;


SELECT 
    tweets.tweet_text, COUNT(*) like_count
FROM
    tweet_likes
        INNER JOIN
    tweets ON tweet_likes.tweet_id = tweets.tweet_id
GROUP BY tweets.tweet_text;