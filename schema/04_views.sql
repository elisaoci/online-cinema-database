CREATE VIEW public.popular_movies AS
SELECT 
    m.movie_id,
    m.title,
    m.release_year,
    COUNT(v.viewing_id) AS view_count,
    AVG(r.rating) AS avg_rating,
    COUNT(r.rating_id) AS rating_count
FROM public."Movies" m
LEFT JOIN public."Viewings" v ON m.movie_id = v.movie_id
LEFT JOIN public."Ratings" r ON m.movie_id = r.movie_id
GROUP BY m.movie_id, m.title, m.release_year
ORDER BY view_count DESC, avg_rating DESC;

CREATE VIEW public.active_users AS
SELECT 
    u.user_id,
    u.username,
    u.email,
    COUNT(DISTINCT v.viewing_id) AS total_views,
    COUNT(DISTINCT r.rating_id) AS ratings_given,
    COUNT(DISTINCT f.movie_id) AS favorites_count,
    MAX(v.begin_view) AS last_view_date
FROM public."Users" u
LEFT JOIN public."Viewings" v ON u.user_id = v.user_id
LEFT JOIN public."Ratings" r ON u.user_id = r.user_id
LEFT JOIN public."Favorites" f ON u.user_id = f.user_id
GROUP BY u.user_id, u.username, u.email;

CREATE VIEW public.genre_statistics AS
SELECT 
    g.genre_id,
    g.name AS genre_name,
    COUNT(DISTINCT mg.movie_id) AS movie_count,
    COUNT(DISTINCT v.viewing_id) AS total_views
FROM public."Genres" g
LEFT JOIN public."MovieGenres" mg ON g.genre_id = mg.genre_id
LEFT JOIN public."Movies" m ON mg.movie_id = m.movie_id
LEFT JOIN public."Viewings" v ON m.movie_id = v.movie_id
GROUP BY g.genre_id, g.name
ORDER BY total_views DESC;