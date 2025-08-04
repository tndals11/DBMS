### J_뷰 >>> view_practice ###

### 뷰 연습 문제 ###
CREATE DATABASE IF NOT EXISTS `school`;
USE `school`;

-- students 테이블 생성 --
# student_id: 정수, 기본키
# first_name: 문자열(50),
# last_name: 문자열(50),
# age: 정수
# major: 문자열(50)

CREATE TABLE students (
	student_id int primary key,
    first_name varchar(50),
    last_name varchar(50),
    age int,
    major varchar(50)
);
-- courses 테이블 생성 --
# cours_id: 정수, 기본키
# course_name: 문자열(100)
# instructor: 문자열(100)
# credit_hours: 정수
CREATE TABLE courses (
	course_id int primary key,
    course_name varchar(100),
    instructor varchar(100),
    credit_hours int
);

-- student_courses 테이블 --
# student_id: 정수
# course_id: 정수
# >> 위의 두 컬럼을 복합키로 설정(기본키)
# >> 각 컬럼은 students, courses 테이블에서 참조
CREATE TABLE student_courses (
	student_id int,
    course_id int,
    primary key (student_id, course_id),
    foreign key (student_id) references students(student_id),
	foreign key (course_id) references courses(course_id)
);

INSERT INTO students VALUES
(1, '김', '승', 20, '컴퓨터네트워크'),
(2, '이', '승민', 21, '인터넷네트워크'),
(3, '박', '승민', 22, '네트워크'),
(4, '하', '승민', 23, '네트워크');

INSERT INTO courses VALUES
(100, '코딩', '이승민', 20),
(200, '스프링', '하승민', 21),
(300, '부트', '유승민', 22),
(400, '자바', '강유민', 23);

INSERT INTO student_courses  VALUES
(1,100),
(2,200),
(3,300),
(4,400);

/*
1. 뷰 이름: student_course_view

2. 뷰에는 아래 네 가지 컬럼이 포함되어야 함
	1) student_first_name: 학생의 이름 (students.first_name)
	2) student_last_name: 학생의 성 (students.last_name)
	3) course_name: 수강 과목 이름 (courses.course_name)
	4) instructor: 담당 강사 이름 (courses.instructor)

3. StudentCourse 테이블을 기준으로 Students와 Courses를 각각 INNER JOIN

4. 뷰가 정상적으로 생성되었는지 확인(조회)
*/

DROP VIEW IF EXISTS student_course_view;

CREATE VIEW student_course_view
AS
	SELECT 
		concat(S.first_name, S.last_name) as 'student_name'
        , C.course_name
        , C.instructor
	FROM
		student_courses SC
        INNER JOIN students S
			ON SC.student_id = S.student_id
		INNER JOIN courses C
			ON SC.course_id = C.course_id;
            
SELECT * FROM student_course_view;