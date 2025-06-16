
 /*
    Method
    
    내장 함수
    
    LENGTH, COUNT 등 SQL 쿼리에서 기본적인 연산을 해주는 함수
    
 */
 
 
 /*
    127p ~ 175p
    함수 연습
    
 */
 
 
 -- **************** 학습 필요함 ********************
 
 /*
  130p ~ 131p
  Uppercase Lowercase Initcap
  내부 Value 대소문자 변경해서 조회
 */
 select ename, upper(ename), lower(ename), initcap(ename) from emp;
 
 -- 응용 1  ename 필드에서  scott Scott SCOTT 상관없이 비교연산
 select * from emp where upper(ename) = upper('scott');
 
 -- 응용 2  ename 필드에서  o, O가 포함된 문자열 찾기
 select * from emp where upper(ename) like upper('%o%');
 
 
 /* 
  132p ~ 133p
  Length
  eneme 필드 Value의 문자열 길이로 조회 */
 select ename, length(ename) from emp;
 
 -- 응용 1
 select ename, length(ename) from emp where length(ename) >= 5;
 
 -- 응용 2 ( 예제에는 lengthb 한글 4bytes 라고 하는데,  인코딩 형식때문에 한글자당 3bytes, 두글자 6으로 조회됨 )
 select length('한글'), lengthb('한글') from dual;
 
 
 /* 
  134p
  substr(필드, 시작위치, 추출할 길이)  index 1부터 시작 !!!
 */
 select job, substr(job, 1, 2), substr(job, 3, 2), substr(job, 5) from emp;
 
 /* 
  136p
  substr 시작위치가 음수인경우 꺼꾸로 카운팅됨
  CLERK -> -5-4-3-2-1
  -6으로 넘어가는순간  _C가 아니라 null이됨
   */
 select job, substr(job, -length(job)), substr(job, -length(job), 2), substr(job, -3) from emp;
 
 /*
  137p ~ 138p
  instr( varchar2 , 'varchar2', 찾기 시작할 INDEX (1부터),  ????? )
 */
 select instr('HELLO, ORACLE!','LO') as INSTR_1, instr('HELLO, ORACLE!','L', 5) as INSTR_2, instr('HELLO, ORACLE!','L', 2, 2) as INSTR_3 from dual;
 
 -- 응용 1 ( like 연산처럼 사용 가능하지만 잘 안씀. 그냥 응용할 수 있다는 것 )
 select * from emp where instr(ename, 'S') > 0;
 
 -- 응용 2 ( instr로 대체한 like 연산 )
 select * from emp where ename like '%S%';
 
 /*
  139p
  replace ( value, 찾을 문자열, 변경할 문자열 )
  ** 변경할 문자열 작성 안하면 삭제 처리됨.
 */
 select '010-1234-5678' as REPLACE_BEFORE, REPLACE('010-1234-5678','-', ' ') as REPLACE_1, REPLACE('010-1234-5678','-') as REPLACE_2 from dual;
 
 /*
  140p ~ 141p
  LPAD, RPAD ( 문자열, 결과물 자릿수, 채울 문자(선택) )
  여백문자 미설정시 공백
  좌 우측 여백과  여백을 채울 문자 설정
 */
 select 'Oracle', lpad('Oracle', 10, '#') as LPAD_1, rpad('Oracle', 10, '*') as RPAD_1, lpad('Oracle', 10) as LPAD_2, rpad('Oracle', 10) as RPAD_2 from dual;
 
 -- 응용
 select rpad('971225-', 14, '*') as RPAD_JMNO, rpad('010-1234-', 13, '*') as RPAD_PHONE from dual;
 
 /*
  142p
  Concat 문자열 합치기
 */
 select concat(empno, ename), concat(empno, concat(' : ', ename)) from emp where ename = 'SCOTT';
 
 /*
  143p
  Trim 공백 제거 ( 삭제할 문자가 없음때 )
 */
 select '[' || trim(' _ _Oracle_ _ ') || ']' as TRIM, '[' || trim(LEADING FROM ' _ _Oracle_ _ ') || ']' as TRIM_LEADING, '[' || trim(TRAILING FROM ' _ _Oracle_ _ ') || ']' as TRIM_TRAILING, '[' || trim(BOTH FROM ' _ _Oracle_ _ ') || ']' as TRIM_BOTH from dual;
 
 /*
  143p
  Trim 공백 제거 (삭제할 문자가 있을 때)
 */
 select '[' || trim('_' from '_ _Oracle_ _') || ']' as TRIM, '[' || trim(LEADING '_' FROM '_ _Oracle_ _') || ']' as TRIM_LEADING, '[' || trim(TRAILING '_' FROM '_ _Oracle_ _') || ']' as TRIM_TRAILING, '[' || trim(BOTH '_' FROM '_ _Oracle_ _') || ']' as TRIM_BOTH from dual;
 
 /*
  144p
  Trim 공백 제거 (L R)
 */
 select '[' || trim('_' from ' _Oracle_ ') || ']' as TRIM, '[' || trim(LEADING '_' FROM '_ _Oracle_ _') || ']' as TRIM_LEADING, '[' || trim(TRAILING '_' FROM '_ _Oracle_ _') || ']' as TRIM_TRAILING, '[' || trim(BOTH '_' FROM '_ _Oracle_ _') || ']' as TRIM_BOTH from dual;
 
 /*
  146p ~ 149p
  숫자 연산
  ROUND 반올림
  TRUNC 버림
  CEIL 지정수보다 다음으로 큰수
  FLOOR 지정수보다 다음으로 낮은수
  MOD 나머지 구하기
 */
 select round(1234.5678) as ROUND, round(1234.5678, 0) as ROUND_0, round(1234.5678, 1) as ROUND_1, round(1234.5678, 2) as ROUND_2, round(1234.5678, -1) as ROUND_MINUS1, round(1234.5678, -2) as ROUND_MINUS2 from dual;
 
 select trunc(1234.5678) as TRUNC, trunc(1234.5678, 0) as TRUNC_0, trunc(1234.5678, 1) as TRUNC_1, trunc(1234.5678, 2) as TRUNC_2, trunc(1234.5678, -1) as TRUNC_MINUS1, trunc(1234.5678, -2) as TRUNC_MINUS2 from dual;
 