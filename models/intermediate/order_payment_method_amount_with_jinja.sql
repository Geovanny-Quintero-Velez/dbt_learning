{% set payment_methods = ['bank_transfer', 'credit_card', 'gift_card'] %}

select 
    order_id,
    {% for payment_method in get_payment_methods() %}
    sum(case when payment_method = '{{payment_method}}' then amount end) as {{payment_method}}_amount,
    {% endfor %}
    sum(amount) as total_amount
from {{ ref('raw_payments') }}
group by 1