

# 서브 쿼리 : 하나의 SELECT 문의 여러 절안에 포함되어 있는 SELECT 문장
-- 서브 쿼리는 소괄호로 묶여있어야한다
-- 서브 쿼리 구문에는 ORDER BY 절은 포함할 수 없다(의미가 없다)
-- GRUOUP BY 절은 사용할 수 없다
-- 서브쿼리에서 사용할 수 있는 연산자 
--      ㄴ 단일행 연산자 (=, >, >=, <, <=, <>, !=)
--      ㄴ 복수행 연산자 (IN, ANY, ALL, NOT IN, ...)
-- 서브쿼리로 할 수 있는 3가지 

#1. 단일행 서브트리 : SUB => MAIN로 전달되는 행이 하나인경우, 단일행 연산자 사용하자!!!
SELECT * FROM EMP;

-- SMITH와 같은 부서인 사람들의 이름, 직책, 부서번호를 조회하시오
SELECT ename, job, deptno
FROM emp
WHERE deptno = (SELECT deptno
			FROM emp
            WHERE ename = 'SMITH' );

-- SMITH와 같은 직책을 가지는 사람들의 이름, 급여, 직책을 출력하되, 급여가 적은 사원부터 출력하시오
SELECT ename, sal, job
FROM emp
WHERE job = (SELECT job
			FROM emp
            WHERE ename = 'SMITH')
ORDER BY sal;

-- 전체 직원의 평균급여보다 적은 급여를 받는 사원의 이름, 급여를 조회
SELECT ename, sal
FROM emp
WHERE sal < (SELECT avg(sal)
			FROM emp);

-- 그룹함수를 쓸려면 SELECT를 써줘야함
-- 지역명이 CHICAGO 에 위치한 부서에 속한 사원의 이름과 부서 id 출력

-- emp e로하면 성능이 약간 더 빠르다.
SELECT e.ename, e.deptno
from emp AS e
where e.deptno = (SELECT d.deptno
				FROM dept AS d
                WHERE d.loc = 'CHICAGO');
                
-- 2. 복수행 서브쿼리 : 서브쿼리에서 메인쿼리로 전달하는 행이 여러ㄱ인 경우 복수행 연산자를 사용해야 한다.
-- 지역명 CHICAGO가 아닌곳에 위치한 부서에 속한 사원의 이름과 부서id 출력
-- =은 하나의 행만 리턴이 됐을 때 쓸 수있다.
-- 그래서 e.deptno = (...)는 오류가 난다.
-- 그래서 in을 써줘야한다.
SELECT e.ename, e.deptno
from emp AS e
where e.deptno IN (SELECT d.deptno
				FROM dept AS d
                WHERE d.loc != 'CHICAGO');
                
                
-- 1
SELECT ename, sal, job
	from emp AS e
	where sal < ANY (SELECT sal
				FROM emp
				WHERE job = 'SALESMAN');
    
-- 2
SELECT ename, sal, job
	from emp AS e
	where sal < ALL (SELECT sal
				FROM emp
				WHERE job = 'SALESMAN');
                
-- 3
SELECT ename, sal, (SELECT AVG(sal) FROM emp) AS '평균급여'
FROM emp;


-- <실습문제>
-- 1. sakila db의 film 테이블에서 title(영화제목)이 'BUGSY SONG' 인 영화의 rental_duration 값과 같은 영화데이터의 모든컬럼을 조회하시오
-- 2. sakila db의 film 테이블에서 length(상영길이)가 'ATLANTIS CAUSE'(영화제목) 영화보다 큰 영화데이터의 모든컬럼을 상영길이가 큰영화부터 출력하시오
-- 3. sakila db의 film 테이블에서 전체 영화의 평균length(상영길이)보다 적은 length(상영길이)의 영화데이터의 모든컬럼을 조회하시오


SELECT *
FROM film
WHERE rental_duration = (SELECT rental_duration
				FROM film
                WHERE title = "BUGSY SONG");
                
SELECT *
FROM film
WHERE length > (SELECT length
				FROM film
                WHERE title = 'ATLANTIS CAUSE')
ORDER BY length DESC;


SELECT *
FROM film
WHERE length < (SELECT AVG(length)
				FROM film);
                


-- 4. sakila db의 film 테이블에서 title(영화제목)에 'TT' 가 들어가는 영화들의 어느 length(상영길이) 보다 작은 영화데이터의 모든컬럼을 조회하시오
-- 5. sakila db의 film 테이블에서 title(영화제목)에 'TT' 가 들어가는 영화들의 모든 length(상영길이) 보다 작은 영화데이터의 모든컬럼을 조회하시오
-- 6. sakila db의 film 테이블에서 title(영화제목),length(상영길이),상영길이의평균 을 출력하시오


SELECT *
FROM film
WHERE length < ANY (SELECT length
				FROM film
                WHERE title LIKE  '%TT%');
                
                
SELECT *
FROM film
WHERE length < ALL (SELECT length
				FROM film
                WHERE title LIKE  '%TT%');


SELECT title, length, (SELECT AVG(length) FROM film) AS '상여길이의 평균'
FROM film;



SELECT *
FROM emp
    INNER JOIN dept
        ON emp.deptno = dept.deptno;


SELECT E.empno, E.ename, E.job, E.mgr, E.hiredate, E.sal, E.comm, D.dname, D.loc
FROM emp AS E
    INNER JOIN dept AS D
        ON E.deptno = D.deptno;
        

-- INNER JOIN을 아래 코드 방법처럼 조건덜로 표현해도 결과는 동일합니다.

SELECT E.empno, E.ename, E.job, E.mgr, E.hiredate, E.sal, E.comm, D.dname, D.loc
FROM emp AS E, dept AS D
WHERE E.deptno = D.deptno;

-- CROSS JOIN
SELECT *
FROM emp
CROSS JOIN dept;

SELECT *
FROM dept
	INNER JOIN emp
		ON emp.DEPTNO = dept.DEPTNO;
        

--
SELECT E.EMPNO, E.ENAME, E.DEPTNO, D.DNAME
FROM emp AS E
	INNER JOIN dept AS D
		ON E.DEPTNO = D.DEPTNO;




SELECT * FROM stdtbl; -- 학생테이블
SELECT * FROM stdclubtbl; -- 학생동아리 테이블
SELECT * FROM clubtbl; -- 동아리테이블

-- 학생이름, 주소, 동아리명 다중 조인하기!
SELECT S.stdName, S.addr, SC.clubname, C.roomNo
FROM stdtbl AS S
	INNER JOIN stdclubtbl AS SC
		ON S.stdName = SC.stdName
	INNER JOIN clubtbl AS C
		ON SC.clubname = C.clubname
ORDER BY S.stdname;












                
                





                
