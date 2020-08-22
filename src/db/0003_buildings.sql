-- Table: public.buildings

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
    OWNER to postgres;