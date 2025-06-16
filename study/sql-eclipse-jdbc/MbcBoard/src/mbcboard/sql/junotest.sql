/*
 * 가입 시도
 * 
 * [정보]
 * 계정, 암호
 * 이름
 * 
 * -> insert into account_tbl (uid, id, pw) values (account_seq.nextval, 'id', 'pw'); 
 * 
 * -> insert into user_tbl (name, gender, age, email, uid);
 */

-- 계정
CREATE TABLE account_tbl (
	uid					VARCHAR2(10)	PRIMARY KEY,
	id					VARCHAR2(10),
	pw					VARCHAR2(10),
	create_time			DATE DEFUALT SYSDATE,
	is_active			BOOLEAN	DEFUALT 1 NOT NULL
);



-- 약관 목록 (참조형 테이블)
CREATE TABLE terms (
	terms_id,
	terms_type, 	-- 선택, 필수
	terms_title,	-- 약관명
	terms_url,		-- 약관내용?
);

-- 약관 동의 (행동 테이블)
-- uid / terms_id / terms_agree
-- 등록 insert into terms_agree_tbl (uid, terms_id, 0);
-- 조회 select * from terms where uid = 'uid' and terms_id = 'terms_id'; 
CREATE TABLE terms_agree_tbl (
	uid				VARCHAR2(10) 		CONSTRAINT terms_agree_uid_fk REFERENCES account_tbl (uid) NOT NULL, -- fk
	terms_id		VARCHAR2(10)		CONSTRAINT terms_agree_terms_id_fk REFERENCES terms (terms_id) NOT NULL, -- fk
	terms_agree		NUMBER(1)			DEFAULT 0 NOT NULL,
	CONSTRAINT terms_agree_user_pk PRIMARY KEY (uid, terms_id)
);



-- 사용자
-- name, gender, age, email, uid
CREATE TABLE user_tbl (
	user_name		VARCHAR2(10),
	
	uid				VARCHAR2(10), -- fk
);





-------------------------------------------------------

-- 유저 테이블
DROP TABLE lerp_user_tbl;

CREATE TABLE lerp_user_tbl (
	id		VARCHAR2(10)	PRIMARY KEY,
	pw		VARCHAR2(10),
	name	VARCHAR2(10)
);

SELECT * FROM lerp_user_tbl;





-- 보드 시퀀스
CREATE SEQUENCE board_seq 
	INCREMENT BY 1
	START WITH 1
	NOCYCLE
	NOCACHE;
	
-- 보드 테이블
DROP TABLE board_tbl;

CREATE TABLE board_tbl (
	bno			NUMBER(5)		PRIMARY KEY,
	title		VARCHAR2(100)	NOT NULL,
	content		VARCHAR2(100)	NOT NULL,
	createdate	DATE			DEFAULT SYSDATE NOT NULL,
	writer		VARCHAR2(10),
	
	CONSTRAINT board_tbl_writer_fk FOREIGN KEY (writer) REFERENCES lerp_user_tbl (id)
);

SELECT * FROM board_tbl;








