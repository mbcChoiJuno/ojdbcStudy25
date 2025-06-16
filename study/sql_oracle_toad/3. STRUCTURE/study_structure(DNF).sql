 
 /*
     Structure
     
     객체 :
     데이터 보관 및 관리를 위한  여러 기능, 공간을 객체를 통해 제공함
     
     테이블, 테이블스페이스(DB)
     데이터 사전, 인덱스, 뷰, 시퀀스, 동의어 등 
 */
 
 /*
    326p ~ 358p
    객체 연습
    
 */
 
 /*
    327p
    데이터 사전
     
 */
 
 -- 328p  DICT  SCOTT 계정 : 데이터 사전 살펴보기
 SELECT * FROM DICT;
 
 -- 328p  DICTIONARY  SCOTT 계정 : 데이터 사전 살펴보기
 SELECT * FROM DICTIONARY;
 
 -- 328p  USER_  접두를 가진 데이터 사전   SCOTT 계정이 가진 객체 정보 살펴보기     FROM USER_TABLES
 SELECT TABLE_NAME FROM USER_TABLES;
 
 SELECT * FROM USER_TABLES; -- 동일함
 
 SELECT * FROM tabs; -- 동일함         FROM TABS;
 
 -- 329p  ALL_  접두를 가진 데이터 사전   SCOTT 계정이 사용할 수 있는 객체 살펴보기   FROM ALL_TABLES
 SELECT owner, table_name FROM ALL_TABLES;
 
 SELECT * FROM ALL_TABLES; 
 
 --331p  DBA_  접두를 가진 데이터 사전   SCOTT 계정으로 DBA_ 접근시 에러
 SELECT * FROM DBA_TABLES;
 
 
 /* 
     시스템 계정으로 테스트 
 */
 SELECT * FROM DBA_TABLES; -- DBA 전용 객체 조회 
 
 SELECT * FROM DBA_USERS; -- 사용자 정보 조회
 
 SELECT * FROM DBA_USERS WHERE USERNAME = 'SCOTT'; -- 사용자 정보 조회
 
 /* 
    시스템 계정으로 테스트 
 */
 
 
 
 /*
    334p
    인덱스 ( 더빠른 검색 )
    
 */
 
 -- 335p  SCOTT 계정이 소유한 INDEX 객체 확인
 SELECT * FROM USER_INDEXES;
 
 -- 335p  SCOTT 계정이 소유한 INDEX 컬럼 정보 알아보기
 SELECT * FROM USER_IND_COLUMNS;
 
 
 /*
    인덱스 생성
 */
 -- 336p  EMP 테이블의 SAL 필드를 참조하여 인덱스 생성하기
 -- CREATE INDEX - ON emp(sal) 
 CREATE INDEX IDX_EMP_SAL ON emp(sal);
 
 SELECT * FROM USER_IND_COLUMNS;
 
 
 /*
    인덱스 삭제
 */
 -- 337p  인덱스 삭제하기
 DROP INDEX IDX_EMP_SAL;
 
 SELECT * FROM USER_IND_COLUMNS;
 
 
 
 /*
    338p
    뷰   (테이블처럼 사용)
    
    약간 지역변수 처럼  휘발성 테이블로 느껴짐.  
    테이블 객체로 넘기는게 아니여서  감추고싶은 필드를  노출하지않음
 */
 
 -- 340p 뷰 생성
 -- SCOTT계정은 CREATE VIEW 권한이 없어 SYSTEM 계정으로 해당 권한 부여하였음
 
 
 -- ************ 358p 까지 추가 학습 필요함 ***************
 
 