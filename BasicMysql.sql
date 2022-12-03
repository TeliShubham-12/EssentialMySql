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
 
 
 