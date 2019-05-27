CREATE TABLE jackg.test ( 
anInt INT NOT NULL , 
insert_ts timestamp NOT NULL DEFAULT now() , date_id INT NOT NULL DEFAULT to_char(now(),'YYYYMMDD')::integer ) PARTITION BY (((date_id / 100))::int);