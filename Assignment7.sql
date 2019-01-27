CREATE DATABASE LinkedIn;

USE LinkedIn

CREATE TABLE PersonalData (
	UserID Int NOT NULL PRIMARY KEY,
	FullName NVARCHAR(250) NOT NULL,
	DateofBirth DATE,
	Gender VARCHAR(25),
	Citizenship VARCHAR(100),	
)

CREATE TABLE ContactAddress (
	AddressID Int NOT NULL PRIMARY KEY,
	FullAddress VARCHAR(250),
	ZipCode VARCHAR(100),
	Country VARCHAR(100),
	UserID Int FOREIGN KEY REFERENCES PersonalData(UserID)
)

CREATE TABLE ContactEmail (
	EmailID Int NOT NULL PRIMARY KEY,
	UserEmail VARCHAR(100) NOT NULL,
	UserID Int FOREIGN KEY REFERENCES PersonalData(UserID)
)

CREATE TABLE PhoneNumber (
	PhoneID Int NOT NULL PRIMARY KEY,
	Phone VARCHAR(50),
	UserID Int FOREIGN KEY REFERENCES PersonalData(UserID)
)

CREATE TABLE SMLinks (
	SMID Int NOT NULL PRIMARY KEY,
	UserLinks VARCHAR(100),
)

CREATE TABLE Education (
	Institution VARCHAR(100),
	Department VARCHAR(100),
	StartDate DATE,
	EndDate DATE,
	FieldStudy VARCHAR(100),
	Degree VARCHAR(100),
	Diploma Int,
)

CREATE TABLE University (
	UniversityID Int NOT NULL PRIMARY KEY,
	UniversityName VARCHAR(100),
)

CREATE TABLE Experience (
	StartDate DATE,
	EndDate DATE,
	Company VARCHAR(100),
	JobTitle VARCHAR(100),
)

CREATE TABLE Company (
	CompanyID Int NOT NULL PRIMARY KEY,
	CompanyName VARCHAR(100),
)

CREATE TABLE Achievements (
	AchID Int NOT NULL PRIMARY KEY,
	AchTitle VARCHAR(100),
	AchType VARCHAR(100),
	StartDate DATE,
	EndDate DATE,
	Description VARCHAR(250),
)

CREATE TABLE Skills (
	SkillID Int NOT NULL PRIMARY KEY,
	SkillTitle VARCHAR(100),
	SkillType VARCHAR(100),
)

CREATE TABLE Interests (
	InteID Int NOT NULL PRIMARY KEY,
	InteTitle VARCHAR(100),
	InteType VARCHAR(100),
)

/* Assignment 7 - Part 1 */

/* Selecting people with defined interests and their interests */

SELECT PersonalData.UserID, PersonalData.FullName, Interests.InteTitle, Interests.InteType 
	FROM PersonalData
	INNER JOIN Interests ON Interests.InteType=Interests.InteID
	WHERE InteType IS NOT NULL;

/* Selecting all people and their interests */

SELECT PersonalData.UserID, PersonalData.FullName, Interests.InteTitle, Interests.InteType
	FROM PersonalData
	FULL OUTER JOIN Interests ON PersonalData.UserID=Interests.UserID;

/* Counting the number of interests */

SELECT COUNT(Interests.InteTitle), PersonalData.UserID, PersonalData.FullName
	FROM PersonalData
	LEFT JOIN Interests ON PersonalData.UserID=Interests.InteID;


/* Assignment 7 - Part 2 */

/* Create a follow table */

CREATE TABLE Follow (
	FollowID Int NOT NULL PRIMARY KEY,
	UserID Int FOREIGN KEY REFERENCES PersonalData(UserID)
)

ALTER TABLE Follow
ADD UserID Int NULL,
CONSTRAINT FK_Follow_PersonalData FOREIGN KEY (UserID) REFERENCES Follow(ID)

ALTER TABLE ContactEmail
ADD UserID Int NULL,
CONSTRAINT FK_ContactEmail_PersonalData FOREIGN KEY (UserID) REFERENCES ContactEmail(ID)

ALTER TABLE ContactAddress
ADD UserID Int NULL,
CONSTRAINT FK_ContactAddressn_PersonalData FOREIGN KEY (UserID) REFERENCES ContactAddress(ID)

ALTER TABLE PhoneNumber
ADD UserID Int NULL,
CONSTRAINT FK_PhoneNumber_PersonalData FOREIGN KEY (UserID) REFERENCES PhoneNumber(ID)


/* Add sample data to follow */

INSERT INTO Follow(UserID) VALUES (1)
INSERT INTO Follow(UserID) VALUES (2)
INSERT INTO Follow(UserID) VALUES (3)
INSERT INTO Follow(UserID) VALUES (4)
INSERT INTO Follow(UserID) VALUES (5)

/* Return follower and folowee names */

SELECT PersonalData.UserID, PersonalData.FullName, Follow.FollowID
	FROM PersonalData
	LEFT OUTER JOIN Follow
	ON PersonalData.UserID = Follow.UserID

/* Return people who are not being followed (self join) */

SELECT A.FollowID AS UserA, B.FollowID AS UserB
	FROM Follow A, Follow B
	WHERE A.FollowID <> B.FollowID
	AND FollowID IS NULL