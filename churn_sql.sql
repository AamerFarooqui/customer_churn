USE customer_churn;
SELECT * FROM customer_churn;

-- What is the total number of customers?
SELECT COUNT(CustomID) AS total_customers
FROM customer_churn;

-- How many customers have churned vs not churned?
SELECT SUM(Churn = 'Yes') AS Churned,
SUM(Churn = 'No') AS Stay 
FROM customer_churn;

-- 3. What is the churn rate (%)?
SELECT ROUND(SUM(Churn = 'Yes')/COUNT(*),2)*100 AS Churn_rate
FROM customer_churn;

-- 4. Count customers by gender.
SELECT SUM(gender = 'Male') AS Male,
SUM(gender = 'Female') AS Female
FROM customer_churn;

-- 5. What is the distribution of customers by contract type (Monthly, Yearly, etc.)?
SELECT Contract, COUNT(*) FROM customer_churn
GROUP BY Contract;

-- 6. What is the churn rate by contract type?
SELECT 
    contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM customer_churn
GROUP BY contract;

-- 7. What is the average tenure of churned vs non-churned customers?
SELECT Churn, ROUND(AVG(tenure),2) from customer_churn
GROUP BY Churn;

-- 8. Which payment method has the highest churn rate?
SELECT PaymentMethod, ROUND(SUM(Churn = 'Yes')/COUNT(*),2)*100 AS Churn_rate
FROM customer_churn
GROUP BY PaymentMethod
ORDER BY Churn_rate DESC
LIMIT 1;

-- 9. What is the churn rate for customers with and without internet service?
SELECT 
    InternetService,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn
GROUP BY InternetService;

-- 10. Compare monthly charges of churned vs retained customers.
SELECT Churn, COUNT(customerID) Customers,
ROUND(SUM(MonthlyCharges),2) AS Monthly_charges
FROM customer_churn
GROUP BY Churn;

-- 11 Identify the top 3 factors contributing to churn
-- (based on highest churn rates across features).

-- Senior Citizen
SELECT 'SeniorCitizen' AS feature,
SeniorCitizen AS category,
ROUND(SUM(Churn = 'Yes')/COUNT(*),2)*100 AS Churn_rate
FROM customer_churn
GROUP BY SeniorCitizen

-- Internet Service
UNION ALL
SELECT 'InternetService' AS feature,
InternetService AS category,
ROUND(SUM(Churn = 'Yes')/COUNT(*),2)*100
FROM customer_churn
GROUP BY InternetService

-- Paperless billing
UNION ALL
SELECT 'PaperlessBilling' AS feature,
PaperlessBilling AS category,
ROUND(SUM(Churn = 'Yes')/COUNT(*),2)*100
FROM customer_churn
GROUP BY PaperlessBilling

-- Payment Method
UNION ALL
SELECT 'PaymentMethod' AS feature,
PaymentMethod AS category,
ROUND(SUM(Churn = 'Yes')/COUNT(*),2)*100
FROM customer_churn
GROUP BY PaymentMethod
ORDER BY Churn_rate DESC
LIMIT 3;

/* 12. Segment customers into risk groups (High, Medium, Low churn risk) using conditions like:

* By Tenure
* By Payment Method
* By Contract
*/

-- By Contract
SELECT 
    CASE 
        WHEN tenure BETWEEN 0 AND 12 THEN '0-12'
        WHEN tenure BETWEEN 13 AND 24 THEN '13-24'
        ELSE '25+'
    END AS tenure_group,
    
CASE
	WHEN tenure <=12 THEN "High Risk"
    WHEN tenure >=13 AND tenure <=25 THEN "Medium Risk"
    ELSE "Low Risk"
END AS Risk_capecity,
ROUND(SUM(Churn = 'Yes')/COUNT(*),2)*100 AS churn_rate
FROM customer_churn
GROUP BY Risk_capecity,tenure_group
ORDER BY tenure_group ASC
LIMIT 3;

-- By Monthly charges
SELECT 
    PaymentMethod,
    ROUND(SUM(Churn = 'Yes') / COUNT(*) * 100, 2) AS churn_rate,
    CASE 
        WHEN ROUND(SUM(Churn = 'Yes') / COUNT(*) * 100, 2) <= 25 THEN 'Low Risk'
        WHEN ROUND(SUM(Churn = 'Yes') / COUNT(*) * 100, 2)  BETWEEN 26 AND 30 THEN 'Medium Risk'
        ELSE 'High Risk'
    END AS Risk_category
FROM customer_churn
GROUP BY PaymentMethod;

-- By Contract
SELECT Contract,
CASE 
	when Contract = 'Month-to-month' THEN "High Risk"
	WHEN Contract = 'One year' THEN "Medium Risk"
    WHEN Contract = 'Two year' THEN "Low Risk"
END AS Risk,
ROUND(SUM(Churn = 'Yes')/COUNT(*),2)*100 AS churn_rate
FROM customer_churn
GROUP BY Contract;