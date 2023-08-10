DELIMITER $$
CREATE TRIGGER increase_follower_count
AFTER INSERT ON followers
FOR EACH ROW
BEGIN
    -- Cuando se inserta una fila en "followers", incrementa el contador de seguidores en la tabla "users"
    UPDATE users
    SET follower_count = follower_count + 1
    WHERE user_id = NEW.following_id;
END $$
DELIMITER ;

_________________________________________________________________________

DELIMITER $$
CREATE TRIGGER decrease_follower_count
AFTER DELETE ON followers
FOR EACH ROW
BEGIN
    -- Cuando se elimina una fila en "followers", incrementa el contador de seguidores en la tabla "users"
    UPDATE users
    SET follower_count = follower_count - 1
    WHERE user_id = NEW.following_id;
END $$
DELIMITER ;