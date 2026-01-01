/*
 Views for social network analytics
*/

-- View posts with username
CREATE VIEW post_with_user AS
SELECT p.id, u.username, p.content, p.created_at
FROM posts p
JOIN users u ON p.user_id = u.id;

-- View number of likes per post
CREATE VIEW post_likes_count AS
SELECT post_id, COUNT(*) AS total_likes
FROM likes
GROUP BY post_id;
