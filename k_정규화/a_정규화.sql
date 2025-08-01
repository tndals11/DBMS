/*
	1. 정규화(Normalization) 개요
    : 중복된 데이터를 제거하고,
		, 데이터의 무결성을 유지하기 위해 테이블을 구조적으로 "나누는" 과정
	
    >> 정규화를 하지 않으면, 데이터 중복과 이상현상(삽입, 수정, 삭제 이상) 발생 가능
    
    2. 정규화 목적
		1) 중복 최소화: 데이터의 재사용성과 저장 공간 효율 증가
        2) 무결성 유지: 데이터의 일관성과 정확성 유지
        3) 이상 현상 방지: 삽입, 수정, 삭제 시 발생하는 오류 제거 
        4) 유지보수 용이: 테이블 구조가 명확해짐 - 관리하기 쉬움 
        
	3. 정규화 종류
    제 1 정규형 (1NF - Normal Form)
    제 2 정규형 (2NF)
    제 3 정규형 (3NF)
    BCNF(Boyce-Codd 보이스코드 정규형)

	cf) 정규형(Normal Form)
		: 데이터베이스 정규화 과정에서 달성하고자 하는 일정한 규칙이나 기준
    
    4. 정규화의 필요성
		id / name  / course_id	/ course_name / course_instuctor	
		1	  김태양		101			슬립테크			김준일
        1	  김태양		102			IoT				이승아
        2	  홍기수 		102			IoT				이승아
		
        >> 위 테이블의 문제점
			1) 중복 데이터: 학생, 강의, 강사 정보가 중복 저장됨
            2) 이상 현상 발생
				- 삽입 이상: 수강생 없이 강의만 등록 불가
                - 수정 이상: 같은 강사명이나 학생명을 여러 행에 걸쳐 모두 수정
                - 삭제 이상: 학생 삭제 시, 강의 정보까지 삭제될 위험
				
			cf) 이상 현상 
				: 비정규화 된 테이블에서 발생하는 데이터 무결성 문제
				>> 삽입 기상, 갱신 이상, 삭제 이상
                
	5. 정규화의 단계
		1) 제 1 정규형
			: 모든 컬럼이 원자값을 가져야 함
			- 반복되는 그룹 제거 (EX: 하나의 셀에 여러 값 저장 금지)
            
        2) 제 2 정규형
			: 1NF 만족 + 기본키에 대한 완전 함수 종속
            - 부분 종속 제거 (복합키의 일부 컬럼에만 의존하는 속성 분리)
            
			
        3) 제 3 정규형
			: 2NF 만족 + 이행적 종속 제거
            - 비주요 속성이 다른 비주요 속성에 의존하지 않도록 분리 
        
        4) BCNF
			: 후보키가 아닌 결정자가 존재하지 않아야함
            - 3NF보다 조금 더 엄격한 조건 (모든 결정자가 후보키여야 함)
*/

CREATE DATABASE `nomal`;
USE `nomal`;

DROP TABLE IF EXISTS `student_course`;

CREATE TABLE IF NOT EXISTS `student_course` (
	student_id bigint NOT NULL,
    student_name VARCHAR(50) NOT NULL,
    course_id	bigint NOT NULL,
    course_name VARCHAR(50) NOT NULL,
    course_instructor VARCHAR(50) NOT NULL,
	primary key (student_id, course_id) #student_id + course_id는 중복 허용x / 비워질 수 없음
);

INSERT INTO student_course
VALUES
	(1, '이상은', 101 ,'생성형AI','김준일'),
	(1, '이상은', 102 ,'쳇GPT','이승아'),
	(2, '박진영', 102 ,'쳇GPT','이승아'),
	(3, '오신혁', 103 ,'빅데이터','안근수');

SELECT * FROM `student_course`;

### 이상 현상 예씨 ###
# 1) 삽입 이상
INSERT INTO `student_coures` (coures_id, coures_name, course_instructor)
VALUES
	(104, '코리아IT', '조승벙');
#Error Code: 1146. Table 'nomal.student_coures' doesn't exist


# 2) 수정 이상
# 오류 X, 각 행에서 조건을 찾아 일일이 변경해야 함 >> 메모리 부담 존재
UPDATE `student_course`
SET course_instructor = '김준이'
WHERE 
	course_id = 102;

SELECT * FROM `student_course`;


# 3) 삭제 이상
DELETE FROM `student_course`
WHERE
	student_id = 2;
    
SELECT * FROM `student_course`;

### 정규화 예시 ###
# 학생, 과목, 학생-과목 테이블
# 학생과 과목 간의 관계 (N:M - 다대다)

CREATE TABLE `students` (
	student_id int primary key,
    student_name varchar(50)
);
CREATE TABLE `courses` (
	course_id int primary key,
    course_name varchar(50),
    instrutor varchar(50)
);

CREATE TABLE `student_course_connects` (
	# 학생/과목 관계 테이블
    student_id int,
    course_id int,
    primary key (student_id, course_id), -- 복합키 설정
    foreign key (student_id) references students(student_id),
    foreign key (course_id) references courses(course_id)
);

INSERT INTO students
VALUES
	(1, '김세훈'),
	(2, '권민현'),
	(3, '안미향');

INSERT INTO courses
VALUES
	(101, '챗봇' ,'이승아'),
	(102, 'ERP' ,'김준일'),
	(103,  '코리아IT' ,'조승범');
    
INSERT INTO student_course_connects
VALUES
	(1, 101),
	(2, 102),
	(3, 103);
    
SELECT * FROM STUDENTS;
SELECT * FROM COURSES;
SELECT * FROM STUDENT_COURSE_CONNECTS;

-- 수강생 없이 새로운 과목만 등록 --
INSERT INTO courses
VALUES
	(104, 'SAAS', '안근수');
    
-- 강사 이름 갱신 (수정)
UPDATE courses
SET instrutor = '김준삼'
WHERE
	course_id = 102;
    
-- 수강 정보 삭제 시 학생과 과목에 영향을 미치지않음
delete from student_course_connects
where
	student_id = 3;
    
SELECT * FROM STUDENTS;
SELECT * FROM COURSES;
SELECT * FROM STUDENT_COURSE_CONNECTS;

### 정규화 사용 모범 사례 ###

# cf) 베스트 프렉티스(best practice)
# : 특정 문제를 해결하거나 목표를 달성함에 있어 가장 효과적이고 검증된 방법 