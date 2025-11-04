USE northwind;

SELECT city, CompanyName, ContactName
FROM customers
WHERE city LIKE "A%" OR city LIKE "B%";

SELECT c.city, c.CompanyName, c.ContactName, COUNT(o.OrderID) AS numero_pedidos
FROM customers AS c
LEFT JOIN orders AS o
ON c.CustomerID = o.CustomerID
WHERE city LIKE "L%"
GROUP BY c.CustomerID;

SELECT ContactName, ContactTitle, CompanyName
FROM customers
WHERE ContactTitle NOT LIKE "%Sales%";

SELECT ContactName
FROM customers
WHERE ContactName NOT LIKE "_A%";

SELECT City, CompanyName, ContactName, "customers" AS Relationship
FROM customers
UNION
SELECT City, CompanyName, ContactName, "suppliers" AS Relationship
FROM suppliers
ORDER BY City;

SELECT CategoryName
FROM categories
WHERE Description LIKE "%sweet%";

SELECT concat(FirstName, " ", LastName) AS nombre 
FROM employees
UNION
SELECT ContactName
FROM customers;



