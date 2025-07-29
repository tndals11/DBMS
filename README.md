# 📌 DBhttps://github.com/tndals11/DBMS/blob/main/README.md
---
# 데이터베이스란
---
 용어     | 설명 |
|----------|------|
| **DB (Database)** | 데이터를 저장하는 공간 |
| **DBMS (Database Management System)** | 데이터를 효율적으로 관리할 수 있는 소프트웨어 |
| **RDBMS (Relational DBMS)** | 데이터를 테이블 형태로 저장하고, 테이블 간의 **관계(Relation)** 를 통해 데이터를 관리 |
---
### 🧱 테이블 구성 요소

- **Table (테이블)**: 데이터가 저장되는 기본 단위  
- **Column (열, 속성)**: 데이터의 속성(데이터 유형)  
- **Row (행, 레코드)**: 고유한 데이터 집합 (한 행 = 하나의 레코드)  
- **Key (키)**: 각 레코드를 식별하기 위한 속성 (기본키, 외래키 등)

---
# 🛠️ SQL 언어

> SQL은 DBMS에서 데이터를 **정의, 조작, 제어**하기 위해 사용되는 **표준 프로그래밍 언어**입니다.

### 분류

- **DDL (Data Definition Language)** : 데이터 정의
- **DML (Data Manipulation Language)** : 데이터 조작
- **DCL (Data Control Language)** : 데이터 제어

---
### 📐 DDL (Data Definition Language)

> 데이터베이스 및 테이블의 **구조를 생성, 수정, 삭제**할 때 사용

| 명령어      | 설명 |
|-------------|------|
| `CREATE`    | DB 또는 테이블을 **생성** |
| `ALTER`     | 기존 구조 **수정** |
| `DROP`      | 구조체 **삭제 (완전 삭제)** |
| `TRUNCATE`  | 데이터만 삭제, 구조는 유지 |

---
## ✍️ DML (Data Manipulation Language)

> **데이터를 조회, 삽입, 수정, 삭제**할 때 사용하는 명령어입니다.  
> 테이블의 **데이터**를 직접 조작하며, 주로 사용자와 가장 밀접하게 사용됩니다.

| 명령어      | 설명 |
|-------------|------|
| `SELECT`    | 데이터 **조회** |
| `INSERT`    | 테이블에 새 **데이터 삽입** |
| `UPDATE`    | 기존 데이터를 **수정** |
| `DELETE`    | 기존 데이터를 **삭제** |

📝 **주의**:  
- `UPDATE`와 `DELETE`는 **WHERE 절을 반드시 주의**해서 사용해야 함 (모든 데이터가 변경/삭제될 수 있음)
- `SELECT`는 데이터 변경 없이 읽기만 수행

---

## 🔐 DCL (Data Control Language)

> **사용자 권한 제어 및 보안 관리**를 위한 명령어입니다.  
> 데이터에 대한 접근 권한을 설정하거나 회수할 때 사용됩니다.

| 명령어      | 설명 |
|-------------|------|
| `GRANT`     | 사용자에게 **권한 부여** |
| `REVOKE`    | 사용자에게 부여된 **권한 회수** |

## 🏷️ SQL 명명 규칙 (Naming Conventions)

> SQL 객체(테이블, 컬럼 등)에 이름을 지을 때는 **가독성, 유지보수, 일관성**을 고려해야 합니다.  
> 아래는 일반적으로 많이 사용하는 **Best Practice 기반 명명 규칙**입니다.

---

### 📌 명명규칙

| 항목 | 규칙 |
|------|------|
| 문자 | 영문 소문자 사용 권장 (`snake_case`) |
| 숫자 | 이름에 포함 가능 (앞에 올 수 있음) |
| 특수문자 | 사용 ❌ (언더스코어 `_`만 허용) |
| 길이 | 너무 긴 이름 ❌ (보통 30자 이하 권장) |
| 예약어 | SQL 예약어 사용 ❌ (예: `select`, `from`) |

---

### 📦 테이블명 (Table Names)

| 규칙 | 예시 |
|------|------|
| **복수형 사용** (데이터 집합이므로) | `users`, `orders`, `products` |
| 기능 또는 역할 기반 명명 | `user_roles`, `order_items` |
| 접두사/스키마 사용 (선택적) | `auth_users`, `sales_orders` |

---

### 🧩 컬럼명 (Column Names)

| 규칙 | 예시 |
|------|------|
| `snake_case` 사용 | `user_id`, `created_at`, `email_address` |
| 명확하고 구체적으로 | `price` 대신 `product_price` |
| 불린값은 `is_`, `has_` 접두사 사용 | `is_active`, `has_discount` |

---

### 🔑 키 및 제약 조건 명명

| 유형 | 패턴 예시 |
|------|-----------|
| **Primary Key** | `pk_테이블명` → `pk_users` |
| **Foreign Key** | `fk_테이블명_참조테이블명` → `fk_orders_users` |
| **Index** | `idx_테이블명_컬럼명` → `idx_users_email` |
| **Unique** | `uq_테이블명_컬럼명` → `uq_users_username` |
| **Check** | `chk_테이블명_컬럼명` → `chk_products_price` |

---

### 📚 기타 팁

- **일관성 유지**: 모든 테이블/컬럼에 같은 규칙을 적용하세요.
- **약어 지양**: 의미를 쉽게 알 수 있도록 가능한 전체 단어 사용 (`amt` ❌ → `amount` ✅)
- **날짜 컬럼 명명**: `created_at`, `updated_at`, `deleted_at` 등 표준화된 네이밍 사용

---
