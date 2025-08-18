CREATE DATABASE SOLMARIS

USE SOLMARIS

CREATE TABLE Location (
	LocationNum INT NOT NULL PRIMARY KEY,
	LocationName VARCHAR(50),
	Address VARCHAR(50),
	City VARCHAR(50),
	State CHAR(2),
	PostalCode INT
);

CREATE TABLE Owner (
	OwnerNum INT NOT NULL PRIMARY KEY,
	LastName VARCHAR(50),
	FirstName VARCHAR(50),
	Address VARCHAR(50),
	City VARCHAR(50),
	State CHAR(2),
	PostalCode INT
);

select * from Owner

CREATE TABLE CondoUnit (
	CondoID INT NOT NULL PRIMARY KEY,
	LocationNum INT,
	UnitNum INT,
	SqrFt INT,
	Bdrms INT,
	Baths INT,
	CondoFee money,
	OwnerNum INT,

	CONSTRAINT FK_LocationNum
	FOREIGN KEY (LocationNum)
	REFERENCES Location(LocationNum),

	CONSTRAINT FK_OwnerNum
	FOREIGN KEY (OwnerNum)
	REFERENCES Owner(OwnerNum)
);

CREATE TABLE ServiceCategory (
	CategoryNum INT NOT NULL PRIMARY KEY,
	CategoryDescription VARCHAR(50)
);

CREATE TABLE ServiceRequest (
	ServiceID INT NOT NULL PRIMARY KEY,
	CondoID INT,
	CategoryNum INT,
	Description VARCHAR(200),
	Status VARCHAR(200),
	EstHours INT,
	SpentHours INT,
	NextServiceDate DATE,

	CONSTRAINT FK_CondoID
	FOREIGN KEY (CondoID)
	REFERENCES CondoUnit(CondoID),

	CONSTRAINT FK_CategoryNum
	FOREIGN KEY (CategoryNum)
	REFERENCES ServiceCategory(CategoryNum),
);