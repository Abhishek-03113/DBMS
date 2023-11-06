create database assign_2;
use assign_2;

create table deposite(account_no int primary key, cname varchar(50), bname varchar(50), amount int, adate date);
insert into deposite value (12345,"Anil","katraj",10000,"2007-12-01"),
	(67890,"Pramod","hadapsar",20000,"2009-06-01"),
    (57825,"Vikas","shivne",30000,"2010-12-10"),
    (54321,"Prasad","anand nagar",40000,"2008-09-08"),
    (09876,"Aniket","karve nagar",50000,"2008-01-08"),
    (08457,"Rajiv","warje",60000,"2008-01-07"),
    (45963,"Shantanu","katraj",70000,"2008-07-15"),
    (09362,"Abhishek","shaniwar peth",80000,"2008-09-18"),
    (85634,"Sarth","swargate",90000,"2008-10-08"),
    (09549,"Varad","shivaji nagar",100000,"2008-01-08");
    select * from deposite;
    
create table branch(bname varchar(50), city varchar(50));
insert into branch value ("katraj","pune"),
	("hadapsar","pune"),
    ("shivne","pune"),
    ("anand nagar","nagpur"),
    ("karve nagar","pune"),
    ("warje","pune"),
    ("shaniwar peth","kolhapur"),
    ("swargate","pune"),
    ("shivaji nagar","mumbai");
select * from branch;

create table customer(cname varchar(50), city varchar(50));
	insert into customer value ("Anil","pune"),
	("Pramod","pune"),
    ("Vikas","pune"),
    ("Prasad","nagpur"),
    ("Aniket","pune"),
    ("Rajiv","pune"),
    ("Shantanu","pune"),
    ("abhishek","kolhapur"),
    ("Sarth","Pune"),
    ("Varad","mumbai");
select * from customer;

create table borrow(loan_no int, cname varchar(50), bname varchar(50), amount int);
	insert into borrow value (1, "Anil", "katraj", 10000),
	(2, "Pramod", "hadapsar", 20000),
    (3, "Vikas", "shivne", 30000),
    (4, "Prasad", "anand nagar", 40000),
    (5, "Aniket", "karve nagar", 50000),
    (6, "Rajiv", "katraj", 60000),
    (7, "Shantanu", "katraj", 70000),
    (8, "Abhishek", "shaniwar peth", 80000);
select * from borrow;

SELECT city FROM branch WHERE bname = 'anand nagar';
SELECT d.account_no, d.amount FROM deposite d WHERE d.adate BETWEEN '2007-12-01' AND '2009-05-01';
SELECT c.cname
	FROM customer c
	WHERE c.cname IN (SELECT DISTINCT d.cname FROM deposite d WHERE d.adate > '2007-12-01');
SELECT c.cname AS customer_name, d.account_no AS deposite_account_no,
    d.bname AS deposite_branch, d.amount AS deposite_amount, d.adate AS deposite_date,
	b.city AS branch_city, bo.loan_no AS loan_number, bo.amount AS borrow_amount
	FROM customer c
	LEFT JOIN deposite d ON c.cname = d.cname
	LEFT JOIN branch b ON d.bname = b.bname
	LEFT JOIN borrow bo ON c.cname = bo.cname
	WHERE c.cname = 'Anil'
	LIMIT 1;
SELECT c.cname
	FROM customer c
	JOIN deposite d ON c.cname = d.cname
	JOIN branch b ON d.bname = b.bname
	WHERE c.city = b.city;
SELECT b.city AS branch_city, c.city AS living_city
	FROM customer c
	JOIN deposite d ON c.cname = d.cname
	JOIN branch b ON d.bname = b.bname
	WHERE c.cname = 'Pramod';
SELECT c.cname
	FROM customer c
	JOIN deposite d ON c.cname = d.cname
	LEFT JOIN borrow b ON c.cname = b.cname
	WHERE b.cname IS NULL;
SELECT DISTINCT c.cname
	FROM customer c
	JOIN deposite d ON c.cname = d.cname
	WHERE d.adate > '2008-01-08';
SELECT c.cname, MAX(d.amount) AS max_deposit
	FROM customer c
	JOIN deposite d ON c.cname = d.cname
	WHERE c.city = 'Pune'
	GROUP BY c.cname;
SELECT COUNT(DISTINCT city) AS total_customer_cities FROM customer;
SELECT MAX(borrow.amount) AS max_loan_amount
	FROM borrow
	JOIN branch ON borrow.bname = branch.bname
	WHERE branch.city = 'Pune';
SELECT SUM(amount) AS total_loan_amount FROM borrow;
UPDATE deposite d
JOIN branch b ON d.bname = b.bname
SET d.amount = d.amount * 1.1
WHERE b.city = 'Pune';
SELECT *
FROM deposite d
JOIN branch b ON d.bname = b.bname
WHERE b.city = 'Pune';
UPDATE deposite d
SET amount = amount * 1.10
WHERE d.cname IN (SELECT c.cname FROM customer c WHERE c.city = 'Nagpur');
SELECT d.account_no, d.cname, d.bname, d.amount, d.adate
	FROM deposite d
	JOIN customer c ON d.cname = c.cname
	WHERE c.city = 'Nagpur';
UPDATE deposite SET bname = 'hadapsar' WHERE bname = 'katraj';
select * from deposite;
DELETE FROM borrow WHERE bname = 'katraj';
select * from borrow;
SELECT d.bname AS branch_name, SUM(d.amount) AS total_deposits
	FROM deposite d
	GROUP BY d.bname
	HAVING SUM(d.amount) > 5000;
SELECT * FROM deposite ORDER BY amount DESC;