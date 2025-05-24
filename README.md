# 🎵 Music Store Global – SQL Data Analysis Project

This SQL project showcases a comprehensive analysis of a fictional global music retail database using SQL. The objective is to extract meaningful insights related to **customer behavior**, **sales trends**, **music preferences** and **top artist** across countries and genres.


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
| `playlist_track`| Links Track and playlist                                   |
| `media_type`    | Media format types (e.g., MP3, AAC)             |


---


## 🔍 Analysis Highlights

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

## 🚀 Project Summary

> This project demonstrates how structured SQL analysis can provide **powerful business insights** from raw music store data — helping global brands make smarter, data-driven decisions.

---

