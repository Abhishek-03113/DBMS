create database assign6;

use assign6;

create table Stud_Info(RNo int(3) PRIMARY KEY, Name varchar(20), Address varchar(40));
INSERT INTO Stud_Info VALUES
(1, 'Rajesh Kumar', 'Navjivan Society, Mumbai'),
(2, 'Priya Gupta', 'DLF City, Delhi'),
(3, 'Anjali Sharma', 'Jamli Naka, Mumbai'),
(4, 'Amit Verma', 'Saligramam, Chennai'),
(5, 'Sunita Singh', 'Shanti Nagar, Mumbai'),
(6, 'Manish Gupta', 'Thakurdwar, Mumbai'),
(7, 'Neha Patel', 'Chembur, Mumbai'),
(8, 'Akash Joshi', 'Rajgor Chambers, Mumbai'),
(9, 'Sapna Shah', 'Ellisbridge, Ahmedabad');

create table Stud_Marks (RNo int PRIMARY KEY, DBMS int(2), TOC int(2), CN int(2));
insert into Stud_Marks values (1,76,81,85), (2,82,81,89), (3,88,69,90), (4,90,82,95), (5,85,70,65), (6,95,80,97), (7,82,66,90), (8,91,92,96), (9,89,78,88);
DELIMITER $
CREATE PROCEDURE CalculateAverageScoresImplicit()
 BEGIN
 DECLARE done INT DEFAULT 0;
 DECLARE studentRNo INT;
 DECLARE studentName VARCHAR(20);
 DECLARE studentAddress VARCHAR(40);
 DECLARE dbmsScore INT;
 DECLARE tocScore INT;
 DECLARE cnScore INT;
 DECLARE avgScore DECIMAL(5, 2);
 DECLARE cur CURSOR FOR SELECT SI.RNo, SI.Name, SI.Address, SM.DBMS, SM.TOC, SM.CN
 FROM Stud_Info SI
 JOIN Stud_Marks SM ON SI.RNo = SM.RNo;
 DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
 OPEN cur;
 read_loop: LOOP
 FETCH cur INTO studentRNo, studentName, studentAddress, dbmsScore, tocScore, cnScore;
 IF done THEN
 LEAVE read_loop;
 END IF;
 SET avgScore = (dbmsScore + tocScore + cnScore) / 3;
 SELECT studentRNo, studentName, studentAddress, avgScore;
 END LOOP;
 CLOSE cur;
 END$

CREATE PROCEDURE CalculateAverageScoresExplicit()
 BEGIN
 DECLARE done INT DEFAULT 0;
 DECLARE studentRNo INT;
 DECLARE studentName VARCHAR(20);
 DECLARE studentAddress VARCHAR(40);
 DECLARE dbmsScore INT;
 DECLARE tocScore INT;
 DECLARE cnScore INT;
 DECLARE avgScore DECIMAL(5, 2);
 DECLARE cur CURSOR FOR SELECT SI.RNo, SI.Name, SI.Address, SM.DBMS, SM.TOC, SM.CN
 FROM Stud_Info SI
 JOIN Stud_Marks SM ON SI.RNo = SM.RNo;
 DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
 OPEN cur;
 read_loop: LOOP
 FETCH cur INTO studentRNo, studentName, studentAddress, dbmsScore, tocScore, cnScore;
 IF done THEN
 LEAVE read_loop;
 END IF;
 SET avgScore = (dbmsScore + tocScore + cnScore) / 3;
 SELECT studentRNo, studentName, studentAddress, avgScore;
 END LOOP;
 CLOSE cur;
 END$
 
 CREATE PROCEDURE CalculateAverageScoresUsingCursorForLoop()
 BEGIN
 DECLARE done INT DEFAULT 0;
 DECLARE studentRNo INT;
 DECLARE studentName VARCHAR(20);
 DECLARE studentAddress VARCHAR(40);
 DECLARE avgScore DECIMAL(5, 2);
 DECLARE cur CURSOR FOR SELECT RNo, Name, Address FROM
 Stud_Info;
 DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
 OPEN cur;
 read_loop: LOOP
 FETCH cur INTO studentRNo, studentName, studentAddress;
 IF done THEN
 LEAVE read_loop;
 END IF;
 SELECT studentRNo, studentName, studentAddress;
 SELECT AVG((DBMS + TOC + CN) / 3) INTO avgScore
 FROM Stud_Marks
 WHERE RNo = studentRNo;
 SELECT avgScore;
 END LOOP;
 CLOSE cur;
 END$
 
 CREATE PROCEDURE CalculateAverageScoresWithParameters (IN studentId INT)
BEGIN
DECLARE avgScore DECIMAL(5,2);
SELECT AVG ((DBMS + TOC + CN)/3) INTO avgScore
FROM Stud_Marks 
WHERE RNO = studentId;
SELECT avgScore;
END$

CALL CalculateAverageScoreswithParameters(1)$
DELIMITER ;