USE northwind;

SELECT ProductID, ProductName, CategoryID
FROM products
WHERE CategoryID IN (SELECT CategoryID
					 FROM categories 
                     WHERE CategoryName = "beverages");
                     
SELECT Country
FROM customers 
WHERE Country NOT IN (SELECT Country
						FROM suppliers)
GROUP BY Country;      

                  
SELECT Country
FROM customers 
GROUP BY Country
HAVING Country NOT IN (SELECT Country
						FROM suppliers);   


SELECT CustomerID, OrderID
FROM orders
WHERE OrderID IN (SELECT OrderID
					FROM orderdetails
					WHERE Quantity >20
							AND ProductID = (SELECT ProductID
											FROM products
											WHERE ProductName = "Grandma's Boysenberry Spread"));
                                            
								
SELECT o.OrderID, o.CustomerID, o.EmployeeID, o.OrderDate, o.RequiredDate
FROM orders AS o
WHERE o.OrderDate = (SELECT MAX(OrderDate)
						FROM orders AS o2
						WHERE o.EmployeeID = o2.EmployeeID);
                        
# Qué producto es más popular: Extraed cuál es el producto que más ha sido comprado y la cantidad que se compró.
                      
SELECT 
    ProductID,
    COUNT(DISTINCT OrderID) AS VecesComprado,
    SUM(Quantity) AS TotalUnidades
FROM 
    orderdetails
GROUP BY 
    ProductID
HAVING 
    COUNT(DISTINCT OrderID) = (
        SELECT 
            MAX(PedidosPorProducto)
        FROM (
            SELECT 
                ProductID,
                COUNT(DISTINCT OrderID) AS PedidosPorProducto
            FROM 
                orderdetails
            GROUP BY 
                ProductID
        ) AS sub
    );