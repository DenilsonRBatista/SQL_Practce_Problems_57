--1. Which shippers do we have?
--We have a table called Shippers. Return all the fields from all the shippers

SELECT *
FROM shippers;

-- 2. Certain fields from Categories
-- In the Categories table, selecting all the fields using this
-- SQL:
-- Select * from Categories
-- …will return 4 columns. We only want to see two
-- columns, CategoryName and Description.


SELECT Category_Name, Description
FROM categories;


-- 3. Sales Representatives
-- We’d like to see just the FirstName, LastName, and HireDate of all the employees with the Title of Sales
-- Representative. Write a SQL statement that returns only those employees.

SELECT * FROM Employees
limit 5;

SELECT First_Name, Last_Name, Hire_Date
FROM employees
WHERE Title = 'Sales Representative'


-- 4. Sales Representatives in the United States
-- Now we’d like to see the same columns as above, but only for those employees that both have the title of Sales
-- Representative, and also are in the United States.


SELECT First_Name, Last_Name, Hire_Date
FROM employees
WHERE Title = 'Sales Representative' and country = 'USA'



-- 5. Orders placed by specific EmployeeID Show all the orders placed by a specific employee. The
-- EmployeeID for this Employee (Steven Buchanan) is 5.

SELECT * FROM ORDERS
WHERE employee_id = 5;



-- 6. Suppliers and ContactTitles
-- In the Suppliers table, show the SupplierID, ContactName, and ContactTitle for those Suppliers
-- whose ContactTitle is not Marketing Manager.

SELECT Supplier_id, Contact_Name, Contact_Title
FROM Suppliers
WHERE Contact_Title NOT  IN ('Marketing Manager')



-- 7. Products with “queso” in ProductName
-- In the products table, we’d like to see the ProductID and ProductName 
-- for those products where the ProductName includes the string “queso”.

SELECT Product_id, Product_name
FROM Products
WHERE Product_name ILIKE 'queso%';


-- 8. Orders shipping to France or Belgium Looking at the Orders table, there’s a field called
-- ShipCountry. 
-- Write a query that shows the OrderID, CustomerID, and ShipCountry for the orders where the
-- ShipCountry is either France or Belgium.

SELECT Order_id, Customer_id, Ship_country
FROM Orders
WHERE Ship_Country in ('France', 'Belgium')
ORDER BY Ship_Country;


-- 9. Orders shipping to any country in Latin America
-- Now, instead of just wanting to return all the orders from
-- France of Belgium, we want to show all the orders from
-- any Latin American country. But we don’t have a list of
-- Latin American countries in a table in the Northwind
-- database. So, we’re going to just use this list of Latin
-- American countries that happen to be in the Orders table:
-- Brazil Mexico Argentina Venezuela It doesn’t make
-- sense to use multiple Or statements anymore, it would get
-- too convoluted. Use the In statement.

SELECT Order_id, Customer_id, Ship_country
FROM Orders
WHERE Ship_Country in ('Brazil', 'Mexico', 'Argentina', 'Venezuela')
ORDER BY Ship_Country;


-- 10. Employees, in order of age For all the employees in the Employees table, show the
-- FirstName, LastName, Title, and BirthDate. 
-- Order the results by BirthDate, so we have the oldest employees first.


SELECT First_Name, Last_Name, Title, Birth_Date
FROM Employees
ORDER BY Birth_Date;


-- 11. Showing only the Date with a DateTime field
-- In the output of the query above, showing the Employees
-- in order of BirthDate, we see the time of the BirthDate
-- field, which we don’t want. Show only the date portion of
-- the BirthDate field.

--The default of my database is data, so, I do the oposite. I changed from date to datetime
SELECT First_Name, Last_Name, Title, CAST(Birth_Date AS TIMESTAMP)
FROM Employees
ORDER BY Birth_Date;


-- 12. Employees full name Show the FirstName and LastName columns from the
-- Employees table, and then create a new column called FullName, showing FirstName and LastName joined
-- together in one column, with a space in-between.

ALTER TABLE Employees
ADD COLUMN Full_Name varchar(100);

UPDATE Employees
SET Full_Name = First_Name|| ' ' || Last_Name;

SELECT First_Name, Last_Name, Full_Name
FROM Employees;

-- 13. OrderDetails amount per line item In the OrderDetails table, we have the fields UnitPrice
-- and Quantity. Create a new field, TotalPrice, that multiplies these two together. 
-- We’ll ignore the Discount field for now.
-- In addition, show the OrderID, ProductID, UnitPrice, and Quantity. Order by OrderID and ProductID.

ALTER TABLE Order_Details
ADD COLUMN Total_Price DECIMAL(10,2);

UPDATE Order_Details
SET Total_Price=Unit_Price*Quantity;

SELECT Order_ID, Product_ID, Unit_Price, Quantity, Total_Price
FROM Order_Details
ORDER BY Order_id, Product_id;


-- 14. How many customers?
-- How many customers do we have in the Customers table?
-- Show one value only, and don’t rely on getting the recordcount at the end of a resultset.

SELECT COUNT(customer_ID) AS Total_Customers
FROM customers

-- 15. When was the first order?
-- Show the date of the first order ever made in the Orders table.

SELECT Min(Order_Date) as First_Order
FROM Orders;



-- 16. Countries where there are customers
-- Show a list of countries where the Northwind company
-- has customers.

SELECT DISTINCT(country)
FROM customers
ORDER BY country;

SELECT country
FROM customers
GROUP BY country
ORDER BY country;

-- 17. Contact titles for customers
-- Show a list of all the different values in the Customers
-- table for ContactTitles. Also include a count for each
-- ContactTitle.
-- This is similar in concept to the previous question
-- “Countries where there are customers”, except we now
-- want a count for each ContactTitle.

SELECT Contact_Title, COUNT(Contact_Title)
FROM customers
GROUP BY Contact_Title
ORDER BY Contact_Title;


-- 18. Products with associated supplier names
-- We’d like to show, for each product, the associated
-- Supplier. Show the ProductID, ProductName, and the
-- CompanyName of the Supplier. Sort by ProductID.
-- This question will introduce what may be a new concept,
-- the Join clause in SQL. The Join clause is used to join
-- two or more relational database tables together in a
-- logical way.


SELECT P.Product_ID, P.Product_Name, S.Company_Name
FROM products P
INNER JOIN Suppliers S ON P.Supplier_ID = S.Supplier_ID
ORDER BY P.Product_ID;

















