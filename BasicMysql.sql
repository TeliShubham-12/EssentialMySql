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

/*When querying data from a table, you may get duplicate rows. To remove these duplicate rows, you use the DISTINCT clause in the SELECT statement*/
use classicmodels;
SELECT 
    lastname
FROM
    employees
ORDER BY 
    lastname;
    
    /*DISTINCT clause removes the duplicate last names from the result set.*/
    SELECT 
    DISTINCT lastname
FROM
    employees
ORDER BY 
    lastname;
    
   /* MySQL DISTINCT and NULL values*/
    
/*When you specify a column that has NULL values in the DISTINCT clause,
 the DISTINCT clause will keep only one NULL value because it considers all NULL values are the same*/
 
 SELECT DISTINCT state
FROM customers;

 SELECT DISTINCT state
FROM customers
order by state DESC;
 
/*MySQL DISTINCT with multiple columns*/ 
 
 SELECT DISTINCT
    state, city
FROM
    customers
WHERE
    state IS NOT NULL
ORDER BY 
    state, 
    city;
/* Use the MySQL DISTINCT clause to remove duplicate rows from the result set returned by the SELECT clause*/

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
CREATE PROCEDURE apply_labour_charges(IN shipping_item_id INT)
BEGIN
DECLARE labourcharges DOUBLE DEFAULT 0;
SELECT (goodscollections.quantity*ratecard.amount) INTO labourcharges FROM goodscollections
JOIN shippingitems ON goodscollections.id = shippingitems.collectionid
JOIN ratecard ON goodscollections.containertype = ratecard.title
WHERE shippingitems.id = shipping_item_id;

INSERT INTO goodscosting(shippingitemid,labourcharges) VALUES (shipping_item_id,labourcharges);
END;

CREATE PROCEDURE apply_service_charges(IN shipping_item_id INT)
BEGIN
    UPDATE goodscosting
    JOIN shippingitems ON goodscosting.shippingitemid = shippingitems.id
    JOIN verifiedgoodscollection ON shippingitems.collectionid = verifiedgoodscollection.collectionid
    JOIN ratecard ON ratecard.title = "servicecharges"
    SET goodscosting.servicecharges = verifiedgoodscollection.weight * ratecard.amount
    WHERE shippingitems.id = shipping_item_id;
END;

CREATE PROCEDURE apply_total_freight_charges(IN shipment_id INT, OUT total_freight_charges DOUBLE)
BEGIN
    SELECT (shipments.kilometers * ratecard.amount) INTO total_freight_charges
    FROM shipments
    INNER JOIN vehicles ON shipments.vehicleid = vehicles.id
    INNER JOIN ratecard ON vehicles.vehicletype = ratecard.title
    WHERE shipments.id = shipment_id;
END;

CREATE PROCEDURE apply_freight_charges_for_collection(IN shipment_id INT) 
BEGIN 
	DECLARE finished INT DEFAULT 0;
	DECLARE shipping_item_id INT DEFAULT 0;
	DECLARE freight_charges DOUBLE DEFAULT 0;
	DECLARE totalfreightcharges DOUBLE DEFAULT 0;
	DECLARE collection_weight DOUBLE DEFAULT 0;
	DECLARE total_collections_weight DOUBLE DEFAULT 0;
	DECLARE freight_rate_per_kg DOUBLE DEFAULT 0;

	DECLARE cursor_shipment_item_id CURSOR FOR
	SELECT id FROM shippingitems WHERE shipmentid = shipment_id;

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

	CALL apply_total_freight_charges(shipment_id,@total_freight_charges);
	SELECT @total_freight_charges INTO totalfreightcharges;

	SELECT SUM(weight) INTO total_collections_weight FROM verifiedgoodscollection
	INNER JOIN shippingitems ON verifiedgoodscollection.collectionid = shippingitems.collectionid
	WHERE shippingitems.shipmentid = shipment_id;

	SET freight_rate_per_kg=totalfreightcharges/total_collections_weight;

	OPEN cursor_shipment_item_id;
	updatefreightcharges: LOOP
	    FETCH cursor_shipment_item_id INTO shipping_item_id;

        IF finished = 1 THEN 
            LEAVE updatefreightcharges;
        END IF;

        SELECT weight INTO collection_weight FROM verifiedgoodscollection
        INNER JOIN shippingitems ON verifiedgoodscollection.collectionid = shippingitems.collectionid
        WHERE shippingitems.id = shipping_item_id;

        SET freight_charges = freight_rate_per_kg * collection_weight;

        UPDATE goodscosting SET freightcharges = freight_charges WHERE shippingitemid = shipping_item_id;
	END LOOP updatefreightcharges;
	CLOSE cursor_shipment_item_id;
END; 


CREATE PROCEDURE calculate_total_amount(IN shipping_item_id INT)
BEGIN
	DECLARE collection_weight DOUBLE DEFAULT 0;
	DECLARE rateperkg DOUBLE DEFAULT 0;
	DECLARE amount DOUBLE DEFAULT 0;
	DECLARE total_charges DOUBLE DEFAULT 0;

    SELECT weight INTO collection_weight FROM verifiedgoodscollection
    INNER JOIN shippingitems ON verifiedgoodscollection.collectionid = shippingitems.collectionid
    WHERE shippingitems.id = shipping_item_id;

	SELECT (labourcharges+servicecharges+freightcharges) INTO total_charges FROM goodscosting WHERE shippingitemid=shipping_item_id; 

	SELECT rate INTO rateperkg FROM invoices WHERE shippingitemid=shipping_item_id;
    SET amount=(collection_weight*rateperkg) - total_charges ;

	UPDATE invoices SET totalamount=amount WHERE shippingitemid=shipping_item_id;
END;
Drop DATABASE IF EXISTS eagroservicesdb;
CREATE DATABASE eagroservicesdb;
USE eagroservicesdb;

CREATE TABLE
    users(
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        peopleid INT NOT NULL UNIQUE
    );

CREATE TABLE
    roles(
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        name varchar(20)
    );

CREATE TABLE
    userroles(
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        userid INT NOT NULL,
        roleid INT NOT NULL,
        CONSTRAINT fk_userrole FOREIGN KEY(userid) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT fk_userroles FOREIGN KEY(roleid) REFERENCES roles(id) ON UPDATE CASCADE ON DELETE CASCADE
    );

CREATE TABLE
    transporters(
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        corporateid INT NOT NULL ,
        managerid INT NOT NULL UNIQUE,
        CONSTRAINT fk_manageruser FOREIGN KEY(managerid) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
    );

CREATE TABLE
    vehicles(
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        transporterid INT NOT NULL,
        vehicletype VARCHAR (30),
        rtonumber VARCHAR(15) NOT NULL UNIQUE,
        CONSTRAINT fk_vehicles_transporters FOREIGN KEY (transporterid) REFERENCES transporters(id) ON UPDATE CASCADE ON DELETE CASCADE
    );

CREATE TABLE
    crops(
        id int NOT Null AUTO_INCREMENT PRIMARY KEY,
        title VARCHAR(20) NOT NULL UNIQUE,
        imageurl VARCHAR(30) NOT NULL,
        rate DOUBLE NOT NULL DEFAULT 0
    );

CREATE TABLE
    collectioncenters(
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        corporateid INT NOT NULL ,
        inspectorid INT NOT NULL UNIQUE,
        CONSTRAINT fk_inspector_user FOREIGN KEY(inspectorid) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
    );

CREATE TABLE
    merchants(
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        corporateid INT NOT NULL ,
        managerid INT NOT NULL UNIQUE,
        CONSTRAINT fk_manager_users FOREIGN KEY(managerid) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
    );

CREATE TABLE
    goodscollections(
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        collectioncenterid INT,
        farmerid INT NOT NULL,
        cropid INT NOT NULL,
        containertype ENUM('crates','bags','polythene bags'),
        quantity INT NOT NULL,
        weight DOUBLE NOT NULL,
        collectiondate DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW(),
        CONSTRAINT fk_farmer_users FOREIGN KEY (farmerid) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT fk_goodscollection_crops FOREIGN KEY (cropid) REFERENCES crops(id) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT fk_goodscollection_collectioncenter FOREIGN KEY(collectioncenterid) REFERENCES collectioncenters(id) ON UPDATE CASCADE ON DELETE CASCADE
    );

CREATE TABLE
    verifiedgoodscollection(
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        collectionid INT NOT NULL,
        grade ENUM ('A', 'B', 'C', 'D'),
        weight DOUBLE,
        inspectorid INT,
        CONSTRAINT fk_verified_goodscollections FOREIGN KEY (collectionid) REFERENCES goodscollections(id) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT fk_inspector_users FOREIGN KEY (inspectorid) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
        inspectiondate DATETIME NOT NULL DEFAULT NOW()
    );

CREATE TABLE
    shipments(
        id INT PRIMARY KEY AUTO_INCREMENT,
        vehicleid INT,
        merchantid INT,
        kilometers INT,
        shipmentdate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        CONSTRAINT fk_shipment_vehicle FOREIGN KEY (vehicleid) REFERENCES vehicles(id) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT fk_shipment_users FOREIGN KEY (merchantid) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
    );

CREATE TABLE
    shippingitems(
        id INT AUTO_INCREMENT PRIMARY KEY,
        shipmentid INT,
        collectionid INT UNIQUE,
        CONSTRAINT fk_shippingitems_shipment FOREIGN KEY (shipmentid) REFERENCES shipments(id) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT fk_shippingitems_goodscollection FOREIGN KEY (collectionid) REFERENCES goodscollections(id) ON UPDATE CASCADE ON DELETE CASCADE
    );

CREATE TABLE
    ratecard(
        id INT AUTO_INCREMENT PRIMARY KEY,
        title VARCHAR(50) UNIQUE,
        description VARCHAR(50),
        amount DOUBLE
    );

CREATE TABLE
    goodscosting(
        id INT PRIMARY KEY AUTO_INCREMENT,
        shippingitemid INT NOT NULL UNIQUE,
        freightcharges DOUBLE,
        labourcharges DOUBLE,
        servicecharges DOUBLE,
        CONSTRAINT fk_goodscosting_shippingitems FOREIGN KEY (shippingitemid) REFERENCES shippingitems(id) ON UPDATE CASCADE ON DELETE CASCADE
    );

CREATE TABLE
    invoices (
        id INT AUTO_INCREMENT PRIMARY KEY,
        shippingitemid INT UNIQUE,
        rate DOUBLE,
        totalamount DOUBLE DEFAULT 0,
        invoicedate DATETIME NOT NULL DEFAULT NOW() ON UPDATE NOW(),
        CONSTRAINT fk_shippingItemsid FOREIGN KEY (shippingitemid) REFERENCES shippingitems(id) ON UPDATE CASCADE ON DELETE CASCADE
    );

CREATE TABLE
    payments(
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        date DATETIME DEFAULT CURRENT_TIMESTAMP,
        transactionid INT NOT NULL UNIQUE,
        amount DOUBLE NOT NULL
    );

CREATE TABLE
    goodscollectionpayments(
        id INT AUTO_INCREMENT PRIMARY KEY,
        collectionid INT,
        paymentid INT,
        CONSTRAINT fk_goodscollectionpayments FOREIGN KEY (collectionid) REFERENCES goodscollections(id) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT fk_goodscollectionpayments_payments FOREIGN KEY (paymentid) REFERENCES payments(id) ON UPDATE CASCADE ON DELETE CASCADE
    );

CREATE TABLE
    goodsservicespayments(
        id INT AUTO_INCREMENT PRIMARY KEY,
        collectionid INT,
        paymentid INT,
        CONSTRAINT fk_goodsservicespayments_goodscollections FOREIGN KEY (collectionid) REFERENCES goodscollections(id) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT fk_goodsservicespayments_payments FOREIGN KEY (paymentid) REFERENCES payments(id) ON UPDATE CASCADE ON DELETE CASCADE
    );

CREATE TABLE
    transporterpayments(
        id INT AUTO_INCREMENT PRIMARY KEY,
        shipmentid INT,
        paymentid INT,
        CONSTRAINT fk_transporterpayments_shipment FOREIGN KEY (shipmentid) REFERENCES shipments(id) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT fk_transporterpayments_payment FOREIGN KEY (paymentid) REFERENCES payments(id) ON UPDATE CASCADE ON DELETE CASCADE
    );
