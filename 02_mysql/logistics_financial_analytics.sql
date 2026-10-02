CREATE DATABASE logistics_financial_analytics;
SHOW DATABASES;
USE logistics_financial_analytics;
SHOW TABLES;
SELECT 'shipments' AS table_name, COUNT(*) AS row_count FROM shipments
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'routes', COUNT(*) FROM routes
UNION ALL
SELECT 'carriers', COUNT(*) FROM carriers
UNION ALL
SELECT 'warehouses', COUNT(*) FROM warehouses
UNION ALL
SELECT 'monthly_budgets', COUNT(*) FROM monthly_budgets
UNION ALL
SELECT 'data_dictionary', COUNT(*) FROM data_dictionary
UNION ALL
SELECT 'customers', COUNT(*) FROM customers
UNION ALL
SELECT 'fuel_price_index', COUNT(*) FROM fuel_price_index;
SELECT
    'shipments' AS table_name,
    COUNT(*) AS total_rows,
    SUM(CASE WHEN Shipment_ID IS NULL THEN 1 ELSE 0 END) AS null_shipment_id,
    COUNT(DISTINCT Shipment_ID) AS unique_shipment_ids
FROM shipments
UNION ALL 
SELECT 
'orders',
    COUNT(*),
    SUM(CASE WHEN Order_ID IS NULL THEN 1 ELSE 0 END),
    COUNT(DISTINCT Order_ID)
FROM orders
UNION ALL

SELECT
    'customers',
    COUNT(*),
    SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END),
    COUNT(DISTINCT Customer_ID)
FROM customers;
DESCRIBE SHIPMENTS;
SELECT
    MIN(Base_Transport_Cost_INR) AS min_transport_cost_INR,
    MIN(Fuel_Surcharge_INR) AS min_fuel_surcharge_INR,
    MIN(Toll_charges_INR) AS min_toll_charges_INR,
    MIN(Handling_charges_INR) AS min_handling_charges_INR,
    MIN(Delay_Additional_Cost_INR) AS min_delay_cost_INR,
    MIN(Weather_Additional_Cost_INR) AS min_weather_cost_INR,
    MIN(Other_Charges_INR) AS min_other_charges_INR
FROM shipments;
SELECT
    MIN(shipment_Date) AS first_shipment_date,
    MAX(shipment_Date) AS last_shipment_date,
    MIN(Distance_KM) AS min_distance,
    MAX(Distance_KM) AS max_distance,
    MIN(actual_Delivery_Days) AS min_actual_delivery_days,
    MAX(actual_Delivery_Days) AS max_actual_delivery_days
FROM shipments;

SELECT COUNT(*) AS unmatched_shipments
FROM shipments s
LEFT JOIN orders o
    ON s.Order_ID = o.Order_ID
LEFT JOIN carriers c
    ON s.Carrier_ID = c.Carrier_ID
LEFT JOIN routes r
    ON s.Route_ID = r.Route_ID
LEFT JOIN warehouses w
    ON s.Warehouse_ID = w.Warehouse_ID
WHERE o.Order_ID IS NULL
   OR c.Carrier_ID IS NULL
   OR r.Route_ID IS NULL
   OR w.Warehouse_ID IS NULL;


SELECT
    SUM(Base_Transport_Cost_INR) AS transport_cost,
    SUM(Fuel_Surcharge_INR) AS fuel_cost,
    SUM(Toll_charges_INR) AS toll_cost,
    SUM(Handling_charges_INR) AS handling_cost,
    SUM(Delay_Additional_Cost_INR) AS delay_cost,
    SUM(Weather_Additional_Cost_INR) AS weather_cost,
    SUM(Other_Charges_INR) AS other_cost
FROM shipments;


SELECT
    Route_ID,
    SUM(Base_Transport_Cost_INR) AS total_transport_cost
FROM shipments
GROUP BY Route_ID
ORDER BY total_transport_cost DESC
LIMIT 10;


SELECT
    Route_ID,
    COUNT(*) AS total_shipments,
    SUM(Base_Transport_Cost_INR) AS total_transport_cost
FROM shipments
GROUP BY Route_ID
ORDER BY total_transport_cost DESC
LIMIT 10;


SELECT
    Route_ID,
    COUNT(*) AS total_shipments,
    SUM(Base_Transport_Cost_INR) AS total_transport_cost,
    AVG(actual_Delivery_Days) AS avg_delivery_days,
    AVG(delivery_Delay_Days) AS avg_delay_days
FROM shipments
GROUP BY Route_ID
ORDER BY total_transport_cost DESC
LIMIT 10;


SELECT
    Carrier_ID,
    COUNT(*) AS total_shipments,
    SUM(Base_Transport_Cost_INR) AS total_cost,
    AVG(Base_Transport_Cost_INR) AS avg_cost_per_shipment,
    AVG(actual_Delivery_Days) AS avg_delivery_days,
    AVG(delivery_Delay_Days) AS avg_delay_days
FROM shipments
GROUP BY Carrier_ID
ORDER BY avg_cost_per_shipment DESC;


SELECT
    Shipment_ID,
    Route_ID,
    Carrier_ID,
    Base_Transport_Cost_INR,
    Fuel_Surcharge_INR,
    Toll_charges_INR,
    Handling_charges_INR,
    Delay_Additional_Cost_INR,
    Weather_Additional_Cost_INR,
    Other_Charges_INR,
    (
        Base_Transport_Cost_INR
        + Fuel_Surcharge_INR
        + Toll_charges_INR
        + Handling_charges_INR
        + Delay_Additional_Cost_INR
        + Weather_Additional_Cost_INR
        + Other_Charges_INR
    ) AS total_cost
FROM shipments
ORDER BY total_cost DESC
LIMIT 10;
DESCRIBE SHIPMENTS;

SELECT
    Warehouse_ID,
    COUNT(*) AS total_shipments,
    SUM(Base_Transport_Cost_INR) AS total_transport_cost_INR
FROM shipments
GROUP BY Warehouse_ID
ORDER BY total_transport_cost_INR DESC;


SELECT
    DATE_FORMAT(shipment_Date, '%Y-%m') AS month,
    SUM(
        Base_Transport_Cost_INR
        + Fuel_Surcharge_INR
        + Toll_charges_INR
        + Handling_charges_INR
        + Delay_Additional_Cost_INR
        + Weather_Additional_Cost_INR
        + Other_Charges_INR
    ) AS actual_cost
FROM shipments
GROUP BY DATE_FORMAT(shipment_Date, '%Y-%m')
ORDER BY month;


SELECT
    b.budget_Month,
    b.Budget_logistics_cost_INR,
    SUM(
        s.Base_Transport_Cost_INR
        + s.Fuel_Surcharge_INR
        + s.Toll_charges_INR
        + s.Handling_charges_INR
        + s.Delay_Additional_Cost_INR
        + s.Weather_Additional_Cost_INR
        + s.Other_Charges_INR
    ) AS actual_cost
FROM monthly_budgets b
LEFT JOIN shipments s
    ON DATE_FORMAT(s.shipment_Date, '%Y-%m') = b.budget_Month
GROUP BY b.budget_Month, b.Budget_logistics_cost_INR
ORDER BY b.budget_Month;



SELECT
    b.budget_Month,
    b.Budget_logistics_cost_INR,
    SUM(
        s.Base_Transport_Cost_INR
        + s.Fuel_Surcharge_INR
        + s.Toll_charges_INR
        + s.Handling_charges_INR
        + s.Delay_Additional_Cost_INR
        + s.Weather_Additional_Cost_INR
        + s.Other_Charges_INR
    ) AS actual_cost,
    SUM(
        s.Base_Transport_Cost_INR
        + s.Fuel_Surcharge_INR
        + s.Toll_charges_INR
        + s.Handling_charges_INR
        + s.Delay_Additional_Cost_INR
        + s.Weather_Additional_Cost_INR
        + s.Other_Charges_INR
    ) - b.Budget_logistics_cost_INR AS variance
FROM monthly_budgets b
LEFT JOIN shipments s
    ON DATE_FORMAT(s.shipment_Date, '%Y-%m') = b.budget_Month
GROUP BY b.budget_Month, b.Budget_logistics_cost_INR
ORDER BY variance DESC;


SELECT
    DATE_FORMAT(shipment_date, '%Y-%m') AS month,
    SUM(
        Base_Transport_Cost_INR
        + Fuel_Surcharge_INR
        + Toll_charges_INR
        + Handling_charges_INR
        + Delay_Additional_Cost_INR
        + Weather_Additional_Cost_INR
        + Other_Charges_INR
    ) AS total_logistics_cost_INR
FROM shipments
GROUP BY DATE_FORMAT(shipment_Date, '%Y-%m')
ORDER BY month;



SELECT
    f.Month,
    f.Fuel_Price_Index,
    SUM(
        s.Base_Transport_Cost_INR
        + s.Fuel_Surcharge_INR
        + s.Toll_charges_INR
	    + s.Handling_charges_INR
        + s.Delay_Additional_Cost_INR
        + s.Weather_Additional_Cost_INR
        + s.Other_Charges_INR
    ) AS total_logistics_cost
FROM fuel_price_index f
LEFT JOIN shipments s
    ON DATE_FORMAT(s.shipment_Date, '%Y-%m') = f.Month
GROUP BY f.Month, f.Fuel_Price_Index
ORDER BY f.Month;

DESCRIBE monthly_budgets;
DESCRIBE SHIPMENTS;

SELECT
    CASE
        WHEN delivery_Delay_Days = 0 THEN 'No Delay'
        ELSE 'Delayed'
    END AS delivery_status,
    COUNT(*) AS total_shipments,
    AVG(delivery_Delay_Days) AS avg_delay_days,
    AVG(
        Base_Transport_Cost_INR
        + Fuel_Surcharge_INR
        + Toll_charges_INR
        + Handling_charges_INR
        + Delay_Additional_Cost_INR
        + Weather_Additional_Cost_INR
        + Other_Charges_INR
    ) AS avg_logistics_cost
FROM shipments
GROUP BY delivery_status;


SELECT
    Route_ID,
    COUNT(*) AS total_shipments,
    SUM(
        Base_Transport_Cost_INR
        + Fuel_Surcharge_INR
        + Toll_charges_INR
        + Handling_charges_INR
        + Delay_Additional_Cost_INR
        + Weather_Additional_Cost_INR
        + Other_Charges_INR
    ) AS total_cost,
    AVG(
        Base_Transport_Cost_INR
        + Fuel_Surcharge_INR
        + Toll_charges_INR
        + Handling_charges_INR
        + Delay_Additional_Cost_INR
        + Weather_Additional_Cost_INR
        + Other_Charges_INR
    ) AS avg_cost_per_shipment
FROM shipments
GROUP BY Route_ID
ORDER BY avg_cost_per_shipment DESC
LIMIT 10;


SELECT
    Route_ID,
    COUNT(*) AS total_shipments,
    AVG(
        Base_Transport_Cost_INR
        + Fuel_Surcharge_INR
        + Toll_charges_INR
        + Handling_charges_INR
        + Delay_Additional_Cost_INR
        + Weather_Additional_Cost_INR
        + Other_Charges_INR
    ) AS avg_cost_per_shipment,
    AVG(delivery_Delay_Days) AS avg_delay_days
FROM shipments
GROUP BY Route_ID
ORDER BY avg_cost_per_shipment DESC;
