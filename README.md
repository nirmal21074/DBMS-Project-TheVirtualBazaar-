🛍️🤑 The Virtual Bazaar 🛍️🤑

Project Scope:-

As the name suggests, it's a Virtual Bazaar, an online retail marketplace (like Amazon, Flipkart etc.) where a user can buy a product from a wide range of products, and the retailers can sell their products. Also, there will be a  delivery person responsible for getting those products to the customer's doorstep. 
And for the customer, all these facilities are available with just a click for any product and all that being home. The platform will have various genres of products with a lot of variety, like clothes, books, electronic gadgets, furniture, etc. A person can sign up as a user to buy the product, as a retailer, or as a delivery guy who can deliver the product to the customer's doorstep. Customers can browse different products from different categories, view and update their cart, choose any favorable mode of payment, and even update their delivery address. Furthermore, retailers can add, update (make changes to the details/particulars of their products at any time they want), and delete any listed products anytime they want. Also, the delivery person can choose to accept or reject any delivery request according to them.
Our database management system will help find details and other information about retailers, delivery persons, and customers systematically by maintaining and following all the required ACID(Atomicity, Consistency, Isolation, and Durability) properties. 

Project Tech Stack (Technical requirements):-

Frontend:
HTML
CSS
Javascript
React.js
Figma/Canva

Backend:
Node.js
Express.js
My SQL

Functional Requirements:-

For the Customer :-
Log In/Sign up as a Customer.
Can buy the product. 
Can browse different categories of the products.
Can add items to the cart.
Can remove the items from the cart.
Can update his cart.
Can select delivery address.
Can choose the mode of payment.
Can buy again(any particular product).
Can view their account(profile).
Can have a wishlist of the products they want to buy again or in future may be.

For the Retailer :-
Need to register as a retailer by signing up first.
Can sell his/her product.
Can list their Products (like price, Estimated delivery time, Description, Features).
Can add/delete/update any of their products on the platform depending on the availability of the product.

For the Delivery person :-
Log In/Sign up as Delivery Person
View/Accept Delivery Requests
Update Product Delivery Status
Cancel Delivery Request


Access Constraints:-

Users (customer, retailer or delivery person) can only register(sign up) once with a unique email id.
Retailers will have an unique ID which will be (Primary Key) and cannot be a NULL value.
Customers will have an unique ID which will be (Primary key) and cannot be a NULL value.
Users (customer, retailer or delivery person) should not be able to see or change the profile/data of other users.
The details of products sold by a particular retailer can be updated or changed by that retailer only. 
At a time users cannot log into their profile from more than one device.
Each Delivery will have an Unique ID to identify with an order (Foreign Key).
