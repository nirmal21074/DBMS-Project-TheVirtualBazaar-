Some SQL Queries:- 


1. Query for fetching product names for a particular retailer name, Id from the store.
	
SELECT P.Product_Name,S.Store_Product_ID AS Product_ID, CONCAT(R.FirstName, " ", R.LastName) AS Retailer_FullName,S.Store_Retailer_ID AS Retailer_ID FROM Store AS S LEFT JOIN Product as P ON P.Product_ID=S.Store_Product_ID LEFT JOIN Retailer as R ON R.Retailer_ID=S.Store_Product_ID;

2. Query for displaying retailer name, state, category id, category name, product availability for a particular product name.
	
SELECT CONCAT(R.FirstName, " " , R.LastName) AS Retailer_FullName, R.Address, C.Category_ID, C.Category_Name, P.Product_Availability 
FROM Store AS S 
LEFT JOIN Product AS P ON S.Store_Product_ID = P.Product_ID 
LEFT JOIN Retailer AS R ON S.Store_Retailer_ID = R.Retailer_ID 
LEFT JOIN Category AS C ON C.Category_ID = P.Product_Category_ID;

3. Query for displaying customer name, address, total charges, delivery_person, (product_ID for product purchased) for a particular order_id.

SELECT O.Ordered_date, COUNT(cart.Cart_Customer_ID), O.Total_Charges, O.Order_Customer_ID, CONCAT(C.FirstName, ' ', C.LastName) AS Customer_FullName, P.Product_Name  FROM Final_Order as O 
INNER JOIN Customer AS C ON Customer_ID=Order_Customer_ID 
INNER JOIN CART as cart ON cart.Cart_Customer_ID=Customer_ID 
INNER JOIN Product as P ON P.Product_ID=O.Order_Product_ID  GROUP BY O.Ordered_date, O.Total_Charges, O.Order_Customer_ID, Customer_FullName, P.Product_Name;

4. Query which matches the customers who are from the same street_number

SELECT A.FirstName AS customerName1, B.FirstName As customerName2, A.Street_number
FROM Customer A, Customer B
WHERE A.Customer_ID <> B.Customer_ID
AND A.Street_number = B.Street_number
ORDER BY A.Street_number;

5. Query to display total charges including delivery charges and discount per product for a particular order id.

SELECT customer.Customer_ID, CONCAT(customer.FirstName, ' ', customer.LastName) AS CustomerName, customer.Age, ROUND(SUM(P.Product_price_in$),2) AS Total_Price, ROUND(SUM(P.Product_price_in$* (1 - P.Product_discount / 100)),2) AS Discounted_Price FROM Cart AS C LEFT JOIN Product AS P ON P.Product_ID=C.Cart_Product_ID LEFT JOIN Customer AS customer ON customer.Customer_ID=C.Cart_Customer_ID WHERE customer.Age >18 GROUP BY customer.Customer_ID HAVING Customer_ID<75;

6. Query for Counting the number of total products added by a retailer, group by Retailer_ID.

SELECT R.Retailer_ID, CONCAT(R.FirstName, " " , R.LastName) AS Retailer_FullName, COUNT(S.Store_Product_ID) AS Number_Of_Products FROM Retailer AS R RIGHT JOIN Store AS S ON S.Store_Retailer_ID=R.Retailer_ID GROUP BY R.Retailer_ID ORDER BY Retailer_ID;


7. Query to display those product Ids and Names whose Price is greater than the Average ones.

SELECT Product_ID,Product_Name, Product_Price_in$ FROM Product WHERE Product_Price_in$> (SELECT AVG(Product_Price_in$) FROM Product);

8. Query to calculate average of total order value for sum of all the orders by customer when their order count is greater than 2.
SELECT ROUND(AVG(O.Order_Total),2) AS AverageOrderValue
FROM ( SELECT C.Customer_ID, COUNT(*) AS OrderCount, ROUND(SUM(O.Total_Charges),2) AS Order_Total FROM Final_Order AS O LEFT JOIN Customer C ON O.Order_Customer_ID = C.Customer_ID GROUP BY C.Customer_ID) AS O WHERE OrderCount >= 2;

9. Given the Customer_ID calculate it’s all the products in his/her cart and display product name, price for all products in cart.

SELECT COUNT(cart.Cart_Product_ID), cart.Cart_Customer_ID as Customer_ID, CONCAT(C.FirstName, ' ', C.LastName) AS Customer_FullName FROM Cart as cart JOIN Customer AS C ON C.Customer_ID = cart.Cart_Customer_ID GROUP BY cart.Cart_Customer_ID;

10. Query to delivery details of order and know which order will be delivered by which delivery_person, to which customer(name) on which date

SELECT D.Delivery_Customer_ID, D.Delivery_Order_ID, D.Delivery_Person_ID, C.FirstName, C.LastName, D.date FROM delivery AS D JOIN customer AS C ON C.Customer_ID = D.Delivery_Customer_ID;


11. Query for grouping different login types: retailer, customer, delivery person order by desc.

SELECT COUNT(*), Login_Type FROM Login GROUP BY Login_Type ORDER BY Login_Type DESC;


12. Query for Sorting the customers by their last names.

SELECT * FROM Customer WHERE Age>50 ORDER BY LastName DESC;

13. Query Using For Update Clause
UPDATE Customer
SET FirstName = 'Nirmal', State = 'New-Delhi'
WHERE Customer_ID = 1;

14. Query the Use of  GROUP BY Clause

SELECT COUNT(*), Gender From Delivery_Person GROUP BY Gender;

15. Query to return True and Retailer’s First name and Retailer_ID for product_price less than $2

SELECT Retailer.FirstName,Retailer.Retailer_ID From Retailer WHERE EXISTS (SELECT Product_name FROM Product WHERE Product.Product_ID = Retailer.Retailer_ID AND Product_price_in$ > 1 );

16. Query to list the Customer Names and Phone number who haven’t placed any Order.

SELECT C.FirstName, C.Phone From Customer C LEFT JOIN Final_Order o ON C.Customer_ID = o.Order_Customer_ID  WHERE o.Order_ID IS NULL;

17. Query to List top 5 products and their total quantities sold.
SELECT p.Product_name, COUNT(ol.Order_Product_ID) as total_quantity FROM Product p INNER JOIN Final_Order ol ON p.Product_ID = ol.Order_Product_ID GROUP BY p.Product_ID ORDER BY total_quantity DESC LIMIT 5;

18. Query to return some of the states names from Customer and Delivery_person using LIKE.

SELECT COUNT(*), state FROM Customer GROUP BY State HAVING State LIKE  "b%" OR  "c%" ORDER BY state;

19. Query to Add a new column named “City” in the Retailer Table:

ALTER TABLE Retailer ADD City varchar(100);

20. Query to display distinct Product_Name, number of and minimum price of products where product price should [be less than the maximum of product prices of all the products for which it is not between 3 and 5 and product name is not in some given names] and product name ends with “s”. (This query is an example of how complex conditions on names can be applied and used whenever possible)

SELECT DISTINCT Product_Name, COUNT(Product_Name) AS NumberOf, MIN(Product_Price_in$) AS Min_Price FROM Product WHERE Product_Price_in$ < (SELECT MAX(Product_Price_in$) FROM Product WHERE Product_Price_in$ NOT BETWEEN 3 AND 5 AND Product_Name NOT IN ('Television','Shoes','Dress')) AND  Product_Name LIKE '%s' GROUP BY Product_Name;

21. Query to display delivery person’s name and ID, order’s total charges  from the table delivery.
SELECT D.Delivery_Person_ID, Dp.FirstName AS DeliveryPerson_Name, O.Total_Charges FROM delivery AS D INNER JOIN Final_Order AS O ON D.Delivery_Order_ID=O.Order_ID INNER JOIN Delivery_Person AS Dp ON Dp.Delivery_Person_ID=D.Delivery_Person_ID;

22. Use of self join to get product details of all except some which don’t satisfy a condition.
SELECT DISTINCT p2.* FROM Product p1 JOIN Product p2 ON p1.Product_ID = p2.Product_ID WHERE p1.Product_Availability = 'YES' AND p2.Product_Category_ID != '4';
