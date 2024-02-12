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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    secret_number integer NOT NULL,
    number_of_guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    user_id integer NOT NULL,
    username character varying(255) NOT NULL
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_user_id_seq OWNER TO freecodecamp;

--
-- Name: players_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_user_id_seq OWNED BY public.players.user_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: players user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN user_id SET DEFAULT nextval('public.players_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 8, 8);
INSERT INTO public.games VALUES (2, 1, 2, 2);
INSERT INTO public.games VALUES (3, 2, 9, 4);
INSERT INTO public.games VALUES (4, 3, 9, 10);
INSERT INTO public.games VALUES (5, 3, 4, 5);
INSERT INTO public.games VALUES (6, 4, 6, 7);
INSERT INTO public.games VALUES (7, 4, 5, 6);
INSERT INTO public.games VALUES (8, 3, 10, 13);
INSERT INTO public.games VALUES (9, 3, 2, 4);
INSERT INTO public.games VALUES (10, 3, 2, 3);
INSERT INTO public.games VALUES (11, 5, 4, 5);
INSERT INTO public.games VALUES (12, 5, 1, 2);
INSERT INTO public.games VALUES (13, 6, 8, 9);
INSERT INTO public.games VALUES (14, 6, 7, 8);
INSERT INTO public.games VALUES (15, 5, 4, 7);
INSERT INTO public.games VALUES (16, 5, 2, 4);
INSERT INTO public.games VALUES (17, 5, 8, 9);
INSERT INTO public.games VALUES (18, 7, 8, 9);
INSERT INTO public.games VALUES (19, 7, 3, 4);
INSERT INTO public.games VALUES (20, 8, 1, 2);
INSERT INTO public.games VALUES (21, 8, 3, 4);
INSERT INTO public.games VALUES (22, 7, 10, 13);
INSERT INTO public.games VALUES (23, 7, 4, 6);
INSERT INTO public.games VALUES (24, 7, 6, 7);
INSERT INTO public.games VALUES (25, 9, 2, 3);
INSERT INTO public.games VALUES (26, 9, 8, 9);
INSERT INTO public.games VALUES (27, 10, 9, 10);
INSERT INTO public.games VALUES (28, 10, 1, 2);
INSERT INTO public.games VALUES (29, 9, 8, 11);
INSERT INTO public.games VALUES (30, 9, 1, 3);
INSERT INTO public.games VALUES (31, 9, 10, 11);
INSERT INTO public.games VALUES (32, 11, 8, 9);
INSERT INTO public.games VALUES (33, 11, 3, 4);
INSERT INTO public.games VALUES (34, 12, 2, 3);
INSERT INTO public.games VALUES (35, 12, 6, 7);
INSERT INTO public.games VALUES (36, 11, 10, 13);
INSERT INTO public.games VALUES (37, 11, 8, 10);
INSERT INTO public.games VALUES (38, 11, 5, 6);
INSERT INTO public.games VALUES (39, 13, 10, 11);
INSERT INTO public.games VALUES (40, 13, 7, 8);
INSERT INTO public.games VALUES (41, 14, 6, 7);
INSERT INTO public.games VALUES (42, 14, 10, 11);
INSERT INTO public.games VALUES (43, 13, 10, 13);
INSERT INTO public.games VALUES (44, 13, 7, 9);
INSERT INTO public.games VALUES (45, 13, 5, 6);
INSERT INTO public.games VALUES (46, 15, 1, 2);
INSERT INTO public.games VALUES (47, 15, 2, 3);
INSERT INTO public.games VALUES (48, 16, 6, 7);
INSERT INTO public.games VALUES (49, 16, 4, 5);
INSERT INTO public.games VALUES (50, 15, 2, 5);
INSERT INTO public.games VALUES (51, 15, 1, 3);
INSERT INTO public.games VALUES (52, 15, 10, 11);
INSERT INTO public.games VALUES (53, 17, 6, 7);
INSERT INTO public.games VALUES (54, 17, 10, 11);
INSERT INTO public.games VALUES (55, 18, 3, 4);
INSERT INTO public.games VALUES (56, 18, 5, 6);
INSERT INTO public.games VALUES (57, 17, 6, 9);
INSERT INTO public.games VALUES (58, 17, 5, 7);
INSERT INTO public.games VALUES (59, 17, 8, 9);
INSERT INTO public.games VALUES (60, 19, 5, 6);
INSERT INTO public.games VALUES (61, 19, 5, 6);
INSERT INTO public.games VALUES (62, 20, 10, 11);
INSERT INTO public.games VALUES (63, 20, 4, 5);
INSERT INTO public.games VALUES (64, 19, 6, 9);
INSERT INTO public.games VALUES (65, 19, 1, 3);
INSERT INTO public.games VALUES (66, 19, 10, 11);
INSERT INTO public.games VALUES (67, 21, 5, 6);
INSERT INTO public.games VALUES (68, 21, 4, 5);
INSERT INTO public.games VALUES (69, 22, 4, 5);
INSERT INTO public.games VALUES (70, 22, 6, 7);
INSERT INTO public.games VALUES (71, 21, 7, 10);
INSERT INTO public.games VALUES (72, 21, 8, 10);
INSERT INTO public.games VALUES (73, 21, 6, 7);
INSERT INTO public.games VALUES (74, 23, 5, 6);
INSERT INTO public.games VALUES (75, 23, 1, 2);
INSERT INTO public.games VALUES (76, 24, 5, 6);
INSERT INTO public.games VALUES (77, 24, 6, 7);
INSERT INTO public.games VALUES (78, 23, 6, 9);
INSERT INTO public.games VALUES (79, 23, 1, 3);
INSERT INTO public.games VALUES (80, 23, 6, 7);
INSERT INTO public.games VALUES (81, 25, 2, 3);
INSERT INTO public.games VALUES (82, 25, 10, 11);
INSERT INTO public.games VALUES (83, 26, 8, 9);
INSERT INTO public.games VALUES (84, 26, 5, 6);
INSERT INTO public.games VALUES (85, 25, 5, 8);
INSERT INTO public.games VALUES (86, 25, 7, 9);
INSERT INTO public.games VALUES (87, 25, 8, 9);
INSERT INTO public.games VALUES (119, 50, 6, 7);
INSERT INTO public.games VALUES (120, 50, 1, 2);
INSERT INTO public.games VALUES (121, 51, 2, 5);
INSERT INTO public.games VALUES (122, 51, 6, 8);
INSERT INTO public.games VALUES (123, 51, 1, 2);
INSERT INTO public.games VALUES (124, 52, 402, 403);
INSERT INTO public.games VALUES (125, 52, 981, 982);
INSERT INTO public.games VALUES (126, 53, 18, 19);
INSERT INTO public.games VALUES (127, 53, 939, 940);
INSERT INTO public.games VALUES (128, 52, 321, 324);
INSERT INTO public.games VALUES (129, 52, 306, 308);
INSERT INTO public.games VALUES (130, 52, 66, 67);
INSERT INTO public.games VALUES (131, 54, 566, 567);
INSERT INTO public.games VALUES (132, 54, 733, 734);
INSERT INTO public.games VALUES (133, 55, 111, 112);
INSERT INTO public.games VALUES (134, 55, 739, 740);
INSERT INTO public.games VALUES (135, 54, 978, 981);
INSERT INTO public.games VALUES (136, 54, 957, 959);
INSERT INTO public.games VALUES (137, 54, 787, 788);
INSERT INTO public.games VALUES (138, 56, 379, 380);
INSERT INTO public.games VALUES (139, 56, 245, 246);
INSERT INTO public.games VALUES (140, 57, 603, 604);
INSERT INTO public.games VALUES (141, 57, 875, 876);
INSERT INTO public.games VALUES (142, 56, 379, 382);
INSERT INTO public.games VALUES (143, 56, 616, 618);
INSERT INTO public.games VALUES (144, 56, 393, 394);
INSERT INTO public.games VALUES (145, 58, 4, 5);
INSERT INTO public.games VALUES (146, 58, 4, 5);
INSERT INTO public.games VALUES (147, 59, 7, 8);
INSERT INTO public.games VALUES (148, 59, 1, 2);
INSERT INTO public.games VALUES (149, 58, 3, 6);
INSERT INTO public.games VALUES (150, 58, 2, 4);
INSERT INTO public.games VALUES (151, 58, 10, 11);
INSERT INTO public.games VALUES (152, 60, 3, 4);
INSERT INTO public.games VALUES (153, 60, 4, 5);
INSERT INTO public.games VALUES (154, 61, 10, 11);
INSERT INTO public.games VALUES (155, 61, 9, 10);
INSERT INTO public.games VALUES (156, 60, 9, 12);
INSERT INTO public.games VALUES (157, 60, 2, 4);
INSERT INTO public.games VALUES (158, 60, 10, 11);
INSERT INTO public.games VALUES (159, 62, 7, 8);
INSERT INTO public.games VALUES (160, 62, 5, 6);
INSERT INTO public.games VALUES (161, 63, 8, 9);
INSERT INTO public.games VALUES (162, 63, 7, 8);
INSERT INTO public.games VALUES (163, 62, 4, 7);
INSERT INTO public.games VALUES (164, 62, 2, 4);
INSERT INTO public.games VALUES (165, 62, 1, 2);
INSERT INTO public.games VALUES (166, 64, 6, 7);
INSERT INTO public.games VALUES (167, 64, 4, 5);
INSERT INTO public.games VALUES (168, 65, 4, 5);
INSERT INTO public.games VALUES (169, 65, 6, 7);
INSERT INTO public.games VALUES (170, 64, 1, 1);
INSERT INTO public.games VALUES (171, 64, 10, 12);
INSERT INTO public.games VALUES (172, 64, 10, 11);
INSERT INTO public.games VALUES (173, 66, 164, 165);
INSERT INTO public.games VALUES (174, 66, 441, 442);
INSERT INTO public.games VALUES (175, 67, 657, 658);
INSERT INTO public.games VALUES (176, 67, 76, 77);
INSERT INTO public.games VALUES (177, 66, 919, 922);
INSERT INTO public.games VALUES (178, 66, 254, 256);
INSERT INTO public.games VALUES (179, 66, 482, 483);
INSERT INTO public.games VALUES (180, 68, 642, 643);
INSERT INTO public.games VALUES (181, 68, 231, 232);
INSERT INTO public.games VALUES (182, 69, 187, 188);
INSERT INTO public.games VALUES (183, 69, 104, 105);
INSERT INTO public.games VALUES (184, 68, 219, 222);
INSERT INTO public.games VALUES (185, 68, 912, 914);
INSERT INTO public.games VALUES (186, 68, 707, 708);
INSERT INTO public.games VALUES (187, 70, 121, 122);
INSERT INTO public.games VALUES (188, 70, 71, 72);
INSERT INTO public.games VALUES (189, 71, 733, 734);
INSERT INTO public.games VALUES (190, 71, 332, 333);
INSERT INTO public.games VALUES (191, 70, 247, 250);
INSERT INTO public.games VALUES (192, 70, 299, 301);
INSERT INTO public.games VALUES (193, 70, 732, 733);
INSERT INTO public.games VALUES (194, 72, 949, 950);
INSERT INTO public.games VALUES (195, 72, 667, 668);
INSERT INTO public.games VALUES (196, 73, 523, 524);
INSERT INTO public.games VALUES (197, 73, 194, 195);
INSERT INTO public.games VALUES (198, 72, 845, 848);
INSERT INTO public.games VALUES (199, 72, 893, 895);
INSERT INTO public.games VALUES (200, 72, 273, 274);
INSERT INTO public.games VALUES (201, 74, 590, 591);
INSERT INTO public.games VALUES (202, 74, 991, 992);
INSERT INTO public.games VALUES (203, 75, 248, 249);
INSERT INTO public.games VALUES (204, 75, 188, 189);
INSERT INTO public.games VALUES (205, 74, 887, 890);
INSERT INTO public.games VALUES (206, 74, 363, 365);
INSERT INTO public.games VALUES (207, 74, 367, 368);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (1, 'aly');
INSERT INTO public.players VALUES (2, 'ahmed');
INSERT INTO public.players VALUES (3, 'user_1707744275606');
INSERT INTO public.players VALUES (4, 'user_1707744275605');
INSERT INTO public.players VALUES (5, 'user_1707744296892');
INSERT INTO public.players VALUES (6, 'user_1707744296891');
INSERT INTO public.players VALUES (7, 'user_1707744327838');
INSERT INTO public.players VALUES (8, 'user_1707744327837');
INSERT INTO public.players VALUES (9, 'user_1707744349340');
INSERT INTO public.players VALUES (10, 'user_1707744349339');
INSERT INTO public.players VALUES (11, 'user_1707744555779');
INSERT INTO public.players VALUES (12, 'user_1707744555778');
INSERT INTO public.players VALUES (13, 'user_1707744643839');
INSERT INTO public.players VALUES (14, 'user_1707744643838');
INSERT INTO public.players VALUES (15, 'user_1707744692537');
INSERT INTO public.players VALUES (16, 'user_1707744692536');
INSERT INTO public.players VALUES (17, 'user_1707744706324');
INSERT INTO public.players VALUES (18, 'user_1707744706323');
INSERT INTO public.players VALUES (19, 'user_1707744731132');
INSERT INTO public.players VALUES (20, 'user_1707744731131');
INSERT INTO public.players VALUES (21, 'user_1707744737921');
INSERT INTO public.players VALUES (22, 'user_1707744737920');
INSERT INTO public.players VALUES (23, 'user_1707744769922');
INSERT INTO public.players VALUES (24, 'user_1707744769921');
INSERT INTO public.players VALUES (25, 'user_1707744787681');
INSERT INTO public.players VALUES (26, 'user_1707744787680');
INSERT INTO public.players VALUES (50, 'user_1707746660721');
INSERT INTO public.players VALUES (51, 'user_1707746660722');
INSERT INTO public.players VALUES (52, 'user_1707746721923');
INSERT INTO public.players VALUES (53, 'user_1707746721922');
INSERT INTO public.players VALUES (54, 'user_1707746729955');
INSERT INTO public.players VALUES (55, 'user_1707746729954');
INSERT INTO public.players VALUES (56, 'user_1707746740148');
INSERT INTO public.players VALUES (57, 'user_1707746740147');
INSERT INTO public.players VALUES (58, 'user_1707747098152');
INSERT INTO public.players VALUES (59, 'user_1707747098151');
INSERT INTO public.players VALUES (60, 'user_1707747104189');
INSERT INTO public.players VALUES (61, 'user_1707747104188');
INSERT INTO public.players VALUES (62, 'user_1707747116041');
INSERT INTO public.players VALUES (63, 'user_1707747116040');
INSERT INTO public.players VALUES (64, 'user_1707747154551');
INSERT INTO public.players VALUES (65, 'user_1707747154550');
INSERT INTO public.players VALUES (66, 'user_1707747199696');
INSERT INTO public.players VALUES (67, 'user_1707747199695');
INSERT INTO public.players VALUES (68, 'user_1707747217251');
INSERT INTO public.players VALUES (69, 'user_1707747217250');
INSERT INTO public.players VALUES (70, 'user_1707748760021');
INSERT INTO public.players VALUES (71, 'user_1707748760020');
INSERT INTO public.players VALUES (72, 'user_1707748836727');
INSERT INTO public.players VALUES (73, 'user_1707748836726');
INSERT INTO public.players VALUES (74, 'user_1707748884743');
INSERT INTO public.players VALUES (75, 'user_1707748884742');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('ahmed', 2, 1);
INSERT INTO public.users VALUES ('user_1707743777795', 2, 2);
INSERT INTO public.users VALUES ('user_1707690428383', 2, 663);
INSERT INTO public.users VALUES ('user_1707690428384', 5, 52);
INSERT INTO public.users VALUES ('user_1707743777796', 5, 2);
INSERT INTO public.users VALUES ('user_1707744144428', 2, 503);
INSERT INTO public.users VALUES ('user_1707691757765', 2, 4);
INSERT INTO public.users VALUES ('user_1707691757766', 5, 6);
INSERT INTO public.users VALUES ('user_1707743795627', 2, 5);
INSERT INTO public.users VALUES ('user_1707744144429', 5, 9);
INSERT INTO public.users VALUES ('user_1707691780689', 2, 6);
INSERT INTO public.users VALUES ('user_1707743795628', 5, 3);
INSERT INTO public.users VALUES ('user_1707691780690', 5, 8);
INSERT INTO public.users VALUES ('user_1707692097717', 1, 15);
INSERT INTO public.users VALUES ('user_1707692097716', 1, 271);
INSERT INTO public.users VALUES ('user_1707746965005', 2, 40);
INSERT INTO public.users VALUES ('user_1707692132969', 2, 182);
INSERT INTO public.users VALUES ('user_1707692132970', 5, 57);
INSERT INTO public.users VALUES ('user_1707743846936', 2, 3);
INSERT INTO public.users VALUES ('user_1707744177973', 2, 357);
INSERT INTO public.users VALUES ('user_1707692191765', 2, 258);
INSERT INTO public.users VALUES ('user_1707743846937', 5, 2);
INSERT INTO public.users VALUES ('user_1707692191766', 5, 98);
INSERT INTO public.users VALUES ('user_1707746965006', 5, 178);
INSERT INTO public.users VALUES ('user_1707695280863', 2, 107);
INSERT INTO public.users VALUES ('user_1707744177974', 5, 486);
INSERT INTO public.users VALUES ('user_1707743871671', 2, 311);
INSERT INTO public.users VALUES ('user_1707695280864', 5, 41);
INSERT INTO public.users VALUES ('user_1707743871672', 5, 46);
INSERT INTO public.users VALUES ('user_1707741031280', 2, 260);
INSERT INTO public.users VALUES ('user_1707741031281', 5, 161);
INSERT INTO public.users VALUES ('user_1707741581262', 2, 429);
INSERT INTO public.users VALUES ('user_1707743926117', 2, 44);
INSERT INTO public.users VALUES ('user_1707744193786', 2, 192);
INSERT INTO public.users VALUES ('user_1707741581263', 5, 165);
INSERT INTO public.users VALUES ('user_1707743926118', 5, 101);
INSERT INTO public.users VALUES ('user_1707741660272', 2, 129);
INSERT INTO public.users VALUES ('user_1707746996928', 2, 107);
INSERT INTO public.users VALUES ('user_1707744193787', 5, 199);
INSERT INTO public.users VALUES ('user_1707741660273', 5, 226);
INSERT INTO public.users VALUES ('aly', 6, 2);
INSERT INTO public.users VALUES ('user_1707743944500', 2, 442);
INSERT INTO public.users VALUES ('user_1707742774428', 2, 7);
INSERT INTO public.users VALUES ('user_1707743944501', 5, 219);
INSERT INTO public.users VALUES ('user_1707742774429', 5, 4);
INSERT INTO public.users VALUES ('user_1707746996929', 5, 27);
INSERT INTO public.users VALUES ('user_1707743118962', 2, 3);
INSERT INTO public.users VALUES ('user_1707744224127', 2, 551);
INSERT INTO public.users VALUES ('user_1707743118963', 5, 6);
INSERT INTO public.users VALUES ('user_1707743980738', 2, 7);
INSERT INTO public.users VALUES ('user_1707743191322', 2, 2);
INSERT INTO public.users VALUES ('user_1707743980739', 5, 186);
INSERT INTO public.users VALUES ('user_1707743191323', 5, 5);
INSERT INTO public.users VALUES ('user_1707744224128', 5, 290);
INSERT INTO public.users VALUES ('user_1707744046181', 2, 788);
INSERT INTO public.users VALUES ('user_1707744046182', 5, 72);
INSERT INTO public.users VALUES ('user_1707746796022', 2, 136);
INSERT INTO public.users VALUES ('user_1707744094246', 2, 113);
INSERT INTO public.users VALUES ('user_1707746796023', 5, 9);
INSERT INTO public.users VALUES ('user_1707744094247', 5, 170);
INSERT INTO public.users VALUES ('user_1707744118288', 2, 420);
INSERT INTO public.users VALUES ('user_1707744118289', 5, 96);
INSERT INTO public.users VALUES ('user_1707746810618', 2, 720);
INSERT INTO public.users VALUES ('user_1707746810619', 5, 385);
INSERT INTO public.users VALUES ('user_1707746901005', 2, 277);
INSERT INTO public.users VALUES ('user_1707746901006', 5, 137);
INSERT INTO public.users VALUES ('user_1707746942490', 2, 340);
INSERT INTO public.users VALUES ('user_1707746942491', 5, 266);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 207, true);


--
-- Name: players_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_user_id_seq', 75, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (user_id);


--
-- Name: players players_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_username_key UNIQUE (username);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.players(user_id);


--
-- PostgreSQL database dump complete
--

