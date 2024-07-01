DROP DATABASE IF EXISTS TestingSystem;
CREATE DATABASE TestingSystem;
USE TestingSystem;

-- create table: Department
DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
	DepartmentID 			INT,
    DepartmentName 			VARCHAR(50)
);


-- create table Position
DROP TABLE IF EXISTS `Position`;
CREATE TABLE `Position`(
	PositionID				INT AUTO_INCREMENT,
    PositionName			VARCHAR(30)
);

-- create table Account
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
	AccountID				INT AUTO_INCREMENT,
    Email					VARCHAR(50),
    Username				VARCHAR(30),
    FullName				CHAR(50),
    DepartmentID 			INT,
    PositionID				INT,
    CreateDATE				DATE
);
	

-- create table Group
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
	GroupID					INT,
    GroupName				VARCHAR(30),
    CreatorID				INT,
    CreateDATE				DATE
);
-- create table GroupAccount
DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount(
	GroupID					INT,
    AccountID				VARCHAR(50),
    JoinDATE				DATE
);
-- create table TypeQuestion
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
    TypeID 		INT,
    TypeName 	VARCHAR(30)
);
-- create table CategoryQuestion

DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
	CategoryID				INT,
    CategoryName			VARCHAR(50)
);

-- create table Question
DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
	QuestionID				INT,
    Content					VARCHAR(50),
    CategoryID				INT,
    TypeID 					INT,
    CreatorID				INT,
    CreateDate				DATE
);
-- create table Answer
DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
	AnswerID				INT,
    Content					VARCHAR(50),
    QuestionID				INT,
    isCorrect				VARCHAR(30)
);

DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
	ExamID				INT,
    `Code`				VARCHAR(50),
    Title				VARCHAR(50),
    CategoryID			INT,
    Duration 			VARCHAR(30),
    CreatorID			INT,
    CreateDate			DATE
);

DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
	ExamID				INT,
    QuestionID			INT
);
