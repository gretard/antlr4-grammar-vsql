DROP TABLE IF EXISTS dt_start;
CREATE TABLE dt_start AS (SELECT dt FROM dt_end);

CREATE flexible table boston_potholes_raw();

COPY boston_potholes_raw FROM 'potholes/Closed_Pothole_Cases.csv' PARSER public.FDelimitedParser (delimiter=',');
