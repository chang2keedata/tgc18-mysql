-- %sales% match AS long AS the word 'sales' appear anywhere in jobTitle
SELECT * FROM employees WHERE jobTitle LIKE '%sales%';
SELECT * FROM employees WHERE jobTitle LIKE 'sales%';
SELECT * FROM employees WHERE jobTitle LIKE '%sales';

-- AND OR
SELECT * FROM employees WHERE jobTitle LIKE 'sales rep' AND (officeCode = 1 or officeCode = 2);
SELECT * FROM customers WHERE (country = 'USA' AND state = 'NV' AND creditLimit > 5000)
    OR creditLimit > 200000;

-- inner JOIN (show all FROM both tables: employess.*, offices.*)
SELECT * FROM employees e JOIN offices o ON e.officeCode = o.officeCode WHERE country = 'USA';

SELECT firstName, lastName, customerName, salesRepEmployeeNumber, employeeNumber FROM customers c 
    JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber;

SELECT customerName AS 'Customer Name', customers.country AS 'Customer Country', firstName, lastName, offices.phone
FROM customers
JOIN employees
    ON customers.salesRepEmployeeNumber = employees.employeeNumber
JOIN offices
    ON employees.officeCode = offices.officeCode
WHERE customers.country = 'USA';

-- date manipulation
-- current date in server
SELECT curdate();
-- the date and time
SELECT now();
-- select after 30th June 2000
select * from payments WHERE payemntDate > '2000-06-30';
select * from payments WHERE payemntDate BETWEEN '2000-06-30' AND '2000-07-31';

-- show all payments made in the year 2000
SELECT checkNumber, YEAR(payemntDate), MONTH(payemntDate), DAY(payemntDate) FROM payments
    WHERE YEAR(paymentDate) = 2000;

-- aggreagate functions
-- count how many rows 
SELECT count(*) FROM employees;

-- sum, avg
SELECT sum(quantityOrdered * priceEach) FROM orderdetails WHERE productCode = 'S18_1749';

-- find the total amount paid BY customers in the month of June 2013
SELECT sum(amount) FROM payments WHERE month(paymentDate) = 6 and year(paymentDate) = 2003;

-- COUNT(*) count how many customers in each country GROUP
SELECT country, count(*) AS total FROM customers GROUP BY country;
SELECT country, avg(creditLimit), count(*) FROM customers GROUP BY country;

-- HAVING
SELECT country,
         firstName,
         lastName,
         email,
         avg(creditLimit),
         count(*)
FROM customers
JOIN employees
    ON customers.salesRepEmployeeNumber = employees.employeeNumber
WHERE salesRepEmployeeNumber = 1504
GROUP BY  country
HAVING count(*) >= 3 
ORDER BY  avg(creditLimit) DESC
LIMIT 3

-- intermediate level
-- SUBQUERY
SELECT * FROM customers WHERE crediLimit > (SELECT avg(creditLimit) FROM customers);

SELECT * FROM products WHERE productCode NOT in (SELECT distinct(productCode) FROM orderdetails);

SELECT firstname, lastName, employeeNumber, sum(amount) FROM employees
JOIN customers ON employees.employeeNumber = customers.salesRepEmployeeNumber
JOIN payments ON customers.customerNumber = payments.customerNumber
GROUP BY employees.employeeNumber
HAVING sum(amount) > (SELECT sum(amount) * 0.1 FROM payments);

