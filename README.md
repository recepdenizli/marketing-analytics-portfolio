# 📊 Marketing Analytics SQL Portfolio

This repository showcases end-to-end marketing analytics projects using **SQL (PostgreSQL)** and **Google BigQuery / GA4 event data**.

The goal of this project is to simulate real-world marketing analytics tasks such as campaign performance measurement, conversion funnel analysis, and user behavior tracking.

---

## 🎯 Project Objective

The main objectives of this project are:

- Analyze advertising campaign performance across Google Ads and Facebook Ads
- Measure marketing efficiency using ROMI (Return on Marketing Investment)
- Build conversion funnel metrics from GA4 event data
- Evaluate user behavior across sessions and traffic sources
- Prepare BI-ready datasets for reporting and visualization

---

## 🛠️ Tools & Technologies

- SQL
- PostgreSQL
- Google BigQuery
- Google Analytics 4 (GA4)
- Data Aggregation & Window Functions
- Funnel Analysis Techniques

---

## 📁 Project Structure

### 1. Campaign Performance Analysis
**File:** `01-daily-ad-performance-metrics.sql`

- Daily analysis of ad spend across Google and Facebook
- Calculation of average, minimum, and maximum spend values
- Platform-based performance comparison

---

### 2. ROMI Analysis
**File:** `02-top-romi-analysis.sql`

- Ranking of campaigns based on Return on Marketing Investment
- Identification of top-performing days by revenue efficiency

---

### 3. Weekly Campaign Performance
**File:** `03-weekly-campaign-value-analysis.sql`

- Aggregation of campaign performance on a weekly level
- Identification of highest value generating campaigns

---

### 4. Campaign Reach Growth Analysis
**File:** `04-monthly-campaign-reach-growth.sql`

- Monthly reach growth tracking per campaign
- Detection of campaigns with the highest audience expansion

---

### 5. Adset Duration Analysis
**File:** `05-longest-running-adset-analysis.sql`

- Identification of longest continuously running ad sets
- Cross-platform analysis (Google Ads + Facebook Ads)

---

## 📈 GA4 & BigQuery Analysis

### 6. GA4 Event Data Preparation

**Query Link:**
https://console.cloud.google.com/bigquery?sq=416173545253:75b838d1e03746c9a0bf64378f958d35

- Filtering GA4 events for e-commerce behavior
- Preparing structured event-level dataset for analysis

---

### 7. Conversion Funnel Analysis

**Query Link:**
https://console.cloud.google.com/bigquery?sq=416173545253:8b6773b273744069a5c1a428affff0b3

- Session-based funnel tracking (session_start → purchase)
- Conversion rate calculation across funnel stages

---

### 8. Landing Page Performance Analysis

**Query Link:**
https://console.cloud.google.com/bigquery?sq=416173545253:56266571812446bb8c572df6214d81ce

- Landing page performance comparison
- Purchase conversion rate per page path
- User session-level attribution analysis

---

## 📊 Key Analytical Concepts Used

- Aggregation (GROUP BY)
- CASE WHEN logic
- JOIN operations
- Session-based analysis
- Funnel conversion tracking
- Time-based analysis (daily / weekly / monthly)
- ROMI calculations
- Window functions (where applicable)

---

## 💡 Business Insights Delivered

This project enables insights such as:

- Which campaigns generate the highest return on investment
- How user behavior progresses through the conversion funnel
- Which traffic sources drive the most valuable users
- Which landing pages convert the best
- How marketing performance changes over time

---

## 🚀 Outcome

This project demonstrates practical skills in:

- Marketing analytics
- SQL-based data analysis
- GA4 event data processing
- Business-oriented reporting
- BI dataset preparation

---

## 📌 Note

All queries are written for learning and portfolio purposes using structured marketing datasets.
