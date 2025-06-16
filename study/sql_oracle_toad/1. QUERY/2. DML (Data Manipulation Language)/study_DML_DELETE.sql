 
 /*
    [Query]
     DML (Data Manipulation Language)
     
     DELETE
 */
 
 /*
    283p ~ 286p
    DELETE 학습 
  
 */
 
 
 -- 283p emp 테이블 복사하기
 CREATE TABLE emp_temp2 AS SELECT * FROM emp; 
 
 -- 283p 생성한 테이블 확인
 SELECT * FROM emp_temp2;
 
 -- 284p WHERE 절로 데이터 일부삭제
 DELETE FROM emp_temp2 WHERE job = 'MANAGER'; 
 
 -- 285p WHERE + 서브쿼리로 데이터 일부삭제
 /* 해석: 
  emp_temp2에서  서브쿼리에 해당하는 empno가 있는 열을 삭제한다.
  서브쿼리: emp_temp2 테이블과 salgrade 테이블 조인
  emp_temp2 테이블의 sal 값이 salgrade 내 low, high 범위에 따른 sal grade를 얻고
  grade가 3인 deptno 30 부서의 사원번호 목록으로 도출 
 */
 DELETE FROM emp_temp2 WHERE empno IN (SELECT E.EMPNO FROM emp_temp2 E, salgrade S WHERE E.SAL BETWEEN S.LOSAL and S.HISAL and S.GRADE = 3 and deptno = 30);
 
 
 -- 286p 테이블의 전체 데이터 삭제
 DELETE FROM emp_temp2;
 