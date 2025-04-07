# Jomato3 - Restaurant Data Analysis Project

## Overview
Jomato3 is a data analytics project designed to analyze a dataset from a food delivery platform similar to "Jomato." The dataset contains information about restaurants in a city, including their names, types, ratings, cuisines, and more. This project uses SQL queries to extract insights and generate reports based on specific tasks.

## Dataset
The dataset is stored in `data/jomato_dataset.csv` and includes the following columns:
- `OrderId`
- `RestaurantName`
- `RestaurantType`
- `Rating`
- `No.of.Rating`
- `AverageCost`
- `OnlineOrder`
- `TableBooking`
- `CuisinesType`
- `Area`
- `LocalAddress`
- `Delivery time`

## Tasks Performed
1. **Stored Procedure**: Display restaurant name, type, and cuisine where table booking is not zero (`scripts/task1_stored_procedure.sql`).
2. **Transaction**: Update cuisine type 'Cafe' to 'Cafeteria', check results, and rollback (`scripts/task2_transaction.sql`).
3. **Top 5 Areas**: Generate a row number column and find the top 5 areas with the highest average restaurant ratings (`scripts/task3_top_areas.sql`).
4. **While Loop**: Display numbers 1 to 50 using a while loop (`scripts/task4_while_loop.sql`).
5. **Top Rating View**: Create a view to store the top 5 highest-rated restaurants (`scripts/task5_top_rating_view.sql`).
6. **Trigger**: Create a trigger to display a message whenever a new record is inserted (`scripts/task6_trigger.sql`).

## Setup Instructions
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/Jomato3.git
   cd Jomato3# Jomato3
