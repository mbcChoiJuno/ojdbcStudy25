  
 /*
     Constraint
     
     제약조건
     
     특정한 테이블의 열(cols) 필드에  유일한 값인지 여부, NULL을 허용하는지 여부 등 
     제약 속성을 부여함으로써
     
     여러 테이블이 엮이는 복잡한 구조 속에서
     데이터 무결성을 지킨다.
     
     데이터 무결성: 정확성 + 일관성
 */

 /* 
    359p ~ 393p
    제약 조건 연습
    
 */
 
 -- 362p
 CREATE TABLE table_notnull(
    login_id   VARCHAR2(20) NOT NULL,
    login_pwd  VARCHAR2(20) NOT NULL,
    login_tel  VARCHAR2(20)
 );
 DESC table_notnull;
 
 -- 362p  NOT NULL에 NULL이 들어가면 오류 발생
 INSERT INTO table_notnull VALUES('TEST_ID_01', NULL, '010-1234-5678');
 
 -- 363p  정상 작동
 INSERT INTO table_notnull VALUES('TEST_ID_01', '1234', NULL);
 
 -- 확인용
 SELECT * FROM table_notnull;
 
 -- 363p  TEST_ID_01 유저의 login_pwd필드(NOT NULL)를  NULL값으로 수정 시도
 UPDATE table_notnull SET login_pwd = NULL WHERE login_id = 'TEST_ID_01';
 
 
 
 /*
    364p
    제약조건 객체 확인
    
 */
 
 -- 364p 제약조건 살펴보기
 SELECT * FROM USER_CONSTRAINTS;
 
 
 /*
    365p
    제약조건 이름 직접 지정   CONSTRAINT -조건명- 제약조건
    
 */
 
 -- 365p 테이블 생성하면서 바로 제약조건 지정
 CREATE TABLE table_notnull2(
    login_id    VARCHAR(20) CONSTRAINT TBLNN2_LGNID_NN NOT NULL,
    login_pwd   VARCHAR(20) CONSTRAINT TBLNN2_LGNPW_NN NOT NULL,
    tel         VARCHAR(20)
 );
 
 SELECT * FROM USER_CONSTRAINTS;
 
 
 -- 366p  이미 생성된 테이블에  제약조건 부여 시
 -- tel 열(cols)에 null이 이미 있어서 NOT NULL 부여 불가함
 ALTER TABLE table_notnull MODIFY (tel NOT NULL);
 
 -- 366p  tel 열데이터 수정
 UPDATE table_notnull SET tel = '010-1234-5678' WHERE login_id = 'TEST_ID_01';
 
 SELECT * FROM table_notnull;
 
 -- 367p  다시한번 NOT NULL 부여
 ALTER TABLE table_notnull MODIFY (tel NOT NULL);
 
 -- 367p  제약조건에 이름 지정해서 추가
 ALTER TABLE table_notnull2 MODIFY (tel CONSTRAINT TBLNN_TEL_NN2 NOT NULL);
 
 SELECT * FROM USER_CONSTRAINTS;
 
 /* 
    368p
    이미 생성된 제약조건 이름 변경
 
 */
 
 -- 368p  이미 생성된 제약조건  이름 변경
 ALTER TABLE table_notnull2 RENAME CONSTRAINT tblnn_tel_nn2 to tblnn2_tel_nn;
 
 -- 369p  제약조건 삭제하기
 ALTER TABLE table_notnull2 DROP CONSTRAINT tblnn_tel_nn2;
 
 
 /*
    370p
    중복되지 않는 값 UNIQUE
 */
 
 -- 370p  테이블 생성하면서 제약조건 UNIQUE 부여하기
 CREATE TABLE table_unique (
    login_id    VARCHAR2(20) CONSTRAINT table_unique_login_id_u UNIQUE,
    login_pwd   VARCHAR2(20) CONSTRAINT table_unique_login_pw_nn NOT NULL,
    tel         VARCHAR2(20)
 );
 
 SELECT * FROM USER_CONSTRAINTS WHERE table_name = 'TABLE_UNIQUE';
 
 -- 371p unique 필드에 아이디 입력1
 INSERT INTO table_unique (login_id, login_pwd, tel) VALUES ('TEST_ID_01', 'PWD01', '010-1234-5678');
 
 SELECT * FROM table_unique;
 
 -- 371p unique 필드에 아이디 입력2 = 중복으로 무결성 위배 오류
 INSERT INTO table_unique (login_id, login_pwd, tel) VALUES ('TEST_ID_01', 'PWD01', '010-1234-5678');
 
 -- 372p 다른 ID 입력시 정상 입력됨
 INSERT INTO table_unique (login_id, login_pwd, tel) VALUES ('TEST_ID_02', 'PWD01', '010-1234-5678');

 -- 372p unique 제약이 있어도  중복은 2번 3번 계속 들어감
 INSERT INTO table_unique (login_id, login_pwd, tel) VALUES (NULL, 'PWD01', '010-1234-5678');
 
 -- 373p unique 제약 필드에 데이터 수정하기  이미 있는 ID라  무결성 위배 오류
 UPDATE table_unique SET login_id = 'TEST_ID_01' WHERE login_id IS NULL;
 
 
 -- 373p 테이블 생성할때 unique 제약 이름 만들기
 -- 위에서 이미 그렇게 함
 
 
 /* 
    377p
    고유 키
    PRIMARY KEY
 
 */
 
 -- 377p
 CREATE TABLE table_pk(
    login_id    VARCHAR2(20) CONSTRAINT tpk_loginid_pk PRIMARY KEY,
    login_pw    VARCHAR2(20) NOT NULL,
    tel         VARCHAR2(20)
 );
 
 SELECT * FROM USER_CONSTRAINTS;
 
 -- 378p skip
 
 
 /*
    379p
    PRIMARY KEY (PK)
    
 */
 
 -- 379p   PRIMARY KEY는  중복값, NULL이 허용되지 않음  데이터입력 1
 INSERT INTO table_pk VALUES('TEST_ID_01', 'PWD01', '010-6800-3743');
 
 SELECT * FROM table_pk;
 
 -- 379p   PRIMARY KEY는  중복값, NULL이 허용되지 않음  데이터입력 2  -> 무결성 위배 오류
 INSERT INTO table_pk VALUES('TEST_ID_01', 'PWD02', '010-6800-3743');
 
 -- 380p   PRIMARY KEY는  중복값, NULL이 허용되지 않음  데이터입력 3  -> 무결성 위배 오류
 INSERT INTO table_pk VALUES(NULL, 'PWD03', '010-6800-3743');
 
 -- 380p   PRIMARY KEY는  암시적으로 NULL을 넣어도  -> 무결성 위배 오류
 INSERT INTO table_pk (login_pw, tel) VALUES('PWD03', '010-6800-3743');
 
 
 /*
    382p
    FOREIGN KEY (FK)
    
 */
 
 -- 382p  테스트용 SCOTT 계정 테이블의  제약조건 살펴보기
 SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_OWNER, R_CONSTRAINT_NAME FROM USER_CONSTRAINTS WHERE TABLE_NAME IN ('EMP', 'DEPT'); 
 
 -- 383p  FK가 참조하는 열에 존재하지 않는 데이터 입력하기  deptno은 10~40밖에 없음
 INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (9999, '홍길동', 'CLERK', '7788', TO_DATE('2025-06-04','YYYY/MM/DD'), 1200, NULL, 50);
 
 
 -- 384p  PK를 가진 dept fk 테이블 만들기
 CREATE TABLE dept_fk (
    deptno  NUMBER(2) CONSTRAINT deptfk_deptno_pk PRIMARY KEY,
    dname   VARCHAR2(14),
    loc     VARCHAR2(13)
 );
 
 -- 385p  PK를 가지고,  fk로  dept fk를 바라보는  emp fk 테이블 만들기
 CREATE TABLE emp_fk(
    empno       NUMBER(2) CONSTRAINT empfk_empno_pk PRIMARY KEY,
    ename       VARCHAR2(10),
    job         VARCHAR2(9),
    mgr         NUMBER(4),
    hiredate    DATE,
    sal         NUMBER(7,2),
    comm        NUMBER(7,2),
    deptno      NUMBER(2) CONSTRAINT empfk_deptno_fk REFERENCES dept_fk(deptno)
 );
 
 SELECT * FROM emp_fk;
 
 -- 386p  초기단계로  dept fk 테이블에 데이터가 없어,  emp fk 테이블에 데이터를 넣으려고 하면  무결성 오류
 INSERT INTO emp_fk VALUES (99, 'TEST_NAME', 'TEST_JOB', NULL, TO_DATE('2025-06-04','YYYY/MM/DD'), 3000, NULL, 10);
 
 -- 386p  dept fk 테이블에 데이터 삽입하기
 INSERT INTO dept_fk VALUES (10, 'TEST_DNAME', 'TEST_LOC');
 
 -- 386p  fk 참조 테이블에 데이터 넣은후  emp 테이블에 데이터 넣으면 작동
 INSERT INTO emp_fk VALUES (99, 'TEST_NAME', 'TEST_JOB', NULL, TO_DATE('2025-06-04','YYYY/MM/DD'), 3000, NULL, 10);
 
 SELECT * FROM emp_fk;
 
 
 -- 387p  dept_fk 테이블의 10번 부서 데이터 삭제 시도  = deptno 10을 참조하는 테이블이 있어서 무결성 오류
 DELETE FROM dept_fk WHERE deptno = 10; 
 
 
 
 /*
    390p
    CHECK 제약조건
 */
 
 -- 390p  테이블 생성할때 check 제약조건 넣기
 CREATE TABLE table_check (
    login_id    VARCHAR2(20) CONSTRAINT tblck_loginid_pk PRIMARY KEY,
    login_pwd   VARCHAR2(20) CONSTRAINT tblck_loginpw_ck CHECK (LENGTH(login_pwd) > 3),
    tel         VARCHAR2(20)
 );
 
 -- 390p  check 제약조건에 맞지않는 값 입력 시  무결성 위배로 오류
 INSERT INTO table_check VALUES ('TEST_ID_01', '123', '010-6800-3743');
 
 -- 391p  check 제약조건에 맞는 값 입력시 정상작동
 INSERT INTO table_check VALUES ('TEST_ID_01', '1234', '010-6800-3743');
 
 SELECT * FROM table_check;
 
 
 
 /*
    392p
    DEFAULT 제약조건
 */
 
 -- 392p  default 조건을 걸고  테이블생성
 CREATE TABLE table_default(
    login_id    VARCHAR2(20) CONSTRAINT tblck2_loginid_pk PRIMARY KEY,
    login_pwd   VARCHAR2(20) DEFAULT '1234',
    tel         VARCHAR2(20)
 );
 
 -- 392p  default로 지정한 필드  null로 입력
 INSERT INTO table_default VALUES ('TEST_ID_01', NULL, '010-4561-7897');
 
 SELECT * FROM table_default; -- NULL이라서 NULL로 지정되어 들어감
 
 INSERT INTO table_default (login_id, tel) VALUES ('TEST_ID_02', '010-1234-1233');
 
 SELECT * FROM table_default; -- 암시적으로 아무것도 넣지않으면  NULL 대신 DEFAULT value가 들어감