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
    name character varying(30) NOT NULL,
    galaxy_type character varying(60) NOT NULL,
    number_of_star_systems character varying(60) NOT NULL,
    light_years_from_milky_way numeric(11,8)
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
    name character varying(60) NOT NULL,
    moon_type text NOT NULL,
    planet_orbiting character varying(60) NOT NULL,
    is_spherical boolean
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
    name character varying(30) NOT NULL,
    earth_mass numeric(8,4),
    orbital_period_in_earth_days integer
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
    galaxy_id integer,
    name character varying(30) NOT NULL,
    star_type text NOT NULL,
    is_binary boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_info (
    star_info_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    light_years_from_earth integer
);


ALTER TABLE public.star_info OWNER TO freecodecamp;

--
-- Name: star_info_star_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_info_star_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_info_star_info_id_seq OWNER TO freecodecamp;

--
-- Name: star_info_star_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_info_star_info_id_seq OWNED BY public.star_info.star_info_id;


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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star_info star_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_info ALTER COLUMN star_info_id SET DEFAULT nextval('public.star_info_star_info_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'spiral', '100 billion', 0.00000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'spiral', '1 trillion', 2.50000000);
INSERT INTO public.galaxy VALUES (3, 'Messier 82', 'starburst', '30 billion', 12.00000000);
INSERT INTO public.galaxy VALUES (4, 'Centaures A', 'elliptical', '1 billion', 12.00000000);
INSERT INTO public.galaxy VALUES (5, 'Mayalls Object', 'peculiar ring and tail', 'unclear', 500.00000000);
INSERT INTO public.galaxy VALUES (6, 'Leo II', 'dwarf', '82252', 760.00000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'The Moon', 'rocky', 'Earth', true);
INSERT INTO public.moon VALUES (2, 6, 'Titan', 'icy', 'Saturn', true);
INSERT INTO public.moon VALUES (3, 6, 'Iapetus', 'icy', 'Saturn', true);
INSERT INTO public.moon VALUES (4, 6, 'Hyperion', 'icy', 'Saturn', true);
INSERT INTO public.moon VALUES (5, 6, 'Tethys', 'icy', 'Saturn', false);
INSERT INTO public.moon VALUES (6, 6, 'Daphnis', 'icy', 'Saturn', false);
INSERT INTO public.moon VALUES (7, 5, 'Thebe', 'icy', 'Jupiter', false);
INSERT INTO public.moon VALUES (8, 4, 'Phobos', 'rubble', 'Mars', false);
INSERT INTO public.moon VALUES (9, 9, 'Charon', 'cryovolcanic', 'Pluto', true);
INSERT INTO public.moon VALUES (10, 6, 'Dione', 'icy rock', 'Saturn', true);
INSERT INTO public.moon VALUES (11, 8, 'Nereid', 'unknown', 'Neptune', false);
INSERT INTO public.moon VALUES (12, 7, 'Umbriel', 'icy rock', 'Uranus', true);
INSERT INTO public.moon VALUES (13, 6, 'Methone', 'icy fluff', 'Saturn', false);
INSERT INTO public.moon VALUES (14, 5, 'Callirrhoe', 'unknown', 'Jupiter', NULL);
INSERT INTO public.moon VALUES (15, 6, 'Tarvos', 'moon fragment', 'Saturn', NULL);
INSERT INTO public.moon VALUES (16, 7, 'Titania', 'icy rock', 'Uranus', true);
INSERT INTO public.moon VALUES (17, 7, 'Oberon', 'icy rock', 'Uranus', true);
INSERT INTO public.moon VALUES (18, 7, 'Europa', 'silicate rock', 'Uranus', true);
INSERT INTO public.moon VALUES (19, 5, 'Io', 'volacnic sulfur', 'Jupiter', true);
INSERT INTO public.moon VALUES (20, 5, 'Callisto', 'icy rock', 'Jupiter', true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 0.0500, 88);
INSERT INTO public.planet VALUES (2, 1, 'Venus', 0.8100, 225);
INSERT INTO public.planet VALUES (3, 1, 'Earth', 1.0000, 365);
INSERT INTO public.planet VALUES (4, 1, 'Mars', 0.1000, 687);
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', 317.8000, 4380);
INSERT INTO public.planet VALUES (6, 1, 'Saturn', 95.2000, 10585);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', 14.5000, 30660);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', 17.1000, 60225);
INSERT INTO public.planet VALUES (9, 1, 'Pluto', 0.2000, 905203);
INSERT INTO public.planet VALUES (10, 1, 'Planet X', 10.0000, 5475000);
INSERT INTO public.planet VALUES (11, 3, 'Proxima Centauri b', 1.1000, 4015);
INSERT INTO public.planet VALUES (12, 6, 'AEgir', 248.0000, 2692);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'The Sun', 'dwarf', false);
INSERT INTO public.star VALUES (3, 2, 'Proxima Centauri', 'dwarf', false);
INSERT INTO public.star VALUES (4, 3, 'Rigil and Toliman', 'dwarf', true);
INSERT INTO public.star VALUES (5, 4, 'Sirius', 'blue white', true);
INSERT INTO public.star VALUES (6, 5, 'Epsilon Eridani', 'dark', true);
INSERT INTO public.star VALUES (7, 6, 'Procyon', 'subgiant', true);


--
-- Data for Name: star_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_info VALUES (1, 1, 'The Sun', 'yellow dwarf', 0);
INSERT INTO public.star_info VALUES (2, 3, 'Proxima Centauri', 'red dwarf', 4);
INSERT INTO public.star_info VALUES (3, 4, 'Rigil and Toliman', 'blue white binary', 4);
INSERT INTO public.star_info VALUES (4, 5, 'Sirius', 'blue white binary', 8);
INSERT INTO public.star_info VALUES (5, 6, 'Epsilon Eridani', 'eclipsing dark binary', 10);
INSERT INTO public.star_info VALUES (6, 7, 'Procyon', 'yellow white binary subgiant', 11);


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
-- Name: star_info_star_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_info_star_info_id_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: star_info star_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_info
    ADD CONSTRAINT star_info_pkey PRIMARY KEY (star_info_id);


--
-- Name: star_info star_info_star_info_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_info
    ADD CONSTRAINT star_info_star_info_id_key UNIQUE (star_info_id);


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
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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
-- Name: star_info star_info_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_info
    ADD CONSTRAINT star_info_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

