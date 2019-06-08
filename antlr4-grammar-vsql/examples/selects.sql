SELECT (SELECT MAX(x) FROM t2 WHERE y=t1.b) FROM t1 ORDER BY 1;

seLect  t.a as alld, b, c as d , 'aaa', functest(aa) as d FROM test_table;


SELECT Category, tname, SUM(Amount) FROM expenses 
   GROUP BY ROLLUP(Category, tname) ORDER BY 1,2, GROUPING_ID();
   
SELECT uidddd
FROM clickstream_log
MATCH
  (PARTITION BY uid, sid ORDER BY ts
   DEFINE
     Entry    AS RefURL  NOT ILIKE 'hhh',     Onsite   AS PageURL ILIKE     's'   PATTERN
     P AS (EntryOnsitePurchase)
   ROWS MATCH FIRST EVENT);
   
   
SELECT STV_SetExportShapefileDirectory(USING PARAMETERS path = '/home/shapefiles');


CREATE VIEW titanic_testing_encoded AS (SELECT passenger_id, name, pclass, sex_1, age, sibling_and_spouse_count, parent_and_child_count, fare, embarkation_point_1, embarkation_point_2 FROM\r\n" + 
    			"    (SELECT APPLY_ONE_HOT_ENCODER(* USING PARAMETERS model_name='public.titanic_encoder') FROM titanic_testing) AS sq;   
    			
SELECT   RTRIM(COALESCE(SUBSTR(ltrim(REPLACE(REPLACE(REPLACE(CL.CreativeList, '&'::VARCHAR(5),
				            '&'::VARCHAR(1)), '<'::VARCHAR(4), '<'::VARCHAR(1)), '>'::VARCHAR(4), '>'::VARCHAR(1)))
				            , 1, 1000), ''::VARCHAR)) AS Example from testDatabase;    			
				            
				            SELECT ((((date_part('year', (Logtime)::timestamp))::int * 100) + (date_part('month', (Logtime)::timestamp))::int));
				            
select * from (select * from testSample) testAlias;				            