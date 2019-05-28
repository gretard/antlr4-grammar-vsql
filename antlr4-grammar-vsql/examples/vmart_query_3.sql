-- vmart_query_03.sql
-- noncorrelated subquery 
-- Requests female and male customers with the maximum  
-- annual income from customers

SELECT customer_name, annual_income 
FROM public.customer_dimension 
WHERE (customer_gender, annual_income) IN (
  SELECT customer_gender, MAX(annual_income)
  FROM public.customer_dimension
  GROUP BY customer_gender);


  -- vmart_query_04.sql
-- IN predicate 
-- Find all products supplied by stores in MA  

SELECT DISTINCT s.product_key, p.product_description 
FROM store.store_sales_fact s, public.product_dimension p 
WHERE s.product_key = p.product_key 
AND s.product_version = p.product_version AND s.store_key IN (
  SELECT store_key 
  FROM store.store_dimension 
  WHERE store_state = 'MA') 
ORDER BY s.product_key;

-- vmart_query_05.sql
-- EXISTS predicate 
-- Get a list of all the orders placed by all stores on  
-- January 2, 2003 for the vendors with records in the  
-- vendor_dimension table

SELECT store_key, order_number, date_ordered 
FROM store.store_orders_fact 
WHERE EXISTS (
   SELECT 1
   FROM public.vendor_dimension
   WHERE public.vendor_dimension.vendor_key = store.store_orders_fact.vendor_key)
   AND date_ordered = '2012-01-02';
-- vmart_query_06.sql
-- EXISTS predicate 
-- Orders placed by the vendor who got the best deal  
-- on January 4, 2004
SELECT store_key, order_number, date_ordered 
FROM store.store_orders_fact ord, public.vendor_dimension vd 
WHERE ord.vendor_key = vd.vendor_key 
AND vd.deal_size IN (
   SELECT MAX(deal_size)
   FROM public.vendor_dimension) 
AND date_ordered = '2013-01-04';

-- vmart_query_07.sql
-- Multicolumn subquery 
-- Which products have the highest cost,  
-- grouped by category and department   

SELECT product_description, sku_number, department_description 
FROM public.product_dimension 
WHERE (category_description, department_description, product_cost) IN (
   SELECT category_description, department_description,
   MAX(product_cost) FROM product_dimension
   GROUP BY category_description, department_description);

-- vmart_query_08.sql 
-- between online_sales_fact and online_page_dimension

SELECT page_description, page_type, start_date, end_date 
FROM online_sales.online_sales_fact f, online_sales.online_page_dimension d 
WHERE f.online_page_key = d.online_page_key  
AND page_number IN
   (SELECT MAX(page_number)
     FROM online_sales.online_page_dimension) 
AND page_type = 'monthly' AND start_date = '2012-06-02';

-- vmart_query_09.sql
-- Equi join 
-- Joins online_sales_fact table and the call_center_dimension  
-- table with the ON clause

SELECT sales_quantity, sales_dollar_amount, transaction_type, cc_name 
FROM online_sales.online_sales_fact 
INNER JOIN online_sales.call_center_dimension  
ON (online_sales.online_sales_fact.call_center_key
      = online_sales.call_center_dimension.call_center_key
     AND sale_date_key = 156) 
ORDER BY sales_dollar_amount DESC;

