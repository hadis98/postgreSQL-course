WITH RECURSIVE countdown(val) AS(
    SELECT 3 AS val
    UNION
    SELECT val -1 from countdown WHERE val>1
)
SELECT *
FROM countdown;

WITH RECURSIVE suggestions(leader_id,follower_id,depth) AS(
    SELECT leader_id,follower_id,1 AS depth
    FROM followers
    WHERE follower_id =1000
    UNION
    SELECT followers.leader_id,followers.follower_id,depth+1
    FROM followers
    JOIN suggestions on suggestions.leader_id = followers.follower_id
    WHERE depth<2
)
SELECT DISTINCT users.id,users.username
FROM suggestions
JOIN users on users.id = suggestions.leader_id
WHERE depth>1;