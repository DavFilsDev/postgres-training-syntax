# Datasets Folder

This folder contains sample datasets used to practice PostgreSQL.

## Files

- students.csv → Student management project data
- grades.csv → Grades for students
- users_ecommerce.csv → Ecommerce users
- products_ecommerce.csv → Ecommerce products
- orders_ecommerce.csv → Ecommerce orders
- social_users.csv → Social network users
- social_posts.csv → Social network posts
- large_fake_data.sql → Script to generate big datasets for performance testing

## Import CSV into PostgreSQL

Example:

```bash
psql -d mydb
\copy students FROM 'students.csv' DELIMITER ',' CSV HEADER;
````

## Purpose

These datasets help to test:

* SQL queries
* Joins
* Index performance
* Backend scenarios
* Large data optimization