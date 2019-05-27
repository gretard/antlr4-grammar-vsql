 CREATE PROJECTION test.agg_event_by_client_geo_day_p1
 (
   date_id ENCODING RLE
 , client_id ENCODING RLE
 , country_id ENCODING RLE
 , uu_day 
 , event_cnt_day 
 , uu_ptd 
 , event_cnt_ptd 
 , created_at
 , batch_id ENCODING RLE)
 AS
 SELECT 
   date_id
 , client_id 
 , country_id
 , uu_day 
 , event_cnt_day 
 , uu_ptd 
 , event_cnt_ptd 
 , created_at
 , batch_id
 FROM test.agg_event_by_client_geo_day
 ORDER BY client_id, date_id, country_id, batch_id
 SEGMENTED BY hash(date_id, client_id, country_id) ALL NODES KSAFE 1;