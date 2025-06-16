
 /*
     DCL (Data Control Language)
     
     데이터 제어어
     
     데이터베이스에 접근하는 객체를 직접 또는 권한을통해 제어한다.
     
     COMMIT / ROLLBACK
     
     GRANT / REVOKE
 */
 
 
 
 /*
     COMMIT, ROLLBACK
 
     A사용자가 제어문 (DML) 실행시 트랜잭션이 자동으로 걸림
     INSERT / UPDATE / DELETE 
     
     이 때 다른 DB 사용자가 제어할 수 없고,  SELECT를 통해  제어가 시작되기 이전상태를 조회만 할 수 있음  
         테이블 전체를 대상으로 제어한다면 테이블 전체가 LOCK 상태가 되고
         특정 데이터만 대상으로 제어한다면 해당하는 데이터만 LOCK 상태가 됨
     
     A 사용자가 의도한대로 동작을 성공했다면  COMMIT으로  실제 테이블객체에  변경사항을 반영해주면  트랜잭션이 풀리고 다른 사용자도 제어할 수 있음
     
     A 사용자가 의도한대로 동작하지 않으면   ROLLBACK을 통해  제어문 사용 자체를 취소시켜서  제어가 시작되기 이전상태로 트랜잭션이 풀리고 다른 사용자도 제어할 수 있음
 */
 
 COMMIT;
 
 ROLLBACK;
 
 
 
 /*
     GRANT, REVOKE
     
     DBA(Database Admin)가 다른 DB 사용자의 권한을 부여하고 삭제할 수 있음 
     
     이로써 중요한 데이터가 삭제될 확률을 줄이고
     
     외부로부터 최소한 보안이 강해짐
 */
 
 -- 340p 에서 SCOTT이 VIEW를 사용하기위해  DBA인 SYSTEM 계정으로 해당 제어어을  사용하였음
 GRANT CREATE VIEW TO SCOTT;
 
 -- 예시는 아직 못봤지만 예상해서 작성만 하고 실행은 하지않음.  SCOTT 에게서 CREATE VIEW 권한을 뺐어오는 쿼리로 생각됨
 REVOKE CREATE VIEW FROM SCOTT;
 