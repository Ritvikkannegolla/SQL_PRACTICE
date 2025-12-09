-- Write your PostgreSQL query statement below
SELECT 
    ROUND(
        COUNT(DISTINCT a2.player_id)::NUMERIC / COUNT(DISTINCT a1.player_id), 
        2
    ) AS fraction
FROM 
    (SELECT player_id, MIN(event_date) AS first_login
     FROM activity
     GROUP BY player_id) AS a1
LEFT JOIN 
    activity AS a2
ON 
    a1.player_id = a2.player_id 
    AND a2.event_date = a1.first_login + INTERVAL '1 day';