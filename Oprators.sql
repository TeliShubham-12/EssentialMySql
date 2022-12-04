
/*Introduction to MySQL AND operator*/

/*The AND operator is a logical operator that combines two or more Boolean expressions and returns 1, 0, or NULL:
The logical AND operator returns 1 if both A and B are non-zero and not NULL.
 It returns 0 if either operand is zero; otherwise, it returns NULL*/
 
SELECT 1 AND 0; 
SELECT 1 AND 0, 0 AND 1, 0 AND 0, 0 AND NULL;

/*In practice, you’ll use the AND operator in the WHERE clause of the SELECT, UPDATE, DELETE statements to form a condition.
 Also, you can the AND operator in the conditions of the INNER JOIN and LEFT JOIN clauses.*/
 
 SELECT 1 = 0 AND 1 / 0 ;
 
/* MySQL AND operator*/
SELECT 
    customername, 
    country, 
    state
FROM
    customers
WHERE
    country = 'USA' AND 
    state = 'CA';

/*Use the AND operator to combine two Boolean expressions. The AND operator returns true when both expressions are true; otherwise, it returns false.
Use the AND operator to form conditions in the WHERE clause of the SELECT statement.*/


/*Introduction to the MySQL OR operator*/
SELECT 1 OR 1, 1 OR 0, 0 OR 1,0 OR 0;
SELECT 1 OR NULL, 0 OR NULL, NULL or NULL;
SELECT 1 = 1 OR 1 / 0;
/*Operator precedence*/

/*When an expression contains both AND and OR operators,
 MySQL uses the operator precedence to determine the order of evaluation of the operators.
 MySQL evaluates the operator with higher precedence first.
Since the AND operator has higher precedence than the OR operator, MySQL evaluates the AND operator before the OR operator.*/
use classicmodels;
SELECT (1 OR 0) AND 0;
/*MySQL OR operator*/

SELECT    
	customername, 
	country
FROM    
	customers
WHERE country = 'USA' OR 
       country ='France'; 
       
       SELECT   
	customername, 
	country, 
	creditLimit
FROM   
	customers
WHERE(country = 'USA'
		OR country = 'France')
	  AND creditlimit > 100000;
      
      /*The OR operator combines two Boolean expressions and returns true when either expression is true. Otherwise, it returns false.
MySQL evaluates the OR operator after the AND operator if an expression contains both AND and OR operators.
Use parentheses to change the order of evaluation*/

/*Introduction to the MySQL IN operator*/

/*First, specify the value to test on the left side of the IN operator. The value can be a column or an expression.
Second, specify a comma-separated list of values to match in the parentheses.
The IN operator is functionally equivalent to the combination of multiple OR operators*/

/*MySQL IN operator and NULL
Generally, the IN operator returns NULL in two cases:

The value on the left side of the operator is NULL.
The value doesn’t equal any value in the list and one of values in the list is NULL*/

SELECT NULL IN (1,2,3);

SELECT 
    officeCode, 
    city, 
    phone, 
    country
FROM
    offices
WHERE
    country IN ('USA' , 'France');
    
    SELECT 
    officeCode, 
    city, 
    phone
FROM
    offices
WHERE
    country = 'USA' OR country = 'France';
    
   /* Use the IN operator to check if a value is in a set of values.
Use the IN operator to form a condition for the WHERE clause*/


 /*Introduction to the MySQL NOT IN operator*/
 
 SELECT 1 NOT IN (1,2,3);
 SELECT NULL NOT IN (1,2,3);
 
SELECT 
    officeCode, 
    city, 
    phone
FROM
    offices
WHERE
    country NOT IN ('USA' , 'France')
ORDER BY 
    city; 
 
 
/* Use the MySQL NOT IN to check if a value doesn’t match any value in a list.*/

/* MySQL BETWEEN Operator*/
SELECT 15 BETWEEN 10 AND 20;
SELECT 15 BETWEEN 20 AND 30;
/*NOT BETWEEN*/
SELECT 15 NOT BETWEEN 10 AND 20;
SELECT 
    productCode, 
    productName, 
    buyPrice                     /* in between oprator is used*/
FROM
    products
WHERE
    buyPrice BETWEEN 90 AND 100;
    
    SELECT 
    productCode, 
    productName, 
    buyPrice
FROM
    products
WHERE
    buyPrice >= 90 AND buyPrice <= 100;
    
    SELECT 
    productCode, 
    productName, 
    buyPrice
FROM                                 /*not between oprator is used*/
    products
WHERE
    buyPrice NOT BETWEEN 20 AND 100;
    
    SELECT 
    productCode, 
    productName, 
    buyPrice                        /*logic used*/
FROM
    products
WHERE
    buyPrice < 20 OR buyPrice > 100;
    
    SELECT 
   orderNumber,
   requiredDate,
   status
FROM 
   orders
WHERE 
   requiredDate BETWEEN 
     CAST('2003-01-01' AS DATE) AND 
     CAST('2003-01-31' AS DATE);
     
    /* Use the MySQL BETWEEN operator to test if a value falls within a range of values*/
    
       /*MySQL LIKE operator*/
       
      /* A) Using MySQL LIKE operator with the percentage (%) wildcard examples*/
      SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE                                 /* First name Start from a */
    firstName LIKE 'a%';
      
      SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees              /* last name ends with on*/
WHERE
    lastName LIKE '%on';
    
    SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM                       /*on is present in the name*/
    employees
WHERE
    lastname LIKE '%on%';
    
   /* MySQL LIKE operator with underscore( _ ) wildcard examples*/
   
   SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees                    /* the name wich start with t and end with m*/
WHERE
    firstname LIKE 'T_m';
    
    /*MySQL NOT LIKE operator*/
    
SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM                                  /*not display the name wich start from m*/
    employees
WHERE
    lastName NOT LIKE 'm%';
    
    /*MySQL LIKE operator with the ESCAPE clause*/
    
    SELECT 
    productCode, 
    productName
FROM
    products
WHERE
    productCode LIKE '%\_20%';
    
    SELECT 
    productCode, 
    productName
FROM
    products
WHERE
    productCode LIKE '%$_20%' ESCAPE '$';
    
/*    Use the LIKE operator to test if a value matches a pattern.
The % wildcard matches zero or more characters.
The _ wildcard matches a single character.
Use ESCAPE clause specifies an escape character other than the default escape character (\).
Use the NOT operator to negate the LIKE operator.*/

 /*MySQL LIMIT clause*/
 use classicmodels;
SELECT 
    customerNumber, 
    customerName, 
    creditLimit
FROM
    customers
ORDER BY creditLimit DESC
LIMIT 5;


/*First, the ORDER BY clause sorts the customers by credits in high to low.
Then, the LIMIT clause returns the first 5 rows.*/

SELECT 
    customerNumber, 
    customerName, 
    creditLimit
FROM
    customers
ORDER BY creditLimit
LIMIT 5;
/*First, the ORDER BY clause sorts the customers by credits in low to high.
Then, the LIMIT clause returns the first 5 rows.*/

SELECT 
    customerNumber, 
    customerName, 
    creditLimit
FROM
    customers
ORDER BY 
    creditLimit, 
    customerNumber
LIMIT 5;

/*MySQL LIMIT clause for pagination*/

SELECT 
    COUNT(*) 
FROM                   /* Total no of rows count*/
    customers;
    
    SELECT 
    customerNumber, 
    customerName
FROM
    customers
ORDER BY customerName    
LIMIT 10;

/*This query uses the LIMIT clause to get the rows of the second page that include rows 11 – 20*/

SELECT 
    customerNumber, 
    customerName
FROM
    customers
ORDER BY customerName    
LIMIT 10, 10;

/*MySQL LIMIT to get the nth highest or lowest value*/

SELECT 
    customerName, 
    creditLimit
FROM
    customers
ORDER BY 
    creditLimit DESC    
LIMIT 1,1;

/*Let’s double-check the result. This query returns all customers sorted by credits from high to low:*/

SELECT 
    customerName, 
    creditLimit
FROM
    customers
ORDER BY 
    creditLimit DESC;
    
   /* MySQL LIMIT & DISTINCT clauses*/
   SELECT DISTINCT
    state
FROM
    customers
WHERE
    state IS NOT NULL
LIMIT 5;

/*Use the MySQL LIMIT clause to constrain the number of rows returned by the SELECT statement*/

/*Introduction to MySQL IS NULL operator*/

SELECT 
    customerName, 
    country, 
    salesrepemployeenumber
FROM
    customers
WHERE
    salesrepemployeenumber IS NULL
ORDER BY 
    customerName;
    
    SELECT 
    customerName, 
    country, 
    salesrepemployeenumber
FROM
    customers
WHERE
    salesrepemployeenumber IS NOT NULL
ORDER BY 
   customerName;
   
  /* MySQL IS NULL – specialized features*/
  
CREATE TABLE IF NOT EXISTS projects (
    id INT AUTO_INCREMENT,
    title VARCHAR(255),
    begin_date DATE NOT NULL,
    complete_date DATE NOT NULL,
    PRIMARY KEY(id)
);

INSERT INTO projects(title,begin_date, complete_date)
VALUES('New CRM','2020-01-01','0000-00-00'),
      ('ERP Future','2020-01-01','0000-00-00'),
      ('VR','2020-01-01','2030-01-01');
      
      SELECT * 
FROM projects
WHERE complete_date IS NULL;
      
INSERT INTO projects(title,begin_date, complete_date)
VALUES('MRP III','2010-01-01','2020-12-31');      
      
      SELECT 
    id
FROM
    projects
WHERE
    id IS NULL;
    
    
   /* Use the IS NULL operator to test if a value is NULL or not. The IS NULL operator returns one if a value is NULL.
The IS NOT NULL returns one if a value is not NULL
