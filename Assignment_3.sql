create database assign_3;
use assign_3;

create table stud_info(rno int, sname varchar(20), address varchar(20)); 
insert into stud_info value (1, "Aniket", "kolhapur"),
	(2, "Sarth", "kolhapur"),
    (3, "Abhishek", "amravati"),
    (4, "Rajiv", "pune"),
    (5, "Shantanu", "pune"),
    (6, "Varad", "baramati"),
    (7, "Avishkar", "baramati"),
    (8, "Aditya", "satara"),
    (9, "Tanmay", "nagpur"),
    (10, "Suraj", "kolhapur");
select * from stud_info;

create table stud_marks(rno int, DBMS int, AI int, CN int);
insert into stud_marks value (1, 90, 80, 80),
	(2, 70, 90, 80),
    (3, 80, 80, 70),
    (4, 90, 70, 80),
    (5, 90, 70, 75),
    (6, 90, 88, 80),
    (7, 85, 60, 90),
    (8, 98, 79, 81),
    (9, 95, 85, 70),
    (10, 88, 87, 60);
select * from stud_marks;

SELECT *
	FROM stud_info
	INNER JOIN stud_marks ON stud_info.rno = stud_marks.rno;

SELECT *
	FROM stud_info
	LEFT OUTER JOIN stud_marks ON stud_info.rno = stud_marks.rno;

SELECT *
	FROM stud_info
	RIGHT OUTER JOIN stud_marks ON stud_info.rno = stud_marks.rno;
    
create table emp(eid int, ename varchar(50), city varchar(50), post varchar(100), salary int, deptno int);
insert into emp value (10, "Aniket", "kolhapur", "manager", 100000, 101),
	(20, "Sarth", "kolhapur", "lead", 10000, 102),
    (30, "Abhishek", "amravati", "supervisor", 20000, 103),
    (40, "Rajiv", "pune", "manager", 20000, 101),
    (50, "Shantanu", "pune", "developer", 13000, 105),
    (60, "Varad", "baramati", "developer", 11200, 105),
    (70, "Avishkar", "baramati", "designer", 20000, 107),
    (80, "Aditya", "satara", "developer", 20000, 105),
    (90, "Tanmay", "nagpur", "manager", 10000, 101),
    (100, "Suraj", "kolhapur", "team lead", 11000, 130),
    (110, "Pooja", "kolhapur", "lead", 12000, 102),
    (120, "Rakesh", "kolhapur", "team lead", 13000, 130);
select * from emp;

SELECT * FROM emp WHERE salary > (SELECT salary FROM emp WHERE ename = 'Pooja');

SELECT e2.ename FROM emp e1
	JOIN emp e2 ON e1.city = e2.city
	WHERE e1.ename = 'Rakesh';

SELECT * FROM emp
	WHERE salary > (SELECT AVG(salary) FROM emp);

SELECT * FROM emp
	WHERE salary < (SELECT AVG(salary) FROM emp);

SELECT * FROM emp
	WHERE salary = (SELECT MAX(salary) FROM emp);

SELECT * FROM emp
	WHERE salary = (SELECT MIN(salary) FROM emp);

SELECT ename, salary, deptno FROM emp
	WHERE (deptno, salary) IN (SELECT deptno, MIN(salary) FROM emp GROUP BY deptno);

SELECT e1.ename, e1.salary, e1.deptno FROM emp e1
	WHERE e1.salary > ALL (SELECT salary FROM emp e2 WHERE e2.post = 'developer');
    
SELECT e1.ename, e1.salary, e1.deptno FROM emp e1
	WHERE e1.salary < ALL (SELECT salary FROM emp e2 WHERE e2.post = 'developer');

SELECT e1.ename, e1.salary, e1.deptno FROM emp e1
	WHERE e1.salary > ANY (SELECT salary FROM emp e2 WHERE e2.post = 'developer');