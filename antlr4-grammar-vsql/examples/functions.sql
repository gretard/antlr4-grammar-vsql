select analyze_statistics('schema.tableName');

select session_id, statement_id, user_name, current_statement, last_statement, transaction_description, * from sessions;

create schema if not exists test;

create table test.tmp_column_cardinality (
 table_name varchar(255) NOT NULL DEFAULT 'Unknown',
 column_name varchar(255) NOT NULL DEFAULT 'Unknown',
 column_cardinality_count INT NOT NULL DEFAULT 0,
 created_at timestamp NOT NULL DEFAULT now() );
 
select export_objects('','test.tmp_column_cardinality');

ALTER TABLE test.agg_event_by_client_geo_day ADD CONSTRAINT PK_agg_event_by_client_geo_day PRIMARY KEY (date_id, client_id, country_id);

 DELETE FROM test.tmp_column_cardinality where table_name = 'test.agg_event_by_client_geo_day';
 
 select node_name, projection_name, row_count from projection_storage where projection_name ilike 'testHashNodes%' and anchor_table_schema ilike 'jackg' and row_count > 0 order by 1;