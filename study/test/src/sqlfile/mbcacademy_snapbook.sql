/*
 * 유저 계정 테이블
 */
DROP TABLE account_tbl;

-- 계정ID, 비밀번호, 가입일, 활성화여부, 개인정보
-- 로그인 :		SELECT id, pw, uno, isactive FROM account_tbl WHERE id = ?;

-- 가입시 호출2 : 	userinfo table -> uno 시퀀스 next 호출됨 ( 필수 호출 )
--		INSERT INTO account_tbl (id, pw, uno) VALUES (id, pw, userinfo_seq.currval);

-- 중복계정 찾기 : 	SELECT id, isactive FROM account_tbl WHERE id = ?;
-- 탈퇴 :			UPDATE account SET (isactive) = (0) WHERE id = ?;

-- 아이디 찾기2 :	userinfo table -> uno ->  
--		SELECT id, isactive FROM account_tbl WHERE uno = ?;

-- 비밀번호 찾기 : 	SELECT pw FROM account_tbl WHERE id = ?;

-- 회원정보 수정1 : SELECT uno FROM account_tbl WHERE id = ?;

CREATE TABLE account_tbl (
	id			VARCHAR2(10),
	pw			VARCHAR2(10),
	uno			NUMBER(5),
	
	registdate	DATE DEFAULT SYSDATE,
	isactive	NUMBER(1) DEFAULT 1,
	
	CONSTRAINT account_tbl_id_pk PRIMARY KEY (id)
);
SELECT * FROM account_tbl;








/*
 * 유저 개인정보 테이블
 */
DROP TABLE userinfo_tbl;

-- 이름, 주민번호, 전화번호, 이메일, id 
-- 가입시 호출1	: 			INSERT INTO userinfo_tbl (uno, name, ssn, phone, email)
--						VALUES (userinfo_seq.nextval, ?, ?, ?, ?);
-- 아이디 찾기1 이메일 : 		SELECT uno FROM userinfo_tbl WHERE email = ?;
-- 아이디 찾기1 본인인증 : 	SELECT uno FROM userinfo_tbl WHERE name = ? and ssn = ?;

-- 회원정보 수정2 전화번호 : 	UPDATE userinfo_tbl SET (phone) = (?) WHERE uno = ?;
-- 회원정보 수정2 이메일 : 	UPDATE userinfo_tbl SET (email) = (?) WHERE uno = ?;
CREATE TABLE userinfo_tbl (
	uno		NUMBER(5),
	name	VARCHAR2(10),
	ssn		VARCHAR2(14),
	phone	VARCHAR2(13),
	email	VARCHAR2(20),
	
	CONSTRAINT userinfo_tbl_uno_fk 	PRIMARY KEY (uno)
);
SELECT * FROM userinfo_tbl;



/*
 * 유저 개인정보 시퀀스
 */
CREATE SEQUENCE userinfo_seq 
	INCREMENT BY 1
	START WITH 1
	NOCYCLE
	NOCACHE;
	
DROP SEQUENCE userinfo_seq;
	








/*
 * 보드 테이블
 */
DROP TABLE board_tbl;

-- 게시번호, 제목, 내용, 작성일, 조회수, 게시여부, 작성자ID
-- 게시글 작성 :		INSERT INTO board_tbl (bno, title, content, id) 
--						VALUES (board_seq.nextval, ?, ?, ?);
-- 게시글 목록 조회 : 	SELECT * FROM board_tbl;
-- 게시글 존재여부 확인 : SELECT bno, isactive FROM board_tbl WHERE bno;
-- 게시글 상세 조회1 :	UPDATE board_tbl SET (viewcount) = (viewcount + 1) WHERE bno = ?;
-- 게시글 상세 조회2 :	SELECT * FROM board_tbl;
-- 게시글 수정 :		UPDATE board_tbl (title, content, lastupdatedate) SET (?, ?, ?) WHERE bno = ?;
-- 게시글 삭제 : 		UPDATE board_tbl (isactive) SET (0) WHERE bno = ?;
CREATE TABLE board_tbl (
	bno				NUMBER(5),
	title			VARCHAR2(100),
	content			VARCHAR2(1000),
	creationdate	DATE DEFAULT SYSDATE,
	lastupdatedate	DATE DEFAULT SYSDATE,
	viewcount		NUMBER(5) DEFAULT 0,
	isactive		NUMBER(1) DEFAULT 1,
	id				VARCHAR2(10),
	
	CONSTRAINT board_tbl_bno_pk PRIMARY KEY (bno),
	CONSTRAINT board_tbl_id_fk FOREIGN KEY (id)
		REFERENCES account_tbl (id)
);
SELECT * FROM board_tbl;

/*
 * 보드 시퀀스
 */
CREATE SEQUENCE board_seq 
	INCREMENT BY 1
	START WITH 1
	NOCYCLE
	NOCACHE;