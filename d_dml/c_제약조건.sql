/*
	1. PK(Primary key) - 중복 x(고유값) & 비워둘 수 없음(null 허용 x)
    2. FK(Foreign key) - 다른 테이블의 PK값을 참조하는 컬럼 (테이블 간의 연결)
    
    3. Unique
    : 특정 열의 값이 중복되면 안됨
    - null 허용은 가능 (비워 둘 수 있음)
	- 한 테이블에 여러 개 지정 가능
    EX) 아이디, 이메일, 주민번호 등에 사용
*/

CREATE TABLE `users` (
	user_id bigint primary key,
    username varchar(100) unique,
    password varchar(100),
    email varchar(100) unique,
    resident_number varchar(100) unique
);

drop table `users`;

insert into `users`
values
	(1, 'qwe123', 'qwer123123', 'qwe123@example.com' , '123456');
    
-- insert into `users`
-- values
-- 	(2, 'wer123', 'wer123123', 'qwe123@example.com' , '654321');

insert into `users`
values
	(2, 'wer1234', 'wer234234', null, '654321');
-- unique는 null값 삽입 가능!

/*
	4. Check 제약 조건
	: 입력 값이 특정 조건을 만족해야만 삽입
*/

CREATE TABLE employess (
	employee_id bigint primary key,
    name varchar(100),
    age int, -- 정수의 최대값 제약 
	# check 제약 조건 사용 방법
    # check(조건 작성 - 조건식은 다양한 연산자 사용)
	check(age >= 20)
);

insert into `employess`
values
	(1, '이상은', 30),
	(2, '홍기수', 20),
	(4, '김태양', 30);
    
insert into `employess`
values
	(5, '안미향', null); -- check 제약 조건은 null 여부 확인 x
    

select * from employess;

/*
	5. NOT NULL 제약조건
	: 특정 열에 NULL 값을 허용하지 않는것
    - 비워질 수 X
*/

CREATE TABLE `contacts` (
	contact_id bigint primary key, -- PK는 자동 NOT NULL 지정
    name varchar(100) not null,
    phone varchar(100) not null
);

INSERT INTO `contacts`
VALUES
	(1, '권민현', '010-1111-2222'),
	-- (2, '권민현', NULL);
    (2, '김세훈', '010-2222-3333');
    
SELECT * FROM `contacts`;


/*
	6. default 제약조건
    : 테이블 열에 값이 입력되지 않으면 자동으로 기본값을 넣어주는 제약 조건
	- 선택적 필드에 대한 입력을 단순화 (데이터 무결성 유지)
*/

create table `carts` (
	cart_id bigint primary key,
    product_name varchar(100),
    # default 제약조건
    # 컬럼명 데이터타입 default 기본값(데이터 타입 지키기!)
    quantity int default 1
);
  
insert into `carts`
values
	(1, '노트북', 3),
	(2, '스마트폰', null),
	(3, '테블릿', 2);
    -- default 설정 컬럼을 비워둘 수는 없음!
    -- null값 입력 시 null 값이 지정 가능 (기본값 설정 x)
    
select * from `carts`;

# default 값 사용 방법
# 컬럼 자체에 값 대입 x
insert into `carts`(cart_id, product_name)
values
	# carts의 컬럼을 정의 순서대로 데이터 전달
    # : quantity 수량을 제외한 데이터를 전달할 경우
	#		> 테이블 명 옆에 (삽입하고자하는 컬럼명만 나열) 
    (4, '이어폰'),
    (5, '스마트폰');
    
select * from `carts`;

#---------------------#
# +) 제약 조건 사용 시 여러 개 동시 지정 가능
# EX) NOT NULL + CHECK
create table `multiple` (
	mutiple_col int not null check(mutiple_col > 10)
);

insert into `multiple`
	values(10);
    
drop database if exists `example`;