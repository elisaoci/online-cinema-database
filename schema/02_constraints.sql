-- Первичные ключи
ALTER TABLE ONLY public."Users" ADD CONSTRAINT "Users_pkey" PRIMARY KEY (user_id);
ALTER TABLE ONLY public."UserProfiles" ADD CONSTRAINT "UserProfiles_pkey" PRIMARY KEY (user_id);
ALTER TABLE ONLY public."Movies" ADD CONSTRAINT "Movies_pkey" PRIMARY KEY (movie_id);
ALTER TABLE ONLY public."Genres" ADD CONSTRAINT "Genres_pkey" PRIMARY KEY (genre_id);
ALTER TABLE ONLY public."Actors" ADD CONSTRAINT "Actors_pkey" PRIMARY KEY (actor_id);
ALTER TABLE ONLY public."Subscriptions" ADD CONSTRAINT "Subscriptions_pkey" PRIMARY KEY (subs_id);
ALTER TABLE ONLY public."Viewings" ADD CONSTRAINT "Viewings_pkey" PRIMARY KEY (viewing_id);
ALTER TABLE ONLY public."Ratings" ADD CONSTRAINT "Ratings_pkey" PRIMARY KEY (rating_id);
ALTER TABLE ONLY public."Favorites" ADD CONSTRAINT "Favorites_pkey" PRIMARY KEY (user_id, movie_id);
ALTER TABLE ONLY public."MovieGenres" ADD CONSTRAINT "MovieGenres_pkey" PRIMARY KEY (movie_id, genre_id);
ALTER TABLE ONLY public."MovieActors" ADD CONSTRAINT "MovieActors_pkey" PRIMARY KEY (movie_id, actor_id);

-- Внешние ключи
ALTER TABLE ONLY public."UserProfiles" ADD CONSTRAINT "UserProfiles_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."Users"(user_id);
ALTER TABLE ONLY public."Subscriptions" ADD CONSTRAINT "Subscriptions_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."Users"(user_id);
ALTER TABLE ONLY public."Viewings" ADD CONSTRAINT "Viewings_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."Users"(user_id);
ALTER TABLE ONLY public."Viewings" ADD CONSTRAINT "Viewings_movie_id_fkey" FOREIGN KEY (movie_id) REFERENCES public."Movies"(movie_id);
ALTER TABLE ONLY public."Ratings" ADD CONSTRAINT "Ratings_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."Users"(user_id);
ALTER TABLE ONLY public."Ratings" ADD CONSTRAINT "Ratings_movie_id_fkey" FOREIGN KEY (movie_id) REFERENCES public."Movies"(movie_id);
ALTER TABLE ONLY public."Favorites" ADD CONSTRAINT "Favorites_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."Users"(user_id);
ALTER TABLE ONLY public."Favorites" ADD CONSTRAINT "Favorites_movie_id_fkey" FOREIGN KEY (movie_id) REFERENCES public."Movies"(movie_id);
ALTER TABLE ONLY public."MovieGenres" ADD CONSTRAINT "MovieGenres_movie_id_fkey" FOREIGN KEY (movie_id) REFERENCES public."Movies"(movie_id);
ALTER TABLE ONLY public."MovieGenres" ADD CONSTRAINT "MovieGenres_genre_id_fkey" FOREIGN KEY (genre_id) REFERENCES public."Genres"(genre_id);
ALTER TABLE ONLY public."MovieActors" ADD CONSTRAINT "MovieActors_movie_id_fkey" FOREIGN KEY (movie_id) REFERENCES public."Movies"(movie_id);
ALTER TABLE ONLY public."MovieActors" ADD CONSTRAINT "MovieActors_actor_id_fkey" FOREIGN KEY (actor_id) REFERENCES public."Actors"(actor_id);

-- CHECK-ограничения
ALTER TABLE ONLY public."Users" ADD CONSTRAINT "Users_birth_date_check" CHECK (birthday_date <= (CURRENT_DATE - '16 years'::interval));
ALTER TABLE ONLY public."Users" ADD CONSTRAINT "Users_email_check" CHECK (email ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');
ALTER TABLE ONLY public."Movies" ADD CONSTRAINT "Movies_age_rating_check" CHECK (age_rating IN ('G', 'PG', 'PG-13', 'R', 'NC-17'));
ALTER TABLE ONLY public."Movies" ADD CONSTRAINT "Movies_duration_check" CHECK (duration > 0);
ALTER TABLE ONLY public."Movies" ADD CONSTRAINT "Movies_release_year_check" CHECK (release_year >= 1888 AND release_year <= date_part('year', CURRENT_DATE));
ALTER TABLE ONLY public."Subscriptions" ADD CONSTRAINT "Subscriptions_type_check" CHECK (subs_type IN ('basic', 'standard', 'premium', 'family'));
ALTER TABLE ONLY public."Subscriptions" ADD CONSTRAINT "Subscriptions_end_date_check" CHECK (subs_end > subs_start);
ALTER TABLE ONLY public."Ratings" ADD CONSTRAINT "Ratings_rating_check" CHECK (rating >= 0.5 AND rating <= 5.0);
ALTER TABLE ONLY public."Viewings" ADD CONSTRAINT "Viewings_end_time_check" CHECK (end_view > begin_view OR end_view IS NULL);

-- SEQUENCE для автоинкремента
CREATE SEQUENCE public."Users_user_id_seq" AS integer START WITH 1 INCREMENT BY 1;
ALTER SEQUENCE public."Users_user_id_seq" OWNED BY public."Users".user_id;
ALTER TABLE ONLY public."Users" ALTER COLUMN user_id SET DEFAULT nextval('public."Users_user_id_seq"');

CREATE SEQUENCE public."Movies_movie_id_seq" AS integer START WITH 1 INCREMENT BY 1;
ALTER SEQUENCE public."Movies_movie_id_seq" OWNED BY public."Movies".movie_id;
ALTER TABLE ONLY public."Movies" ALTER COLUMN movie_id SET DEFAULT nextval('public."Movies_movie_id_seq"');

CREATE SEQUENCE public."Genres_genre_id_seq" AS integer START WITH 1 INCREMENT BY 1;
ALTER SEQUENCE public."Genres_genre_id_seq" OWNED BY public."Genres".genre_id;
ALTER TABLE ONLY public."Genres" ALTER COLUMN genre_id SET DEFAULT nextval('public."Genres_genre_id_seq"');

CREATE SEQUENCE public."Actors_actor_id_seq" AS integer START WITH 1 INCREMENT BY 1;
ALTER SEQUENCE public."Actors_actor_id_seq" OWNED BY public."Actors".actor_id;
ALTER TABLE ONLY public."Actors" ALTER COLUMN actor_id SET DEFAULT nextval('public."Actors_actor_id_seq"');

CREATE SEQUENCE public."Subscriptions_subscription_id_seq" AS integer START WITH 1 INCREMENT BY 1;
ALTER SEQUENCE public."Subscriptions_subscription_id_seq" OWNED BY public."Subscriptions".subs_id;
ALTER TABLE ONLY public."Subscriptions" ALTER COLUMN subs_id SET DEFAULT nextval('public."Subscriptions_subscription_id_seq"');

CREATE SEQUENCE public."Viewings_viewing_id_seq" AS integer START WITH 1 INCREMENT BY 1;
ALTER SEQUENCE public."Viewings_viewing_id_seq" OWNED BY public."Viewings".viewing_id;
ALTER TABLE ONLY public."Viewings" ALTER COLUMN viewing_id SET DEFAULT nextval('public."Viewings_viewing_id_seq"');

CREATE SEQUENCE public."Ratings_rating_id_seq" AS integer START WITH 1 INCREMENT BY 1;
ALTER SEQUENCE public."Ratings_rating_id_seq" OWNED BY public."Ratings".rating_id;
ALTER TABLE ONLY public."Ratings" ALTER COLUMN rating_id SET DEFAULT nextval('public."Ratings_rating_id_seq"');