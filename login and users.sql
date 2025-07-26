-- create Role
use [DB_project];
go

create role AdminRole;
go
create role LibrarianRole;
go
create role StudentRole;
go

-----

grant insert on Education.Person to AdminRole;
grant insert on Education.Student to AdminRole;
grant select on Education.Instructor to AdminRole;
grant select on Education.Major to AdminRole;
go

grant select on schema::Library to LibrarianRole;
grant insert on Library.BorrowRecords to LibrarianRole;
grant update on Library.BorrowRecords to LibrarianRole;
grant update on Library.BooksAvailable to LibrarianRole;
grant select on Education.Person to LibrarianRole;
go

---------------------------------------------------------------------
    
grant execute on Education.takeSection to StudentRole;  -- proc
grant execute on Education.dropSection to StudentRole;  -- proc
grant execute on Education.TermGPA to StudentRole; -- scaler func
grant execute on Education.totalGPA to StudentRole; -- scaler func
grant select on Education.TermTranscript to StudentRole; -- table function
grant select on Education.SuggestCoursesForStudent to StudentRole; -- table function
grant select on Education.Weeklyschedule to StudentRole; -- table function
go


grant execute on Education.addPerson to AdminRole;
GO

grant execute on SCHEMA::Education to AdminRole;
grant select on SCHEMA::Education to AdminRole;
GO

grant execute on SCHEMA::Library to LibrarianRole;
go


-- create Login
use master;
go

create login AdminLogin with password = 'admin';
go
create login LibrarianLogin with password = 'librarian';
GO
create login StudentLogin with password = 'student';
go


------------------------------------
-- create User
USE [DB_project];
GO


create user EducationAdmin for login AdminLogin;
go
create user Librarian for login LibrarianLogin;
go  
create user Student for login StudentLogin;
go

-- connect user to Role
alter role AdminRole add member EducationAdmin;
GO
alter role LibrarianRole add member Librarian;
go
alter role StudentRole add member Student;
go