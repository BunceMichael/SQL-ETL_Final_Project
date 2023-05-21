CREATE FUNCTION Order_Info_From_Email (@email VARCHAR(255))
RETURNS TABLE AS
RETURN
	SELECT O.order_date, O.order_id, C.first_name, C.last_name , O.shipping_street, O.shipping_city, O.shipping_state, O.shipping_zip, 
	P.product_name, I.quantity, I.unit_price
	FROM customers C
	INNER JOIN orders O ON C.customer_id = O.customer_id
	FULL JOIN order_items I on O.order_id = I.order_id
	FULL JOIN products P on I.product_id = P.product_id
	WHERE C.email = @email;