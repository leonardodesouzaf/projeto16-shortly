--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Homebrew)
-- Dumped by pg_dump version 14.5 (Homebrew)

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
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    token character varying(255) NOT NULL,
    "userId" integer NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    url text NOT NULL,
    "shortUrl" character varying(255) NOT NULL,
    "userId" integer NOT NULL,
    "visitCount" integer NOT NULL
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, '2022-10-15 17:19:32.482275', 'e388ecfa-ee84-4f88-8e5d-7c1b5de4566d', 1);
INSERT INTO public.sessions VALUES (2, '2022-10-16 18:42:12.944119', '88112791-7539-4d51-940f-5a3171e93d02', 12);


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (3, '2022-10-15 22:03:40.881179', 'https://google.com', 'wcABM_IB', 1, 4);
INSERT INTO public.urls VALUES (2, '2022-10-15 22:03:33.799113', 'https://github.com', '73lP1s2Y', 1, 4);
INSERT INTO public.urls VALUES (4, '2022-10-16 18:42:57.575776', 'https://google.com', 'YxmV5Aa0', 12, 0);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, '2022-10-15 17:18:39.545585', 'João', 'joao@driven.com', '$2b$10$jlxQGVU0zuQgWdQ0d5CWtOncaXxjHLaSNjJ4dSfwqIEMZApW5W5v2');
INSERT INTO public.users VALUES (2, '2022-10-16 18:30:37.98622', 'João', 'joao1@driven.com', '$2b$10$yRJGs9G77Awx/5nGCM7VhOTebkqWlUX0cPLXiJKLWJ4TMxmXqpvvK');
INSERT INTO public.users VALUES (3, '2022-10-16 18:30:43.011863', 'João', 'joao2@driven.com', '$2b$10$aCVZh2zM9Wu0di9NJQmR1OEtuS6dBglbh.c4WbDzPb1vHyih82KPK');
INSERT INTO public.users VALUES (4, '2022-10-16 18:30:47.625571', 'João', 'joao3@driven.com', '$2b$10$r12yydqQxLquOW.a5iXdWeaU.4YLoix/GESsNI2xiiDWLS7.GDS2G');
INSERT INTO public.users VALUES (5, '2022-10-16 18:30:51.229221', 'João', 'joao4@driven.com', '$2b$10$JQ95Bga22KlbG/NmX54xr.ncj1MK.2IH7I0zz60p7JuseszoEGSJO');
INSERT INTO public.users VALUES (6, '2022-10-16 18:30:54.713561', 'João', 'joao5@driven.com', '$2b$10$N1oS9BcC/LBCwyxfRj/dcOGSCkm0vsH2g8M8Rg81xxkMpJdGQJip.');
INSERT INTO public.users VALUES (7, '2022-10-16 18:30:58.658963', 'João', 'joao6@driven.com', '$2b$10$5TeJGilTVylYJmoyvNOEae51MRIhm7q1L7Ps4HItic6BfTztlqkue');
INSERT INTO public.users VALUES (8, '2022-10-16 18:31:03.0502', 'João', 'joao7@driven.com', '$2b$10$IR8Fi20ua7t3TLPDzUv5wuFdZe/ZvGti8w1k8liCSP7V1HmcB5Uza');
INSERT INTO public.users VALUES (9, '2022-10-16 18:31:07.210676', 'João', 'joao8@driven.com', '$2b$10$8EFXSvq4d.dNgjNtAFcyOuJA6imMg8Inht4fgNYHsgf5Ky1c4vIp.');
INSERT INTO public.users VALUES (10, '2022-10-16 18:31:11.210639', 'João', 'joao9@driven.com', '$2b$10$k/Lln7SiQYD77UwAC2BMF.H6uAFi8nO78lrVFfMCP3logBWcUgbAq');
INSERT INTO public.users VALUES (11, '2022-10-16 18:31:18.283113', 'João', 'joao10@driven.com', '$2b$10$nh7xWP4dbfe4woGM7eQRxOiEtvCns0V5FvfYRRz.W8MWr2t0mDCPe');
INSERT INTO public.users VALUES (12, '2022-10-16 18:31:21.339749', 'João', 'joao11@driven.com', '$2b$10$nBnRN9N6NEFkmZ7zBCHYKeKFfY6UGuxtYd25sGAqq5K4U6ZVwJd6e');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 2, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 4, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 12, true);


--
-- Name: sessions sessions_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pk PRIMARY KEY (id);


--
-- Name: urls urls_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pk PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- Name: sessions sessions_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_fk0 FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: urls urls_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_fk0 FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

