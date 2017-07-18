
DROP TABLE reviews;
DROP TABLE members;
DROP TABLE toilets;
DROP TABLE boroughs;
DROP TABLE cities;


DROP SEQUENCE seq_city_id;
DROP SEQUENCE seq_toilet_id;
DROP SEQUENCE seq_borough_id;
DROP SEQUENCE seq_user_id;

-- users
CREATE SEQUENCE seq_user_id
  START WITH 1
  INCREMENT BY 1
  MINVALUE 1
  NOCYCLE;


CREATE TABLE members(
  id	NUMBER NOT NULL,
  member_id	VARCHAR2(32) NOT NULL,
  member_pw	VARCHAR2(32) NOT NULL,
  nickname	VARCHAR2(32) NOT NULL,
  deleted_at DATE,
  entry_date	DATE DEFAULT SYSDATE NOT NULL
);
ALTER TABLE members ADD (CONSTRAINT pk_members PRIMARY KEY(id));
ALTER TABLE members ADD (CONSTRAINT uk_members UNIQUE(member_id));

-- cities
CREATE SEQUENCE seq_city_id
  START WITH 1
  INCREMENT BY 1
  MINVALUE 1
  NOCYCLE;

CREATE TABLE cities(
  id	NUMBER NOT NULL,
  name	VARCHAR2(10) NOT NULL,
  reg_date	DATE DEFAULT SYSDATE NOT NULL
);
ALTER TABLE cities ADD (CONSTRAINT pk_cities PRIMARY KEY(id));

-- borough
CREATE SEQUENCE seq_borough_id
  START WITH 1
  increment BY 1
  MINVALUE 1
  NOCYCLE;


CREATE TABLE boroughs(
  city_id	NUMBER NOT NULL,
  id	NUMBER NOT NULL,
  name	VARCHAR2(16) NOT NULL,
  reg_date	DATE DEFAULT SYSDATE NOT NULL
);
ALTER TABLE boroughs ADD (CONSTRAINT pk_boroughs PRIMARY KEY(id));
ALTER TABLE boroughs ADD (CONSTRAINT fk_city_id FOREIGN KEY(city_id) REFERENCES cities(id));
CREATE INDEX idx_borough_city_id ON boroughs(city_id);


-- toilet
CREATE SEQUENCE seq_toilet_id
  START WITH 1
  INCREMENT BY 1
  MINVALUE 1
  NOCYCLE;

CREATE TABLE toilets(
  borough_id	NUMBER NOT NULL,
  id	NUMBER NOT NULL,
  name VARCHAR2(128) NOT NULL,
  type	VARCHAR2(32) NOT NULL,
  is_common	CHAR(1) DEFAULT 'N' NOT NULL,
  count_man_feces	NUMBER(2) DEFAULT 0 NOT NULL,
  count_man_urine	NUMBER(2) DEFAULT 0 NOT NULL,
  count_man_feces_with_handicap	NUMBER(2) DEFAULT 0 NOT NULL,
  count_man_urin_with_handicap	NUMBER(2) DEFAULT 0 NOT NULL,
  count_man_child_feces	NUMBER(2) DEFAULT 0 NOT NULL,
  count_man_child_urine	NUMBER(2) DEFAULT 0 NOT NULL,
  count_lady_feces	NUMBER(2) DEFAULT 0 NOT NULL,
  count_lady_feces_with_handicap	NUMBER(2) DEFAULT 0 NOT NULL,
  count_lady_child_feces	NUMBER(2) DEFAULT 0 NOT NULL,
  manage_agency	VARCHAR2(32) NOT NULL,
  phone	VARCHAR2(32),
  open_time	VARCHAR2(64),
  installation_date	VARCHAR2(32),
  lat	NUMBER(9,6) NOT NULL,
  lon	NUMBER(9,6) NOT NULL,
  std_date	VARCHAR2(16) NOT NULL,
  phone2	VARCHAR2(16),
  count_review	NUMBER DEFAULT 0 NOT NULL,
  sum_review	NUMBER DEFAULT 0 NOT NULL,
  reg_date	DATE DEFAULT SYSDATE NOT NULL
);
ALTER TABLE toilets ADD (CONSTRAINT pk_toilets PRIMARY KEY(id));
ALTER TABLE toilets ADD (CONSTRAINT fk_borough_id FOREIGN KEY(borough_id) REFERENCES  boroughs(id));
CREATE INDEX idx_toilet_borough_id ON toilets(borough_id);


-- reviews
CREATE TABLE reviews(
  toilet_id	NUMBER NOT NULL,
  writer_id	NUMBER NOT NULL,
  review	VARCHAR2(200) NOT NULL,
  score	NUMBER(2) NOT NULL,
  reg_date	DATE DEFAULT SYSDATE NOT NULL
);
ALTER TABLE reviews ADD (CONSTRAINT fk_toilet_id FOREIGN KEY(toilet_id) REFERENCES toilets(id));
ALTER TABLE reviews ADD (CONSTRAINT fk_writer_id FOREIGN KEY(writer_id) REFERENCES members(id));
ALTER TABLE reviews ADD (CONSTRAINT pk_reviews PRIMARY KEY(toilet_id,writer_id));
CREATE INDEX idx_review_toilet_id ON reviews(toilet_id);
