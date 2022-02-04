#Potential Queries to run in Plugin Database
#+ Expiration Trigger


#Stored Procedures and SQL Queries for Database
#1. Query that projects the pID, dID and subty
SELECT pID, dID, subtype
from FX 
where subtype ='Misc';


#2. Query that takes in the name of a developer and 
#projects a tuple of each distinct FX/Generator Subtype and the Count in the plugins table made by the dev
DROP PROCEDURE IF EXISTS numType;
delimiter //
CREATE PROCEDURE numType(IN dev VARCHAR(50), t VARCHAR(30))
begin
	SELECT developer, type, count(type)
    FROM PLUGIN 
    GROUP BY developer
    HAVING developer = dev and type = t;
end//
#select developer ID dID from Recycle 

#5. Average number of Generator Plugins made by .......

#trigger that inserts deleted data into recycle table
#DROP TRIGGER expired;
CREATE TRIGGER EXPIRED 
BEFORE DELETE ON PLUGIN
FOR EACH ROW
#checks if the lastupdate is greater than 4 month expiration
#little unsure about how to check for this, I tried Date_Add as well just to make sure
WHEN OLD.lastUpdated > ADD_TIME(OLD.lastUpdated, '0000-04-00')
#WHEN OLD.lastUpdated > OLD.lastUpdated + '0000-04-00'
BEGIN
INSERT INTO OLDPLUGINS VALUES(OLD.pID, OLD.dID, OLD.name, OLD.format, OLD.type, OLD.isFree, OLD.hasLicense, OLD.lastUpdate);
END;

