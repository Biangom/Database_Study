
-- 1
SELECT E.ename, E.job, E.sal
FROM emp AS E
	INNER JOIN dept AS D 
		ON E.deptno = D.deptno
WHERE D.loc = 'CHICAGO';


-- 2
SELECT empno AS 사원번호, ename AS 이름, job AS 업무, deptno AS 부서번호
FROM emp
WHERE empno NOT IN (SELECT MGR
					FROM emp
					WHERE MGR IS NOT NULL);
                    
                    
-- 3
SELECT ename, job, mgr
FROM emp
WHERE mgr = (SELECT MGR
			FROM emp
			WHERE ename = 'BLAKE');

-- 4
SELECT ename, hiredate
FROM emp
ORDER BY hiredate ASC
LIMIT 5;


-- 5
SELECT E.ename, E.job, D.dname
FROM emp AS E
	INNER JOIN dept AS D
		ON E.deptno = D.deptno
WHERE E.mgr = (SELECT empno
			FROM emp
			WHERE ename ='JONES');


