DROP DATABASE IF EXISTS PLUGINS;
CREATE DATABASE PLUGINS;
USE PLUGINS;

DROP TABLE IF EXISTS Plugins;
CREATE TABLE Plugins(
plugin VARCHAR(50), # plugin uses as join attributes(name) in generator and fx table 
developer VARCHAR(30),
type VARCHAR(20), # fx or generator
PRIMARY KEY(plugin)
);

DROP TABLE IF EXISTS Generator;
CREATE TABLE Generator(
name VARCHAR(50) PRIMARY KEY, # name of the plugin
format VARCHAR(10),
subtype VARCHAR(50),
isFree BOOLEAN DEFAULT FALSE,
hasLicense BOOLEAN DEFAULT FALSE,
lastUpdate timestamp not null on update current_timestamp  # 0000-00-00 00:00:00
);

DROP TABLE IF EXISTS Fx;
CREATE TABLE Fx(
name VARCHAR(50) PRIMARY KEY,  # name of the plugin
format VARCHAR(10),
subtype VARCHAR(50),
isFree BOOLEAN DEFAULT FALSE,
hasLicense BOOLEAN DEFAULT FALSE,
lastUpdate  timestamp not null on update current_timestamp
);


DROP TABLE IF EXISTS User;
CREATE TABLE User(
uID INT AUTO_INCREMENT,
name VARCHAR(30),
age INT,
downLoaded INT,
PRIMARY KEY(uID)
);

DROP TABLE IF EXISTS Downloaded;
CREATE TABLE Downloaded(
uID INT,
plugin VARCHAR(50),
downloadDate timestamp not null on update current_timestamp,
PRIMARY KEY(uID, plugin, downloadDate),
FOREIGN KEY(uID) references User (uID) on delete cascade,
FOREIGN KEY(plugin) references Plugins (plugin) on delete cascade
);


DROP TABLE IF EXISTS Archive;
CREATE TABLE Archive(
name VARCHAR(50) primary key,  # name of the plugin
format VARCHAR(10),
developer VARCHAR(30),
type VARCHAR(20), # fx or generator
subtype VARCHAR(50),
isFree BOOLEAN DEFAULT FALSE,
hasLicense BOOLEAN DEFAULT FALSE,
lastUpdate  timestamp not null on update current_timestamp,
uID INT,
downloadDate timestamp on update current_timestamp
);


SET GLOBAL local_infile=1;

LOAD DATA LOCAL INFILE 'C:\\yourpath\\generator.tsv' INTO TABLE Generator;
LOAD DATA LOCAL INFILE 'C:\\yourpath\\fx.tsv' INTO TABLE Fx;
LOAD DATA LOCAL INFILE 'C:\\yourpath\\downloaded.tsv' INTO TABLE Downloaded;
LOAD DATA LOCAL INFILE 'C:\\yourpath\\plugins.tsv' INTO TABLE Plugins;
LOAD DATA LOCAL INFILE 'C:\\yourpath\\user.tsv' INTO TABLE User;