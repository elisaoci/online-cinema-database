INSERT INTO public."Genres" (genre_id, name, description) VALUES
(1, 'Драма', 'Фильмы с серьезным сюжетом'),
(2, 'Комедия', 'Юмористические фильмы'),
(3, 'Фантастика', 'Научная фантастика и фэнтези'),
(4, 'Боевик', 'Фильмы с динамичным действием'),
(5, 'Триллер', 'Напряженные фильмы'),
(6, 'Мелодрама', 'Романтические истории'),
(7, 'Ужасы', 'Фильмы ужасов'),
(8, 'Детектив', 'Загадочные истории'),
(9, 'Приключения', 'Приключенческие фильмы'),
(10, 'Анимация', 'Анимационные фильмы');

INSERT INTO public."Actors" (actor_id, full_name, birth_date) VALUES
(1, 'Том Хэнкс', '1956-07-09'),
(2, 'Леонардо ДиКаприо', '1974-11-11'),
(3, 'Мерил Стрип', '1949-06-22'),
(4, 'Джонни Депп', '1963-06-09'),
(5, 'Эмма Уотсон', '1990-04-15');

INSERT INTO public."Movies" (movie_id, title, release_year, duration, age_rating, description, available) VALUES
(1, 'Форрест Гамп', 1994, 142, 'PG-13', 'История человека с низким IQ', true),
(2, 'Титаник', 1997, 195, 'PG-13', 'История любви на затонувшем корабле', true),
(3, 'Дьявол носит Prada', 2006, 109, 'PG-13', 'История молодой журналистки', true),
(4, 'Пираты Карибского моря', 2003, 143, 'PG-13', 'Приключения пирата Джека Воробья', true),
(5, 'Гарри Поттер и философский камень', 2001, 152, 'PG', 'Первая часть истории о юном волшебнике', true);

INSERT INTO public."MovieGenres" (movie_id, genre_id) VALUES
(1, 1), (1, 6),
(2, 1), (2, 6),
(3, 1),
(4, 3), (4, 9),
(5, 3), (5, 9);

INSERT INTO public."MovieActors" (movie_id, actor_id, role_name, main_role) VALUES
(1, 1, 'Форрест Гамп', true),
(1, 3, 'Дженни Керран', false),
(2, 2, 'Джек Доусон', true),
(2, 5, 'Роза Дьюитт Бьюкейтер', false),
(3, 3, 'Миранда Пристли', true),
(4, 4, 'Джек Воробей', true),
(5, 5, 'Гермиона Грейнджер', true);

INSERT INTO public."Users" (user_id, username, email, password, birthday_date, registr_date, premium, active) VALUES
(1, 'user1', 'user1@example.com', '$2a$10$xJwL5v5zJz6Z6Z6Z6Z6Z6e', '1990-01-01', '2025-01-01', true, true),
(2, 'user2', 'user2@example.com', '$2a$10$xJwL5v5zJz6Z6Z6Z6Z6Z6e', '1985-05-05', '2025-01-02', false, true),
(3, 'user3', 'user3@example.com', '$2a$10$xJwL5v5zJz6Z6Z6Z6Z6Z6e', '1995-10-10', '2025-01-03', false, true),
(4, 'user4', 'user4@example.com', '$2a$10$xJwL5v5zJz6Z6Z6Z6Z6Z6e', '1980-03-15', '2025-01-04', true, true),
(5, 'user5', 'user5@example.com', '$2a$10$xJwL5v5zJz6Z6Z6Z6Z6Z6e', '1992-07-20', '2025-01-05', true, true);

INSERT INTO public."UserProfiles" (user_id, avatar_url, prefer_language, theme) VALUES
(1, '/user1.jpg', 'ru', 'dark'),
(2, '/user2.jpg', 'en', 'light'),
(3, '/user3.jpg', 'ru', 'blue'),
(4, '/user4.jpg', 'ru', 'dark'),
(5, '/user5.jpg', 'en', 'dark');

INSERT INTO public."Subscriptions" (subs_id, user_id, subs_type, subs_start, subs_end, auto_renewal) VALUES
(1, 1, 'premium', '2025-05-01', '2025-06-01', true),
(2, 2, 'standard', '2025-05-10', '2025-06-10', true),
(3, 3, 'basic', '2025-05-15', '2025-06-15', false),
(4, 4, 'premium', '2025-05-20', '2025-06-20', true),
(5, 5, 'family', '2025-05-25', '2025-06-25', true);

INSERT INTO public."Viewings" (viewing_id, user_id, movie_id, begin_view, end_view, device_type) VALUES
(1, 1, 1, '2025-05-26 10:00:00', '2025-05-26 12:22:00', 'desktop'),
(2, 2, 2, '2025-05-26 09:30:00', '2025-05-26 12:45:00', 'mobile'),
(3, 3, 3, '2025-05-26 14:00:00', '2025-05-26 15:49:00', 'tablet'),
(4, 4, 4, '2025-05-26 16:00:00', '2025-05-26 18:23:00', 'smart_tv'),
(5, 5, 5, '2025-05-26 18:00:00', '2025-05-26 20:32:00', 'desktop');

INSERT INTO public."Ratings" (rating_id, user_id, movie_id, rating, review_text) VALUES
(1, 1, 1, 5.0, 'Один из лучших фильмов всех времен'),
(2, 2, 1, 4.5, 'Очень душевный фильм'),
(3, 3, 2, 5.0, 'Невероятная история любви'),
(4, 4, 3, 4.0, 'Отличная игра актеров'),
(5, 5, 4, 4.5, 'Отличные спецэффекты');

INSERT INTO public."Favorites" (user_id, movie_id, add_date) VALUES
(1, 1, '2025-05-26 10:15:22'),
(1, 3, '2025-05-26 11:20:33'),
(2, 2, '2025-05-26 09:45:12'),
(3, 1, '2025-05-26 14:30:45'),
(4, 4, '2025-05-26 16:22:18');