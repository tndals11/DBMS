# 1) 뷰의 특징
# > 실제 테이터를 저장하지 않음
# > SELECT 문의 결과를 저장한 것처럼 작동
# > 일반 테이블처럼 SELECT로 조회 가능
# > 뷰를 통해 데이터를 보호하거나 단순화될 수 있음

# 2) 뷰 VS 테이블
# View(뷰)
# - 데이터 저장 x
# - 필요한 데이터만 보는 용도
# - 기본 테이블 변경 시 자동 반영
# >> CREATE VIEW 뷰명 AS SELECT문(TABLE)

# Table(테이블)
# - 데이터를 직접 저장 O
# - 데이터 전체 저장/관리 용도
# - DML(Insert, Update, Delete,)로 직접 조작
# >> CREATE TABLE 테이블명 (...);

# 3) 뷰의 종류
# - 단순 뷰: 하나의 테이블과 연관된 뷰
# - 복합 뷰: 2개 이상의 테이블과 연관된 뷰 (여러 테이블의 조인을 포함)

USE market_db;

SELECT * FROM member;
SELECT * FROM buy;

SELECT mem_id, mem_name, addr FROM member;

/*
	1) 뷰 생성 방법
    CREATE VIEW 뷰_이름 
    AS 
		SELECT문; 
	
    2) 뷰 접근 방법
    : SELECT문 사용 (전체 접근 | 테이블 조회처럼 조건식 사용 가능)
    SELECT 열이름나열 FROM 뷰_이름
    [WHERE 조건];
    
    cf) 뷰 이름은 테이블과의 구분을 위해 'v_'로 시작을 권장
*/
CREATE VIEW v_member
AS	
	SELECT mem_id, mem_name, addr FROM member;