select 
    *,
    {{ get_value_with_tax('amount') }} as amount_with_tax
from {{ ref('raw_payments') }}