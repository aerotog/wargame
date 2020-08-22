-- Table: public.units

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
    OWNER to postgres;