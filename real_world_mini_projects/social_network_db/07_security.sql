/*
 Roles and privileges
*/

-- Roles
CREATE ROLE social_admin;
CREATE ROLE social_user;

-- Admin full access
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO social_admin;

-- User privileges
GRANT SELECT, INSERT ON posts, comments, likes TO social_user;
GRANT SELECT ON users TO social_user;

-- Example users
CREATE USER admin_social WITH PASSWORD 'admin123';
CREATE USER user_social WITH PASSWORD 'user123';

GRANT social_admin TO admin_social;
GRANT social_user TO user_social;
