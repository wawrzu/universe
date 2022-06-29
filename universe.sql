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
    name character varying(50) NOT NULL,
    description text,
    number_of_planets integer,
    distance_from_mw_in_millions_of_ly numeric(9,2),
    galaxy_type character varying(20)
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
-- Name: galaxy_group; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_group (
    galaxy_group_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.galaxy_group OWNER TO freecodecamp;

--
-- Name: galaxy_group_group_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_group_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_group_group_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_group_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_group_group_id_seq OWNED BY public.galaxy_group.galaxy_group_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_in_km numeric(10,2),
    orbit_distance_in_mil_km numeric(5,2)
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
    description text,
    has_life boolean,
    is_spherical boolean,
    planet_type character varying(30),
    mean_temp integer,
    galaxy_id integer
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
    description text,
    diameter_in_mil_of_km numeric(5,2),
    is_visible boolean NOT NULL
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
-- Name: galaxy_group galaxy_group_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_group ALTER COLUMN galaxy_group_id SET DEFAULT nextval('public.galaxy_group_group_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Includes our Solar System', 100, 0.00, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Named after an Ethiopian princess', 1000, 2.54, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 'Holds the Tarantula Nebula', 547, 0.16, 'Magellanic spiral');
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 'One of the most distant permanent objects that can be viewed with a naked eye', 435, 3.20, 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', '5th brightest galaxy', 817, 10.00, 'Elliptical');
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', 'Long included in the lores of natives in the southern hemisphere', 234, 0.20, 'Irregular');


--
-- Data for Name: galaxy_group; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_group VALUES (1, 1, 'Local Group');
INSERT INTO public.galaxy_group VALUES (2, 2, 'Local Group');
INSERT INTO public.galaxy_group VALUES (3, 3, 'Local Group');
INSERT INTO public.galaxy_group VALUES (4, 4, 'Local Group');
INSERT INTO public.galaxy_group VALUES (5, 5, 'CentaurusA/M83 Group');
INSERT INTO public.galaxy_group VALUES (6, 6, 'Local Group');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 4, 'Moon', 3474.80, 0.36);
INSERT INTO public.moon VALUES (2, 6, 'Io', 3642.00, 0.42);
INSERT INTO public.moon VALUES (3, 6, 'Ganymede', 5268.20, 1.07);
INSERT INTO public.moon VALUES (4, 6, 'Callisto', 4820.60, 1.87);
INSERT INTO public.moon VALUES (5, 6, 'Europa', 3121.60, 0.66);
INSERT INTO public.moon VALUES (6, 7, 'Titan', 5149.46, 1.19);
INSERT INTO public.moon VALUES (7, 7, 'Rhea', 3064.80, 0.53);
INSERT INTO public.moon VALUES (8, 7, 'Iapetus', 2938.00, 3.56);
INSERT INTO public.moon VALUES (9, 7, 'Dione', 2257.60, 0.38);
INSERT INTO public.moon VALUES (10, 7, 'Tethys', 2153.60, 0.29);
INSERT INTO public.moon VALUES (11, 7, 'Enceladus', 1026.40, 0.24);
INSERT INTO public.moon VALUES (12, 7, 'Mimas', 831.20, 0.18);
INSERT INTO public.moon VALUES (13, 5, 'Phobos', 225334.00, 0.01);
INSERT INTO public.moon VALUES (14, 5, 'Deimos', 12.40, 0.02);
INSERT INTO public.moon VALUES (15, 9, 'Neso', 60.00, 21.22);
INSERT INTO public.moon VALUES (16, 9, 'Nereid', 714.00, 5.51);
INSERT INTO public.moon VALUES (17, 9, 'Triton', 2706.00, 0.35);
INSERT INTO public.moon VALUES (18, 8, 'Oberon', 1522.80, 0.58);
INSERT INTO public.moon VALUES (19, 8, 'Titania', 1576.80, 0.44);
INSERT INTO public.moon VALUES (20, 8, 'Ariel', 2324.40, 0.19);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 'Smallest planet in our Solar System', false, true, 'Rocky', 100, 1);
INSERT INTO public.planet VALUES (3, 1, 'Venus', 'Named after a Roman goddess', false, true, 'Rocky', 737, 1);
INSERT INTO public.planet VALUES (4, 1, 'Earth', 'Our home', true, true, 'Rocky', 288, 1);
INSERT INTO public.planet VALUES (5, 1, 'Mars', 'Named after a Roman god', false, true, 'Rocky', 210, 1);
INSERT INTO public.planet VALUES (6, 1, 'Jupiter', 'Big', false, true, 'Gaseous', 200, 1);
INSERT INTO public.planet VALUES (7, 1, 'Saturn', 'Has rings around it', false, true, 'Gaseous', 88, 1);
INSERT INTO public.planet VALUES (8, 1, 'Uranus', 'Funny name', false, true, 'Ice Giant', 49, 1);
INSERT INTO public.planet VALUES (9, 1, 'Neptune', 'Also named after a god', false, true, 'Ice Giant', 50, 1);
INSERT INTO public.planet VALUES (10, 1, 'Pluto', 'Not a planet anymore', false, true, 'Dwarf', 33, 1);
INSERT INTO public.planet VALUES (11, 6, 'Planet1', NULL, false, true, 'Unknown', NULL, 1);
INSERT INTO public.planet VALUES (12, 6, 'Planet2', NULL, false, true, 'Unknown', NULL, 1);
INSERT INTO public.planet VALUES (13, 6, 'Planet3', NULL, false, true, 'Unknown', NULL, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 'Heart of our Solar System', 1.35, true);
INSERT INTO public.star VALUES (2, 1, 'Sirius', 'Brightest star in the night sky', 2.38, true);
INSERT INTO public.star VALUES (3, 2, 'Alpha Andromedae', 'Brightest star in the Andromeda Constellation', NULL, false);
INSERT INTO public.star VALUES (4, 2, 'Mirach', 'Second brightest star in the Andromeda Constellation', NULL, false);
INSERT INTO public.star VALUES (5, 1, 'Betelgeuse', 'Part of the constellation of Orion', 1.23, true);
INSERT INTO public.star VALUES (6, 1, 'Rigel', 'Brightest star in the constellation of Orion', 109.78, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_group_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_group_group_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy_group galaxy_group_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_group
    ADD CONSTRAINT galaxy_group_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy_group galaxy_group_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_group
    ADD CONSTRAINT galaxy_group_pkey PRIMARY KEY (galaxy_group_id);


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
-- Name: galaxy_group galaxy_group_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_group
    ADD CONSTRAINT galaxy_group_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

