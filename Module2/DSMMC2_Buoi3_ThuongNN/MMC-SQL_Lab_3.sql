-- use database
USE Testing_System_Db;

----- Question 1: add 10 records for each table
-- Add data Table 1: Department
INSERT INTO Department ( DepartmentName )
VALUES
						(N'IT'				),
                        (N'Finance'			),
                        (N'Design'			),
                        (N'Produce'			),
                        (N'Customer service'),
						(N'Charity'			),
                        (N'Chef'			),
                        (N'DA'				),
                        (N'Print'			),
                        (N'Furniture'		);

-- Add data Table 2: Position

					

-- Add data Table 3: Account
INSERT INTO `Account`( Email,					Username, 		FullName, 			  DepartmentID,  PositionID, 	CreateDate)
VALUES
					 ('anhh@gmail.com',			N'tanh1',		'Nguyễn Anh',   		1,			 1,				'21-01-2020'),
					 ('nhanaa@gmail.com',		N'nhannta14',	'Đình Nhân',  		 	4,			 2,				'01-02-2021'),
					 ('mana@gmail.com',			N'tiaman',		'Nguyễn Mân',  	 	 	6,			 5,				'29-07-2019'),
					 ('anntinh@gmail.com',		N'antinh',		'Bùi Tính An',  	 	3,			 3,				'11-10-2022'),
					 ('baaaa@gmail.com',		N'aiotam',		'Bích Tam Tam',  	  	2,			 2,				'21-01-2023'),
					 ('quyquy@gmail.com',		N'qquyqq',		'Quỳnh Tấn Qúy',   		5,			 1,				'21-01-2020'),
					 ('nhatoan@gmail.com',		N'12toan',		'Đặng Toàn',  		  	1,			 3,				'01-02-2021'),
					 ('qadte@gmail.com',		N'quanona',		'Nguyễn Quân',  	  	2,			 5,				'29-07-2019'),
					 ('kkkhanga@gmail.com',		N'khangs24',	'Aí Khang',  	  		3,			 3,				'11-10-2022'),
					 ('minh121@gmail.com',		N'minhqew',		'Trần nghĩa Minh',  	1,			 2,				'21-01-2023');
-- Add data Table 4: Group
INSERT INTO `Group`( GroupName,					CreatorID,			CreateDATE )
VALUES
					(N'Mây mây 0222',			1,				'18-08-2020'),
					(N'Đầm luận',				2,				'01-10-2021'),
					(N'Tính lương',				5,				'07-07-2019'),
					(N'Chính sách cập nhật',	2,				'11-03-2022'),
					(N'Thêm việc',				5,				'21-12-2023'),
					(N'sếp',					4,				'18-08-2020'),
					(N'Nhóm 0192',				2,				'01-10-2021'),
					(N'Ngày tính công',			3,				'07-07-2019'),
					(N'0291 gọi',				2,				'11-03-2022'),
					(N'Nhận thông tin',			4,				'21-12-2023');                    

-- Add data Table 5: GroupAccount
INSERT INTO `GroupAccount`	(  GroupID, AccountID, 		JoinDate	 )
VALUES
								(3,		5,			'18-02-2020'),
								(2,		9,			'22-12-2021'),
								(2,		1,			'14-06-2019'),
								(4,		2,			'11-11-2022'),
								(1,		5,			'06-05-2023'),
								(3,		4,			'18-02-2020'),
								(2,		4,			'22-02-2021'),
								(7,		1,			'14-06-2019'),
								(4,		2,			'11-05-2022'),
								(1,		5,			'06-05-2023');                                

-- Add data Table 6: TypeQuestion
-- INSERT INTO TypeQuestion	(TypeName			) 
VALUES 						('Essay'			), 
							('Multiple-Choice'	);
                            
-- Add data Table 7: CategoryQuestion
INSERT INTO CategoryQuestion		(CategoryName	)
VALUES 								('IT'			),
									('Human'		),
									('Motivation'	),
									('Live in office'),
									('Leader'		),
									('Task'			),
									('Slary'		),
									('Comunication'	),
									('Basic rule'),
									('staff'		),
									('Furniture'	);                                    
					
													
-- Add data Table 8: Question
-- INSERT INTO Question	(Content,				 		CategoryID	,   TypeID	,     CreatorID	, CreateDate )
VALUES 					(N'Lịch sử công ty'		,	 	1			, 	1		,   	1			,'31-12-2021'),
						(N'Thực hành văn bản'	,	 	10			, 	5  		,   	3			,'14-08-2020'),
						(N'Hỏi về truy vấn'		,	 	9			,  	1		,   	4			,'20-08-2022'),
						(N'Nợ Có'				,		6			,   3		,   	2			,'08-08-2019'),
						(N'Phản ứng tình huống'	,		5			,   4		,  		2			,'18-08-2020');
					

-- Add data Answers
-- INSERT INTO Answer	(  Content		, QuestionID	, isCorrect	)
VALUES 				(N'Trả lời 01'	,   1			,	0		),
					(N'Trả lời 02'	,   1			,	1		),
                    (N'Trả lời 03'	,   1			,	0		),
                    (N'Trả lời 04'	,   1			,	1		),
                    (N'Trả lời 05'	,   2			,	1		);
                   
	
-- Add data Exam
-- INSERT INTO Exam	(`Code`			, Title						, 		CategoryID	, Duration	, CreatorID		, CreateDate )
VALUES 				('CTP0001'		, N'Đề thi văn hóa công ty'	,		1			,	60		,   1			,'22-08-2020'),
					('CTP0002'		, N'Đề thi quy tắc office'	,		5			,	180		,   3			,'13-04-2020'),
                    ('CTP0003'		, N'Đề thi truy cập data'	,		3			,	50		,   2			,'09-11-2020'),
                    ('CTP0004'		, N'Đề thi kiểm toán'		,		1			,	120		,   4			,'31-08-2022'),
                    ('CTP0005'		, N'Đề thi phản ứng nhanh'	,		4			,	10		,   5			,'16-01-2021');
                   
                    
                    
-- Add data ExamQuestion
-- INSERT INTO ExamQuestion(ExamID	, QuestionID	) 
VALUES 					(	1	,		5		),
						(	2	,		2		), 
						(	3	,		4		), 
						(	4	,		3		), 
						(	5	,		1		);


-- Question 2
SELECT * FROM Department;

-- Question 3:
SELECT DepartmentID FROM Department
WHERE DepartmentID = N'Sale';

-- Question 4 
SELECT *'Account'
						