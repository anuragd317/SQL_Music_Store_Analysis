# 🎵 Music Store Sales – SQL Data Analysis Project

This SQL project showcases a comprehensive analysis of a fictional global music retail database using SQL. The objective is to extract meaningful insights related to **customer behavior**, **sales trends**, **music preferences**, and **top artists** across countries and genres.

---

## ⚙️ Tools & Technologies

- **SQL (MySQL)** – Joins, CTEs, Aggregates, Window Functions  
- **MySQL Workbench** – Query execution and schema modeling  
- **Canva** – Visual reporting and design  
- **Excel** – Data preprocessing and cleaning from CSV files  

---

## 🧩 Database Design

The dataset consists of multiple tables representing various entities within the music store:

| Table            | Description                                                     |
|------------------|-----------------------------------------------------------------|
| `customer`        | Contains customer details and their assigned support employee  |
| `employee`        | Employee records with managerial reporting structure            |
| `invoice`         | Customer transactions and billing information                   |
| `invoice_line`    | Line items of each invoice, representing purchased tracks       |
| `track`           | Track-level data including genre, media type, and album info    |
| `album`           | Albums grouped by artists                                       |
| `artist`          | Artist names and IDs                                            |
| `genre`           | Music genres classification                                     |
| `playlist`        | Predefined or user-generated collections of tracks              |
| `playlist_track`  | Many-to-many relationship between playlists and individual tracks |
| `media_type`      | Format type of each track                      |

🔗 All tables are interrelated through **primary** and **foreign keys**, ensuring strong relational consistency.

---

## 🔍 Analysis Highlights

- 🧑‍🤝‍🧑 **Customer Spending Patterns**: Who spends the most and on what?
- 🌎 **Genre Popularity by Country**: Which genres dominate each region?
- 🎸 **Top Artists**: Identifying the most frequently purchased artists globally
- 🎧 **Track Duration Analysis**: Find tracks longer than the average length
- 🏆 **Top Customer per Country**: Highest spender in each country using window functions

---

## 🚀 Project Summary

This project demonstrates how structured SQL analysis can uncover **valuable business insights** from a fictional global music store database — supporting smarter, data-driven decision-making for international brands.

---



