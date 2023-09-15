--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    distance_in_million_light_years numeric,
    constellation character varying(40) NOT NULL,
    naked_eye_galaxy boolean
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
    name character varying(30) NOT NULL,
    mean_radius_in_km numeric,
    discovery_year integer,
    has_life boolean,
    has_water boolean
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
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    more_info_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    notes text,
    name character varying(60)
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_info_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_info_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_info_more_info_id_seq OWNED BY public.more_info.more_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    radius_in_miles integer,
    temperature_in_kelvin integer,
    mass_in_earths numeric,
    has_life boolean
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
    name character varying(30) NOT NULL,
    radius_in_solar_radius numeric,
    temperature_in_kelvin integer,
    luminosity_in_solar_luminosity integer,
    star_type character varying(60)
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: more_info more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info ALTER COLUMN more_info_id SET DEFAULT nextval('public.more_info_more_info_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, 'Sagittarius', true);
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 0.16, 'Dorado/Mensa', true);
INSERT INTO public.galaxy VALUES (3, 'Small Magellanic Cloud', 0.2, 'Tucana', true);
INSERT INTO public.galaxy VALUES (4, 'Andromeda Galaxy', 2.5, 'Andromeda', true);
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 2.9, 'Triangulum', true);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 13.7, 'Centaurus', true);
INSERT INTO public.galaxy VALUES (7, 'Bode''s Galaxy', 12, 'Ursa Major', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Moon', 1738, NULL, false, false);
INSERT INTO public.moon VALUES (2, 4, 'Phobos', 11.267, 1877, false, false);
INSERT INTO public.moon VALUES (3, 4, 'Deimos', 6.2, 1877, false, false);
INSERT INTO public.moon VALUES (4, 5, 'Lo', 1821, 1610, false, false);
INSERT INTO public.moon VALUES (5, 5, 'Europa', 1560, 1610, false, false);
INSERT INTO public.moon VALUES (6, 5, 'Ganymede', 2634, 1610, false, false);
INSERT INTO public.moon VALUES (7, 5, 'Callisto', 2410, 1610, false, false);
INSERT INTO public.moon VALUES (8, 5, 'Amalthea', 83, 1892, false, false);
INSERT INTO public.moon VALUES (9, 5, 'Himalia', 69.8, 1904, false, false);
INSERT INTO public.moon VALUES (10, 5, 'Elara', 43, 1905, false, false);
INSERT INTO public.moon VALUES (11, 6, 'Mimas', 198.2, 1789, false, false);
INSERT INTO public.moon VALUES (12, 6, 'Enceladus', 252.1, 1789, false, false);
INSERT INTO public.moon VALUES (13, 6, 'Tethy', 533, 1684, false, false);
INSERT INTO public.moon VALUES (14, 6, 'Dione', 561.4, 1684, false, false);
INSERT INTO public.moon VALUES (15, 6, 'Rhea', 763.8, 1672, false, false);
INSERT INTO public.moon VALUES (16, 6, 'Titan', 2574.73, 1655, false, false);
INSERT INTO public.moon VALUES (17, 7, 'Ariel', 578.9, 1851, false, false);
INSERT INTO public.moon VALUES (18, 7, 'Umbriel', 284.7, 1851, false, false);
INSERT INTO public.moon VALUES (19, 7, 'Titania', 788.9, 1787, false, false);
INSERT INTO public.moon VALUES (20, 7, 'Oberon', 761.4, 1787, false, false);
INSERT INTO public.moon VALUES (21, 8, 'Triton', 1353.4, 1846, false, false);
INSERT INTO public.moon VALUES (22, 8, 'Nereid', 170, 1949, false, false);
INSERT INTO public.moon VALUES (23, 8, 'Naiad', 33, 1989, false, false);


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES (1, 1, 'lorem ipsum', 'lorem1');
INSERT INTO public.more_info VALUES (2, 2, 'lorem ipsum', 'lorem2');
INSERT INTO public.more_info VALUES (3, 3, 'lorem ipsum', 'lorem3');
INSERT INTO public.more_info VALUES (4, 4, 'lorem ipsum', 'lorem4');
INSERT INTO public.more_info VALUES (5, 5, 'lorem ipsum', 'lorem5');
INSERT INTO public.more_info VALUES (6, 6, 'lorem ipsum', 'lorem6');
INSERT INTO public.more_info VALUES (7, 7, 'lorem ipsum', 'lorem7');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 1516, 437, 0.055, false);
INSERT INTO public.planet VALUES (2, 1, 'Venus', 3761, 232, 0.857, false);
INSERT INTO public.planet VALUES (3, 1, 'Earth', 3956, 288, 1, true);
INSERT INTO public.planet VALUES (4, 1, 'Mars', 2106, 209, 0.107, false);
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', 43441, 163, 318, false);
INSERT INTO public.planet VALUES (6, 1, 'Saturn', 36184, 133, 95, false);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', 15759, 78, 14, false);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', 15299, 72, 17, false);
INSERT INTO public.planet VALUES (9, 1, 'Pluto', 735, 47, 0.00218, false);
INSERT INTO public.planet VALUES (10, 2, 'Planet1', 1000, 150, 0.05178, false);
INSERT INTO public.planet VALUES (11, 2, 'Planet2', NULL, 400, 3, false);
INSERT INTO public.planet VALUES (12, 3, 'Planet3', NULL, 250, 10, true);
INSERT INTO public.planet VALUES (13, 4, 'Planet4', 2000, 100, 0.6, false);
INSERT INTO public.planet VALUES (14, 5, 'Planet5', 7000, 288, 10, true);
INSERT INTO public.planet VALUES (15, 6, 'Planet6', 10000, 400, 25, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 1, 5772, 1, 'yellow dwarf');
INSERT INTO public.star VALUES (2, 1, 'Vega', 2.362, 9602, 40, 'blue-tinged white');
INSERT INTO public.star VALUES (3, 1, 'HR 5171 Aa', 1060, 4287, 630000, 'yellow hypergiant');
INSERT INTO public.star VALUES (4, 2, 'S Doradus', 380, 8500, 910000, 'luminous blue variable');
INSERT INTO public.star VALUES (5, 2, 'R Doradus', 298, 2710, 4350, 'red giant variable');
INSERT INTO public.star VALUES (6, 2, 'WOH G64', 1540, 3008, 589000, 'red supergiant');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_info_more_info_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_constellation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_key UNIQUE (constellation);


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
-- Name: more_info more_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_name_key UNIQUE (name);


--
-- Name: more_info more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_pkey PRIMARY KEY (more_info_id);


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
-- Name: more_info more_info_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

