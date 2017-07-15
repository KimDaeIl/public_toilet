/*
  ID	        NUMBER
  MEMBER_ID	  VARCHAR2(16)
  MEMBER_PWD	VARCHAR2(16)
  NICKNAME  	VARCHAR2(16)
  ENTRY_DATE	DATE
*/

INSERT INTO members(id, member_id, member_pw, nickname) values(seq_user_id.NEXTVAL, 'USER01', 'PASSWORD01', 'NICKNAME01');
INSERT INTO members(id, member_id, member_pw, nickname) values(seq_user_id.NEXTVAL, 'USER02', 'PASSWORD01', 'NICKNAME02');
INSERT INTO members(id, member_id, member_pw, nickname) values(seq_user_id.NEXTVAL, 'USER03', 'PASSWORD01', 'NICKNAME03');
INSERT INTO members(id, member_id, member_pw, nickname) values(seq_user_id.NEXTVAL, 'USER04', 'PASSWORD01', 'NICKNAME04');
INSERT INTO members(id, member_id, member_pw, nickname) values(seq_user_id.NEXTVAL, 'USER05', 'PASSWORD01', 'NICKNAME05');
INSERT INTO members(id, member_id, member_pw, nickname) values(seq_user_id.NEXTVAL, 'USER06', 'PASSWORD01', 'NICKNAME06');
INSERT INTO members(id, member_id, member_pw, nickname) values(seq_user_id.NEXTVAL, 'USER07', 'PASSWORD01', 'NICKNAME07');
INSERT INTO members(id, member_id, member_pw, nickname) values(seq_user_id.NEXTVAL, 'USER08', 'PASSWORD01', 'NICKNAME08');
INSERT INTO members(id, member_id, member_pw, nickname) values(seq_user_id.NEXTVAL, 'USER09', 'PASSWORD01', 'NICKNAME09');

COMMIT;
