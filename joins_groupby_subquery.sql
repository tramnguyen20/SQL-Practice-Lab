--Câu 1:
SELECT o.orderid, o.orderdate, o.custid, o.shipperid, d.productid, d.qty, d.unitprice
FROM orders o
JOIN orderDetails d
ON o.orderid = d.orderid
WHERE o.orderid = 10424

--Câu 2:
SELECT o.shipperid, d.productid, SUM(d.qty) as TotalQuantity
FROM orders o
JOIN orderDetails d
ON o.orderid = d.orderid
GROUP BY o.shipperid, d.productid
ORDER BY TotalQuantity DESC;

--Câu 3:
SELECT YEAR(orderdate) as OrderYear, custid, COUNT(orderid) as OrderCount
FROM orders
GROUP BY YEAR(orderdate), custid
ORDER BY YEAR(orderdate), OrderCount DESC;

--Câu 4:
SELECT c.custid
FROM Customers c
WHERE 
	NOT EXISTS (
        SELECT *
        FROM orders o
        WHERE o.custid = c.custid);

--Câu 5:
SELECT o.orderid, o.orderdate, o.custid, SUM(d.qty * d.unitprice) as TotalAmount
FROM orders o
JOIN orderDetails d
ON o.orderid = d.orderid
GROUP BY o.orderid, o.orderdate, o.custid
HAVING SUM(d.qty * d.unitprice) > (
		SELECT SUM(qty * unitprice)
        FROM orderDetails
        WHERE orderid = 10424)
ORDER BY TotalAmount DESC;
