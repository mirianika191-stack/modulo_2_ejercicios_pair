USE northwind;

SELECT e1.City, e1.FirstName, e1.LastName, e2.City, e2.FirstName, e2.LastName
FROM employees AS e1
LEFT JOIN employees AS e2
ON e1.EmployeeID = e2.EmployeeID;

SELECT e1.City, e1.FirstName, e1.LastName, e2.City, e2.FirstName, e2.LastName
FROM employees AS e1, employees AS e2
WHERE e1.EmployeeID <> e2.EmployeeID;


SELECT e1.EmployeeID, e1.City, e1.FirstName, e1.LastName, e1.ReportsTo, e2.EmployeeID, e2.City, e2.FirstName, e2.LastName
FROM employees AS e1
LEFT JOIN employees AS e2
ON e1.ReportsTo = e2.EmployeeID;


SELECT e1.City, e1.FirstName AS nombre_empleado, e1.LastName, e2.City, e2.FirstName AS nombre_jefa, e2.LastName
FROM employees AS e1
LEFT JOIN employees AS e2
ON e1.ReportsTo = e2.EmployeeID;


SELECT c.CategoryName, p.ProductName
FROM categories AS c
LEFT JOIN products AS p
ON c.CategoryID = p.CategoryID;

SELECT c.CategoryName, p.ProductName
FROM products  AS p
RIGHT JOIN categories  AS c
ON c.CategoryID = p.CategoryID;

SELECT o.OrderID AS pedidos, c.CompanyName AS nombre_empresa
FROM orders AS o
LEFT JOIN customers AS c
ON c.CustomerID = o.CustomerID;

SELECT *
FROM orders AS o
LEFT JOIN customers AS c
ON c.CustomerID = o.CustomerID;


