
DROP TABLE board;
DROP SEQUENCE board_seq;

CREATE TABLE board (
	bno			NUMBER(5)			PRIMARY KEY,
	btitle		NVARCHAR2(30)		NOT NULL,
	bcontent	NVARCHAR2(1000)		NOT NULL,
	bwriter		NVARCHAR2(10)		NOT NULL,
	bdate		DATE				NOT NULL
);

SELECT * FROM board;

CREATE SEQUENCE board_seq 
	INCREMENT BY 1 
	START WITH 1 
	NOCYCLE 
	NOCACHE;
	

-- 보드 INSERT 예시
INSERT INTO board (bno, btitle, bcontent, bwriter, bdate)
	VALUES (board_seq.nextval,
	'타이틀',
	'내용',
	'게시자',
	SYSDATE);
	
	
INSERT INTO board (bno, btitle, bcontent, bwriter, bdate) 
	VALUES (board_seq.nextval, '덥내용~', '무더운데 등교하시느라 고생하셨습니다', '최준오', SYSDATE);
	
INSERT INTO BOARD (bno, btitle, bcontent, bwriter, bdate) 
	VALUES (board_seq.nextval, '안녕하세요~', '무더운데 등교하시느라 고생하셨습니다', '최준오', SYSDATE);
	
INSERT INTO BOARD (bno, btitle, bcontent, bwriter, bdate) 
	VALUES (board_seq.nextval, '감사합니다.~', '무더운데 등교하시느라 고생하셨습니다', '최준오', SYSDATE);
	
INSERT INTO BOARD (bno, btitle, bcontent, bwriter, bdate) 
	VALUES (board_seq.nextval, '수고하셨네요~', '무더운데 등교하시느라 고생하셨습니다', '최준오', SYSDATE);
	
INSERT INTO BOARD (bno, btitle, bcontent, bwriter, bdate) 
	VALUES (board_seq.nextval, '화이팅하세요~', '무더운데 등교하시느라 고생하셨습니다', '최준오', SYSDATE);
	
INSERT INTO BOARD (bno, btitle, bcontent, bwriter, bdate) 
	VALUES (board_seq.nextval, '방갑습니다.~', '무더운데 등교하시느라 고생하셨습니다', '최준오', SYSDATE);

	
SELECT * FROM board;