-- Create database
DROP DATABASE IF EXISTS Testing_System_Db; -- delete if database exists
CREATE DATABASE Testing_System_Db;
USE Testing_System_Db;     -- Use this data because of the different databases

-- create table 1: Department
DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
	DepartmentID 			TINYINT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    DepartmentName 			NVARCHAR(30) NOT NULL UNIQUE KEY
);


-- create table 2: Position
DROP TABLE IF EXISTS `Position`;
CREATE TABLE `Position`(
	PositionID				TINYINT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    PositionName			ENUM('Dev', 'Test', 'Scrum Master', 'PM') NOT NULL
);

-- create table 3: Account
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
	AccountID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Email					VARCHAR(50) NOT NULL UNIQUE KEY,
    Username				VARCHAR(30) NOT NULL UNIQUE KEY,
    FullName				NVARCHAR(50) NOT NULL,
    DepartmentID 			TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    PositionID				TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY (PositionID) REFERENCES `Position` (PositionID),
    CreateDATE				DATETIME DEFAULT NOW()
);
/* 
Method 1: create Foreign Key --- use for create table time
FOREIGN KEY (<COLUMN>) REFERENCES <Table> (<Column>)
*/

-- create table 4: Group
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
	GroupID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    GroupName				VARCHAR(30) NOT NULL UNIQUE KEY,
    CreatorID				TINYINT UNSIGNED NOT NULL,
    CreateDATE				DATETIME DEFAULT NOW()
);
-- create table 5: GroupAccount
DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount(
	GroupID					TINYINT UNSIGNED NOT NULL,
    AccountID			    TINYINT UNSIGNED NOT NULL,
    JoinDATE				DATETIME DEFAULT NOW(),
    PRIMARY KEY (GroupID, AccountID)
);
ALTER TABLE GroupAccount ADD CONSTRAINT FK_GroupID
FOREIGN KEY (GroupID) REFERENCES `Group`(GroupID);

ALTER TABLE GroupAccount ADD CONSTRAINT FK_AccountID
FOREIGN KEY (AccountID) REFERENCES `Account`(AccountID);

/* Create Foreign Key (method 2) --- use for status, table was created 
ALTER TABLE <Table present> ADD CONSTRAINT FK_<Key>
FOREIGN KEY (<Key>) REFERENCES <Table origin>(<Key>);
*/

-- create table 6: TypeQuestion
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
    TypeID 		TINYINT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    TypeName 	ENUM('Essay', 'Multiple-Choices') NOT NULL UNIQUE KEY
);
-- create table 7: CategoryQuestion

DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
	CategoryID				TINYINT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    CategoryName			NVARCHAR(50) NOT NULL UNIQUE KEY
);

-- create table 8: Question
DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
	QuestionID				TINYINT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Content					NVARCHAR(200) NOT NULL ,
    CategoryID				TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion (CategoryID),
    TypeID 					TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY (TypeID) REFERENCES TypeQuestion (TypeID),
    CreatorID			    TINYINT UNSIGNED NOT NULL,
    CreateDate				DATETIME DEFAULT NOW()
);
-- create table 9: Answer
DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
	AnswerID				INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Content					NVARCHAR(50) NOT NULL,
    QuestionID				TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY (QuestionID) REFERENCES Question (QuestionID),
    isCorrect				ENUM('Đúng','Sai') NOT NULL
);
-- create table 10: Exam
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
	ExamID				TINYINT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `Code`				VARCHAR(50) NOT NULL UNIQUE KEY,
    Title				NVARCHAR(50) NOT NULL,
    CategoryID			TINYINT UNSIGNED NOT NULL,
    Duration 			TINYINT UNSIGNED NOT NULL,
    CreatorID			TINYINT UNSIGNED NOT NULL,
    CreateDate			DATETIME DEFAULT NOW()
);
-- create table 11: ExamQuestion
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
	ExamID				TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY (ExamID) REFERENCES Exam (ExamID),
    QuestionID			TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY (QuestionID) REFERENCES Question (QuestionID),
    PRIMARY KEY(ExamID, QuestionID)
);


-- Add data Table 1: Department
INSERT INTO Department( DepartmentName )
VALUES
						(N'Marketing'		),
                        (N'Sale'			),
                        (N'Human Resources'	),
                        (N'Security'		),
                        (N'Account'			);
                        
-- Add data Table 2: Position
INSERT INTO `Position`( PositionName )
VALUES
					 ('PM'			),
					 ('Dev'			),
					 ('Test'		),
					 ('Scrum Master'),
					 ('Dev'			);

-- Add data Table 3: Account
INSERT INTO `Account`( Email,					Username, 		FullName, 			  DepartmentID,  PositionID, 	CreateDate)
VALUES
					 ('tuanenqq@gmail.com',		N'tuane11',		'Nguyễn Trần Tuấn',   1,			 1,				'21/01/2020'),
					 ('Dantaua@gmail.com',		N'danta14',		'Đặng Tạ',  		  4,			 2,				'01/02/2021'),
					 ('tinina@gmail.com',		N'tian98',		'Nguyễn Na Tin',  	  2,			 5,				'29/07/2019'),
					 ('annieaa@gmail.com',		N'anieaaa24',	'Bùi Minh An',  	  3,			 3,				'11/10/2022'),
					 ('Deniba@gmail.com',		N'deniani666',	'Bách Hữu Quân',  	  2,			 2,				'21/01/2023');

-- Add data Table 4: Group
INSERT INTO `Group`( GroupName,					CreatorID,			CreateDATE )
VALUES
					(N'Chuyện Công Sở',			1,				'18/08/2020'),
					(N'Hôm nay ăn gì 111',		4,				'01/10/2021'),
					(N'Lịch làm việc',			1,				'07/07/2019'),
					(N'Chat mọi lúc 10',		2,				'11/03/2022'),
					(N'Vinh danh tập thể 05',	5,				'21/12/2023');

-- Add data Table 5: GroupAccount
INSERT INTO `GroupAccount`	(  GroupID, AccountID, 		JoinDate	 )
VALUES
								(3,		1,			'18/02/2020'),
								(2,		4,			'22/12/2021'),
								(9,		1,			'14/06/2019'),
								(4,		2,			'11/05/2022'),
								(1,		5,			'06/05/2023');

-- Add data Table 6: TypeQuestion
INSERT INTO TypeQuestion	(TypeName			) 
VALUES 						('Essay'			), 
							('Multiple-Choice'	);
                            
-- Add data Table 7: CategoryQuestion
INSERT INTO CategoryQuestion		(CategoryName	)
VALUES 								('History'		),
									('Office'		),
									('Sale'			),
									('SQL'			),
									('Account'		),
									('Assistant'	);
					
													
-- Add data Table 8: Question
INSERT INTO Question	(Content,				 		CategoryID	,   TypeID	,     CreatorID	, CreateDate )
VALUES 					(N'Lịch sử công ty'		,	 	1			, 	1		,   	1			,'31/12/2021'),
						(N'Thực hành văn bản'	,	 	10			, 	5  		,   	3			,'14/08/2020'),
						(N'Hỏi về truy vấn'		,	 	9			,  	1		,   	4			,'20/08/2022'),
						(N'Nợ Có'				,		6			,   3		,   	2			,'08/08/2019'),
						(N'Phản ứng tình huống'	,		5			,   4		,  		2			,'18/08/2020');
					

-- Add data Answers
INSERT INTO Answer	(  Content		, QuestionID	, isCorrect	)
VALUES 				(N'Trả lời 01'	,   1			,	0		),
					(N'Trả lời 02'	,   1			,	1		),
                    (N'Trả lời 03'	,   1			,	0		),
                    (N'Trả lời 04'	,   1			,	1		),
                    (N'Trả lời 05'	,   2			,	1		);
                   
	
-- Add data Exam
INSERT INTO Exam	(`Code`			, Title						, 		CategoryID	, Duration	, CreatorID		, CreateDate )
VALUES 				('CTP0001'		, N'Đề thi văn hóa công ty'	,		1			,	60		,   1			,'22/08/2020'),
					('CTP0002'		, N'Đề thi quy tắc office'	,		5			,	180		,   3			,'13/04/2020'),
                    ('CTP0003'		, N'Đề thi truy cập data'	,		3			,	50		,   2			,'09/11/2020'),
                    ('CTP0004'		, N'Đề thi kiểm toán'		,		1			,	120		,   4			,'31/08/2022'),
                    ('CTP0005'		, N'Đề thi phản ứng nhanh'	,		4			,	10		,   5			,'16/01/2021');
                   
                    
                    
-- Add data ExamQuestion
INSERT INTO ExamQuestion(ExamID	, QuestionID	) 
VALUES 					(	1	,		5		),
						(	2	,		2		), 
						(	3	,		4		), 
						(	4	,		3		), 
						(	5	,		1		);
						