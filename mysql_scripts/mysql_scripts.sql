/*MySQL Creation Script*/

--First create the user to be used throughout the entire demonstration. Script

DROP USER IF EXISTS '_MigrationAdmin';

CREATE USER '_MigrationAdmin'@'%' IDENTIFIED WITH mysql_native_password BY 'm1gr8_database';

/* For ease of use, make user SUPERDUPER */

GRANT ALL ON *.* TO '_MigrationAdmin'@'%';

FLUSH PRIVILEGES;

/* CREATE databases then fill in with bs data*/
DROP DATABASE  IF EXISTS _appMonolith;
CREATE DATABASE IF NOT EXISTS _appMonolith;

USE _appMonolith;

drop procedure if exists _buildDB;

DELIMITER $$

CREATE PROCEDURE _buildDB()
 BEGIN
	SET @y=0;
	    WHILE @y <= 10 DO
			/* First Build out table constructs*/
			SET @c =  CONCAT('CREATE TABLE IF NOT EXISTS `appMonolith',@y,'` (_id int NOT NULL AUTO_INCREMENT,_GUID char(36) NOT NULL, primary key (_id))');
			PREPARE stmt from @c;
			EXECUTE stmt;
			DEALLOCATE PREPARE stmt;
			
			/*Now create insert statements*/
			SET @
		SET @y = @y + 1 ;
    END WHILE;
END$$
DELIMITER ;
call _buildDB();