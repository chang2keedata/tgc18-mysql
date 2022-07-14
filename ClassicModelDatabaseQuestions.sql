-- Use the classicmodels database for the questions below:
-- 1 - Find all the offices and display only their city, phone and country
SELECT city, phone, country FROM offices;

-- 2 - Find all rows in the orders table that mentions FedEx in the comments.
SELECT * FROM orders where comments like '%fedex%';

-- 3 - Show the contact first name and contact last name of all customers in descending order by the customer's name
SELECT contactFirstName, contactLastName, customerName FROM customers order by customerName desc;

-- 4 - Find all sales rep who are in office code 1, 2 or 3 and their first name or last name contains the substring 'son'
SELECT * FROM employees where jobTitle = 'sales rep' and (firstName like '%son%' or lastName like '%son%');

-- 5 - Display all the orders bought by the customer with the customer number 124, along with the customer name, the contact's first name and contact's last name.
SELECT orderNumber, customerName, contactLastName, contactFirstName FROM customers join orders
    on customers.customerNumber = orders.customerNumber
    where customers.customerNumber = 124;

-- 6 - Show the name of the product, together with the order details,  for each order line from the orderdetails table
SELECT orderLineNumber, products.productName FROM orderdetails
    left join orders on orderdetails.orderNumber = orders.orderNumber
    join products on orderdetails.productCode = products.productCode
    order by orderLineNumber asc;
