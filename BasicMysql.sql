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
 
 