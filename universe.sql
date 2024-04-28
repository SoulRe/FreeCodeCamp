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
    name character varying(40) NOT NULL,
    description text,
    galaxy_type character varying(60) NOT NULL,
    has_life character varying(3) NOT NULL,
    age_in_millions_of_years numeric(8,2)
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
    habitable boolean NOT NULL,
    description text,
    distance_to_respective_planet_in_km integer,
    approx_orbit_time_in_days integer
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
    name character varying(60) NOT NULL,
    description text,
    age_in_millions_of_years numeric(6,2) NOT NULL,
    habitable boolean NOT NULL
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    age_in_millions_of_years numeric(4,2) NOT NULL,
    description text,
    name_of_star_system character varying(60)
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral galaxy containing billions of stars, including our solar system.', 'Spiral', 'YES', 13000.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral galaxy located 2.537 million light-years away from Earth.', 'Spiral', 'NO', 11000.00);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'Massive elliptical galaxy in the Virgo Cluster, home to the first imaged black hole.', 'Elliptical', 'NO', 6000.75);
INSERT INTO public.galaxy VALUES (4, 'NGC 1300', 'Barred spiral galaxy known for its prominent central bar structure.', 'Barred Spiral', 'NO', 14000.00);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Interacting galaxy system consisting of two galaxies, M51a and M51b.', 'Interacting', 'NO', 23000.00);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'Spiral galaxy in the Local Group, third-largest galaxy after the Milky Way and Andromeda.', 'Spiral', 'NO', 2000.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Luna', false, 'Earth''s Moon', 384400, 27);
INSERT INTO public.moon VALUES (2, 4, 'Phobos', false, 'Moon of Mars', 9377, 1);
INSERT INTO public.moon VALUES (3, 4, 'Deimos', false, 'Moon of Mars', 23460, 2);
INSERT INTO public.moon VALUES (4, 21, 'Io', false, 'Moon of Jupiter', 421800, 1);
INSERT INTO public.moon VALUES (5, 21, 'Europa', false, 'Moon of Jupiter', 671100, 2);
INSERT INTO public.moon VALUES (6, 21, 'Ganymede', false, 'Moon of Jupiter', 1070400, 4);
INSERT INTO public.moon VALUES (7, 21, 'Callisto', false, 'Moon of Jupiter', 1882700, 17);
INSERT INTO public.moon VALUES (8, 22, 'Titan', false, 'Moon of Saturn', 1221870, 16);
INSERT INTO public.moon VALUES (9, 22, 'Enceladus', false, 'Moon of Saturn', 238020, 1);
INSERT INTO public.moon VALUES (10, 22, 'Rhea', false, 'Moon of Saturn', 527040, 4);
INSERT INTO public.moon VALUES (11, 22, 'Mimas', false, 'Moon of Saturn', 185520, 0);
INSERT INTO public.moon VALUES (12, 23, 'Miranda', false, 'Moon of Uranus', 129390, 1);
INSERT INTO public.moon VALUES (13, 23, 'Ariel', false, 'Moon of Uranus', 190900, 2);
INSERT INTO public.moon VALUES (14, 23, 'Umbriel', false, 'Moon of Uranus', 266000, 4);
INSERT INTO public.moon VALUES (15, 23, 'Titania', false, 'Moon of Uranus', 435910, 8);
INSERT INTO public.moon VALUES (16, 23, 'Oberon', false, 'Moon of Uranus', 583520, 13);
INSERT INTO public.moon VALUES (17, 24, 'Triton', false, 'Moon of Neptune', 354760, 5);
INSERT INTO public.moon VALUES (18, 24, 'Nereid', false, 'Moon of Neptune', 5514000, 360);
INSERT INTO public.moon VALUES (19, 24, 'Proteus', false, 'Moon of Neptune', 117647, 1);
INSERT INTO public.moon VALUES (20, 21, 'Himalia', false, 'Moon of Jupiter', 11440000, 250);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 'Innermost planet in the Solar System.', 4.60, false);
INSERT INTO public.planet VALUES (2, 1, 'Venus', 'Second planet from the Sun, known for its thick atmosphere.', 4.60, false);
INSERT INTO public.planet VALUES (3, 1, 'Earth', 'Third planet from the Sun, home to diverse life forms.', 4.60, true);
INSERT INTO public.planet VALUES (4, 1, 'Mars', 'Fourth planet from the Sun, with evidence of past water.', 4.60, false);
INSERT INTO public.planet VALUES (5, 2, 'Proxima b', 'Exoplanet orbiting Proxima Centauri, potentially habitable.', 4.85, true);
INSERT INTO public.planet VALUES (6, 2, 'Proxima c', 'Exoplanet with a longer orbital period around Proxima Centauri.', 4.85, false);
INSERT INTO public.planet VALUES (7, 3, 'Alpha Centauri A I', 'First planet orbiting Alpha Centauri A.', 6.10, false);
INSERT INTO public.planet VALUES (8, 3, 'Alpha Centauri A II', 'Second planet orbiting Alpha Centauri A.', 6.10, false);
INSERT INTO public.planet VALUES (9, 4, 'Andromeda Alpha I', 'First planet orbiting Andromeda Alpha.', 8.50, false);
INSERT INTO public.planet VALUES (10, 4, 'Andromeda Alpha II', 'Second planet orbiting Andromeda Alpha.', 8.50, false);
INSERT INTO public.planet VALUES (11, 5, 'Andromeda Beta I', 'First planet orbiting Andromeda Beta.', 7.20, false);
INSERT INTO public.planet VALUES (12, 5, 'Andromeda Beta II', 'Second planet orbiting Andromeda Beta.', 7.20, false);
INSERT INTO public.planet VALUES (13, 6, 'M87 Exoplanet', 'Exoplanet orbiting Messier 87.', 9.80, false);
INSERT INTO public.planet VALUES (14, 7, 'M87 Beta Exoplanet', 'Exoplanet orbiting Messier 87.', 8.60, false);
INSERT INTO public.planet VALUES (15, 8, 'NGC 1300 Alpha Exoplanet', 'Exoplanet orbiting NGC 1300.', 12.40, false);
INSERT INTO public.planet VALUES (16, 9, 'NGC 1300 Beta Exoplanet', 'Exoplanet orbiting NGC 1300.', 11.10, false);
INSERT INTO public.planet VALUES (17, 10, 'Whirlpool Alpha Exoplanet', 'Exoplanet orbiting Whirlpool galaxy.', 10.20, false);
INSERT INTO public.planet VALUES (18, 11, 'Whirlpool Beta Exoplanet', 'Exoplanet orbiting Whirlpool galaxy.', 9.50, false);
INSERT INTO public.planet VALUES (19, 12, 'Triangulum Alpha Exoplanet', 'Exoplanet orbiting Triangulum galaxy.', 6.30, true);
INSERT INTO public.planet VALUES (20, 13, 'Triangulum Beta Exoplanet', 'Exoplanet orbiting Triangulum galaxy.', 5.80, false);
INSERT INTO public.planet VALUES (21, 1, 'Jupiter', 'Fifth planet from the Sun, gas giant with a large number of moons.', 4.60, false);
INSERT INTO public.planet VALUES (22, 1, 'Saturn', 'Sixth planet from the Sun, known for its prominent ring system.', 4.60, false);
INSERT INTO public.planet VALUES (23, 1, 'Uranus', 'Seventh planet from the Sun, an ice giant with tilted rotational axis.', 4.60, false);
INSERT INTO public.planet VALUES (24, 1, 'Neptune', 'Eighth planet from the Sun, known for its blue color and strong winds.', 4.60, false);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (11, 'Exoplanet', 5);
INSERT INTO public.planet_type VALUES (12, 'Exoplanet', 6);
INSERT INTO public.planet_type VALUES (13, 'Exoplanet', 7);
INSERT INTO public.planet_type VALUES (14, 'Exoplanet', 8);
INSERT INTO public.planet_type VALUES (15, 'Exoplanet', 9);
INSERT INTO public.planet_type VALUES (16, 'Exoplanet', 10);
INSERT INTO public.planet_type VALUES (17, 'Exoplanet', 11);
INSERT INTO public.planet_type VALUES (18, 'Exoplanet', 12);
INSERT INTO public.planet_type VALUES (19, 'Exoplanet', 13);
INSERT INTO public.planet_type VALUES (20, 'Exoplanet', 14);
INSERT INTO public.planet_type VALUES (21, 'Exoplanet', 15);
INSERT INTO public.planet_type VALUES (22, 'Exoplanet', 16);
INSERT INTO public.planet_type VALUES (23, 'Exoplanet', 17);
INSERT INTO public.planet_type VALUES (24, 'Exoplanet', 18);
INSERT INTO public.planet_type VALUES (25, 'Exoplanet', 19);
INSERT INTO public.planet_type VALUES (26, 'Exoplanet', 20);
INSERT INTO public.planet_type VALUES (3, 'Terrestrial', 3);
INSERT INTO public.planet_type VALUES (4, 'Gas Giant', 21);
INSERT INTO public.planet_type VALUES (5, 'Gas Giant', 22);
INSERT INTO public.planet_type VALUES (6, 'Gas Giant', 23);
INSERT INTO public.planet_type VALUES (7, 'Gas Giant', 24);
INSERT INTO public.planet_type VALUES (8, 'Terrestrial', 1);
INSERT INTO public.planet_type VALUES (9, 'Terrestrial', 2);
INSERT INTO public.planet_type VALUES (10, 'Terrestrial', 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 4.60, 'The Sun is the star at the center of our solar system.', 'Solar System');
INSERT INTO public.star VALUES (2, 1, 'Proxima Centauri', 4.85, 'Red dwarf star closest to the Sun, part of the Alpha Centauri star system.', 'Alpha Centauri');
INSERT INTO public.star VALUES (3, 1, 'Alpha Centauri A', 6.10, 'Main sequence star in the Alpha Centauri star system.', 'Alpha Centauri');
INSERT INTO public.star VALUES (4, 2, 'Andromeda Alpha', 8.50, 'Main sequence star in the Andromeda galaxy.', 'Andromeda System');
INSERT INTO public.star VALUES (5, 2, 'Andromeda Beta', 7.20, 'Giant star located in the Andromeda galaxy.', 'Andromeda System');
INSERT INTO public.star VALUES (6, 3, 'Messier 87 Alpha', 9.80, 'Main sequence star in the Messier 87 galaxy.', 'Messier 87 System');
INSERT INTO public.star VALUES (7, 3, 'Messier 87 Beta', 8.60, 'Giant star located in the Messier 87 galaxy.', 'Messier 87 System');
INSERT INTO public.star VALUES (8, 4, 'NGC 1300 Alpha', 12.40, 'Main sequence star in the NGC 1300 galaxy.', 'NGC 1300 System');
INSERT INTO public.star VALUES (9, 4, 'NGC 1300 Beta', 11.10, 'Giant star located in the NGC 1300 galaxy.', 'NGC 1300 System');
INSERT INTO public.star VALUES (10, 6, 'Whirlpool Alpha', 10.20, 'Main sequence star in the Whirlpool galaxy.', 'Whirlpool System');
INSERT INTO public.star VALUES (11, 6, 'Whirlpool Beta', 9.50, 'Giant star located in the Whirlpool galaxy.', 'Whirlpool System');
INSERT INTO public.star VALUES (12, 5, 'Triangulum Alpha', 6.30, 'Main sequence star in the Triangulum galaxy.', 'Triangulum System');
INSERT INTO public.star VALUES (13, 5, 'Triangulum Beta', 5.80, 'Giant star located in the Triangulum galaxy.', 'Triangulum System');


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 26, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 13, true);


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
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_id UNIQUE (galaxy_id);


--
-- Name: moon unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);


--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);


--
-- Name: planet_type unique_planet_type_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT unique_planet_type_id UNIQUE (planet_type_id);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


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
-- Name: planet_type planet_type_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

