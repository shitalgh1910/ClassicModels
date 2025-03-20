show databases;
USE classicmodels;
SHOW tables;
-- 1. Prepare a list of offices sorted by country, state, city
SELECT * FROM offices
ORDER BY country, state, city;

-- 2. How many employees are there in the company?

SELECT COUNT(*)
FROM employees;
-- There are 23 Employees in the company.alter

-- 3. What is the total of payments received?
SELECT SUM(amount)
FROM payments;
-- Total sum of 8852839.23 was received.
-- 4. List the product lines that contains Cars
SELECT productLine
FROM productlines
WHERE productLine LIKE '%cars%';
-- 5 Total payment for octor 28 2004

SELECT SUM(amount) FROM payments
WHERE paymentDate='2004-10-28';

-- 6 Which payments are greater than $100000?
SELECT * FROM payments
WHERE amount>100000;

-- 7 What are the products listed in each prodcut line?
SELECT DISTINCT productLine from productLines;

-- 8 How many products are in each product line?
SELECT productLine, COUNT(*) 
FROM products 
GROUP BY productLine;

-- 9 what is the minimum payment amount received?
SELECT MIN(amount) as minimum_amount FROM payments;

SELECT amount as minimum_amount FROM payments ORDER BY amount LIMIT 1;

-- 10. Which payment are greater that twice the average payment amount?
SELECT amount AS payment FROM payments WHERE amount>2*(SELECT AVG(amount) FROM payments) ORDER BY payment;

-- 11. WHat is the avegrage percentage markup of the MSRP on buy price?
SELECT AVG(((MSRP-buyPrice)/buyPrice)*100) FROM products;

-- 12. How many distinct products does classciModels sell?
SELECT DISTINCT( productName), COUNT(*) FROM products
GROUP BY productName;

-- 13. report the name and city of customers who don't have sales representative
SELECT customerName, city FROM customers
WHERE salesRepEmployeeNumber IS NULL;

-- 14. Which executives have a VP or Manager title, including their full name?
SELECT CONCAT_WS(' ',firstName, lastName) as 'Full Name', jobTitle as Title
FROM employees
WHERE (jobTitle LIKE '%VP%') OR (jobTitle LIKE '%Manager%');

-- 15. Which Order Have Values greater than 50000?
SELECT a
WHERE amount>5000 ORDER BY AMOUNT;





