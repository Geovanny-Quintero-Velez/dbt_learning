select
  *

from {{ source('employee_source', 'employee') }}

where salary > 50000