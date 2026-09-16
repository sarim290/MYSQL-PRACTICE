create database if not exists book_store;
use book_store;

DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);

DROP TABLE IF EXISTS customers;
CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);


DROP TABLE IF EXISTS orders;
CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;



#1) Retrieve all books in the "Fiction" genre:

SELECT * FROM Books 
WHERE Genre='Fiction';

#2) Find books published after the year 1950: 

select Title , Published_Year from books
where Published_Year > 1950;

#3) List all customers from the Canada:

select * from customers
where city = 'Canada';

# 4) Show orders placed in November 2023:
	
    select * from orders
    where Order_Date between '2023-11-01' and '2023-11-30';

# 5) Retrieve the total stock of books available:

	select sum(stock) as total_stocks from books;

# 6) Find the details of the most expensive book:

	select max(price) from books;
 
# 7) Show all customers who ordered more than 1 quantity of a book:

	select Customer_ID , Quantity from orders
	where Quantity > 1;
    
# 8) Retrieve all orders where the total amount exceeds $20:

	select * from orders
    where Total_Amount > 20.00;

# 9) List all genres available in the Books table:

	select distinct genre from books;

# 10) Find the book with the lowest stock:

	select * from books order by stock asc;
    
    
# 11) Calculate the total revenue generated from all orders:
		select sum(Total_Amount) as revenue from orders;
 
