 
 /*
    Admin
    
    SYSTEM 계정으로
    다른 DB 사용자의 권한을 주고 관리하는 것을 연습한다.
    
    > Oracle에 SCOTT 계정이 있는걸 알아서 해커가 노리기 쉬움 잘 막아놔야함
 */
 
 /*
    395p ~ 416p
    ADMIN 학습
    
    [기본 형식]
    권한 부여 : GRANT [권한명,,] TO [사용자명,,]  /
              GRANT [객체 사용 권한,,] ON [스키마.객체이름] TO [사용자명,, , 롤, 전체공개]
              
    권한 삭제 : REVOKE [권한명,,] FROM [사용자명,,]
              REVOKE [객체 사용 권한,,] ON [스키마.객체이름] TO [사용자명,, , 롤]
    
    
    [주요 ROLE(권한모음)]
    RESOURCE <- 테이블 관련 권한에 제한이 없음 ( 엄밀한 관리에서는 사용 지양 )
    
    
 */
 
 
 
 /*
    사용자 / 권한 정보조회
 */
 
 -- 399p 
 SELECT * FROM ALL_USERS; -- 전체 유저 조회
 
 SELECT * FROM DBA_USERS; -- 관리자 유저 조회 
 
 SELECT * FROM DBA_OBJECTS; -- 관리자 오브젝트 조회 
 
 -- 415p  나의 권한 조회
 SELECT * FROM USER_SYS_PRIVS; -- 나의 권한 조회 
 
 SELECT * FROM USER_ROLE_PRIVS; -- 나의 롤(권한집합) 조회
 
 
 
 /*
    397p ~ 401p
    사용자 관리 
 */
 
 -- 397p SCOTT 계정으로 사용자계정 생성 해보기  -> 권한 불충분 오류
 CREATE USER study IDENTIFIED BY ORACLE;
 
 -- 398p system 사용자로 생성하였음
 CREATE USER study IDENTIFIED BY ORACLE;
 
 -- 399p system 사용자로 study 사용자에게 접속 관련 권한 부여
 -- SESSION은 접속 외에도 여러가지 권한이 합쳐있음
 GRANT CREATE SESSION TO study;
 
 -- 400p system 사용자로 사용자 정보(패스워드) 변경
 ALTER USER study IDENTIFIED BY qwer1234;
 
 -- 400p 사용자 삭제하기
 DROP USER study;
 
 -- 401p 사용자와 객체 모두 삭제하기
 DROP USER study CASCADE;
 
 
 /*
    402p ~ 411p
    권한 관리
    
    USER, SESSION
    ROLE
    PROFILE
    
    TABLE, INDEX, VIEW
    
    SEQUENCE, PROCEDURE
    
    PACKAGE 
    
    SYNONYM
    
    세부 권한은 오라큰 공식 문서 확인해야 함
 */
 
 -- 405p [SYSTEM(DBA)] 사용자 계정 생성하기
 CREATE USER study IDENTIFIED BY qwer1234;
 
 -- 405p [SYSTEM(DBA)] 권한 부여하기  ( RESOURCE는 주요 롤 중 하나 )
 GRANT RESOURCE, CREATE SESSION, CREATE TABLE TO study;
 
 -- 409p [SCOTT(USER)] temp 테이블을 만들고 , 
 --               study 사용자에게 temp 테이블 권한 부여
 CREATE TABLE temp(
    COL1 VARCHAR(20),
    COL2 VARCHAR(20)
    );
    
 GRANT SELECT, INSERT ON scott.temp TO study;
 
 
 -- 410p [study(USER)] 스키마.객체로  SCOTT.TEMP 테이블 객체 수정 및 조회 -> COMMIT
 INSERT INTO scott.temp VALUES ('TEXT', 'STRING');

 SELECT * FROM scott.temp;
 
 COMMIT;
 
 -- [SCOTT(USER)] 객체 변경사항 확인
 SELECT * FROM scott.temp;
 
 
 -- 411p [SCOTT(USER)] study 계정에 temp 테이블 사용 권한 취소하기
 REVOKE SELECT, INSERT ON scott.temp FROM study; 
 
 
 -- 411p [study(USER)] 스키마.객체로  SCOTT.TEMP 테이블 객체 조회 -> 실패
 SELECT * FROM scott.temp;
 
 
 
 /*
    412p ~ 415p
    롤 관리
 */
 
 -- 414p [SYSTEM(DBA)] role_study 생성 및 권한 부여하기
 CREATE ROLE role_study;
 
 GRANT CONNECT, RESOURCE, CREATE VIEW, CREATE SYNONYM TO role_study; 
 
 -- 414p [SYSTEM(DBA)] study 사용자에게  롤 부여하기
 GRANT role_study TO study;
 
 
 
 
 
 /* 잊기전에 한번더 TEST 416p */