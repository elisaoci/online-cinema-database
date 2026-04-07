SELECT u.username, m.title, v.begin_view, v.end_view, v.device_type
FROM Viewings v
JOIN Users u ON v.user_id = u.user_id
JOIN Movies m ON v.movie_id = m.movie_id
WHERE u.user_id = 1
ORDER BY v.begin_view DESC;