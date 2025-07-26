create function Education.createLibraryID(@entryDate datetime, @majorID INT, @personID INT)
returns INT
as begin
    return year(@entryDate)*1000000 + @majorID*10000 + @personID
end;
GO

create function Education.has_passed_prereqs (@studentID INT, @courseID INT)
returns BIT
as begin
    if not exists(select 1 from Education.Person where ID = @studentID and isActive = 1 and role = 'student')
        return 0;

    declare @passed BIT = 1;

    if exists (
        select 1
        from Education.Prereq P
        where P.courseID = @courseID
        and not exists (
            select 1
            from Education.Takes T
            where T.studentID = @studentID
              and T.courseID = P.prereqID
              and T.status = 'passed'
        )
    )
    begin
        set @passed = 0;
    end

    return @passed;
end;
GO

create function Education.get_current_term(@entryDate datetime)
returns INT
as begin
    declare @currMonth INT = MONTH(GETDATE());
    declare @currYear INT = YEAR(GETDATE());
    declare @entryMonth INT = MONTH(@entryDate);
    declare @entryYear INT = YEAR(@entryDate);

    declare @yearDiff INT = @currYear - @entryYear;
    declare @term INT;

    set @term = @yearDiff * 2;

    if @currMonth between 1 and 5
        set @term = @term + 1;
    else
        set @term = @term + 2;

    if @entryMonth between 1 and 5
        set @term = @term - 1;
    else
        set @term = @term - 2;

    return @term + 1;
end;
GO

create function Education.get_term(@entryDate datetime, @specificDate datetime)
returns INT
as begin
    declare @currMonth INT = MONTH(@specificDate);
    declare @currYear INT = YEAR(@specificDate);
    declare @entryMonth INT = MONTH(@entryDate);
    declare @entryYear INT = YEAR(@entryDate);

    declare @yearDiff INT = @currYear - @entryYear;
    declare @term INT;

    set @term = @yearDiff * 2;

    if @currMonth between 1 and 5
        set @term = @term + 1;
    else
        set @term = @term + 2;

    if @entryMonth between 1 and 5
        set @term = @term - 1;
    else
        set @term = @term - 2;

    return @term + 1;
end;
GO

create function Education.SuggestCoursesForStudent(@studentID INT, @date DATETIME)
returns table
as return (
    select DISTINCT C.courseID, C.title, ST.term
    from Education.Student S
    join Education.Person P on P.ID = S.studentID
    join Education.MajorChart MC on MC.majorID = P.majorID
    join Education.SuggestTerm ST on ST.chartID = MC.chartID
    join Education.Course C on C.courseID = ST.courseID
    where
        P.ID = @studentID and P.isActive = 1 and
        ST.term <= Education.get_term((select entryDate from Education.Person where ID = @studentID), @date) 
        and not exists(
            select 1
            from Education.Takes T
            where T.studentID = @studentID
              and T.courseID = ST.courseID
              and T.status = 'passed'
        )
        and Education.has_passed_prereqs(@studentID, ST.courseID) = 1
);
GO

create function Education.validateNationalCode(@NationalID varchar(20))
returns BIT
as begin
    declare @National_ID_Validation_Result BIT = 1;

    if LEN(@NationalID) != 10
    begin
        set @National_ID_Validation_Result = 0;
        return @National_ID_Validation_Result;
    end;
    if ISNUMERIC(@NationalID+'.0e0')=0
        begin
            set @National_ID_Validation_Result = 0
            return @National_ID_Validation_Result;
        end;
    if SUBSTRING(@NationalID, 1, 1)=0 and  SUBSTRING(@NationalID, 2, 1)=0 and SUBSTRING(@NationalID, 3, 1)=0
        begin
                set @National_ID_Validation_Result = 0
                return @National_ID_Validation_Result;
        end;
    if (@NationalID='0000000000' or @NationalID='1111111111' or @NationalID='2222222222' or @NationalID='3333333333'
            or @NationalID='4444444444'   or @NationalID='5555555555'  or @NationalID='6666666666'  or @NationalID='7777777777'
            or @NationalID='8888888888' or @NationalID='9999999999' )
        begin
            set @National_ID_Validation_Result = 0
            return @National_ID_Validation_Result;
        end;
    begin
    declare @b AS INT;
    set @b=((10*SUBSTRING(@NationalID, 1, 1) + 9*SUBSTRING(@NationalID, 2, 1) + 8*SUBSTRING(@NationalID, 3, 1)+7*SUBSTRING(@NationalID, 4, 1)+6*SUBSTRING(@NationalID, 5, 1)+
                5*SUBSTRING(@NationalID, 6, 1) + 4*SUBSTRING(@NationalID, 7, 1) + 3*SUBSTRING(@NationalID, 8, 1) + 2*SUBSTRING(@NationalID,9, 1))%11)
    declare @ControlBit AS TINYINT=SUBSTRING(@NationalID,10,1)
    if @b<2
        begin
            if @ControlBit!=@b set @National_ID_Validation_Result = 0;
        end;
    if @b>=2
        begin
            if @ControlBit!=11-@b set @National_ID_Validation_Result = 0;
        end;
    end;
    return @National_ID_Validation_Result;
end;
GO
 
create function Education.get_currnet_term_stuID (@stuID INT,@currentDate datetime)
returns INT
as begin
    if not exists(select 1 from Education.Person where ID = @stuID and isActive = 1 and role = 'student')
        return NULL;
    declare @num_term_student INT;
    select  @num_term_student  = Education.get_term( (select entryDate from Education.Person where id = @stuID), @currentDate)
    return @num_term_student
end;
go

create function Education.getSemesterStartDate(@semester INT, @year INT)
returns DATETIME
as begin
    DECLARE @startDate DATETIME;
    if @semester = 1
        set @startDate = CAST(CAST(@year AS varchar(4)) + '-01-01' AS DATETIME);
    else if @semester = 2
        set @startDate = CAST(CAST(@year AS varchar(4)) + '-06-15' AS DATETIME);
    else
        set @startDate = NULL;
    return @startDate;
end;
go

create function Education.TermGPA(@stuID INT,@term_number INT)
returns DECIMAL(5,2)
as begin
    declare @total_credit INT;
    declare @total_score DECIMAL(10,2);

    select
        @total_credit = sum(c.credit),
        @total_score = sum(c.credit*t.grade*1.0)
    from Education.Takes as T
    join Education.Course as c on c.courseID = T.courseID
    join Education.Section as S on S.courseID = T.courseID and S.secID = T.sectionID
    join Education.Person as P on P.ID = T.studentID
    where Education.get_term(P.entryDate, Education.getSemesterStartDate(s.semester, s.year)) = @term_number 
        and t.studentID = @stuID and t.status not in ('ongoing');

    if @total_score is null or @total_credit is null or @total_credit = 0
        return null;

    return @total_score/@total_credit;
end;
go

create function Education.Weeklyschedule(@stuID INT)
returns table
as return(
    select C.courseID, C.title, C.credit, P.firstName+' '+P.lastName as InstructorName,
            TS.daysOfWeek, TS.startTime, TS.endTime,
            B.name +' ' + CAST(CR.roomNumber as varchar) as ClassRoom
    from Education.Takes as T
    join Education.Course as c on c.courseID = T.courseID
    join Education.Section as S on S.courseID = T.courseID and S.secID = T.sectionID
    join Education.TimeSlot  as TS on  TS.timeSlotID = S.timeSlotID
    join Education.Instructor as I on I.instructorID = S.instructorID
    join Education.Person as P on P.ID = I.instructorID
    join Education.Classroom as CR on CR.classroomID = S.classroomID
    join Education.Building as B on B.buildingID = CR.buildingID
    join Education.Person as P2 on P2.ID = T.studentID
    where T.studentID = @stuID and T.status = 'ongoing' and P2.isActive = 1
);
go

create function Education.totalGPA (@stuID INT)
returns DECIMAL(5,2)
as begin
    declare @total_credit INt;
    declare @total_score DECIMAL(10,2);

    select @total_credit = sum(c.credit), @total_score = sum (c.credit * t.grade* 1.0)
    from Education.Takes as T join
    Education.SuggestTerm as ST on st.courseID = t.courseID 
    join Education.Course as C on c.courseID = T.courseID
    where t.studentID = @stuID and t.status not in ('ongoing');

    if @total_score IS NULL OR @total_credit IS NULL OR @total_credit = 0
        RETURN NULL;
    return @total_score/@total_credit
end;
go


create function Education.TermTranscript(@stuID INT,@term_number INT)
returns table
as return(
    select C.courseID,C.title,C.credit,T.grade,
            TS.daysOfWeek,TS.startTime,TS.endTime
    from Education.Takes as T
    join Education.Course as c on c.courseID = T.courseID
    join Education.Section as S on S.courseID = T.courseID and S.secID = T.sectionID
    join Education.TimeSlot  as TS on  TS.timeSlotID = S.timeSlotID
    join Education.Person as P on P.ID = T.studentID
    where T.studentID = @stuID and T.status in ('passed','rejected')
  and Education.get_term(P.entryDate, Education.getSemesterStartDate(S.semester, S.year)) = @term_number
);
go

create function Education.hasPassed(@stuID INT, @status_ varchar(100))
returns @Result TABLE (
    studentID INT,
    courseID INT,
    sectionID INT,
    grade DECIMAL(5,2),
    status varchar(50)
)
as begin
    if @status_ not in ('all', 'ongoing', 'passed', 'rejected')
        return;

    if @status_ = 'ongoing'
    begin
        insert into @Result
        select * from Education.Takes
        where studentID = @stuID and status = 'ongoing';
    end
    else if @status_ = 'passed'
    begin
        insert into @Result
        select * from Education.Takes
        where studentID = @stuID and status = 'passed';
    end
    else if @status_ = 'rejected'
    begin
        insert into @Result
        select * from Education.Takes
        where studentID = @stuID and status = 'rejected';
    end
    else
    begin
        insert into @Result
        select * from Education.Takes
        where studentID = @stuID;
    end

    return;
end;
go

create function Education.Log_search(@usertype_ varchar(100))
returns table
as return(
    select l.userId, l.action ,l.logTime from
    Education.Log as l
    where l.userType = @usertype_);
go

create function Education.total_passedcredit(@stuID INT)
returns INT
as begin
    declare @total_credit INT;
    select @total_credit = sum(c.credit)
    from Education.Takes as T
    join  Education.Course as C on T.courseID = C.courseID
    where t.studentID = @stuID and t.status = 'passed';
    return ISNULL(@total_credit, 0);
end;
go

create function Education.CheckTimeConflict(@studentID INT, @sectionID INT)
returns BIT
as begin
    if not exists(select 1 from Education.Person where ID = @studentID and isActive = 1 and role = 'student')
        return 0;
    DECLARE @conflict BIT = 0;
    DECLARE @newStart TIME, @newEnd TIME, @newDays Nvarchar(50);

    select @newStart = ts.startTime, @newEnd = ts.endTime, @newDays = ts.daysOfWeek
    from Education.Section s join Education.TimeSlot ts on s.timeSlotID = ts.timeSlotID
    WHERE s.secID = @sectionID;

    if exists (
        select 1
        from Education.Takes t
        join Education.Section s on t.sectionID = s.secID
        join Education.TimeSlot ts on s.timeSlotID = ts.timeSlotID
        where t.studentID = @studentID and t.status = 'ongoing' 
          and (ts.daysOfWeek like '%' + @newDays + '%' OR @newDays like '%' + ts.daysOfWeek + '%') and @newStart < ts.endTime and @newEnd > ts.startTime
    )
    begin
        set @conflict = 1;
    end;

    return @conflict;
end;
GO

create function Education.isSectionInCurrentTerm(@sectionID INT, @currentDate DATETIME)
returns BIT
as
begin
    declare @sectionYear INT, @sectionSemester INT;
    declare @currentYear INT, @currentSemester INT;

    select @sectionYear = year, @sectionSemester = semester
    from Education.Section
    where secID = @sectionID;

    set @currentYear = YEAR(@currentDate);
    
    if @currentDate < Education.getSemesterStartDate(2, @currentYear)
        set @currentSemester = 1;
    else
        set @currentSemester = 2;

    if @sectionYear = @currentYear and @sectionSemester = @currentSemester
        return 1;

    return 0;
end;
GO
