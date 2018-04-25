#!/bin/bash
psql -d vmug -U postgres -c "CREATE DATABASE vmug;"
psql -d vmug -U postgres -c "CREATE TABLE members (
    id          serial PRIMARY KEY,
    firstname   varchar(30) NOT NULL,
    lastname    varchar(30) NOT NULL,
    email       varchar(50) NOT NULL,
    company     varchar(50),
    title       varchar(50),
    exclude     boolean NOT NULL DEFAULT 'f',
    checkedin   boolean NOT NULL DEFAULT 'f',
    prereg      boolean NOT NULL DEFAULT 'f',
    timestamp   timestamp NOT NULL DEFAULT now()
);"
psql -d vmug -U postgres -c "CREATE TABLE theme (
    theme       text NOT NULL,
    enabled     boolean NOT NULL DEFAULT 'f'
);"
psql -d vmug -U postgres -c "INSERT INTO theme (theme, enabled) values
('blue','t'),
('red','f'),
('yellow','f'),
('green','f')
;"
psql -d vmug -U postgres -c "CREATE EXTENSION pgcrypto;"
psql -d vmug -U postgres -c "CREATE TABLE admin (
    id          serial PRIMARY KEY,
    username    varchar(20) NOT NULL UNIQUE,
    password    text NOT NULL
);"
psql -d vmug -U postgres -c "INSERT INTO admin (username,password) values (
    'admin',
    crypt('admin',gen_salt('bf'))
);"
exit 0