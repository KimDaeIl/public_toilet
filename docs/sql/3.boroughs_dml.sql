/*
    CITY_ID	  NUMBER
    ID        NUMBER
    NAME	    VARCHAR2(16)
    REG_DATE  DATE
*/

insert into BOROUGHS (city_id, id, name) values (1, seq_borough_id.NEXTVAL, '����');
insert into BOROUGHS (city_id, id, name) values (1, seq_borough_id.NEXTVAL, '�ϱ�');
insert into BOROUGHS (city_id, id, name) values (1, seq_borough_id.NEXTVAL, '������');
insert into BOROUGHS (city_id, id, name) values (1, seq_borough_id.NEXTVAL, '������');
insert into BOROUGHS (city_id, id, name) values (1, seq_borough_id.NEXTVAL, '������');
insert into BOROUGHS (city_id, id, name) values (1, seq_borough_id.NEXTVAL, '���屺');
insert into BOROUGHS (city_id, id, name) values (1, seq_borough_id.NEXTVAL, '����');
insert into BOROUGHS (city_id, id, name) values (1, seq_borough_id.NEXTVAL, '������');
insert into BOROUGHS (city_id, id, name) values (1, seq_borough_id.NEXTVAL, '�λ�����');
insert into BOROUGHS (city_id, id, name) values (1, seq_borough_id.NEXTVAL, '���');
insert into BOROUGHS (city_id, id, name) values (1, seq_borough_id.NEXTVAL, '���ϱ�');
insert into BOROUGHS (city_id, id, name) values (1, seq_borough_id.NEXTVAL, '����');
insert into BOROUGHS (city_id, id, name) values (1, seq_borough_id.NEXTVAL, '������');
insert into BOROUGHS (city_id, id, name) values (1, seq_borough_id.NEXTVAL, '�߱�');
insert into BOROUGHS (city_id, id, name) values (1, seq_borough_id.NEXTVAL, '�ؿ�뱸');


COMMIT;

SELECT * FROM boroughs;
