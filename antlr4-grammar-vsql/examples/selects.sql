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