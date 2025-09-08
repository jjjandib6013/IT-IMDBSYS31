CREATE DATABASE HENRYBOOK;

USE HENRYBOOK;


CREATE TABLE Author (
    AuthorNum INT PRIMARY KEY,
    AuthorLast VARCHAR(100),
    AuthorFirst VARCHAR(100)
);

CREATE TABLE Publishers (
    PublisherCode CHAR(5) PRIMARY KEY,
    PublisherName VARCHAR(100),
    City VARCHAR(100)
);

CREATE TABLE Book (
    BookNum INT PRIMARY KEY,
    Title VARCHAR(200),
    PublisherCode CHAR(5),
    
	CONSTRAINT FK_Book_Publisher 
	FOREIGN KEY (PublisherCode) 
	REFERENCES Publishers(PublisherCode)
);

CREATE TABLE Branch (
    BranchNum INT PRIMARY KEY,
    BranchName VARCHAR(100),
    BranchLocation VARCHAR(100)
);

CREATE TABLE Copy (
    CopyNum INT PRIMARY KEY,
    BookNum INT,
    BranchNum INT,
    Available BIT,
    FOREIGN KEY (BookNum) REFERENCES Book(BookNum),
    FOREIGN KEY (BranchNum) REFERENCES Branch(BranchNum)
);

CREATE TABLE Wrote (
    AuthorNum INT,
    BookNum INT,
    PRIMARY KEY (AuthorNum, BookNum),
    FOREIGN KEY (AuthorNum) REFERENCES Author(AuthorNum),
    FOREIGN KEY (BookNum) REFERENCES Book(BookNum)
);
