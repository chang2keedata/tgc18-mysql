-- Use the classicmodels database for the questions below:
-- 1 - Find all the offices and display only their city, phone and country
SELECT city, phone, country FROM offices;

-- 2 - Find all rows in the orders table that mentions FedEx in the comments.
SELECT * FROM orders where comments like '%fedex%';

-- 3 - Show the contact first name and contact last name of all customers in descending order by the customer's name
SELECT contactFirstName, contactLastName, customerName FROM customers order by customerName desc;

-- 4 - Find all sales rep who are in office code 1, 2 or 3 and their first name or last name contains the substring 'son'
SELECT * FROM employees where officeCode = 1 or officeCode = 2 or officeCode = 3)
and (firstName like '%son%' or lastName like '%son%') and jobTitle = 'sales rep' ;

-- 5 - Display all the orders bought by the customer with the customer number 124, along with the customer name, the contact's first name and contact's last name.
SELECT orderNumber, customerName, contactLastName, contactFirstName FROM customers join orders
    on customers.customerNumber = orders.customerNumber
    where customers.customerNumber = 124;

-- 6 - Show the name of the product, together with the order details, for each order line from the orderdetails table
SELECT orderLineNumber, products.productName FROM orderdetails
    left join orders on orderdetails.orderNumber = orders.orderNumber
    join products on orderdetails.productCode = products.productCode
    order by orderLineNumber asc;

-- 7 - Display sum of all the payments made by each company from the USA. 
SELECT customerName, sum(amount), country FROM customers join payments on customers.customerNumber = payments.customerNumber
where country = 'usa' group by customerName, country;

select payments.customerNumber, customerName, sum(amount) from payments
join customers on payments.customerNumber = customers.customerNumber group by payments.customerNumber, customerName

-- 8 - Show how many employees are there for each state in the USA
SELECT count(employeeNumber), state FROM employees
JOIN offices ON employees.officeCode = offices.officeCode WHERE country = 'usa' GROUP BY state

-- 9 - From the payments table, display the average amount spent by each customer. Display the name of the customer as well.
SELECT avg(amount), customerName FROM customers join payments on customers.customerNumber = payments.customerNumber
group by payments.customerNumber, customerName;

-- 10 - From the payments table, display the average amount spent by each customer but only if the customer has spent a minimum of 10,000 dollars.
SELECT avg(amount), customerName FROM customers join payments on customers.customerNumber = payments.customerNumber
group by payments.customerNumber, customerName having sum(amount) >= 10000;

-- 11  - For each product, display how many times it was ordered, and display the results with the most orders first and only show the top ten.
SELECT productCode, count(*) as times_ordered FROM orderdetails group by productCode order by count(*) desc limit 10;
