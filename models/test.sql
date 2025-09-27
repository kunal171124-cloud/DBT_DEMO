select
* 
from {{ source('demo', 'BIKE') }}

limit 10;