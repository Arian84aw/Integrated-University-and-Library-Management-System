-------------------------------
create schema Education;
GO

create table Education.Building(
    buildingID INT IDENTITY PRIMARY KEY,
    name varchar(50) unique
);
GO

create table Education.Department(
    departmentID INT IDENTITY PRIMARY KEY,
    name varchar(50) unique,
    buildingID INT not null,
    FOREIGN KEY (buildingID) REFERENCES Education.Building(buildingID)
)
GO

create table Education.Major(
    majorID INT IDENTITY PRIMARY KEY,
    name varchar(50) unique,
    departmentID INT not null,
    FOREIGN KEY (departmentID) REFERENCES Education.Department(departmentID)
);
GO

CREATE TABLE Education.TimeSlot (
    timeSlotID INT IDENTITY PRIMARY KEY,
    startTime TIME NOT NULL,
    endTime TIME NOT NULL,
    daysOfWeek VARCHAR(20) NOT NULL
);
GO

create table Education.Course(
    courseID INT IDENTITY PRIMARY KEY,
    courseMajorID INT,
    title varchar(50),
    credit INT,
    FOREIGN KEY (courseMajorID) REFERENCES Education.Major(majorID)
);
GO

create table Education.Classroom(
    classroomID INT IDENTITY PRIMARY KEY,
    buildingID INT,
    roomNumber INT,
    capacity INT not null,
    unique (buildingID, roomNumber),
    FOREIGN KEY (buildingID) REFERENCES Education.Building(buildingID)
);
GO

create table Education.Person(
    ID INT IDENTITY PRIMARY KEY,
    firstName varchar(50) not null,
    lastName varchar(50) not null,
    nationalCode varchar(20) not null unique,
    entryDate DATETIME DEFAULT GETDATE(),
    majorID INT not null,
    LibraryAccountID INT,
    isActive BIT default 1,
    role varchar(20) check(role IN ('student', 'instructor', 'librarian')),
    FOREIGN KEY (majorID) REFERENCES Education.Major(majorID)
);
GO

create table Education.Instructor(
    instructorID INT PRIMARY KEY,
    specialist varchar(100),
    FOREIGN KEY (instructorID) REFERENCES Education.Person(ID),
);
GO

create table Education.Student(
    studentID INT PRIMARY KEY,
    advisorID INT,
    FOREIGN KEY (studentID) REFERENCES Education.Person(ID),
    FOREIGN KEY (advisorID) REFERENCES Education.Instructor(instructorID)
);
GO


create table Education.Section(
    secID INT IDENTITY,
    courseID INT,
    semester INT,
    year INT,
    classroomID INT not null,
    instructorID INT not null,
    timeSlotID INT,
    PRIMARY KEY (secID, courseID, semester, year),
    FOREIGN KEY (instructorID) REFERENCES Education.Instructor(instructorID),
    FOREIGN KEY (classroomID) REFERENCES Education.Classroom(classroomID),
    FOREIGN KEY (courseID) REFERENCES Education.Course(courseID),
    FOREIGN KEY (timeSlotID) REFERENCES Education.TimeSlot(timeSlotID)
);
GO

create table Education.Takes(
    studentID INT,
    courseID INT,
    sectionID INT not null,
    grade DECIMAL(5,2) check ((grade>=0 and grade<=20) or grade is null),
    status varchar(10) check(status in ('ongoing', 'passed', 'rejected')),
    PRIMARY KEY (studentID, courseID, sectionID),
    FOREIGN KEY (studentID) REFERENCES Education.Student(studentID),
    FOREIGN KEY (courseID) REFERENCES Education.Course(courseID),
);
GO

create table Education.MajorChart(
    chartID INT PRIMARY KEY,
    majorID INT unique not null,
    FOREIGN KEY (majorID) REFERENCES Education.Major(majorID),
);
GO

create table Education.SuggestTerm(
    chartID INT,
    courseID INT,
    PRIMARY KEY (chartID, courseID),
    term INT not null,
    FOREIGN KEY (courseID) REFERENCES Education.Course(courseID),
    FOREIGN KEY (chartID) REFERENCES Education.MajorChart(chartID),
);
GO

create table Education.Prereq(
    courseID INT,
    prereqID INT,
    PRIMARY KEY (courseID,prereqID),
    FOREIGN KEY (courseID) REFeRENCES Education.Course(courseID),
    FOREIGN KEY (prereqID) REFeRENCES Education.Course(courseID)
);
GO

create table Education.Log (
    logId INT IDENTITY PRIMARY KEY,
    userType VARCHAR(20),  -- student, instructor, system
    userId INT,
    action VARCHAR(255),
    logTime DATETIME DEFAULT GETDATE()
);
GO