
 /*
    Join
    
    FROM 절을 통해 객체 테이블 설정시 두개의 테이블을 합친다. 
    
    ON 선언을 통해 행(ROWS)을 매칭한다.
    
 */
 
 
 /*
    214p ~ 240p
    조인 연습
    
 */
 
 
 
 /*
  216p
  조인을 사용하지 않고 두개 테이블을 선택한경우, 
  emp 테이블의 14개 데이터에 대해  dept 테이블 4개 데이터가 곱해져 
  모든 경우의 수를 조회하려고 함. -> 56 rows
  */
 select * from emp, dept order by empno;
 
 select * from emp, dept;
 
 /*  
  218p
  조인을 사용하지 않고 두개 테이블 선택하고
  deptno가 동일한 값만 조회하여  emp 테이블의 14개만큼만 출력됨 
 */  
 select * from emp, dept where emp.DEPTNO = dept.DEPTNO order by empno;
 
 /*
  219p
  테이블도 별칭을 지정할 수 있다.
  as 는 사용안함
  */
 select * from emp E, dept D where E.DEPTNO = D.DEPTNO order by empno;
 
 
 /*
  조인 종류 : 등가조인, 비등가조인, 자체조인, 외부조인,  
  
  SELECT - FROM - (WHERE)
  WHERE 절에서 JOIN하는 것을 알 수 있다.  (헷갈린다)
  
  밑에 SQL-99 문법이 나랑 잘맞는거같음
  
 */
 
 /*
  221p
  등가조인 
  필드를 직접 선택하는 경우
  여러 테이블의 필드 이름이 같으면
  열의 정의가 애매하여 오류 */ 
 select empno, ename, deptno, dname, loc from emp E, dept D where E.DEPTNO = D.DEPTNO;
 
 /*
  222p
  등가조인 
  필드를 직접 선택하는 경우
  여러 테이블의 필드 이름이 같으면
  테이블의 별칭을 지정하여 해결
 */
 select E.empno, E.ename, D.deptno, D.dname, D.loc from emp E, dept D where E.DEPTNO = D.DEPTNO order by D.DEPTNO, E.EMPNO;
 
 
 /*
  224p
  비등가조인
  위의 emp + dept 테이블 등가조인의 경우,
  각 테이블의 deptno 라는 필드의 값이 일치하여  같은 테이블로 불렀을때 매칭이 되는반면
  
  아래는 emp + salgrade 테이블을 조인하는 케이스로
  각 테이블에서 서로 일치하는 값이 없을때 합치는 방법을 테스트한다.
 */
 
 select * from emp, salgrade order by empno;
 
 select * from emp E, salgrade s;
 
 select * from EMP E, SALGRADE S where (E.SAL between S.LOSAL and S.HISAL);
 
 select * from emp where sal between 700 and 1200;
 
 select * from salgrade;
 
 
 /*
  227p
  자체조인
  emp 테이블 + emp 테이블을 합치는 케이스
  emp 테이블의 매니저번호(mgr)는 다른 사원의 사원번호(empno)를 바라보고 있다.
  각 사원의 오른쪽에  자신의 매니저 사원 정보를 표시하는 테스트 
 */
 select E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO as MGR_EMPNO, E2.ENAME as MGR_ENAME from emp E1, emp E2 where E1.MGR = E2.EMPNO; 
 
 /*
  229p
  **** 헷갈림 ****
  외부조인 ( 왼쪽, 오른쪽 )    
 */
 -- 왼쪽으로 더한다. :  E1 사원목록의 MGR을 따라서 E2의 EMPNO이 일치하는 데이터를 더해줌.  매니저가 없는 (MGR null) 대표까지 출력됨 ( 더해진 데이터 없음 )
 select E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO as MGR_EMPNO, E2.ENAME as MGR_ENAME from emp E1, emp E2 where E1.MGR = E2.EMPNO(+) order by E1.EMPNO;
 
 -- 오른쪽으로 더한다. :  E2 사원목록의 EMPNO를 따라서 E1의 MGR이 일치하는 데이터를 더해줌.  
 -- E2의 EMPNO이  누구의 MGR하고도 일치하지 않는경우  데이터를 더해주지 않으면 되는데,  아래 쿼리는  E2의 EMPNO은 기본으로 출력하고  E1.MGR이 일치하는 경우 E1의 데이터를 더해주고있음
 -- 그래서  자신의 EMPNO가 누구의 매니저도 아닌경우 (최하위 직급) 까지 출력됨     
 select E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO as MGR_EMPNO, E2.ENAME as MGR_ENAME from emp E1, emp E2 where E1.MGR(+) = E2.EMPNO order by E1.EMPNO;
 
 
 
 /*
  232p
  SQL-99 표준 문법으로 배우는 조인
  
  FROM 절에서 조인 조건식이 쓰임
  
  INNER JOIN이 가장 많이 쓰이고  JOIN만 작성해도  INNER JOIN임
  
  JOIN ~ ON이 가장 범용성 있음
  
  */
 
 /*
  232p
  NATURAL JOIN ( 등가조인 형태라고 함 )
  위에서 등가조인 했을때  deptno가 겹쳐서  정의가 애매하다고 오류 났었는데
  여기선 별도 정의 없이 바로 합쳐짐. 
  */
 SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, deptno, D.DNAME, D.LOC FROM emp E NATURAL JOIN dept D order by deptno, E.EMPNO; 
 
 -- 결과값 동일함
 SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno, dname, loc FROM emp NATURAL JOIN dept order by deptno, empno; 
 
 -- 그냥 deptno가 작성 안되어있어도   테이블 두개 특성상 겹치는 값이면 적용 되는듯
 SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, D.DNAME, D.LOC FROM emp E NATURAL JOIN dept D order by E.EMPNO; 
 
 
 
 /* 
  233p
  JOIN ~ UNING ( 등가 조인 형태라고 함 )
   */
 SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, deptno, D.DNAME, D.LOC FROM emp E JOIN dept D USING (deptno) WHERE sal >= 3000 ORDER BY deptno, E.EMPNO; 
 
 /*
  234p
  JOIN ~ ON ( 등가 조인 형태 ) ***********
 */
 SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO, D.DNAME, D.LOC FROM emp E JOIN dept D ON(E.DEPTNO = D.DEPTNO) WHERE sal <= 3000 ORDER BY E.DEPTNO, EMPNO; 
 
 /*
  INNER JOIN  책에 안나옴 ***** 확인하기 ( 제일 중요해보임 )
  확인결과 : JOIN 만 쳐도 INNER JOIN임   
  table1 JOIN table2 ON (필드=필드)
 */
 SELECT * FROM emp E INNER JOIN dept D ON (E.DEPTNO = D.DEPTNO) ORDER BY E.EMPNO; 
 
 
 /*
  234p ~ 238p
  OUTER JOIN ( 외부 조인 )
  
  LEFT, RIGHT로 데이터를 더할 수 있다.
  
  FULL OUTER는  LEFT, RIGHT로 나온 결과를 모두 합쳐서 보여준다.  ( 일반 외부 조인으로는  두번 외부조인 한다음 UNION으로 합쳐야 같은 결과가 나온다. )
  */
  
 -- LEFT OUTER
 SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO as mgr_no, E2.ENAME as mgr_name FROM emp E1 LEFT OUTER JOIN emp E2 ON (E1.MGR = E2.EMPNO) ORDER BY E1.EMPNO; 
 
 -- RIGHT OUTER
 SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO as mgr_empno, E2.ENAME as mgr_name FROM emp E1 RIGHT OUTER JOIN emp E2 ON (E1.MGR = E2.EMPNO) ORDER BY E1.EMPNO, mgr_empno; 
 
 -- FULL OUTER (LEFT + RIGHT)
 SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO as mgr_empno, E2.ENAME as mgr_name FROM emp E1 FULL OUTER JOIN emp E2 ON (E1.MGR = E2.EMPNO) ORDER BY E1.EMPNO; 
 
 