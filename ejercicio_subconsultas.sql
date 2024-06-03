/*** Ejercicio de Subconsultas ***/
/***Obtener a los empleados que lograron vender más cantidad de unidades que el promedio***/

USE users;

SELECT FirstName, LastName,
(SELECT SUM(od.Quantity) FROM orders AS o, OrderDetails AS od
WHERE o.EmployeeID = e.EmployeeID AND od.orderID = o.orderID) as unidades_totales
FROM Employees AS e
WHERE unidades_totales > (SELECT AVG (unidades_totales) FROM (
SELECT (SELECT SUM(od.Quantity) FROM orders AS o, OrderDetails AS od
WHERE o.EmployeeID = e2.EmployeeID AND od.orderID = o.orderID) as unidades_totales FROM Employees AS e2
GROUP BY e2.EmployeeID
));