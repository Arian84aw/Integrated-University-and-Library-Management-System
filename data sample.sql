use DB_project;

--add building--
EXEC Education.addBuilding @name = 'Main Building';
EXEC Education.addBuilding @name = 'Science Center';
EXEC Education.addBuilding @name = 'Engineering Hall';
EXEC Education.addBuilding @name = 'Central Library';


--add department--
EXEC Education.addDepartment @name = 'Mathematics', @buildingID = 2;
EXEC Education.addDepartment @name = 'Physics Department', @buildingID = 2;
EXEC Education.addDepartment @name = 'Computer Department', @buildingID = 3;
EXEC Education.addDepartment @name = 'Library Sciences', @buildingID = 4;
EXEC Education.addDepartment @name = 'Electrical Department', @buildingID = 3;


--add major to department--
EXEC Education.addMajor @name = 'Mathematics', @departmentID = 1;
EXEC Education.addMajor @name = 'Physics', @departmentID = 2;
EXEC Education.addMajor @name = 'Computer Engineering', @departmentID = 3;
EXEC Education.addMajor @name = 'Electrical Engineering', @departmentID = 3;
EXEC Education.addMajor @name = 'Librarian', @departmentID = 4;

--add courses--
EXEC Education.addCourse @courseMajorID = 3, @title = 'Data Structures',        @credit = 3;--courseID 1
EXEC Education.addCourse @courseMajorID = 3, @title = 'Algorithms',             @credit = 3;--courseID 2
EXEC Education.addCourse @courseMajorID = 3, @title = 'Computer Architecture',  @credit = 3;--courseID 3
EXEC Education.addCourse @courseMajorID = 3, @title = 'Operating Systems',      @credit = 3;--courseID 4
EXEC Education.addCourse @courseMajorID = 3, @title = 'Computer Networks',      @credit = 3;--courseID 5
EXEC Education.addCourse @courseMajorID = 3, @title = 'Database Systems',       @credit = 3;--courseID 6
EXEC Education.addCourse @courseMajorID = 3, @title = 'Advanced programming', @credit = 3;--courseID 7
EXEC Education.addCourse @courseMajorID = 3, @title = 'Basic programming', @credit = 3;--courseID 8
EXEC Education.addCourse @courseMajorID = 3, @title = 'Discrete Mathematics',   @credit = 3;--courseID 9
EXEC Education.addCourse @courseMajorID = 2, @title = 'Physics 1', @credit = 3;--courseID 10
EXEC Education.addCourse @courseMajorID = 1, @title = 'General Mathematics', @credit = 3;--courseID 11
EXEC Education.addCourse @courseMajorID = 3, @title = 'Artificial Intelligence', @credit = 3;--courseID 12
EXEC Education.addCourse @courseMajorID = 3, @title = 'Digital systems design', @credit = 3;--courseID 13
EXEC Education.addCourse @courseMajorID = 2, @title = 'Physics laboratory', @credit = 1;--courseID 14
EXEC Education.addCourse @courseMajorID = 1, @title = 'Differential mathematics', @credit = 3;--courseID 15
EXEC Education.addCourse @courseMajorID = 1, @title = 'Engineering statistics and probability', @credit = 3;--courseID 16
EXEC Education.addCourse @courseMajorID = 3, @title = 'Introduction to computer engineering', @credit = 1;--courseID 17
EXEC Education.addCourse @courseMajorID = 3, @title = 'Advanced programming WorkShop', @credit = 1;--courseID 18
EXEC Education.addCourse @courseMajorID = 3, @title = 'Signals and Systems', @credit = 3;--courseID 19 
EXEC Education.addCourse @courseMajorID = 3, @title = 'Compiler Design', @credit = 3;--courseID 20
EXEC Education.addCourse @courseMajorID = 3, @title = 'Microprocessor', @credit = 3;--courseID 21
EXEC Education.addCourse @courseMajorID = 3, @title = 'Software Engineering', @credit = 3;--courseID 22
EXEC Education.addCourse @courseMajorID = 3, @title = 'Computer Networks II', @credit = 3;--courseID 23
EXEC Education.addCourse @courseMajorID = 3, @title = 'Database Laboratory ', @credit = 1;--courseID 24
EXEC Education.addCourse @courseMajorID = 3, @title = 'Database Systems II ', @credit = 3;--courseID 25
EXEC Education.addCourse @courseMajorID = 3, @title = 'Fundamentals of Data Mining', @credit = 3;--courseID 26
EXEC Education.addCourse @courseMajorID = 3, @title = 'Network Security', @credit = 2;--courseID 27
EXEC Education.addCourse @courseMajorID = 3, @title = 'IT Project Management and Control', @credit = 3;--courseID 28

--add timeSlot--
EXEC Education.addTimeSlot '08:00', '10:00', 'Saturday';
EXEC Education.addTimeSlot '10:00', '12:00', 'Saturday';
EXEC Education.addTimeSlot '15:00', '17:00', 'Saturday';
EXEC Education.addTimeSlot '08:00', '10:00', 'Sunday';
EXEC Education.addTimeSlot '10:00', '12:00', 'Sunday';
EXEC Education.addTimeSlot '15:00', '17:00', 'Sunday';
EXEC Education.addTimeSlot '08:00', '10:00', 'Monday';
EXEC Education.addTimeSlot '15:00', '17:00', 'Monday';
EXEC Education.addTimeSlot '08:00', '10:00', 'Tuesday';
EXEC Education.addTimeSlot '10:00', '12:00', 'Tuesday';
EXEC Education.addTimeSlot '15:00', '17:00', 'Tuesday';
EXEC Education.addTimeSlot '08:00', '10:00', 'Wednesday';
EXEC Education.addTimeSlot '10:00', '12:00', 'Wednesday';
EXEC Education.addTimeSlot '15:00', '17:00', 'Wednesday';
EXEC Education.addTimeSlot '08:00', '10:00', 'Saturday-Monday';
EXEC Education.addTimeSlot '10:00', '12:00', 'Saturday-Monday';
EXEC Education.addTimeSlot '15:00', '17:00', 'Saturday-Monday';
EXEC Education.addTimeSlot '08:00', '10:00', 'Sunday-Tuesday';
EXEC Education.addTimeSlot '10:00', '12:00', 'Sunday-Tuesday';
EXEC Education.addTimeSlot '15:00', '17:00', 'Sunday-Tuesday';
EXEC Education.addTimeSlot '08:00', '10:00', 'Monday-Wednesday';
EXEC Education.addTimeSlot '10:00', '12:00', 'Monday-Wednesday';
EXEC Education.addTimeSlot '15:00', '17:00', 'Monday-Wednesday';



-- add Prerequisites --
EXEC Education.addPrereq 1, 18; -- Data Structures <- Advanced programming WorkShop
EXEC Education.addPrereq 1, 7; -- Data Structures <- Advanced programming
EXEC Education.addPrereq 1, 9; -- Data Structures <- Discrete Mathematics
EXEC Education.addPrereq 2, 1; -- Algorithms <- Data Structures
EXEC Education.addPrereq 3, 13; -- Computer Architecture <- Digital systems design
EXEC Education.addPrereq 4, 2; -- Operating Systems <- Algorithms
EXEC Education.addPrereq 4, 3; -- Operating Systems <- Computer Architecture
EXEC Education.addPrereq 5, 7; -- Computer Networks <- Advanced programming
EXEC Education.addPrereq 6, 7; -- Database Systems <- Advanced programming
EXEC Education.addPrereq 12, 2; -- Artificial Intelligence <- Algorithms
EXEC Education.addPrereq 15, 11; -- Differential mathematics <- General Mathematics
EXEC Education.addPrereq 16, 11; -- Engineering statistics and probability <- General Mathematics
EXEC Education.addPrereq 18, 8; -- Advanced programming WorkShop <- Basic programming
EXEC Education.addPrereq 7, 8; -- Advanced programming <- Basic programming
EXEC Education.addPrereq 14, 10; -- Physics laboratory <- Physics 1
EXEC Education.addPrereq 19, 15; -- Signals and Systems <- Differential mathematics
EXEC Education.addPrereq 20, 4; -- Compiler Design <- Operating Systems
EXEC Education.addPrereq 21, 3; -- Microprocessor <- Computer Architecture
EXEC Education.addPrereq 22, 6; -- Software Engineering <- Database Systems
EXEC Education.addPrereq 23, 5; -- Computer Networks II <- Computer Networks
EXEC Education.addPrereq 24, 6; -- Database Laboratory <- Database Systems
EXEC Education.addPrereq 25, 6; -- Database Systems II <- Database Systems
EXEC Education.addPrereq 26, 6; -- Fundamentals of Data Mining <- Database Systems
EXEC Education.addPrereq 27, 5; -- Network Security <- Computer Networks
EXEC Education.addPrereq 28, 22; -- IT Project Management and Control <- Software Engineering


EXEC Education.addMajorChart 1, 3;

-- create chart --
EXEC Education.addSuggestTerm 1, 1, 3; -- Data Structures
EXEC Education.addSuggestTerm 1, 2, 4; -- Algorithms
EXEC Education.addSuggestTerm 1, 3, 4; -- Computer Architecture
EXEC Education.addSuggestTerm 1, 4, 5; -- Operating Systems
EXEC Education.addSuggestTerm 1, 5, 4; -- Computer Networks
EXEC Education.addSuggestTerm 1, 6, 4; -- Database Systems
EXEC Education.addSuggestTerm 1, 7, 2; -- Advanced programming
EXEC Education.addSuggestTerm 1, 8, 1; -- Basic programming
EXEC Education.addSuggestTerm 1, 9, 2; -- Discrete Mathematics
EXEC Education.addSuggestTerm 1, 10, 1; -- Physics 1
EXEC Education.addSuggestTerm 1, 11, 1; -- General Mathematics
EXEC Education.addSuggestTerm 1, 12, 5; -- Artificial Intelligence
EXEC Education.addSuggestTerm 1, 13, 3; -- Digital systems design
EXEC Education.addSuggestTerm 1, 14, 2; -- Physics laboratory
EXEC Education.addSuggestTerm 1, 15, 2; -- Differential mathematics
EXEC Education.addSuggestTerm 1, 16, 3; -- Engineering statistics and probability
EXEC Education.addSuggestTerm 1, 17, 1; -- Introduction to computer engineering
EXEC Education.addSuggestTerm 1, 18, 2; -- Advanced programming WorkShop
EXEC Education.addSuggestTerm 1, 19, 5; -- Signals and Systems
EXEC Education.addSuggestTerm 1, 20, 6; -- Compiler Design
EXEC Education.addSuggestTerm 1, 21, 6; -- Microprocessor
EXEC Education.addSuggestTerm 1, 22, 6; -- Software Engineering
EXEC Education.addSuggestTerm 1, 23, 7; -- Computer Networks II
EXEC Education.addSuggestTerm 1, 24, 7; -- Database Laboratory
EXEC Education.addSuggestTerm 1, 25, 7; -- Database Systems II
EXEC Education.addSuggestTerm 1, 26, 8; -- Fundamentals of Data Mining
EXEC Education.addSuggestTerm 1, 27, 8; -- Network Security
EXEC Education.addSuggestTerm 1, 28, 8; -- IT Project Management and Control


--add classroom--
EXEC Education.addClassroom @capacity=40, @buildingID=3, @roomNum=101;
EXEC Education.addClassroom @capacity=35, @buildingID=3, @roomNum=102;
EXEC Education.addClassroom @capacity=40, @buildingID=3, @roomNum=103;
EXEC Education.addClassroom @capacity=20, @buildingID=3, @roomNum=201;
EXEC Education.addClassroom @capacity=40, @buildingID=3, @roomNum=202;
EXEC Education.addClassroom @capacity=35, @buildingID=3, @roomNum=203;
EXEC Education.addClassroom @capacity=40, @buildingID=3, @roomNum=301;
EXEC Education.addClassroom @capacity=35, @buildingID=3, @roomNum=302;
EXEC Education.addClassroom @capacity=40, @buildingID=3, @roomNum=303;
EXEC Education.addClassroom @capacity=40, @buildingID=3, @roomNum=401;
EXEC Education.addClassroom @capacity=35, @buildingID=3, @roomNum=402;
EXEC Education.addClassroom @capacity=40, @buildingID=3, @roomNum=403;
EXEC Education.addClassroom @capacity=40, @buildingID=2, @roomNum=101;
EXEC Education.addClassroom @capacity=35, @buildingID=2, @roomNum=102;
EXEC Education.addClassroom @capacity=40, @buildingID=2, @roomNum=103;
EXEC Education.addClassroom @capacity=20, @buildingID=2, @roomNum=201;
EXEC Education.addClassroom @capacity=40, @buildingID=2, @roomNum=202;
EXEC Education.addClassroom @capacity=35, @buildingID=2, @roomNum=203;


--add person block--
EXEC Education.addPerson @firstName='Sara',    @lastName='Ahmadi',   @nationalCode='9756207353', @entryDate='2022-01-01', @majorID=3, @role='student';
EXEC Education.addPerson @firstName='Mohammad',@lastName='Kazemi',   @nationalCode='7458292482', @entryDate='2023-01-01', @majorID=3, @role='student';
EXEC Education.addPerson @firstName='Mina',    @lastName='Jafari',   @nationalCode='9603028371', @entryDate='2023-01-01', @majorID=3, @role='student';
EXEC Education.addPerson @firstName='Ali',     @lastName='Rezaei',   @nationalCode='1604154081', @entryDate='2023-01-01', @majorID=3, @role='student';
EXEC Education.addPerson @firstName='Zahra',   @lastName='Ghasemi',  @nationalCode='6292461815', @entryDate='2023-01-01', @majorID=3, @role='student';
EXEC Education.addPerson @firstName='Amir',    @lastName='Mousavi',  @nationalCode='0723381933', @entryDate='2023-01-01', @majorID=3, @role='student';
EXEC Education.addPerson @firstName='Narges',  @lastName='Karimi',   @nationalCode='8776544648', @entryDate='2023-01-01', @majorID=3, @role='student';
EXEC Education.addPerson @firstName='Reza',    @lastName='Abbasi',   @nationalCode='8368533813', @entryDate='2023-01-01', @majorID=3, @role='student';
EXEC Education.addPerson @firstName='Leila',   @lastName='Mahdavi',  @nationalCode='2494960673', @entryDate='2023-01-01', @majorID=3, @role='student';
EXEC Education.addPerson @firstName='Hossein', @lastName='Karimi',   @nationalCode='4220360451', @entryDate='2023-01-01', @majorID=3, @role='student';
EXEC Education.addPerson @firstName='Mehdi',  @lastName='Karimzadeh',@nationalCode='3039811029', @entryDate='2023-01-01', @majorID=3, @role='student';
EXEC Education.addPerson @firstName='Sara',    @lastName='Norouzi',  @nationalCode='0057117896', @entryDate='2024-01-01', @majorID=3, @role='student'; 
EXEC Education.addPerson @firstName='Pouya',   @lastName='Sadraei',  @nationalCode='4746529566', @entryDate='2024-01-01', @majorID=3, @role='student';
EXEC Education.addPerson @firstName='Sheida',  @lastName='Tavahidi', @nationalCode='8090153232', @entryDate='2024-01-01', @majorID=3, @role='student';
EXEC Education.addPerson @firstName='Farzad',  @lastName='Sadeghi',  @nationalCode='6278972964', @entryDate='2024-01-01', @majorID=3, @role='student';
EXEC Education.addPerson @firstName='Mahsa',   @lastName='Farhadi',  @nationalCode='8614212461', @entryDate='2024-01-01', @majorID=3, @role='student';
EXEC Education.addPerson @firstName='Omid',    @lastName='Rahimi',   @nationalCode='0069257418', @entryDate='2024-01-01', @majorID=3, @role='student'; 
EXEC Education.addPerson @firstName='Elham',   @lastName='Rad',      @nationalCode='7110440291', @entryDate='2024-01-01', @majorID=3, @role='student';
EXEC Education.addPerson @firstName='Arezo',   @lastName='Karimi',   @nationalCode='2538145491', @entryDate='2024-01-01', @majorID=3, @role='student';
EXEC Education.addPerson @firstName='Hamed',   @lastName='Sharifi',  @nationalCode='1532308140', @entryDate='2024-01-01', @majorID=3, @role='student';
EXEC Education.addPerson @firstName='Fatemeh', @lastName='Heydari',  @nationalCode='0282257985', @entryDate='2025-01-01', @majorID=3, @role='student'; 
EXEC Education.addPerson @firstName='Reza',    @lastName='Kazemi',   @nationalCode='3210883769', @entryDate='2025-01-01', @majorID=3, @role='student';
EXEC Education.addPerson @firstName='Saeed',   @lastName='Jafari',   @nationalCode='7269420947', @entryDate='2025-01-01', @majorID=3, @role='student';
EXEC Education.addPerson @firstName='Maryam',  @lastName='Norouzi',  @nationalCode='5508296530', @entryDate='2025-01-01', @majorID=3, @role='student';
EXEC Education.addPerson @firstName='Pouya',   @lastName='Rezaei',   @nationalCode='7223954612', @entryDate='2025-01-01', @majorID=3, @role='student';
EXEC Education.addPerson @firstName='Elham',   @lastName='Ghasemi',  @nationalCode='7068263208', @entryDate='2025-01-01', @majorID=3, @role='student';
EXEC Education.addPerson @firstName='Mohammad',@lastName='Mousavi',  @nationalCode='0101351429', @entryDate='2025-01-01', @majorID=3, @role='student'; 
EXEC Education.addPerson @firstName='Sara',    @lastName='Karimi',   @nationalCode='4319079167', @entryDate='2025-01-01', @majorID=3, @role='student';
EXEC Education.addPerson @firstName='Hossein', @lastName='Rahimi',   @nationalCode='4103622997', @entryDate='2025-01-01', @majorID=3, @role='student';
EXEC Education.addPerson @firstName='Mehdi',   @lastName='Sharifi',  @nationalCode='9157394296', @entryDate='2025-01-01', @majorID=3, @role='student';

--add instructor block--
EXEC Education.addPerson @firstName='Dr.',   @lastName='Sharifzadeh',@nationalCode='7191790180', @entryDate='2010-09-01', @majorID=3, @role='instructor';
EXEC Education.addPerson @firstName='Eng.',   @lastName='Ghorbani',  @nationalCode='2289006866', @entryDate='2012-02-15', @majorID=3, @role='instructor';
EXEC Education.addPerson @firstName='Dr.',    @lastName='Mousavi',   @nationalCode='7920545161', @entryDate='2015-08-20', @majorID=3, @role='instructor';
EXEC Education.addPerson @firstName='Eng.',   @lastName='Kazemi',    @nationalCode='3369777347', @entryDate='2017-01-10', @majorID=3, @role='instructor';
EXEC Education.addPerson @firstName='Dr.',    @lastName='Heydari',   @nationalCode='9448497954', @entryDate='2018-06-05', @majorID=3, @role='instructor';
EXEC Education.addPerson @firstName='Eng.',   @lastName='Mohammadi', @nationalCode='8781446861', @entryDate='2019-11-01', @majorID=3, @role='instructor';
EXEC Education.addPerson @firstName='Dr.',    @lastName='Karimi',    @nationalCode='3764696419', @entryDate='2020-03-15', @majorID=3, @role='instructor';
EXEC Education.addPerson @firstName='Eng.',   @lastName='Rezaei',    @nationalCode='5595662999', @entryDate='2021-09-20', @majorID=3, @role='instructor';
EXEC Education.addPerson @firstName='Dr.',    @lastName='Najafi',    @nationalCode='6412299769', @entryDate='2022-01-01', @majorID=3, @role='instructor';
EXEC Education.addPerson @firstName='Eng.',   @lastName='Sediqi',    @nationalCode='9714901111', @entryDate='2021-06-10', @majorID=3, @role='instructor';

--- add librarian ---
EXEC Education.addPerson @firstName='Mr.',   @lastName='Ghasemi',    @nationalCode='2367863628', @entryDate='2018-06-05', @majorID=5, @role='librarian';
EXEC Education.addPerson @firstName='Mr.',   @lastName='Rezaei',    @nationalCode='9572244213', @entryDate='2019-07-15', @majorID=5, @role='librarian';


--assign advisor--
EXEC Education.AssignAdvisor 1,40;
EXEC Education.AssignAdvisor 2,40;
EXEC Education.AssignAdvisor 3,34;
EXEC Education.AssignAdvisor 4,33;
EXEC Education.AssignAdvisor 5,31;
EXEC Education.AssignAdvisor 6,39;
EXEC Education.AssignAdvisor 7,34;
EXEC Education.AssignAdvisor 8,32;
EXEC Education.AssignAdvisor 9,33;
EXEC Education.AssignAdvisor 10,34;
EXEC Education.AssignAdvisor 11,37;
EXEC Education.AssignAdvisor 12,33;
EXEC Education.AssignAdvisor 13,39;
EXEC Education.AssignAdvisor 14,35;
EXEC Education.AssignAdvisor 15,31;
EXEC Education.AssignAdvisor 16,35;
EXEC Education.AssignAdvisor 17,37;
EXEC Education.AssignAdvisor 18,38;
EXEC Education.AssignAdvisor 19,39;
EXEC Education.AssignAdvisor 20,32;
EXEC Education.AssignAdvisor 21,32;
EXEC Education.AssignAdvisor 22,32;
EXEC Education.AssignAdvisor 23,36;
EXEC Education.AssignAdvisor 24,36;
EXEC Education.AssignAdvisor 25,37;
EXEC Education.AssignAdvisor 26,37;
EXEC Education.AssignAdvisor 27,37;
EXEC Education.AssignAdvisor 28,40;
EXEC Education.AssignAdvisor 29,34;
EXEC Education.AssignAdvisor 30,33;


EXEC Education.AssignInstructorspecialist 31 ,'Software Engineering';
EXEC Education.AssignInstructorspecialist 32 ,'Embedded Systems';
EXEC Education.AssignInstructorspecialist 33 ,'Software Engineering';
EXEC Education.AssignInstructorspecialist 34 ,'Computer Networks';
EXEC Education.AssignInstructorspecialist 35 ,'Computer Networks';
EXEC Education.AssignInstructorspecialist 36 ,'Artificial Intelligence';
EXEC Education.AssignInstructorspecialist 37 ,'Embedded Systems';
EXEC Education.AssignInstructorspecialist 38 ,'Artificial Intelligence';		
EXEC Education.AssignInstructorspecialist 39 ,'Computer Architecture';
EXEC Education.AssignInstructorspecialist 40 ,'Computer Architecture';



-- Add sections for 2022-2025

-- Year 2022, Semester 1
EXEC Education.addSection @courseID=1,  @semester=1, @year=2022, @classroomID=10, @instructorID=40, @timeSlotID=15; --secID 1 -- Data Structures       
EXEC Education.addSection @courseID=4,  @semester=1, @year=2022, @classroomID=11, @instructorID=31, @timeSlotID=16; --secID 2 -- Operating Systems     
EXEC Education.addSection @courseID=8,  @semester=1, @year=2022, @classroomID=12, @instructorID=32, @timeSlotID=17; --secID 3 -- Basic programming     
EXEC Education.addSection @courseID=10, @semester=1, @year=2022, @classroomID=13, @instructorID=33, @timeSlotID=18; --secID 4 -- Physics 1             
EXEC Education.addSection @courseID=11, @semester=1, @year=2022, @classroomID=14, @instructorID=34, @timeSlotID=19; --secID 5 -- General Mathematics   
EXEC Education.addSection @courseID=12, @semester=1, @year=2022, @classroomID=15, @instructorID=35, @timeSlotID=20; --secID 6 -- Artificial Intelligence 
EXEC Education.addSection @courseID=13, @semester=1, @year=2022, @classroomID=16, @instructorID=36, @timeSlotID=21; --secID 7 -- Digital systems design  
EXEC Education.addSection @courseID=16, @semester=1, @year=2022, @classroomID=17, @instructorID=37, @timeSlotID=22; --secID 8 -- Engineering statistics and probability
EXEC Education.addSection @courseID=17, @semester=1, @year=2022, @classroomID=18, @instructorID=38, @timeSlotID=13;  --secID 9 -- Introduction to computer engineering  
EXEC Education.addSection @courseID=19, @semester=1, @year=2022, @classroomID=1, @instructorID=38, @timeSlotID=18; --secID 10 -- Signals and Systems
EXEC Education.addSection @courseID=23, @semester=1, @year=2022, @classroomID=2, @instructorID=39, @timeSlotID=17;  --secID 11 -- Computer Networks II
EXEC Education.addSection @courseID=24, @semester=1, @year=2022, @classroomID=3, @instructorID=40, @timeSlotID=1; --secID 12 -- Database Laboratory
EXEC Education.addSection @courseID=25, @semester=1, @year=2022, @classroomID=4, @instructorID=32, @timeSlotID=15; --secID 13 -- Database Systems II
EXEC Education.addSection @courseID=9, @semester=1, @year=2022, @classroomID=5, @instructorID=33, @timeSlotID=18;  --secID 14 -- Discrete Mathematics
EXEC Education.addSection @courseID=3, @semester=1, @year=2022, @classroomID=6, @instructorID=34, @timeSlotID=15; --secID 15 -- Computer Architecture
EXEC Education.addSection @courseID=2, @semester=1, @year=2022, @classroomID=7, @instructorID=35, @timeSlotID=20;  --secID 16 -- Algorithms


-- Year 2022, Semester 2
EXEC Education.addSection @courseID=2, @semester=2, @year=2022, @classroomID=1, @instructorID=31, @timeSlotID=15; --secID 17 -- Algorithms             
EXEC Education.addSection @courseID=1, @semester=2, @year=2022, @classroomID=2, @instructorID=32, @timeSlotID=15; --secID 18 -- Data Structures        
EXEC Education.addSection @courseID=3, @semester=2, @year=2022, @classroomID=2, @instructorID=32, @timeSlotID=16; --secID 19 -- Computer Architecture  
EXEC Education.addSection @courseID=5, @semester=2, @year=2022, @classroomID=3, @instructorID=33, @timeSlotID=17; --secID 20 -- Computer Networks      
EXEC Education.addSection @courseID=6, @semester=2, @year=2022, @classroomID=4, @instructorID=34, @timeSlotID=18; --secID 21 -- Database Systems       
EXEC Education.addSection @courseID=7, @semester=2, @year=2022, @classroomID=5, @instructorID=35, @timeSlotID=19; --secID 22 -- Advanced programming   
EXEC Education.addSection @courseID=9, @semester=2, @year=2022, @classroomID=6, @instructorID=36, @timeSlotID=20; --secID 23 -- Discrete Mathematics   
EXEC Education.addSection @courseID=14, @semester=2, @year=2022, @classroomID=7, @instructorID=37, @timeSlotID=1; --secID 24 -- Physics laboratory     
EXEC Education.addSection @courseID=15, @semester=2, @year=2022, @classroomID=8, @instructorID=38, @timeSlotID=21;--secID 25 -- Differential mathematics
EXEC Education.addSection @courseID=11, @semester=2, @year=2022, @classroomID=4, @instructorID=34, @timeSlotID=22;--secID 26 -- General Mathematics    
EXEC Education.addSection @courseID=18, @semester=2, @year=2022, @classroomID=9, @instructorID=39, @timeSlotID=13; --secID 27 -- Advanced programming WorkShop
EXEC Education.addSection @courseID=20, @semester=2, @year=2022, @classroomID=10, @instructorID=39, @timeSlotID=18; --secID 28 -- Compiler Design
EXEC Education.addSection @courseID=21, @semester=2, @year=2022, @classroomID=11, @instructorID=35, @timeSlotID=16; --secID 29 -- Microprocessor
EXEC Education.addSection @courseID=22, @semester=2, @year=2022, @classroomID=12, @instructorID=32, @timeSlotID=15; --secID 30 -- Software Engineering
EXEC Education.addSection @courseID=26, @semester=2, @year=2022, @classroomID=1, @instructorID=35, @timeSlotID=23; --secID 31 -- Fundamentals of Data Mining
EXEC Education.addSection @courseID=27, @semester=2, @year=2022, @classroomID=3, @instructorID=35, @timeSlotID=12; --secID 32 -- Network Security
EXEC Education.addSection @courseID=28, @semester=2, @year=2022, @classroomID=5, @instructorID=35, @timeSlotID=21; --secID 33 -- IT Project Management and Control
EXEC Education.addSection @courseID=13, @semester=2, @year=2022, @classroomID=12, @instructorID=36, @timeSlotID=15; --secID 34 -- Digital systems design
EXEC Education.addSection @courseID=4, @semester=2, @year=2022, @classroomID=13, @instructorID=37, @timeSlotID=22; --secID 35 -- Operating Systems
EXEC Education.addSection @courseID=12, @semester=2, @year=2022, @classroomID=8, @instructorID=38, @timeSlotID=19; --secID 36 -- Artificial Intelligence


-- Year 2023, Semester 1
EXEC Education.addSection @courseID=1, @semester=1, @year=2023, @classroomID=10, @instructorID=40, @timeSlotID=15; --secID 37 -- Data Structures       
EXEC Education.addSection @courseID=4, @semester=1, @year=2023, @classroomID=11, @instructorID=31, @timeSlotID=16; --secID 38 -- Operating Systems     
EXEC Education.addSection @courseID=8, @semester=1, @year=2023, @classroomID=12, @instructorID=32, @timeSlotID=17; --secID 39 -- Basic programming      
EXEC Education.addSection @courseID=10, @semester=1, @year=2023, @classroomID=13, @instructorID=33, @timeSlotID=18;--secID 40 -- Physics 1             
EXEC Education.addSection @courseID=11, @semester=1, @year=2023, @classroomID=14, @instructorID=34, @timeSlotID=19;--secID 41 -- General Mathematics   
EXEC Education.addSection @courseID=12, @semester=1, @year=2023, @classroomID=15, @instructorID=35, @timeSlotID=20;--secID 42 -- Artificial Intelligence
EXEC Education.addSection @courseID=13, @semester=1, @year=2023, @classroomID=16, @instructorID=36, @timeSlotID=21;--secID 43 -- Digital systems design
EXEC Education.addSection @courseID=16, @semester=1, @year=2023, @classroomID=17, @instructorID=37, @timeSlotID=22;--secID 44 -- Engineering statistics and probability
EXEC Education.addSection @courseID=17, @semester=1, @year=2023, @classroomID=18, @instructorID=38, @timeSlotID=1; --secID 45 -- Introduction to computer engineering
EXEC Education.addSection @courseID=19, @semester=1, @year=2023, @classroomID=1, @instructorID=38, @timeSlotID=15; --secID 46 -- Signals and Systems
EXEC Education.addSection @courseID=23, @semester=1, @year=2023, @classroomID=2, @instructorID=39, @timeSlotID=22;  --secID 47 -- Computer Networks II
EXEC Education.addSection @courseID=24, @semester=1, @year=2023, @classroomID=3, @instructorID=40, @timeSlotID=14; --secID 48 -- Database Laboratory
EXEC Education.addSection @courseID=25, @semester=1, @year=2023, @classroomID=4, @instructorID=32, @timeSlotID=18;  --secID 49 -- Database Systems II
EXEC Education.addSection @courseID=9, @semester=1, @year=2023, @classroomID=5, @instructorID=33, @timeSlotID=18;  --secID 50 -- Discrete Mathematics
EXEC Education.addSection @courseID=3, @semester=1, @year=2023, @classroomID=6, @instructorID=34, @timeSlotID=16; --secID 51 -- Computer Architecture
EXEC Education.addSection @courseID=2, @semester=1, @year=2023, @classroomID=7, @instructorID=35, @timeSlotID=16;  --secID 52 -- Algorithms


-- Year 2023, Semester 2
EXEC Education.addSection @courseID=2, @semester=2, @year=2023, @classroomID=1, @instructorID=39, @timeSlotID=15; --secID 53 -- Algorithms              
EXEC Education.addSection @courseID=3, @semester=2, @year=2023, @classroomID=2, @instructorID=40, @timeSlotID=16; --secID 54 -- Computer Architecture   
EXEC Education.addSection @courseID=5, @semester=2, @year=2023, @classroomID=3, @instructorID=31, @timeSlotID=17; --secID 55 -- Computer Networks       
EXEC Education.addSection @courseID=6, @semester=2, @year=2023, @classroomID=4, @instructorID=32, @timeSlotID=18; --secID 56 -- Database Systems        
EXEC Education.addSection @courseID=7, @semester=2, @year=2023, @classroomID=5, @instructorID=33, @timeSlotID=19; --secID 57 -- Advanced programming    
EXEC Education.addSection @courseID=9, @semester=2, @year=2023, @classroomID=6, @instructorID=34, @timeSlotID=20; --secID 58 -- Discrete Mathematics    
EXEC Education.addSection @courseID=14, @semester=2, @year=2023, @classroomID=7, @instructorID=35, @timeSlotID=1; --secID 59 -- Physics laboratory      
EXEC Education.addSection @courseID=15, @semester=2, @year=2023, @classroomID=8, @instructorID=36, @timeSlotID=21;--secID 60 -- Differential mathematics
EXEC Education.addSection @courseID=18, @semester=2, @year=2023, @classroomID=9, @instructorID=37, @timeSlotID=11; --secID 61 -- Advanced programming WorkShop
EXEC Education.addSection @courseID=1, @semester=2, @year=2023, @classroomID=1, @instructorID=31, @timeSlotID=15; --secID 62 -- Data Structures         
EXEC Education.addSection @courseID=1, @semester=2, @year=2023, @classroomID=2, @instructorID=32, @timeSlotID=16; --secID 63 -- Data Structures         
EXEC Education.addSection @courseID=11, @semester=2, @year=2023, @classroomID=3, @instructorID=33, @timeSlotID=15;--secID 64 -- General Mathematics     
EXEC Education.addSection @courseID=11, @semester=2, @year=2023, @classroomID=4, @instructorID=34, @timeSlotID=15;--secID 65 -- General Mathematics     
EXEC Education.addSection @courseID=20, @semester=2, @year=2023, @classroomID=10, @instructorID=39, @timeSlotID=23; --secID 66 -- Compiler Design
EXEC Education.addSection @courseID=21, @semester=2, @year=2023, @classroomID=11, @instructorID=35, @timeSlotID=18; --secID 67 -- Microprocessor
EXEC Education.addSection @courseID=22, @semester=2, @year=2023, @classroomID=12, @instructorID=32, @timeSlotID=19; --secID 68 -- Software Engineering
EXEC Education.addSection @courseID=26, @semester=2, @year=2023, @classroomID=1, @instructorID=35, @timeSlotID=15; --secID 69 -- Fundamentals of Data Mining
EXEC Education.addSection @courseID=27, @semester=2, @year=2023, @classroomID=3, @instructorID=35, @timeSlotID=12; --secID 70 -- Network Security
EXEC Education.addSection @courseID=28, @semester=2, @year=2023, @classroomID=5, @instructorID=35, @timeSlotID=21; --secID 71 -- IT Project Management and Control
EXEC Education.addSection @courseID=13, @semester=2, @year=2023, @classroomID=12, @instructorID=36, @timeSlotID=23; --secID 72 -- Digital systems design
EXEC Education.addSection @courseID=4, @semester=2, @year=2023, @classroomID=13, @instructorID=37, @timeSlotID=11; --secID 73 -- Operating Systems
EXEC Education.addSection @courseID=12, @semester=2, @year=2023, @classroomID=8, @instructorID=38, @timeSlotID=23; --secID 74 -- Artificial Intelligence


-- Year 2024, Semester 1
EXEC Education.addSection @courseID=1, @semester=1, @year=2024, @classroomID=10, @instructorID=38, @timeSlotID=22; --secID 75 -- Data Structures       
EXEC Education.addSection @courseID=4, @semester=1, @year=2024, @classroomID=11, @instructorID=39, @timeSlotID=23; --secID 76 -- Operating Systems     
EXEC Education.addSection @courseID=8, @semester=1, @year=2024, @classroomID=12, @instructorID=40, @timeSlotID=17;  --secID 77 -- Basic programming     
EXEC Education.addSection @courseID=10, @semester=1, @year=2024, @classroomID=13, @instructorID=31, @timeSlotID=18; --secID 78 -- Physics 1             
EXEC Education.addSection @courseID=11, @semester=1, @year=2024, @classroomID=14, @instructorID=32, @timeSlotID=19; --secID 79 -- General Mathematics   
EXEC Education.addSection @courseID=12, @semester=1, @year=2024, @classroomID=15, @instructorID=33, @timeSlotID=20;--secID 80 -- Artificial Intelligence
EXEC Education.addSection @courseID=13, @semester=1, @year=2024, @classroomID=16, @instructorID=34, @timeSlotID=21; --secID 81 -- Digital systems design
EXEC Education.addSection @courseID=16, @semester=1, @year=2024, @classroomID=17, @instructorID=35, @timeSlotID=22; --secID 82 -- Engineering statistics and probability
EXEC Education.addSection @courseID=17, @semester=1, @year=2024, @classroomID=18, @instructorID=36, @timeSlotID=13; --secID 83 -- Introduction to computer engineering
EXEC Education.addSection @courseID=19, @semester=1, @year=2024, @classroomID=1, @instructorID=38, @timeSlotID=18; --secID 84 -- Signals and Systems
EXEC Education.addSection @courseID=23, @semester=1, @year=2024, @classroomID=2, @instructorID=39, @timeSlotID=15;  --secID 85 -- Computer Networks II
EXEC Education.addSection @courseID=24, @semester=1, @year=2024, @classroomID=3, @instructorID=40, @timeSlotID=1; --secID 86 -- Database Laboratory
EXEC Education.addSection @courseID=25, @semester=1, @year=2024, @classroomID=4, @instructorID=32, @timeSlotID=23;  --secID 87 -- Database Systems II
EXEC Education.addSection @courseID=9, @semester=1, @year=2024, @classroomID=5, @instructorID=33, @timeSlotID=16;  --secID 88 -- Discrete Mathematics
EXEC Education.addSection @courseID=3, @semester=1, @year=2024, @classroomID=6, @instructorID=34, @timeSlotID=16; --secID 89 -- Computer Architecture
EXEC Education.addSection @courseID=2, @semester=1, @year=2024, @classroomID=7, @instructorID=35, @timeSlotID=17;  --secID 90 -- Algorithms


-- Year 2024, Semester 2
EXEC Education.addSection @courseID=2, @semester=2, @year=2024, @classroomID=1, @instructorID=37, @timeSlotID=15; --secID 91 -- Algorithms              
EXEC Education.addSection @courseID=3, @semester=2, @year=2024, @classroomID=2, @instructorID=38, @timeSlotID=16; --secID 92 -- Computer Architecture   
EXEC Education.addSection @courseID=5, @semester=2, @year=2024, @classroomID=3, @instructorID=39, @timeSlotID=17; --secID 93 -- Computer Networks       
EXEC Education.addSection @courseID=6, @semester=2, @year=2024, @classroomID=4, @instructorID=40, @timeSlotID=18; --secID 94 -- Database Systems        
EXEC Education.addSection @courseID=7, @semester=2, @year=2024, @classroomID=5, @instructorID=31, @timeSlotID=19; --secID 95 -- Advanced programming    
EXEC Education.addSection @courseID=9, @semester=2, @year=2024, @classroomID=6, @instructorID=32, @timeSlotID=20; --secID 96 -- Discrete Mathematics    
EXEC Education.addSection @courseID=14, @semester=2, @year=2024, @classroomID=7, @instructorID=33, @timeSlotID=1; --secID 97 -- Physics laboratory      
EXEC Education.addSection @courseID=15, @semester=2, @year=2024, @classroomID=8, @instructorID=34, @timeSlotID=21;--secID 98 -- Differential mathematics
EXEC Education.addSection @courseID=18, @semester=2, @year=2024, @classroomID=9, @instructorID=35, @timeSlotID=14; --secID 99 -- Advanced programming WorkShop
EXEC Education.addSection @courseID=1, @semester=2, @year=2024, @classroomID=1, @instructorID=31, @timeSlotID=15; --secID 100 -- Data Structures         
EXEC Education.addSection @courseID=1, @semester=2, @year=2024, @classroomID=2, @instructorID=32, @timeSlotID=16; --secID 101 -- Data Structures         
EXEC Education.addSection @courseID=11, @semester=2, @year=2024, @classroomID=3, @instructorID=33, @timeSlotID=15;--secID 102 -- General Mathematics     
EXEC Education.addSection @courseID=11, @semester=2, @year=2024, @classroomID=4, @instructorID=34, @timeSlotID=15;--secID 103 -- General Mathematics     
EXEC Education.addSection @courseID=20, @semester=2, @year=2024, @classroomID=10, @instructorID=39, @timeSlotID=17; --secID 104 -- Compiler Design
EXEC Education.addSection @courseID=21, @semester=2, @year=2024, @classroomID=11, @instructorID=35, @timeSlotID=18; --secID 105 -- Microprocessor
EXEC Education.addSection @courseID=22, @semester=2, @year=2024, @classroomID=12, @instructorID=32, @timeSlotID=16; --secID 106 -- Software Engineering
EXEC Education.addSection @courseID=26, @semester=2, @year=2024, @classroomID=1, @instructorID=35, @timeSlotID=23; --secID 107 -- Fundamentals of Data Mining
EXEC Education.addSection @courseID=27, @semester=2, @year=2024, @classroomID=3, @instructorID=35, @timeSlotID=12; --secID 108 -- Network Security
EXEC Education.addSection @courseID=28, @semester=2, @year=2024, @classroomID=5, @instructorID=35, @timeSlotID=21; --secID 109 -- IT Project Management and Control
EXEC Education.addSection @courseID=13, @semester=2, @year=2024, @classroomID=12, @instructorID=36, @timeSlotID=16; --secID 110 -- Digital systems design
EXEC Education.addSection @courseID=4, @semester=2, @year=2024, @classroomID=13, @instructorID=37, @timeSlotID=11; --secID 111 -- Operating Systems
EXEC Education.addSection @courseID=12, @semester=2, @year=2024, @classroomID=8, @instructorID=38, @timeSlotID=15; --secID 112 -- Artificial Intelligence


-- Year 2025, Semester 1
EXEC Education.addSection @courseID=1, @semester=1, @year=2025, @classroomID=1, @instructorID=39, @timeSlotID=15; --secID 113 -- Data Structures            
EXEC Education.addSection @courseID=4, @semester=1, @year=2025, @classroomID=4, @instructorID=31, @timeSlotID=18; --secID 114 -- Operating Systems          
EXEC Education.addSection @courseID=8, @semester=1, @year=2025, @classroomID=4, @instructorID=32, @timeSlotID=17; --secID 115 -- Basic programming           
EXEC Education.addSection @courseID=10, @semester=1, @year=2025, @classroomID=18, @instructorID=36, @timeSlotID=18; --secID 116 -- Physics 1                 
EXEC Education.addSection @courseID=11, @semester=1, @year=2025, @classroomID=17, @instructorID=36, @timeSlotID=19; --secID 117 -- General Mathematics       
EXEC Education.addSection @courseID=12, @semester=1, @year=2025, @classroomID=10, @instructorID=33, @timeSlotID=20; --secID 118 -- Artificial Intelligence
EXEC Education.addSection @courseID=13, @semester=1, @year=2025, @classroomID=4, @instructorID=34, @timeSlotID=21;  --secID 119 -- Digital systems design    
EXEC Education.addSection @courseID=16, @semester=1, @year=2025, @classroomID=13, @instructorID=40, @timeSlotID=22; --secID 120 -- Engineering statistics and probability
EXEC Education.addSection @courseID=17, @semester=1, @year=2025, @classroomID=14, @instructorID=33, @timeSlotID=1; --secID 121 -- Introduction to computer engineering
EXEC Education.addSection @courseID=19, @semester=1, @year=2025, @classroomID=1, @instructorID=38, @timeSlotID=19; --secID 122 -- Signals and Systems
EXEC Education.addSection @courseID=23, @semester=1, @year=2025, @classroomID=2, @instructorID=39, @timeSlotID=18;  --secID 123 -- Computer Networks II
EXEC Education.addSection @courseID=24, @semester=1, @year=2025, @classroomID=3, @instructorID=40, @timeSlotID=13; --secID 124 -- Database Laboratory
EXEC Education.addSection @courseID=25, @semester=1, @year=2025, @classroomID=4, @instructorID=32, @timeSlotID=15;  --secID 125 -- Database Systems II
EXEC Education.addSection @courseID=9, @semester=1, @year=2025, @classroomID=5, @instructorID=33, @timeSlotID=17;  --secID 126 -- Discrete Mathematics
EXEC Education.addSection @courseID=3, @semester=1, @year=2025, @classroomID=6, @instructorID=34, @timeSlotID=16; --secID 127 -- Computer Architecture
EXEC Education.addSection @courseID=2, @semester=1, @year=2025, @classroomID=7, @instructorID=35, @timeSlotID=17;  --secID 128 -- Algorithms


-- Year 2025, Semester 2
select * from Education.TimeSlot
EXEC Education.addSection @courseID=2, @semester=2, @year=2025, @classroomID=2, @instructorID=33, @timeSlotID=16; --secID 129 -- Algorithms              
EXEC Education.addSection @courseID=3, @semester=2, @year=2025, @classroomID=3, @instructorID=35, @timeSlotID=17; --secID 130 -- Computer Architecture   
EXEC Education.addSection @courseID=5, @semester=2, @year=2025, @classroomID=5, @instructorID=32, @timeSlotID=19; --secID 131 -- Computer Networks       
EXEC Education.addSection @courseID=6, @semester=2, @year=2025, @classroomID=6, @instructorID=40, @timeSlotID=20; --secID 132 -- Database Systems        
EXEC Education.addSection @courseID=7, @semester=2, @year=2025, @classroomID=7, @instructorID=39, @timeSlotID=21; --secID 133 -- Advanced programming    
EXEC Education.addSection @courseID=9, @semester=2, @year=2025, @classroomID=8, @instructorID=38, @timeSlotID=22; --secID 134 -- Discrete Mathematics    
EXEC Education.addSection @courseID=14, @semester=2, @year=2025, @classroomID=15, @instructorID=37, @timeSlotID=13;--secID 135 -- Physics laboratory      
EXEC Education.addSection @courseID=15, @semester=2, @year=2025, @classroomID=11, @instructorID=37, @timeSlotID=15;--secID 136 -- Differential mathematics
EXEC Education.addSection @courseID=18, @semester=2, @year=2025, @classroomID=9, @instructorID=39, @timeSlotID=1; --secID 137 -- Advanced programming WorkShop
EXEC Education.addSection @courseID=1, @semester=2, @year=2025, @classroomID=1, @instructorID=31, @timeSlotID=15; --secID 138 -- Data Structures         
EXEC Education.addSection @courseID=1, @semester=2, @year=2025, @classroomID=2, @instructorID=32, @timeSlotID=16; --secID 139 -- Data Structures         
EXEC Education.addSection @courseID=11, @semester=2, @year=2025, @classroomID=3, @instructorID=33, @timeSlotID=15;--secID 140 -- General Mathematics     
EXEC Education.addSection @courseID=11, @semester=2, @year=2025, @classroomID=4, @instructorID=34, @timeSlotID=15;--secID 141 -- General Mathematics     
EXEC Education.addSection @courseID=20, @semester=2, @year=2025, @classroomID=10, @instructorID=39, @timeSlotID=17; --secID 142 -- Compiler Design
EXEC Education.addSection @courseID=21, @semester=2, @year=2025, @classroomID=11, @instructorID=35, @timeSlotID=18; --secID 143 -- Microprocessor
EXEC Education.addSection @courseID=22, @semester=2, @year=2025, @classroomID=12, @instructorID=32, @timeSlotID=16; --secID 144 -- Software Engineering
EXEC Education.addSection @courseID=26, @semester=2, @year=2025, @classroomID=1, @instructorID=35, @timeSlotID=23; --secID 145 -- Fundamentals of Data Mining
EXEC Education.addSection @courseID=27, @semester=2, @year=2025, @classroomID=3, @instructorID=35, @timeSlotID=19; --secID 146 -- Network Security
EXEC Education.addSection @courseID=28, @semester=2, @year=2025, @classroomID=5, @instructorID=35, @timeSlotID=21; --secID 147 -- IT Project Management and Control
EXEC Education.addSection @courseID=13, @semester=2, @year=2025, @classroomID=12, @instructorID=36, @timeSlotID=16; --secID 148 -- Digital systems design
EXEC Education.addSection @courseID=4, @semester=2, @year=2025, @classroomID=13, @instructorID=37, @timeSlotID=23; --secID 149 -- Operating Systems
EXEC Education.addSection @courseID=12, @semester=2, @year=2025, @classroomID=8, @instructorID=38, @timeSlotID=15; --secID 150 -- Artificial Intelligence
go



---------automatic take section--------

create procedure Education.autoTakeSection
    @currDate DATETIME
as begin
    declare @studentID INT = (
        select min(studentID)
        from Education.Student
        where studentID > 1
    );

    while @studentID is not NULL
    begin
        declare @nextStudentID INT = (
            select min(studentID)
            from Education.Student
            where studentID > @studentID and studentID > 1
        );

        declare @courseID INT = (
            select min(courseID)
            from Education.SuggestCoursesForStudent(@studentID, @currDate)
        );

        while @courseID is not NULL
        begin
            declare @nextCourseID INT = (
                select min(courseID)
                from Education.SuggestCoursesForStudent(@studentID, @currDate)
                where courseID > @courseID
            );

            declare @currentSectionID INT, @nextSectionID INT;

            select TOP 1 @currentSectionID = s.secID
            from Education.Section s
            where s.courseID = @courseID
              and Education.isSectionInCurrentTerm(s.secID, @currDate) = 1
              and (select count(*) from Education.Takes where sectionID = s.secID) <
                  (select capacity from Education.Classroom where classroomID = s.classroomID)
            order by s.secID;

            while @currentSectionID is not null
            begin
                if Education.CheckTimeConflict(@studentID, @currentSectionID) = 0
                begin
                    begin TRY
                        exec Education.takeSection @studentID, @currentSectionID, @currDate;
                        break;
                    end TRY
                    begin CATCH
                        ROLLBACK;
                    end CATCH
                end;

                select TOP 1 @nextSectionID = s.secID
                from Education.Section s
                where s.courseID = @courseID
                  and s.secID > @currentSectionID
                  and Education.isSectionInCurrentTerm(s.secID, @currDate) = 1
                  and (select count(*) from Education.Takes where sectionID = s.secID) <
                      (select capacity from Education.Classroom where classroomID = s.classroomID)
                order by s.secID;

                set @currentSectionID = @nextSectionID;
            end;

            set @courseID = @nextCourseID;
        end;

        set @studentID = @nextStudentID;
    end;
end;
go

---------automatic fill grade--------

create procedure Education.autoFillGrade
as begin
    declare @studentID INT;
    declare @sectionID INT;

    select top 1
        @studentID = t.studentID, @sectionID = t.sectionID
    from Education.Takes t
    where t.status = 'ongoing' and t.studentID > 1
    order by studentID, sectionID;

    while @studentID is not null and @sectionID is not null
    begin
        declare @grade DECIMAL(5,2) = CAST((RAND(CHECKSUM(NEWID())) * 10 + 10) AS DECIMAL(5,2));
        exec Education.updateStudentGrade @studentID, @sectionID, @grade;
        
        select top 1
            @studentID = t.studentID, @sectionID = t.sectionID
        from Education.Takes t
        where t.status = 'ongoing' and (t.studentID>@studentID OR (t.studentID = @studentID and t.sectionID>@sectionID))
        order by studentID, sectionID;
    end
end;
GO

create procedure education.autoFillGrade2
as begin
    create table #ongoingtakes (
        rowNum INT identity(1,1) primary key,
        studentID INT,
        sectionID INT
    );

    insert into #ongoingtakes (studentID, sectionID)
    select t.studentID, t.sectionID
    from education.takes t
    where t.status = 'ongoing' and t.studentID > 1
    order by t.studentID, t.sectionID;

    declare @maxrow INT, @currrow INT = 1;
    declare @studentID INT, @sectionID INT;

    select @maxrow = count(*) from #ongoingtakes;

    while @currrow <= @maxrow
    begin
        select @studentID = studentID, @sectionID = sectionID
        from #ongoingtakes
        where rowNum = @currrow;

        declare @grade DECIMAL(5,2) = CAST((RAND(CHECKSUM(NEWID())) * 10 + 10) AS DECIMAL(5,2));

        exec education.updatestudentgrade @studentID, @sectionID, @grade;
        set @currrow += 1;
    end

    drop table #ongoingtakes;
end;
go

------------------------Take Section-----------------------------------------

select * from Education.Section;

begin
    -- درس های ترم 1 برای آیدی 1            
    declare @currentDate DateTime = '2022-01-01';
    exec Education.takeSection 1, 3, @currentDate;-- Basic programming
    exec Education.takeSection 1, 9, @currentDate;-- Introduction to computer engineering  
    exec Education.takeSection 1, 4, @currentDate;-- Physics 1
    exec Education.takeSection 1, 5, @currentDate;-- General Mathematics
    -- از آنجایی که هیچ دانشجویی نداریم که ورودی این ترم باشد،پس فقط دانشجوی آیدی 1 درس برمیدارد
    exec Education.autoTakeSection @currentDate;
end
go
begin
    -- نمره های ترم 1 برای آیدی 1
    exec Education.updateStudentGrade 1, 3,16;
    exec Education.updateStudentGrade 1, 9,20;
    exec Education.updateStudentGrade 1, 5,17;
    exec Education.updateStudentGrade 1, 4,17.5;
end
go



select * from Education.Takes;

begin
	-- درس های پیشنهادی برای ترم 2برای آیدی 1
	declare @currentDate DateTime = '2022-06-15';
	select * from Education.SuggestCoursesForStudent(1, @currentDate);
end
go

begin
    --درس های ترم 2برای آیدی 1
    declare @currentDate DateTime = '2022-06-15';
    exec Education.takeSection 1, 27, @currentDate -- Advanced programming WorkShop
    exec Education.takeSection 1, 25, @currentDate -- Differential mathematics
    exec Education.takeSection 1, 23, @currentDate -- Discrete Mathematics 
    exec Education.takeSection 1, 22, @currentDate -- Advanced programming
    exec Education.takeSection 1, 24, @currentDate -- Physics laboratory
    -- بقیه ی دانشجویان به صورت اتوماتیک به آنها درس داده میشود
    exec Education.autoTakeSection @currentDate;
end
go

-- نمره دهی :
begin
    -- نمره های ترم 2 برای آیدی 1
    -- گسسته رو افتاد
    exec Education.updateStudentGrade 1, 22,14;
    exec Education.updateStudentGrade 1, 23,9;
    exec Education.updateStudentGrade 1, 24,18.5;
    exec Education.updateStudentGrade 1, 25,14.75;
    exec Education.updateStudentGrade 1, 27,16.25;
    -- نمره دادن به بقیه ی دانشحویان به صورت اتوماتیک
    exec Education.autoFillGrade2;
end
go

begin
	-- درس های پیشنهادی برای ترم 3
	-- چون گسسته رو افتاده براش دی اس رو نمایش نمیده
	declare @currentDate DateTime = '2023-01-01';
	select * from Education.SuggestCoursesForStudent(1, @currentDate)
end
go

begin
    declare @currentDate DateTime = '2023-01-01';
    -- درس های ترم 3
    -- تو خط بعدی میخواد ساختمان داده رو برداره ولی نمیتونه
    -- چون گسسته رو پاس نکرده
    exec Education.takeSection 1, 37, @currentDate; -- Data Structures

    -- حالا سناریو اینه دیجتال رو میوفته ولی   آمار رو پاس میکنه ترم 3
    -- گسسته رو هم برمیداره چون افتاده بود
    exec Education.takeSection 1, 43, @currentDate;-- Digital systems design
    exec Education.takeSection 1, 44, @currentDate;-- Engineering statistics and probability
    exec Education.takeSection 1, 50, @currentDate; -- Discrete Mathematics
    -- بقیه ی دانشجویان به صورت اتوماتیک به آنها درس داده میشود
    exec Education.autoTakeSection @currentDate;
end
go

-- نمره دهی :
begin
    --نمره های ترم 3
    exec Education.updateStudentGrade 1, 44, 17.25;
    exec Education.updateStudentGrade 1, 43, 8.5;
    exec Education.updateStudentGrade 1, 50, 11;

    -- نمره دادن به بقیه ی دانشحویان به صورت اتوماتیک
    exec Education.autoFillGrade2;
end
go


begin
	-- درس های پیشنهادی ترم 4
	declare @currentDate DateTime = '2023-06-15';
	select * from Education.SuggestCoursesForStudent(1, @currentDate)
end
go

begin
    declare @currentDate DateTime = '2023-06-15';
    -- درس های ترم 4
    -- دیجیتال رو افتاده بودیم برمیداریم با ساختمان داده
    -- با دیتابیس و شبکه
    exec Education.takeSection 1, 62, @currentDate;-- Data Structures
    exec Education.takeSection 1, 56, @currentDate;-- Database Systems 
    exec Education.takeSection 1, 55, @currentDate; -- Computer Networks 
    exec Education.takeSection 1, 72, @currentDate; -- Digital systems design
    -- بقیه ی دانشجویان به صورت اتوماتیک به آنها درس داده میشود
    exec Education.autoTakeSection @currentDate;
end
go

-- نمره دهی :
begin
    -- نمره های ترم 4
    exec Education.updateStudentGrade 1, 62, 17;
    exec Education.updateStudentGrade 1, 56, 16.75;
    exec Education.updateStudentGrade 1, 55, 18;
    exec Education.updateStudentGrade 1, 72, 18.5;

    -- نمره دادن به بقیه ی دانشحویان به صورت اتوماتیک
    exec Education.autoFillGrade2;
end
go


begin
	-- درس های پیشنهادی برای ترم 5
	declare @currentDate DateTime = '2024-01-01';
	select * from Education.SuggestCoursesForStudent(1, @currentDate);
	-- دیگه از این به بعد بچه خوبی شده و همه درس هارو پاس میکنه 
end
go

begin
    declare @currentDate DateTime = '2024-01-01';
    -- درس های ترم 5
    exec Education.takeSection 1, 89, @currentDate; -- Computer Architecture
    exec Education.takeSection 1, 90, @currentDate;-- Algorithms
    exec Education.takeSection 1, 84, @currentDate;-- Signals and Systems
    -- بقیه ی دانشجویان به صورت اتوماتیک به آنها درس داده میشود
    exec Education.autoTakeSection @currentDate;
end
go


-- نمره دهی :
begin
    -- نمره ها درس های ترم 5
    exec Education.updateStudentGrade 1, 89,17;
    exec Education.updateStudentGrade 1, 90,19;
    exec Education.updateStudentGrade 1, 84,16.5;

    -- نمره دادن به بقیه ی دانشحویان به صورت اتوماتیک
    exec Education.autoFillGrade2;
end
go

begin
	-- درس های پیشنهادی برای ترم 6
	declare @currentDate DateTime = '2024-06-15';
	select * from Education.SuggestCoursesForStudent(1, @currentDate)
end
go
-- الان چند تابع کاربردی رو چک مکنیم:
-- یکی از تابع های کاربردی چک کردن پاس شدن پیش نیازی هست 
-- همه پیش نیاز های ریزپردازنده رو پاس کرده
select Education.has_passed_prereqs(1, 21)  as has_passed;
-- پیش نیاز های کامپایلر رو پاس نکرده
select Education.has_passed_prereqs(1, 20)  as has_passed;

begin
	-- تست تابع محاسبه ترم	
	declare @currentDate DateTime = '2024-06-15';
	select Education.get_currnet_term_stuID(1, @currentDate)
end
go

begin
    declare @currentDate DateTime = '2024-06-15';
    -- درس های ترم 6
    exec Education.takeSection 1, 111, @currentDate;-- Operating Systems
    exec Education.takeSection 1, 112, @currentDate;-- Artificial Intelligence
    exec Education.takeSection 1, 105, @currentDate;-- Microprocessor
    exec Education.takeSection 1, 106, @currentDate;-- Software Engineering
    -- بقیه ی دانشجویان به صورت اتوماتیک به آنها درس داده میشود
    exec Education.autoTakeSection @currentDate;
end
go

-- تست تابع برنامه هفتگی دانشجو برای آیدی 1
select * from Education.Weeklyschedule(1)

-- نمره دهی :
begin
    -- نمره های درس برای آیدی 1
    exec Education.updateStudentGrade 1, 111, 17.5;
    exec Education.updateStudentGrade 1, 112, 18.5;
    exec Education.updateStudentGrade 1, 105, 14.25;
    exec Education.updateStudentGrade 1, 106, 15;
    -- نمره دادن به بقیه ی دانشحویان به صورت اتوماتیک
    exec Education.autoFillGrade2;
end
go

begin
	-- درس های پیشنهادی برای ترم 7 برای آیدی 1
	declare @currentDate DateTime = '2025-01-01';
	select * from Education.SuggestCoursesForStudent(1, @currentDate);
end
go

begin
    declare @currentDate DateTime = '2025-01-01';
    -- درس های ترم 7
    -- کامپایلر فقط ترم های زوج ارائه میشود
    exec Education.takeSection 1, 123, @currentDate;-- Computer Networks II
    exec Education.takeSection 1, 124, @currentDate;-- Database Laboratory
    exec Education.takeSection 1, 125, @currentDate; -- Database Systems II
    -- بقیه ی دانشجویان به صورت اتوماتیک به آنها درس داده میشود
    exec Education.autoTakeSection @currentDate;
end
go


-- نمره دهی :
begin
    -- نمره های درس 
    -- نمره های ترم 7
    exec Education.updateStudentGrade 1, 123, 12.5;
    exec Education.updateStudentGrade 1, 124, 19;
    exec Education.updateStudentGrade 1, 125, 13.5;
    -- نمره دادن به بقیه ی دانشحویان به صورت اتوماتیک
    exec Education.autoFillGrade2;
end
go

begin
	-- درس های پیشنهادی برای ترم 8
	declare @currentDate DateTime = '2025-06-15';
	select * from Education.SuggestCoursesForStudent(1, @currentDate);
end
go

begin
    declare @currentDate DateTime = '2025-06-15';
    -- درس های ترم 8
    exec Education.takeSection 1, 147, @currentDate; -- IT Project Management and Control
    exec Education.takeSection 1, 146, @currentDate;-- Network Security
    exec Education.takeSection 1, 145, @currentDate; -- Fundamentals of Data Mining
    exec Education.takeSection 1, 142, @currentDate;-- Compiler Design
    -- بقیه ی دانشجویان به صورت اتوماتیک به آنها درس داده میشود
    exec Education.autoTakeSection @currentDate;    
end
go


select * from Education.Weeklyschedule(1)


-- نمره دهی :
begin
    -- نمره های ترم 8
    exec Education.updateStudentGrade 1, 147,15.75;
    exec Education.updateStudentGrade 1, 146,18;
    exec Education.updateStudentGrade 1, 145,17;
    exec Education.updateStudentGrade 1, 142,16.25;
    -- نمره دادن به بقیه ی دانشحویان به صورت اتوماتیک
    exec Education.autoFillGrade2;
end
go

select Education.total_passedcredit(1);
go

begin
	-- درس های پیشنهادی برای ترم بعدی که خالی است چون همه درس ها را پاس کرده و فارغ التحصیل شد
	declare @currentDate DateTime = '2026-01-01';
	select * from Education.SuggestCoursesForStudent(1, @currentDate)
end
go
-- تابعی چه چک میکنه چه درس هایی پاس شده توسط دانشجو
-- use 'all' or 'passed' or 'rejecred' or 'ongoing'
select * from Education.hasPassed(1, 'all');
select * from Education.hasPassed(1, 'passed');
select * from Education.hasPassed(1, 'rejected');
select * from Education.hasPassed(1, 'ongoing');
-- تابع جست و جو در لاگ بر اساس نوع ان
-- use 'system', 'student','instructor'
select * from Education.Log_search('system');
select * from Education.Log_search('student');
select * from Education.Log_search('instructor');
 -- تابع مجموع واحد های پاس شده توسط دانشجو
select Education.total_passedcredit(1)
-- تابعی که شروع ترم هارو مشخص میکنه و تو توابع و پراسیجر های دیگه کاربرد دارد
select Education.getSemesterStartDate(1, 2025) as SemesterStartDate;
-- محاسبه معدل ترم 8
select Education.TermGPA(1, 8) as TermGPA;
-- تابع محاسبه معدل کل دانشجو
select Education.totalGPA(1);
-- برنامه ترم داشنجو
select * from Education.TermTranscript(1, 8);

-- select c.courseID, c.title, s.secID, c.term  from Education.SuggestCoursesForStudent(26, getdate()) c join Education.Section s on c.courseID = s.courseID;

--get_current_term
-- تابعی برای گرفتن ترم این دانشجو بر اساس سال ورود ان دانشجو
-- با توجه به ووردی دانشجو با ایدی 2 که ترم 5 هست
select  Education.get_currnet_term_stuID(2,'2025-01-01');

go

-------------------------------Library Sample Data----------------------------

-- Add Publishers
EXEC Library.addPublisher @name = 'Tehran University Press';
EXEC Library.addPublisher @name = 'Fatemi Publishing';
EXEC Library.addPublisher @name = 'Mobtakeran Publications';
EXEC Library.addPublisher @name = 'Gaj Publications';
EXEC Library.addPublisher @name = 'IUT Press';
GO

-- Add Categories
EXEC Library.addCategory @name = 'Novel';
EXEC Library.addCategory @name = 'Historical';   
EXEC Library.addCategory @name = 'Science Fiction';  
EXEC Library.addCategory @name = 'Psychology';
EXEC Library.addCategory @name = 'Computer Science'; 
GO

-- Add Books
EXEC Library.addBooks @title = 'Blindness', @author = 'José Saramago', @categoryID = 1;
EXEC Library.addBooks @title = 'Tarikh-e Beyhaqi', @author = 'Abu''l-Fadl Bayhaqi', @categoryID = 2;
EXEC Library.addBooks @title = 'Dune', @author = 'Frank Herbert', @categoryID = 3;
EXEC Library.addBooks @title = 'Man''s Search for Meaning', @author = 'Viktor Frankl', @categoryID = 4;
EXEC Library.addBooks @title = 'Clean Code', @author = 'Robert C. Martin', @categoryID = 5;
EXEC Library.addBooks @title = 'One Hundred Years of Solitude', @author = 'Gabriel García Márquez', @categoryID = 1;
EXEC Library.addBooks @title = 'The Crusades Through Arab Eyes', @author = 'Amin Maalouf', @categoryID = 2;
EXEC Library.addBooks @title = 'Foundation', @author = 'Isaac Asimov', @categoryID = 3;
EXEC Library.addBooks @title = 'The Power of Habit', @author = 'Charles Duhigg', @categoryID = 4;
EXEC Library.addBooks @title = 'Introduction to Algorithms', @author = 'Thomas H. Cormen', @categoryID = 5;
GO

-- Add Book Editions
EXEC Library.addNewBooksAvailable @bookID = 1, @publisherID = 1, @editionNumber = 1, @numCopies = 10, @aisle = 'A', @shelfNumber = '1';
EXEC Library.addNewBooksAvailable @bookID = 2, @publisherID = 2, @editionNumber = 1, @numCopies = 8, @aisle = 'B', @shelfNumber = '2';
EXEC Library.addNewBooksAvailable @bookID = 3, @publisherID = 3, @editionNumber = 1, @numCopies = 12, @aisle = 'C', @shelfNumber = '3';
EXEC Library.addNewBooksAvailable @bookID = 4, @publisherID = 4, @editionNumber = 1, @numCopies = 15, @aisle = 'D', @shelfNumber = '4';
EXEC Library.addNewBooksAvailable @bookID = 5, @publisherID = 5, @editionNumber = 1, @numCopies = 20, @aisle = 'E', @shelfNumber = '5';
EXEC Library.addNewBooksAvailable @bookID = 6, @publisherID = 1, @editionNumber = 1, @numCopies = 7, @aisle = 'A', @shelfNumber = '1';
EXEC Library.addNewBooksAvailable @bookID = 7, @publisherID = 2, @editionNumber = 1, @numCopies = 5, @aisle = 'B', @shelfNumber = '2';
EXEC Library.addNewBooksAvailable @bookID = 8, @publisherID =3, @editionNumber = 1, @numCopies = 10, @aisle = 'C', @shelfNumber = '3';
EXEC Library.addNewBooksAvailable @bookID = 9, @publisherID =4, @editionNumber = 1, @numCopies = 11, @aisle = 'D', @shelfNumber = '4';
EXEC Library.addNewBooksAvailable @bookID = 10, @publisherID = 5, @editionNumber = 1, @numCopies = 18, @aisle = 'E', @shelfNumber = '5';
GO

-- Borrow Books
-- Note: The accountID is generated based on the formula: year(entryDate)*1000000 + majorID*10000 + personID
-- Student with ID 1: entryDate='2022-01-01', majorID=3 -> AccountID = 2022000000 + 30000 + 1 = 2022030001
-- Student with ID 2: entryDate='2023-01-01', majorID=3 -> AccountID = 2023000000 + 30000 + 2 = 2023030002
-- Librarian ID is assumed to be one of the instructors, e.g., 31

--چون دانشجوی با آیدی 1 فارغ شده، نمیتونه کتاب امانت بگیره 
EXEC Library.borrowBook @editionID = 3, @accountID = 2022030001, @librarianID = 41; --

EXEC Library.borrowBook @editionID = 3, @accountID = 2023030011, @librarianID = 41;
EXEC Library.borrowBook @editionID = 4, @accountID = 2023030002, @librarianID = 41;
EXEC Library.borrowBook @editionID = 5, @accountID = 2023030003, @librarianID = 42;
EXEC Library.borrowBook @editionID = 6, @accountID = 2023030004, @librarianID = 42;
EXEC Library.borrowBook @editionID = 7, @accountID = 2023030005, @librarianID = 41;
EXEC Library.borrowBook @editionID = 8, @accountID = 2023030006, @librarianID = 41;
EXEC Library.borrowBook @editionID = 9, @accountID = 2023030007, @librarianID = 42;
EXEC Library.borrowBook @editionID = 10, @accountID = 2023030008, @librarianID = 42;
EXEC Library.borrowBook @editionID = 1, @accountID = 2023030009, @librarianID = 41;
EXEC Library.borrowBook @editionID = 2, @accountID = 2023030010, @librarianID = 42;
GO

-- Return Books
EXEC Library.returnBook @editionID = 3, @accountID = 2023030011;
EXEC Library.returnBook @editionID = 5, @accountID = 2023030003;
EXEC Library.returnBook @editionID = 7, @accountID = 2023030005;
EXEC Library.returnBook @editionID = 9, @accountID = 2023030007;
EXEC Library.returnBook @editionID = 1, @accountID = 2023030009;
GO

-- Set Fines (for late returns - this is usually handled by a trigger, but we can add some manually for testing)
-- Let's assume student with account 2023030002 returned a book late
EXEC Library.setNewFine @accountID = 2023030002, @amount = 5000;
EXEC Library.setNewFine @accountID = 2023030006, @amount = 2500;
GO
EXEC Library.setNewFine @accountID = 2023030006, @amount = 4000;
select Library.getTotalFineByStuID(6);
-- Pay Fines
EXEC Library.payFinesByFineIdAndAccID @accountID = 2023030002, @fineID = 1; -- Assuming the fineID is 1
EXEC Library.payAllFinesByAccID @accountID = 2023030006;
GO

-- Extend Due Date
EXEC Library.extendDueDate @editionID = 4, @accountID = 2023030002, @days = 7;
EXEC Library.extendDueDate @editionID = 6, @accountID = 2023030004, @days = 5;
GO


----- test SuggestBooksForStudent -----
EXEC Library.borrowBook @editionID = 4, @accountID = 2023030011, @librarianID = 41;
EXEC Library.borrowBook @editionID = 3, @accountID = 2023030002, @librarianID = 41;
EXEC Library.borrowBook @editionID = 4, @accountID = 2023030003, @librarianID = 42;

EXEC Library.borrowBook @editionID = 6, @accountID = 2023030002, @librarianID = 41;
EXEC Library.borrowBook @editionID = 7, @accountID = 2023030003, @librarianID = 42;
EXEC Library.returnBook @editionID = 3, @accountID = 2023030002; -- if you comment this line, the next borrow will fail because 2023030002 cannot take more than 3 books
EXEC Library.borrowBook @editionID = 7, @accountID = 2023030002, @librarianID = 42;
EXEC Library.borrowBook @editionID = 3, @accountID = 2023030003, @librarianID = 42;

select * from Library.GetRecommendedBooks(11);