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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_of_stars integer NOT NULL,
    year_discovered integer,
    hemisphere_visible text NOT NULL,
    is_zodiac boolean,
    resembles_name boolean
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_million_years numeric(6,1) NOT NULL,
    galaxy_shape text,
    lightyears_from_earth integer NOT NULL,
    approx_number_stars_in_millions integer NOT NULL,
    visible_naked_eye boolean NOT NULL,
    visible_optical_telescope boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_million_years numeric(6,1),
    distance_from_planet_km integer,
    size_in_earth_moon_ratio integer,
    has_life boolean,
    has_water boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_million_years numeric(6,1) NOT NULL,
    planet_type text,
    size_in_earth_ratio integer,
    lightyears_from_earth integer,
    has_life boolean,
    has_water boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_million_years numeric(6,1),
    star_type text,
    lightyears_from_earth integer NOT NULL,
    can_supernova boolean NOT NULL,
    visible_naked_eye boolean NOT NULL,
    luminosity integer NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'pegasus', 15, 600, 'northern', false, false);
INSERT INTO public.constellation VALUES (2, 'pegasus2', 15, 600, 'northern', false, false);
INSERT INTO public.constellation VALUES (3, 'pegasus3', 15, 600, 'northern', false, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home', 8000.0, 'spiral', 0, 10000, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest one, future part of us', 6000.0, 'spiral', 100000000, 70000, true, true);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 'cool', 6000.0, 'spiral', 23000000, 70000, false, true);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'cool hat', 3000.0, 'ring', 30000000, 30000, false, true);
INSERT INTO public.galaxy VALUES (5, 'MGC 7814', 'mini sombrero', 2000.0, 'ring', 30000000, 3000, false, true);
INSERT INTO public.galaxy VALUES (6, 'MGC 7501', 'far away mini thing', 600.0, 'elliptical', 1000, 30000, false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 'beauty', 1000.0, 0, 1, false, false, 1);
INSERT INTO public.moon VALUES (2, 'moon2', 'beauty', 1000.0, 0, 1, false, false, 1);
INSERT INTO public.moon VALUES (3, 'moon3', 'beauty', 1000.0, 0, 1, false, false, 1);
INSERT INTO public.moon VALUES (4, 'moon18', 'beauty', 1000.0, 0, 1, false, false, 1);
INSERT INTO public.moon VALUES (5, 'moon19', 'beauty', 1000.0, 0, 1, false, false, 1);
INSERT INTO public.moon VALUES (6, 'moon20', 'beauty', 1000.0, 0, 1, false, false, 1);
INSERT INTO public.moon VALUES (7, 'moon4', 'beauty', 1000.0, 0, 1, false, false, 1);
INSERT INTO public.moon VALUES (8, 'moon5', 'beauty', 1000.0, 0, 1, false, false, 1);
INSERT INTO public.moon VALUES (9, 'moon6', 'beauty', 1000.0, 0, 1, false, false, 1);
INSERT INTO public.moon VALUES (10, 'moon7', 'beauty', 1000.0, 0, 1, false, false, 1);
INSERT INTO public.moon VALUES (11, 'moon8', 'beauty', 1000.0, 0, 1, false, false, 1);
INSERT INTO public.moon VALUES (12, 'moon9', 'beauty', 1000.0, 0, 1, false, false, 1);
INSERT INTO public.moon VALUES (13, 'moon10', 'beauty', 1000.0, 0, 1, false, false, 1);
INSERT INTO public.moon VALUES (14, 'moon11', 'beauty', 1000.0, 0, 1, false, false, 1);
INSERT INTO public.moon VALUES (15, 'moon12', 'beauty', 1000.0, 0, 1, false, false, 1);
INSERT INTO public.moon VALUES (16, 'moon13', 'beauty', 1000.0, 0, 1, false, false, 1);
INSERT INTO public.moon VALUES (17, 'moon14', 'beauty', 1000.0, 0, 1, false, false, 1);
INSERT INTO public.moon VALUES (18, 'moon15', 'beauty', 1000.0, 0, 1, false, false, 1);
INSERT INTO public.moon VALUES (19, 'moon16', 'beauty', 1000.0, 0, 1, false, false, 1);
INSERT INTO public.moon VALUES (20, 'moon17', 'beauty', 1000.0, 0, 1, false, false, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'earth', 'hey its us', 4000.0, 'rock', 1, 0, true, true, 1);
INSERT INTO public.planet VALUES (2, 'earth2', 'hey its us', 4000.0, 'rock', 1, 0, true, true, 1);
INSERT INTO public.planet VALUES (3, 'earth3', 'hey its us', 4000.0, 'rock', 1, 0, true, true, 1);
INSERT INTO public.planet VALUES (4, 'earth4', 'hey its us', 4000.0, 'rock', 1, 0, true, true, 1);
INSERT INTO public.planet VALUES (5, 'earth5', 'hey its us', 4000.0, 'rock', 1, 0, true, true, 1);
INSERT INTO public.planet VALUES (6, 'earth6', 'hey its us', 4000.0, 'rock', 1, 0, true, true, 1);
INSERT INTO public.planet VALUES (7, 'earth7', 'hey its us', 4000.0, 'rock', 1, 0, true, true, 1);
INSERT INTO public.planet VALUES (8, 'earth8', 'hey its us', 4000.0, 'rock', 1, 0, true, true, 1);
INSERT INTO public.planet VALUES (9, 'earth9', 'hey its us', 4000.0, 'rock', 1, 0, true, true, 1);
INSERT INTO public.planet VALUES (10, 'earth10', 'hey its us', 4000.0, 'rock', 1, 0, true, true, 1);
INSERT INTO public.planet VALUES (11, 'earth11', 'hey its us', 4000.0, 'rock', 1, 0, true, true, 1);
INSERT INTO public.planet VALUES (12, 'earth12', 'hey its us', 4000.0, 'rock', 1, 0, true, true, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', 'a', 4000.0, 'yellow', 0, false, true, 30, 1);
INSERT INTO public.star VALUES (2, 'sun2', 'a', 1.0, 'yellow', 0, false, true, 5, 1);
INSERT INTO public.star VALUES (3, 'sun3', 'q', 9.0, 'red', 1000, true, false, 10, 2);
INSERT INTO public.star VALUES (4, 'sun4', 'w', 1000.0, 'blue', 10, true, true, 20, 2);
INSERT INTO public.star VALUES (5, 'sun5', 'c', 1.0, 'a', 1, true, true, 2, 3);
INSERT INTO public.star VALUES (6, 'sun6', 'c', 4.0, 's', 1, false, false, 3, 4);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 3, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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

