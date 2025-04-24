select
    order_id,
    payment_method,
    amount
from {{ ref('raw_payments') }}
where amount < 100