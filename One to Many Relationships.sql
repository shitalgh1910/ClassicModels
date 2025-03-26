USE classicmodels; 
-- 1. Who are the account representatives for each customer?
-- Here we retrieve a list of customers along with their assigned account representative
SELECT c.customerNumber,c.customerName, CONCAT_WS(' ',e.firstName, e.lastName) AS 'Account Representative'
FROM customers as c
JOIN employees e
ON c.salesRepEmployeeNumber=e.employeeNumber;

-- 2. What is the total payment made bby Atelier graphique?
-- Lets try to find the total amount paid by a specific customer
SELECT c.customerName, c.customerNumber, sum(p.amount) 
FROM customers c
JOIN payments p
ON c.customerNumber=p.customerNumber
WHERE c.customerName='Atelier graphique'
GROUP BY c.customerName;

-- 3. What is the total payment received on each payment date?
-- Lets find out all payments by date and sum up the amount received on each date
SELECT paymentDate, sum(amount) as 'Total Sum' 
FROM payments 
GROUP BY paymentDate
ORDER BY paymentDate;

-- 4. Which products have not been sold?
-- Lets identify products in the inventory that have never been ordered

SELECT productName FROM products
WHERE productCode NOT IN(SELECT DISTINCT productCode FROM orderdetails);
-- To validate with join statement

SELECT * FROM products
LEFT JOIN orderdetails ON products.productCode=orderdetails.productCode
WHERE orderNumber IS NULL;

-- 5. How much has each customer paid in total?
SELECT C.customerName, sum(P.amount) AS 'Total Paid'
FROM customers C
JOIN payments P
ON c.customerNumber=p.customerNumber
GROUP BY customerName
ORDER BY sum(P.amount);

-- 6. How many orders have been placed by Herkku Gifts?
SELECT COUNT(O.customerNumber) AS 'Number of orders', c.customerName
FROM customers c
JOIN orders O
ON c.customerNumber=O.customerNumber
WHERE c.customerName='Herkku Gifts'
GROUP BY c.customerName;
