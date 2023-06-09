-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.car
(
    id bigint NOT NULL,
    brand character varying(64) COLLATE pg_catalog."default",
    model character varying(64) COLLATE pg_catalog."default",
    ec integer,
    hp integer,
    mileage integer,
    status character varying(64) COLLATE pg_catalog."default",
    rent_price_per_day double precision,
    year_of_production integer,
    CONSTRAINT car_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.car_maintenance
(
    id bigint NOT NULL,
    car_id bigint,
    maintenance_description character varying(500) COLLATE pg_catalog."default",
    date_of_repair time with time zone,
    cost_of_repair double precision,
    CONSTRAINT car_maintenance_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.car_rent
(
    id bigint NOT NULL,
    user_id bigint,
    car_id bigint,
    date_start time with time zone,
    date_end time with time zone,
    time_rented timestamp with time zone,
    car_mileage_before integer,
    car_mileage_after integer,
    car_mileage_change integer,
    car_problem character varying(500) COLLATE pg_catalog."default",
    cost_of_rent double precision,
    rent_status character varying(64) COLLATE pg_catalog."default",
    CONSTRAINT car_rent_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public."user"
(
    id bigint NOT NULL,
    username character varying(32) COLLATE pg_catalog."default",
    password character varying(64) COLLATE pg_catalog."default",
    first_name character varying(32) COLLATE pg_catalog."default",
    last_name character varying(32) COLLATE pg_catalog."default",
    email character varying(64) COLLATE pg_catalog."default",
    is_superuser boolean,
    adress character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT user_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.car_maintenance
    ADD CONSTRAINT car_id FOREIGN KEY (car_id)
    REFERENCES public.car (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.car_rent
    ADD CONSTRAINT car_id FOREIGN KEY (car_id)
    REFERENCES public.car (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.car_rent
    ADD CONSTRAINT user_id FOREIGN KEY (user_id)
    REFERENCES public."user" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;