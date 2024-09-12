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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(30),
    size_in_light_years integer,
    number_of_stars bigint
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
    name character varying(30) NOT NULL,
    description text,
    planet_id integer,
    diameter_in_km numeric(10,3)
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
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(30),
    size_in_light_years numeric(10,3),
    galaxy_id integer
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebula_nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(30),
    distance_from_star_in_au numeric(10,3),
    has_life boolean,
    number_of_moons integer,
    star_id integer
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
    name character varying(30) NOT NULL,
    type character varying(30),
    mass_in_solar_masses numeric(10,3),
    has_exoplanets boolean,
    galaxy_id integer
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
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_nebula_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 61000, 40000000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 260000, 1000000000000);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 100000, 100000000000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 76900, 100000000000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 50000, 80000000000);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'Lenticular', 150000, 100000000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth’s only natural satellite, influencing tides and stabilizing the planet’s tilt.', 3, 3474.800);
INSERT INTO public.moon VALUES (2, 'Phobos', 'A small, irregularly shaped moon of Mars, with a rapidly decaying orbit.', 4, 22.400);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Mars outer moon, smaller and more distant than Phobos.', 4, 12.400);
INSERT INTO public.moon VALUES (4, 'Io', 'Jupiter’s innermost moon, known for its active volcanism.', 5, 3643.200);
INSERT INTO public.moon VALUES (5, 'Europa', 'An icy moon of Jupiter, suspected to have a subsurface ocean.', 5, 3121.600);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'The largest moon in the Solar System, larger than Mercury.', 5, 5268.200);
INSERT INTO public.moon VALUES (7, 'Callisto', 'The second-largest moon of Jupiter, heavily cratered and ancient.', 5, 4820.600);
INSERT INTO public.moon VALUES (8, 'Titan', 'The largest moon of Saturn, with a dense atmosphere.', 6, 5150.000);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'A moon of Saturn with active water-ice geysers.', 6, 504.200);
INSERT INTO public.moon VALUES (10, 'Mimas', 'A small moon of Saturn, known for its large crater that makes it resemble the Death Star.', 6, 396.400);
INSERT INTO public.moon VALUES (11, 'Proxima b Moon 1', 'A hypothetical moon of Proxima b.', 7, 1500.000);
INSERT INTO public.moon VALUES (12, 'Proxima c Moon 1', 'A hypothetical moon orbiting Proxima c.', 8, 1200.000);
INSERT INTO public.moon VALUES (13, 'T-Rigel I Moon 1', 'A moon orbiting T-Rigel I.', 9, 2100.000);
INSERT INTO public.moon VALUES (14, 'T-Rigel I Moon 2', 'The second moon of T-Rigel I.', 9, 2400.000);
INSERT INTO public.moon VALUES (15, 'T-Rigel II Moon 1', 'A moon orbiting T-Rigel II.', 10, 1300.000);
INSERT INTO public.moon VALUES (16, 'Whirlpool Alpha Moon 1', 'The largest moon of Whirlpool Alpha.', 11, 3100.000);
INSERT INTO public.moon VALUES (17, 'Whirlpool Alpha Moon 2', 'A smaller moon of Whirlpool Alpha.', 11, 1800.000);
INSERT INTO public.moon VALUES (18, 'Whirlpool Beta Moon 1', 'A moon orbiting Whirlpool Beta.', 12, 3700.000);
INSERT INTO public.moon VALUES (19, 'Whirlpool Beta Moon 2', 'The second moon of Whirlpool Beta.', 12, 2900.000);
INSERT INTO public.moon VALUES (20, 'Hypothetical Moon', 'A hypothetical moon in a fictional planetary system.', 5, 2000.000);


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (1, 'Orion Nebula', 'Emission Nebula', 24.000, 1);
INSERT INTO public.nebula VALUES (2, 'Helix Nebula', 'Planetary Nebula', 2.870, 1);
INSERT INTO public.nebula VALUES (3, 'Andromeda Nebula', 'Reflection Nebula', 15.000, 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', 0.390, false, 0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', 0.720, false, 0, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', 1.000, true, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', 1.520, false, 2, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', 5.200, false, 79, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', 9.580, false, 83, 1);
INSERT INTO public.planet VALUES (7, 'Proxima b', 'Terrestrial', 0.050, true, 0, 3);
INSERT INTO public.planet VALUES (8, 'Proxima c', 'Super-Earth', 1.500, false, 0, 3);
INSERT INTO public.planet VALUES (9, 'T-Rigel I', 'Gas Giant', 0.800, false, 2, 4);
INSERT INTO public.planet VALUES (10, 'T-Rigel II', 'Terrestrial', 2.300, false, 1, 4);
INSERT INTO public.planet VALUES (11, 'Whirlpool Alpha', 'Super-Earth', 1.400, true, 2, 6);
INSERT INTO public.planet VALUES (12, 'Whirlpool Beta', 'Gas Giant', 2.900, false, 3, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type Main Sequence', 1.000, true, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Red Dwarf', 0.122, true, 2);
INSERT INTO public.star VALUES (3, 'Sirius', 'Main Sequence', 2.020, false, 1);
INSERT INTO public.star VALUES (4, 'Rigel', 'Blue Supergiant', 18.000, false, 2);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'Red Supergiant', 18.000, false, 3);
INSERT INTO public.star VALUES (6, 'Vega', 'Main Sequence', 2.100, true, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_nebula_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: nebula nebula_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_name_key UNIQUE (name);


--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: nebula nebula_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

