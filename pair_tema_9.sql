USE northwind;

SELECT  c.CompanyName AS nombre_empresa, c.CustomerID AS Identificador, COUNT(o.OrderID) AS num_pedidos
	FROM customers AS c
    INNER JOIN orders AS o
		ON c.CustomerID = o.CustomerID
    WHERE c.Country = "UK"
	GROUP BY c.CustomerID;
    
SELECT c.CompanyName AS nombre_empresa, YEAR(o.OrderDate) AS año, SUM(od.Quantity) AS cantidad_anual
	FROM customers AS c
	INNER JOIN orders AS o
		ON c.CustomerID = o.CustomerID
	INNER JOIN orderdetails AS od
		ON od.OrderID = o.OrderID
	WHERE c.Country = "UK"  
    GROUP BY c.CompanyName, YEAR(o.OrderDate);
 
 SELECT o.OrderID, c.CompanyName AS nombre_empresa, o.OrderDate AS fecha
	FROM orders AS o
    INNER JOIN customers AS c
		ON c.CustomerID = o.CustomerID
	WHERE c.Country = "UK";  
    
 
    