# 📌 DB
---
# 데이터베이스란
---
DB(데이터베이스): 데이터를 저장하는 공간
DBMS: 데이터를 효율적으로 관리할 수 있는 소프트웨어
RDBMS: 데이터를 테이블 형태로 저장하고, 테이블 간의 관계를 통해 데이터 관리

|--------------------------------------------|
| Table(테이블)   | 데이터가 저장되는 기본단위 |
| Column(열, 속성) | 데이터 유형   |
| Row(행, 레코드)  | 고유한 데이터 세트  |
| Key(키)   | 레코드 식별 속성  |

 == 데이터 타입(DataType) ==
1. 정수형(tinyint, smallint, int, bigint) + unsigned(부호가 없는 정수)
2. 문자형(char(개수), varchar(개수))
3. 실수형(float, double) + decimal
4. 논리형(true, false)
		- 실제 데이터 저장은 tinyint(1)
    - true(1), false(0)
5. 날짜형(date, time, datetime)
6. 열거형(enum)
