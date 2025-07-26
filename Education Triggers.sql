create trigger trgLogPerson
ON Education.Person
after update, delete
as begin
    -- update
    insert into Education.Log(userType, userId, action)
    select i.role, i.ID, 'update Person'
    from inserted i
    join deleted d on i.ID = d.ID
    where exists(
        select i.Id, i.role, i.majorID, i.isActive
        except
        select d.Id, d.role, d.majorID, d.isActive
    );

    -- delete
    insert into Education.Log(userType, userId, action)
    select role, ID, 'delete from Person'
    from deleted
    EXCEPT
    select role, ID, 'delete from Person'
    from inserted;
end;
GO

create trigger trgLogCourse
ON Education.Course
after insert, update, delete
as begin
    -- insert
    insert into Education.Log(userType, userId, action)
    select 'system', NULL, concat('insert into Course: ', title)
    from inserted
    EXCEPT
    select 'system', NULL, concat('insert into Course: ', title)
    from deleted;

    -- update
    insert into Education.Log(userType, userId, action)
    select 'system', NULL, concat('update Course ID=', i.courseID, ', title changed to ', i.title)
    from inserted i
    join deleted d on i.courseID = d.courseID
    where exists(
        select i.courseID, i.title, i.credit, i.courseMajorID
        EXCEPT
        select d.courseID, d.title, d.credit, d.courseMajorID
    );

    -- delete
    insert into Education.Log(userType, userId, action)
    select 'system', NULL, concat('delete from Course: ', title)
    from deleted
    EXCEPT
    select 'system', NULL, concat('delete from Course: ', title)
    from inserted;
end;
GO


create trigger trgLogSection
ON Education.Section
after insert, update, delete
as begin
    -- insert
    insert into Education.Log(userType, userId, action)
    select 'system', instructorID, concat('insert into Section: courseID=', courseID, ', year=', year, ', semester=', semester)
    from inserted
    EXCEPT
    select 'system', instructorID, concat('insert into Section: courseID=', courseID, ', year=', year, ', semester=', semester)
    from deleted;

    -- update
    insert into Education.Log(userType, userId, action)
    select 'system', i.instructorID, concat('update Section secID=', i.secID, ', courseID=', i.courseID)
    from inserted i
    join deleted d on i.secID = d.secID and i.courseID = d.courseID
    where EXISTS(select i.* EXCEPT select d.*);

    -- delete
    insert into Education.Log(userType, userId, action)
    select 'system', instructorID, concat('delete from Section: courseID=', courseID, ', year=', year, ', semester=', semester)
    from deleted
    EXCEPT
    select 'system', instructorID, concat('delete from Section: courseID=', courseID, ', year=', year, ', semester=', semester)
    from inserted;
end;
GO


create trigger trgAfterAddPerson
ON Education.Person
after insert
as begin
    if exists(select 1 from inserted where Education.validateNationalCode(nationalCode) = 0)
    begin
        -- if any inserted row has an invalid national code:
        Print('One or more national codes are invalid. The operation has been cancelled.');
        ROLLBACK TRANSACTION;
        return;
    end

    update p
    set LibraryAccountID = Education.createLibraryID(p.entryDate, p.majorID, p.ID)
    from Education.Person p join inserted i on p.ID = i.ID;

    -- insert
    insert into Education.Log(userType, userId, action)
    select role, ID, 'inserted into Person'
    from inserted;
--     except
--     select role, ID, 'inserted into Person'
--     from deleted; --- deleted in(after insert) is always empty.

    insert into Education.Student(studentID)
    select i.ID from inserted i where i.role = 'student';

    insert into Education.Instructor(instructorID)
    select i.ID from inserted i where i.role = 'instructor';

    insert into Library.Account(accountID, personID)
    select Education.createLibraryID(i.entryDate, i.majorID, i.ID), i.ID
    from inserted i
    where i.role IN('student', 'instructor');

    insert into Library.Librarian(librarianID)
    select i.ID
    from inserted i
    where i.role = 'librarian' and i.majorID = 5;
end;
GO

create trigger trgDeactivatePerson
on Education.Person after update
as begin
    update a
    set a.isActive = 0
    from Library.Account a join deleted d on d.ID = a.personID join inserted i on a.personID = i.ID
    where d.isActive = 0 and i.isActive = 1;
end;
GO

create trigger Education.checkGraduation
on Education.Takes after update
as begin
    update p
    set isActive = 0
    from Education.Person p
    where p.role = 'student' and p.isActive = 1
        and exists(select 1 from inserted i where i.studentID = p.ID)
        and (select sum(c.credit) from Education.Takes t
            join Education.Course c on t.courseID = c.courseID
            where t.studentID = p.ID and t.status = 'passed') >= 75
        and not exists(select 1 from Education.Takes t2 where t2.studentID = p.ID and t2.status = 'ongoing');
    
    declare @graduated table(studentID int);

    insert into @graduated(studentID)
    select p.ID
    from Education.Person p
    where p.role = 'student' and p.isActive = 1
        and exists(select 1 from inserted i where i.studentID = p.ID)
        and (select sum(c.credit) from Education.Takes t
            join Education.Course c on t.courseID = c.courseID
            where t.studentID = p.ID and t.status = 'passed') >= 75
        and not exists(select 1 from Education.Takes t2 where t2.studentID = p.ID and t2.status = 'ongoing');

    declare @stuID int;
    while exists(select 1 from @graduated)
    begin
        select top 1 @stuID = studentID from @graduated;

        print('graduated: ' + cast(@stuID as varchar));
        delete from @graduated where studentID = @stuID;
    end
end;
go