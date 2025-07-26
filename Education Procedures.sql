create procedure Education.AssignAdvisor
	@stuID INT, @advisorID INT
as begin
    if not exists(select 1 from Education.Person where ID = @stuID and isActive = 1 and role = 'student')
    begin
        print('student not found or is not active');
        return;
    end;
	update Education.Student
	set advisorID = @advisorID
	where studentID = @stuID;
end;
GO

create procedure Education.updateStudentGrade
	@stuID INT, @sectionID INT, @newGrade INT
as begin
    if not exists(select 1 from Education.Person where ID = @stuID and isActive = 1 and role = 'student')
    begin
        print('student not found or is not active');
        return;
    end;
	update Education.Takes
	set grade = @newGrade,
	status = case
		when @newGrade >= 10 then 'passed'
		when @newGrade <10 then 'rejected'
		else 'ongoing'
	end
	where studentID = @stuID and sectionID = @sectionID;
end;
GO


create procedure Education.addBuilding
    @name varchar(50)
as begin
    insert into Education.Building(name)
    values (@name);
end;
GO

create procedure Education.addDepartment
    @name varchar(50), @buildingID INT
as begin
    insert into Education.Department(name, buildingID)
    values (@name, @buildingID);
end;
GO

create procedure Education.addMajor
    @name varchar(50), @departmentID INT
as begin
    insert into Education.Major(name, departmentID)
    values (@name, @departmentID);
end;
GO

create procedure Education.addCourse
    @courseMajorID INT, @title varchar(50), @credit INT
as begin
    insert into Education.Course(courseMajorID, title, credit)
    values (@courseMajorID, @title, @credit);
end;
GO

create procedure Education.addSection
    @courseID INT, @semester INT, @year INT, @classroomID INT, @instructorID INT, @timeSlotID INT
as begin
    insert into Education.Section(courseID, semester, year, classroomID, instructorID, timeSlotID)
    values(@courseID, @semester, @year, @classroomID, @instructorID, @timeSlotID);
end;
GO

create procedure Education.addClassroom
    @capacity INT, @buildingID INT, @roomNum INT
as begin
    insert into Education.Classroom(buildingID, roomNumber, capacity)
    values(@buildingID, @roomNum, @capacity);
end;
GO

create procedure Education.addPerson
    @firstName varchar(50), @lastName varchar(50), @nationalCode varchar(50), @entryDate datetime, @majorID INT,
    @role varchar(20)
as begin
    if @role in ('student', 'instructor', 'librarian')
    begin
        insert into Education.Person(firstName, lastName, nationalCode, majorID, role, entryDate)
        values (@firstName, @lastName, @nationalCode, @majorID, @role, @entryDate);
    end;
end;
GO

create procedure Education.deactivatePerson
    @ID INT
as begin
    update p
    set p.isActive = 0
    from Education.Person p where p.ID = @ID;
end;
GO

create procedure Education.takeSection
	@studentID INT, @sectionID INT, @currDate DATETIME
as begin
	if not exists(select 1 from Education.Person where ID = @studentID and isActive = 1 and role = 'student')
	begin
		print('student not found or is not active');
		return;
	end;
	if not exists(SELECT 1 FROM Education.Student WHERE studentID = @studentID)
	begin
		print('invalid studentID');
		return;
	end;

	if not exists(SELECT 1 FROM Education.Section WHERE secID = @sectionID)
	begin
		print('this class is not exists');
		return;
	end;

	if Education.isSectionInCurrentTerm(@sectionID, @currDate) = 0
	begin
		print('This section is not in the current term.');
		return;
	end;

	declare @capacity INT = (select capacity from Education.Section join Education.Classroom C on Section.classroomID = C.classroomID where secID = @sectionID);
	declare @currCount INT = (
		select count(*) from Education.takes where sectionID = @sectionID
	);

	if @currCount >= @capacity
	begin
		print('this section is full');
		return;
	end

	declare @courseID INT;
	select @courseID = courseID from Education.Section where secID = @sectionID;

	if exists (select 1 from Education.takes
						where studentID = @studentID and @courseID = courseID and status = 'passed')
	begin
		print('student passed this Course before.');
		return;
	end;

	if Education.has_passed_prereqs(@studentID, @courseID) = 0
	begin
		print('student dont passed its prereq before.');
		return;
	end;

	if Education.CheckTimeConflict(@studentID, @sectionID) = 1
	begin
		print('Time conflict detected.');
		return;
	end;

	INSERT INTO Education.Takes(studentID, courseID, sectionID, grade, status)
	VALUES (@studentID, @courseID, @sectionID, NULL, 'ongoing');
	print ('successfully registered.');
END;
go


create procedure Education.addTimeSlot
    @startTime TIME, @endTime TIME, @daysOfWeek VARCHAR(20)
as begin
    if exists (select 1 from Education.TimeSlot where startTime = @startTime AND endTime = @endTime AND daysOfWeek = @daysOfWeek)
    begin
        print('a time slot with these details already exists.');
        return;
    end

    if @endTime <= @startTime
    begin
        print('end time must be after start time.');
        return;
    end

    insert into Education.TimeSlot(startTime, endTime, daysOfWeek)
    values(@startTime, @endTime, @daysOfWeek);

    print('Time slot added successfully.');
end;
GO


create procedure Education.AssignInstructorspecialist
@instructorid INT, @specialist varchar(100)
as begin
    update Education.Instructor
    set  specialist = @specialist
    where instructorID = @instructorid
end;
go

create procedure Education.addPrereq
    @courseID INT, @prereqID INT
as begin
    insert into Education.Prereq(courseID, prereqID)
    values (@courseID, @prereqID);
end;
go

create procedure Education.addMajorChart
    @chartID INT, @majorID INT
as begin
    insert into Education.MajorChart(chartID, majorID)
    values (@chartID, @majorID);
end;
go

create procedure Education.addSuggestTerm
    @chartID INT, @courseID INT, @term INT
as begin
    insert into Education.SuggestTerm(chartID, courseID, term)
    values (@chartID, @courseID, @term);
end;
go

create procedure Education.dropSection
    @studentID INT, @sectionID INT
as begin
    if not exists(select 1 from Education.Person where ID = @studentID and isActive = 1 and role = 'student')
    begin
        print('student not found or is not active');
        return;
    end;
    if not exists(select 1 from Education.Takes where studentID = @studentID and sectionID = @sectionID)
    begin
        print('student has not taken this section');
        return;
    end;

    delete from Education.Takes
    where studentID = @studentID and sectionID = @sectionID;
end;
go