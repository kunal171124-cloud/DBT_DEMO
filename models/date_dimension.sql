    WITH CTE AS (
select

TO_TIMESTAMP(Started_at) AS STARTED_AT,
DATE(TO_TIMESTAMP(Started_at)) AS DATE_STARTED_AT,
HOUR(TO_TIMESTAMP(Started_at)) AS HOUR_STARTED_AT,
DAYNAME(TO_TIMESTAMP(Started_at)) AS DAY_STARTED_AT,

CASE WHEN DAYNAME(TO_TIMESTAMP(Started_at)) IN ('Sat','Sun')
THEN 'WEEKEND'
ELSE 'BUSINESSDAY'
END AS DAY_TYPE,

CASE 
    WHEN MONTH(TO_TIMESTAMP(Started_at)) IN (12, 1, 2) THEN 'WINTER'
    WHEN MONTH(TO_TIMESTAMP(Started_at)) IN (3, 4, 5) THEN 'SPRING'
    WHEN MONTH(TO_TIMESTAMP(Started_at)) IN (6, 7, 8) THEN 'SUMMER'
    ELSE 'AUTUMN'
END AS SEASON_OF_YEAR,

{{function('Started_at')}} AS TENSE,

{{season('Started_at')}} as seas


from
{{ source('demo', 'BIKE') }}
WHERE Started_at NOT IN ('started_at')
)

select * from CTE