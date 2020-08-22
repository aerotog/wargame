-- Table: public.resources

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
    OWNER to postgres;