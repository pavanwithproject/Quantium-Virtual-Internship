# Install and load necessary packages
# install.packages("data.table")
# install.packages("ggplot2")
# install.packages("lubridate")
# install.packages("stringr")
# install.packages("dplyr")

library(data.table)
library(ggplot2)
library(lubridate)
library(stringr)
library(dplyr)

# --- Load the datasets ---
# Use fread for faster reading of large CSVs
transaction_data <- fread("QVI_transaction_data.csv")
purchase_behaviour <- fread("QVI_purchase_behaviour.csv")

# --- High-level Data Checks and Cleaning ---

# Convert DATE to Date format
# Assuming Excel date format: 1899-12-30 as the epoch
transaction_data[, DATE := as.Date(DATE, origin = "1899-12-30")]

# Extract pack size *before* cleaning PROD_NAME further
# Extracts numbers followed by 'g' or 'G' (e.g., '175g', '200G')
transaction_data[, PACK_SIZE := as.numeric(str_extract(PROD_NAME, "\\d+[gG]"))]

# Clean PROD_NAME: Remove digits and 'gG', then special characters, and finally trim whitespace
transaction_data[, PROD_NAME := str_replace_all(PROD_NAME, "\\d+[gG]", "")]
transaction_data[, PROD_NAME := str_replace_all(PROD_NAME, "[^[:alnum:] ]", "")]
transaction_data[, PROD_NAME := str_trim(PROD_NAME)]

# Extract brand name (first word of PROD_NAME)
transaction_data[, BRAND_NAME := word(PROD_NAME, 1)]

# --- Outlier Detection and Removal ---

# Identify transactions with PROD_QTY = 200
# These are likely anomalous given the typical product quantities
cat("Transactions with PROD_QTY = 200:\n")
print(transaction_data[PROD_QTY == 200])

# Filter out the outlier transaction (PROD_QTY = 200)
transaction_data <- transaction_data[PROD_QTY != 200]

# --- Data Merging ---

# Merge the two dataframes on LYLTY_CARD_NBR
merged_data <- merge(transaction_data, purchase_behaviour, by = "LYLTY_CARD_NBR", all.x = TRUE)

cat("\n--- Merged Data Structure after preprocessing ---\n")
str(merged_data)
cat("\n--- Merged Data Head after preprocessing ---\n")
print(head(merged_data))

# --- Define Metrics of Interest and Analyze Customer Segments ---

# Calculate total sales by LIFESTAGE and PREMIUM_CUSTOMER
sales_by_segment <- merged_data %>%
  group_by(LIFESTAGE, PREMIUM_CUSTOMER) %>%
  summarise(TOT_SALES = sum(TOT_SALES)) %>%
  ungroup()

cat("\nTotal Sales by Segment:\n")
print(sales_by_segment)

# Calculate number of unique customers by LIFESTAGE and PREMIUM_CUSTOMER
customers_by_segment <- merged_data %>%
  group_by(LIFESTAGE, PREMIUM_CUSTOMER) %>%
  summarise(`Number of Customers` = n_distinct(LYLTY_CARD_NBR)) %>%
  ungroup()

cat("\nNumber of Customers by Segment:\n")
print(customers_by_segment)

# Calculate average price per unit (total sales / total quantity)
merged_data[, PRICE_PER_UNIT := TOT_SALES / PROD_QTY]

avg_price_per_unit_segment <- merged_data %>%
  group_by(LIFESTAGE, PREMIUM_CUSTOMER) %>%
  summarise(PRICE_PER_UNIT = mean(PRICE_PER_UNIT, na.rm = TRUE)) %>%
  ungroup()

cat("\nAverage Price Per Unit by Segment:\n")
print(avg_price_per_unit_segment)

# --- Visualizations ---

# Plotting Total Sales by Lifestage and Premium Customer
ggplot(sales_by_segment, aes(x = LIFESTAGE, y = TOT_SALES, fill = PREMIUM_CUSTOMER)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  labs(title = "Total Sales by Lifestage and Premium Customer",
       x = "Lifestage",
       y = "Total Sales ($)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_viridis_d()
ggsave("total_sales_by_segment.png", width = 12, height = 6)

# Plotting Number of Customers by Lifestage and Premium Customer
ggplot(customers_by_segment, aes(x = LIFESTAGE, y = `Number of Customers`, fill = PREMIUM_CUSTOMER)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  labs(title = "Number of Customers by Lifestage and Premium Customer",
       x = "Lifestage",
       y = "Number of Customers") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_viridis_d()
ggsave("num_customers_by_segment.png", width = 12, height = 6)

# Plotting Average Price Per Unit by Lifestage and Premium Customer
ggplot(avg_price_per_unit_segment, aes(x = LIFESTAGE, y = PRICE_PER_UNIT, fill = PREMIUM_CUSTOMER)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  labs(title = "Average Price Per Unit by Lifestage and Premium Customer",
       x = "Lifestage",
       y = "Average Price Per Unit ($)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_viridis_d()
ggsave("avg_price_per_unit_by_segment.png", width = 12, height = 6)

cat("\nAnalysis complete. Plots saved as PNG files.\n")
