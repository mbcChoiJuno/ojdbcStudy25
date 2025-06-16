 
 /*
    [Query]
     DML (Data Manipulation Language)
     
     INSERT
 */
 
 /*
    265p ~ 275p 
    INSERT 학습 
  
 */
 
 
 -- 266p 테이블 생성하기 
 CREATE TABLE dept_temp AS SELECT * FROM DEPT;
 
 -- 266p 생성한 테이블 조회
 SELECT * FROM dept_temp;
 
 -- 268p 테이블에  데이터 추가하기
 INSERT INTO dept_temp (deptno, dname, loc) VALUES (50, 'DATABASE', 'SEOUL');
 
 -- 270p NULL을 지정하여 입력하기
 INSERT INTO dept_temp (deptno, dname, loc) VALUES (70, 'WEB', NULL);
 
 -- 271p 공백 문자열로 NULL 입력하기
 INSERT INTO dept_temp (deptno, dname, loc) VALUES (80, 'MOBILE', '');
 
 -- 271p 열 데이터를 넣지 않는 방식으로 NULL 입력하기
 INSERT INTO dept_temp (deptno, loc) VALUES (90, 'INCHEON');
 
 
 
 -- 272p EMP 테이블을 복사해서 emp_temp 테이블 만들기
 CREATE TABLE emp_temp AS SELECT * FROM emp WHERE 1 <> 1;
 
 -- 272p 테이블 확인
 SELECT * FROM emp_temp;
 
 -- 273p INSERT 문으로 날짜 입력하기 ( HIREDATE 필드가 DATE 타입이라 날짜형태로 입력 )
 INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (9999, '홍길동', 'PRESIDENT', NULL, '2025/06/03', 5000, 1000, 10);
 
 -- 273p INSERT 문으로 날짜 입력하기 2 ( HIREDATE 필드가 DATE 타입이라 날짜형태로 입력 )
 INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (1111, '성춘향', 'MANAGER', 9999, '2025-06-03', 4000, NULL, 20);
 
 -- 273p 오류 케이스 날짜 문자열로 잘못 입력하면 고장남
 INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (2222, '이순신', 'MANAGER', 9999, '06/03/2025', 4000, NULL, 20);
 
 -- 274p 날짜는 TO_DATE 함수 사용이 좋음
 INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (2222, '이순신', 'MANAGER', 9999, TO_DATE('03/06/2025', 'DD/MM/YYYY'), 4000, NULL, 20);
 
 -- 275p SYSDATE ( 오늘 날짜 )
 INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (3333, '심청이', 'MANAGER', 9999, SYSDATE, 4000, NULL, 30);
 
 
 -- 275p 서브쿼리로 한번에 여러 데이터 추가
 INSERT INTO emp_temp (empno, ename, job, mgr, hiredate, sal, comm, deptno) (SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO FROM emp E, salgrade S WHERE E.SAL BETWEEN S.LOSAL and S.HISAL and S.GRADE = 1);
