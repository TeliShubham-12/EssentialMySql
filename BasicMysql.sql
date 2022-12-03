use classicmodels;
SELECT *FROM customers;   /*for display the table customers*/
SELECT customerName FROM customers;  /*The SELECT statement allows you to select data from one or more tables*/
SELECT (customerNumber) FROM customers;
                                    /* Using the MySQL SELECT statement to retrieve data from a single column */
SELECT lastName FROM employees;    /*display single column of employees data*/
                                   /*Using the MySQL SELECT statement to query data from multiple columns*/
 SELECT lastName, firstName, jobTitle FROM employees;                                  
   
                                    /*Using the MySQL SELECT statement to retrieve data from all columns*/
 SELECT employeeNumber,lastName,firstName,extension,email,officeCode,reportsTo,jobTitle FROM   employees; 
                                    /*Alternatively, you can use the asterisk (*) which is the shorthand for all
                                    columns.*/
SELECT * FROM employees;            /*The query returns data from all the columns of the employees table */
                       
 SELECT 1 + 1;            /* MySQL has many built-in functions like string, date, and Math functions.
 And you can use the SELECT statement to execute these functions  */  
 
  SELECT NOW();              /* the queary returns the current date and time of the MySQL server*/
							/* The NOW() function returns the current date & time of the server on which MySQL runs.
                            The NOW() function doesn’t have any parameters. To call it, you place the parentheses 
                            () after the function name*/
                            
SELECT CONCAT('John',' ','Doe');    /*The CONCAT() function accepts one or more strings and concatenates them into
                                             a single string.*/
 
SELECT customerName  AS MycustomersName FROM customers;    /*Syntax-SELECT expression AS column_alias; To change a column name of the result set, you can use a column alias:*/
 SELECT customerName MycustomersName FROM customers;
 
 SELECT CONCAT('John',' ','Doe') AS name;
 SELECT CONCAT('Jane',' ','Doe') AS 'Full name';   /*youu ca use alias as well as thise type*/
 
 use classicmodels;
SELECT customerName,contactLastName FROM customers ORDER BY customerName DESC, contactLastName ASC;/*The ASC stands for ascending and the DESC stands for descending. */
SELECT
	contactLastname,
	contactFirstname    /*The following uses the ORDER BY clause to sort the customers by their last names in ascending order*/
FROM
	customers
ORDER BY
	contactLastname;
                                  /*If  sort customers by the last name in descending order,  use the DESC after the contactLastname column in the ORDER BY clause*/
 SELECT
	contactLastname,
	contactFirstname
FROM
	customers
ORDER BY
	contactLastname DESC;
                                          /*MySQL ORDER BY clause to sort the result set by multiple columns*/
SELECT * FROM  orderdetails;                                         /*MySQL ORDER BY clause to sort a result set by an expression*/
SELECT 
    orderNumber, 
    orderlinenumber, 
    quantityOrdered * priceEach
FROM
    orderdetails
ORDER BY 
   quantityOrdered * priceEach DESC;
    
    /* assign the expression in the SELECT clause a column alias and use that column alias in the ORDER BY clause*/
 
 SELECT 
    orderNumber,        
    orderLineNumber,
    quantityOrdered * priceEach AS subtotal
FROM
    orderdetails
ORDER BY subtotal DESC;               /* subtotal as the column alias for the expression quantityOrdered * priceEach and sort the result set by the subtotal alias.*/

/*MySQL ORDER BY clause to sort data using a custom list The FIELD()
 function returns the position of the str in the str1, str2, … list. If the str is not in the list, the FIELD() function returns 0.*/
SELECT FIELD('A', 'A', 'B','C');
SELECT FIELD('B', 'A','B','C');
use classicmodels;
SELECT 
    orderNumber, status
FROM
    orders
ORDER BY FIELD(status,
        'In Process',
        'On Hold',
        'Cancelled');

SELECT 
    orderNumber, status
FROM
    orders
ORDER BY FIELD(status,
        'In Process',
        'On Hold',
        'Cancelled',
        'Resolved',
        'Disputed',
        'Shipped');
/*MySQL ORDER BY and NULL*/

SELECT 
    firstName, lastName, reportsTo
FROM
    employees
ORDER BY reportsTo;

SELECT 
    firstName, lastName, reportsTo
FROM
    employees
ORDER BY reportsTo DESC;
/*Use the ORDER BY clause to sort the result set by one or more columns.
Use the ASC option to sort the result set in ascending order and the DESC option to sort the result set in descending order.
The ORDER BY clause is evaluated after the FROM and SELECT clauses.
In MySQL, NULL is lower than non-NULL values*/
 
 /*whare

1) Using MySQL WHERE clause with equality operator
query uses the WHERE clause to find all employees whose job titles are Sales Rep.*/

 use classicmodels;
 SELECT * FROM employees;
 SELECT 
    lastname, 
    firstname, 
    jobtitle
FROM
    employees
WHERE
    jobtitle = 'Sales Rep';
 
/* 2) Using MySQL WHERE clause with the AND operator*/
 
 SELECT 
    lastname, 
    firstname, 
    jobtitle,
    officeCode
FROM
    employees
WHERE
    jobtitle = 'President' AND        /*The AND operator evaluates to TRUE only if both expressions evaluate to TRUE. Therefore,
                                            the query returns rows whose values in the jobTitle column is Sales Rep and officeCode is 1*/
	officeCode = 1;
 
 /*3) Using MySQL WHERE clause with OR operator*/
 
 SELECT 
    lastName, 
    firstName, 
    jobTitle, 
    officeCode
FROM
    employees
WHERE
   officeCode = 2 OR 
    jobtitle = 'Sales Rep'
ORDER BY 
    officeCode , 
    jobTitle;
    /*The OR operator evaluates to TRUE only if one of the expressions evaluates to TRUE:*/
 /* the query returns any employee who has the job title Sales Rep or office code 1*/
 
 
/* 4) Using MySQL WHERE clause with the BETWEEN operator example
 The BETWEEN operator returns TRUE if a value is in a range of values*/
 
 SELECT 
    firstName, 
    lastName, 
    officeCode
FROM
    employees
WHERE
    officeCode BETWEEN 3 AND 7
ORDER BY officeCode;

/*5) Using MySQL WHERE clause with the LIKE operator example*/

SELECT 
    firstName, 
    lastName
FROM
    employees
WHERE                       /*The following query finds the employees whose last names start with the string 'Tho':*/
    lastName LIKE 'Tho%'
ORDER BY firstName;

SELECT 
    firstName, 
    lastName
FROM
    employees
WHERE                       /*The following query finds the employees whose last names end with the string 'son':*/
    lastName LIKE '%son'
ORDER BY firstName;

/*6) Using MySQL WHERE clause with the IN operator example
The IN operator returns TRUE if a value matches any value in a list 
 WHERE clause with the IN operator to find employees who locate in the office with office code 1.*/
SELECT 
    firstName, 
    lastName, 
    officeCode
FROM
    employees
WHERE
    officeCode IN (  2, 3,4)
ORDER BY 
    officeCode;

/*7) Using MySQL WHERE clause with the IS NULL operator*/

SELECT 
    lastName, 
    firstName, 
    reportsTo
FROM
    employees
WHERE
    reportsTo IS NULL;
    
   /* In the database world, NULL is a marker that indicates that a value is missing or unknown. And NULL is not equivalent to the number 0 or an empty string*/

  /*8) Using MySQL WHERE clause with comparison operators */

SELECT 
    lastname, 
    firstname, 
    jobtitle          /*The query uses the not equal to (<>) operator to find all employees who are not the Sales Rep*/
FROM
    employees
WHERE
    jobtitle <> 'Sales Rep';
    
/* The following query finds employees whose office code is greater than 5*/
    
    SELECT 
    lastname, 
    firstname, 
    officeCode
FROM
    employees
WHERE 
    officecode > 5;
    
    
    /*The query returns employees with office code less than or equal to 4 (<=4):*/

SELECT 
    lastname, 
    firstname, 
    officeCode
FROM
    employees
WHERE 
    officecode <= 4;
    
    
    
   /* Use the WHERE clause to filter rows by a condition.
MySQL evaluates the WHERE clause after the FROM clause and before the SELECT and ORDER BY clauses.*/