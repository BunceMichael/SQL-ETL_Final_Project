CREATE PROCEDURE Calculate_Total_Sales
	@Start_Date DATETIME,
	@End_Date DATETIME
AS
BEGIN
	SELECT ROUND(SUM(order_subtotal),2) AS Total_Sales
	FROM orders
	WHERE order_date BETWEEN @Start_Date AND @End_Date;
END