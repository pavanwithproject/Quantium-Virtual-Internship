🛒 Quantium Virtual Internship - Retail Analytics Project
This repository contains the analysis and insights generated during the Quantium Virtual Internship. The work is divided into two main tasks:

Customer Purchasing Behavior Analysis

Store Trial Performance Evaluation

📁 Table of Contents
Introduction

Task 1: Customer Purchasing Behavior Analysis

Load Libraries & Data

Data Cleaning & Feature Engineering

Outlier Detection

Customer Segmentation

Key Metrics & Visualization

Strategic Recommendations

Task 2: Store Trial Performance Evaluation

KPI Aggregation

Control Store Selection

Sales Impact Analysis

Statistical Testing

Conclusion

🧾 Introduction
The objective of this project is to provide actionable insights using real transaction data from a chip brand sold at a large grocery chain. This involves:

Understanding purchasing trends and customer segments.

Evaluating the performance of in-store trials designed to increase sales.

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
Data used:

QVI_transaction_data.csv

QVI_purchase_behaviour.csv

🧹 Data Cleaning & Feature Engineering
Converted DATE to proper format.

Extracted PACK_SIZE and BRAND_NAME from PROD_NAME.

Merged transaction data with customer data using LYLTY_CARD_NBR.

⚠️ Outlier Detection
Identified and removed suspicious quantity values (e.g., PROD_QTY == 200).

👥 Customer Segmentation
Segments based on:

LIFESTAGE (e.g., Young Singles/Couples, Retirees)

PREMIUM_CUSTOMER status (Budget, Mainstream, Premium)

📐 Key Metrics
Total Sales

Number of Unique Customers

Average Price per Unit

📈 Visualizations
Bar charts for:

Total Sales by Segment

Customer Count by Segment

Average Price per Unit

💡 Strategic Recommendations
Focus marketing on high-value segments like:

Older Families (Budget)

Retirees (Mainstream)

Young Singles/Couples (Premium)

Targeted strategies for low-engagement segments like New Families.

🏪 Task 2: Store Trial Performance Evaluation
📚 Data & Libraries
r
Copy
Edit
library(dplyr)
library(ggplot2)
library(lubridate)
library(tidyr)
library(scales)
Data used: QVI_data.csv

📊 KPI Aggregation
Calculated monthly metrics per store:

total_sales

total_customers

avg_txn_per_customer

🧪 Control Store Selection
Used a magnitude-based similarity score across key metrics to find control stores for each trial store.

Trial stores and their selected control stores:

Trial Store	Control Store
77	[Best Match]
86	[Best Match]
88	[Best Match]

📉 Sales Impact Analysis
Plotted total sales trends (Trial vs. Control).

Used t.test() for statistical comparison during the trial period (Feb–Apr 2019).

🧪 Statistical Testing
p-values computed to assess whether trial sales were significantly different from control store sales during the trial period.

✅ Conclusion
Task 1 Highlights:
Older and mainstream customer segments contribute significantly to sales.

Some premium segments show less price sensitivity, indicating upsell opportunities.

Growth potential exists among under-engaged segments like New Families.

Task 2 Highlights:
Carefully matched control stores allowed for fair evaluation.

Sales analysis and statistical tests determined the effectiveness of in-store trials.

Results can guide future expansion or refinement of trial strategies.

📌 How to Use
Ensure all datasets are available in your working directory.

Run the R scripts or RMarkdown files provided in sequence.

Visualizations and statistical outputs will guide strategic retail decisions.
