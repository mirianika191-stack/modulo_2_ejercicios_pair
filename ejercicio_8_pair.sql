USE `northwind`;

SELECT MAX(list_price) AS high_price, MIN(list_price) AS lower_price
FROM products;

SELECT COUNT(DISTINCT product_code) AS cantidad_productos, AVG(list_price)
FROM products;

SELECT product_name, list_price
FROM products
WHERE list_price >(
	SELECT AVG(list_price)
    FROM products);

SELECT product_name, list_price
FROM products
WHERE list_price >15.84577778
ORDER BY list_price DESC;

SELECT COUNT(product_name) AS productos_descontinuados
FROM products
WHERE discontinued = 1;

SELECT id, product_name
FROM products
WHERE discontinued = 0
ORDER BY id ASC
LIMIT 10;




