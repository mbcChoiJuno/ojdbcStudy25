 
 /*
    [Query]
     DML (Data Manipulation Language)
     
     UPDATE
 */
 
 /*
    277p ~ 282p
    UPDATE 학습 
  
 */
 
 
 /* 
  UPDATE 로 수정하기 
 */
 -- 277p DEPT 복사해서 DEPT2 테이블 만들기
 CREATE TABLE dept_temp2 AS SELECT * FROM dept; 
 
 -- dept_temp2 확인
 SELECT * FROM dept_temp2;
 
 -- 278p UPDATE에 WHERE 조건문 없이  수정쳤을때  문제점 발생  모든 데이터가 SEOUL로 바뀜
 UPDATE dept_temp2 SET loc = 'SEOUL';
 
 -- 278p 롤백
 rollback;
 
 -- 279p 일부 데이터만 수정하기
 UPDATE dept_temp2 SET dname = 'DATABASE', loc = 'SEOUL' WHERE deptno = 40; 
 
 -- 280p 서브쿼리로 일부 데이터 수정하기  ** 헷갈림
 UPDATE dept_temp2 SET (dname, loc) = (SELECT dname, loc FROM dept WHERE deptno = 40) WHERE deptno = 40;
 
 -- 280p 서브쿼리로 일부 데이터 수정하기2  열 하나하나 수정  ** 헷갈림
 UPDATE dept_temp2 SET dname = (SELECT dname FROM dept WHERE deptno = 40), loc = (SELECT loc FROM dept WHERE deptno = 40) WHERE deptno = 40;
 
 -- 281p 서브쿼리 WHERE 절에서 사용하기
 UPDATE dept_temp2 SET loc = 'SEOUL' WHERE deptno = (SELECT deptno FROM dept_temp2 WHERE dname = 'OPERATIONS'); 
 