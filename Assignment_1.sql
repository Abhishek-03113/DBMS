create database assign_1;
use  assign_1;

create table employee (ename varchar(50) primary key, city varchar(50));
INSERT INTO employee VALUES ("Aniket", "KOlhapur"), 
	("Shantanu", "Purandar"), 
	("Rajiv", "Pune"), 
	("Varad", "Baramati"), 
	("Sarth", "Kolhapur"), 
	("Aditya", "Satara"), 
	("Tanmay", "Nagpur"), 
	("Avishkar", "Baramati"), 
	("Srushti", "Ahmednagar"), 
	("Anurhuta", "Pune");
    
create table emp_company (ename varchar(50), cname varchar(50), salary int(10), jdate date, FOREIGN KEY (ename) REFERENCES employee(ename));
insert into emp_company value ("Aniket","TATA", 1300000, "2025-03-26"),
	("Shantanu","Bajaj",100000,"2025-08-27"),
    ("Rajiv","TATA",200000,"2025-09-12"),
    ("Varad","TCS",200000,"2025-07-25"),
    ("Sarth","TATA",300000,"2025-03-26"),
    ("Aditya","ACC",400000,"2025-01-26"),
    ("Tanmay","Bajaj",100000,"2025-05-27"),
    ("Avishkar","Wipro",200000,"2025-09-12"),
    ("Srushti","ACC",100000,"2025-07-30"),
    ("Anurhuta","ACC",100000,"2025-06-29");
    
create table company (cname varchar(50), city varchar(50));
insert into company value ("TATA", "Pune"),
	("Bajaj", "Pune"),
    ("Acc", "Mumbai"),
    ("TCS", "Mumbai"),
    ("Wipro","Pune");
    
create table manager (ename varchar(50), mname varchar(50) primary key);
insert into manager value ("Aniket","Rahul"),
	("Shantanu","Rohan"),
    ("Rajiv","Raj"),
    ("Varad","Vaishnav"),
    ("Sarth","Dinesh"),
    ("Aditya","Pawan"),
    ("Tanmay","Omkar"),
    ("Avishkar","Arpita"),
    ("Srushti","Shravani"),
    ("Anurhuta","Isha");
    
create table emp_shift (ename varchar(50), shift varchar(20));
insert into emp_shift value ("Aniket","Day"),
	("Shantanu","Night"),
    ("Rajiv","Night"),
    ("Varad","Day"),
    ("Sarth","Day"),
    ("Aditya","Night"),
    ("Tanmay","Day"),
    ("Avishkar","Night"),
    ("Srushti","Night"),
    ("Anurhuta","Day");

select * from company where city="Pune";
select * from employee where city="Nagpur";
select ename from emp_company where cname="Acc" and salary>5000;
select ename from emp_company where cname!="Acc";
select ename from emp_company where cname="TATA" or cname="Bajaj";
select ename from emp_company where salary>200000 and salary<600000 and cname="TATA";
CREATE VIEW v1 AS
	SELECT e.ename, e.city
	FROM employee e
	JOIN emp_company ec ON e.ename = ec.ename
	JOIN company c ON ec.cname = c.cname AND e.city = c.city;
create view v2 as select employee.ename,employee.city,emp_company.salary from employee,emp_company where employee.ename = emp_company.ename;
CREATE INDEX idx_emp_company_ename ON emp_company (ename);
-- CREATE SYNONYM emp_company_synonym FOR emp_company; Cant create synonym in MySQL it can be only created in Oracle
ALTER TABLE company ADD state varchar(50);
UPDATE company SET state = 'Maharahstra' WHERE city = "Pune";
DELETE FROM manager;
DROP TABLE manager;