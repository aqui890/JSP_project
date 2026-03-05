-- board 테이블
CREATE TABLE yemin_board(
	yemin_num NUMBER PRIMARY KEY,
	user_id VARCHAR2(20) NOT NULL,
	user_name VARCHAR2(20) NOT NULL,
	title VARCHAR2(100) NOT NULL,
	content VARCHAR2(1000) NOT NULL,
	hit NUMBER,
	ip VARCHAR2(20),
	regist_day date default sysdate,
	update_day date default sysdate
);

SELECT * FROM yemin_board;

-- 데이터 저장
INSERT INTO yemin_board VALUES (yemin_num.nextval, 'yemin', '김프리', '배송 언제 오나요?',
'주문한지 이주일이 지났는데 배송이 아직 안되었습니다.배송 언제 오나요?', 1, '128.120.0.05', sysdate, sysdate);

commit;

CREATE SEQUENCE yemin_num nocycle nocache;

-- member 테이블
CREATE TABLE member (
	id VARCHAR2(60) NOT NULL UNIQUE,
	password VARCAHR2(60) NOT NULL, 
	name VARCHAR2(60) NOT NULL,
	gender VARCHAR2(10),
	birth VARCHAR2(20),
	mail VARCHAR2(50),
	phone VARCHAR2(50),
	address VARCHAR2(100),
	seq_num NUMBER PRIMARY KEY,
	logtime DATE,
	updatetime DATE
);

CREATE SEQUENCE seq_num NOCYCLE NOCACHE;

COMMIT;


-- 데이터 저장
INSERT ITNO member VALUES ('cutyl', '1234', '홍길동', '남', '1901-02-20', 'test@gmail.com', '010-1234-5678', '서울시 강남구 대치동 은마 apt 101-205', seq_num.nextval, sysdate, sysdate);

-- 데이터 수정
UPDATE member SET gender = '여', updatetime = sysdate WHERE id = 'cutyl';

commit;

-- product 테이블
CREATE TABLE products (
    p_id VARCHAR2(20) PRIMARY KEY,
    p_name VARCHAR2(50),
    p_unitPrice NUMBER,
    p_description VARCHAR2(1000),
    p_manufacturer VARCHAR2(50),
    p_category VARCHAR2(50),
    p_unitStock NUMBER,
    p_condition VARCHAR2(50),
    p_filename VARCHAR2(50)
);
INSERT INTO products values('P12345', '갤럭시탭S11', 998800, '태블릿PC/Wi-Fi/11인치/120Hz/12GB/128GB/microSD지원/\r\n',
'삼성전자', '삼성전자', 500, 'New', 'masonry-portfolio-4.jpg');

commit;
-- member_test 테이블
create table member_test (
    id varchar2(20) primary key,
    pw varchar2(20) not null,
    name varchar2(30),
    logtime date
);

SELECT * FROM member_test;
INSERT INTO member_test VALUES('P123', 'qwer1234', 'p12341234', sysdate);
UPDATE member_test SET name = '예민' WHERE id = 'qwer';
commit;

-- 주석
CREATE TABLE dbtest(
    name varchar2(20),
    age number(3),
    height number(5, 2),
    logtime date
);

-- 테이블 확인
SELECT * FROM tab;
-- 데이블 구조 확인
desc dbtest;

-- 테이블 삭제
-- 1) 휴지통 이동
drop table dbtest;

-- 2) 복원하기
FLASHBACK TABLE dbtest TO BEFORE DROP;

-- 3) 휴지통 비우기
PURGE RECYCLEBIN;

-- 4) 휴지통으로 이동하지 않고 영구적으로 삭제
DROP TABLE dbtest PURGE;

-- 데이터 추가(레코드)
INSERT INTO dbtest VALUES('유예민', 18, 200.1, sysdate);
INSERT INTO dbtest VALUES('샤를 르클레르', 27, 199, sysdate);
INSERT INTO dbtest VALUES('Max Verstappen', 23, 198, sysdate);
INSERT INTO dbtest VALUES('홍길동', 23, 197, sysdate);
INSERT INTO dbtest (name, age) VALUES('홍당무', 45);
INSERT INTO dbtest (name, height) VALUES('홍당무', 185);
INSERT INTO dbtest VALUES('hongil', 23, 197, sysdate);
INSERT INTO dbtest VALUES('김홍석', 25, 190, sysdate);
INSERT INTO dbtest (name, age) VALUES('홍게', 185);
-- 데이터 확인
SELECT * FROM dbtest;
SELECT name, height, logtime FROM dbtest;

-- 데이터 있는 컬럼의 개수 확인;
SELECT COUNT(*) FROM dbtest;

-- 검색결과를 정렬
SELECT * FROM dbtest ORDER BY name ASC; -- default 오름차순
SELECT * FROM dbtest ORDER BY name DESC; -- 내림차순
SELECT * FROM dbtest ORDER BY name, height; -- 두번째 기준 추가
SELECT * FROM dbtest ORDER BY age DESC, height ASC; -- 첫번째 기준은 내림차순, 두번째 기준은 오름차순

-- 조건 검색
SELECT * FROM dbtest WHERE  name = '홍당무';
SELECT * FROM dbtest WHERE name = 'honggil';
SELECT * FROM dbtest WHERE name LIKE '홍%'; -- 홍으로 시작하면
SELECT * FROM dbtest WHERE name LIKE '%홍%'; -- 홍이 들어가면
SELECT * FROM dbtest WHERE name LIKE '홍_'; -- 글자수 지정하려면_를 이용

-- 2가지 기준을 모두 만족
SELECT * FROM dbtest WHERE name LIKE '홍%' and age <= 30;

-- 1가지 기준을 만족
SELECT * FROM dbtest WHERE name LIKE '홍%' or age <= 30;

-- 나이가 null이 아닌 데이터
SELECT * FROM dbtest WHERE age is not null;

COMMIT;

-- 마지막 커밋 전으로 되돌리기
ROLLBACK;
SELECT * FROM dbtest;

-- 중복을 제외하고 출력
SELECT DISTINCT name FROM dbtest;

-- 별칭 (alias) 활용
SELECT DISTINCT name AS "이름" FROM dbtest;

-- selfEX 1) null이 하나라도 포함된 데이터 모두 표시
SELECT * FROM dbtest WHERE name is null or age is null or height is null or logtime is null;

-- selfEX 2) null이 하나도 포함안됨 데이터 모두 표시
SELECT * FROM dbtest WHERE name is not null and age is not null and height is not null and logtime is not null;


--depart 테이블
create table depart(
    deptnumber number not null, --부서번호(학과번호)
    dname varchar2(25) not null, --부서명(학과명)
    loc varchar2(10) default null  --위치
);
select * from depart;
drop table depart purge;


--depart 데이터 입력
insert into depart (deptnumber, dname) values (302, '전기공학과');
INSERT INTO depart VALUES (101, '컴퓨터공학과', '1호관');
INSERT INTO depart VALUES (102, '멀티미디어학과', '2호관');
INSERT INTO depart VALUES (201, '전자공학과', '3호관');
INSERT INTO depart VALUES (202, '기계공학과', '4호관');

select * from depart;


--emp 테이블
create table emp(
    empno number primary key, --직원번호
    name varchar2(20) not null,   --이름
    position varchar2(10) not null,  --직급
    tel VARCHAR(15) not null, --전화번호
    deptno number not null  --학과번호
    --primary key(empno) --not null, unique
);
select * from emp;
drop table emp purge;


--emp 데이터 입력
INSERT INTO emp VALUES (20101, '홍길동', '사원', '031)781-2158', 101);
INSERT INTO emp VALUES (10102, '김철수', '과장', '032)261-8947', 101);
INSERT INTO emp VALUES (10103, '이영희', '대리', '02)824-9637', 102);
INSERT INTO emp VALUES (10104, '고길동', '사원', '02)824-9637', 102);
INSERT INTO emp VALUES (10105, '강호동', '사원', '02)824-9637', 102);
INSERT INTO emp VALUES (10106, '아이유', '사원', '02)881-2158', 105);

-- 1) inner join 내부조인: 교집합 해당 데이터 가져옴
-- 방법1: 오라클 전용구문
SELECT empno, name, emp.deptno, dname from emp, depart where emp.deptno = depart.deptnumber;

-- 방법2: Ansi 표준 => 교집합으로 가져오고 싶은 컬럼명이 다르면 조인이 불가능
SELECT E.empno, E.name, E.deptno, D. dname FROM emp E join depart D ON E.deptno = D.deptnumber;
SELECT empno, name, deptno, dname FROM emp join depart2 using(deptno);


-- 2) outer join 외부조인(LEFT조인) : 합집합 해당 데이터 가져옴
-- 방법1: 오라클 전용구문
SELECT name, deptno, dname FROM emp e, depart d WHERE e.deptno = d.deptnumber(+);

-- 방법2: Ansi 표준
SELECT empno, name, deptno, dname FROM emp left join depart2 using(deptno);

-- 2) outer join 외부조인(RIGHT조인) : 합집합 해당 데이터 가져옴
-- 방법1: 오라클 전용구문
SELECT name, deptno, dname FROM emp e, depart d WHERE e.deptno(+) = d.deptnumber;

-- 방법2: Ansi 표준
SELECT empno, name, deptno, dname FROM emp RIGHT JOIN depart2 using(deptno);

-- 2) outer join 외부조인(full조인) : 합집합 해당 데이터 가져옴
-- 방법1: Ansi 표준
SELECT empno, name, deptno, dname FROM emp FULL JOIN depart2 using(deptno);
SELECT * FROM emp FULL JOIN depart2 using(deptno);

-- depart2 테이블
create table depart2(
    deptno number not null, --부서번호(학과번호)
    dname varchar2(25) not null, --부서명(학과명)
    loc varchar2(10) default null  --위치
);

--depart2 데이터 입력
insert into depart2 (deptno, dname) values (302, '전기공학과');
INSERT INTO depart2 VALUES (101, '컴퓨터공학과', '1호관');
INSERT INTO depart2 VALUES (102, '멀티미디어학과', '2호관');
INSERT INTO depart2 VALUES (201, '전자공학과', '3호관');
INSERT INTO depart2 VALUES (202, '기계공학과', '4호관');

COMMIT;


---------------------------------------------------------------[squence]---------------------------------------------------------------------------------
-- 시퀀스 sequence : 자동으로 순차적으로 증가하는 순번을 생성하는 데이터베이스 객체
CREATE SEQUENCE seq_board NOCYCLE NOCACHE;
-- nocycle
-- nocache
DROP SEQUENCE seq_board;

CREATE SEQUENCE empno START WITH 30000;
CREATE SEQUENCE empno INCREMENT BY 2 START WITH 40000;
CREATE SEQUENCE empno INCREMENT BY 100 MINVALUE 100 MAXVALUE 500 START WITH 125 cycle cache 2;
DROP SEQUENCE empno;
INSERT INTO emp VALUES (empno.nextval, '홍길동', '사원', '031)781-2158', 101);
commit;
SELECT * FROM emp;