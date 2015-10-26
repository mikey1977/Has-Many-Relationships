

-- Write the following SQL statements in joins.sql

-- Create a query to get all fields from the users table
SELECT * FROM users;

-- Create a query to get all fields from the posts table where the user_id is 100
SELECT posts.id, posts.title, posts.url, posts.created_at, posts.updated_at
FROM posts
INNER JOIN users
ON posts.users_id = users.id
WHERE users.id = 100;


-- Create a query to get all posts fields, the user's first name, and the user's
--  last name, from the posts table where the user's id is 200
SELECT posts.id, posts.title, posts.url, posts.created_at, posts.updated_at, users.first_name, users.last_name
FROM posts
INNER JOIN users
ON posts.users_id = users.id
WHERE users.id = 200;

-- Create a query to get all posts fields, and the user's username, from the posts
--  table where the user's first name is 'Norene' and the user's last_name is 'Schmitt'
SELECT posts.id, posts.title, posts.url, posts.created_at, posts.updated_at, users.username
FROM posts
INNER JOIN users
ON posts.users_id = users.id
WHERE users.first_name = 'Norene' AND users.last_name = 'Schmitt';


-- Create a query to get usernames from the users table where the user has created a
--  post after January 1, 2015
SELECT username
FROM users
INNER JOIN posts
ON posts.users_id = users.id
WHERE posts.created_at > '2015-01-01';

-- Create a query to get the post title, post content, and user's username where the
--  user who created the post joined before January 1, 2015
SELECT posts.title, posts.content, users.username
FROM posts
INNER JOIN users
ON posts.users_id = users.id
WHERE users.created_at < '2015-01-01';


-- Create a query to get the all rows in the comments table, showing post title (aliased
--  as 'Post Title'), and the all the comment's fields
SELECT posts.title as "Post Title", comments.id, comments.body, comments.created_at, comments.updated_at
FROM posts
INNER JOIN comments
ON posts.id = comments.posts_id;

-- Create a query to get the all rows in the comments table, showing post title (aliased
--  as post_title), post url (ailased as post_url), and the comment body (aliased as
--   comment_body) where the post was created before January 1, 2015
SELECT comments.id, comments.body as "comment_body", comments.created_at, comments.updated_at, posts.title as "post_title", posts.url as "url"
FROM comments
INNER JOIN posts
ON posts.id = comments.posts_id
WHERE posts.created_at < '2015-01-01';

-- Create a query to get the all rows in the comments table, showing post title (aliased
--  as post_title), post url (ailased as post_url), and the comment body (aliased as
--   comment_body) where the post was created after January 1, 2015
SELECT comments.id, comments.body as "comment_body", comments.created_at, comments.updated_at, posts.title as "post_title", posts.url as "url"
FROM comments
INNER JOIN posts
ON posts.id = comments.posts_id
WHERE posts.created_at > '2015-01-01';


-- Create a query to get the all rows in the comments table, showing post title (aliased
--  as post_title), post url (ailased as post_url), and the comment body (aliased as
--   comment_body) where the comment body contains the word 'USB'
SELECT comments.id, comments.body as "comment_body", comments.created_at, comments.updated_at, posts.title as "post_title", posts.url as "url"
FROM comments
INNER JOIN posts
ON posts.id = comments.posts_id
WHERE comments.body LIKE '%USB%';


-- Create a query to get the post title (aliased as post_title), first name of the author
--  of the post, last name of the author of the post, and comment body (aliased to
--   comment_body), where the comment body contains the word 'matrix' ( should have 855 results )
SELECT posts.title as "post_title", users.first_name, users.last_name, comments.body as "comment_body"
FROM comments
INNER JOIN users
ON comments.users_id = users.id
INNER JOIN posts
ON posts.id = comments.posts_id
WHERE comments.body LIKE '%matrix%';


SELECT COUNT(*)
FROM comments
INNER JOIN users
ON comments.users_id = users.id
INNER JOIN posts
ON posts.id = comments.posts_id
WHERE comments.body LIKE '%matrix%';
-- Create a query to get the first name of the author of the comment, last name of
--  the author of the comment, and comment body (aliased to comment_body), where the
--   comment body contains the word 'SSL' and the post content contains the word 'dolorum'
--    ( should have 102 results )
SELECT users.first_name, users.last_name, comments.body as "comment_body"
FROM posts
INNER JOIN users
ON users.id = posts.users_id
INNER JOIN comments
ON posts.id = comments.posts_id
WHERE posts.content LIKE '%dolorum%';


-- Create a query to get the first name of the author of the post (aliased to post_author_first_name),
--  last name of the author of the post (aliased to post_author_last_name), the post title (aliased
--   to post_title), username of the author of the comment (aliased to comment_author_username), and
--    comment body (aliased to comment_body), where the comment body contains the word 'SSL' or
--     'firewall' and the post content contains the word 'nemo' ( should have 197 results )
SELECT users.first_name as "post_author_first_name", users.last_name
as "post_author_last_name", posts.title as "post_title", users.username
as "comment_author_username", comments.body
FROM posts
INNER JOIN users
ON users.id = posts.users_id
INNER JOIN comments
ON posts.id = comments.posts_id
WHERE comments.body LIKE '%SSL%'
OR comments.body LIKE '%firewall'
AND posts.content LIKE '%nemo';

SELECT COUNT(*)
FROM comments
INNER JOIN users
ON users.id = comments.users_id
INNER JOIN posts
ON posts.id = comments.posts_id
WHERE (posts.content LIKE '%nemo%'
AND comments.body LIKE '%SSL%')
OR (posts.content LIKE '%nemo%'
AND comments.body LIKE '%firewall%');
-- 218


SELECT users.first_name as "post_author_first_name", users.last_name
as "post_author_last_name", posts.title as "post_title", users.username
as "comment_author_username", comments.body
FROM posts
INNER JOIN users
ON users.id = posts.users_id
INNER JOIN comments
ON posts.id = comments.posts_id
WHERE posts.content LIKE '%nemo%'
AND comments.body LIKE '%firewall%'
OR comments.body LIKE '%SSL%';

SELECT COUNT(*)
FROM posts
INNER JOIN users
ON users.id = posts.users_id
INNER JOIN comments
ON posts.id = comments.posts_id
WHERE (posts.content LIKE '%nemo%'
AND comments.body LIKE '%firewall%')
OR (comments.body LIKE '%SSL%');
-- 800

SELECT COUNT(*)
FROM posts
INNER JOIN users
ON users.id = posts.users_id
INNER JOIN comments
ON posts.id = comments.posts_id
WHERE (comments.body LIKE '%firewall%' OR comments.body LIKE '%SSL%')
AND posts.content LIKE '%nemo%';
-- 218