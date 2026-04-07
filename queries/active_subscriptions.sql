SELECT u.username, s.subs_type, s.subs_start, s.subs_end
FROM Subscriptions s
JOIN Users u ON s.user_id = u.user_id
WHERE s.subs_end > CURRENT_DATE AND s.auto_renewal = true;