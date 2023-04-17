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
    name character varying(35) NOT NULL,
    type character varying(25),
    age_in_bln_years integer,
    distance_in_light_years integer,
    diameter_in_light_years integer,
    number_of_stars integer
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
    name character varying(35) NOT NULL,
    mass_in_lunar_masses numeric(15,13),
    radius_in_moon_radii numeric(10,2),
    has_atmosfere boolean,
    planet_id integer
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
-- Name: observation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.observation (
    observation_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    star_id integer,
    planet_id integer,
    moon_id integer,
    observed_by text,
    name character varying(30) NOT NULL
);


ALTER TABLE public.observation OWNER TO freecodecamp;

--
-- Name: observation_observation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.observation_observation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.observation_observation_id_seq OWNER TO freecodecamp;

--
-- Name: observation_observation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.observation_observation_id_seq OWNED BY public.observation.observation_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(35) NOT NULL,
    type character varying(30),
    mass_in_earth_masses numeric(10,2),
    radius_in_earth_radii numeric(10,2),
    distance_2_star_in_au numeric(10,2),
    atmosphere_comp text,
    star_id integer,
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
    name character varying(35) NOT NULL,
    type character varying(30),
    luminosity_in_solar_eqs numeric(10,1),
    mass_in_solar_masses numeric(10,1),
    temp_in_k integer,
    age_in_bln_years double precision,
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
-- Name: observation observation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation ALTER COLUMN observation_id SET DEFAULT nextval('public.observation_observation_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Spiral', 10, 2350000, 220000, 1000000000);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Spiral', 13, 0, 100000, 100000000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 9, 2900000, 50000, 400000000);
INSERT INTO public.galaxy VALUES (4, 'Whirpool', 'Spiral', 20, 23000000, 100000, 300000000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 12, 29000000, 50000, 100000000);
INSERT INTO public.galaxy VALUES (6, 'Tadpole', 'Irregular', 5, 40000000, 5000, 500000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1.0000000000000, 1.00, false, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 0.0000000000003, 0.01, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 0.0000000000015, 0.03, false, 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 0.0250000000000, 0.41, false, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 0.0188000000000, 0.38, false, 5);
INSERT INTO public.moon VALUES (6, 'Io', 0.0150000000000, 0.29, false, 5);
INSERT INTO public.moon VALUES (7, 'Europa', 0.0080000000000, 0.25, true, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 0.0225000000000, 0.40, true, 6);
INSERT INTO public.moon VALUES (9, 'Enceadus', 0.0000770000000, 0.04, true, 6);
INSERT INTO public.moon VALUES (10, 'Miranda', 0.0000084000000, 0.02, true, 7);
INSERT INTO public.moon VALUES (11, 'Ariel', 0.0026000000000, 0.09, true, 7);
INSERT INTO public.moon VALUES (12, 'Umbriel', 0.0039000000000, 0.09, true, 7);
INSERT INTO public.moon VALUES (13, 'Triton', 0.0021400000000, 0.21, true, 8);
INSERT INTO public.moon VALUES (14, 'Charon', 0.0220000000000, 0.09, true, 9);
INSERT INTO public.moon VALUES (15, 'Nereid', 0.0000015000000, 0.02, true, 10);
INSERT INTO public.moon VALUES (16, 'Proteus', 0.0001100000000, 0.09, true, 11);
INSERT INTO public.moon VALUES (17, 'Hyperion', 0.0003700000000, 0.11, true, 12);
INSERT INTO public.moon VALUES (18, 'Mimas', 0.0000004000000, 0.02, true, 12);
INSERT INTO public.moon VALUES (19, 'Oberon', 0.0030140000000, 0.10, true, 7);
INSERT INTO public.moon VALUES (20, 'Titania', 0.0013520000000, 0.10, true, 7);


--
-- Data for Name: observation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.observation VALUES (1, 1, NULL, NULL, NULL, 'Radio Telescope', 'Background rad');
INSERT INTO public.observation VALUES (2, 1, 1, NULL, NULL, 'kepler space telescope', 'one');
INSERT INTO public.observation VALUES (3, 3, NULL, NULL, NULL, 'Hubble space telescope', 'two');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', 0.06, 0.38, 0.39, 'None', 4, false);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', 0.82, 0.95, 0.72, 'Carbon dioxide & nitrogen', 4, false);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', 1.00, 1.00, 1.00, 'Nitrogen, oxygen & argon', 4, true);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', 0.11, 0.53, 1.52, 'Carbon dioxide, nitrogen & argon', 4, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas giant', 318.00, 11.21, 5.20, 'Hydrogen & helium', 4, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas giant', 95.00, 9.45, 9.58, 'Hydrogen & helium', 4, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice giant', 14.50, 4.01, 19.22, 'Hydrogen, helium & methane', 4, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice giant', 17.10, 3.88, 30.07, 'Hydrogen, helium & methane', 4, false);
INSERT INTO public.planet VALUES (9, 'HD 209458 b', 'Hot Jupiter', 0.69, 1.38, 0.05, 'Sodium, water & carbon dioxide', 3, false);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 'Terrestrial', 1.40, 1.20, 0.36, 'Unknown', 5, false);
INSERT INTO public.planet VALUES (11, 'Gliese 876 d', 'Super_Earth', 6.60, 1.94, 0.02, 'Unknown', 6, false);
INSERT INTO public.planet VALUES (12, 'PSR B1257+12 A', 'Terrestrial', 0.00, 0.02, 0.19, 'Unknown', 2, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 'Main sequence', 25.4, 2.1, 9940, 2.5, 2);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'Red Supergiant', 126000.0, 18.0, 3600, 0.1, 2);
INSERT INTO public.star VALUES (3, 'Vega', 'Main Sequence', 40.0, 2.1, 9600, 0.445, 2);
INSERT INTO public.star VALUES (4, 'Sun', 'Main Sequence', 1.0, 1.0, 5778, 4.6, 2);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 'Main Sequence', 1.5, 1.1, 5790, 6, 2);
INSERT INTO public.star VALUES (6, 'Alpha Centauri B', 'Main Sequence', 0.5, 0.9, 5260, 6, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: observation_observation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.observation_observation_id_seq', 3, true);


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
-- Name: observation observation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT observation_name_key UNIQUE (name);


--
-- Name: observation observation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT observation_pkey PRIMARY KEY (observation_id);


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
-- Name: observation uniq_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT uniq_id UNIQUE (observation_id);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: star gal_starid; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT gal_starid FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_plid; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_plid FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: observation obs_gid; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT obs_gid FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: observation obs_mid; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT obs_mid FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: observation obs_pid; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT obs_pid FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: observation obs_sid; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT obs_sid FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet pla_starid; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT pla_starid FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

