select projection_schema, anchor_table_name , 
to_char(sum(row_count), '999,999,999,999,999') as row_count , 
to_char(ROUND(
(sum(ros_used_bytes)
/ (1024*1024*1024)), 2), '999,999') as ros_used_GB from projection_storage where projection_schema in ('schemaA', 'schemaB', 'schemaC') group by 1, 2 order by 1, 4 desc limit 20;