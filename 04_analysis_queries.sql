/*
Sales Data Analysis with SQL

Este projeto utiliza o conjunto de dados "sales dataset",
que apresenta dados de vendas sintéticos gerados para fins de simulação.

O conjunto de dados pode ser acessado no Kaggle pelo link:
https://www.kaggle.com/datasets/vinothkannaece/sales-dataset
*/

-- Análises SQL

-- 1 - Receita total
SELECT SUM(Sales_Amount) AS receita_total
FROM sales_data;

-- 2 - Receita e lucro por região
SELECT 
    Region,
    SUM(Sales_Amount) AS receita_total,
    SUM((Unit_Price - Unit_Cost) * Quantity_Sold) AS lucro_total
FROM sales_data
GROUP BY Region
ORDER BY receita_total DESC;

-- 3 - Performance por vendedor
SELECT 
    Sales_Rep,
    SUM(Sales_Amount) receita,
    COUNT(*) total_vendas
FROM sales_data
GROUP BY Sales_Rep
ORDER BY receita DESC;

-- 4 - Receita mensal
SELECT 
    DATE_FORMAT(Sale_Date, '%Y-%m') mes,
    SUM(Sales_Amount) receita
FROM sales_data
GROUP BY mes
ORDER BY mes;

-- 5 - Receita por categoria
SELECT 
    Product_Category,
    SUM(Sales_Amount) receita
FROM sales_data
GROUP BY Product_Category
ORDER BY receita DESC;

-- 6 - Comparação clientes novos vs recorrentes
SELECT 
    Customer_Type,
    SUM(Sales_Amount) receita,
    COUNT(*) total_vendas
FROM sales_data
GROUP BY Customer_Type;

-- 7 - Vendas por canal (Online vs Retail)
SELECT 
    Sales_Channel,
    SUM(Sales_Amount) AS receita_total,
    COUNT(*) AS total_vendas
FROM sales_data
GROUP BY Sales_Channel;
