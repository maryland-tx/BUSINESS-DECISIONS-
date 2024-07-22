/* Top 5 individual orders with salesman ID*/
SELECT TOP 5
	ORDERS.OrderID
	, SUM([Order Details].UnitPrice * [Order Details].Quantity) Total 
	, Employees.EmployeeID
FROM [Order Details]
Join ORDERS
ON [Order Details].OrderID = Orders.OrderID 
Join Employees
ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY Employees.EmployeeID,ORDERS.OrderID
ORDER BY Total DESC



/* This provides the total of all orders for each sales person, 
based on highest to lowest orders.*/
SELECT 
     COUNT(Orders.OrderID)
	, SUM([Order Details].Quantity * [Order Details].UnitPrice) AS TotalOrder
	, Employees.EmployeeID
FROM Employees
INNER JOIN ORDERS
ON Employees.EmployeeID = Orders.EmployeeID 
INNER JOIN [Order Details]
ON Orders.OrderID = [Order Details].OrderID
GROUP BY (Employees.EmployeeID)
ORDER BY TotalOrder DESC


/*Challenge: How Many orders have been placed per Company*/

SELECT Customers.CompanyName
	, COUNT(Orders.OrderID) AS NumCount
FROM Orders
JOIN Customers
ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.CompanyName
ORDER BY NumCount DESC


/* Testing out if i can concat with group by*/
SELECT TOP 5
	ORDERS.OrderID
	, SUM([Order Details].UnitPrice * [Order Details].Quantity) Total 
	, CONCAT(Employees.LastName, ' ', Employees.FirstName) AS EmpName_Last_First
FROM [Order Details]
Join ORDERS
ON [Order Details].OrderID = Orders.OrderID 
Join Employees
ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY CONCAT(Employees.LastName, ' ', Employees.FirstName), Orders.OrderID
ORDER BY Total DESC







