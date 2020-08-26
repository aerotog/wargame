-- Table: public.users

-- DROP TABLE public.users;

CREATE TABLE public.users
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    name text COLLATE pg_catalog."default",
    CONSTRAINT user_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.users
    OWNER to postgres;-- Table: public.building_types

-- DROP TABLE public.building_types;

CREATE TABLE public.building_types
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT building_pkey PRIMARY KEY (id),
    CONSTRAINT building_types_name_key UNIQUE (name)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.building_types
    OWNER to postgres;-- Table: public.buildings

-- DROP TABLE public.buildings;

CREATE TABLE public.buildings
(
    user_id bigint NOT NULL,
    type_id smallint NOT NULL,
    count bigint,
    CONSTRAINT buildings_pkey PRIMARY KEY (user_id, type_id)
        INCLUDE(count),
    CONSTRAINT buildings_types_fkey FOREIGN KEY (type_id)
        REFERENCES public.building_types (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT buildings_users_fkey FOREIGN KEY (user_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.buildings
    OWNER to postgres;-- Table: public.resource_types

-- DROP TABLE public.resource_types;

CREATE TABLE public.resource_types
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT resource_pkey PRIMARY KEY (id),
    CONSTRAINT resource_types_name_key UNIQUE (name)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.resource_types
    OWNER to postgres;-- Table: public.resources

-- DROP TABLE public.resources;

CREATE TABLE public.resources
(
    user_id bigint NOT NULL,
    type_id smallint NOT NULL,
    count bigint,
    CONSTRAINT resources_pkey PRIMARY KEY (user_id, type_id)
        INCLUDE(count),
    CONSTRAINT resources_types_fkey FOREIGN KEY (type_id)
        REFERENCES public.resource_types (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT resources_users_fkey FOREIGN KEY (user_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.resources
    OWNER to postgres;-- Table: public.unit_types

-- DROP TABLE public.unit_types;

CREATE TABLE public.unit_types
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT unit_pkey PRIMARY KEY (id),
    CONSTRAINT unit_types_name_key UNIQUE (name)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.unit_types
    OWNER to postgres;-- Table: public.units

-- DROP TABLE public.units;

CREATE TABLE public.units
(
    user_id bigint NOT NULL,
    type_id smallint NOT NULL,
    count bigint,
    CONSTRAINT units_pkey PRIMARY KEY (user_id, type_id)
        INCLUDE(count),
    CONSTRAINT units_types_fkey FOREIGN KEY (type_id)
        REFERENCES public.unit_types (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT units_users_fkey FOREIGN KEY (user_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.units
    OWNER to postgres;INSERT INTO public.building_types (name)
    VALUES ('Farm'),('Quary'),('Mine'),('Basic Factory'),('Advanced Factory'),('Research Facility'),('Nuke Silo');

INSERT INTO public.resource_types (name)
    VALUES ('Land'),('Population'),('Wood'),('Stone'),('Iron'),('Aluminum'),('Uranimum');

INSERT INTO public.unit_types (name)
    VALUES ('Farmer'),('Soldier'),('Researcher'),('Tank'),('Jet'),('Nuke');

