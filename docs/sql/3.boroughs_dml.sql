/*
    CITY_ID	  NUMBER
    ID        NUMBER
    NAME	    VARCHAR2(16)
    REG_DATE  DATE
*/

insert into BOROUGHS (city_id, id, name) values (1, seq_borough_id.NEXTVAL, '동구');
insert into BOROUGHS (city_id, id, name) values (1, seq_borough_id.NEXTVAL, '북구');
insert into BOROUGHS (city_id, id, name) values (1, seq_borough_id.NEXTVAL, '연제구');
insert into BOROUGHS (city_id, id, name) values (1, seq_borough_id.NEXTVAL, '강서구');
insert into BOROUGHS (city_id, id, name) values (1, seq_borough_id.NEXTVAL, '금정구');
insert into BOROUGHS (city_id, id, name) values (1, seq_borough_id.NEXTVAL, '기장군');
insert into BOROUGHS (city_id, id, name) values (1, seq_borough_id.NEXTVAL, '남구');
insert into BOROUGHS (city_id, id, name) values (1, seq_borough_id.NEXTVAL, '동래구');
insert into BOROUGHS (city_id, id, name) values (1, seq_borough_id.NEXTVAL, '부산진구');
insert into BOROUGHS (city_id, id, name) values (1, seq_borough_id.NEXTVAL, '사상구');
insert into BOROUGHS (city_id, id, name) values (1, seq_borough_id.NEXTVAL, '사하구');
insert into BOROUGHS (city_id, id, name) values (1, seq_borough_id.NEXTVAL, '서구');
insert into BOROUGHS (city_id, id, name) values (1, seq_borough_id.NEXTVAL, '수영구');
insert into BOROUGHS (city_id, id, name) values (1, seq_borough_id.NEXTVAL, '중구');
insert into BOROUGHS (city_id, id, name) values (1, seq_borough_id.NEXTVAL, '해운대구');


COMMIT;

SELECT * FROM boroughs;
