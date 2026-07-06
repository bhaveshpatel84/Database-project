SELECT 
    s.STOREID,
    s.STORENAME,
    s.CITY,
    s.STATE,
    COUNT(o.ORDERID) AS total_orders,
    COUNT(DISTINCT o.EMPLOYEEID) AS unique_employees,
    SUM(oi.QUANTITY) AS total_items_sold,
    SUM(oi.QUANTITY * oi.UNITPRICE) AS total_revenue
FROM {{ ref('stores') }} s
LEFT JOIN {{ ref('orders') }} o 
    ON s.STOREID = o.STOREID
LEFT JOIN {{ ref('orderitems') }} oi 
    ON o.ORDERID = oi.ORDERID
GROUP BY s.STOREID, s.STORENAME, s.CITY, s.STATE


