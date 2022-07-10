SELECT *
FROM likes
    LEFT JOIN posts on posts.id = likes.post_id
    LEFT JOIN comments on comments.id = likes.comment_id
SELECT date_trunc(
        'week',
        COALESCE(posts.created_at, comments.created_at)
    ) as week
FROM likes
    LEFT JOIN posts on posts.id = likes.post_id
    LEFT JOIN comments on comments.id = likes.comment_id
ORDER by week;
SELECT date_trunc(
        'week',
        COALESCE(posts.created_at, comments.created_at)
    ) as week,
    count(posts.id) as num_likes_per_posts,
    count(comments.id) as num_likes_per_comments
FROM likes
    LEFT JOIN posts on posts.id = likes.post_id
    LEFT JOIN comments on comments.id = likes.comment_id
group by week
order by week;
CREATE MATERIALIZED VIEW weekly_likes AS(
    SELECT date_trunc(
            'week',
            COALESCE(posts.created_at, comments.created_at)
        ) as week,
        count(posts.id) as num_likes_per_posts,
        count(comments.id) as num_likes_per_comments
    FROM likes
        LEFT JOIN posts on posts.id = likes.post_id
        LEFT JOIN comments on comments.id = likes.comment_id
    group by week
    order by week
) WITH DATA;

select * from weekly_likes;
-- change main table:
DELETE FROM posts 
WHERE created_at < '2010-02-01';

REFRESH MATERIALIZED VIEW weekly_likes;

SELECT * from  weekly_likes;