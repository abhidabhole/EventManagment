﻿create database CustomerMgmt;
go
use CustomerMgmt;
go
--SELECT * FROM CUSTOMERS;
--drop table CUSTOMERS;
CREATE TABLE CUSTOMERS
(
	CID INT PRIMARY KEY IDENTITY(1,1),
	CUSERNAME VARCHAR(20) NOT NULL UNIQUE,
	CPW VARCHAR(20) NOT NULL,
	CMOB VARCHAR(10) NOT NULL UNIQUE,
	CADDRESS VARCHAR(100)
);

go
--SELECT * FROM VENUES;
--drop table VENUES;
CREATE TABLE Venues
(
	VID INT PRIMARY KEY IDENTITY(10,1),
	VENUE VARCHAR(30) UNIQUE
);
go
INSERT INTO VENUES(VENUE) VALUES('Welcome Hall, Nerul'),('Pioneer Hall, Bandra'),('GOKHALE HALL, Panvel'),('Grand Lotus Banquet, Kharghar'),('Imperial Banquets, Vashi'),('Atithi Banquets, Andheri'),('DY Patil Stadium, Nerul'),('Wankhede Stadium, Mumbai');
go
--SELECT * FROM BOOKING;
--drop table BOOKING;
CREATE TABLE BOOKING
(
	BID INT PRIMARY KEY IDENTITY(101,1),
	BNAME VARCHAR(20) NOT NULL ,
	BSERNAME VARCHAR(20) NOT NULL,
	BEVENT VARCHAR(20) NOT NULL,
	BDATE DATE,
	BVENUE VARCHAR(50),
	BCID INT FOREIGN KEY REFERENCES CUSTOMERS(CID) default(1)
);
go
--DELETE FROM BOOKING
--WHERE BID > 100;


--ALTER TABLE CUSTOMERS
--ADD CONSTRAINT FK_Book
--FOREIGN KEY (Book) REFERENCES BOOKING(BID);

--ALTER TABLE CUSTOMERS
--ADD BOOK INT DEFAULT 1;
--GO
--ALTER TABLE CUSTOMERS
--ADD CONSTRAINT FK_BOOK FOREIGN KEY(BOOK) REFERENCES BOOKING(BID);
--GO
--UPDATE CUSTOMERS
--SET BOOK=1;

--SELECT CUSTOMERS.CUSERNAME, CUSTOMERS.CPW, BOOKING.BNAME, BOOKING.BSERNAME
--FROM BOOKING
--INNER JOIN CUSTOMERS ON CUSTOMERS.CID = BOOKING.BCID;


--ALTER TABLE CUSTOMERS
--DROP CONSTRAINT FK_BOOK;

--ALTER TABLE CUSTOMERS
--DROP COLUMN BOOK; 

--INNER JOIN DESIGNATION
--ON DESIGNATION.DESID=EMPLOYEES.EDESIGNATION;