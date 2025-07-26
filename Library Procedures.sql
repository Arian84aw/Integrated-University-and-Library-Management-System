create procedure Library.addPublisher
    @name varchar(50)
as begin
    insert into Library.Publisher(name)
    values (@name)
end;
GO

create procedure Library.addCategory
    @name varchar(50)
as begin
    insert into Library.Category(name)
    values (@name)
end;
GO

create procedure Library.addBooks
    @title varchar(50), @author varchar(50), @categoryID INT
as begin
    insert into Library.Books(title, author, categoryID)
    values (@title, @author, @categoryID);
end;
GO

create procedure Library.addNewBooksAvailable
    @bookID INT, @publisherID INT, @editionNumber INT, @numCopies INT,
    @aisle VARCHAR(20) = NULL, @shelfNumber VARCHAR(20) = NULL
as begin
    DECLARE @editionID INT;

    if exists(select 1 FROM Library.BooksAvailable where bookID = @bookID and publisherID = @publisherID and editionNumber = @editionNumber)
    begin
        update Library.BooksAvailable
        set totalCopies = totalCopies + @numCopies,
            availableCopies = availableCopies + @numCopies
        where bookID = @bookID and publisherID = @publisherID and editionNumber = @editionNumber;

        select @editionID = editionID from Library.BooksAvailable where bookID = @bookID and publisherID = @publisherID and editionNumber = @editionNumber;
    end
    else
    begin
        insert into Library.BooksAvailable(bookID, publisherID, editionNumber, totalCopies, availableCopies)
        values (@bookID, @publisherID, @editionNumber, @numCopies, @numCopies);
        set @editionID = SCOPE_IDENTITY();
    end;
    if @editionID is not NULL and @aisle is not NULL and @shelfNumber is not NULL
    begin
        if exists (select 1 FROM Library.ShelfLocation where editionID = @editionID)
        begin
            update Library.ShelfLocation
            set aisle = @aisle,
                shelfNumber = @shelfNumber
            where editionID = @editionID;
        end
        else
        begin
            insert into Library.ShelfLocation (editionID, aisle, shelfNumber)
            values (@editionID, @aisle, @shelfNumber);
        end
    end;
end;
GO


create procedure Library.setNewFine
    @accountID INT, @amount INT
as begin
    insert into Library.Fines(accountID, amount)
    values (@accountID, @amount);
end;
GO

create procedure Library.payFinesByFineIdAndAccID
    @accountID INT, @fineID INT
as begin
    update f
    set f.status = 'paid'
    from Library.Fines f where f.accountID = @accountID and f.fineID = @fineID and status = 'notPaid'
end;
GO

create procedure Library.payAllFinesByAccID
    @accountID INT
as begin
    update f
    set f.status = 'paid'
    from Library.Fines f where f.accountID = @accountID and status = 'notPaid'
end;
GO


CREATE procedure Library.borrowBook
    @editionID INT, @accountID INT, @librarianID INT
as begin
    if exists(select 1 from Library.Account a where a.isActive = 0 and a.accountID = @accountID)
        begin
            print('this account is not active or not exists.');
            return;
        end
    if not exists(select 1 from Library.BooksAvailable where editionID = @editionID)
    begin
        print('this book does not exists');
        return;
    end;
    if exists(select 1 from Library.BooksAvailable where editionID = @editionID and 0 < Library.BooksAvailable.availableCopies)
    begin
        if exists(select 1 from Library.BorrowRecords b where b.editionID = @editionID and b.accountID = @accountID and b.status = 'not returned')
            begin
                print('you borrow this book before.');
                return;
            end;
        update Library.BooksAvailable
        set Library.BooksAvailable.availableCopies = Library.BooksAvailable.availableCopies - 1
        from Library.BooksAvailable where editionID = @editionID;
        
        insert into Library.BorrowRecords(accountID, editionID, librarianID, dueDate)
        values (@accountID, @editionID, @librarianID, getdate() + day(7))
    end;
    else
        begin
            print('not available');
        end;
end;
go


CREATE procedure Library.returnBook
    @editionID INT, @accountID INT
as begin
    if exists(select 1 from Library.BooksAvailable where editionID = @editionID and BooksAvailable.availableCopies < BooksAvailable.totalCopies)
    begin
        if exists(select 1 from Library.BorrowRecords b where b.editionID = @editionID and b.accountID = @accountID and b.status = 'not returned')
            begin
                update Library.BooksAvailable
                set Library.BooksAvailable.availableCopies = Library.BooksAvailable.availableCopies + 1
                from Library.BooksAvailable where editionID = @editionID;

                update b
                set b.status = 'returned', b.returnDate = getdate()
                from Library.BorrowRecords b where b.editionID = @editionID and b.accountID = @accountID and b.status = 'not returned';
            end;
        else
            begin
                print('you dont borrow this book before.');
                return;
            end;
        return
    end;
    else
        begin
            print('invalid input!');
            return;
        end
end;
go


CREATE procedure Library.GetRecommendedBooksDetails
    @studentID INT,
    @book1Title NVARCHAR(100) OUTPUT,
    @book1Edition INT OUTPUT,
    @book2Title NVARCHAR(100) OUTPUT,
    @book2Edition INT OUTPUT,
    @book3Title NVARCHAR(100) OUTPUT,
    @book3Edition INT OUTPUT
as begin

    DECLARE @accountID INT = Library.getAccID(@studentID);

    WITH UserBooks as (
        SELECT editionID
        FROM Library.BorrowRecords
        WHERE accountID = @accountID
    ),
    SimilarUsers as (
        SELECT br.accountID
        FROM Library.BorrowRecords br
        JOIN UserBooks ub ON br.editionID = ub.editionID
        WHERE br.accountID <> @accountID
        GROUP BY br.accountID
        HAVING COUNT(DISTINCT br.editionID) >= 2
    ),
    Recommended as (
        SELECT br.editionID, COUNT(*) as freq
        FROM Library.BorrowRecords br
        WHERE br.accountID IN (SELECT accountID FROM SimilarUsers)
        and br.editionID NOT IN (SELECT editionID FROM UserBooks)
        GROUP BY br.editionID
    ),
    Top3Books as (
        SELECT TOP 3 r.editionID, b.title, ba.editionNumber
        FROM Recommended r
        JOIN Library.BooksAvailable ba ON ba.editionID = r.editionID
        JOIN Library.Books b ON ba.bookID = b.bookID
        ORDER BY r.freq DESC
    )
    SELECT
        @book1Title = MAX(CASE WHEN rn = 1 THEN title END), @book1Edition = MAX(CASE WHEN rn = 1 THEN editionNumber END),
        @book2Title = MAX(CASE WHEN rn = 2 THEN title END), @book2Edition = MAX(CASE WHEN rn = 2 THEN editionNumber END),
        @book3Title = MAX(CASE WHEN rn = 3 THEN title END), @book3Edition = MAX(CASE WHEN rn = 3 THEN editionNumber END)
    FROM (
        SELECT *, ROW_NUMBER() OVER (ORDER BY editionID) as rn
        FROM Top3Books
    ) ranked;
END;
GO

create procedure Library.extendDueDate
    @editionID INT,
    @accountID INT,
    @days INT
as begin
    if exists(select 1 from Library.Account a where a.isActive = 0 and a.accountID = @accountID)
        begin
            print('this account is not active or not exists.');
            return;
        end
    
    if exists (
        select 1
        from Library.BorrowRecords
        where editionID = @editionID and accountID = @accountID and status = 'not returned'
    )
    begin
        update Library.BorrowRecords
        set dueDate = DATEADD(day, @days, dueDate)
        where editionID = @editionID and accountID = @accountID and status = 'not returned';
    end
    else
    begin
        print('No active borrow found.');
        return;
    end
end;
GO