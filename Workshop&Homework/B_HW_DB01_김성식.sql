
-- 1
SELECT *
FROM emp
WHERE YEAR(hiredate) = 2014;

-- 2
SELECT *
FROM emp
WHERE ename LIKE '%S%';

-- 3
SELECT *
FROM emp
WHERE comm IS NULL;

-- 4
SELECT AVG(sal), MAX(sal), MIN(sal), count(*)
FROM emp
GROUP BY deptno;

-- 5
SELECT ename, deptno, sal, (sal * 12 + sal*1.50)AS 연봉
FROM emp
WHERE deptno = 30;

-- 6
SELECT ename, sal, (sal * 0.15) AS 경조비
FROM emp
WHERE sal >= 2000;

-- 7
SELECT AVG(sal) as 평균, MAX(sal) as 최고, MIN(sal) as 최저
FROM emp
GROUP BY deptno
ORDER BY 평균 DESC;


