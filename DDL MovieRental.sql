CREATE DATABASE MovieRental;

USE MovieRental;

CREATE TABLE IF NOT EXISTS Country (
    ID int NOT NULL,
    Country varchar(50),
    Last_Update DATETIME,
    PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS Staff (
	ID INT NOT NULL,
    AddressID int,
    StoreID int,
    First_Name VARCHAR(255),
    Last_Name VARCHAR(255),
    Email VARCHAR(50),
    Active CHAR(1),
    Password VARCHAR(40),
    Last_Update DATETIME,
    PictureURL VARCHAR(80),
    PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS Actor (
    ID int NOT NULL,
  	First_Name VARCHAR(255),
    Last_Name VARCHAR(255),
    Last_Update DATETIME,
    PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS Category (
    ID int NOT NULL,
  	Name VARCHAR(255),
    Last_Update DATETIME,
    PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS Language (
	ID int NOT NULL,
    Name VARCHAR(20),
    Last_Update DATETIME,
    PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS City (
    ID int NOT NULL,
  	CountryID int NOT NULL,
    City_Name varchar(50),
    Last_Update DATETIME,
    PRIMARY KEY (ID),
    FOREIGN KEY (CountryID) REFERENCES Country(ID)
);

CREATE TABLE IF NOT EXISTS Address (
    ID int NOT NULL,
  	CityID int NOT NULL,
    Address varchar(50),
    Address2 varchar(50),
    District int,
    Postal_Code varchar(10),
    Phone VARCHAR(20),
    Last_Update DATETIME,
    PRIMARY KEY (ID),
    FOREIGN KEY (CityID) REFERENCES City(ID)
);

CREATE TABLE IF NOT EXISTS Customer (
    ID int NOT NULL,
  	AddressID int NOT NULL,
    AddressColumn int,
    First_Name varchar(255),
    Last_Name varchar(255),
    Email varchar(50),
    Active CHAR(1),
    Create_Date DATETIME,
    Last_Update DATETIME,
    PRIMARY KEY (ID),
    FOREIGN KEY (AddressID) REFERENCES Address(ID)
);

CREATE TABLE IF NOT EXISTS Store (
    ID int NOT NULL,
  	AddressID int,
    Store_Name VARCHAR(50),
    Last_Update DATETIME,
    PRIMARY KEY (ID),
    FOREIGN KEY (AddressID) REFERENCES Address(ID)
);

CREATE TABLE IF NOT EXISTS Film (
    ID int NOT NULL,
    LanguageID int, 
    Title VARCHAR(255),
    Description text,
    Release_Year int,
    Rental_Duration int, 
    Rental_Rate numeric(19, 0),
    Length int, 
    Replacement_Cost NUMERIC(19,0),
    Rating int, 
  	Special_Features VARCHAR(255),
    FULLTEXT (Title, Description),
    Last_Update DATETIME,
    PRIMARY KEY (ID),
    FOREIGN KEY (LanguageID) REFERENCES Language(ID)
);

CREATE TABLE IF NOT EXISTS Film_Category (
	FilmID int,
    CategoryID int,
    Last_Update DATETIME,
    FOREIGN KEY (FilmID) REFERENCES Film(ID),
    FOREIGN KEY (CategoryID) REFERENCES Category(ID)
);

CREATE TABLE IF NOT EXISTS Film_Actor (
	FilmID int,
    ActorID int,
    Last_Update DATETIME,
    FOREIGN KEY (FilmID) REFERENCES Film(ID),
    FOREIGN KEY (ActorID) REFERENCES Actor(ID)
);

CREATE TABLE IF NOT EXISTS Inventory (
	ID int NOT NULL,
    FilmID int,
    Last_Update DATETIME,
    PRIMARY KEY (ID),
    FOREIGN KEY (FilmID) REFERENCES Film(ID)
);

CREATE TABLE IF NOT EXISTS Rental (
	ID int NOT NULL,
    StaffID int,
    CustomerID int,
    InventoryID int,
    Rental_Date DATETIME,
    Return_Date DATETIME,
    Last_Update DATETIME,
    PRIMARY KEY (ID),
    FOREIGN KEY (StaffID) REFERENCES Staff(ID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(ID),
    FOREIGN KEY (InventoryID) REFERENCES Inventory(ID)
);

CREATE TABLE IF NOT EXISTS Payment (
	ID int NOT NULL,
    RentalID int,
    CustomerID int,
    Amount numeric(19, 0),
    Payment_Date DATETIME,
    StaffID int,
    PRIMARY KEY (ID),
    FOREIGN KEY (StaffID) REFERENCES Staff(ID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(ID),
    FOREIGN KEY (RentalID) REFERENCES Rental(ID)
);





