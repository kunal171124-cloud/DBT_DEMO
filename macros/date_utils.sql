{% macro function(x) %}

case  when TO_TIMESTAMP({{x}}) < CURRENT_DATE then 'PAST'
else 'FUTURE'
END
{% endmacro %}

{% macro season(x) %}

CASE 
    WHEN MONTH(TO_TIMESTAMP({{x}})) IN (12, 1, 2) THEN 'WINTER'
    WHEN MONTH(TO_TIMESTAMP({{x}})) IN (3, 4, 5) THEN 'SPRING'
    WHEN MONTH(TO_TIMESTAMP({{x}})) IN (6, 7, 8) THEN 'SUMMER'
    ELSE 'AUTUMN'
END
{% endmacro %}