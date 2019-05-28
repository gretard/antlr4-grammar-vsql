-- vmart_query_01.sql
-- FROM clause subquery
-- Return the values for five products with the 
-- lowest-fat content in the Dairy department

SELECT fat_content
FROM (
  SELECT DISTINCT fat_content
  FROM product_dimension
  WHERE department_description
  IN ('Dairy') ) AS food
  ORDER BY fat_content
  LIMIT 5;

