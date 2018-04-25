#!/bin/bash
psql postgres postgres
CREATE DATABASE vmug;
CREATE TABLE members (
    id          SERIAL PRIMARY KEY,
    firstname   varchar(30) NOT NULL,
    lastname    varchar(30) NOT NULL,
    email       varchar(50) NOT NULL,
    company     varchar(50),
    title       varchar(50),
    exclude     boolean NOT NULL DEFAULT 'f',
    checkedin   boolean NOT NULL DEFAULT 'f',
    prereg      boolean NOT NULL DEFAULT 'f',
    timestamp   timestamp NOT NULL
);
exit 0