CREATE TABLE public."Users" (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    birthday_date date NOT NULL,
    registr_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    premium boolean DEFAULT false,
    active boolean DEFAULT true
);

CREATE TABLE public."UserProfiles" (
    user_id integer NOT NULL,
    avatar_url character varying(255),
    prefer_language character varying(10) DEFAULT 'ru',
    theme character varying(20) DEFAULT 'dark'
);

CREATE TABLE public."Movies" (
    movie_id integer NOT NULL,
    title character varying(100) NOT NULL,
    release_year integer NOT NULL,
    duration integer NOT NULL,
    age_rating character varying(10) NOT NULL,
    description text,
    available boolean DEFAULT true
);

CREATE TABLE public."Genres" (
    genre_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);

CREATE TABLE public."MovieGenres" (
    movie_id integer NOT NULL,
    genre_id integer NOT NULL
);

CREATE TABLE public."Actors" (
    actor_id integer NOT NULL,
    full_name character varying(100) NOT NULL,
    birth_date date
);

CREATE TABLE public."MovieActors" (
    movie_id integer NOT NULL,
    actor_id integer NOT NULL,
    role_name character varying(100),
    main_role boolean DEFAULT false
);

CREATE TABLE public."Subscriptions" (
    subs_id integer NOT NULL,
    user_id integer NOT NULL,
    subs_type character varying(20) NOT NULL,
    subs_start timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    subs_end timestamp without time zone NOT NULL,
    auto_renewal boolean DEFAULT true
);

CREATE TABLE public."Viewings" (
    viewing_id integer NOT NULL,
    user_id integer NOT NULL,
    movie_id integer NOT NULL,
    begin_view timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    end_view timestamp without time zone,
    device_type character varying(50)
);

CREATE TABLE public."Ratings" (
    rating_id integer NOT NULL,
    user_id integer NOT NULL,
    movie_id integer NOT NULL,
    rating numeric(2,1) NOT NULL,
    review_text text
);

CREATE TABLE public."Favorites" (
    user_id integer NOT NULL,
    movie_id integer NOT NULL,
    add_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);