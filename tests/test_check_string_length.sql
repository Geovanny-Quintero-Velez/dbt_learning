select
1
from {{ ref('raw_payments') }}
where length(payment_method) < 10