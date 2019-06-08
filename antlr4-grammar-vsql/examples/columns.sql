SELECT

	COUNT(*) as test,
	COUNT(DISTINCT(a)) as test2,
	1,
	1.3 as y,
	a,
	a || '|' || b as concatExp,
	b as bValue,
	case when a != 9 then 1 else -1 end as caseExp,
	case when a > b then 1 else -1 end as caseExp,
	
		sum( (a) + b)
	 as sumExp
from testTable
;

select * , *, 1 *7 ;