# Create the following tables and add the specified constraints. 
# Add 5 rows to each table

DELIMITER ;
USE technologic;
DROP TABLE IF EXISTS `order`;
DROP TABLE IF EXISTS customer;

CREATE TABLE customer (
    custid INT(5) PRIMARY KEY,
    cname VARCHAR(30) NOT NULL,
    aadhar VARCHAR(20) UNIQUE NOT NULL,
    city VARCHAR(20),
    state VARCHAR(20)
);

CREATE TABLE `order` (
    ordid INT(5) PRIMARY KEY,
    orderdate VARCHAR(30) NOT NULL,
    orderamt VARCHAR(30),
    custid INT(5),
    FOREIGN KEY (custid)
        REFERENCES customer (custid)
        ON DELETE CASCADE
);

insert into customer values (1, 'Kishori', '563872548254', 'Pune', 'Maharashtra');
insert into customer values (2, 'Praphul', '537284659834', 'Pimpri Chinchwad', 'Maharashtra');
insert into customer values (3, 'Eileen', '582726593759', 'Mumbai', 'Maharashtra');
insert into customer values (4, 'Swati', '598233726582', 'Pune', 'Maharashtra');
insert into customer values (5, 'Abhishek', '527563892364', 'Mumbai', 'Maharashtra');

insert into `order` values (1, 'Jan 02, 2019', '50000', 1);
insert into `order` values (2, 'Feb 23, 2019', '100000', 2);
insert into `order` values (3, 'Mar 12, 2019', '30000', 3);
insert into `order` values (4, 'Apr 30, 2019', '200000', 1);
insert into `order` values (5, 'May 19, 2019', '70000', 3);

# Q1 -> 1: List all the customer who stays in the same city of Kishori

SELECT 
    custid ID, cname `Name`
FROM
    customer
WHERE
    city = (SELECT 
            city
        FROM
            customer
        WHERE
            cname = 'Kishori');

# Q1 -> 2: Display orderid and orderdate for all customer's orders with order amount greater than the average order amount

SELECT 
    ordid 'Order ID', orderdate 'Order Date'
FROM
    (SELECT 
        ordid, orderdate, orderamt
    FROM
        `order`
    HAVING orderamt > (SELECT 
            AVG(orderamt)
        FROM
            `order`)) AS T;

# Q1 -> 3: Display Customers who have not placed any orders

SELECT 
    cname 'Customers who have not placed any orders'
FROM
    customer c
        LEFT JOIN
    `order` o ON c.custid = o.custid
WHERE
    ordid IS NULL;
    
# Q2: Write a procedure to display order type as
#		express		if 	orderamt > 5000
#		fast		if 	orderamy <= 5000 and > 3000
#		regular		if 	otherwise

DROP procedure if exists ORDER_TYPE;
SET SQL_SAFE_UPDATES=0;

DELIMITER //
CREATE PROCEDURE ORDER_TYPE ()
BEGIN

-- drop table if exists o_type;
-- create table o_type as select * from `order`;
-- alter table o_type add `type` varchar(20);

declare cend boolean;
declare orderval_t varchar(10);
declare order_t varchar(10);
declare ordid_t int(5);

	# declare cursor
declare mycur cursor for select orderamt, ordid from `order`;
	# declare continue handler for not found
declare continue handler for not found set cend = true;

	# Create temp table to store order type temporarily
drop table if exists o_type;
create table o_type as select * from `order`;
alter table o_type add `type` varchar(20);


	# open cursor
open mycur;	
	# loop 
loopdeloop : loop 
	# fetch data from cursor into variables
fetch mycur into orderval_t, ordid_t;
	# check if cend is true
if cend = true then 
	# 	if yes stop loop
	leave loopdeloop;
	# 	if no then process data
end if;
	# repeat fetch data from cursor into var and hence

#		express		if 	orderamt > 5000
#		fast		if 	orderamy <= 5000 and > 3000
#		regular		if 	otherwise    
    
if orderval_t > 5000 then 
	set order_t = 'express';
elseif  orderval_t between 3001 and 5000 then
	set order_t = 'fast';
else 
	set order_t = 'regular';
end if;

update o_type set `type` = order_t where ordid = ordid_t;

end loop loopdeloop;
	# close cursor
close mycur;

select ordid ID, `type` "Order Type" from o_type;

drop table if exists o_type;

END //

DELIMITER ;

call order_type();

# Q2: Write a procedure to display order type as
#		express		if 	orderamt > 5000
#		fast		if 	orderamy <= 5000 and > 3000
#		regular		if 	otherwise

drop procedure if exists order_type_concise;

delimiter //

create procedure order_type_concise()
begin

declare ordno_p int;
declare ordtype_p varchar(20);

SELECT  o.ordid ID, if((o.orderamt > 5000), 'express', if ((o.orderamt > 3000), 'fast', 'regular')) as "Order Type" from `order` o;

end //

delimiter ;

call order_type_concise();


































