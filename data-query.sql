-- %sales% match as long as the word 'sales' appear anywhere in jobTitle
SELECT * FROM employees WHERE jobTitle LIKE '%sales%';
SELECT * FROM employees WHERE jobTitle LIKE 'sales%';
SELECT * FROM employees WHERE jobTitle LIKE '%sales';

-- AND OR
SELECT * FROM employees WHERE jobTitle LIKE 'sales rep' AND (officeCode = 1 or officeCode = 2);
SELECT * FROM customers WHERE (country = 'USA' AND state = 'NV' AND creditLimit > 5000)
    OR creditLimit > 200000;

-- inner join
SELECT * FROM employees e JOIN offices o ON e.officeCode = o.officeCode WHERE country = 'USA';
SELECT firstName, lastName, customerName, salesRepEmployeeNumber, employeeNumber FROM customers c 
    join employees e on c.salesRepEmployeeNumber = e.employeeNumber;


SELECT customerName AS 'Customer Name', customers.country AS 'Customer Country', firstName, lastName, offices.phone
FROM customers
JOIN employees
    ON customers.salesRepEmployeeNumber = employees.employeeNumber
JOIN offices
    ON employees.officeCode = offices.officeCode
WHERE customers.country = 'USA';

-- date manipulation
-- current date in server
select curdate();
-- the date and time
select now();
-- select after 30th June 2000
select * from payments where payemntDate > '2000-06-30';
select * from payments where payemntDate BETWEEn '2000-06-30' AND '2000-07-31';
-- show all payments made in the year 2000 
select checkNumber, YEAR(payemntDate), MONTH(payemntDate), DAY(payemntDate) from payments
    WHERE YEAR(paymentDate) = 2000;


