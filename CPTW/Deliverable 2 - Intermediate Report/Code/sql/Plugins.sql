#First draft of Code for creating Tables for Plugin Database 
#Name: Jared Park
#Feel Free to Edit

#MASTER -> For Our Reference
DROP TABLE IF EXISTS MASTER;
CREATE TABLE MASTER
(
pluginID INT,
name VARCHAR(30),
format VARCHAR(30),
type VARCHAR(30),
subtype VARCHAR(30),
developer VARCHAR(30),
#Boolean values may be represented as TinyInts, which mean either 0->False or 1->True
isFree BOOL,
hasLicense BOOL,
#Note: the date format for MySQL is yyyy/mm/dd hh:mm:ss
lastUpdated DATE,
PRIMARY KEY(pluginID)
);
#PLUGIN
DROP TABLE IF EXISTS PLUGIN;
CREATE TABLE PLUGIN
(
pluginID INT,
name VARCHAR(30),
developer VARCHAR(30),
isFree BOOL,
hasLicense BOOL,
FOREIGN KEY(pluginID) REFERENCES MASTER(pluginID)
);
#FX
DROP TABLE IF EXISTS FX;
CREATE TABLE FX
(
pluginID INT,
name VARCHAR(30),
subtype VARCHAR(30),
lastUpdated DATE,
FOREIGN KEY(pluginID) REFERENCES MASTER(pluginID)
);
#GENERATOR
DROP TABLE IF EXISTS GENERATOR;
CREATE TABLE GENERATOR
(
pluginID INT,
name VARCHAR(30),
subtype VARCHAR(30),
lastUpdated DATE,
FOREIGN KEY(pluginID) REFERENCES MASTER(pluginID)
);
#DEVELOPER
DROP TABLE IF EXISTS DEVELOPER;
CREATE TABLE DEVELOPER
(
name VARCHAR(30),
devID VARCHAR(30),
web_address VARCHAR(100),
filename_abbr VARCHAR(30),
country VARCHAR(30)
);

DROP TABLE IF EXISTS TRASH;
CREATE TABLE TRASH
(
pluginID INT,
name VARCHAR(30),
developer VARCHAR(30),
isFree BOOL,
hasLicense BOOL,
reason VARCHAR(30),
FOREIGN KEY(pluginID) REFERENCES MASTER(pluginID)
);

DROP TABLE IF EXISTS OLDPLUGINS;
CREATE TABLE OLDPLUGINS
(
pluginID INT,
lastUpdated DATE,
FOREIGN KEY(pluginID) REFERENCES MASTER(pluginID)
);






#Loads data from csv/sheets into table
#loaded from hidden folder data
#path needs to be adjusted
#LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Plugin Database - FX.csv' INTO Table FX
#COLUMNS TERMINATED BY ','
#LINES TERMINATED BY '\n';





