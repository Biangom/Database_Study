
-- 1
DESC emp;

-- 2
SELECT empno, ename, HIREDATE, SAL
FROM emp
WHERE ename LIKE 'K%';

-- 3
SELECT *
FROM emp
WHERE year(hiredate) = 2000;

-- 4
SELECT *
FROM emp
WHERE comm IS NOT NULL;

-- 5
SELECT ename, deptno, sal
FROM emp
WHERE deptno = 30 and sal >= 1500;

-- 6
SELECT empno, ename, deptno
FROM emp
WHERE deptno = 30
ORDER BY empno ASC;

-- 7
SELECT *
FROM emp
ORDER BY sal DESC;

-- 8
SELECT *
FROM emp
ORDER BY deptno ASC, sal DESC;

-- 9
SELECT *
FROM emp
ORDER BY deptno DESC, ename ASC, sal DESC ;

-- 10
SELECT ename, sal, comm, sal*comm/100 AS total
FROM emp
WHERE comm is NOT NULL
ORDER BY total DESC ;

-- 11
SELECT ename, sal, round(sal*0.13) AS bonus, deptno
FROM emp
WHERE deptno = 10;

-- 12
SELECT ename, sal, round(sal/60, 1) AS salperday
FROM emp
WHERE deptno = 20;

-- 13
SELECT ename, sal, round((sal*0.15),2) AS 회비
FROM emp
WHERE sal >= 1500 and sal <= 3000;

-- 14
SELECT ename, sal, round(sal*0.9) AS 실수령액
FROM emp
ORDER BY sal DESC;

-- 15
SELECT LEFT(LCASE(ename), 3)
FROM emp
WHERE ename LIKE '______%';

-- 16
SELECT AVG(sal) as 평균, MAX(sal) as 최고, MIN(sal) as 최저, count(*) as 인원수
FROM emp
GROUP BY deptno
HAVING deptno = 10;

-- 17
SELECT deptno,  job, count(job) as 인원수
FROM emp
GROUP BY deptno, job;


-- 18
SELECT job, count(*) as total
FROM emp
GROUP BY job
HAVING total >= 4;

select * from emp;


-- 19
SELECT ename, hiredate, datediff(now(), hiredate) as 근무일수
FROM emp;

-- 20
SELECT ename, YEAR(now()) - YEAR(hiredate) as 근속년수
FROM emp;



