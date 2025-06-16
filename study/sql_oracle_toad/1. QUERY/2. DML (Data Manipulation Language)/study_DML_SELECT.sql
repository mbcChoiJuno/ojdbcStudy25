 
 /*
    [Query]
     DML (Data Manipulation Language)
     
     SELECT
 */
 
 /*
    72p ~ 126p
    SELECT 학습 
  
 */
 
 
 -- [emp 테이블] 구조보기
 desc emp;       
 
 -- [emp 테이블] 내용보기
 select * from emp;  
 
 -- [dept 테이블] 구조보기
 desc dept;      
 
 -- [dept 테이블] 내용보기
 select * from dept;  
 
 -- [bonus 테이블] 구조보기
 desc bonus;     
 
 -- [bonus 테이블] 내용보기
 select * from bonus;  
 
 -- [salgrade 테이블] 구조보기
 desc salgrade;  
 
 -- [salgrade 테이블] 내용보기
 select * from salgrade;  
 
  
 
 
 
 -- 연습장
 
 -- 73p DTO 테이블 구조 
 desc emp;
 
 -- 74p DTO 테이블 구조 
 desc dept;
 
 -- 75p DTO 테이블 구조 
 desc salgrade;
 
 /* 80p emp 테이블의 모든 필드를 조회한다. */
 select * from emp;
 
 /* 81p emp 테이블의 empno, ename, deptno 필드를 조회한다. */
 select empno, ename, deptno from emp;
 
 /* 82p emp 테이블에서 중복되는 값을 하나만 포함하여 deptno 필드를 조회한다. */
 select distinct deptno from emp;
 
 /* 83p emp 테이블에서 job, deptno의 조합이 중복되는 경우 하나만 포함하여 job, deptno 필드를 조회한다. */
 select distinct job, deptno from emp;
     
 /* 83p emp 테이블에서 모든 job, deptno 필드를 조회한다.  *** all이 빠져도 작동함. 나중에 필드의 변수형 때문에 다르게 사용할 수 도 있음 (확인) */
 select all job, deptno from emp;
 
 /* 84p emp 테이블에서 ename, sal, (custom 필드), comm을 조회한다.  custom 필드는 수식연산이되고 별도의 define이 없으면 식으로 필드명이 정해짐 */
 select ename, sal, sal*12+comm, comm from emp;
 
 /* 85p emp 테이블에서 ename, sal, (custom 필드), comm을 조회한다.  위와 동일,  여기서 comm이 null인경우 같이 null로 들어가는듯  */
 select ename, sal, sal+sal+sal+sal+sal+sal+sal+sal+sal+sal+sal+sal+comm, comm from emp;
 
 /* 86p emp 테이블에서 ename, sal, (custom 필드), comm을 조회한다.  as 예약어를 통해 custom 필드의 명칭은 annsal로 조회된다. */
 select ename, sal, sal*12+comm as annsal, comm from emp;
 
 /* 88p emp 테이블을 sal 필드를 기준으로 정렬된 상태로 모든 필드를 조회한다.  별도의 옵션을 주지않으면 오름차순으로 정렬된다.*/
 select * from emp order by sal;
 
 /* 89p emp 테이블을 sal 필드를 기준으로 내림차순 정렬하여 모든 필드를 조회한다.  desc 옵션: 내림차순 */
 select * from emp order by sal desc;
 
 /* 91p emp 테이블을 2개 필드를 기준으로 정렬하여 모든 필드를 조회한다.  먼저 선언된 deptno 필드를 asc 옵션: 오름차순으로 정렬하고, 이후에 sal 필드를 desc 옵션: 내림차순 정렬한다. */
 select * from emp order by deptno asc, sal desc;
  
 
 /* 94p 
 emp 테이블의 모든 필드를 조회한다. */
 select * from emp;
 
 /* 94p 
 emp 테이블에서 deptno이 30인 rows 모든 필드를 조회한다.  */
 select * from emp where deptno = 30;
 
 /* 97p
 emp 테이블에서 deptno이 30 이면서 job이 'SALESMAN'인 rows 모든 필드를 조회한다. */
 select * from emp where deptno = 30 and job = 'SALESMAN';
 
 /* 98p
 emp 테이블에서 deptno이 30 이거나 job이 'CLERK'인 rows 모든 필드를 조회한다. */
 select * from emp where deptno = 30 or job = 'CLERK';
 
 /* 101p
 emp 테이블에서 sal 필드의 값이 조건식에 맞는 rows 모든 필드를 조회한다. */
 select * from emp where sal * 12 = 36000;
 
 /* 102p
 위와 동일하다. 특이사항 없음 */
 select * from emp where sal >= 3000;
 
 /* 102p
 emp 테이블의 ename을 비교하여 첫글자가 F 거나 다음 알파벳으로 되어있는 필드의 rows 모든 필드를 조회한다.    문자형 데이터를 비교연산시 오름차순 내림차순으로 계산한다.  */
 select * from emp where ename >= 'F';
 
 /* 103p
 emp 테이블의 ename을 첫글자부터 비교하여 F O R Z 거나 이전 알파벳으로 되어있는 필드의 rows 모든 필드를 조회한다. */
 select * from emp where ename <= 'FORZ';
 
 /* 104p
 emp 테이블의 sal 필드가 3000이 아닌 rows 모든 필드를 조회한다. */
 select * from emp where sal != 3000;
 
 /* 104p
 emp 테이블의 sal 필드가 3000이 아닌 rows 모든 필드를 조회한다. */
 select * from emp where sal <> 3000;
 
 /* 104p
 emp 테이블의 sal 필드가 3000이 아닌 rows 모든 필드를 조회한다. */
 select * from emp where sal ^= 3000;
 
 /* 105p
 emp 테이블의 sal 필드가 3000이 아닌 rows 모든 필드를 조회한다. */
 select * from emp where not sal = 3000;
 
 /* 106p
 emp 테이블의 job 필드가 'MANAGER', 'SALESMAN', 'CLERK'인 필드 rows 모든 필드를 조회한다. */
 select * from emp where job = 'MANAGER' or job = 'SALESMAN' or job = 'CLERK'; 
 
 /* 107p
 위와 동일한 결과, in 예약어 사용 */
 select * from emp where job in ('MANAGER', 'SALESMAN', 'CLERK');
 
 /* 108p
 emp 테이블의 job 필드가 'MANAGER', 'SALESMAN', 'CLERK'가 아닌 rows 모든 필드를 조회한다. */
 select * from emp where job != 'MANAGER' and job <> 'SALESMAN' and job ^= 'CLERK';
 
 /* 108p
 위와 동일한 결과, not과 in 예약어 사용 */
 select * from emp where job not in ('MANAGER', 'SALESMAN', 'CLERK');
 
 /* 109p
 emp 테이블의 sal 필드가 2000 이상이면서 3000 이하인 rows 모든 필드를 조회한다. */
 select * from emp where sal >= 2000 and sal <= 3000;
 
 /* 110p
 위와 동일한 결과, between 예약어 사용 */
 select * from emp where sal between 2000 and 3000; 
 
 /* 110p
 emp 테이블의 sal 필드가 2000 이상이면서 3000 이하인 필드를 제외한 rows 모든 필드를 조회한다. */
 select * from emp where sal not between 2000 and 3000;
 
 /* 111p
 emp 테이블의 ename 필드가 S로 시작하는 모든 rows 모든 필드를 조회한다. */
 select * from emp where ename like 'S%';
 
 /* 111p
 emp 테이블의 ename 필드가 2번째 자리 L로 시작하는 모든 rows 모든 필드를 조회한다. */
 select * from emp where ename like '_L%';
 
 /* 112p
 emp 테이블의 ename 필드 내에 AM 문자열이 포함된 모든 rows 모든 필드를 조회한다. */
 select * from emp where ename like '%AM%';
 
 /* 112p
 emp 테이블의 ename 필드 내에 AM 문자열이 포함된 rows를 제외한 rows 모든 필드를 조회한다. */
 select * from emp where ename not like '%AM%';
 
 /* 114p
 emp 테이블에서 ename, sal, (custom 필드), comm을 조회한다.  as 예약어를 통해 custom 필드의 명칭은 annsal로 조회된다. */
 select ename, sal, sal*12+comm as annsal, comm from emp;
 
 /* 115p
 emp 테이블에서 comm이 null인 모든 필드를 조회하고자 하지만 조회되지 않음. null은 산술연산자 비교시 null이됨  null 비교시 is 사용 */
 select * from emp where comm = null;
 
 /* 116p
 emp 테이블에서 comm이 null인 모든 필드를 조회한다. */
 select * from emp where comm is null;
 
 /* 116p
 emp 테이블에서 comm이 null이 아닌 모든 필드를 조회한다. */
 select * from emp where comm is not null;
 
 /* 117p
 emp 테이블에서 sal필드를 null과 산술 연산하여 null이 되어 아무것도 조회되지 않음 */
 select * from emp where sal > null and comm is null;
 
 /* 118p
 emp 테이블에서 sal필드를 null과 산술 연산하여 null이 되었지만 or 연산으로 인해 comm 필드가 null이 아닌 모든 필드를 조회한다. */
 select * from emp where sal > null or comm is null;
 
 
 /* -------- 집합 연산자 -------- */
 /* 119p
 합집합 (VARCHAR2, VARCHAR2, VARCHAR2) + (VARCHAR2, VARCHAR2)
 1번 결과: emp 테이블에서 deptno 필드가 10인 empno, ename, sal, deptno 필드를 조회한다.
 2번 결과: emp 테이블에서 deptno 필드가 20인 empno, ename, sal, deptno 필드를 조회한다. 
 연산결과: emp 테이블에서 deptno 필드가 10 이거나 20인 rows  empno, ename, sal, deptno 필드를 조회한다. */
 select empno, ename, sal, deptno from emp where deptno = 10 union select empno, ename, sal, deptno from emp where deptno = 20;
 
 /* 120p
 오류 케이스
 합집합 (VARCHAR2, VARCHAR2, VARCHAR2) + (VARCHAR2, VARCHAR2)
 union 예약어를 사용하려면 조회결과를 합치려는 테이블 끼리  조회필드 개수가 같아야 한다. */
 select empno, ename, sal, deptno from emp where deptno = 10 union select empno, ename, sal from emp where deptno = 20;
 
 /* 120p
 오류 케이스 
 합집합 (VARCHAR2, VARCHAR2, VARCHAR2) + (!!!NUMBER!!!, VARCHAR2, VARCHAR2) 시 오류
 union 예약어를 사용하려면 조회결과를 합치려는 테이블 끼리  조회필드간 자료형이 같아야 한다. */
 select empno, ename, sal, deptno from emp where deptno = 10 union select ename, empno, deptno, sal from emp where deptno = 20;
 
 /* 120p
 합집합 (VARCHAR2, VARCHAR2, VARCHAR2) + (VARCHAR2, VARCHAR2, VARCHAR2)
 기능적으로는 이해할 수 없지만, 
 조회결과를 합치려는 두 테이블의 필드가 다르고 자료형이 같아서 
 조회결과가 합쳐진다. 즉 필드의 명칭과 관계없이 자료형만 가지고 합쳐진다. 
  *** 먼저 작성된 조회 테이블의 명칭으로 조회되는듯함 */
 select empno, ename, sal, deptno from emp where deptno = 10 union select sal, job, deptno, sal from emp where deptno = 20;
 
 /* 121p
 합집합 중복 제거됨  UNION
 emp 테이블의 조회 결과가 같은 경우 별도의 예약어를 쓰지 않으면  중복된 rows 필드는 합쳐지지 않는다. 
 1번 결과: emp 테이블의 deptno가 10인 rows empno, ename, sal, deptno 필드를 조회한다.
 2번 결과: emp 테이블의 deptno가 10인 rows empno, ename, sal, deptno 필드를 조회한다.
 연산결과: emp 테이블의 deptno가 10인 rows empno, ename, sal, deptno 필드를 조회한다. */
 select empno, ename, sal, deptno from emp where deptno = 10 union select empno, ename, sal, deptno from emp where deptno = 10;
 
 /* 122p
 합집합 중복 허용  UNION ALL
 emp 테이블의 조회 결과가 같지만  all 예약어를 사용하여 중복된 rows 필드도 테이블에 합쳐진다. 
 1번 결과: emp 테이블의 deptno가 10인 rows empno, ename, sal, deptno 필드를 조회한다.
 2번 결과: emp 테이블의 deptno가 10인 rows empno, ename, sal, deptno 필드를 조회한다.
 연산결과: emp 테이블의 deptno가 10인 rows empno, ename, sal, deptno 필드를 2번씩 조회한다. */
 select empno, ename, sal, deptno from emp where deptno = 10 union all select empno, ename, sal, deptno from emp where deptno = 10;
 
 /* 122p
 차집합 연산 
 1번 결과: emp 테이블에서 empno, ename, sal, deptno 필드를 모두 조회한다.
 2번 결과: emp 테이블에서 deptno가 10인 empno, ename, sal, deptno 필드를 조회한다.
 연산결과: emp 테이블에서 deptno가 10인 rows 를 제외하고  empno, ename, sal, deptno 필드를 조회한다. */
 select empno, ename, sal, deptno from emp minus select empno, ename, sal, deptno from emp where deptno = 10;
 
 /* 123p
 교집합 연산 
 1번 결과: emp 테이블에서 empno, ename, sal, deptno 필드를 모두 조회한다.
 2번 결과: emp 테이블에서 deptno가 10인 empno, ename, sal, deptno 필드를 조회한다.
 연산결과: emp 테이블에서 deptno가 10인 rows의 empno, ename, sal, deptno 필드를 조회한다. */
 select empno, ename, sal, deptno from emp intersect select empno, ename, sal, deptno from emp where deptno = 10;
 