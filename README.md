🛒 Quantium Virtual Internship - Retail Analytics Project
This repository contains the analysis and insights generated during the Quantium Virtual Internship. The work is divided into two main tasks:

✅ Customer Purchasing Behavior Analysis

✅ Store Trial Performance Evaluation

🧭 Table of Contents
🔍 Introduction

📊 Task 1: Customer Purchasing Behavior Analysis

🏪 Task 2: Store Trial Performance Evaluation

📌 Conclusion

🔍 Introduction
The objective of this project is to provide actionable insights using real transaction data from a chip brand sold at a large grocery chain. This involves:

📈 Understanding purchasing trends and customer segments.

🧪 Evaluating the performance of in-store trials designed to increase sales.

📊 Task 1: Customer Purchasing Behavior Analysis
📚 Load Required Libraries and Datasets
r
Copy
Edit
library(data.table)
library(dplyr)
library(ggplot2)
library(lubridate)
library(stringr)
📁 Files:

QVI_transaction_data.csv

QVI_purchase_behaviour.csv

🧹 Data Cleaning & Feature Engineering
✔️ Convert DATE to date format
✔️ Extract PACK_SIZE and BRAND_NAME from PROD_NAME
✔️ Merge transaction and customer behavior data using LYLTY_CARD_NBR

⚠️ Outlier Detection
🧹 Removed outlier transactions (e.g., PROD_QTY == 200)

👥 Customer Segmentation
Segmented by:

🎯 LIFESTAGE (e.g., Young Singles/Couples, Retirees)

💰 PREMIUM_CUSTOMER (Budget / Mainstream / Premium)

📐 Key Metrics
📌 Defined metrics:

💸 Total Sales

🧍‍♂️ Number of Unique Customers

💲 Average Price per Unit

📈 Visualizations
📊 Used ggplot2 to create:

🧱 Total Sales by Segment

👤 Customer Count by Segment

📦 Average Price per Unit by Segment

💡 Strategic Recommendations
🚀 High-Value Segments:

👨‍👩‍👧 Older Families (Budget)

👵 Retirees (Mainstream)

👩‍❤️‍👨 Young Singles/Couples (Premium)

📉 Growth Opportunity:

👶 New Families (low sales & customer count)

🎯 Actions:

🧠 Tailored marketing campaigns

🛍️ Product placement strategies

🧪 Test premium offerings with high-value segments

🏪 Task 2: Store Trial Performance Evaluation
📁 Data & Libraries
r
Copy
Edit
library(dplyr)
library(ggplot2)
library(lubridate)
library(tidyr)
library(scales)
📄 File used: QVI_data.csv

📊 KPI Aggregation
📆 Monthly metrics computed for each store:

💰 total_sales

🧍 total_customers

🔁 avg_txn_per_customer

🧪 Control Store Selection
📌 Used magnitude-based similarity scoring to match trial stores with most similar control stores based on:

Sales

Customers

Transactions

🏪 Store mapping:

🧪 Trial Store	🧪 Matched Control Store
77	✅ Best Match
86	✅ Best Match
88	✅ Best Match

📉 Sales Impact Analysis
📈 Compared sales trends of Trial vs Control
📊 Plotted monthly performance
🧪 Conducted t-tests on trial period (Feb–Apr 2019)

📊 Statistical Testing
🔬 p-values used to measure sales difference significance
✅ Helps determine trial success objectively

📌 Conclusion
🧾 Task 1 Key Insights
💰 Top-Contributing Segments:

Older Families (Budget)

Retirees (Mainstream)

👥 Largest Customer Base:

Retirees (Mainstream)

Young Singles/Couples (Mainstream)

🛍️ Premium Insights:

Young Singles/Couples (Premium) pay more per unit (less price-sensitive)

📉 Growth Target:

New Families (low engagement)

🧾 Task 2 Key Insights
🧠 Control stores chosen using data-driven similarity measures

📈 Performance visualized with clean comparison plots

🧪 Sales uplift statistically tested for confidence

🛠️ How to Use This Project
🔽 Download all datasets into your R working directory.

▶️ Run R scripts or RMarkdown files step-by-step.

📊 Review visual outputs and test results to guide business strategy.
