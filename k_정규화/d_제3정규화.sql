### 제3정규화(3NF: Third Normal Form) ###
# : 정규화의 세 번째 단계
# - 2NF(제2정규형)를 만족하는 테이블에서, 모든 비기본 속성이 기본키에만! 함수적으로 종속 
#		> 이행적 종속을 제거 

# cf) 이행적 종속성
# : 어떤 속성 A가 다른 속성 B에 종속되고
#		, B가 또 다른 속성 C에 종속된 경우
# >>> A가 C에 이행적으로 종속됨 (A > B > C: A > C)

# 제3정규형의 핵심 조건
# : 이행적 종속성을 제거하는 것!

/*	
	학번(1) / 이름(정은혜) / 학과ID(101) / 학과명(코리아) / 학과위치(부산)
    
    기본키(PK): 학번
    비기본 속성: 이름, 학과ID, 학과명, 학과 위치 
    
    함수 종속 관계
    - 학번 > 학과 ID (학생은 특정 학과에 소속)
    - 학과ID > 학과명, 학과 위치 (학과 ID로 학과 정보 확인)
    
    이행적 종속
    - 학번 > 학과ID > 학과명, 학과 위치
*/
DROP DATABASE IF exists `nomal`;
CREATE DATABASE IF NOT EXISTS `nomal`;

USE `nomal`;

CREATE TABLE `department` (
	department_id int primary key,
    department_name varchar(10),
    location varchar(100)
);

CREATE TABLE `student` (
	student_id int primary key,
    name varchar(50),
    department_id int, -- 학과 ID만 저장 (학과 정보 생략)
    foreign key (department_id) references department(department_id)
);

-- 정보입력
INSERT INTO department
VALUES
	(101, '컴공', '서울'),
	(102, '통계', '부산');


INSERT INTO student 
VALUES
	(1, '최광섭', 101),
	(2, '손태경', 101),
	(3, '박현우', 102);
    
# 학생 번호 > 강의 ID
# 강의 ID > 강의 위치 (이행적 종속성 분리 - 구조화)
# : 학생의 정보와 강의 위치를 한 번에 파악 >> 조인(Join)
SELECT * FROM department;
SELECT * FROM student;

SELECT
FROM
	student S
    join department D
    on S.department_id = D.department_id;