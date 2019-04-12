# 외래키
# 부서테이블

create table if not exists dept(
	deptid int primary key,
    deptname varchar(10)
);

-- 컬럼명은 상관없지만 타입은 같아야한다. 외래키로 쓰려면
# 멤버테이블
create table if not exists member(
	m_id int primary key,
	membername varchar(10),
    deptid int,
    foreign key(deptid) references dept(deptid)
);

-- 테이블 생성시 외래키 지정 방법
-- foreign key(내 컬럼명) references 참조할테이블명(참조할컬럼명)
-- foreign key와 내부 컬럼의 타입(크기)를 맞춰서 선언한다.
-- foreign key 외래키로 지정하는 컬럼은 primary key로 선언되며 있어야한다.


drop table member;
drop table dept;

-- prirmary, foreign키도 지정안했지만 나중에 지정하는 방법!
create table if not exists dept(
	deptid int,
    deptname varchar(10)
);

-- 컬럼명은 상관없지만 타입은 같아야한다. 외래키로 쓰려면
# 멤버테이블
create table if not exists member(
	m_id int,
	membername varchar(10),
    deptid int
);

-- primary key 지정하기
-- alter table 테이블명 add constraint 수정작업명 primary key (지정할 컬럼명)
alter table dept add constraint pr1 primary key (deptid);
alter table member add constraint pr2 primary key (m_id);

-- foreign key 지정
/*
alter table 테이블 명
	add constraint 수정작업명 foreign key(내 지정할 컬럼명)
	references 참조할테이블명(참조할컬럼명)*/

alter table member
	add constraint fk1 foreign key(deptid)
    references dept(deptid);
    
    
desc dept;
desc member;

-- update
-- mydb 선택하기!
desc emp;
-- update

-- update 테이블명 set 컬럼명=값, 컬럼명=값,... -- 바꿀 컬럼명과 값의 나열
		-- [where 조건] [order by] [limit 행카운트] 
update emp set ename = '우형'
	where empno = 1111;
desc emp;
select * from emp;

-- emp 테이블에서 부서번호가 10인 직원의 comm을 10으로 세팅
update emp set comm = 10 where deptno =10;

SET SQL_SAFE_UPDATES = 0; #안전모드로 UPDATE가 안되는 경우 옵션 꺼주기

-- delete
-- DELETE FROM 테이블명 [WHERE 조건][ORDER BY][LIMIT 행카운트];
DELETE FROM emp WHERE deptno = 10;






