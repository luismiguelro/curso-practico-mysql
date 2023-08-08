CREATE DATABASE twitter_db;

USE twitter_db;

-- Users
CREATE TABLE users (
    user_id INT AUTO_INCREMENT,
    user_handle VARCHAR(50) NOT NULL UNIQUE,
    email_address VARCHAR(50) NOT NULL UNIQUE,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    phonenumber CHAR(10) UNIQUE,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    PRIMARY KEY (user_id)
);

-- Followers
CREATE TABLE followers (
    follower_id INT NOT NULL,
    following_id INT NOT NULL,
    FOREIGN KEY (follower_id)
        REFERENCES users (user_id),
    FOREIGN KEY (follower_id)
        REFERENCES users (user_id),
    PRIMARY KEY (follower_id , following_id)
);
-- Version 8 añadir constrains para hacer checks
-- Validar que una misma persona se siga asi misma
ALTER TABLE followers
add constraint check_follower_id
check(follower_id <> following_id);

-- Likes twitter
CREATE TABLE tweet_likes (
    user_id INT NOT NULL,
    tweet_id INT NOT NULL,
    FOREIGN KEY (user_id)
        REFERENCES users (user_id),
    FOREIGN KEY (tweet_id)
        REFERENCES tweets (tweet_id),
    PRIMARY KEY (user_id , tweet_id)
)