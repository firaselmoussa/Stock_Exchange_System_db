
/*

    We used an UPDATE CASCADE for market id so that whenever a market id is changed in the market table all the children tables will inherit the update. In addition we used ON DELETE SET DEFAULT so that whenever a market is deleted the market id in the children tables is set to “NO MARKET” which is the default value.
    
    When it comes to the other foreign keys we used ON DELETE SET NULL and ON UPDATE CASCADE so that the children tables will inherit the update. 
    But for the transactions table, we had two foreign keys that refer to the same primary key of which is the shareholder ID, therefore we were not able to apply ON UPDATE or ON DELETE constraints on both of them at the same time, and even though we were able to apply one of the constraints (either “on delete” or “on update”) we decided not to for the inconvenience of the result.

    We implemented constraints on data so that no session dates will be accepted if the string value was either Saturday or Sunday. Hence there will be no orders or transactions on these dates. 

    In addition to that we restricted the value for order type to strictly be either “s” or “b” only. 

*/


--CREATE DATABASE 
CREATE DATABASE stock_exchange_db;

--CREATE TABLES
CREATE TABLE market (
ID varchar(50) NOT NULL UNIQUE,
name varchar(250),
opening_hours TIME,
closing_hours TIME,
PRIMARY KEY(ID)
);

CREATE TABLE company (
SID varchar(50) NOT NULL UNIQUE,
name varchar(50),
volume_of_shares int,
capital int,
highest_price int,
lowest_price int,
current_price int,
MID varchar(50) NOT NULL DEFAULT('NO MARKET'),
PRIMARY KEY(SID),
FOREIGN KEY (MID) REFERENCES market(ID) ON UPDATE CASCADE ON DELETE SET DEFAULT
);

CREATE TABLE share_holder(
ID varchar(50) NOT NULL UNIQUE,
first_name varchar(50),
last_name varchar(50),
phone_number varchar(50),
PRIMARY KEY(ID)
);

CREATE TABLE session(
date DATE NOT NULL UNIQUE constraint date_check check(DATENAME(WEEKDAY, date) not in ('Saturday', 'Sunday')),
PRIMARY KEY(date)
);

CREATE TABLE market_has_sessions(
date DATE,
MID varchar(50) NOT NULL DEFAULT('NO MARKET'),
FOREIGN KEY (MID) REFERENCES market(ID) ON UPDATE CASCADE ON DELETE SET DEFAULT,
Foreign Key(date) References session(date) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE orders(
ID int NOT NULL UNIQUE IDENTITY, 
CSID varchar(50),
SHID varchar(50),
type char(1) NOT NULL constraint type_check check(type in ('s', 'b')),
volume_of_shares int,
date DATE NOT NULL,
Primary Key(ID),
FOREIGN KEY(date) REFERENCES session(date) ON DELETE CASCADE,
FOREIGN KEY(CSID) REFERENCES company(SID) ON UPDATE CASCADE ON DELETE SET NULL,
FOREIGN KEY(SHID) REFERENCES share_holder(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE transactions(
ID int NOT NULL UNIQUE IDENTITY, 
SSHID varchar(50) NOT NULL,
BSHID varchar(50) NOT NULL,
price_of_shares int,
volume_of_shares int,
date DATE NOT NULL,
FOREIGN KEY(date) REFERENCES session(date) ON DELETE CASCADE,
FOREIGN KEY(SSHID) REFERENCES share_holder(ID),
FOREIGN KEY(BSHID) REFERENCES share_holder(ID)
);