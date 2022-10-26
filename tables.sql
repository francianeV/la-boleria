--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cakes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cakes (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    price numeric NOT NULL,
    image character varying(300) NOT NULL,
    description text,
    "flavourId" integer,
    CONSTRAINT cakes_price_check CHECK ((price > (0)::numeric))
);


--
-- Name: cakes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cakes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cakes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cakes_id_seq OWNED BY public.cakes.id;


--
-- Name: clients; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.clients (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    address character varying(300) NOT NULL,
    phone character varying(15) NOT NULL
);


--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;


--
-- Name: flavours; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.flavours (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


--
-- Name: flavours_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.flavours_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flavours_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.flavours_id_seq OWNED BY public.flavours.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    "clientId" integer,
    "cakeId" integer,
    quantity integer NOT NULL,
    "createAt" timestamp without time zone DEFAULT now(),
    "totalPrice" numeric,
    "isDelivered" boolean DEFAULT false,
    CONSTRAINT orders_quantity_check CHECK ((quantity >= 0))
);


--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: cakes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cakes ALTER COLUMN id SET DEFAULT nextval('public.cakes_id_seq'::regclass);


--
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);


--
-- Name: flavours id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flavours ALTER COLUMN id SET DEFAULT nextval('public.flavours_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Data for Name: cakes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cakes VALUES (2, 'Bolo de chocolate', 13, 'https://img1.gratispng.com/20171221/kxq/slice-of-chocolate-cake-png-picture-5a3bda00167c39.6395833015138718720921.jpg', 'Bolo de chocolate com recheio de leite ninho', 7);
INSERT INTO public.cakes VALUES (3, 'Bolo de maça', 13, 'https://img1.gratispng.com/20171221/kxq/slice-of-chocolate-cake-png-picture-5a3bda00167c39.6395833015138718720921.jpg', 'Bolo de chocolate com recheio de leite ninho', 7);
INSERT INTO public.cakes VALUES (4, 'Bolo de ninho', 13, 'https://img1.gratispng.com/20171221/kxq/slice-of-chocolate-cake-png-picture-5a3bda00167c39.6395833015138718720921.jpg', 'Bolo de chocolate com recheio de leite ninho', 1);
INSERT INTO public.cakes VALUES (5, 'Bolo de abacaxi', 13, 'https://img1.gratispng.com/20171221/kxq/slice-of-chocolate-cake-png-picture-5a3bda00167c39.6395833015138718720921.jpg', 'Bolo de chocolate com recheio de leite ninho', 1);
INSERT INTO public.cakes VALUES (6, 'Bolo de sq', 13, 'https://img1.gratispng.com/20171221/kxq/slice-of-chocolate-cake-png-picture-5a3bda00167c39.6395833015138718720921.jpg', 'Bolo de chocolate com recheio de leite ninho', 7);
INSERT INTO public.cakes VALUES (1, 'Bolo de morangooo', 13.45, 'https://i.pinimg.com/originals/28/91/6b/28916b1a063b43167deedcc6fe2aa04b.png', 'Bolo de chocolate com recheio de leite ninho', 7);


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.clients VALUES (1, 'Fulana', 'Rua tal', '2199999999');
INSERT INTO public.clients VALUES (2, 'Fulana', 'Rua tal', '2199999999');
INSERT INTO public.clients VALUES (3, 'Fulana', 'Rua tal', '2199999944');
INSERT INTO public.clients VALUES (4, 'Maria', 'Rua tal 2', '4563217890');


--
-- Data for Name: flavours; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.flavours VALUES (1, 'morango');
INSERT INTO public.flavours VALUES (7, 'chocolate');


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.orders VALUES (3, 4, 1, 2, '2022-10-21 03:48:57.111751', 26.90, false);
INSERT INTO public.orders VALUES (6, 3, 1, 3, '2022-10-22 03:08:35.131754', 40.35, false);
INSERT INTO public.orders VALUES (7, 3, 1, 3, '2022-10-22 03:08:36.959657', 40.35, false);
INSERT INTO public.orders VALUES (8, 2, 1, 2, '2022-10-23 00:54:45.383695', 26.90, false);
INSERT INTO public.orders VALUES (9, 1, 2, 2, '2022-10-23 01:48:36.976438', 26.00, false);
INSERT INTO public.orders VALUES (10, 1, 2, 2, '2022-10-23 01:48:42.500965', 26.00, false);
INSERT INTO public.orders VALUES (11, 1, 2, 2, '2022-10-23 01:48:43.17487', 26.00, false);
INSERT INTO public.orders VALUES (12, 1, 5, 2, '2022-10-23 01:49:11.369727', 26.00, false);
INSERT INTO public.orders VALUES (2, 1, 1, 2, '2022-10-21 03:43:58.634935', 26.90, true);
INSERT INTO public.orders VALUES (4, 3, 1, 3, '2022-10-21 03:50:08.787442', 40.35, true);
INSERT INTO public.orders VALUES (1, 1, 1, 2, '2022-10-21 03:42:23.471294', 26.9, true);
INSERT INTO public.orders VALUES (13, 1, 6, 2, '2022-10-23 01:49:28.801744', 26.00, true);
INSERT INTO public.orders VALUES (5, 3, 1, 3, '2022-10-21 18:55:25.596157', 40.35, true);


--
-- Name: cakes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cakes_id_seq', 6, true);


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.clients_id_seq', 4, true);


--
-- Name: flavours_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.flavours_id_seq', 7, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.orders_id_seq', 13, true);


--
-- Name: cakes cakes_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cakes
    ADD CONSTRAINT cakes_name_key UNIQUE (name);


--
-- Name: cakes cakes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cakes
    ADD CONSTRAINT cakes_pkey PRIMARY KEY (id);


--
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: flavours flavours_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flavours
    ADD CONSTRAINT flavours_name_key UNIQUE (name);


--
-- Name: flavours flavours_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.flavours
    ADD CONSTRAINT flavours_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: cakes cakes_flavourId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cakes
    ADD CONSTRAINT "cakes_flavourId_fkey" FOREIGN KEY ("flavourId") REFERENCES public.flavours(id);


--
-- Name: orders orders_cakeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "orders_cakeId_fkey" FOREIGN KEY ("cakeId") REFERENCES public.cakes(id);


--
-- Name: orders orders_clientId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "orders_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES public.clients(id);


--
-- PostgreSQL database dump complete
--

