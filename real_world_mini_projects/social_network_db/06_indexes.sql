/*
 Indexes for performance
*/

-- Fast login
CREATE INDEX idx_users_email ON users(email);

-- Fast post search
CREATE INDEX idx_posts_user ON posts(user_id);

-- Fast comments lookup
CREATE INDEX idx_comments_post ON comments(post_id);
