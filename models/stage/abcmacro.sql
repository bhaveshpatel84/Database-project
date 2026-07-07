{{ config(
    materialized='table',
    database='MY_DB',
    schema='cleansed',
    alias='testmacro'
) }}

WITH dq_check AS (

    {{ check_nulls(
        ref('orderitems'),
        ['QUANTITY', 'UNITPRICE']
    ) }}

)

SELECT *
FROM dq_check
WHERE null_check_status = 'FAIL'
