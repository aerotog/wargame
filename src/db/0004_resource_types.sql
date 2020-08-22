-- Table: public.resource_types

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
    OWNER to postgres;