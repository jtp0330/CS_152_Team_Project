#Attempeted to combine my table data with Shuti's 
#First draft, feel free to edit

DROP DATABASE IF EXISTS PLUGINS;
CREATE DATABASE PLUGINS;
USE PLUGINS;

DROP TABLE IF EXISTS Developer;
CREATE TABLE Developer(
dID INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30) UNIQUE,
webAddr VARCHAR(100),
country VARCHAR(4),
prefix VARCHAR(50)
);

#PLUGIN
DROP TABLE IF EXISTS Plugin;
CREATE TABLE Plugin
(
pID INT AUTO_INCREMENT PRIMARY KEY,
dID INT,
name VARCHAR(50),
isFree BOOL,
hasLicense BOOL,
FOREIGN KEY(dID) REFERENCES Developer(dID) on delete cascade
					   on update cascade
);

DROP TABLE IF EXISTS Generator;
CREATE TABLE Generator(
pID INT,
dID INT,
name VARCHAR(50) UNIQUE,
format VARCHAR(10),
type VARCHAR(20),
subtype VARCHAR(50),
isFree BOOLEAN DEFAULT FALSE,
hasLicense BOOLEAN DEFAULT FALSE,
lastUpdate TIMESTAMP,
FOREIGN KEY(dID) REFERENCES Developer(dID) on delete cascade
					   on update cascade
);
# TIMESTAMP AS YYYY-MM-DD

DROP TABLE IF EXISTS Fx;
CREATE TABLE Fx(
pID INT,
dID INT,
name VARCHAR(50) UNIQUE,
format VARCHAR(10),
type VARCHAR(20),
subtype VARCHAR(50),
isFree BOOLEAN DEFAULT FALSE,
hasLicense BOOLEAN DEFAULT FALSE,
lastUpdate TIMESTAMP,
FOREIGN KEY(pID) REFERENCES PLUGIN(pID) on delete cascade on update cascade,
FOREIGN KEY(dID) REFERENCES Developer(dID) on delete cascade
					   on update cascade
);
# TIMESTAMP AS YYYY-MM-DD

DROP TABLE IF EXISTS Recycle;
CREATE TABLE Recycle(
pID INT,
dID INT,
name VARCHAR(50) UNIQUE,
format VARCHAR(10),
type VARCHAR(20),
subtype VARCHAR(50),
isFree BOOLEAN DEFAULT FALSE,
hasLicense BOOLEAN DEFAULT FALSE,
lastUpdate TIMESTAMP,
FOREIGN KEY(pID) REFERENCES PLUGIN(pID) on delete cascade on update cascade,
FOREIGN KEY(dID) REFERENCES Developer(dID) on delete cascade
					   on update cascade
);
# TIMESTAMP AS YYYY-MM-DD

DROP TABLE IF EXISTS OldPlugins;
CREATE TABLE OldPlugins(
pID INT,
dID INT,
name VARCHAR(50) UNIQUE,
format VARCHAR(10),
type VARCHAR(20),
subtype VARCHAR(50),
isFree BOOLEAN DEFAULT FALSE,
hasLicense BOOLEAN DEFAULT FALSE,
lastUpdate TIMESTAMP,
FOREIGN KEY(pID) REFERENCES PLUGIN(pID) on delete cascade on update cascade,
FOREIGN KEY(dID) REFERENCES Developer(dID) on delete cascade
					   on update cascade
);
