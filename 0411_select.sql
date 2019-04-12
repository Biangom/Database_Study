-- 주석
-- ㅁㄴㅇㅁㄴㅇ

-- SQL문은 대소문자 구별이 없다. select SELECT

-- 데이터는 대소무자 구분이 된다.

-- 식별자는 대소문자 구분이 없다 (리눅스에선 구분) (식별자 : 데이터베이스명, 테이블명, 컬럼명)

SELECT * FROM EMP;

-- 급여가 1000 초과인 사람만 조회alter

SELECT *
FROM EMP
WHERE SAL >= 2500;



-- SELECT 컬럼명, 컬럼명, ...
-- [FROM 테이블명]
-- [WHERE 조건]
-- [GROUP BY 컬렴명]
-- [HAVING 조건]
-- [ORDER BY 컬럼명 표현]
-- [LIMIT 행카운트] 화면에 표시해줄 행의 갯수
-- ;

-- emp 테이블에서, 급여*12, -> 연봉으로, 사번, 이름, 연봉 컬럼을 조회

SELECT EMPNO, ENAME, SAL * 12 AS 연봉
FROM EMP;


SELECT EMPNO, ENAME, SAL * 12 AS 연봉
FROM EMP;


SELECT EMPNO AS 사번, ENAME AS 이름, SAL, SAL*12+comm AS 연봉보너스, comm
FROM EMP;
-- 사칙연산, () 수식이 가능함

-- IFNULL(값, 디폴트값) : 값이 널이면 디폴트값으로 적용
SELECT IFNULL(5, 'X');
SELECT coalesce(5, 'X');
-- 동일한 결과임, 밑에것을 쓰는 걸 권장


-- COMM이 널이면 0값으로 처리하기
SELECT EMPNO AS 사번, ENAME AS 이름, SAL, SAL*12+IFNULL(comm, 0) AS 연봉보너스, comm
FROM EMP;


-- 문자열 덧셈 : 매개변수의 문자열을 모두 이어붙여준다.
SELECT CONCAT('AB', 'CD', '==', 'DD');

SELECT empno AS 사번, ename AS 이름, CONCAT(sal, '$') AS 달러
FROM emp;


-- 문자열 검색 : 특정문자열 찾기
-- % : 0~n개 글자
-- _ : 1개 글자

-- apple
-- a%
-- a____
-- _pp__
-- _PP%
-- %pp%

-- emp 테이블에서 LL이 들어간 사람의 사번, 이름을 출력
-- emp 테이블에서 s로 끝나는 사람의 사번, 이름을 출력
-- emp 테이블에서 이름이 두번째 글자가 O인 사람의 사번, 이름을 출력

SELECT empno, ename
FROM emp
WHERE ename LIKE '%LL%';


SELECT empno, ename
FROM emp
WHERE ename LIKE '%S';

SELECT empno, ename
FROM emp
WHERE ename LIKE '_O%';

-- 어떤 부서번호들이 있는지 조회
SELECT deptno
FROM emp;

-- 중복제거 : SELECT DISTINCT
SELECT DISTINCT deptno
FROM emp;

-- (deptno, job)이 유일하게 나올 수 있게끔 한 것
SELECT DISTINCT deptno, job
FROM emp;

-- 직책이 MANAGER인 사람의 모든 칼럼을 조회
SELECT *
FROM emp
WHERE job = 'MANAGER';

-- 급여가 2000초과인 사람의 모든 컬럼을 조회
SELECT *
FROM emp
WHERE sal > 2000;


-- 급여가 2000이상, 3000이하인 사람의 모든 컬럼을 조회
SELECT *
FROM emp
WHERE sal > 2000 and sal < 3000;

-- 부서번호가 10이거나 30인 사람의 정보를 조회
SELECT *
FROM emp
WHERE deptno = 10 or deptno = 30;


-- 부서번호가 10이거나 30인 사람의 정보를 조회
SELECT *
FROM emp
WHERE deptno in (10, 30);


-- 커미션이 null인 사람을 조회
SELECT *
FROM emp
WHERE comm IS NULL;

SELECT *
FROM emp
WHERE comm IS NOT NULL;


-- 직책이 MANAGER, 부서번호 10
SELECT *
FROM emp
WHERE job = "MANAGER" AND deptno = 10;

-- (MANAGER, 부서번호 10) or (SALESMAN, 부서번호 10)
SELECT *
FROM emp
WHERE (job = "MANAGER" AND deptno = 10)
OR (job = "SALESMAN" AND deptno = 30);


-- (MANAGER, 부서번호 10) or (SALESMAN, 부서번호 10)
SELECT *
FROM emp
WHERE (job, deptno) in (('MANAGER',10),('SALESMAN', 30));



-- switch~case deptno가 10이면 영어부, 20이면 운영팀, 30이면 판매부라고 출력하기
SELECT *, CASE deptno
WHEN 10 THEN '영업부'
WHEN 20 THEN '운영팀'
WHEN 30 THEN '판매부'
ELSE '백수'
END AS '부서'
FROM emp;

-- 3행까지만 조회해라
SELECT * FROM emp LIMIT 3;

-- 연산자
-- < > <= >= 
-- 같다는 =만 써야함
-- !=, <> 다르다
-- 논리 부정으로 NOT을 쓸 수 잇다.alter3

-- OR AND

SELECT 3 = 3; -- 1
SELECT 3 <> 3;  -- 0
SELECT NOT 3 = 3;

-- ORDER BY: 정렬, 기준 컬럼으로 오름차순(ASC, 기본값, 생략가능) or 내림차순(DESC) 정렬
SELECT ename, sal
FROM emp
ORDER BY sal;

SELECT ename, sal
FROM emp
ORDER BY sal DESC;

-- deptno 를 내림차순으로 하고 그 record들 중에서 sal을 오름차순으로 정렬한다.
SELECT ename, sal, deptno
FROM emp
ORDER BY deptno DESC, sal ASC;

-- 컬럼 정렬 표현을 순번, 별칭으로 표현가능
SELECT ename, sal '급여', deptno
FROM emp
ORDER BY 3 DESC, 급여 ASC; -- 순번 (3)으로 표기시 , SELECT 컬럼의 순서 1번부터 시작
-- 즉 3번에 해당하는 deptno가 해당된다.

-- 문자열을 이어붙여준다. dual이라는 한칸짜리 테이블이 있다.
SELECT CONCAT('A', 'BCD', 'XYZ')
FROM dual;

-- 소숫점 4개만 출력
SELECT FORMAT(123456.45678, 4)
FROM dual;


SELECT FORMAT(123456.45678, 0);

-- 진법변환 16을 2진수로 바꾸어라
SELECT BIN(16)
FROM dual;

SELECT HEX(31);

SELECT OCT(8);


-- 문자열 삽입 3번째 글자에 4개의 문자 삽입
SELECT INSERT('ABCDEFG', 3, 4, 'X');
--				원본문자열,위치,갯수, 문자열.


-- 왼쪽/오른쪽 문자열 추출
SELECT LEFT('ABCDEF', 3);
SELECT RIGHT('ABCDEF', 3);

-- 대문자변환/소문자변환
SELECT UCASE('abcde');
SELECT LCASE('ABCDE');


-- 부족한 칸 채우기
SELECT LPAD('ABC', 5, '#');
SELECT RPAD('ABC', 5, '#');

-- 공백제거 왼쪽공백제거, 오른쪽공백제거
SELECT LTRIM('   ABC DD             ');
SELECT RTRIM('            ABC DD     ');
SELECT TRIM('            ABC DD     ');

-- REPEAT많이 안쓴다.
SELECT REPEAT('X', 4);

-- 문자열 교환
SELECT REPLACE('I am a boy.', 'boy', 'girl');

-- 문자열 추출
SELECT SUBSTRING('ABCDEFG', 3, 2);

-- 수학함수
-- 절대값
SELECT ABS(-3);
SELECT ceiling(2.1); -- 올림
SELECT ROUND(5.5); -- 반올림
SELECT FLOOR(5.5); -- 내림


-- 날짜함수
SELECT curdate(); -- 현재 날짜 YYYY-MM-DD
SELECT curtime(); -- 현재 시간 hh:mm:ss
SELECT NOW();		-- 현재 날짜, 시간

SELECT YEAR('1980-05-25'); -- 연도만 추출
SELECT MONTH('1080-05-25');

SELECT YEAR(NOW()), MONTH(NOW()), DAY(NOW());
SELECT HOUR(NOW()), MINUTE(NOW()), SECOND(NOW());

-- 연도에서 빼버렸다
SELECT '2000-12-25' - 1;

-- 시스템 정보 함수SELECT USER(); -- 사용자 계정
SELECT DATABASE(); -- 선택된 데이터베이스
SELECT VERSION();	-- MySQL 버전

SELECT datediff('2000-12-12', '1990-12-12');

-- 그룹함수
-- AVG(컬럼명) 평균
-- MAX(컬럼명) 최대
-- MIN(컬럼명) 최소값
-- COUNT(컬럼명) 개수
-- SUM(컬럼명) 합계

-- round(a,n) n번쨰까지 반올림, round()
SELECT sum(sal), round(avg(sal)), deptno
FROM emp
WHERE NOT job = 'SALESMAN'
GROUP BY deptno -- 해당 칼럼으로 묶기, 묶기하면 의미가 없다.
HAVING round(avg(sal)) > 2000;
-- GROUP으로 묶었을 때의 데이터에 대한 조건은 having 절

-- WHERE : 그 외의 조건
-- HAVING : 그룹함수에 대한 것은 HAVING

select * from emp;

-- 각 부서별, 최저급여, 최고급여를 조회
SELECT ename, MAX(SAL), MIN(SAL), deptno
FROM emp
GROUP BY deptno;

-- 각 부서별 인원수 출력
SELECT deptno, count(*)
FROM emp
GROUP BY deptno;

-- 각 부서별 인원수가 5명 이상인 부서만 출력
SELECT count(*) as sum, deptno
FROM emp
GROUP BY deptno
HAVING sum >= 5;

-- 1982년 이후 입사한 사람
SELECT *, year(HIREDATE)
FROM emp
WHERE year(HIREDATE) >= 1982;

SELECT *, year(HIREDATE)
FROM emp
WHERE datediff(HIREDATE, '1982-1-1') >= 0;

SELECT *, year(HIREDATE)
FROM emp
WHERE HIREDATE >= '1982-1-1';


























































