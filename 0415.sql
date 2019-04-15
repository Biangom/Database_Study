SELECT *
FROM emp;

# 뷰 생성하기
-- CREATE VIEW 뷰명 AS
-- SELECT 절

# 알바생에게 보여주고 싶은 컬럼만 넣은 가상의 테이블(=뷰)를 만들어 제공
CREATE VIEW alba AS
SELECT empno, ename, job, deptno
FROM emp;

SELECT empno, ename, job, deptno
FROM emp;


# 뷰의 장점1 : 보안, 제공하고 싶은 컬럼만 제공한다.
SELECT *
FROM abla; # 뷰 사용시에는 테이블 사용하듯 쓰면 됨

# 뷰의 장점2 : 자주 사용되는 복잡한 쿼리를 단순화한다 ( 쿼리를 저장해서 사용한다ALTER
CREATE VIEW alba AS
SELECT sal
FROM emp;

SELECT * FROM alba;
DESC alba;
DROP VIEW 뷰명; # 뷰삭제
DROP VIEW alba;


# 뷰를 같은 이름으로 중복 생성이 불가능하므로, REPLACE한다 = (DROP 후 CREATE랑 똑같다)
CREATE or REPLACE VIEW alba AS
SELECT sal
FROM emp;


-- 16
CREATE VIEW view_e AS
SELECT deptno, SUM(SAL)
FROM emp
GROUP BY deptno;

-- 17
select * from view_e
LIMIT 3;




