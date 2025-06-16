 
 /*
     TEST 모음
 */
 
 
 /*
  239p ~ 240p TEST 
 */
 
 -- test1 ( ! SQL-99 )
 SELECT D1.DEPTNO, D1.DNAME, E1.EMPNO, E1.ENAME, E1.SAL FROM emp E1, dept D1 WHERE (E1.DEPTNO = D1.DEPTNO) and E1.SAL > 2000 ORDER BY E1.DEPTNO;
 
 -- test1 ( SQL-99 )
 SELECT D1.DEPTNO, D1.DNAME, E1.EMPNO, E1.ENAME, E1.SAL FROM emp E1 INNER JOIN dept D1 ON (E1.DEPTNO = D1.DEPTNO) WHERE sal > 2000 ORDER BY E1.DEPTNO;
 
 -- test2 ( ! SQL-99 )
 SELECT D1.DEPTNO, D1.DNAME, AVG(E1.SAL) as avg_sal, MAX(E1.SAL), MIN(E1.SAL), LENGTH(E1.DEPTNO) FROM dept D1, emp E1 WHERE (D1.DEPTNO = E1.DEPTNO) ORDER BY D1.DEPTNO; 
 
 -- test2 ( SQL-99 )
 -- 중지하고 다음 수업으로 넘어감
 
 
 
 
 /* 
  287p ~ 289p 테스트 
 */
 
 -- test 준비사항
 CREATE TABLE CHAP10HW_EMP AS SELECT * FROM EMP;
 
 CREATE TABLE CHAP10HW_DEPT AS SELECT * FROM DEPT;
 
 CREATE TABLE CHAP10HW_SALGRADE AS SELECT * FROM SALGRADE;
 
 DROP TABLE CHAP10HW_EMP;
 
 DROP TABLE CHAP10HW_DEPT;
 
 DROP TABLE CHAP10HW_SALGRADE;
 
 SELECT * FROM CHAP10HW_EMP; 
 
 SELECT * FROM CHAP10HW_DEPT; 
 
 SELECT * FROM CHAP10HW_SALGRADE; 
 
 -- test 1
 
 INSERT INTO CHAP10HW_DEPT (deptno, dname, loc) VALUES (50, 'ORACLE', 'BUSAN');
 
 INSERT INTO CHAP10HW_DEPT (deptno, dname, loc) VALUES (60, 'SQL', 'ILSAN');
 
 INSERT INTO CHAP10HW_DEPT (deptno, dname, loc) VALUES (70, 'SELECT', 'INCHEON');
 
 INSERT INTO CHAP10HW_DEPT (deptno, dname, loc) VALUES (80, 'DML', 'BUNDANG');
  
 SELECT * FROM CHAP10HW_DEPT; 
 
 COMMIT;
 
 -- test 2
 
 INSERT INTO CHAP10HW_EMP (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7201, 'TEST_USER1', 'MANAGER', 7788, TO_DATE('2016-01-02','YYYY-MM-DD'), 4500, NULL, 50);
 
 INSERT INTO CHAP10HW_EMP (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7202, 'TEST_USER2', 'CLERK', 7201, TO_DATE('2016-02-21','YYYY-MM-DD'), 1800, NULL, 50);
 
 INSERT INTO CHAP10HW_EMP (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7203, 'TEST_USER3', 'ANALYST', 7201, TO_DATE('2016-04-11','YYYY-MM-DD'), 3400, NULL, 60);
 
 INSERT INTO CHAP10HW_EMP (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7204, 'TEST_USER4', 'SALESMAN', 7201, TO_DATE('2016-05-31','YYYY-MM-DD'), 2700, 300, 60);
 
 INSERT INTO CHAP10HW_EMP (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7205, 'TEST_USER5', 'CLERK', 7201, TO_DATE('2016-07-20','YYYY-MM-DD'), 2600, NULL, 70);
 
 INSERT INTO CHAP10HW_EMP (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7206, 'TEST_USER6', 'CLERK', 7201, TO_DATE('2016-09-08','YYYY-MM-DD'), 2600, NULL, 70);
 
 INSERT INTO CHAP10HW_EMP (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7207, 'TEST_USER7', 'LECTURER', 7201, TO_DATE('2016-10-28','YYYY-MM-DD'), 2300, NULL, 80);
 
 INSERT INTO CHAP10HW_EMP (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES (7208, 'TEST_USER8', 'STUDENT', 7201, TO_DATE('2018-03-09','YYYY-MM-DD'), 1200, NULL, 80);
 
 SELECT * FROM CHAP10HW_EMP;
 
 COMMIT;
 
 -- test 3
 UPDATE CHAP10HW_EMP SET (deptno) = 70 WHERE sal > (SELECT AVG(sal) as avg FROM CHAP10HW_EMP WHERE deptno = 50); 
 
 SELECT * FROM CHAP10HW_EMP;
 
 COMMIT;
 
 -- test 4
 UPDATE CHAP10HW_EMP SET (sal) = sal * 1.1, (deptno) = 80 WHERE hiredate > (SELECT MIN(hiredate) FROM CHAP10HW_EMP WHERE deptno = 60);
 
 SELECT * FROM CHAP10HW_EMP ORDER BY deptno;
 
 COMMIT;
 
 -- test 5
 DELETE CHAP10HW_EMP WHERE empno IN (SELECT E.EMPNO FROM CHAP10HW_EMP E JOIN CHAP10HW_SALGRADE S ON (E.SAL BETWEEN S.LOSAL and S.HISAL) WHERE S.GRADE = 5);
 
 SELECT * FROM CHAP10HW_EMP;
 
 COMMIT;
 
 -- test 5 조건 테스트용
 SELECT E.EMPNO FROM CHAP10HW_EMP E JOIN CHAP10HW_SALGRADE S ON (E.SAL BETWEEN S.LOSAL and S.HISAL) WHERE S.GRADE = 5;
 
 
 
 
 /* 
     324p ~ 325p  
     테스트 
 */
 
 -- test 1
 CREATE TABLE emp_hw (
     empno       NUMBER(4),
     ename       VARCHAR2(10),
     job         VARCHAR2(9),
     mgr         NUMBER(4),
     hiredate    DATE,
     sal         NUMBER(7,2),
     comm        NUMBER(7,2),
     deptno      NUMBER(2)
     );
 
 DESC emp_hw;
 
 
 -- test 2
 ALTER TABLE emp_hw ADD bigo VARCHAR2(20);
 
 DESC emp_hw;
 
 
 -- test 3
 ALTER TABLE emp_hw MODIFY bigo VARCHAR2(30);
 
 DESC emp_hw;
 
 
 -- test 4
 ALTER TABLE emp_hw RENAME COLUMN bigo TO remark;
 
 DESC emp_hw;
 
 
 -- test 5
 INSERT INTO emp_hw (empno, ename, job, mgr, hiredate, sal, comm, deptno) SELECT * FROM emp;
 
 SELECT * FROM emp_hw;
 
 
 -- test 6
 DROP TABLE emp_hw;