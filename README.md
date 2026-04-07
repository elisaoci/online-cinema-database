# Online Cinema Database

Проект базы данных для онлайн-кинотеатра. Учебная работа по курсу "Система управления базами данных". PostgreSQL.

## Назначение

Хранение и управление данными онлайн-кинотеатра:
- пользователи и их профили
- фильмы, жанры, актеры
- подписки
- просмотры
- оценки и отзывы
- избранное
- аналитика

## Технологии

- PostgreSQL 17
- PL/pgSQL (триггеры)

## Схема данных

Основные таблицы и связи:

- Users (1:1) -> UserProfiles
- Users (1:N) -> Subscriptions, Viewings, Ratings
- Users (M:N) -> Movies (через Favorites)
- Movies (M:N) -> Genres (через MovieGenres)
- Movies (M:N) -> Actors (через MovieActors)
- Movies (1:N) -> Viewings, Ratings

## Представления

| Название | Описание |
|----------|----------|
| popular_movies | фильмы по популярности и среднему рейтингу |
| active_users | статистика активности пользователей |
| genre_statistics | просмотры по жанрам |

## Триггеры

- update_last_viewed() - обновляет поле last_viewed в профиле при просмотре

## Быстрый старт

Создание базы данных:

```sql
CREATE DATABASE online_cinema;

Выполнение скриптов:
psql -d online_cinema -f schema/01_tables.sql
psql -d online_cinema -f schema/02_constraints.sql
psql -d online_cinema -f schema/03_triggers.sql
psql -d online_cinema -f schema/04_views.sql
psql -d online_cinema -f data/seed_data.sql

## Примеры запросов:

-- топ-10 фильмов
SELECT title, view_count, avg_rating
FROM popular_movies
LIMIT 10;

-- история просмотров пользователя
SELECT u.username, m.title, v.begin_view, v.device_type
FROM Viewings v
JOIN Users u ON v.user_id = u.user_id
JOIN Movies m ON v.movie_id = m.movie_id
WHERE u.user_id = 1;

-- активные подписки
SELECT u.username, s.subs_type, s.subs_end
FROM Subscriptions s
JOIN Users u ON s.user_id = u.user_id
WHERE s.subs_end > CURRENT_DATE AND s.auto_renewal = true;


##Структура репозитория

online-cinema-database/
├── README.md
├── schema/
│   ├── 01_tables.sql
│   ├── 02_constraints.sql
│   ├── 03_triggers.sql
│   └── 04_views.sql
├── data/
│   └── seed_data.sql
├── queries/
│   ├── top_movies.sql
│   ├── user_history.sql
│   └── active_subscriptions.sql
└── docs/
    └── ER_diagram.png
