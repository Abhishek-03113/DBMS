create database assign_4;
use assign_4;

create table borrower (roll_no int, name varchar(50), date_of_issue date, name_of_book varchar(50), status varchar(10));
insert into borrower value (1, "Aniket", "2023-7-12", "Interstellar", "I"),
	(2, "Rajiv", "2023-7-16", "Kadambari", "I"),
    (3, "Shantanu", "2023-6-12", "Mahabharat", "I"),
    (4, "Sarth", "2023-8-17", "TENET", "I"),
    (5, "Aditya", "2023-7-18", "DBMS", "I"),
    (6, "Varad", "2023-6-21", "AI", "I"),
    (7, "Abhishek", "2023-8-22", "VR", "I"),
    (8, "Suraj", "2023-8-25", "AR", "I"),
    (9, "Sourabh", "2023-8-12", "PR", "I"),
    (10, "Avinash", "2023-6-19", "Marvel", "I");
    
select * from borrower;
    
create table fine (roll_no int, Idate date, amt varchar(30));

DELIMITER $

CREATE PROCEDURE CalculateFine(IN p_roll_no INT, IN p_name_of_book VARCHAR(100))
BEGIN
    DECLARE v_date_of_issue DATE;
    DECLARE v_days_late INT;
    DECLARE v_fine_amt INT;

    -- Fetch date_of_issue and status of the book for the given roll_no and name_of_book
    SELECT date_of_issue INTO v_date_of_issue FROM Borrower
    WHERE roll_no = p_roll_no AND name_of_book = p_name_of_book;

    -- Calculate the number of days late
    SET v_days_late = DATEDIFF(CURRENT_DATE, v_date_of_issue);

    IF v_days_late > 30 THEN
        SET v_fine_amt = v_days_late * 50;
    ELSE
        SET v_fine_amt = v_days_late * 5;
    END IF;

    -- Update the status of the book
    UPDATE Borrower
    SET status = 'R'
    WHERE roll_no = p_roll_no AND name_of_book = p_name_of_book;

    -- Insert fine details into the Fine table if applicable
    IF v_days_late >= 15 THEN
        INSERT INTO Fine (roll_no, Idate, amt)
        VALUES (p_roll_no, CURRENT_DATE, v_fine_amt);
    END IF;

    -- Display results
    SELECT CONCAT('Fine Amount: Rs ', v_fine_amt) AS message;
    SELECT 'Book status changed to R' AS message;

END;
$

DELIMITER ;

CALL CalculateFine(1, 'Interstellar');
CALL CalculateFine(2, 'Kadambari');
CALL CalculateFine(3, 'Mahabharat');
CALL CalculateFine(4, 'TENET');
CALL CalculateFine(5, 'DBMS');
CALL CalculateFine(6, 'AI');
CALL CalculateFine(7, 'VR');
CALL CalculateFine(8, 'AR');
CALL CalculateFine(9, 'PR');
CALL CalculateFine(10, 'Marvel');

select * from borrower;