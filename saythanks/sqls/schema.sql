-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2016-11-20 21:08:56.471

-- Enable pgcrypto for UUID support.
CREATE EXTENSION pgcrypto;

-- tables
-- Table: inboxes
CREATE TABLE inboxes (
    slug text  NOT NULL,
    auth_id text  NOT NULL,
    CONSTRAINT inboxes_pk PRIMARY KEY (auth_id)
);

-- Table: notes
CREATE TABLE notes (
    uuid UUID DEFAULT gen_random_uuid(),
    inboxes_auth_id text  NOT NULL,
    body text  NOT NULL,
    byline text,
    CONSTRAINT notes_pk PRIMARY KEY (uuid)
);

-- foreign keys
-- Reference: notes_inboxes (table: notes)
ALTER TABLE notes ADD CONSTRAINT notes_inboxes
    FOREIGN KEY (inboxes_auth_id)
    REFERENCES inboxes (auth_id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- End of file.