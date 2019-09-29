# TRIGGER ASSIGNMENT 1

# write a trigger which adds an entry in audit table 
# when user tries to insert or delete records in employee table
# on saturday or sunday

use banna;

DELIMITER ||

DROP TRIGGER IF EXISTS weekendInsertAudit ;

CREATE TRIGGER weekendInsertAudit BEFORE INSERT ON emp
  FOR EACH ROW
  BEGIN
  
  if weekday(curdate()) in (5, 6) then
    INSERT INTO audit SET log = 'INSERTED';
	end if;

  END;  
||

DROP TRIGGER IF EXISTS weekendDeleteAudit ;

CREATE TRIGGER weekendDeleteAudit BEFORE DELETE ON emp
  FOR EACH ROW
  BEGIN

  if weekday(curdate()) in (5, 6) then
    INSERT INTO audit SET log = 'DELETED';
	end if;

  END;  
||

delimiter ;


CREATE TABLE IF NOT EXISTS audit (
	id_ int primary key auto_increment, 
    log varchar(20), 
    lastUpdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
    );

select * from audit;

select * from emp;

INSERT INTO emp
VALUES (6848, 'BANNA', 'ENGINEER', NULL, '2020-02-01', 10000, NULL, NULL);

DELETE
FROM EMP
WHERE ename = 'BANNA';




