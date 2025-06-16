# ojdbcStudy25
오라클 SQL - Eclipse JAVA 연동 학습용 저장소

- jdbc 연결 및 셋팅 순서 - 
0. 자바 프로젝트 생성 -> 모듈체크 해제(필수) -> ojdbc6.jar 
  -> Data Source Explorer에서 system 계정 우클릭 -> connect
  -> sql 파일 생성 -> system 계정 연결
   
1. 데이터베이스를 선정 : 오라클
2. 이클립스에서 system 계정으로 들어간다.
  - db생성, 사용자 계정 생성, 권한부여, 기타 설정
    : create tablespace db명 datafile'c:\폴더명\파일명.dbf' size 20m;
    : create user id identified by pw ;
    : grant resource, connect to id ; --일반계정
    : grant dba, connect to id ; -- 조장계정
    : alter user id default tablespace db명 ; --db연결(xe)
    : alter user id temporary tablespace temp ; -- 임시테이블
3. Data Source Explorer 에서 일반 계정 연결 시도
  - Database Connections 우클릭 -> new -> oracle 클릭 -> 이름작성
  -> 디테일 연결 (sid : xe, orcl / host : ip주소확인 / username : id / pw )
  -> ping 테스트
  -> Data Source Explorer에서 다른 연결을 모두 해제(disconnect)
  -> 새로생성한 계정으로 connect -> sql 파일 위에 있는 프로파일에 계정연결
4. 테이블 생성한다.    --실행은 블럭설정 alt + x 
  - create table 테이블명(
	num number(5) primary key,  --기본키 생성
	name varchar2(16) not null,    --nn 설정
	dept varchar2(16),
	score number(7,2));

  - drop table 테이블명;    --테이블 잘못 생성시 삭제

  - create sequence emp_seq increment by 1 start with 1 nocache nocycle;  --자동번호 생성
  - drop sequence emp_seq ; -- 자동번호 생성객체 삭제

   insert into emp(num, name, dept, score) values(emp_seq.nextval, '이름1', '부서1', 75.3);  -- 더미데이터 입력
   insert into emp(num, name, dept, score) values(emp_seq.nextval, '이름2', '부서2', 75.3);

   select * from 테이블명;   -- 모든 입력 출력

5. main()메서드 생성 -> 메뉴구현 용
  - 드라이버, url, id, pw 생성자로 입력 
  - 6. dto 객체 생성으로 감

  - 메뉴 구현
  - 입력 객체 , 출력 객체 활용

6. dto 객체 생성 -> 데이터베이스 테이블 객체용 (게터,세터)
  - 데이터베이스에 있는 필드를 자바의 필드로 private 생성하고 게터 세터 메서드 생성.
  - jdbc는 관례로 객체를 사용해야 한다. (직접 db를 변경하는 것은 보안상 좋지 않음)
  - 게터(변조용), 세터(검증용)

7. dao 객체 생성 -> sql용 객체
  - sql 쿼리를 사용하여 db에게 정보를 가져오는 역할, 보내는 역할, 삭제하는 역할, 수정하는 역할을 담당





