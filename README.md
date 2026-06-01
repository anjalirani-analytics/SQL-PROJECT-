# 📚 Bookstore Sales Analysis | SQL Case Study

## Project Overview

This project analyzes a bookstore database using SQL to uncover sales trends, customer purchasing behavior, and inventory insights.

The database consists of three datasets containing information about books, customers, and orders. SQL queries were used to answer business-oriented questions and generate actionable insights.

---

## Database Schema

![Database Schema](images/database_schema.png)

The database contains three tables:

### Books

Stores information about books available in the bookstore.

### Customers

Contains customer demographic information.

### Orders

Records customer purchases and links books with customers.

---

## Datasets Used

| Dataset       | Description                                                   |
| ------------- | ------------------------------------------------------------- |
| Books.csv     | Book details including title, author, genre, price, and stock |
| Customers.csv | Customer information including name, city, and country        |
| Orders.csv    | Transactional order data                                      |

---

## Business Questions Solved

### Inventory Analysis

* Retrieve all books in the Fiction genre
* Find books published after 1950
* Identify the most expensive books
* Analyze available stock levels

### Sales Analysis

* Calculate total bookstore revenue
* Find the total quantity of books sold by each author
* Identify top-selling genres
* Determine high-value transactions

### Customer Analysis

* List customers by country
* Identify customers with multiple purchases
* Analyze customer spending patterns

---

## SQL Concepts Applied

* SELECT
* WHERE
* ORDER BY
* GROUP BY
* HAVING
* INNER JOIN
* Aggregate Functions

  * SUM()
  * COUNT()
  * AVG()
  * MIN()
  * MAX()

---

## SQL Query Results

### Total Revenue Analysis

![Revenue Analysis](images/revenue_analysis.png)

### Top Selling Genres

![Top Genres](images/top_genres.png)

### Customer Spending Analysis

![Customer Analysis](images/customer_analysis.png)

---

## Key Insights

📈 Total Revenue Generated: **$75,628.66**

📚 Mystery emerged as the highest-selling genre.

🚀 Science Fiction and Fantasy also demonstrated strong sales performance.

👥 Customer purchasing behavior revealed opportunities for targeted marketing campaigns.

📦 Sales trends can support inventory optimization and stock planning decisions.

---

## Tools Used

* Microsoft SQL Server
* SQL Server Management Studio (SSMS)
* GitHub

---

## Project Files

```text
SQL-PROJECT/
│
├── datasets/
│   ├── Books.csv
│   ├── Customers.csv
│   └── Orders.csv
│
├── queries.sql
├── README.md
└── images/
    ├── database_schema.png
    ├── revenue_analysis.png
    ├── top_genres.png
    └── customer_analysis.png
```

---

## Author

**Anjali Rani**

Aspiring Data Analyst | SQL | Python | Power BI

GitHub:
https://github.com/anjalirani-analytics


