create database IPL;

use IPL;

select * from matches limit 10;

-- Most Successfull Teams
SELECT winner,
COUNT(*) wins
FROM matches
GROUP BY winner
ORDER BY wins DESC;

-- Top Batsmen
SELECT batter,
SUM(total_runs)
FROM deliveries
GROUP BY batter
ORDER BY SUM(total_runs) DESC;

-- Top Bowlers
SELECT bowler,
COUNT(*)
FROM deliveries
WHERE is_wicket=1
GROUP BY bowler;

-- Total runs scored in each season
SELECT
    m.season,
    SUM(d.total_runs) AS total_runs
FROM matches m
JOIN deliveries d
ON m.id = d.match_id
GROUP BY m.season
ORDER BY m.season;

-- Top run scorers by season
SELECT
    m.season,
    d.batter,
    SUM(d.batsman_runs) AS runs
FROM matches m
JOIN deliveries d
ON m.id = d.match_id
GROUP BY m.season, d.batter
ORDER BY m.season, runs DESC;

-- Most sixes by player
SELECT
    d.batter,
    COUNT(*) AS sixes
FROM deliveries d
JOIN matches m
ON d.match_id = m.id
WHERE d.batsman_runs = 6
GROUP BY d.batter
ORDER BY sixes DESC
LIMIT 10;

-- Player of the match by season
SELECT
    season,
    player_of_match,
    COUNT(*) AS awards
FROM matches
GROUP BY season, player_of_match
ORDER BY season, awards DESC;