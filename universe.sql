--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(50) NOT NULL,
    diameter integer,
    composition text,
    is_potentially_hazardous boolean
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    size integer,
    age numeric,
    description text,
    is_active boolean NOT NULL,
    has_black_hole boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    diameter integer,
    orbital_period numeric,
    surface_features text,
    is_tidally_locked boolean,
    has_atmosphere boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    diameter integer,
    mass numeric,
    composition text,
    has_atmosphere boolean,
    has_water boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    temperature integer,
    mass numeric,
    spectral_type text,
    is_binary boolean,
    has_planets boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 939, 'Rocky-icy', false);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525, 'Rocky', false);
INSERT INTO public.asteroid VALUES (3, 'Eros', 16, 'Silicate', true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 13.6, 'Our home galaxy', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 220000, 10.0, 'Nearest spiral galaxy', true, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 60000, 5.0, 'Third-largest in Local Group', true, false);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 60000, 13.2, 'Peculiar galaxy', true, true);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 60000, 0.4, 'Interacting grand-design spiral galaxy', true, false);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 50000, 13.25, 'Peculiar galaxy', false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Moon', 3474, 27.3, 'Craters, maria', true, false);
INSERT INTO public.moon VALUES (2, 3, 'Io', 3642, 1.77, 'Volcanoes', true, false);
INSERT INTO public.moon VALUES (3, 3, 'Europa', 3122, 3.55, 'Ice crust', true, false);
INSERT INTO public.moon VALUES (4, 3, 'Ganymede', 5268, 7.15, 'Grooved terrain', true, false);
INSERT INTO public.moon VALUES (5, 3, 'Callisto', 4821, 16.69, 'Craters', true, false);
INSERT INTO public.moon VALUES (6, 4, 'Titan', 5150, 15.95, 'Liquid methane seas', true, true);
INSERT INTO public.moon VALUES (7, 4, 'Enceladus', 504, 1.37, 'Icy geysers', true, false);
INSERT INTO public.moon VALUES (8, 4, 'Mimas', 396, 0.94, 'Large impact crater', true, false);
INSERT INTO public.moon VALUES (9, 7, 'Miranda', 472, 1.41, 'Varied terrain', true, false);
INSERT INTO public.moon VALUES (10, 7, 'Ariel', 1158, 2.52, 'Canyons', true, false);
INSERT INTO public.moon VALUES (11, 7, 'Umbriel', 1169, 4.14, 'Dark surface', true, false);
INSERT INTO public.moon VALUES (12, 7, 'Titania', 1577, 8.71, 'Large canyons', true, false);
INSERT INTO public.moon VALUES (13, 7, 'Oberon', 1523, 13.46, 'Impact craters', true, false);
INSERT INTO public.moon VALUES (14, 8, 'Triton', 2707, -5.88, 'Nitrogen geysers', true, true);
INSERT INTO public.moon VALUES (15, 8, 'Nereid', 340, 360.14, 'Irregular shape', false, false);
INSERT INTO public.moon VALUES (16, 3, 'Amalthea', 167, 0.50, 'Red color', true, false);
INSERT INTO public.moon VALUES (17, 4, 'Hyperion', 270, 21.28, 'Sponge-like appearance', false, false);
INSERT INTO public.moon VALUES (18, 4, 'Iapetus', 1469, 79.32, 'Two-toned coloration', true, false);
INSERT INTO public.moon VALUES (19, 3, 'Thebe', 99, 0.67, 'Irregular shape', true, false);
INSERT INTO public.moon VALUES (20, 4, 'Phoebe', 213, -550.48, 'Retrograde orbit', false, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', 12742, 1.0, 'Rocky', true, true);
INSERT INTO public.planet VALUES (2, 1, 'Mars', 6779, 0.107, 'Rocky', true, true);
INSERT INTO public.planet VALUES (3, 1, 'Jupiter', 139820, 317.8, 'Gas giant', true, false);
INSERT INTO public.planet VALUES (4, 1, 'Saturn', 116460, 95.2, 'Gas giant', true, false);
INSERT INTO public.planet VALUES (5, 1, 'Venus', 12104, 0.815, 'Rocky', true, false);
INSERT INTO public.planet VALUES (6, 1, 'Mercury', 4879, 0.055, 'Rocky', false, false);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', 50724, 14.5, 'Ice giant', true, true);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', 49244, 17.1, 'Ice giant', true, true);
INSERT INTO public.planet VALUES (9, 2, 'Proxima Centauri b', 12000, 1.07, 'Rocky', true, true);
INSERT INTO public.planet VALUES (10, 3, 'Sirius b', 11600, 0.978, 'White dwarf', false, false);
INSERT INTO public.planet VALUES (11, 4, 'Alpheratz b', 150000, 13.0, 'Gas giant', true, false);
INSERT INTO public.planet VALUES (12, 6, 'Alpha Centauri Ab', 15000, 1.1, 'Rocky', true, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 5778, 1.0, 'G2V', false, true);
INSERT INTO public.star VALUES (2, 1, 'Proxima Centauri', 3042, 0.123, 'M5.5Ve', false, true);
INSERT INTO public.star VALUES (3, 1, 'Sirius', 9940, 2.02, 'A1V', true, false);
INSERT INTO public.star VALUES (4, 2, 'Alpheratz', 13000, 3.8, 'B8IVpMnHg', true, false);
INSERT INTO public.star VALUES (5, 3, 'S Trianguli', 3500, 1.2, 'M3III', false, false);
INSERT INTO public.star VALUES (6, 4, 'Alpha Centauri A', 5790, 1.1, 'G2V', true, true);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

