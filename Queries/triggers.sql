-- T1. To assign a delivery person(add row to <delivery> table) when final_order is placed by customer(row is added to <final_order> table).

DELIMITER $
CREATE TRIGGER add_delivery 
AFTER INSERT ON final_order
FOR EACH ROW 
BEGIN 
INSERT INTO delivery (delivery_person_id, delivery_customer_id, delivery_order_id, date) 
VALUES ((FLOOR(RAND() * 100) + 1), NEW.order_customer_id, NEW.order_id, DATE_ADD(NEW.ordered_date, INTERVAL 7 DAY)); 
END $
DELIMITER  ;

-- T2. To decrease quantity of product by 1, whenever a product is added to cart, by a customer.

DELIMITER $ 
CREATE TRIGGER dec_quantity
AFTER 
INSERT ON Cart 
FOR EACH ROW 
BEGIN 
UPDATE Product 
SET Product_Quantity = Product_Quantity - NEW.Cart_Product_Quantity 
WHERE Product_ID = NEW.Cart_Product_ID;
END $
DELIMITER ;

-- T3. To give an error and not implement insertion into cart, if stock_quantity is less than quantity asked by customer.

DELIMITER $ 
CREATE TRIGGER check_stock_quantity 
BEFORE 
INSERT ON cart 
FOR EACH ROW 
BEGIN 
IF (SELECT product_quantity FROM product WHERE product_id = NEW.cart_product_id) < NEW.cart_product_quantity THEN 
SIGNAL SQLSTATE '45000' 
SET MESSAGE_TEXT = 'Product out of stock'; 
END IF; 
END $ 
DELIMITER ;
