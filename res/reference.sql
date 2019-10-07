# Procedure
SET SQL_SAFE_UPDATES=0;
DELIMITER //

CREATE PROCEDURE ORDER_TYPE ()
BEGIN
declare cend boolean;
declare orderval_t varchar(10);

declare mycur cursor for select orderamt, ordid from `order`;
declare continue handler for not found set cend = true;

SELECT  ordid ID, if((1=1), 'yes','no') as "alias" from `order`;

drop table if exists o_type;
create table o_type as select * from `order`;
alter table o_type add `type` varchar(20);

open mycur;	
loopdeloop : loop 
fetch mycur into orderval_t, ordid_t;

if cend = true then leave loopdeloop; end if;

if orderval_t > 5000 then set order_t = 'express';
elseif orderval_t between 3001 and 5000 then set order_t = 'fast';
else set order_t = 'regular'; end if;

update o_type set `type` = order_t where ordid = ordid_t;

end loop loopdeloop;
close mycur;

select ordid ID, `type` "Order Type" from o_type;
drop table if exists o_type;

END //
DELIMITER ;
call order_type();

#Trigger
DELIMITER ||
CREATE TRIGGER weekendInsertAudit BEFORE INSERT ON emp FOR EACH ROW BEGIN
  if weekday(curdate()) in (5, 6) then INSERT INTO audit SET log = 'INSERTED'; 	end if;  END;  
||

#Function
SET GLOBAL log_bin_trust_function_creators = 1;

delimiter ##
CREATE FUNCTION function_name(input_field int(4)) RETURNS int
BEGIN
	DECLARE vsal int;
	SELECT sal INTO vsal FROM emp WHERE empno = fempno;
	IF vyears < 32 THEN SET empAllowance = vsal; 	END IF;
	RETURN empAllowance;
end##
delimiter ;