# Sports Retail SQL Analysis Project

## 📋 Project Overview

This project analyzes a comprehensive sports retail database containing **3,179 products** from major sports brands like Nike and Adidas. The analysis focuses on pricing strategies, revenue optimization, customer reviews, and product performance to provide actionable insights for marketing and sales teams.

## 🗄️ Database Structure

The `sports_retail` database contains **5 interconnected tables** linked by `product_id`:

| Table | Description | Key Columns |
|-------|-------------|-------------|
| **info** | Product details | product_name, product_id, description |
| **brands** | Brand information | product_id, brand |
| **finance** | Pricing & revenue data | listing_price, sale_price, discount, revenue |
| **reviews** | Customer feedback | rating, reviews (count) |
| **traffic** | Website analytics | last_visited |

## 🚀 Quick Start

### 1. Database Setup
```sql
-- Run these files in order:
1. create_database.sql    -- Creates the sports_retail database
2. create_tables.sql      -- Creates all tables with proper data types
```

### 2. Data Import
The project uses a **two-stage data import process**:
- **Staging tables**: Import raw data as VARCHAR
- **Final tables**: Convert to proper data types (FLOAT, DATETIME)
- **Data cleaning**: Handles blank values and type conversions

### 3. Run Analysis
```sql
-- Execute the main analysis file:
analysis_queries.sql
```

## 📊 Key Analysis Areas

### 💰 Revenue Analysis
- **Total Revenue**: Complete revenue calculations across all products
- **Top Performers**: Identifies highest revenue-generating products and brands
- **Brand Comparison**: Nike vs Adidas revenue breakdown

### 💲 Pricing Strategy
- **Price Categories**: Budget (<$42) | Average ($42-74) | Expensive ($74-129) | Elite ($129+)
- **Discount Analysis**: Comparison of discount strategies between brands
- **77 Unique Price Points**: Comprehensive pricing structure analysis

### ⭐ Customer Insights
- **Ratings & Reviews**: Average product ratings and review volume analysis
- **Review Patterns**: Monthly review trends and seasonal variations
- **Revenue-Review Correlation**: Strong positive correlation discovered

### 📈 Product Performance
- **Footwear Dominance**: 85% of stock (2,700 products) with $3,118 median revenue
- **Clothing Analysis**: 489 products with $503.82 median revenue
- **Category Comparison**: Performance metrics across product types

### 🌐 Website Analytics
- **Traffic Patterns**: Product page visit analysis
- **User Behavior**: Last visited timestamps and engagement metrics

## 🎯 Key Findings

### 💡 Revenue Insights
- **Adidas leads revenue** generation across all price categories
- **Elite products** ($129+) generate the highest revenue
- **Footwear products** significantly outperform clothing items

### 🏷️ Pricing Discoveries
- **Nike offers no discounts** on products
- **Adidas products are heavily discounted** despite higher revenue
- **Strong correlation** between reviews and revenue

### 📅 Seasonal Trends
- **Q1 peak**: Highest review volume in first quarter
- **Opportunity**: 9 months with potential for review campaigns

## 🔧 SQL Features Used

The project demonstrates advanced SQL capabilities:

| Feature | Purpose |
|---------|---------|
| **Aggregate Functions** | SUM, AVG, COUNT for revenue calculations |
| **Date Functions** | MONTH(), STR_TO_DATE() for temporal analysis |
| **Joins** | Multiple table relationships and data integration |
| **CTEs** | Complex queries with temporary result sets |
| **Window Functions** | RANK(), ROW_NUMBER() for advanced analytics |
| **Subqueries** | Nested queries for detailed analysis |
| **CASE Statements** | Price category classification |

## 📋 File Descriptions

| File | Purpose |
|------|---------|
| `create_database.sql` | Database initialization |
| `create_tables.sql` | Table creation with staging process |
| `analysis_queries.sql` | Complete analysis with 8 major sections |
| `content.sql` | Project documentation and insights |

## 🎯 Business Recommendations

### 📈 Revenue Optimization
1. **Increase Elite Product Stock**: Focus on $129+ products for maximum revenue
2. **Reduce Adidas Discounts**: Test revenue impact of smaller discounts
3. **Introduce Nike Discounts**: Small discounts may increase overall volume

### 🛍️ Product Strategy
1. **Expand Footwear**: Leverage the 85% stock success rate
2. **Boost Clothing Sales**: Increase discounts to match footwear performance
3. **Category Development**: Focus on "Expensive" and "Elite" categories

### 📊 Marketing Initiatives
1. **Review Campaigns**: Target Q2-Q4 for increased review volume
2. **Quality Focus**: Leverage strong review-revenue correlation
3. **Seasonal Strategies**: Capitalize on Q1 review peak patterns

## 🛠️ Technical Requirements

- **Database**: MySQL
- MySQL Workbench

## 📊 Data Quality

- **Total Products**: 3,179 items
- **Data Completeness**: >95% for most columns
- **Missing Data**: Only `last_visited` column has >5% missing values
- **Data Types**: Proper handling of numeric, string, and timestamp data


## 🔍 Usage Examples

### Quick Revenue Check
```sql
-- Get total revenue
SELECT ROUND(SUM(revenue), 2) AS total_revenue FROM finance;
```

### Brand Performance
```sql
-- Compare Nike vs Adidas
SELECT b.brand, ROUND(SUM(f.revenue), 2) AS total_revenue
FROM finance f
JOIN brands b ON f.product_id = b.product_id
GROUP BY b.brand
ORDER BY total_revenue DESC;
```

### Top Products
```sql
-- Find top 5 revenue generators
SELECT i.product_name, f.revenue
FROM finance f
JOIN info i ON f.product_id = i.product_id
ORDER BY f.revenue DESC
LIMIT 5;
```
