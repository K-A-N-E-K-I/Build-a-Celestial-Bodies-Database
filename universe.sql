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
    diameter_km numeric(10,2),
    is_potentially_hazardous boolean NOT NULL,
    discovery_year integer,
    orbit_type character varying(50)
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
    age_in_millions_of_years integer,
    diameter_in_light_years numeric(10,2),
    has_black_hole boolean NOT NULL,
    description text,
    number_of_stars bigint NOT NULL,
    is_spiral boolean
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
    name character varying(50) NOT NULL,
    planet_id integer,
    radius_km integer,
    is_spherical boolean NOT NULL,
    has_water boolean,
    orbital_period_days numeric(10,2) NOT NULL,
    surface_gravity_ms2 numeric(5,2)
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
    name character varying(50) NOT NULL,
    star_id integer,
    mass_earth_masses numeric(10,2),
    radius_km integer,
    has_atmosphere boolean NOT NULL,
    is_habitable boolean,
    orbital_period_days numeric(10,2) NOT NULL,
    surface_temperature_celsius integer
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
    name character varying(50) NOT NULL,
    galaxy_id integer,
    mass_solar_masses numeric(10,2),
    temperature_kelvin integer,
    is_binary boolean NOT NULL,
    spectral_type character varying(10),
    age_in_millions_of_years integer NOT NULL,
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

INSERT INTO public.asteroid VALUES (1, 'Ceres', 939.40, false, 1801, 'Cinturón de asteroides');
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525.40, false, 1807, 'Cinturón de asteroides');
INSERT INTO public.asteroid VALUES (3, 'Apophis', 370.00, true, 2004, 'Cercano a la Tierra');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Vía Láctea', 13600, 100000.00, true, 'Nuestra galaxia', 400000000000, true);
INSERT INTO public.galaxy VALUES (2, 'Andrómeda', 10000, 220000.00, true, 'Galaxia espiral más cercana', 1000000000000, true);
INSERT INTO public.galaxy VALUES (3, 'Triángulo', 5000, 60000.00, false, 'Tercera galaxia más grande del Grupo Local', 40000000000, true);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 13270, 60000.00, true, 'Galaxia activa más cercana', 100000000000, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 13250, 50000.00, true, 'Galaxia espiral con forma de sombrero', 100000000000, true);
INSERT INTO public.galaxy VALUES (6, 'Remolino', 13280, 76000.00, false, 'Galaxia espiral interactuando con NGC 5195', 100000000000, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (81, 'Luna', 61, 1737, true, true, 27.32, 1.62);
INSERT INTO public.moon VALUES (82, 'Fobos', 62, 11, false, false, 0.32, 0.01);
INSERT INTO public.moon VALUES (83, 'Deimos', 62, 6, false, false, 1.26, 0.00);
INSERT INTO public.moon VALUES (84, 'Io', 64, 1821, true, false, 1.77, 1.80);
INSERT INTO public.moon VALUES (85, 'Europa', 64, 1560, true, true, 3.55, 1.31);
INSERT INTO public.moon VALUES (86, 'Ganímedes', 64, 2634, true, true, 7.15, 1.43);
INSERT INTO public.moon VALUES (87, 'Calisto', 64, 2410, true, true, 16.69, 1.24);
INSERT INTO public.moon VALUES (88, 'Titán', 65, 2576, true, true, 15.95, 1.35);
INSERT INTO public.moon VALUES (89, 'Encélado', 65, 252, true, true, 1.37, 0.11);
INSERT INTO public.moon VALUES (90, 'Mimas', 65, 198, true, false, 0.94, 0.06);
INSERT INTO public.moon VALUES (91, 'Miranda', 66, 236, true, false, 1.41, 0.08);
INSERT INTO public.moon VALUES (92, 'Ariel', 66, 579, true, true, 2.52, 0.27);
INSERT INTO public.moon VALUES (93, 'Umbriel', 66, 585, true, true, 4.14, 0.23);
INSERT INTO public.moon VALUES (94, 'Titania', 66, 788, true, true, 8.71, 0.37);
INSERT INTO public.moon VALUES (95, 'Oberón', 66, 761, true, true, 13.46, 0.35);
INSERT INTO public.moon VALUES (96, 'Tritón', 67, 1353, true, true, 5.88, 0.78);
INSERT INTO public.moon VALUES (97, 'Nereida', 67, 170, false, false, 360.14, 0.07);
INSERT INTO public.moon VALUES (98, 'Náyade', 67, 33, false, false, 0.29, 0.02);
INSERT INTO public.moon VALUES (99, 'Talasa', 67, 41, false, false, 0.31, 0.02);
INSERT INTO public.moon VALUES (100, 'Despina', 67, 75, false, false, 0.33, 0.03);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (61, 'Tierra', 7, 1.00, 6371, true, true, 365.26, 15);
INSERT INTO public.planet VALUES (62, 'Marte', 7, 0.11, 3389, true, false, 687.00, -63);
INSERT INTO public.planet VALUES (63, 'Venus', 7, 0.82, 6052, true, false, 224.70, 462);
INSERT INTO public.planet VALUES (64, 'Júpiter', 7, 317.80, 69911, true, false, 4332.59, -110);
INSERT INTO public.planet VALUES (65, 'Saturno', 7, 95.20, 58232, true, false, 10759.22, -140);
INSERT INTO public.planet VALUES (66, 'Urano', 7, 14.50, 25362, true, false, 30688.50, -195);
INSERT INTO public.planet VALUES (67, 'Neptuno', 7, 17.10, 24622, true, false, 60195.00, -200);
INSERT INTO public.planet VALUES (68, 'Mercurio', 7, 0.06, 2439, false, false, 87.97, 167);
INSERT INTO public.planet VALUES (69, 'Próxima Centauri b', 8, 1.07, 7160, true, true, 11.19, -39);
INSERT INTO public.planet VALUES (70, 'Kepler-186f', 9, 1.17, 8749, true, true, 129.90, -85);
INSERT INTO public.planet VALUES (71, 'HD 209458 b', 10, 220.00, 94410, true, false, 3.52, 1000);
INSERT INTO public.planet VALUES (72, 'Gliese 581g', 11, 3.10, 9311, true, true, 36.60, -37);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (7, 'Sol', 1, 1.00, 5778, false, 'G2V', 4600, true);
INSERT INTO public.star VALUES (8, 'Próxima Centauri', 1, 0.12, 3042, false, 'M5.5Ve', 4850, true);
INSERT INTO public.star VALUES (9, 'Alpha Centauri A', 1, 1.10, 5790, true, 'G2V', 5300, true);
INSERT INTO public.star VALUES (10, 'Betelgeuse', 1, 11.60, 3500, false, 'M1-2', 8, false);
INSERT INTO public.star VALUES (11, 'Sirius A', 1, 2.02, 9940, true, 'A1V', 242, false);
INSERT INTO public.star VALUES (12, 'Vega', 1, 2.10, 9602, false, 'A0V', 455, true);


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

SELECT pg_catalog.setval('public.moon_moon_id_seq', 100, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 72, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


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

