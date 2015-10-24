\c mikey;

-- Create a new postgres user named has_many_user
CREATE USER has_many_user;

-- Create a new database named has_many_blogs owned by has_many_user
CREATE DATABASE has_many_blogs OWNER has_many_user;

-- Before each create table statement, add a drop table if exists statement.
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id serial PRIMARY KEY NOT NULL,
  username varchar(90) NOT NULL,
  first_name varchar(90) NULL,
  last_name varchar(90) NULL,
  created_at timestamp NOT NULL DEFAULT now(),
  updated_at timestamp NOT NULL DEFAULT now()
  );

DROP TABLE IF EXISTS posts;

CREATE TABLE posts (
  id serial PRIMARY KEY NOT NULL,
  title varchar(180) NULL DEFAULT NULL,
  url varchar(510) NULL DEFAULT NULL,
  content text NULL DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT now(),
  updated_at timestamp NOT NULL DEFAULT now()
  );

DROP TABLE IF EXISTS comments (
  id serial PRIMARY KEY NOT NULL,
  body varchar(510) NULL DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT now(),
  updated_at timestamp NOT NULL DEFAULT now()
  );

-- In has_many_blogs.sql Create the tables (including any PKs, Indexes, and Constraints that you may need) to fulfill the requirements of the has_many_blogs schema below.


-- Create the necessary FKs needed to relate the tables according to the relationship table below.


-- Run the provided scripts/blog_data.sql