Create database Store;
use store;

CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    last_name VARCHAR(50) NULL,
    first_name VARCHAR(50) NULL,
    title VARCHAR(100) NULL,
    reports_to INT NULL,
    levels Varchar(50) NULL,
    birthdate DATE NULL,
    hiredate DATE NULL,
    address VARCHAR(100) NULL,
    city VARCHAR(50) NULL,
    state VARCHAR(50) NULL,
    country VARCHAR(50) NULL,
    postal_code VARCHAR(20) NULL,
    phone VARCHAR(30) NULL,
    fax VARCHAR(30) NULL,
    email VARCHAR(100) NULL,
    FOREIGN KEY (reports_to) REFERENCES employee(employee_id)
);

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NULL,
    last_name VARCHAR(50) NULL,
    company VARCHAR(100) NULL,
    address VARCHAR(100) NULL,
    city VARCHAR(50) NULL,
    state VARCHAR(50) NULL,
    country VARCHAR(50) NULL,
    postal_code VARCHAR(20) NULL,
    phone VARCHAR(30) NULL,
    fax VARCHAR(30) NULL,
    email VARCHAR(100) NULL,
    support_rep_id INT NULL
);


CREATE TABLE invoice (
    invoice_id INT PRIMARY KEY,
    customer_id INT NULL,
    invoice_date DATE NULL,
    billing_address VARCHAR(100) NULL,
    billing_city VARCHAR(50) NULL,
    billing_state VARCHAR(50) NULL,
    billing_country VARCHAR(50) NULL,
    billing_postal_code VARCHAR(20) NULL,
    total DECIMAL(10, 2) NULL
);

CREATE TABLE artist (
    artist_id INT PRIMARY KEY,
    name VARCHAR(100) NULL
);

CREATE TABLE album (
    album_id INT PRIMARY KEY,
    title VARCHAR(160) NULL,
    artist_id INT NULL,
    FOREIGN KEY (artist_id) REFERENCES artist(artist_id)
);

CREATE TABLE genre (
    genre_id INT PRIMARY KEY,
    name VARCHAR(50) NULL
);

CREATE TABLE media_type (
    media_type_id INT PRIMARY KEY,
    name VARCHAR(50) NULL
);

CREATE TABLE track (
    track_id INT PRIMARY KEY,
    name VARCHAR(200) NULL,
    album_id INT NULL,
    media_type_id INT NULL,
    genre_id INT NULL,
    composer VARCHAR(200) NULL,
    milliseconds INT NULL,
    bytes INT NULL,
    unit_price DECIMAL(10, 2) NULL
    );

CREATE TABLE invoice_line (
    invoice_line_id INT PRIMARY KEY,
    invoice_id INT NULL,
    track_id INT NULL,
    unit_price DECIMAL(10, 2) NULL,
    quantity INT NULL
);

CREATE TABLE playlist (
    playlist_id INT PRIMARY KEY,
    name VARCHAR(100) NULL
);

CREATE TABLE playlist_track (
    playlist_id INT NULL,
    track_id INT NULL
);

SELECT * FROM ARTIST;
select * from album;
select * from genre;
Select * from track;
select * from employee;
select * from invoice;
select* from playlist;
select * from media_type;
select * from invoice_line;
select * from playlist_track;
select * from customer;


-- Q1: Find the most senior employee based on job title.

Select Concat(first_name,' ', last_name) as Full_name, title
from employee
order by levels DESC,Full_name ASC;

-- Q2: Determine which countries have the most invoices.

Select billing_country, count(invoice_id) As Total_Invoice
From invoice
group by billing_country
order by count(invoice_id) Desc;

-- Q3:Identify the top 3 invoice totals.

SELECT Invoice_id, Total
from invoice
order by Total Desc
limit 3;

-- Q4: Find the city with the highest total invoice amount to determine the best location for a promotional event.

Select billing_city, Sum(Total) As Total__invoice_Amount
from invoice
group by billing_city
order by sum(total) Desc;

-- Q5: Identify the customer who has spent the most money.

Select Concat(b.first_name,' ',b.last_name) AS Full_Name, a.customer_id , Sum(a.total)
from invoice as a
join customer as b
on a. customer_id=b.customer_id
Group by a.customer_id
Order by Sum(a.total) Desc;

-- Q6: Find the email, first name, and last name of customers who listen to Rock music.

Select DISTINCT a.first_name, a.last_name, a.email
from customer as a
join invoice as b on a.customer_id=b.customer_id
join invoice_line as c on b.invoice_id=c.invoice_id
join track as d on c.track_id=d.track_id
join genre as e on d.genre_id=e.genre_id
where e.name='ROCK';

-- Q7: Identify the top 10 rock artists based on track count.

Select d.name as Artist_Name , Count(a.track_id) As Rock_Artist_Count
From Track as a
join genre as b on a.genre_id=b.genre_id
join album as c on a.album_id=c.album_id
join artist as d on c.artist_id= d.artist_id
Where b.name ='Rock'
Group BY d.name
order by Count(a.track_id) DESC
LIMIT 10;

-- Q8: Find all track names that are longer than the average track length.

Select name 
from track 
where milliseconds > (Select avg(milliseconds) 
					from track);
          
          
-- Q9: Calculate how much each customer has spent on each artist.    

SELECT c.customer_id, Concat(c.first_name,' ',c.last_name) as Name , e.name as artist_name,Sum(a.unit_price * a.quantity) AS Total_Spent
from invoice_line as a  
join track as b on a.track_id=b.track_id 
join album as d on b.album_id=d.album_id
join artist as e on d.artist_id=e.artist_id
join invoice as f on a.invoice_id=f.invoice_id
join customer as c on f.customer_id=c.customer_id
Group by c.customer_id,e.name
order by Total_Spent Desc,Name Asc;     
   
                        
-- Q10: Determine the most popular music genre for each country based on purchases.

WITH genre_sales AS (
    SELECT
        c.country, g.name AS genre_name,
        SUM(a.unit_price * a.quantity) AS total_sales,
        RANK() OVER (
            PARTITION BY c.country
            ORDER BY SUM(a.unit_price * a.quantity) DESC
        ) AS rank_country
    FROM invoice_line a
    JOIN invoice i ON a.invoice_id = i.invoice_id
    JOIN customer c ON i.customer_id = c.customer_id
    JOIN track t ON a.track_id = t.track_id
    JOIN genre g ON t.genre_id = g.genre_id
    GROUP BY c.country, g.name
)
SELECT
    country,genre_name,total_sales
FROM genre_sales
WHERE rank_country = 1
ORDER BY country;


-- Q11: Identify the top-spending customer for each country.

WITH customer_spending AS (
    SELECT
        c.customer_id, c.first_name, c.last_name, c.country,
        SUM(i.total) AS total_spent,
        RANK() OVER (
            PARTITION BY c.country
            ORDER BY SUM(i.total) DESC
        ) AS country_rank
    FROM customer c
    JOIN invoice i ON c.customer_id = i.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name, c.country
)
SELECT
    customer_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    country,
    total_spent
FROM customer_spending
WHERE country_rank = 1
ORDER BY country;
















































