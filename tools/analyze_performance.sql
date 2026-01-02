-- Analyze query performance
-- Run EXPLAIN ANALYZE on key queries

EXPLAIN ANALYZE SELECT * FROM students;
EXPLAIN ANALYZE SELECT * FROM orders WHERE status='paid';
EXPLAIN ANALYZE SELECT * FROM social_posts WHERE user_id=1;
