
 /*
    [Query]
     DDL (Data Definition Language)
     
     데이터 정의어
     객체 생성,  객체 내 열(Cols) 구성과 
     제약조건 등으로  테이블도 정의하고 ( 객체의 생성/변경/삭제 등 )
         
     SYSTEM과 DBA에서 주로 관리하고
     다른 USER에게는 접근 권한을 설정할 수 있다.
     
     -CREATE TABLE
     -ALTER TABLE
     -TRUNCATE TABLE
     -DROP  
     -RENAME
 */
 
 /*
     312p ~ 324p
     정의어 연습
 */
 
 /*
  데이터 정의어 :
  객체의 생성/변경/삭제 관련 기능을 수행
 */
 
 SELECT * FROM all_tables; -- DB의 전체 테이블 조회
 
 SELECT * FROM user_tables; -- user가 관할하는 테이블 조회
 
 SELECT * FROM tabs; -- user가 관할하는 테이블 조회
 
 
 
 /* 
     312p
     테이블 생성 CREATE
 
 */
 
 -- 313p 테이블 생성하기
 CREATE TABLE emp_ddl( empno NUMBER(4), ename VARCHAR2(10), job VARCHAR2(10), mgrno NUMBER(4), hiredate DATE, sal NUMBER(7,2), comm NUMBER(7,2), deptno NUMBER(2));
 
 SELECT * FROM EMP_DDL;
 
 DESC EMP_DDL;
 
 
 -- 314p 다른 테이블 복사
 CREATE TABLE dept_ddl AS SELECT * FROM dept;
 
 -- 314p 구조 조회
 DESC dept_ddl;
 
 SELECT * FROM dept_ddl;  
 
 
 -- 315p 테이블 일부만 복사 (조건을 걸어서 복사할 수 있음)
 CREATE TABLE emp_ddl_30 AS SELECT * FROM emp WHERE (deptno = 30); 
 
 SELECT * FROM emp_ddl_30;  
 
 
 -- 315p 테이블 구조만 복사하기
 CREATE TABLE empdept_ddl AS SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO, D.DNAME, D.LOC FROM emp E JOIN dept D ON (E.DEPTNO) WHERE 1 <> 1;
 
 SELECT * FROM empdept_ddl;  
 
 
 
 /*
     317p
     테이블 변경 ALTER
     
 */
 
 -- 테이블 복사해서 생성하기
 CREATE TABLE emp_alter AS SELECT * FROM emp;
 
 SELECT * FROM emp_alter;
 
 
 -- 318p 테이블에 열(cols)을 추가하는  ALTER TABLE - ADD 
 ALTER TABLE emp_alter ADD hp VARCHAR2(20);
     
 SELECT * FROM emp_alter;
 
 
 -- 318p 열(cols) 이름을 변경하기  ALTER TABLE - RENAME COLUMN - TO -
 ALTER TABLE emp_alter RENAME COLUMN hp TO tel;
 
 SELECT * FROM emp_alter;
 
 
 -- 319p 필드의 데이터 유형 변경하기?   ALTER TABLE - MODIFY - -
 -- 같은 유형으로 변경시 바로 적용됨
 ALTER TABLE emp_alter MODIFY empno NUMBER(5); 
 
 -- 이미 들어있는 값보다 축소시키려고 하거나,  아예 다른 유형으로 변경시  
 -- 데이터 열이 비어있지 않으면  오류로 막힘
 ALTER TABLE emp_alter MODIFY empno NUMBER(3);  -- 연습 
 ALTER TABLE emp_alter MODIFY tel VARCHAR2(10); -- 연습 
 
 SELECT * FROM emp_alter;
 
 
 -- 319p 열(cols) 삭제  ALTER TABLE - DROP COLUMN -
 ALTER TABLE emp_alter DROP COLUMN tel;
 
 SELECT * FROM emp_alter;
 
 
 
 /*
     321p
     테이블 이름 변경 RENAME
     
 */
 
 -- 321p 테이블 이름 변경하기   RENAME - TO -
 RENAME emp_alter TO emp_rename;
 
 SELECT * FROM emp_rename;
 
 -- 321p 기존 테이블 확인 
 DESC emp_alter;
 
 -- 321p 변경 테이블 확인
 SELECT * FROM emp_rename;
 
 
 
 /*
     322p
     테이블 데이터 삭제 TRUNCATE
     
 */
 
 -- 322p 테이블 전체 데이터 삭제   TRUNCATE TABLE -
 -- 테이블 삭제 아님 !!!  테이블 삭제는 DROP
 -- DELETE와 다르게 정의어라서  ROLLBACK 불가함
 TRUNCATE TABLE emp_rename;
 
 SELECT * FROM emp_rename;
 
 
 
 /*
     323p
     테이블 삭제 DROP
     
 */
 
 -- 323p 테이블 삭제  DROP TABLE - 
 DROP TABLE emp_rename;
 
 -- 323p 테이블 확인 
 DESC emp_rename;
 
 
 