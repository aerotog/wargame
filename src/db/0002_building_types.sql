-- Table: public.building_types

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
    OWNER to postgres;