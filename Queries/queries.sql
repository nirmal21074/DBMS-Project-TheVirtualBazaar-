SELECT P.Product_Name,S.Store_Product_ID AS Product_ID, CONCAT(R.FirstName, " ", R.LastName) AS Retailer_FullName,S.Store_Retailer_ID AS Retailer_ID FROM Store AS S LEFT JOIN Product as P ON P.Product_ID=S.Store_Product_ID  LEFT JOIN Retailer as R ON R.Retailer_ID=S.Store_Product_ID;

SELECT CONCAT(R.FirstName, " " , R.LastName) AS Retailer_FullName, R.Address, C.Category_ID, C.Category_Name, P.Product_Availability 
FROM Store AS S  LEFT JOIN Product AS P ON S.Store_Product_ID = P.Product_ID  LEFT JOIN Retailer AS R ON S.Store_Retailer_ID = R.Retailer_ID  LEFT JOIN Category AS C ON C.Category_ID = P.Product_Category_ID;


SELECT O.Ordered_date, COUNT(cart.Cart_Customer_ID), O.Total_Charges, O.Order_Customer_ID, CONCAT(C.FirstName, ' ', C.LastName) AS Customer_FullName, P.Product_Name  FROM Final_Order as O 
INNER JOIN Customer AS C ON Customer_ID=Order_Customer_ID 
INNER JOIN CART as cart ON cart.Cart_Customer_ID=Customer_ID 
INNER JOIN Product as P ON P.Product_ID=O.Order_Product_ID  GROUP BY O.Ordered_date, O.Total_Charges, O.Order_Customer_ID, Customer_FullName, P.Product_Name;


SELECT A.FirstName AS customerName1, B.FirstName As customerName2, A.Street_number FROM Customer A, Customer B WHERE A.Customer_ID <> B.Customer_ID AND A.Street_number = B.Street_number ORDER BY A.Street_number;

SELECT customer.Customer_ID, CONCAT(customer.FirstName, ' ', customer.LastName) AS CustomerName, customer.Age, ROUND(SUM(P.Product_price_in$),2) AS Total_Price, ROUND(SUM(P.Product_price_in$* (1 - P.Product_discount / 100)),2) AS Discounted_Price FROM Cart AS C LEFT JOIN Product AS P ON P.Product_ID=C.Cart_Product_ID LEFT JOIN Customer AS customer ON customer.Customer_ID=C.Cart_Customer_ID WHERE customer.Age >18 GROUP BY customer.Customer_ID HAVING Customer_ID<75;


SELECT R.Retailer_ID, CONCAT(R.FirstName, " " , R.LastName) AS Retailer_FullName, COUNT(S.Store_Product_ID) AS Number_Of_Products FROM Retailer AS R RIGHT JOIN Store AS S ON S.Store_Retailer_ID=R.Retailer_ID GROUP BY R.Retailer_ID ORDER BY Retailer_ID;


SELECT Product_ID,Product_Name, Product_Price_in$ FROM Product WHERE Product_Price_in$> (SELECT AVG(Product_Price_in$) FROM Product);

SELECT ROUND(AVG(O.Order_Total),2) AS AverageOrderValue
FROM ( SELECT C.Customer_ID, COUNT(*) AS OrderCount, ROUND(SUM(O.Total_Charges),2) AS Order_Total FROM Final_Order AS O LEFT JOIN Customer C ON O.Order_Customer_ID = C.Customer_ID GROUP BY C.Customer_ID) AS O WHERE OrderCount >= 2;


SELECT COUNT(cart.Cart_Product_ID), cart.Cart_Customer_ID as Customer_ID, CONCAT(C.FirstName, ' ', C.LastName) AS Customer_FullName FROM Cart as cart JOIN Customer AS C ON C.Customer_ID = cart.Cart_Customer_ID GROUP BY cart.Cart_Customer_ID;

SELECT D.Delivery_Customer_ID, D.Delivery_Order_ID, D.Delivery_Person_ID, C.FirstName, C.LastName, D.date FROM delivery AS D JOIN customer AS C ON C.Customer_ID = D.Delivery_Customer_ID;

SELECT COUNT(*), Login_Type FROM Login GROUP BY Login_Type ORDER BY Login_Type DESC;


SELECT * FROM Customer WHERE Age>50 ORDER BY LastName DESC;

UPDATE Customer SET FirstName = 'Nirmal', State = 'New-Delhi' WHERE Customer_ID = 1;

SELECT COUNT(*), Gender From Delivery_Person GROUP BY Gender;

SELECT Retailer.FirstName,Retailer.Retailer_ID From Retailer WHERE EXISTS (SELECT Product_name FROM Product WHERE Product.Product_ID = Retailer.Retailer_ID AND Product_price_in$ > 1 );

SELECT C.FirstName, C.Phone From Customer C LEFT JOIN Final_Order o ON C.Customer_ID = o.Order_Customer_ID  WHERE o.Order_ID IS NULL;

SELECT p.Product_name, COUNT(ol.Order_Product_ID) as total_quantity FROM Product p INNER JOIN Final_Order ol ON p.Product_ID = ol.Order_Product_ID GROUP BY p.Product_ID ORDER BY total_quantity DESC LIMIT 5;

SELECT COUNT(*), state FROM Customer GROUP BY State HAVING State LIKE  "b%" OR  "c%" ORDER BY state;

ALTER TABLE Retailer ADD City varchar(100);

SELECT DISTINCT Product_Name, COUNT(Product_Name) AS NumberOf, MIN(Product_Price_in$) AS Min_Price FROM Product WHERE Product_Price_in$ < (SELECT MAX(Product_Price_in$) FROM Product WHERE Product_Price_in$ NOT BETWEEN 3 AND 5 AND Product_Name NOT IN ('Television','Shoes','Dress')) AND  Product_Name LIKE '%s' GROUP BY Product_Name;

SELECT D.Delivery_Person_ID, Dp.FirstName AS DeliveryPerson_Name, O.Total_Charges FROM delivery AS D INNER JOIN Final_Order AS O ON D.Delivery_Order_ID=O.Order_ID INNER JOIN Delivery_Person AS Dp ON Dp.Delivery_Person_ID=D.Delivery_Person_ID;

SELECT DISTINCT p2.* FROM Product p1 JOIN Product p2 ON p1.Product_ID = p2.Product_ID WHERE p1.Product_Availability = 'YES' AND p2.Product_Category_ID != '4';

