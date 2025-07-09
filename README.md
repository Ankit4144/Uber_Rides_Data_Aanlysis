# Uber Ride Request Analysis: Data Storytelling & Operational Insights

## Project Summary
This project focuses on analyzing Uber ride request data to identify inefficiencies in operations, specifically regarding trip cancellations and unassigned ride requests. The dataset consists of over 6,700 entries detailing ride request information, such as pickup location, request time, driver assignment, and trip status.

The goal was to clean the data, explore it visually and statistically, and derive actionable insights that could guide operational improvements for Uber or similar ride-hailing platforms.

The workflow included cleaning timestamps in Python (Pandas), categorizing request times into day-parts in Excel, conducting EDA and statistical tests in Python, and exploring further aggregations and trends in SQL. Visualizations were created using Seaborn and Matplotlib to aid storytelling. The final outcome was a comprehensive set of findings on cancellation patterns, time-based demand spikes, and pickup point inefficiencies, alongside recommendations to optimize driver allocation and improve user experience.

---

## Data Collection and Cleaning
The dataset was provided in CSV format, containing fields such as Request ID, Pickup Point, Driver ID, Status, Request Timestamp, Drop Timestamp, and Trip Duration.

##### Raw Data Set 
[Download Uber Data (Excel)](https://drive.google.com/file/d/1-d9ukSpbLJDdISdIq-xlujTKh1IzR66n/view?usp=sharing)

### Cleaning Steps:
- Converted request and drop timestamps to datetime objects using `pd.to_datetime()`.
- Calculated `Trip Duration (mins)` by subtracting request time from drop time.
- Separated Request Time into `Date` and `Time` components.
- Created new columns: `Time_Slot` (Morning, Afternoon, Evening, Night) using Excel.
- Handled missing values by tagging null `Drop Timestamp` entries as incomplete trips, and null `Driver ID` entries as unassigned.
- Exported the cleaned dataset to Excel for dashboarding.

---

## Data Description

| Column               | Description                                           |
|----------------------|-------------------------------------------------------|
| Request_id           | Unique identifier for each ride request              |
| Pickup_point         | Location where ride was requested (City or Airport)  |
| Driver_id            | ID of assigned driver (or null if not assigned)      |
| Status               | Final status of the request                          |
| Request_Date         | Date extracted from Request Timestamp                |
| Time_Slot            | Time of day bucket (Morning, Afternoon, Evening, Night) |
| Drop_Date            | Drop-off date, null if trip incomplete               |
| Trip_Duration(mins)  | Duration in minutes for completed rides only         |

---

## Problem Statement
Uber experiences a high rate of trip cancellations and unassigned ride requests during specific hours of the day and at particular pickup locations. These inefficiencies cause delays, reduce customer satisfaction, and potentially result in lost revenue.

**Objective**:  
To identify when, where, and why most ride requests go unfulfilled, and to propose data-driven solutions to minimize cancellations and unassigned trips.

---

## Insights and Findings
- **Evening and Night slots** show significantly higher cancellations and unassigned trips.
- **City pickups** have more cancellations; **Airport pickups** see more unassigned rides.
- Most successful trips occur in the **Morning and Afternoon**.
- **Trip durations** are typically 10–20 minutes, but Airport trips are longer and more variable.
- Demand spikes on **Fridays and Mondays**, suggesting the need for dynamic driver allocation.
- **Cancellations peak** during high-demand hours, highlighting a possible driver shortfall.

---

##  Steps Performed
- Cleaned data using **Pandas**
- Tagged missing values and created helper columns
- Exported cleaned data to **Excel** for dashboarding
- **Grouped time into Time Slots (Excel)** and **Hour of Day (SQL)**
- Performed EDA using **Seaborn** and **Matplotlib**
- Conducted chi-square and Cramér’s V test to find categorical dependencies
- Built dashboards in Excel using PivotTables and charts
- Wrote SQL queries to extract insights such as completion rate, cancellation rate by time/hour

---

## Data Visualization & Storytelling
### Bar Plots
### 1. Trip Status Distribution
This bar chart displays the total number of requests categorized by status — Completed, Cancelled, and No Cars Available.  
It clearly highlights that a large number of ride requests are not successfully fulfilled.

![Trip Status Distribution](Screenshots/Trip_Status_Distribution.png)

### 2. Trip status by time slot and pickup point
This visualization compares trip status (Completed, Cancelled, No Cars Available) across different time slots — Morning, Afternoon, Evening, and Night.  
Evening and Night show higher cancellation and unassigned rates, indicating a supply-demand mismatch.

![Trip Trend Across Time Slots](Screenshots/Trip_trend_across_timeslots.png)

### 3. Trip Duration Disrtribution
The Trip Duration follows a bell shaped curved, hence it is normally distributed, most trip duration falls between 40-60 mins. 

![Trip Duration Disrtribution](Screenshots/Trip_Duration.png) 


### **Excel Dashboard**

![Excel_dashboard](Screenshots/Ecel_Dashboard.png)

These visuals enabled intuitive storytelling around when and where demand-supply mismatches occurred.

---

## Solution on Business Objectives
1. **Dynamic driver allocation**: Increase availability during evening and night time slots.
2. **Incentivize drivers near Airport zones** to reduce unassigned trip count.
3. **Optimize city pickups** by reducing wait time and matching efficiency.
4. **Collect trip feedback** post-completion to understand dissatisfaction causes.
---

## Conclusion
The Uber ride request dataset reveals clear demand and supply mismatches that can be addressed through smarter driver scheduling, location-based incentives, and real-time availability insights. By using a combination of Excel, SQL, and Python, we uncovered deep insights that support actionable, business-oriented decisions to reduce unassigned and cancelled rides, ultimately improving user experience and operational efficiency.
