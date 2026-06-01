--CREATING A DATABASE

create DATABASE OnlineBookstore;

--USING DATABSE OTHERWISE SOMETIMES TABLE SAVED ON ANOTHER DB
USE OnlineBookstore;

--CREATING BOOKS TABLE

DROP TABLE IF EXISTS Books;
CREATE TABLE Books(
   Book_ID INT  PRIMARY KEY,
   Title VARCHAR(100),
   Author VARCHAR(100),
   Genre VARCHAR(50),
   Published_Year INT,
   Price NUMERIC(10,2),
   Stock INT
   );


--CREATING TABLE CUSTOMERS

DROP TABLE IF EXISTS customers;
CREATE TABLE customers(
  customer_ID INT PRIMARY KEY,
  Name VARCHAR(100),
  Email VARCHAR(100),
  Phone VARCHAR(15),
  City VARCHAR(50),
  Country VARCHAR(150)
  );

--CREATING TABLE ORDERS AND INCLUDING BOTH TABLE IN ORDER TABLE

DROP TABLE IF EXISTS orders;
CREATE TABLE orders(
Order_ID INT PRIMARY KEY,
customer_ID INT REFERENCES customers(customer_ID),
Book_ID INT REFERENCES Books(Book_ID),
Order_Date DATE,
Quantity INT,
Total_Amount NUMERIC(10,2)
);

--CHECK TABLE

SELECT * FROM Books;
SELECT * FROM customers;
SELECT * FROM orders;



/*COPY Books(Book_ID,Title,Author,Genre,Published_Year,Price,Stock)
From'E:\New folder\30 Day - SQL Practice Files\SQL\CSV\Books.CSV'
CSV HEADER;*/

--MYSQL USE BULK INSETED OF COPY FOR LOADING DATA TO TABLE VIA PATH

BULK INSERT Books
FROM 'E:/New folder/SQL.CSV/Books.csv'
WITH(
FIRSTROW=2,
FIELDTERMINATOR=',',
ROWTERMINATOR='0x0a'
 );

 BULK INSERT customers
FROM 'E:\New folder\SQL.CSV\Customers.csv'
WITH(
FIRSTROW=2,
FIELDTERMINATOR=',',
ROWTERMINATOR='\n'
 );
 
BULK INSERT orders
FROM 'E:\New folder\SQL.CSV\Orders.csv'
WITH(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '0x0a'
);



--Basic QuerieS

--1) Retrieve all books in the "Fiction" genre
     SELECT * FROM Books
     WHERE Genre = 'fiction';

--2) Find books published after the year 1950
      SELECT * FROM Books
      WHERE Published_Year > 1950;

--3) List all customers from the Canada
     SELECT * FROM customers
     WHERE Country ='Canada';

--4) Show orders placed in November 2023
     SELECT * FROM orders
     WHERE Order_Date BETWEEN '2023-11-1' AND '2023-11-30';

--5) Retrieve the total stock of books available
     SELECT SUM(Stock) AS Total_Stock FROM Books;

--6) Find the details of the most expensive book
      SELECT TOP 1 * FROM Books  ORDER BY Price DESC ;

--7) Show all customers who ordered more than 1 quantity of a book
        SELECT * FROM orders
        WHERE Quantity > 1;

--8) Retrieve all orders where the total amount exceeds $20
     SELECT * FROM orders
     WHERE Total_Amount > 20;

--9) List all genres available in the Books table
   SELECT DISTINCT Genre FROM Books;

--10) Find the book with the lowest stock
     SELECT TOP 1* FROM Books
     ORDER BY Stock;
     
--11) Calculate the total revenue generated from all orders
      SELECT SUM(Total_Amount) as Revenue FROM orders;



--Advance Queries

--1) Retrieve the total number of books sold for each genre
       SELECT b.Genre,sum(o.Quantity) as total_books FROM orders o
       join Books b
       on b.Book_ID = o.Book_ID
       GROUP BY b.Genre;

--2) Find the average price of books in the "Fantasy" genre
      SELECT AVG(Price)as avg_price FROM Books
      WHERE Genre = 'Fantasy';

--3) List customers who have placed at least 2 orders
  SELECT customer_ID,COUNT(Order_ID)as order_count FROM orders
  Group By customer_ID
  HAVING COUNT(Order_ID) >=2;

--4) Find the most frequently ordered book
   SELECT TOP 1 Book_ID, COUNT(order_ID)as order_count FROM orders
   group by Book_ID
   order by order_count desc;
   
--5) Show the top 3 most expensive books of 'Fantasy' Genre 
     SELECT TOP 3 * from Books
     where Genre ='Fantasy'
     order by Price DESC;

--6) Retrieve the total quantity of books sold by each author
     SELECT b.Author,SUM(o.Quantity) AS Total_Quantity FROM Books b
     join orders o
     on o.Book_ID = b.Book_ID
     Group by b.Author;
    
--7) List the cities where customers who spent over $30 are located
  SELECT DISTINCT c.City, SUM(o.Total_Amount) as Amount FROM customers c
   join orders o
   on o.customer_ID = c.customer_ID
   Group by c.City
   HAVING SUM(o.Total_Amount) > 30;

--8) Find the customer who spent the most on orders
    Select TOP 1 customer_ID, sum(Total_Amount) as most_order from orders
    group by customer_ID
    order by most_order desc;

   --Both are correct

  /* SELECT TOP 1 c.customer_id, c.name, SUM(o.total_amount) AS Total_Spent
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY Total_spent Desc;*/
    

--9) Calculate the stock remaining after fulfilling all orders
   Select o.Book_ID,sum(b.Stock),Sum(o.Quantity),  (sum(b.Stock)-Sum(o.Quantity)) as stock  From orders o
    join Books b
    on b.Book_ID = o.Book_ID
    group by o.Book_ID
    

  
--SElect DB_NAME();

--key Insights
--Total revenue
select sum(Total_Amount) from orders;

--top genre by amount
select Top 3 Books.Genre, orders.Total_Amount from  Books
join orders
on Books.Book_ID=orders.Book_ID
group by Genre, Total_Amount
order by Total_Amount desc;

--genre by price
select Genre, Price  from Books
order by price desc


--top books
select Genre,  sum(Quantity) as total_sold from Books
join orders
on Books.Book_ID = orders.Book_ID
group by Genre
order by sum(Quantity) desc

--top customer Quantity wise
select Top 1 Name, sum(Quantity)as Quant_wise  from orders
join customers
on customers.customer_ID = orders.customer_ID
group by Name
order by Sum(Quantity) desc


--top customers amount wise
select Name,sum(Total_Amount)as amount_wise from orders
join customers
on customers.customer_ID = orders.customer_ID
group by Name
order by sum(Total_Amount) desc

--top Author
SELECT b.Author,
       SUM(o.Quantity) AS Books_Sold
FROM Orders o
JOIN Books b
    ON o.Book_ID = b.Book_ID
GROUP BY b.Author


