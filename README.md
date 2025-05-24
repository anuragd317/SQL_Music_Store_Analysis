# 🎵 Music Store Global – SQL Data Analysis Project

Welcome to the **Music Store Global** SQL project! This repository showcases a comprehensive analysis of a fictional global music retail database using SQL. The objective is to extract meaningful insights related to **customer behavior**, **sales trends**, and **music preferences** across countries.

---

## 📌 Project Summary

This project simulates a real-world business scenario for a global music brand (like Nike, but for music). Leveraging structured data, advanced SQL techniques, and creative visualization, it answers key business questions and helps inform strategic decisions.

---

## 🧩 Database Design

The dataset is comprised of multiple normalized tables, each representing different aspects of the store:

| Table           | Description                                     |
|----------------|-------------------------------------------------|
| `customer`      | Customer information and support representative |
| `employee`      | Store employees and reporting structure         |
| `invoice`       | Customer purchases and billing details          |
| `invoice_line`  | Detailed purchase info per track                |
| `track`         | Track metadata including genre and artist       |
| `album`         | Albums and their associated artists             |
| `artist`        | Music artists                                   |
| `genre`         | Music genres                                    |
| `playlist`      | Playlists and associated tracks                 |
| `media_type`    | Media format types (e.g., MP3, AAC)             |

🔗 All tables are linked via **primary** and **foreign keys**, maintaining relational integrity.

---

## 🔍 Analysis Highlights

Through a series of SQL queries, I explored:

- 🧑‍🤝‍🧑 **Customer Spending Patterns**: Who spends the most and on what?
- 🌎 **Genre Popularity by Country**: Which music genres dominate each region?
- 🎸 **Top Artists**: Identifying the most purchased artists globally
- 🎧 **Track Duration Analysis**: Tracks longer than the average length
- 🏆 **Best Customers per Country**: Top spender in each region using `RANK()` window functions

---

## ⚙️ Tools & Technologies

- **SQL (MySQL)** – Joins, CTEs, Aggregates, Window Functions
- **MySQL Workbench** – Query execution and schema modeling
- **Canva** – Visual report design and schema diagrams
- **Excel** – Data cleaning and preprocessing (CSV files)

---

## 📊 Visual Report

The final insights were presented using a **music-themed light brown & white Canva template**, giving a clean and professional aesthetic. Screenshots of queries, diagrams, and insights are included.

---

## 📁 Project Files

- `.sql` file with all queries
- CSV files (cleaned and normalized)
- Canva report screenshots
- ER Diagram (included as an image)


---

## 🚀 Summary

> This project demonstrates how structured SQL analysis can provide **powerful business insights** from raw music store data — helping global brands make smarter, data-driven decisions.

---

