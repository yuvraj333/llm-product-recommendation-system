--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6 (Ubuntu 16.6-1.pgdg24.04+1)
-- Dumped by pg_dump version 16.6 (Ubuntu 16.6-1.pgdg24.04+1)

-- Started on 2024-12-16 10:01:51 +0545

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
-- TOC entry 224 (class 1259 OID 16447)
-- Name: product_recommendations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_recommendations (
    recommendation_id integer NOT NULL,
    user_id integer,
    product_id integer,
    recommendation_score numeric(5,2),
    recommended_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.product_recommendations OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16446)
-- Name: product_recommendations_recommendation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_recommendations_recommendation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_recommendations_recommendation_id_seq OWNER TO postgres;

--
-- TOC entry 3507 (class 0 OID 0)
-- Dependencies: 223
-- Name: product_recommendations_recommendation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_recommendations_recommendation_id_seq OWNED BY public.product_recommendations.recommendation_id;


--
-- TOC entry 220 (class 1259 OID 16421)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    category character varying(255),
    price numeric(10,2) NOT NULL,
    image_url text,
    stock_quantity integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16420)
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_product_id_seq OWNER TO postgres;

--
-- TOC entry 3508 (class 0 OID 0)
-- Dependencies: 219
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;


--
-- TOC entry 218 (class 1259 OID 16405)
-- Name: search_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.search_history (
    search_id integer NOT NULL,
    user_id integer,
    search_query text,
    search_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.search_history OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16404)
-- Name: search_history_search_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.search_history_search_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.search_history_search_id_seq OWNER TO postgres;

--
-- TOC entry 3509 (class 0 OID 0)
-- Dependencies: 217
-- Name: search_history_search_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.search_history_search_id_seq OWNED BY public.search_history.search_id;


--
-- TOC entry 226 (class 1259 OID 16465)
-- Name: user_feedback; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_feedback (
    feedback_id integer NOT NULL,
    user_id integer,
    product_id integer,
    feedback_type character varying(255),
    feedback_value integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.user_feedback OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16464)
-- Name: user_feedback_feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_feedback_feedback_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_feedback_feedback_id_seq OWNER TO postgres;

--
-- TOC entry 3510 (class 0 OID 0)
-- Dependencies: 225
-- Name: user_feedback_feedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_feedback_feedback_id_seq OWNED BY public.user_feedback.feedback_id;


--
-- TOC entry 222 (class 1259 OID 16432)
-- Name: user_preferences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_preferences (
    preference_id integer NOT NULL,
    user_id integer,
    preference_key character varying(255) NOT NULL,
    preference_value text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.user_preferences OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16431)
-- Name: user_preferences_preference_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_preferences_preference_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_preferences_preference_id_seq OWNER TO postgres;

--
-- TOC entry 3511 (class 0 OID 0)
-- Dependencies: 221
-- Name: user_preferences_preference_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_preferences_preference_id_seq OWNED BY public.user_preferences.preference_id;


--
-- TOC entry 216 (class 1259 OID 16391)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password_hash text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16390)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_id_seq OWNER TO postgres;

--
-- TOC entry 3512 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 3317 (class 2604 OID 16450)
-- Name: product_recommendations recommendation_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_recommendations ALTER COLUMN recommendation_id SET DEFAULT nextval('public.product_recommendations_recommendation_id_seq'::regclass);


--
-- TOC entry 3312 (class 2604 OID 16424)
-- Name: products product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- TOC entry 3310 (class 2604 OID 16408)
-- Name: search_history search_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.search_history ALTER COLUMN search_id SET DEFAULT nextval('public.search_history_search_id_seq'::regclass);


--
-- TOC entry 3319 (class 2604 OID 16468)
-- Name: user_feedback feedback_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_feedback ALTER COLUMN feedback_id SET DEFAULT nextval('public.user_feedback_feedback_id_seq'::regclass);


--
-- TOC entry 3315 (class 2604 OID 16435)
-- Name: user_preferences preference_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_preferences ALTER COLUMN preference_id SET DEFAULT nextval('public.user_preferences_preference_id_seq'::regclass);


--
-- TOC entry 3308 (class 2604 OID 16394)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 3499 (class 0 OID 16447)
-- Dependencies: 224
-- Data for Name: product_recommendations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_recommendations (recommendation_id, user_id, product_id, recommendation_score, recommended_at) FROM stdin;
1	1	1	95.50	2024-12-15 17:25:30.777293
2	1	2	88.75	2024-12-15 17:25:30.777293
3	2	3	92.00	2024-12-15 17:25:30.777293
4	3	4	89.00	2024-12-15 17:25:30.777293
5	4	5	80.00	2024-12-15 17:25:30.777293
\.


--
-- TOC entry 3495 (class 0 OID 16421)
-- Dependencies: 220
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (product_id, name, description, category, price, image_url, stock_quantity, created_at) FROM stdin;
1	Smartphone	High-quality smartphone with latest features.	electronics	499.99	image1.jpg	100	2024-12-15 17:24:25.100469
2	Laptop	Lightweight laptop with 8GB RAM and SSD.	electronics	899.99	image2.jpg	50	2024-12-15 17:24:25.100469
3	Running Shoes	Comfortable and lightweight running shoes.	fashion	59.99	image3.jpg	150	2024-12-15 17:24:25.100469
4	Headphones	Noise-cancelling over-ear headphones.	electronics	129.99	image4.jpg	75	2024-12-15 17:24:25.100469
5	Backpack	Durable backpack with multiple compartments.	fashion	49.99	image5.jpg	200	2024-12-15 17:24:25.100469
\.


--
-- TOC entry 3493 (class 0 OID 16405)
-- Dependencies: 218
-- Data for Name: search_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.search_history (search_id, user_id, search_query, search_date) FROM stdin;
1	1	latest smartphones under $500	2024-12-15 17:26:32.085398
2	2	best running shoes for women	2024-12-15 17:26:32.085398
3	3	affordable laptops for students	2024-12-15 17:26:32.085398
4	4	noise-cancelling headphones	2024-12-15 17:26:32.085398
5	5	durable backpacks for travel	2024-12-15 17:26:32.085398
\.


--
-- TOC entry 3501 (class 0 OID 16465)
-- Dependencies: 226
-- Data for Name: user_feedback; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_feedback (feedback_id, user_id, product_id, feedback_type, feedback_value, created_at) FROM stdin;
1	1	1	like	1	2024-12-15 17:26:03.362147
2	1	2	dislike	0	2024-12-15 17:26:03.362147
3	2	3	like	1	2024-12-15 17:26:03.362147
4	3	4	viewed	\N	2024-12-15 17:26:03.362147
5	4	5	like	1	2024-12-15 17:26:03.362147
\.


--
-- TOC entry 3497 (class 0 OID 16432)
-- Dependencies: 222
-- Data for Name: user_preferences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_preferences (preference_id, user_id, preference_key, preference_value, created_at) FROM stdin;
1	1	category	electronics	2024-12-15 17:25:08.221697
2	1	price_range	medium	2024-12-15 17:25:08.221697
3	2	category	fashion	2024-12-15 17:25:08.221697
4	3	price_range	low	2024-12-15 17:25:08.221697
5	4	category	electronics	2024-12-15 17:25:08.221697
\.


--
-- TOC entry 3491 (class 0 OID 16391)
-- Dependencies: 216
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, username, email, password_hash, created_at) FROM stdin;
1	johndoe	johndoe@example.com	password1	2024-12-15 17:23:10.91904
2	yuvi	yuvi@example.com	password2	2024-12-15 17:23:10.91904
3	alexsmith	alexsmith@example.com	password3	2024-12-15 17:23:10.91904
4	satya	satya@example.com	password4	2024-12-15 17:23:10.91904
5	michaelbrown	michaelbrown@example.com	password5	2024-12-15 17:23:10.91904
\.


--
-- TOC entry 3513 (class 0 OID 0)
-- Dependencies: 223
-- Name: product_recommendations_recommendation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_recommendations_recommendation_id_seq', 5, true);


--
-- TOC entry 3514 (class 0 OID 0)
-- Dependencies: 219
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_product_id_seq', 5, true);


--
-- TOC entry 3515 (class 0 OID 0)
-- Dependencies: 217
-- Name: search_history_search_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.search_history_search_id_seq', 5, true);


--
-- TOC entry 3516 (class 0 OID 0)
-- Dependencies: 225
-- Name: user_feedback_feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_feedback_feedback_id_seq', 5, true);


--
-- TOC entry 3517 (class 0 OID 0)
-- Dependencies: 221
-- Name: user_preferences_preference_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_preferences_preference_id_seq', 5, true);


--
-- TOC entry 3518 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 5, true);


--
-- TOC entry 3337 (class 2606 OID 16453)
-- Name: product_recommendations product_recommendations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_recommendations
    ADD CONSTRAINT product_recommendations_pkey PRIMARY KEY (recommendation_id);


--
-- TOC entry 3331 (class 2606 OID 16430)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- TOC entry 3329 (class 2606 OID 16413)
-- Name: search_history search_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.search_history
    ADD CONSTRAINT search_history_pkey PRIMARY KEY (search_id);


--
-- TOC entry 3340 (class 2606 OID 16471)
-- Name: user_feedback user_feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_feedback
    ADD CONSTRAINT user_feedback_pkey PRIMARY KEY (feedback_id);


--
-- TOC entry 3334 (class 2606 OID 16440)
-- Name: user_preferences user_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_preferences
    ADD CONSTRAINT user_preferences_pkey PRIMARY KEY (preference_id);


--
-- TOC entry 3322 (class 2606 OID 16403)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3324 (class 2606 OID 16399)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3326 (class 2606 OID 16401)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 3335 (class 1259 OID 16483)
-- Name: idx_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_product_id ON public.product_recommendations USING btree (product_id);


--
-- TOC entry 3327 (class 1259 OID 16485)
-- Name: idx_search_query; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_search_query ON public.search_history USING btree (search_query);


--
-- TOC entry 3338 (class 1259 OID 16484)
-- Name: idx_user_feedback; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_feedback ON public.user_feedback USING btree (user_id);


--
-- TOC entry 3332 (class 1259 OID 16482)
-- Name: idx_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_id ON public.user_preferences USING btree (user_id);


--
-- TOC entry 3343 (class 2606 OID 16459)
-- Name: product_recommendations product_recommendations_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_recommendations
    ADD CONSTRAINT product_recommendations_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON DELETE CASCADE;


--
-- TOC entry 3344 (class 2606 OID 16454)
-- Name: product_recommendations product_recommendations_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_recommendations
    ADD CONSTRAINT product_recommendations_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 3341 (class 2606 OID 16414)
-- Name: search_history search_history_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.search_history
    ADD CONSTRAINT search_history_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 3345 (class 2606 OID 16477)
-- Name: user_feedback user_feedback_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_feedback
    ADD CONSTRAINT user_feedback_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON DELETE CASCADE;


--
-- TOC entry 3346 (class 2606 OID 16472)
-- Name: user_feedback user_feedback_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_feedback
    ADD CONSTRAINT user_feedback_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- TOC entry 3342 (class 2606 OID 16441)
-- Name: user_preferences user_preferences_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_preferences
    ADD CONSTRAINT user_preferences_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


-- Completed on 2024-12-16 10:01:52 +0545

--
-- PostgreSQL database dump complete
--

