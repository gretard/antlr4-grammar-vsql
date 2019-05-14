SELECT (SELECT MAX(x) FROM t2 WHERE y=t1.b) FROM t1 ORDER BY 1;

seLect  t.a as alld, b, c as d , 'aaa', functest(aa) as d FROM test_table;


SELECT Category, tname, SUM(Amount) FROM expenses 
   GROUP BY ROLLUP(Category, tname) ORDER BY 1,2, GROUPING_ID();
   