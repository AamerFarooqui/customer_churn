📊 Customer Churn Analysis Project

📌 Project Overview

This project focuses on analyzing customer churn data to identify key factors influencing customer retention and churn behavior. The dataset contains 7,043 customer records with 21 features including demographics, services subscribed, billing details, and churn status.

The goal of this project is to perform data cleaning, exploratory data analysis (EDA), and business insights extraction using Python.


---

🎯 Objectives

Understand customer churn patterns

Perform data cleaning and preprocessing

Handle missing and inconsistent data

Explore relationships between customer attributes and churn

Generate actionable business insights



---

📂 Dataset Information

Total Records: 7,043

Total Features: 21

Target Variable: Churn

File Used: Customer Churn.csv


Key Features:

Demographics: gender, SeniorCitizen, Partner, Dependents

Account Info: tenure, Contract, PaperlessBilling

Services: PhoneService, InternetService, StreamingTV, etc.

Billing: MonthlyCharges, TotalCharges

Target: Churn



---

🛠️ Technologies Used

Python

Pandas

NumPy

Matplotlib

Seaborn

Jupyter Notebook



---

🔄 Data Cleaning & Preprocessing

✔ Replaced blank values in TotalCharges with 0
✔ Converted TotalCharges from object to float
✔ Checked and confirmed:

No null values

No duplicate records
✔ Converted SeniorCitizen values from (0,1) to (No,Yes)



---

📊 Exploratory Data Analysis (EDA)

The following analysis was performed:

Distribution of customer demographics

Tenure analysis

Monthly vs Total charges analysis

Service subscription patterns

Contract type vs churn relationship

Payment method vs churn impact

Senior citizen churn trends



---

📈 Key Insights

Customers with month-to-month contracts are more likely to churn.

Higher monthly charges are associated with higher churn probability.

Customers with short tenure show higher churn rates.

Certain payment methods (like electronic check) show higher churn trends.

Long-term contracts significantly reduce churn risk.



---

📌 Project Structure

Customer-Churn-Analysis/
│
├── Customer Churn.csv
├── churn_analysis.ipynb
├── README.md


---

🚀 How to Run This Project

1. Clone the repository



git clone https://github.com/your-username/customer-churn-analysis.git

2. Install required libraries



pip install pandas numpy matplotlib seaborn

3. Open Jupyter Notebook



jupyter notebook

4. Run churn_analysis.ipynb




---

💡 Business Impact

This analysis helps businesses:

Identify high-risk customers

Improve customer retention strategies

Optimize pricing and contract structures

Make data-driven business decisions
