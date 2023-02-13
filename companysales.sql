# All Customer records
SELECT * FROM sales.customers;

#All Transaction 
SELECT * FROM sales.transactions; /*we can see that sales amount is negative */ 

# All product
SELECT * FROM sales.products;

# Markets in regions
SELECT * FROM sales.markets;

# Total number of customers
SELECT count(*) FROM sales.customers;

# Total sales transaction
SELECT count(*) FROM sales.transactions;

#Currency duplication
SELECT distinct(sales.transactions.currency) from transactions; # INR AND USD are duplicated 

SELECT count(*) from sales.transactions where sales.transactions.currency="INR\r"; # 150000 so cant removed
SELECT count(*) from sales.transactions where sales.transactions.currency="INR"; #279 so we can remove as it is bad record

SELECT count(*) from sales.transactions where sales.transactions.currency="USD\r"; # 2 it is
SELECT count(*) from sales.transactions where sales.transactions.currency="USD"; # 2 it is so we can keep anyone but as 

# LET SEE USD AND USD/r RECORDS 
SELECT * from sales.transactions where sales.transactions.currency='USD\r' or sales.transactions.currency='USD';

# \r currency is more so keeping this record in both USD and INR 
# Transaction for chennai market(market_code='Mark001')
SELECT * FROM sales.transactions where market_code='Mark001';

# Total transaction done in chennai
SELECT count(*) FROM sales.transactions where market_code='Mark001';


# Distinct product codes sold in chennai
SELECT distinct product_code FROM sales.transactions where market_code='Mark001';


#Transaction where currency is US dollar
SELECT * FROM sales.transactions where currency='USD';


# Transaction in 2020 (join transaction table with date table)
SELECT sales.transactions.*,sales.date.* FROM sales.transactions INNER JOIN sales.date ON sales.transactions.order_date=sales.date.date where sales.date.year=2020 ;


# Total revenue in year 2020
SELECT SUM(sales.transactions.sales_amount) FROM sales.transactions INNER JOIN sales.date ON sales.transactions.order_date=sales.date.date where sales.date.year=2020 ;

#Total revenue in year 2019
SELECT SUM(sales.transactions.sales_amount) FROM sales.transactions INNER JOIN sales.date ON sales.transactions.order_date=sales.date.date where sales.date.year=2019 ;

#Total Revenue in January month,2020


# Total revenue in Chennai in year 2020
SELECT SUM(sales.transactions.sales_amount) FROM sales.transactions INNER JOIN sales.date ON sales.transactions.order_date=sales.date.date 
where sales.date.year=2020 and sales.transactions.market_code='Mark001';