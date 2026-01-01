/*
 Real-world social network queries
*/

-- Get all posts with username
SELECT * FROM post_with_user;

-- Get likes count per post
SELECT * FROM post_likes_count;

-- Get all friends of user 1
SELECT u.username
FROM friendships f
JOIN users u ON f.friend_id = u.id
WHERE f.user_id = 1;

-- Get most liked post
SELECT post_id, total_likes
FROM post_likes_count
ORDER BY total_likes DESC
LIMIT 1;

-- Count friends of user 1
SELECT count_friends(1);
