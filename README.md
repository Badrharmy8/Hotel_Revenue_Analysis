# 🏨 Hotel Revenue Analysis (SQL-Based)

This project presents a comprehensive **SQL-based analysis** of hotel booking data, focusing on revenue trends, customer behaviors, room preferences, and booking patterns across multiple years.

## 🎯 Objectives

To answer key business questions that affect hotel revenue and operations using raw SQL queries on structured hotel booking data.


## 🔍 Business Questions Answered

1. 📈 **What is the profit percentage for each month across all years?**

2. 🍽️ **Which meals and market segments (e.g., families, corporate clients, etc.) contribute the most to the total revenue for each hotel annually?**

3. 🏖️ **How does revenue compare between public holidays and regular days each year?**

4. 🧩 **What are the key factors (e.g., hotel type, market type, meals, nights booked) that significantly impact hotel revenue annually?**
  
5. 🛏️ **Based on stay data, what are the yearly trends in customer preferences for room types (e.g., family rooms vs. single rooms), and how do these preferences influence revenue?**

6. 👨‍👩‍👧 **What is the annual count of adults, children, and babies in the bookings?**

7. 🔍 **What is the annual percentage of bookings by reservation status?**

8. 👨‍👩‍👧 **What is the annual ratio of individual bookings (adults only) versus family bookings (with children or babies)?**

9. 🔁 **What is the annual percentage of cases where the reserved room matches the assigned room?**

10. 💡 **What is the annual percentage of repeated guests compared to non-repeated guests?**

 ## 🛠️ Tools Used
 
- **Microsoft SQL Server** – for querying and analysis
- **CSV** – for exporting results


 ## 🧾 Tables & Key Columns Used

### 🟦 1. Hotel Table
- `hotel`
- `is_canceled`
- `lead_time`
- `arrival_date_year`
- `arrival_date_month`
- `arrival_date_day_of_month`
- `stays_in_week_nights`
- `stays_in_weekend_nights`
- `reserved_room_type`
- `assigned_room_type`
- `adr` (Average Daily Rate)
- `is_repeated_guest`
- `adults`
- `children`
- `babies`
- `meal`
- `country`
- `market segment`
- `distripution channel`
- `previous cancellation`
- `previous_bookings_not_canceled`
- `booking_changes`
- `deposit_type`
- `agent`
- `company`
- `days_in_waiting_list`
- `customer_type`
- `required_car_parking_spaces`
- `total_of_special_requests`
- `reservation_status`
- `reservation_status_date`

### 🟨 2. Market Segment Table
- `market_segment`
- `discount`

### 🟥 3. Meal Cost Table
- `meal` – meal type (e.g., BB, HB, FB)
- `meal_cost` – cost of that meal per booking

> These tables were joined using common fields such as `meal` and `market_segment` to calculate total revenue, identify trends in customer behavior, and measure the impact of discounts and meal types on hotel profit.

## 📁 Project Structure

- `/code/` → Contains all SQL files 
- `/output/` → CSV exports of query results
- `README.md` → Project overview and instructions
    
