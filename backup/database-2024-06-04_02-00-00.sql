--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: basket_combos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.basket_combos (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "productId" integer,
    "pizzasSizesVariantId" integer,
    "comboId" integer,
    "basketId" integer
);


ALTER TABLE public.basket_combos OWNER TO postgres;

--
-- Name: basket_combos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.basket_combos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.basket_combos_id_seq OWNER TO postgres;

--
-- Name: basket_combos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.basket_combos_id_seq OWNED BY public.basket_combos.id;


--
-- Name: basket_pizza_dopProducts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."basket_pizza_dopProducts" (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "dodProductId" integer,
    "basketId" integer
);


ALTER TABLE public."basket_pizza_dopProducts" OWNER TO postgres;

--
-- Name: basket_pizza_dopProducts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."basket_pizza_dopProducts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."basket_pizza_dopProducts_id_seq" OWNER TO postgres;

--
-- Name: basket_pizza_dopProducts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."basket_pizza_dopProducts_id_seq" OWNED BY public."basket_pizza_dopProducts".id;


--
-- Name: baskets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.baskets (
    id integer NOT NULL,
    quantity integer DEFAULT 1,
    description character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "pizzasSizesVariantId" integer,
    "userId" integer,
    "productId" integer
);


ALTER TABLE public.baskets OWNER TO postgres;

--
-- Name: basket_pizzas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.basket_pizzas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.basket_pizzas_id_seq OWNER TO postgres;

--
-- Name: basket_pizzas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.basket_pizzas_id_seq OWNED BY public.baskets.id;


--
-- Name: combo_defaults; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.combo_defaults (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "pizzasSizesVariantId" integer,
    "productId" integer,
    "comboId" integer,
    "productsTypeId" integer
);


ALTER TABLE public.combo_defaults OWNER TO postgres;

--
-- Name: combo_defaults_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.combo_defaults_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.combo_defaults_id_seq OWNER TO postgres;

--
-- Name: combo_defaults_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.combo_defaults_id_seq OWNED BY public.combo_defaults.id;


--
-- Name: combos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.combos (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    price integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    img_url character varying(255)
);


ALTER TABLE public.combos OWNER TO postgres;

--
-- Name: combos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.combos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.combos_id_seq OWNER TO postgres;

--
-- Name: combos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.combos_id_seq OWNED BY public.combos.id;


--
-- Name: dod_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dod_products (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    price integer NOT NULL,
    img_url character varying(255) DEFAULT 'static/dopProduct/1.jpg'::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.dod_products OWNER TO postgres;

--
-- Name: dod_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dod_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dod_products_id_seq OWNER TO postgres;

--
-- Name: dod_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dod_products_id_seq OWNED BY public.dod_products.id;


--
-- Name: dop_product_pizzas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dop_product_pizzas (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "dodProductId" integer,
    "productId" integer
);


ALTER TABLE public.dop_product_pizzas OWNER TO postgres;

--
-- Name: dop_product_pizzas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dop_product_pizzas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dop_product_pizzas_id_seq OWNER TO postgres;

--
-- Name: dop_product_pizzas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dop_product_pizzas_id_seq OWNED BY public.dop_product_pizzas.id;


--
-- Name: order_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_products (
    id integer NOT NULL,
    quantity integer DEFAULT 1,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "orderId" integer,
    "pizzasSizesVariantId" integer,
    "productId" integer,
    price integer NOT NULL,
    description character varying(255)
);


ALTER TABLE public.order_products OWNER TO postgres;

--
-- Name: order_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_products_id_seq OWNER TO postgres;

--
-- Name: order_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_products_id_seq OWNED BY public.order_products.id;


--
-- Name: order_statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_statuses (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.order_statuses OWNER TO postgres;

--
-- Name: order_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_statuses_id_seq OWNER TO postgres;

--
-- Name: order_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_statuses_id_seq OWNED BY public.order_statuses.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    total_price integer NOT NULL,
    address character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer,
    "orderStatusId" integer,
    phone character varying NOT NULL,
    nomer character varying(255)
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: pizza_combos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pizza_combos (
    id integer NOT NULL,
    increase integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "pizzasSizeId" integer,
    "productId" integer,
    "comboId" integer
);


ALTER TABLE public.pizza_combos OWNER TO postgres;

--
-- Name: pizza_combos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pizza_combos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pizza_combos_id_seq OWNER TO postgres;

--
-- Name: pizza_combos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pizza_combos_id_seq OWNED BY public.pizza_combos.id;


--
-- Name: pizza_infos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pizza_infos (
    id integer NOT NULL,
    description character varying(255) NOT NULL,
    calories double precision NOT NULL,
    squirrels double precision NOT NULL,
    fats double precision NOT NULL,
    carbohydrates double precision NOT NULL,
    weight double precision NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.pizza_infos OWNER TO postgres;

--
-- Name: pizza_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pizza_infos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pizza_infos_id_seq OWNER TO postgres;

--
-- Name: pizza_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pizza_infos_id_seq OWNED BY public.pizza_infos.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    price integer NOT NULL,
    img_url character varying(255) DEFAULT 'static/product/1.jpg'::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "productsTypeId" integer,
    "pizzaInfoId" integer
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: pizzas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pizzas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pizzas_id_seq OWNER TO postgres;

--
-- Name: pizzas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pizzas_id_seq OWNED BY public.products.id;


--
-- Name: pizzas_sizes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pizzas_sizes (
    id integer NOT NULL,
    size character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "dopPrice" integer
);


ALTER TABLE public.pizzas_sizes OWNER TO postgres;

--
-- Name: pizzas_sizes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pizzas_sizes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pizzas_sizes_id_seq OWNER TO postgres;

--
-- Name: pizzas_sizes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pizzas_sizes_id_seq OWNED BY public.pizzas_sizes.id;


--
-- Name: pizzas_sizes_variants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pizzas_sizes_variants (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "productId" integer,
    "pizzasTypesVariantId" integer,
    "pizzasSizeId" integer
);


ALTER TABLE public.pizzas_sizes_variants OWNER TO postgres;

--
-- Name: pizzas_sizes_variants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pizzas_sizes_variants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pizzas_sizes_variants_id_seq OWNER TO postgres;

--
-- Name: pizzas_sizes_variants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pizzas_sizes_variants_id_seq OWNED BY public.pizzas_sizes_variants.id;


--
-- Name: pizzas_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pizzas_types (
    id integer NOT NULL,
    type character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.pizzas_types OWNER TO postgres;

--
-- Name: pizzas_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pizzas_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pizzas_types_id_seq OWNER TO postgres;

--
-- Name: pizzas_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pizzas_types_id_seq OWNED BY public.pizzas_types.id;


--
-- Name: pizzas_types_variants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pizzas_types_variants (
    id integer NOT NULL,
    price integer NOT NULL,
    img_url character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "pizzaInfoId" integer,
    "pizzasTypeId" integer
);


ALTER TABLE public.pizzas_types_variants OWNER TO postgres;

--
-- Name: pizzas_types_variants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pizzas_types_variants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pizzas_types_variants_id_seq OWNER TO postgres;

--
-- Name: pizzas_types_variants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pizzas_types_variants_id_seq OWNED BY public.pizzas_types_variants.id;


--
-- Name: products_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_types (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.products_types OWNER TO postgres;

--
-- Name: products_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_types_id_seq OWNER TO postgres;

--
-- Name: products_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_types_id_seq OWNED BY public.products_types.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255),
    email character varying(255) NOT NULL,
    role character varying(255) DEFAULT 'USER'::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    phone character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: basket_combos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_combos ALTER COLUMN id SET DEFAULT nextval('public.basket_combos_id_seq'::regclass);


--
-- Name: basket_pizza_dopProducts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."basket_pizza_dopProducts" ALTER COLUMN id SET DEFAULT nextval('public."basket_pizza_dopProducts_id_seq"'::regclass);


--
-- Name: baskets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baskets ALTER COLUMN id SET DEFAULT nextval('public.basket_pizzas_id_seq'::regclass);


--
-- Name: combo_defaults id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.combo_defaults ALTER COLUMN id SET DEFAULT nextval('public.combo_defaults_id_seq'::regclass);


--
-- Name: combos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.combos ALTER COLUMN id SET DEFAULT nextval('public.combos_id_seq'::regclass);


--
-- Name: dod_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dod_products ALTER COLUMN id SET DEFAULT nextval('public.dod_products_id_seq'::regclass);


--
-- Name: dop_product_pizzas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dop_product_pizzas ALTER COLUMN id SET DEFAULT nextval('public.dop_product_pizzas_id_seq'::regclass);


--
-- Name: order_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products ALTER COLUMN id SET DEFAULT nextval('public.order_products_id_seq'::regclass);


--
-- Name: order_statuses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_statuses ALTER COLUMN id SET DEFAULT nextval('public.order_statuses_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: pizza_combos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza_combos ALTER COLUMN id SET DEFAULT nextval('public.pizza_combos_id_seq'::regclass);


--
-- Name: pizza_infos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza_infos ALTER COLUMN id SET DEFAULT nextval('public.pizza_infos_id_seq'::regclass);


--
-- Name: pizzas_sizes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizzas_sizes ALTER COLUMN id SET DEFAULT nextval('public.pizzas_sizes_id_seq'::regclass);


--
-- Name: pizzas_sizes_variants id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizzas_sizes_variants ALTER COLUMN id SET DEFAULT nextval('public.pizzas_sizes_variants_id_seq'::regclass);


--
-- Name: pizzas_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizzas_types ALTER COLUMN id SET DEFAULT nextval('public.pizzas_types_id_seq'::regclass);


--
-- Name: pizzas_types_variants id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizzas_types_variants ALTER COLUMN id SET DEFAULT nextval('public.pizzas_types_variants_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.pizzas_id_seq'::regclass);


--
-- Name: products_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_types ALTER COLUMN id SET DEFAULT nextval('public.products_types_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: basket_combos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.basket_combos (id, "createdAt", "updatedAt", "productId", "pizzasSizesVariantId", "comboId", "basketId") FROM stdin;
15	2024-05-15 19:48:17.371+03	2024-05-15 19:48:17.371+03	\N	8	1	102
16	2024-05-15 19:48:17.371+03	2024-05-15 19:48:17.371+03	\N	3	1	102
23	2024-05-21 21:31:42.471+03	2024-05-21 21:31:42.471+03	\N	8	3	126
24	2024-05-21 21:31:42.471+03	2024-05-21 21:31:42.471+03	\N	23	3	126
25	2024-05-21 21:31:42.471+03	2024-05-21 21:31:42.471+03	\N	33	3	126
26	2024-05-21 21:31:42.471+03	2024-05-21 21:31:42.471+03	\N	27	3	126
44	2024-06-03 18:07:56.32+03	2024-06-03 18:07:56.32+03	\N	7	5	211
45	2024-06-03 18:07:56.32+03	2024-06-03 18:07:56.32+03	\N	32	5	211
\.


--
-- Data for Name: basket_pizza_dopProducts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."basket_pizza_dopProducts" (id, "createdAt", "updatedAt", "dodProductId", "basketId") FROM stdin;
176	2024-05-29 19:53:17.665+03	2024-05-29 19:53:17.665+03	3	200
138	2024-05-21 21:31:07.813+03	2024-05-21 21:31:07.813+03	11	125
140	2024-05-21 21:31:07.813+03	2024-05-21 21:31:07.813+03	10	125
161	2024-05-24 03:05:58.469+03	2024-05-24 03:05:58.469+03	2	170
162	2024-05-24 03:05:58.469+03	2024-05-24 03:05:58.469+03	1	170
163	2024-05-24 03:06:06.658+03	2024-05-24 03:06:06.658+03	3	171
\.


--
-- Data for Name: baskets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.baskets (id, quantity, description, "createdAt", "updatedAt", "pizzasSizesVariantId", "userId", "productId") FROM stdin;
170	1	30 см, Тонкое тесто, 390 г	2024-05-24 03:05:58.461+03	2024-05-24 03:05:58.461+03	4	13	\N
171	1	25 см, Традиционное тесто, 400 г	2024-05-24 03:06:06.654+03	2024-05-24 03:06:06.654+03	17	13	\N
172	1	400 г	2024-05-24 03:06:16.746+03	2024-05-24 03:06:16.746+03	\N	13	22
173	1	55 г	2024-05-24 03:06:23.137+03	2024-05-24 03:06:23.137+03	\N	13	29
174	1	100 г	2024-05-24 03:06:24.796+03	2024-05-24 03:06:24.796+03	\N	13	30
175	1	0.5 л	2024-05-24 03:06:29.276+03	2024-05-24 03:06:29.276+03	\N	13	40
176	1	0.025 г	2024-05-24 03:06:33.903+03	2024-05-24 03:06:33.903+03	\N	13	53
125	1	30 см, Традиционное тесто, 540 г	2024-05-21 21:31:07.81+03	2024-05-21 21:31:07.81+03	13	10	\N
126	1	Сырная, Чоризо фреш, Сырная цыпленок, 	2024-05-21 21:31:42.468+03	2024-05-21 21:31:42.468+03	\N	10	\N
127	1	0.5 л	2024-05-21 21:32:06.558+03	2024-05-21 21:32:06.558+03	\N	10	40
192	2	1 л	2024-05-26 18:17:21.225+03	2024-05-27 18:50:40.78+03	\N	2	47
195	1	0.025 г	2024-05-29 19:21:05.36+03	2024-05-29 19:21:05.36+03	\N	2	58
197	1	0.5 л	2024-05-29 19:28:31.889+03	2024-05-29 19:28:31.889+03	\N	2	38
128	1	30 см, Тонкое тесто, 390 г	2024-05-21 21:47:18.568+03	2024-05-21 21:47:18.568+03	9	\N	\N
104	2	0.025 г	2024-05-15 19:51:14.672+03	2024-05-16 00:37:52.274+03	\N	\N	54
107	1	0.5 л	2024-05-15 19:52:56.483+03	2024-05-16 00:54:00.503+03	\N	\N	38
108	3	55 г	2024-05-16 00:32:14.4+03	2024-05-16 01:11:29.929+03	\N	\N	29
102	1	Сырная, Ветчина и сыр.	2024-05-15 19:48:17.368+03	2024-05-15 19:53:15.352+03	\N	\N	\N
198	2	0.5 л	2024-05-29 19:30:47.72+03	2024-05-29 20:21:37.729+03	\N	2	39
201	1	100 г	2024-05-29 20:26:00.009+03	2024-05-29 20:26:00.009+03	\N	2	28
200	1	30 см, Тонкое тесто, 390 г	2024-05-29 19:53:17.656+03	2024-05-29 19:53:17.656+03	9	\N	\N
211	1	Сырная, Сырная цыпленок.	2024-06-03 18:07:56.316+03	2024-06-03 18:07:56.316+03	\N	17	\N
\.


--
-- Data for Name: combo_defaults; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.combo_defaults (id, "createdAt", "updatedAt", "pizzasSizesVariantId", "productId", "comboId", "productsTypeId") FROM stdin;
16	2024-05-14 03:34:29.55+03	2024-05-14 03:34:29.55+03	8	\N	1	1
17	2024-05-14 03:34:41.192+03	2024-05-14 03:34:41.192+03	3	\N	1	1
18	2024-05-14 03:35:09.263+03	2024-05-14 03:35:09.263+03	8	\N	3	1
19	2024-05-14 03:35:15.429+03	2024-05-14 03:35:15.429+03	3	\N	3	1
20	2024-05-14 03:35:23.733+03	2024-05-14 03:35:23.733+03	28	\N	3	1
21	2024-05-14 03:35:37.417+03	2024-05-14 03:35:37.417+03	7	\N	5	1
22	2024-05-14 03:35:43.952+03	2024-05-14 03:35:43.952+03	2	\N	5	1
23	2024-05-14 03:35:50.055+03	2024-05-14 03:35:50.055+03	27	\N	3	1
24	2024-05-14 03:36:05.112+03	2024-05-14 03:36:05.112+03	7	\N	6	1
25	2024-05-14 03:36:14.905+03	2024-05-14 03:36:14.905+03	2	\N	6	1
26	2024-05-14 03:36:37.758+03	2024-05-14 03:36:37.758+03	\N	38	6	4
27	2024-05-14 03:36:52.407+03	2024-05-14 03:36:52.407+03	2	\N	7	1
28	2024-05-14 03:37:04.492+03	2024-05-14 03:37:04.492+03	\N	38	7	4
29	2024-05-14 03:37:19.558+03	2024-05-14 03:37:19.558+03	\N	52	7	6
\.


--
-- Data for Name: combos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.combos (id, name, description, price, "createdAt", "updatedAt", img_url) FROM stdin;
1	2 пиццы	Парочка что надо. 2 средние пиццы. Цена комбо зависит от выбранных пицц и может быть увеличена	1099	2024-05-06 22:15:27.143+03	2024-05-07 18:05:57.339+03	2пиццы.jpg
3	3 пиццы	Три удовольствия в нашем меню — это 3 средние пиццы на ваш выбор. Цена комбо зависит от выбранных пицц и может быть увеличена	1199	2024-05-07 20:02:42.151+03	2024-05-07 20:02:42.151+03	3пиццы.jpg
5	3 пиццы 25 см	Настоящая дегустация. Три маленькие пиццы по суперцене. Цена комбо зависит от выбранных пицц и может быть увеличена	799	2024-05-08 12:45:11.352+03	2024-05-08 12:45:11.352+03	3пиццы25см.jpg
6	2 пиццы и напиток	Для уютных посиделок. 2 маленькие пиццы и напиток на выбор. Для компании из 2-4 человек. Цена комбо зависит от выбранных продуктов и может быть увеличена	839	2024-05-08 13:21:19.773+03	2024-05-08 13:21:19.773+03	2пиицыинапиток.jpg
7	Три в одном	Если хочется всего понемногу. Маленькая пицца, напиток и соус. Цена комбо зависит от выбранных продуктов и может быть увеличена	499	2024-05-08 15:06:34.352+03	2024-06-03 17:54:44.796+03	триводном.jpg
\.


--
-- Data for Name: dod_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dod_products (id, name, price, img_url, "createdAt", "updatedAt") FROM stdin;
1	Сырный бортик	179	c90c1d6d-858c-482a-a1cd-2737b69e00a3.png	2023-03-05 20:28:26.825+03	2023-03-05 20:28:26.825+03
2	Сливочная моцарелла	69	fcd068cb-a90e-4a1d-9464-4213033558a7.png	2023-03-05 20:29:35.079+03	2023-03-05 20:29:35.079+03
3	Чеддер и пармезан	69	ab4e962a-4d5f-4606-bfc6-bf186f38a275.png	2023-03-05 23:03:14.247+03	2023-03-05 23:03:14.247+03
4	Острый залапенью	49	42b86b09-046d-40c8-bb30-5d6bd925d6ea.png	2023-03-05 23:03:56.008+03	2023-03-05 23:03:56.008+03
5	Нежный цыпленок	69	c4321782-8fcf-4073-9d1d-c84f3b1da396.png	2023-03-05 23:04:31.988+03	2023-03-05 23:04:31.988+03
6	Пикантная пепперони	69	eae8b325-04dc-407a-8a10-272558d12986.png	2023-03-05 23:04:59.041+03	2023-03-05 23:04:59.041+03
7	Ветчина	69	940a2124-0112-4717-ae58-99fb019cb8bd.png	2023-03-05 23:05:16.199+03	2023-03-05 23:05:16.199+03
8	Шампиньоны	49	c0275540-02e0-447d-a6d2-f487bc876400.png	2023-03-05 23:05:41.296+03	2023-03-05 23:05:41.296+03
9	Острая чоризо	69	1aaaae6a-9a80-403b-89ed-11f60b24bcd9.png	2023-03-05 23:06:07.459+03	2023-03-05 23:06:07.459+03
10	Кубики брынзы	69	f255fdff-f6f9-4ae0-a295-646c37428def.png	2023-03-05 23:06:29.963+03	2023-03-05 23:06:29.963+03
11	Сыр блю чиз	69	7e00143f-2f2c-4386-9eb7-ea15d0d25e71.png	2023-03-05 23:06:50.875+03	2023-03-05 23:06:50.875+03
12	красный лук	69	2b85a178-3cac-49a5-9aea-0d7ecab1ef70.png	2023-03-05 23:07:11.7+03	2023-03-05 23:07:11.7+03
13	Сладкий перец	49	379203c4-8836-4782-bca8-8e2df974c21e.png	2023-03-05 23:07:36.236+03	2023-03-05 23:07:36.236+03
14	Сочные ананасы	49	6365c494-4dad-4a3a-94c7-164e5b81aa09.png	2023-03-05 23:07:54.705+03	2023-03-05 23:07:54.705+03
15	Итальянские травы	29	b57c45b1-a1fc-4f82-94b7-2a1e60d89e30.png	2023-03-05 23:08:14.554+03	2023-03-05 23:08:14.554+03
16	Маслины	49	91aafb46-cbf6-4186-8aa2-0e50f5e8afcf.png	2023-03-05 23:08:35.385+03	2023-03-05 23:08:35.385+03
17	Митболы	69	0701ac97-56e3-42de-a3c5-09f0311cc916.png	2023-03-05 23:09:00.261+03	2023-03-05 23:09:00.261+03
18	Буженина	69	e614d45f-6caf-43a0-b638-d11ff93f59eb.png	2023-03-05 23:09:21.792+03	2023-03-17 05:16:18.115+03
\.


--
-- Data for Name: dop_product_pizzas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dop_product_pizzas (id, "createdAt", "updatedAt", "dodProductId", "productId") FROM stdin;
1	2023-03-05 20:49:47.875+03	2023-03-05 20:49:47.875+03	1	1
127	2023-03-12 19:05:18.52+03	2023-03-12 19:05:18.52+03	18	7
128	2023-03-12 19:05:20.947+03	2023-03-12 19:05:20.947+03	17	7
3	2023-03-05 20:50:06.957+03	2023-03-05 20:50:06.957+03	2	1
4	2023-03-05 23:09:55.635+03	2023-03-05 23:09:55.635+03	3	1
5	2023-03-05 23:09:58.725+03	2023-03-05 23:09:58.725+03	4	1
6	2023-03-05 23:10:01.495+03	2023-03-05 23:10:01.495+03	5	1
7	2023-03-05 23:10:04.08+03	2023-03-05 23:10:04.08+03	6	1
8	2023-03-05 23:10:06.454+03	2023-03-05 23:10:06.454+03	7	1
9	2023-03-05 23:10:08.799+03	2023-03-05 23:10:08.799+03	8	1
10	2023-03-05 23:10:11.85+03	2023-03-05 23:10:11.85+03	9	1
11	2023-03-05 23:10:14.451+03	2023-03-05 23:10:14.451+03	10	1
12	2023-03-05 23:10:17.263+03	2023-03-05 23:10:17.263+03	11	1
13	2023-03-05 23:10:19.61+03	2023-03-05 23:10:19.61+03	12	1
14	2023-03-05 23:10:21.829+03	2023-03-05 23:10:21.829+03	13	1
15	2023-03-05 23:10:24.289+03	2023-03-05 23:10:24.289+03	14	1
16	2023-03-05 23:10:26.475+03	2023-03-05 23:10:26.475+03	15	1
17	2023-03-05 23:10:29.002+03	2023-03-05 23:10:29.002+03	16	1
18	2023-03-05 23:10:31.488+03	2023-03-05 23:10:31.488+03	17	1
19	2023-03-05 23:10:35.082+03	2023-03-05 23:10:35.082+03	18	1
20	2023-03-06 17:04:56.686+03	2023-03-06 17:04:56.686+03	1	2
21	2023-03-06 17:05:02.116+03	2023-03-06 17:05:02.116+03	2	2
22	2023-03-06 17:05:05.467+03	2023-03-06 17:05:05.467+03	3	2
23	2023-03-06 17:05:16.316+03	2023-03-06 17:05:16.316+03	4	2
24	2023-03-06 17:05:18.97+03	2023-03-06 17:05:18.97+03	5	2
25	2023-03-06 17:05:21.715+03	2023-03-06 17:05:21.715+03	6	2
26	2023-03-06 17:05:45.803+03	2023-03-06 17:05:45.803+03	7	2
27	2023-03-06 17:05:48.237+03	2023-03-06 17:05:48.237+03	8	2
28	2023-03-06 17:05:50.296+03	2023-03-06 17:05:50.296+03	9	2
29	2023-03-06 17:05:52.816+03	2023-03-06 17:05:52.816+03	10	2
30	2023-03-06 17:05:55.619+03	2023-03-06 17:05:55.619+03	11	2
31	2023-03-06 17:05:58.283+03	2023-03-06 17:05:58.283+03	12	2
32	2023-03-06 17:06:00.618+03	2023-03-06 17:06:00.618+03	13	2
33	2023-03-06 17:06:03.436+03	2023-03-06 17:06:03.436+03	14	2
34	2023-03-06 17:06:05.774+03	2023-03-06 17:06:05.774+03	15	2
35	2023-03-06 17:06:08.336+03	2023-03-06 17:06:08.336+03	16	2
36	2023-03-06 17:06:10.711+03	2023-03-06 17:06:10.711+03	17	2
37	2023-03-06 17:06:13.083+03	2023-03-06 17:06:13.083+03	18	2
38	2023-03-06 17:19:42.659+03	2023-03-06 17:19:42.659+03	1	3
39	2023-03-06 17:19:50.487+03	2023-03-06 17:19:50.487+03	2	3
40	2023-03-06 17:19:53.66+03	2023-03-06 17:19:53.66+03	3	3
41	2023-03-06 17:20:00.684+03	2023-03-06 17:20:00.684+03	4	3
42	2023-03-06 17:20:02.715+03	2023-03-06 17:20:02.715+03	5	3
43	2023-03-06 17:20:10.805+03	2023-03-06 17:20:10.805+03	6	3
44	2023-03-06 17:20:13.048+03	2023-03-06 17:20:13.048+03	7	3
45	2023-03-06 17:21:08.288+03	2023-03-06 17:21:08.288+03	8	3
46	2023-03-06 17:21:10.843+03	2023-03-06 17:21:10.843+03	9	3
47	2023-03-06 17:21:13.448+03	2023-03-06 17:21:13.448+03	10	3
48	2023-03-06 17:21:20.828+03	2023-03-06 17:21:20.828+03	11	3
49	2023-03-06 17:21:22.862+03	2023-03-06 17:21:22.862+03	12	3
50	2023-03-06 17:21:41.984+03	2023-03-06 17:21:41.984+03	13	3
51	2023-03-06 17:21:45.213+03	2023-03-06 17:21:45.213+03	14	3
52	2023-03-06 17:22:02.012+03	2023-03-06 17:22:02.012+03	15	3
53	2023-03-06 17:22:04.542+03	2023-03-06 17:22:04.542+03	16	3
54	2023-03-06 17:22:09.582+03	2023-03-06 17:22:09.582+03	17	3
55	2023-03-12 18:37:03.995+03	2023-03-12 18:37:03.995+03	17	4
56	2023-03-12 18:37:06.964+03	2023-03-12 18:37:06.964+03	16	4
57	2023-03-12 18:37:09.814+03	2023-03-12 18:37:09.814+03	15	4
58	2023-03-12 18:37:12.352+03	2023-03-12 18:37:12.352+03	14	4
59	2023-03-12 18:37:14.907+03	2023-03-12 18:37:14.907+03	13	4
60	2023-03-12 18:37:17.536+03	2023-03-12 18:37:17.536+03	12	4
61	2023-03-12 18:37:20.102+03	2023-03-12 18:37:20.102+03	11	4
62	2023-03-12 18:37:22.751+03	2023-03-12 18:37:22.751+03	10	4
63	2023-03-12 18:37:25.608+03	2023-03-12 18:37:25.608+03	9	4
64	2023-03-12 18:37:35.516+03	2023-03-12 18:37:35.516+03	8	4
65	2023-03-12 18:37:38.276+03	2023-03-12 18:37:38.276+03	7	4
66	2023-03-12 18:37:40.718+03	2023-03-12 18:37:40.718+03	6	4
67	2023-03-12 18:37:43.259+03	2023-03-12 18:37:43.259+03	5	4
68	2023-03-12 18:37:47.423+03	2023-03-12 18:37:47.423+03	4	4
69	2023-03-12 18:37:49.816+03	2023-03-12 18:37:49.816+03	3	4
70	2023-03-12 18:37:52.065+03	2023-03-12 18:37:52.065+03	2	4
71	2023-03-12 18:37:55.047+03	2023-03-12 18:37:55.047+03	1	4
72	2023-03-12 18:45:10.479+03	2023-03-12 18:45:10.479+03	1	5
73	2023-03-12 18:45:12.99+03	2023-03-12 18:45:12.99+03	2	5
74	2023-03-12 18:45:15.346+03	2023-03-12 18:45:15.346+03	3	5
75	2023-03-12 18:45:17.486+03	2023-03-12 18:45:17.486+03	4	5
76	2023-03-12 18:45:20.463+03	2023-03-12 18:45:20.463+03	5	5
77	2023-03-12 18:45:25.33+03	2023-03-12 18:45:25.33+03	6	5
78	2023-03-12 18:45:30.742+03	2023-03-12 18:45:30.742+03	7	5
79	2023-03-12 18:45:32.997+03	2023-03-12 18:45:32.997+03	8	5
80	2023-03-12 18:45:35.852+03	2023-03-12 18:45:35.852+03	9	5
81	2023-03-12 18:45:39.781+03	2023-03-12 18:45:39.781+03	10	5
82	2023-03-12 18:45:41.889+03	2023-03-12 18:45:41.889+03	11	5
83	2023-03-12 18:45:44.089+03	2023-03-12 18:45:44.089+03	12	5
84	2023-03-12 18:45:46.255+03	2023-03-12 18:45:46.255+03	13	5
85	2023-03-12 18:45:48.739+03	2023-03-12 18:45:48.739+03	14	5
86	2023-03-12 18:45:51.194+03	2023-03-12 18:45:51.194+03	15	5
87	2023-03-12 18:45:53.264+03	2023-03-12 18:45:53.264+03	16	5
88	2023-03-12 18:45:55.698+03	2023-03-12 18:45:55.698+03	17	5
89	2023-03-12 18:45:57.914+03	2023-03-12 18:45:57.914+03	18	5
90	2023-03-12 18:51:28.711+03	2023-03-12 18:51:28.711+03	18	8
91	2023-03-12 18:51:30.994+03	2023-03-12 18:51:30.994+03	17	8
92	2023-03-12 18:51:33.278+03	2023-03-12 18:51:33.278+03	16	8
93	2023-03-12 18:51:35.723+03	2023-03-12 18:51:35.723+03	15	8
94	2023-03-12 18:51:38.071+03	2023-03-12 18:51:38.071+03	14	8
95	2023-03-12 18:51:40.233+03	2023-03-12 18:51:40.233+03	13	8
96	2023-03-12 18:51:42.303+03	2023-03-12 18:51:42.303+03	12	8
97	2023-03-12 18:51:44.636+03	2023-03-12 18:51:44.636+03	11	8
98	2023-03-12 18:51:47.462+03	2023-03-12 18:51:47.462+03	10	8
99	2023-03-12 18:51:50.012+03	2023-03-12 18:51:50.012+03	9	8
100	2023-03-12 18:51:52.689+03	2023-03-12 18:51:52.689+03	8	8
101	2023-03-12 18:51:55.07+03	2023-03-12 18:51:55.07+03	7	8
102	2023-03-12 18:51:57.445+03	2023-03-12 18:51:57.445+03	6	8
103	2023-03-12 18:52:00.4+03	2023-03-12 18:52:00.4+03	5	8
104	2023-03-12 18:52:02.629+03	2023-03-12 18:52:02.629+03	4	8
105	2023-03-12 18:52:08.847+03	2023-03-12 18:52:08.847+03	4	8
106	2023-03-12 18:52:13.273+03	2023-03-12 18:52:13.273+03	3	8
107	2023-03-12 18:52:15.923+03	2023-03-12 18:52:15.923+03	2	8
108	2023-03-12 18:52:18.63+03	2023-03-12 18:52:18.63+03	1	8
109	2023-03-12 18:58:47.941+03	2023-03-12 18:58:47.941+03	1	6
110	2023-03-12 18:58:50.262+03	2023-03-12 18:58:50.262+03	2	6
111	2023-03-12 18:58:53.971+03	2023-03-12 18:58:53.971+03	3	6
112	2023-03-12 18:59:29.204+03	2023-03-12 18:59:29.204+03	4	6
113	2023-03-12 18:59:32.881+03	2023-03-12 18:59:32.881+03	5	6
114	2023-03-12 18:59:35.261+03	2023-03-12 18:59:35.261+03	6	6
115	2023-03-12 18:59:38.025+03	2023-03-12 18:59:38.025+03	7	6
116	2023-03-12 18:59:40.316+03	2023-03-12 18:59:40.316+03	8	6
117	2023-03-12 18:59:42.884+03	2023-03-12 18:59:42.884+03	9	6
118	2023-03-12 18:59:45.228+03	2023-03-12 18:59:45.228+03	10	6
119	2023-03-12 18:59:47.74+03	2023-03-12 18:59:47.74+03	11	6
120	2023-03-12 18:59:50.04+03	2023-03-12 18:59:50.04+03	12	6
121	2023-03-12 18:59:52.323+03	2023-03-12 18:59:52.323+03	13	6
122	2023-03-12 18:59:54.674+03	2023-03-12 18:59:54.674+03	14	6
123	2023-03-12 18:59:57.089+03	2023-03-12 18:59:57.089+03	15	6
124	2023-03-12 18:59:59.634+03	2023-03-12 18:59:59.634+03	16	6
125	2023-03-12 19:00:02.148+03	2023-03-12 19:00:02.148+03	17	6
126	2023-03-12 19:00:04.552+03	2023-03-12 19:00:04.552+03	18	6
129	2023-03-12 19:05:23.208+03	2023-03-12 19:05:23.208+03	16	7
130	2023-03-12 19:05:25.629+03	2023-03-12 19:05:25.629+03	15	7
131	2023-03-12 19:05:28.52+03	2023-03-12 19:05:28.52+03	14	7
132	2023-03-12 19:05:34.653+03	2023-03-12 19:05:34.653+03	13	7
133	2023-03-12 19:05:37.017+03	2023-03-12 19:05:37.017+03	12	7
134	2023-03-12 19:05:40.136+03	2023-03-12 19:05:40.136+03	11	7
135	2023-03-12 19:05:42.6+03	2023-03-12 19:05:42.6+03	10	7
136	2023-03-12 19:05:45.222+03	2023-03-12 19:05:45.222+03	9	7
137	2023-03-12 19:05:47.563+03	2023-03-12 19:05:47.563+03	8	7
138	2023-03-12 19:05:50.24+03	2023-03-12 19:05:50.24+03	7	7
139	2023-03-12 19:05:52.571+03	2023-03-12 19:05:52.571+03	6	7
140	2023-03-12 19:05:54.7+03	2023-03-12 19:05:54.7+03	5	7
141	2023-03-12 19:05:56.979+03	2023-03-12 19:05:56.979+03	4	7
142	2023-03-12 19:05:59.142+03	2023-03-12 19:05:59.142+03	3	7
143	2023-03-12 19:06:01.388+03	2023-03-12 19:06:01.388+03	2	7
144	2023-03-12 19:06:03.32+03	2023-03-12 19:06:03.32+03	1	7
145	2024-05-20 22:04:21.428+03	2024-05-20 22:04:21.428+03	1	\N
\.


--
-- Data for Name: order_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_products (id, quantity, "createdAt", "updatedAt", "orderId", "pizzasSizesVariantId", "productId", price, description) FROM stdin;
37	1	2024-05-06 21:48:31.863+03	2024-05-06 21:48:31.863+03	24	\N	\N	648	\N
38	1	2024-05-06 21:48:31.863+03	2024-05-06 21:48:31.863+03	24	\N	28	199	\N
39	1	2024-05-15 17:28:54.178+03	2024-05-15 17:28:54.178+03	25	\N	14	189	\N
40	1	2024-05-15 17:28:54.178+03	2024-05-15 17:28:54.178+03	25	\N	15	189	\N
41	1	2024-05-15 17:28:54.178+03	2024-05-15 17:28:54.178+03	25	\N	39	105	\N
42	1	2024-05-15 17:28:54.178+03	2024-05-15 17:28:54.178+03	25	\N	52	45	\N
43	1	2024-05-20 16:52:01.01+03	2024-05-20 16:52:01.01+03	\N	\N	13	199	\N
44	2	2024-05-20 16:52:01.01+03	2024-05-20 16:52:01.01+03	\N	\N	14	189	\N
45	1	2024-05-20 16:52:01.011+03	2024-05-20 16:52:01.011+03	\N	\N	\N	1349	\N
46	1	2024-05-20 16:52:01.011+03	2024-05-20 16:52:01.011+03	\N	\N	\N	767	\N
47	1	2024-05-20 16:52:01.011+03	2024-05-20 16:52:01.011+03	\N	\N	\N	699	\N
48	1	2024-05-20 16:55:48.132+03	2024-05-20 16:55:48.132+03	\N	\N	13	199	\N
49	2	2024-05-20 16:55:48.132+03	2024-05-20 16:55:48.132+03	\N	\N	14	189	\N
50	1	2024-05-20 16:55:48.132+03	2024-05-20 16:55:48.132+03	\N	\N	\N	1349	\N
51	1	2024-05-20 16:55:48.132+03	2024-05-20 16:55:48.132+03	\N	\N	\N	609	\N
52	1	2024-05-20 16:55:48.132+03	2024-05-20 16:55:48.132+03	\N	\N	\N	699	\N
53	1	2024-05-20 16:59:25.557+03	2024-05-20 16:59:25.557+03	28	\N	13	199	\N
54	2	2024-05-20 16:59:25.557+03	2024-05-20 16:59:25.557+03	28	\N	14	189	\N
55	1	2024-05-20 16:59:25.557+03	2024-05-20 16:59:25.557+03	28	\N	\N	1349	\N
56	1	2024-05-20 16:59:25.558+03	2024-05-20 16:59:25.558+03	28	\N	\N	609	\N
57	1	2024-05-20 16:59:25.558+03	2024-05-20 16:59:25.558+03	28	\N	\N	699	\N
58	1	2024-05-20 17:00:52.867+03	2024-05-20 17:00:52.867+03	\N	\N	38	105	\N
\.


--
-- Data for Name: order_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_statuses (id, name, "createdAt", "updatedAt") FROM stdin;
1	Обработка	2023-05-15 02:26:00.232+03	2023-05-15 02:26:00.232+03
2	Готовка	2023-05-15 02:26:06.815+03	2023-05-15 02:26:06.815+03
3	Готов к выдаче	2023-05-15 02:26:13.955+03	2023-05-15 02:26:13.955+03
4	Получен	2023-05-15 02:26:17.838+03	2023-05-15 02:26:17.838+03
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, total_price, address, "createdAt", "updatedAt", "userId", "orderStatusId", phone, nomer) FROM stdin;
58	597	Архангельская обл, рп Плесецк	2024-05-24 04:10:38.854+03	2024-05-24 04:11:50.109+03	11	1	76431346765	.ahFJPc7gy-58
59	600	Архангельская обл, рп Плесецк	2024-05-26 15:49:02.766+03	2024-06-03 17:38:40.14+03	2	1	79110189847	Ox5LdpDWkK-59
57	135	Архангельская обл, рп Плесецк	2024-05-24 03:43:37.752+03	2024-06-03 17:38:40.14+03	2	1	79110189847	o8VpeWuzGP-57
24	847	г Санкт-Петербург, 5-й Предпортовый проезд, д 2	2024-05-06 21:48:31.856+03	2024-06-03 17:38:40.14+03	2	4	79110189847	pQk45m78ng-24
52	45	г Санкт-Петербург, ул Плесецкая	2024-05-24 02:36:04.655+03	2024-06-03 17:38:40.14+03	2	1	79110189847	XQkY8mJDng-52
25	528	г Санкт-Петербург, ул Плесецкая, д 20 к 1 стр 1	2024-05-15 17:28:54.164+03	2024-06-03 17:38:40.14+03	2	1	79110189847	pok456JDng-25
64	7442	Архангельская обл, рп Плесецк	2024-06-03 17:24:51.487+03	2024-06-03 17:40:15.574+03	\N	1	79110189847	V6uqNzEGYm-64
61	995	г Санкт-Петербург, ул Плесецкая, д 202	2024-05-29 17:25:57.228+03	2024-06-03 17:40:15.575+03	\N	1	79110189847	fH7isZU33X-61
60	1112	Архангельская обл, рп Плесецк	2024-05-29 17:04:15.828+03	2024-06-03 17:40:15.575+03	\N	1	79110189847	Yvf0Kg6fMY-60
62	998	г Санкт-Петербург, ул Плесецкая	2024-06-02 18:47:33.299+03	2024-06-03 17:40:15.575+03	\N	1	79110189847	ShoyMsncjL-62
45	1483	г Санкт-Петербург, ул Плесецкая, д 20 к 1 стр 1	2024-05-24 00:13:56.975+03	2024-06-03 17:40:15.581+03	17	1	79110189846	XQk45mport-45
50	3048	Донецкая Народная респ	2024-05-24 01:53:03.07+03	2024-05-24 01:53:03.07+03	12	1	79119682235	XQk45mJDng-50
49	105	г Санкт-Петербург, ул Оптиков, д 30 стр 1	2024-05-24 01:14:41.862+03	2024-05-24 01:14:41.862+03	14	1	79111502594	WSk45mJDng-49
28	3234	г Санкт-Петербург, 5-й Предпортовый проезд	2024-05-20 16:59:25.545+03	2024-06-03 17:40:15.581+03	17	1	79110189846	po675mJDng-28
65	3235	Архангельская обл, рп Плесецк	2024-06-03 18:05:59.47+03	2024-06-03 18:05:59.486+03	17	1	79110189846	A47b3lNiUg-65
46	569	г Москва	2024-05-24 00:16:17.335+03	2024-05-24 02:11:22.543+03	12	1	79119682237	plk45mJDng-46
47	967	Луганская Народная респ	2024-05-24 00:19:57.844+03	2024-05-24 02:11:22.543+03	12	1	79119682237	XQk89mJgng-47
48	885	г Санкт-Петербург, ул Оптиков, д 30 стр 1	2024-05-24 00:54:50.8+03	2024-05-24 00:57:27.451+03	14	3	79111502594	XQk45mPOng-48
\.


--
-- Data for Name: pizza_combos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pizza_combos (id, increase, "createdAt", "updatedAt", "pizzasSizeId", "productId", "comboId") FROM stdin;
17	0	2024-05-07 22:33:30.621+03	2024-05-07 22:33:30.621+03	2	1	1
18	0	2024-05-07 22:33:44.708+03	2024-05-07 22:33:44.708+03	2	2	1
19	150	2024-05-07 22:34:08.528+03	2024-05-07 22:34:08.528+03	2	3	1
20	50	2024-05-07 22:34:20.57+03	2024-05-07 22:34:20.57+03	2	4	1
21	50	2024-05-07 22:34:44.147+03	2024-05-07 22:34:44.147+03	2	5	1
22	0	2024-05-07 22:34:55.468+03	2024-05-07 22:34:55.468+03	2	8	1
23	100	2024-05-07 22:35:05.551+03	2024-05-07 22:35:05.551+03	2	7	1
24	200	2024-05-07 22:35:19.276+03	2024-05-07 22:35:19.276+03	2	6	1
26	0	2024-05-08 12:41:37.961+03	2024-05-08 12:41:37.961+03	2	1	3
25	0	2024-05-08 12:41:29.433+03	2024-05-08 12:41:41.865+03	2	2	3
27	0	2024-05-08 12:42:02.838+03	2024-05-08 12:42:02.838+03	2	8	3
28	50	2024-05-08 12:42:13.302+03	2024-05-08 12:42:13.302+03	2	5	3
29	50	2024-05-08 12:42:21.838+03	2024-05-08 12:42:21.838+03	2	4	3
30	100	2024-05-08 12:42:30.874+03	2024-05-08 12:42:30.874+03	2	7	3
31	150	2024-05-08 12:42:42.308+03	2024-05-08 12:42:42.308+03	2	3	3
32	200	2024-05-08 12:42:53.993+03	2024-05-08 12:42:53.993+03	2	6	3
33	0	2024-05-08 12:45:47.792+03	2024-05-08 12:45:47.792+03	1	2	5
34	0	2024-05-08 12:45:55.276+03	2024-05-08 12:45:55.276+03	1	1	5
35	0	2024-05-08 12:46:02.823+03	2024-05-08 12:46:02.823+03	1	8	5
41	50	2024-05-08 13:09:11.442+03	2024-05-08 13:09:11.442+03	1	5	5
42	50	2024-05-08 13:09:40.313+03	2024-05-08 13:09:40.313+03	1	4	5
43	100	2024-05-08 13:09:52.93+03	2024-05-08 13:09:52.93+03	1	7	5
44	150	2024-05-08 13:10:09.974+03	2024-05-08 13:10:09.974+03	1	3	5
45	200	2024-05-08 13:10:27.341+03	2024-05-08 13:10:27.341+03	1	6	5
46	0	2024-05-08 13:24:26.155+03	2024-05-08 13:24:26.155+03	1	2	6
47	0	2024-05-08 13:24:37.843+03	2024-05-08 13:24:37.843+03	1	1	6
48	0	2024-05-08 13:24:49.811+03	2024-05-08 13:24:49.811+03	1	8	6
49	50	2024-05-08 13:25:00.059+03	2024-05-08 13:25:00.059+03	1	5	6
50	100	2024-05-08 13:25:08.225+03	2024-05-08 13:25:08.225+03	1	4	6
51	100	2024-05-08 13:25:20.041+03	2024-05-08 13:25:20.041+03	1	7	6
52	150	2024-05-08 13:25:27.248+03	2024-05-08 13:25:27.248+03	1	3	6
53	200	2024-05-08 13:25:36.761+03	2024-05-08 13:25:36.761+03	1	6	6
65	0	2024-05-08 13:43:06.71+03	2024-05-08 13:43:06.71+03	\N	38	6
66	0	2024-05-08 14:23:11.577+03	2024-05-08 14:23:11.577+03	\N	39	6
67	0	2024-05-08 14:23:18.945+03	2024-05-08 14:23:18.945+03	\N	40	6
68	0	2024-05-08 14:23:27.337+03	2024-05-08 14:23:27.337+03	\N	41	6
69	0	2024-05-08 14:23:39.92+03	2024-05-08 14:23:39.92+03	\N	42	6
70	50	2024-05-08 14:24:04.564+03	2024-05-08 14:24:04.564+03	\N	44	6
71	50	2024-05-08 14:24:10.742+03	2024-05-08 14:24:10.742+03	\N	45	6
73	50	2024-05-08 14:24:32.295+03	2024-05-08 14:24:32.295+03	\N	51	6
74	50	2024-05-08 14:24:39.396+03	2024-05-08 14:24:39.396+03	\N	49	6
75	50	2024-05-08 14:24:49.489+03	2024-05-08 14:24:49.489+03	\N	50	6
76	0	2024-05-08 15:17:37.451+03	2024-05-08 15:17:37.451+03	1	2	7
77	0	2024-05-08 15:17:47.165+03	2024-05-08 15:17:47.165+03	1	1	7
78	0	2024-05-08 15:17:54.704+03	2024-05-08 15:17:54.704+03	1	8	7
79	50	2024-05-08 15:18:04.256+03	2024-05-08 15:18:04.256+03	1	5	7
80	50	2024-05-08 15:18:11.691+03	2024-05-08 15:18:11.691+03	1	4	7
81	100	2024-05-08 15:18:19.934+03	2024-05-08 15:18:19.934+03	1	7	7
82	150	2024-05-08 15:18:28.399+03	2024-05-08 15:18:28.399+03	1	3	7
84	0	2024-05-08 15:19:32.36+03	2024-05-08 15:19:32.36+03	\N	38	7
85	0	2024-05-08 15:19:38.916+03	2024-05-08 15:19:38.916+03	\N	40	7
86	0	2024-05-08 15:19:44.897+03	2024-05-08 15:19:44.897+03	\N	39	7
87	0	2024-05-08 15:19:51.977+03	2024-05-08 15:19:51.977+03	\N	41	7
88	0	2024-05-08 15:20:00.217+03	2024-05-08 15:20:00.217+03	\N	42	7
89	0	2024-05-08 15:20:45.512+03	2024-05-08 15:20:45.512+03	\N	52	7
90	0	2024-05-08 15:20:54.969+03	2024-05-08 15:20:54.969+03	\N	53	7
92	20	2024-05-08 15:21:19.531+03	2024-05-08 15:21:19.531+03	\N	54	7
93	50	2024-05-08 15:36:03.96+03	2024-05-08 15:36:03.96+03	\N	44	7
94	50	2024-05-08 15:36:09.684+03	2024-05-08 15:39:04.815+03	\N	45	7
99	50	2024-05-08 15:37:43.957+03	2024-05-08 15:39:42.098+03	\N	50	7
97	50	2024-05-08 15:37:28.994+03	2024-05-18 15:30:45.597+03	\N	51	7
91	20	2024-05-08 15:21:12.183+03	2024-05-08 15:21:12.183+03	\N	58	7
83	210	2024-05-08 15:18:41.499+03	2024-06-03 17:49:27.901+03	1	6	7
98	50	2024-05-08 15:37:36.079+03	2024-06-03 17:54:19.091+03	\N	49	7
\.


--
-- Data for Name: pizza_infos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pizza_infos (id, description, calories, squirrels, fats, carbohydrates, weight, "createdAt", "updatedAt") FROM stdin;
3	Ветчина, моцарелла, фирменный соус альфредо	276.3	10.4	9.5	35.5	330	2023-03-04 17:50:52.032+03	2023-03-04 17:50:52.032+03
4	Ветчина, моцарелла, фирменный соус альфредо	274	10.3	9.7	34.6	500	2023-03-04 17:52:05.636+03	2023-03-04 17:52:05.636+03
5	Ветчина, моцарелла, фирменный соус альфредо	279.4	11.4	11.4	30.8	390	2023-03-04 17:56:02.007+03	2023-03-04 17:56:02.007+03
6	Ветчина, моцарелла, фирменный соус альфредо	271.8	10	9.6	34.5	670	2023-03-04 17:57:57.184+03	2023-03-04 17:57:57.184+03
7	Ветчина, моцарелла, фирменный соус альфредо	277.7	10.9	10.9	32	550	2023-03-04 18:10:06.563+03	2023-03-04 18:10:06.563+03
8	Моцарелла, сыры чеддер и пармезан, фирменный соус альфредо	277.5	10	9.8	35.5	330	2023-03-06 16:49:28.833+03	2023-03-06 16:49:28.833+03
9	Моцарелла, сыры чеддер и пармезан, фирменный соус альфредо	284.1	10.4	10.4	35.3	490	2023-03-06 16:52:09.315+03	2023-03-06 16:52:09.315+03
10	Моцарелла, сыры чеддер и пармезан, фирменный соус альфредо	285	11.2	12.1	30.8	390	2023-03-06 16:52:42.132+03	2023-03-06 16:52:42.132+03
11	Моцарелла, сыры чеддер и пармезан, фирменный соус альфредо	281.3	10.2	10.5	34.5	670	2023-03-06 16:53:18.406+03	2023-03-06 16:53:18.406+03
12	Моцарелла, сыры чеддер и пармезан, фирменный соус альфредо	289.3	11.2	12.1	32	550	2023-03-06 16:53:54.94+03	2023-03-06 16:53:54.94+03
13	Цыпленок, моцарелла, соус альфредо	258.8	10.9	8.6	32.7	360	2023-03-06 17:12:18.544+03	2023-03-06 17:12:18.544+03
14	Цыпленок, моцарелла, соус альфредо	260.3	8.9	8.9	32.2	540	2023-03-06 17:12:58.335+03	2023-03-06 17:12:58.335+03
15	Цыпленок, моцарелла, соус альфредо	255.7	12.2	10	27.5	440	2023-03-06 17:13:41.467+03	2023-03-06 17:13:41.467+03
16	Цыпленок, моцарелла, соус альфредо	257.9	11.5	8.4	32.4	730	2023-03-06 17:15:41.025+03	2023-03-06 17:15:41.025+03
17	Цыпленок, моцарелла, соус альфредо	251.4	11.9	9.4	28.1	630	2023-03-06 17:17:09.216+03	2023-03-06 17:17:09.216+03
18	Пикантная пепперони, увеличенная порция моцареллы, томаты, фирменный томатный соус	255.3	10.2	9.7	30	400	2023-03-12 18:27:56.323+03	2023-03-12 18:27:56.323+03
19	Пикантная пепперони, увеличенная порция моцареллы, томаты, фирменный томатный соус	249.3	10.1	9.5	29.1	610	2023-03-12 18:30:07.426+03	2023-03-12 18:30:07.426+03
20	Пикантная пепперони, увеличенная порция моцареллы, томаты, фирменный томатный соус	248	11	10.8	24.9	500	2023-03-12 18:31:07.67+03	2023-03-12 18:31:07.67+03
21	Пикантная пепперони, увеличенная порция моцареллы, томаты, фирменный томатный соус	244.6	9.7	9.2	29	820	2023-03-12 18:32:37.149+03	2023-03-12 18:32:37.149+03
22	Пикантная пепперони, увеличенная порция моцареллы, томаты, фирменный томатный соус	244.6	10.4	10.2	26.1	700	2023-03-12 18:33:52.476+03	2023-03-12 18:33:52.476+03
23	Фирменный томатный соус, моцарелла, острая чоризо, сладкий перец	259.6	9.7	8	35.4	340	2023-03-12 18:41:09.037+03	2023-03-12 18:41:09.037+03
24	Фирменный томатный соус, моцарелла, острая чоризо, сладкий перец	267.9	10.1	8.4	36.3	490	2023-03-12 18:42:03.491+03	2023-03-12 18:42:03.491+03
25	Фирменный томатный соус, моцарелла, острая чоризо, сладкий перец	264.7	11	9.5	32	390	2023-03-12 18:43:27.692+03	2023-03-12 18:43:27.692+03
26	Фирменный томатный соус, моцарелла, острая чоризо, сладкий перец	267.1	9.9	8.2	36.6	650	2023-03-12 18:44:12.574+03	2023-03-12 18:44:12.574+03
27	Фирменный томатный соус, моцарелла, острая чоризо, сладкий перец	272	10.8	9.3	34.5	530	2023-03-12 18:45:02.491+03	2023-03-12 18:45:02.491+03
28	Ветчина, маринованные огурчики, томаты, красный лук, чеснок, соус бургер, моцарелла, фирменный томатный соус	190.2	7	5.2	27.6	430	2023-03-12 18:48:40.476+03	2023-03-12 18:48:40.476+03
29	Ветчина, маринованные огурчики, томаты, красный лук, чеснок, соус бургер, моцарелла, фирменный томатный соус	187.9	7	5.2	27	650	2023-03-12 18:49:10.901+03	2023-03-12 18:49:10.901+03
30	Ветчина, маринованные огурчики, томаты, красный лук, чеснок, соус бургер, моцарелла, фирменный томатный соус	171	7	5.5	22.3	550	2023-03-12 18:49:47.429+03	2023-03-12 18:49:47.429+03
31	Ветчина, маринованные огурчики, томаты, красный лук, чеснок, соус бургер, моцарелла, фирменный томатный соус	182.5	6.6	4.9	26.7	880	2023-03-12 18:50:26.981+03	2023-03-12 18:50:26.981+03
32	Ветчина, маринованные огурчики, томаты, красный лук, чеснок, соус бургер, моцарелла, фирменный томатный соус	170.5	6.7	5.1	23.3	770	2023-03-12 18:51:18.825+03	2023-03-12 18:51:18.825+03
33	Цыпленок, моцарелла, сыры чеддер и пармезан, сырный соус, томаты, фирменный соус альфредо, чеснок	249.4	11.2	8.8	29.6	440	2023-03-12 18:54:35.291+03	2023-03-12 18:54:35.291+03
34	Цыпленок, моцарелла, сыры чеддер и пармезан, сырный соус, томаты, фирменный соус альфредо, чеснок	246.1	11.2	8.9	28.7	610	2023-03-12 18:55:08.805+03	2023-03-12 18:55:08.805+03
35	Цыпленок, моцарелла, сыры чеддер и пармезан, сырный соус, томаты, фирменный соус альфредо, чеснок	234.7	11.7	9.7	23.5	520	2023-03-12 18:56:36.892+03	2023-03-12 18:56:36.892+03
36	Цыпленок, моцарелла, сыры чеддер и пармезан, сырный соус, томаты, фирменный соус альфредо, чеснок	234	11	8.6	26.6	870	2023-03-12 18:57:56.418+03	2023-03-12 18:57:56.418+03
37	Цыпленок, моцарелла, сыры чеддер и пармезан, сырный соус, томаты, фирменный соус альфредо, чеснок	230.7	11.6	9.3	23.6	760	2023-03-12 18:58:38.181+03	2023-03-12 18:58:38.181+03
38	Цыпленок, моцарелла, сыры чеддер и пармезан, сырный соус, томаты, фирменный соус альфредо, чеснок	298.5	9.4	9.4	28	430	2023-03-12 19:02:15.026+03	2023-03-12 19:02:15.026+03
72		32	0	0	8	0.5	2023-03-15 03:20:03.576+03	2023-03-15 03:20:03.576+03
39	Бекон, сыры чеддер и пармезан, моцарелла, томаты, красный лук, чеснок, фирменный соус альфредо, итальянские травы	294.4	9.4	15.3	27.3	640	2023-03-12 19:02:56.948+03	2023-03-12 19:02:56.948+03
40	Бекон, сыры чеддер и пармезан, моцарелла, томаты, красный лук, чеснок, фирменный соус альфредо, итальянские травы	302.5	10	17.7	23.6	530	2023-03-12 19:03:48.755+03	2023-03-12 19:03:48.755+03
41	Бекон, сыры чеддер и пармезан, моцарелла, томаты, красный лук, чеснок, фирменный соус альфредо, итальянские травы	295.2	9.3	15.7	27.1	880	2023-03-12 19:04:30.946+03	2023-03-12 19:04:30.946+03
42	Бекон, сыры чеддер и пармезан, моцарелла, томаты, красный лук, чеснок, фирменный соус альфредо, итальянские травы	303.2	9.8	17.6	24.1	760	2023-03-12 19:05:12.426+03	2023-03-12 19:05:12.426+03
45	Горячая закуска с цыпленком, моцареллой, митболами, острыми колбасками чоризо и соусом бургер в тонкой пшеничной лепешке	288.2	15.1	13.7	24	160	2023-03-14 00:03:48.886+03	2023-03-14 00:03:48.886+03
46	Горячая закуска с цыпленком, ананасом, сладким перцем, моцареллой и пряным соусом карри в тонкой пшеничной лепешке	225.5	11.8	8.9	23	180	2023-03-14 02:18:12.747+03	2023-03-14 02:18:12.747+03
47	Легендарная горячая закуска с цыпленком, томатами, моцареллой, соусом ранч в тонкой пшеничной лепешке	214.1	12.5	9.6	17.9	200	2023-03-14 02:26:19.825+03	2023-03-14 02:26:19.825+03
48	Горячая закуска с цыпленком, перчиком халапеньо, маринованными огурчиками, томатами, моцареллой и соусом барбекю в тонкой пшеничной лепешке	214.1	9.7	7.1	20.3	190	2023-03-14 02:27:22.416+03	2023-03-14 02:27:22.416+03
49	Поджаристая чиабатта и знакомое сочетание ветчины, цыпленка, моцареллы со свежими томатами и соусом ранч	214.1	10.8	11.2	28.9	210	2023-03-14 02:28:15.845+03	2023-03-14 02:28:15.845+03
51	Насыщенный вкус колбасок чоризо и пепперони с соусами бургер и барбекю, свежими томатами, маринованными огурчиками, моцареллой и луком в румяной чиабатте	262.5	9.8	10.3	30.9	210	2023-03-14 02:30:25.837+03	2023-03-14 02:30:25.837+03
52	Горячая закуска с шампиньонами, моцареллой и соусом ранч в тонкой пшеничной лепешке	293.3	11.6	16.2	23.1	150	2023-03-14 02:53:25.973+03	2023-03-14 02:53:25.973+03
53	Горячая закуска с шампиньонами, моцареллой и соусом ранч в тонкой пшеничной лепешке	339.2	13.4	20.9	21.8	160	2023-03-14 02:54:36.637+03	2023-03-14 02:54:36.637+03
54	Сытный перекус для компании. На пышном тесте — только сыр и чеснок. И соус ранч/чесночный в комплекте — с ним вкуснее!	288.9	9	8.7	41.7	400	2023-03-15 02:33:10.962+03	2023-03-15 02:33:10.962+03
55	Сытный перекус для компании. На пышном тесте — только песто и сыр. И соус ранч/чесночный в комплекте — с ним вкуснее!	279.2	8.9	8.2	40.6	410	2023-03-15 02:34:09.288+03	2023-03-15 02:34:09.288+03
56	Запеченная в печи картошечка. Привычный вкус и мало масла	219.6	3.8	6.8	34.5	160	2023-03-15 02:36:49.008+03	2023-03-15 02:36:49.008+03
57	Горячий сытный обед из куриных крылышек со специями и ароматом копчения, картофеля из печи и соуса барбекю	239	15.8	12.3	14.7	240	2023-03-15 02:37:50.081+03	2023-03-15 02:37:50.081+03
58	Горячий сытный обед из нежных куриных кусочков, картофеля из печи и сырного соуса	248.8	13.5	11	22.2	200	2023-03-15 02:38:33.173+03	2023-03-15 02:38:33.173+03
59	Цыпленок, свежие листья салата айсберг, томаты черри, сыры чеддер и пармезан, соус цезарь, пшеничные гренки, итальянские травы	107.2	8.7	5	6.2	190	2023-03-15 02:39:37.37+03	2023-03-15 02:39:37.37+03
60	Десерт со вкусом dolce vita! Многослойный нежный тирамису в лучших итальянских традициях	235	3.6	12.3	27.2	100	2023-03-15 02:52:38.257+03	2023-03-15 02:52:38.257+03
61	Умножили какао на шоколад и получили изумительный десерт. Вот такая сладкая арифметика	459	5.7	25.3	51.2	55	2023-03-15 02:54:02.916+03	2023-03-15 02:54:02.916+03
62	Мы перепробовали тысячу десертов и наконец нашли любимца гостей — нежнейший творожный чизкейк	341	6.9	22.1	28.5	100	2023-03-15 02:54:57.642+03	2023-03-15 02:54:57.642+03
63	Солнечный снаружи и яркий по вкусу внутри. Летняя новинка — нежный чизкейк с бананом и шоколадным печеньем	350	7	23	30	100	2023-03-15 02:55:35.737+03	2023-03-15 02:55:35.737+03
64	Раз откусить — навсегда полюбить! Оцените яркое сочетание соленой карамели и арахиса	400	5	23	44	120	2023-03-15 02:56:10.518+03	2023-03-15 02:56:10.518+03
65	Ну и кекс этот маффин! Он из натурального какао, а внутри — нежная начинка из кубиков белого и молочного шоколада	410	5	22	47	120	2023-03-15 02:56:44.311+03	2023-03-15 02:56:44.311+03
66	Любимый десерт многих наших гостей — румяные сырники из печи. Такие нежные, в меру сладкие и напоминающие детство	274.1	11.7	14.3	22.6	260	2023-03-15 02:57:36.482+03	2023-03-15 02:57:36.482+03
67	На вид печенье как планета, а на вкус — шоколадная комета с глазурью	440	6	19	63	70	2023-03-15 02:59:34.788+03	2023-03-15 02:59:34.788+03
68	Здесь все сразу — брусника и ананас со сгущенкой на слоеном тесте	335.9	4.5	15.4	42.5	250	2023-03-15 03:00:23.744+03	2023-03-15 03:00:23.744+03
69	Для ценителей пикантной кислинки. Брусника и клюквенный соус на воздушном слоеном тесте	357.4	4.3	15.3	48.1	250	2023-03-15 03:01:02.229+03	2023-03-15 03:01:02.229+03
70		42	0	0	10.6	0.5	2023-03-15 03:06:47.591+03	2023-03-15 03:06:47.591+03
71		0.3	0	0	0	0.5	2023-03-15 03:19:16.563+03	2023-03-15 03:19:16.563+03
73		18	0	0	4.6	0.5	2023-03-15 03:20:33.935+03	2023-03-15 03:20:33.935+03
74		35	0	0	8	0.5	2023-03-15 03:21:04.041+03	2023-03-15 03:21:04.041+03
75		28	0	0	7	0.5	2023-03-15 03:21:48.36+03	2023-03-15 03:21:48.36+03
76		28	0	0	7	0.5	2023-03-15 03:22:23.296+03	2023-03-15 03:22:23.296+03
77		28	0	0	7	0.5	2023-03-15 03:22:51.513+03	2023-03-15 03:22:51.513+03
78		36	0	0	9	1	2023-03-15 03:23:28.404+03	2023-03-15 03:23:28.404+03
79		36	0	0	9	1	2023-03-15 03:23:46.136+03	2023-03-15 03:23:46.136+03
80		36	0	0	9	1	2023-03-15 03:24:09.422+03	2023-03-15 03:24:09.422+03
81	Эта ягода хитра! Наш фирменный морс для любителей сладкой кислинки	46	0.39	0.13	12.2	0.45	2023-03-15 03:25:24.257+03	2023-03-15 03:25:24.257+03
82	Для усиления ощущений от морса рекомендуем закрыть глаза и представить себя у бабушки в саду	46	0.39	0.13	12.2	0.45	2023-03-15 03:25:48.474+03	2023-03-15 03:25:48.474+03
83	Напиток со вкусом ностальгии — летние каникулы, теплые ночи и уютные дачные посиделки. А еще никаких косточек	46	0.39	0.13	12.2	0.45	2023-03-15 03:26:13.805+03	2023-03-15 03:26:13.805+03
84	Фирменный соус со вкусом расплавленного сыра для бортиков пиццы и горячих закусок, 25 г	470	1.6	49.8	3	0.025	2024-05-08 15:12:23.382+03	2024-05-08 15:12:23.382+03
85	Фирменный соус с чесночным вкусом для бортиков пиццы и горячих закусок, 25 г	330	1	31	12	0.025	2024-05-08 15:14:10.112+03	2024-05-08 15:14:10.112+03
86	Фирменный соус с дымным ароматом для бортиков пиццы и горячих закусок, 25 г	110	0.6	26.3	3	0.025	2024-05-08 15:15:18.191+03	2024-05-08 15:15:18.191+03
87	Фирменный соус сладкий чили с легкой пряностью для бортиков пиццы и горячих закусок, 25 г	170	0.7	0.5	41	0.025	2024-05-08 15:15:59.141+03	2024-05-08 15:15:59.141+03
88	Фирменный соус сладкий чили с легкой пряностью для бортиков пиццы и горячих закусок, 25 г	170	0.7	0.5	41	0.025	2024-05-20 21:22:54.862+03	2024-05-20 21:22:54.862+03
89	Фирменный соус сладкий чили с легкой пряностью для бортиков пиццы и горячих закусок, 25 г	170	0.7	0.5	41	0.025	2024-05-20 21:47:29.916+03	2024-05-20 21:47:29.916+03
90	Фирменный соус сладкий чили с легкой пряностью для бортиков пиццы и горячих закусок, 25 г	170	0.7	0.5	41	0.025	2024-05-20 22:02:54.812+03	2024-05-20 22:02:54.812+03
\.


--
-- Data for Name: pizzas_sizes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pizzas_sizes (id, size, "createdAt", "updatedAt", "dopPrice") FROM stdin;
1	25	2023-03-04 18:04:16.168+03	2023-03-04 18:04:16.168+03	0
2	30	2023-03-04 18:04:18.985+03	2023-03-04 18:04:18.985+03	10
3	35	2023-03-04 18:04:21.745+03	2023-03-04 18:04:21.745+03	30
\.


--
-- Data for Name: pizzas_sizes_variants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pizzas_sizes_variants (id, "createdAt", "updatedAt", "productId", "pizzasTypesVariantId", "pizzasSizeId") FROM stdin;
2	2023-03-04 17:50:52.04+03	2023-03-04 17:50:52.04+03	1	2	1
3	2023-03-04 17:52:05.67+03	2023-03-04 17:52:05.67+03	1	3	2
4	2023-03-04 17:56:02.042+03	2023-03-04 17:56:02.042+03	1	4	2
5	2023-03-04 17:57:57.217+03	2023-03-04 17:57:57.217+03	1	5	3
6	2023-03-04 18:10:06.575+03	2023-03-04 18:10:06.575+03	1	6	3
7	2023-03-06 16:49:28.87+03	2023-03-06 16:49:28.87+03	2	7	1
8	2023-03-06 16:52:09.356+03	2023-03-06 16:52:09.356+03	2	8	2
9	2023-03-06 16:52:42.172+03	2023-03-06 16:52:42.172+03	2	9	2
10	2023-03-06 16:53:18.442+03	2023-03-06 16:53:18.442+03	2	10	3
11	2023-03-06 16:53:54.978+03	2023-03-06 16:53:54.978+03	2	11	3
12	2023-03-06 17:12:18.579+03	2023-03-06 17:12:18.579+03	3	12	1
13	2023-03-06 17:12:58.373+03	2023-03-06 17:12:58.373+03	3	13	2
14	2023-03-06 17:13:41.525+03	2023-03-06 17:13:41.525+03	3	14	2
15	2023-03-06 17:15:41.061+03	2023-03-06 17:15:41.061+03	3	15	3
16	2023-03-06 17:17:09.252+03	2023-03-06 17:17:09.252+03	3	16	3
17	2023-03-12 18:27:56.366+03	2023-03-12 18:27:56.366+03	4	17	1
18	2023-03-12 18:30:07.566+03	2023-03-12 18:30:07.566+03	4	18	2
19	2023-03-12 18:31:07.713+03	2023-03-12 18:31:07.713+03	4	19	2
20	2023-03-12 18:32:37.188+03	2023-03-12 18:32:37.188+03	4	20	3
21	2023-03-12 18:33:52.625+03	2023-03-12 18:33:52.625+03	4	21	3
22	2023-03-12 18:41:09.076+03	2023-03-12 18:41:09.076+03	5	22	1
23	2023-03-12 18:42:03.531+03	2023-03-12 18:42:03.531+03	5	23	2
24	2023-03-12 18:43:27.733+03	2023-03-12 18:43:27.733+03	5	24	2
25	2023-03-12 18:44:12.609+03	2023-03-12 18:44:12.609+03	5	25	3
26	2023-03-12 18:45:02.527+03	2023-03-12 18:45:02.527+03	5	26	3
27	2023-03-12 18:48:40.515+03	2023-03-12 18:48:40.515+03	8	27	1
28	2023-03-12 18:49:10.938+03	2023-03-12 18:49:10.938+03	8	28	2
29	2023-03-12 18:49:47.47+03	2023-03-12 18:49:47.47+03	8	29	2
30	2023-03-12 18:50:27.13+03	2023-03-12 18:50:27.13+03	8	30	3
31	2023-03-12 18:51:18.862+03	2023-03-12 18:51:18.862+03	8	31	3
32	2023-03-12 18:54:35.435+03	2023-03-12 18:54:35.435+03	6	32	1
33	2023-03-12 18:55:08.84+03	2023-03-12 18:55:08.84+03	6	33	2
34	2023-03-12 18:56:36.926+03	2023-03-12 18:56:36.926+03	6	34	2
35	2023-03-12 18:57:56.457+03	2023-03-12 18:57:56.457+03	6	35	3
36	2023-03-12 18:58:38.341+03	2023-03-12 18:58:38.341+03	6	36	3
37	2023-03-12 19:02:15.061+03	2023-03-12 19:02:15.061+03	7	37	1
38	2023-03-12 19:02:56.987+03	2023-03-12 19:02:56.987+03	7	38	2
39	2023-03-12 19:03:48.799+03	2023-03-12 19:03:48.799+03	7	39	2
40	2023-03-12 19:04:30.987+03	2023-03-12 19:04:30.987+03	7	40	3
41	2023-03-12 19:05:12.464+03	2023-03-12 19:05:12.464+03	7	41	3
\.


--
-- Data for Name: pizzas_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pizzas_types (id, type, "createdAt", "updatedAt") FROM stdin;
2	Тонкое	2023-03-04 18:04:09.563+03	2023-03-04 18:04:09.563+03
1	Традиционное	2023-03-04 18:03:57.318+03	2023-03-04 18:03:57.318+03
\.


--
-- Data for Name: pizzas_types_variants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pizzas_types_variants (id, price, img_url, "createdAt", "updatedAt", "pizzaInfoId", "pizzasTypeId") FROM stdin;
2	369	43fba3c5-008c-40d2-b5fd-9117fb883b0a.webp	2023-03-04 17:50:52.037+03	2023-03-04 17:50:52.037+03	3	1
4	569	e0eb32a1-4f59-466f-8c99-961d3e8ba36c.webp	2023-03-04 17:56:02.04+03	2023-03-04 17:56:02.04+03	5	2
5	699	75f20bac-d025-401e-9188-519b1931805a.webp	2023-03-04 17:57:57.215+03	2023-03-04 17:57:57.215+03	6	1
6	699	9c08db83-f741-4328-9bf9-5357b0e332e1.webp	2023-03-04 18:10:06.572+03	2023-03-04 18:10:06.572+03	7	2
3	569	8bc6fe16-72cb-41be-abdd-f5d3a34bad86.webp	2023-03-04 17:52:05.668+03	2023-03-04 17:52:05.668+03	4	1
7	289	5e74e4ec-2b2f-4a4c-bb4b-0d97764bcc3d.webp	2023-03-06 16:49:28.867+03	2023-03-06 16:49:28.867+03	8	1
8	499	cb01f258-8df7-449c-b26e-22ec4beb0d41.webp	2023-03-06 16:52:09.353+03	2023-03-06 16:52:09.353+03	9	1
9	499	23442a3a-6c70-4a97-a3db-e1d2fea3d777.webp	2023-03-06 16:52:42.169+03	2023-03-06 16:52:42.169+03	10	2
10	609	2258d77b-5ca1-4d76-a369-09d85101fd7a.webp	2023-03-06 16:53:18.439+03	2023-03-06 16:53:18.439+03	11	1
11	609	d26ccfae-57b5-4a61-aba9-6306195dad75.webp	2023-03-06 16:53:54.975+03	2023-03-06 16:53:54.975+03	12	2
12	369	0473dea7-1515-4f47-bd79-9392dfe8aca3.webp	2023-03-06 17:12:18.576+03	2023-03-06 17:12:18.576+03	13	1
13	569	3cdde061-d34d-4e82-a224-4aa71cc2d31e.webp	2023-03-06 17:12:58.37+03	2023-03-06 17:12:58.37+03	14	1
14	569	8355c00d-d577-4c77-b59a-b06aab13f221.webp	2023-03-06 17:13:41.52+03	2023-03-06 17:13:41.52+03	15	2
15	699	39f17464-45ca-4bf5-b90b-8757d1203e27.webp	2023-03-06 17:15:41.058+03	2023-03-06 17:15:41.058+03	16	1
16	699	5367ca8d-ee5f-4ee4-91fb-f20ffd7c228f.webp	2023-03-06 17:17:09.25+03	2023-03-06 17:17:09.25+03	17	2
17	289	bb702e5b-d7e5-465a-b75e-fa2447d8a4a2.webp	2023-03-12 18:27:56.361+03	2023-03-12 18:27:56.361+03	18	1
18	499	91bcfe44-fee1-4c6e-88bb-a16d001cbe35.webp	2023-03-12 18:30:07.563+03	2023-03-12 18:30:07.563+03	19	1
19	499	7b73e8da-fd0d-4871-bcea-b0395a7a044c.webp	2023-03-12 18:31:07.71+03	2023-03-12 18:31:07.71+03	20	2
20	609	a1f98f28-5337-44c1-9575-eae8c654745d.webp	2023-03-12 18:32:37.185+03	2023-03-12 18:32:37.185+03	21	1
21	609	72ebc690-a661-43a8-8421-8c06fc8efb72.webp	2023-03-12 18:33:52.622+03	2023-03-12 18:33:52.622+03	22	2
22	289	5e9fbce8-559e-4221-a602-37b0b26f8eac.webp	2023-03-12 18:41:09.072+03	2023-03-12 18:41:09.072+03	23	1
23	499	8fa7c501-f57f-4dda-8db5-37889b57a67b.webp	2023-03-12 18:42:03.528+03	2023-03-12 18:42:03.528+03	24	1
24	499	c44440ba-f5bc-494d-a3f0-e61517f42ccf.webp	2023-03-12 18:43:27.73+03	2023-03-12 18:43:27.73+03	25	2
25	609	96c3d669-adf0-4c9a-92fc-4c6a7a997c92.webp	2023-03-12 18:44:12.606+03	2023-03-12 18:44:12.606+03	26	1
26	609	85f3339f-066e-49e7-b6f9-49c5b7ab02f9.webp	2023-03-12 18:45:02.524+03	2023-03-12 18:45:02.524+03	27	2
27	419	fd8897cf-06b5-4d3c-a0bc-e6464a6f7487.webp	2023-03-12 18:48:40.512+03	2023-03-12 18:48:40.512+03	28	1
28	639	592e4233-a323-4f38-a02d-a83278d933e3.webp	2023-03-12 18:49:10.936+03	2023-03-12 18:49:10.936+03	29	1
29	639	79e29ec5-fd13-4f06-ad9d-0e515690817b.webp	2023-03-12 18:49:47.467+03	2023-03-12 18:49:47.467+03	30	2
30	789	0d5995e4-f8d6-4eee-9bb0-82c234958870.webp	2023-03-12 18:50:27.128+03	2023-03-12 18:50:27.128+03	31	1
31	789	499ad007-660a-4e36-9ba3-33868ddec545.webp	2023-03-12 18:51:18.859+03	2023-03-12 18:51:18.859+03	32	2
32	469	2c9efc54-95ba-439b-b2e8-6f7728543f23.webp	2023-03-12 18:54:35.432+03	2023-03-12 18:54:35.432+03	33	1
33	719	23699f56-c6a4-4480-9684-61e7a9858c88.webp	2023-03-12 18:55:08.837+03	2023-03-12 18:55:08.837+03	34	1
34	719	e0fa3aa9-5032-4819-b49e-42dfcf02c492.webp	2023-03-12 18:56:36.924+03	2023-03-12 18:56:36.924+03	35	2
35	849	e257278d-15bd-4ea7-b828-239712c10f58.webp	2023-03-12 18:57:56.454+03	2023-03-12 18:57:56.454+03	36	1
36	849	f9dfa349-3469-471b-9564-d7b380fdc847.webp	2023-03-12 18:58:38.335+03	2023-03-12 18:58:38.335+03	37	2
37	469	0fe8082a-9731-40da-8e69-68d9566108aa.webp	2023-03-12 19:02:15.058+03	2023-03-12 19:02:15.058+03	38	1
38	719	5a86a019-fa16-401e-8903-47e483b8d0b9.webp	2023-03-12 19:02:56.984+03	2023-03-12 19:02:56.984+03	39	1
39	719	5e0f14d7-c13f-4730-b056-a4cbe3774923.webp	2023-03-12 19:03:48.797+03	2023-03-12 19:03:48.797+03	40	2
40	849	0bef8c20-8516-4fc0-b4df-4f03dea5aea0.webp	2023-03-12 19:04:30.984+03	2023-03-12 19:04:30.984+03	41	1
41	849	cac2707a-f560-4660-9902-ae1c4e0e7d66.webp	2023-03-12 19:05:12.461+03	2023-03-12 19:05:12.461+03	42	2
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, description, price, img_url, "createdAt", "updatedAt", "productsTypeId", "pizzaInfoId") FROM stdin;
15	Додстер	Легендарная горячая закуска с цыпленком, томатами, моцареллой, соусом ранч в тонкой пшеничной лепешке	189	4446bd51-ed39-44f0-8223-7b9873441500.webp	2023-03-14 02:26:19.854+03	2023-03-14 02:26:19.854+03	2	47
2	Сырная	Моцарелла, сыры чеддер и пармезан, фирменный соус альфредо	289	d42a2226-ade8-4cd6-9256-4ca218cc2b6b.webp	2023-03-06 16:46:17.964+03	2023-03-06 16:46:17.964+03	1	\N
3	Двойной цыпленок	Цыпленок, моцарелла, соус альфредо	369	204b64d4-dfe3-4dea-b2a3-26e09e3af52e.webp	2023-03-06 17:08:44.877+03	2023-03-06 17:08:44.877+03	1	\N
4	Пепперони фреш	Пикантная пепперони, увеличенная порция моцареллы, томаты, фирменный томатный соус	289	d54b4cf4-3091-47de-a364-1db01555a25d.webp	2023-03-06 17:23:45.722+03	2023-03-06 17:23:45.722+03	1	\N
5	Чоризо фреш	Фирменный томатный соус, моцарелла, острая чоризо, сладкий перец	289	7310dc78-7939-4a2d-a6b5-9850cf4d393c.webp	2023-03-06 17:25:09.502+03	2023-03-06 17:25:09.502+03	1	\N
6	Сырная цыпленок	Цыпленок, моцарелла, сыры чеддер и пармезан, сырный соус, томаты, фирменный соус альфредо, чеснок	469	99016017-81e2-45fd-a047-02c3055a0ff8.webp	2023-03-06 17:26:32.239+03	2023-03-06 17:26:32.239+03	1	\N
7	Карбонара	Бекон, сыры чеддер и пармезан, моцарелла, томаты, красный лук, чеснок, фирменный соус альфредо, итальянские травы	469	a60297d7-4bd0-458b-9057-4af4c4491ddc.webp	2023-03-06 17:27:28.503+03	2023-03-06 17:27:28.503+03	1	\N
8	Бургер-пицца	Ветчина, маринованные огурчики, томаты, красный лук, чеснок, соус бургер, моцарелла, фирменный томатный соус	419	7632899e-997c-4669-8af6-f5d1f7b62a95.webp	2023-03-06 17:28:38.927+03	2023-03-06 17:28:38.927+03	1	\N
17	Дэнвич ветчина и сыр	Поджаристая чиабатта и знакомое сочетание ветчины, цыпленка, моцареллы со свежими томатами и соусом ранч	219	40dd06c6-4de5-44a5-b771-24c2cdb61aff.webp	2023-03-14 02:28:15.875+03	2023-03-14 02:28:15.875+03	2	49
13	Супермясной Додстер	Горячая закуска с цыпленком, моцареллой, митболами, острыми колбасками чоризо и соусом бургер в тонкой пшеничной лепешке	199	d8712422-6a23-4148-b1d2-701e821d3ec8.webp	2023-03-14 00:03:48.922+03	2023-03-14 00:03:48.922+03	2	45
14	Додстер Карри	Горячая закуска с цыпленком, ананасом, сладким перцем, моцареллой и пряным соусом карри в тонкой пшеничной лепешке	189	e05043ae-0721-46c7-b6f2-352f70b7edc7.webp	2023-03-14 02:18:12.885+03	2023-03-14 02:18:12.885+03	2	46
19	Дэнвич чоризо барбекю	Насыщенный вкус колбасок чоризо и пепперони с соусами бургер и барбекю, свежими томатами, маринованными огурчиками, моцареллой и луком в румяной чиабатте	219	356f327e-76fb-4275-8e73-be184a121df7.webp	2023-03-14 02:30:25.87+03	2023-03-14 02:30:25.87+03	2	51
20	Грибной Стартер	Горячая закуска с шампиньонами, моцареллой и соусом ранч в тонкой пшеничной лепешке	169	267069dc-4d9e-4b69-8e5f-5b6ce0eb6c32.webp	2023-03-14 02:53:26.002+03	2023-03-14 02:53:26.002+03	2	52
22	Сырные палочки с чесноком	Сытный перекус для компании. На пышном тесте — только сыр и чеснок. И соус ранч/чесночный в комплекте — с ним вкуснее!	249	60d2617d-2309-4c76-b7a1-8751675ce4e0.webp	2023-03-15 02:33:11.013+03	2023-03-15 02:33:11.013+03	2	54
23	Сырные палочки с песто	Сытный перекус для компании. На пышном тесте — только песто и сыр. И соус ранч/чесночный в комплекте — с ним вкуснее!	249	5f42b14c-d37f-4232-84ab-dd0a49983c91.webp	2023-03-15 02:34:09.323+03	2023-03-15 02:34:09.323+03	2	55
24	Картофель из печи	Запеченная в печи картошечка. Привычный вкус и мало масла	199	5eeb9aef-588b-426a-95a1-53d525290c5b.webp	2023-03-15 02:36:49.047+03	2023-03-15 02:36:49.047+03	2	56
25	Ланчбокс с куриными крыльями	Горячий сытный обед из куриных крылышек со специями и ароматом копчения, картофеля из печи и соуса барбекю	315	4b2cc0a0-881c-42f7-a329-369d3b07b56e.webp	2023-03-15 02:37:50.115+03	2023-03-15 02:37:50.115+03	2	57
26	Ланчбокс с куриными кусочками	Горячий сытный обед из нежных куриных кусочков, картофеля из печи и сырного соуса	299	8f33c906-9425-4bd6-b657-0eddd69e01fd.webp	2023-03-15 02:38:33.208+03	2023-03-15 02:38:33.208+03	2	58
27	Салат Цезарь	Цыпленок, свежие листья салата айсберг, томаты черри, сыры чеддер и пармезан, соус цезарь, пшеничные гренки, итальянские травы	209	5e875286-7e41-475b-b480-cff4c21cfc3e.webp	2023-03-15 02:39:37.402+03	2023-03-15 02:39:37.402+03	2	59
28	Тирамису	Десерт со вкусом dolce vita! Многослойный нежный тирамису в лучших итальянских традициях	199	6c331fcc-ddce-4cb7-8bcf-aadc665ad4e2.webp	2023-03-15 02:52:38.289+03	2023-03-15 02:52:38.289+03	3	60
30	Чизкейк Нью-Йорк	Мы перепробовали тысячу десертов и наконец нашли любимца гостей — нежнейший творожный чизкейк	139	67782900-4830-4a87-993e-1e06fe112b3d.webp	2023-03-15 02:54:57.678+03	2023-03-15 02:54:57.678+03	3	62
31	Чизкейк Банановый с шоколадным печеньем	Солнечный снаружи и яркий по вкусу внутри. Летняя новинка — нежный чизкейк с бананом и шоколадным печеньем	149	95d3d1d5-6cd1-47b4-bbcf-572ef014255c.webp	2023-03-15 02:55:35.781+03	2023-03-15 02:55:35.781+03	3	63
1	Ветчина и сыр	Ветчина, моцарелла, фирменный соус альфредо	369	8bc6fe16-72cb-41be-abdd-f5d3a34bad86.webp	2023-03-04 17:50:44.621+03	2024-05-20 16:05:05.442+03	1	\N
16	Острый Додстер	Горячая закуска с цыпленком, перчиком халапеньо, маринованными огурчиками, томатами, моцареллой и соусом барбекю в тонкой пшеничной лепешке	199	5711e242-2f4e-4b2e-b9a9-0947157c40ad.webp	2023-03-14 02:27:22.453+03	2024-06-03 17:43:27.864+03	2	48
32	Маффин Соленая карамель	Раз откусить — навсегда полюбить! Оцените яркое сочетание соленой карамели и арахиса	95	22e72299-8c4c-4cb1-9941-e31df3dd5374.webp	2023-03-15 02:56:10.662+03	2023-03-15 02:56:10.662+03	3	64
33	Маффин Три шоколада	Ну и кекс этот маффин! Он из натурального какао, а внутри — нежная начинка из кубиков белого и молочного шоколада	95	d0dcd810-b19f-4628-bfd4-932d5efccc05.webp	2023-03-15 02:56:44.352+03	2023-03-15 02:56:44.352+03	3	65
34	Сырники с малиновым вареньем	Любимый десерт многих наших гостей — румяные сырники из печи. Такие нежные, в меру сладкие и напоминающие детство	289	30fd4122-30f3-41c3-b8d3-bad8f87efcc6.webp	2023-03-15 02:57:36.622+03	2023-03-15 02:57:36.622+03	3	66
35	Шоколадный кукис	На вид печенье как планета, а на вкус — шоколадная комета с глазурью	95	ba272eab-7180-48f9-a0c5-f9b479aa0ff0.webp	2023-03-15 02:59:34.822+03	2023-03-15 02:59:34.822+03	3	67
36	Слоеные палочки с ананасами и брусникой	Здесь все сразу — брусника и ананас со сгущенкой на слоеном тесте	229	0703a035-ee4b-4444-89b7-38ed707f600d.webp	2023-03-15 03:00:23.777+03	2023-03-15 03:00:23.777+03	3	68
37	Слоеные палочки с брусникой и клюквенным соусом	Для ценителей пикантной кислинки. Брусника и клюквенный соус на воздушном слоеном тесте	249	30825156-f74c-4bb4-a058-acb31b5c5027.webp	2023-03-15 03:01:02.267+03	2023-03-15 03:01:02.267+03	3	69
38	Добрый кола		105	d255531a-8ea1-4754-9110-50fd3021123c.webp	2023-03-15 03:06:47.632+03	2023-03-15 03:06:47.632+03	4	70
39	Добрый Кола без сахара		105	bc05a064-3e6d-4df3-94a3-bdbe7646beb4.webp	2023-03-15 03:19:16.598+03	2023-03-15 03:19:16.598+03	4	71
40	Добрый Апельсин		105	34964729-6d81-477d-ae3b-358485bf5050.webp	2023-03-15 03:20:03.612+03	2023-03-15 03:20:03.612+03	4	72
41	Добрый Лайм-Лимон		105	b38cb291-e6ad-49a8-b2c0-6cd366bf906e.webp	2023-03-15 03:20:33.978+03	2023-03-15 03:20:33.978+03	4	73
42	Добрый Манго-Маракуйя		105	14fa15c7-3c19-4a75-870a-d3c9c0c507ce.webp	2023-03-15 03:21:04.081+03	2023-03-15 03:21:04.081+03	4	74
44	Rich Tea Зеленый		115	e2a8d26e-0840-4f49-a2d8-260e8c6826d3.webp	2023-03-15 03:22:23.329+03	2023-03-15 03:22:23.329+03	4	76
45	Rich Tea Зеленый с манго		105	19d02ea0-485d-43fd-9140-0062192e59cb.webp	2023-03-15 03:22:51.553+03	2023-03-15 03:22:51.553+03	4	77
46	Апельсиновый сок Rich		199	cd308013-2a61-414a-b372-9b3367784662.webp	2023-03-15 03:23:28.44+03	2023-03-15 03:23:28.44+03	4	78
47	Яблочный сок Rich		199	ff197733-874e-4e9e-822b-d043ed5aae84.webp	2023-03-15 03:23:46.172+03	2023-03-15 03:23:46.172+03	4	79
48	Вишневый нектар Rich		199	3436a842-d34a-441c-b4a4-2d10ff370536.webp	2023-03-15 03:24:09.459+03	2023-03-15 03:24:09.459+03	4	80
49	Морс Клюква	Эта ягода хитра! Наш фирменный морс для любителей сладкой кислинки	125	07b588fd-176e-4945-8f62-0cca1b6481b4.webp	2023-03-15 03:25:24.293+03	2023-03-15 03:25:24.293+03	4	81
50	Морс Черная смородина	Для усиления ощущений от морса рекомендуем закрыть глаза и представить себя у бабушки в саду	125	d7934929-ee70-4144-9c37-5c944de0388c.webp	2023-03-15 03:25:48.511+03	2023-03-15 03:25:48.511+03	4	82
51	Морс Вишня	Напиток со вкусом ностальгии — летние каникулы, теплые ночи и уютные дачные посиделки. А еще никаких косточек	500	e704188b-55eb-480e-9c19-4f599a906e5f.webp	2023-03-15 03:26:13.842+03	2023-04-05 14:08:55.097+03	4	83
52	Сырный соус	Фирменный соус со вкусом расплавленного сыра для бортиков пиццы и горячих закусок, 25 г	45	b0b2faf1-f810-4ab5-b9a1-84ea4e8e4b63.jpeg	2024-05-08 15:12:23.417+03	2024-05-08 15:12:23.417+03	6	84
53	Чесночный соус	Фирменный соус с чесночным вкусом для бортиков пиццы и горячих закусок, 25 г	45	936b2ceb-a438-406b-8cd7-01938d640a96.jpeg	2024-05-08 15:14:10.147+03	2024-05-08 15:14:10.147+03	6	85
54	Барбекю	Фирменный соус с дымным ароматом для бортиков пиццы и горячих закусок, 25 г	45	f066069e-003f-40e1-8613-0502402ab973.jpeg	2024-05-08 15:15:18.224+03	2024-05-08 15:15:18.224+03	6	86
58	Сладкий чили	Фирменный соус сладкий чили с легкой пряностью для бортиков пиццы и горячих закусок, 25 г	45	7f74ef04-c301-4697-b540-f51727b4f0bc.jpeg	2024-05-20 22:02:54.847+03	2024-05-20 22:02:54.847+03	6	90
29	Брауни	Умножили какао на шоколад и получили изумительный десерт. Вот такая сладкая арифметика	250	1a41cdc0-145d-4c70-849f-50fd2433f118.webp	2023-03-15 02:54:02.946+03	2024-06-02 18:40:09.976+03	3	61
\.


--
-- Data for Name: products_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_types (id, name, "createdAt", "updatedAt") FROM stdin;
2	Закуски	2023-03-13 22:38:35.471+03	2023-03-13 22:38:35.471+03
1	Пицца	2023-03-13 22:21:05.902+03	2023-03-13 22:21:05.902+03
3	Десерты	2023-03-15 02:51:17.474+03	2023-03-15 02:51:17.474+03
4	Напитки	2023-03-15 03:03:21.427+03	2023-03-15 03:03:21.427+03
5	Комбо	2023-05-11 13:56:49.792+03	2024-05-07 18:00:37.516+03
6	Соусы	2024-05-08 15:09:50.489+03	2024-05-08 15:09:50.489+03
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, email, role, "createdAt", "updatedAt", phone) FROM stdin;
12	Дмитрон2004	meattom@yandex.ru	USER	2024-05-23 23:28:38.967+03	2024-05-24 01:45:28.539+03	+79119682235
11	Пользователь123	example@mail.ru	USER	2024-05-21 22:01:23.464+03	2024-05-24 04:11:50.111+03	+76431346765
10	АдикалонИванович	koshka15@gmail.ru	USER	2024-05-21 21:28:45.575+03	2024-05-21 21:29:59.331+03	+55555555555
2	Всеволод12341	seva31122003@mail.ru	USER	2023-04-19 16:11:50.992+03	2024-06-03 17:38:40.145+03	+79110189847
17	Всеволод	seva@mail.ru	USER	2024-06-03 17:25:07.308+03	2024-06-03 18:01:24.367+03	+79110189846
13	\N	ivanchenkokate12@gmail.com	USER	2024-05-23 23:38:44.088+03	2024-05-23 23:38:44.088+03	\N
14	Вероника	veronika06039@gmail.com	USER	2024-05-24 00:58:13.19+03	2024-05-24 00:59:06.057+03	+79111502594
\.


--
-- Name: basket_combos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.basket_combos_id_seq', 45, true);


--
-- Name: basket_pizza_dopProducts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."basket_pizza_dopProducts_id_seq"', 178, true);


--
-- Name: basket_pizzas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.basket_pizzas_id_seq', 211, true);


--
-- Name: combo_defaults_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.combo_defaults_id_seq', 29, true);


--
-- Name: combos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.combos_id_seq', 7, true);


--
-- Name: dod_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dod_products_id_seq', 18, true);


--
-- Name: dop_product_pizzas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dop_product_pizzas_id_seq', 145, true);


--
-- Name: order_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_products_id_seq', 58, true);


--
-- Name: order_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_statuses_id_seq', 4, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 65, true);


--
-- Name: pizza_combos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pizza_combos_id_seq', 99, true);


--
-- Name: pizza_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pizza_infos_id_seq', 90, true);


--
-- Name: pizzas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pizzas_id_seq', 58, true);


--
-- Name: pizzas_sizes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pizzas_sizes_id_seq', 4, true);


--
-- Name: pizzas_sizes_variants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pizzas_sizes_variants_id_seq', 41, true);


--
-- Name: pizzas_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pizzas_types_id_seq', 3, true);


--
-- Name: pizzas_types_variants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pizzas_types_variants_id_seq', 41, true);


--
-- Name: products_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_types_id_seq', 8, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 17, true);


--
-- Name: basket_combos basket_combos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_combos
    ADD CONSTRAINT basket_combos_pkey PRIMARY KEY (id);


--
-- Name: basket_pizza_dopProducts basket_pizza_dopProducts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."basket_pizza_dopProducts"
    ADD CONSTRAINT "basket_pizza_dopProducts_pkey" PRIMARY KEY (id);


--
-- Name: baskets basket_pizzas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baskets
    ADD CONSTRAINT basket_pizzas_pkey PRIMARY KEY (id);


--
-- Name: combo_defaults combo_defaults_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.combo_defaults
    ADD CONSTRAINT combo_defaults_pkey PRIMARY KEY (id);


--
-- Name: combos combos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.combos
    ADD CONSTRAINT combos_pkey PRIMARY KEY (id);


--
-- Name: dod_products dod_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dod_products
    ADD CONSTRAINT dod_products_pkey PRIMARY KEY (id);


--
-- Name: dop_product_pizzas dop_product_pizzas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dop_product_pizzas
    ADD CONSTRAINT dop_product_pizzas_pkey PRIMARY KEY (id);


--
-- Name: order_products order_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT order_products_pkey PRIMARY KEY (id);


--
-- Name: order_statuses order_statuses_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_statuses
    ADD CONSTRAINT order_statuses_name_key UNIQUE (name);


--
-- Name: order_statuses order_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_statuses
    ADD CONSTRAINT order_statuses_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: pizza_combos pizza_combos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza_combos
    ADD CONSTRAINT pizza_combos_pkey PRIMARY KEY (id);


--
-- Name: pizza_infos pizza_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza_infos
    ADD CONSTRAINT pizza_infos_pkey PRIMARY KEY (id);


--
-- Name: products pizzas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT pizzas_pkey PRIMARY KEY (id);


--
-- Name: pizzas_sizes pizzas_sizes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizzas_sizes
    ADD CONSTRAINT pizzas_sizes_pkey PRIMARY KEY (id);


--
-- Name: pizzas_sizes pizzas_sizes_size_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizzas_sizes
    ADD CONSTRAINT pizzas_sizes_size_key UNIQUE (size);


--
-- Name: pizzas_sizes_variants pizzas_sizes_variants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizzas_sizes_variants
    ADD CONSTRAINT pizzas_sizes_variants_pkey PRIMARY KEY (id);


--
-- Name: pizzas_types pizzas_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizzas_types
    ADD CONSTRAINT pizzas_types_pkey PRIMARY KEY (id);


--
-- Name: pizzas_types pizzas_types_type_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizzas_types
    ADD CONSTRAINT pizzas_types_type_key UNIQUE (type);


--
-- Name: pizzas_types_variants pizzas_types_variants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizzas_types_variants
    ADD CONSTRAINT pizzas_types_variants_pkey PRIMARY KEY (id);


--
-- Name: products_types products_types_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_types
    ADD CONSTRAINT products_types_name_key UNIQUE (name);


--
-- Name: products_types products_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_types
    ADD CONSTRAINT products_types_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: basket_combos basketId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_combos
    ADD CONSTRAINT "basketId_fkey" FOREIGN KEY ("basketId") REFERENCES public.baskets(id) NOT VALID;


--
-- Name: basket_combos basket_combos_comboId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_combos
    ADD CONSTRAINT "basket_combos_comboId_fkey" FOREIGN KEY ("comboId") REFERENCES public.combos(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: basket_combos basket_combos_pizzasSizesVariantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_combos
    ADD CONSTRAINT "basket_combos_pizzasSizesVariantId_fkey" FOREIGN KEY ("pizzasSizesVariantId") REFERENCES public.pizzas_sizes_variants(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: basket_combos basket_combos_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_combos
    ADD CONSTRAINT "basket_combos_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: basket_pizza_dopProducts basket_pizza_dopProducts_basketPizzaId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."basket_pizza_dopProducts"
    ADD CONSTRAINT "basket_pizza_dopProducts_basketPizzaId_fkey" FOREIGN KEY ("basketId") REFERENCES public.baskets(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: basket_pizza_dopProducts basket_pizza_dopProducts_dodProductId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."basket_pizza_dopProducts"
    ADD CONSTRAINT "basket_pizza_dopProducts_dodProductId_fkey" FOREIGN KEY ("dodProductId") REFERENCES public.dod_products(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: baskets basket_pizzas_pizzasSizesVariantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baskets
    ADD CONSTRAINT "basket_pizzas_pizzasSizesVariantId_fkey" FOREIGN KEY ("pizzasSizesVariantId") REFERENCES public.pizzas_sizes_variants(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: baskets basket_pizzas_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baskets
    ADD CONSTRAINT "basket_pizzas_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: combo_defaults combo_defaults_comboId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.combo_defaults
    ADD CONSTRAINT "combo_defaults_comboId_fkey" FOREIGN KEY ("comboId") REFERENCES public.combos(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: combo_defaults combo_defaults_pizzasSizesVariantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.combo_defaults
    ADD CONSTRAINT "combo_defaults_pizzasSizesVariantId_fkey" FOREIGN KEY ("pizzasSizesVariantId") REFERENCES public.pizzas_sizes_variants(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: combo_defaults combo_defaults_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.combo_defaults
    ADD CONSTRAINT "combo_defaults_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: combo_defaults combo_defaults_productTypeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.combo_defaults
    ADD CONSTRAINT "combo_defaults_productTypeId_fkey" FOREIGN KEY ("productsTypeId") REFERENCES public.products_types(id) NOT VALID;


--
-- Name: dop_product_pizzas dop_product_pizzas_dodProductId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dop_product_pizzas
    ADD CONSTRAINT "dop_product_pizzas_dodProductId_fkey" FOREIGN KEY ("dodProductId") REFERENCES public.dod_products(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: order_products order_products_orderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT "order_products_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES public.orders(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: order_products order_products_pizzasSizesVariantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT "order_products_pizzasSizesVariantId_fkey" FOREIGN KEY ("pizzasSizesVariantId") REFERENCES public.pizzas_sizes_variants(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: orders orders_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_status_fkey FOREIGN KEY ("orderStatusId") REFERENCES public.order_statuses(id) NOT VALID;


--
-- Name: orders orders_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "orders_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: pizza_combos pizza_combos_combo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza_combos
    ADD CONSTRAINT pizza_combos_combo_fkey FOREIGN KEY ("comboId") REFERENCES public.combos(id) NOT VALID;


--
-- Name: pizza_combos pizza_combos_pizzasSizeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza_combos
    ADD CONSTRAINT "pizza_combos_pizzasSizeId_fkey" FOREIGN KEY ("pizzasSizeId") REFERENCES public.pizzas_sizes(id) NOT VALID;


--
-- Name: pizza_combos pizza_combos_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza_combos
    ADD CONSTRAINT "pizza_combos_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: dop_product_pizzas pizzas_pkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dop_product_pizzas
    ADD CONSTRAINT pizzas_pkey FOREIGN KEY ("productId") REFERENCES public.products(id);


--
-- Name: pizzas_sizes_variants pizzas_sizes_variants_pizzaId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizzas_sizes_variants
    ADD CONSTRAINT "pizzas_sizes_variants_pizzaId_fkey" FOREIGN KEY ("productId") REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: pizzas_sizes_variants pizzas_sizes_variants_pizzasSizeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizzas_sizes_variants
    ADD CONSTRAINT "pizzas_sizes_variants_pizzasSizeId_fkey" FOREIGN KEY ("pizzasSizeId") REFERENCES public.pizzas_sizes(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: pizzas_sizes_variants pizzas_sizes_variants_pizzasTypesVariantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizzas_sizes_variants
    ADD CONSTRAINT "pizzas_sizes_variants_pizzasTypesVariantId_fkey" FOREIGN KEY ("pizzasTypesVariantId") REFERENCES public.pizzas_types_variants(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: pizzas_types_variants pizzas_types_variants_pizzaInfoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizzas_types_variants
    ADD CONSTRAINT "pizzas_types_variants_pizzaInfoId_fkey" FOREIGN KEY ("pizzaInfoId") REFERENCES public.pizza_infos(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: pizzas_types_variants pizzas_types_variants_pizzasTypeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizzas_types_variants
    ADD CONSTRAINT "pizzas_types_variants_pizzasTypeId_fkey" FOREIGN KEY ("pizzasTypeId") REFERENCES public.pizzas_types(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: baskets product_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baskets
    ADD CONSTRAINT product_fkey FOREIGN KEY ("productId") REFERENCES public.products(id) NOT VALID;


--
-- Name: order_products product_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT product_fkey FOREIGN KEY ("productId") REFERENCES public.products(id) NOT VALID;


--
-- Name: products product_info_pkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT product_info_pkey FOREIGN KEY ("pizzaInfoId") REFERENCES public.pizza_infos(id) NOT VALID;


--
-- Name: products products_type_pkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_type_pkey FOREIGN KEY ("productsTypeId") REFERENCES public.products_types(id) NOT VALID;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

