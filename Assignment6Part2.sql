CREATE DATABASE LinkedIn
USE LinkedIn

CREATE TABLE PersonalData (
	UserID Int NOT NULL PRIMARY KEY,
	FullName NVARCHAR(250) NOT NULL,
	DateofBirth DATE,
	Gender VARCHAR(25),
	Citizenship VARCHAR(100),	
)

CREATE TABLE ContactData (
	PhoneNumber VARCHAR(25),
	Email VARCHAR(100),
	UserAddress NVARCHAR(250),
	SMLinks VARCHAR(250),
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

CREATE TABLE Experience (
	StartDate DATE,
	EndDate DATE,
	Company VARCHAR(100),
	JobTitle VARCHAR(100),
)

CREATE TABLE Achievements (
	AchTitle VARCHAR(100),
	AchType VARCHAR(100),
	StartDate DATE,
	EndDate DATE,
	Description VARCHAR(250),
)

CREATE TABLE Skills (
	SkillTitle VARCHAR(100),
	SkillType VARCHAR(100),
)
CREATE TABLE Interests (
	InteTitle VARCHAR(100),
	InteType VARCHAR(100),
)

INSERT INTO Interests(InteTitle, InteType)
	VALUES(1, 'Programming', 'Technology');
INSERT INTO Interests(InteTitle, InteType)
	VALUES(2, 'Going to gym', 'Health');
INSERT INTO Interests(InteTitle, InteType)
	VALUES(3, 'Reading books', 'Knowledge');


