create trigger trgReturnBook
on Library.BorrowRecords after update
as begin
    -- Log return Book
    insert into Library.Log(user_type, user_id, action)
    select 'student', i.accountID, CONCAT('Returned book editionID = ', i.editionID)
    from inserted i
    join deleted d ON i.recordID = d.recordID
    where d.status = 'not returned' AND i.status = 'returned';

    -- set New Fine if needed
    insert into Library.Fines(accountID, amount)
    select i.accountID, 1000 from inserted i join deleted d on i.accountID = d.accountID
        where i.returnDate > i.dueDate and i.status = 'returned' and d.status = 'not returned';
    
    -- deactivate Account if needed 
    update Library.Account
    set isActive = 0
    from Library.Account join inserted i on Library.Account.accountID = i.accountID
    join Library.getAllAccountsTotalFine() g on i.accountID = g.accountID
    where isActive = 1 and g.sum > 2000;
end;
GO

create trigger trgLogAddBook
ON Library.Books after insert
as begin
    insert into Library.Log(user_type, user_id, action)
    select 'librarian', NULL, CONCAT('Book added: ', title)
    from inserted;
end;
GO


create trigger trgLimitBorrow
ON Library.BorrowRecords
instead of insert
as begin
    if exists (
        select 1 from Library.BorrowRecords
        where accountID in (select accountID from inserted) AND status = 'not returned'
        group by accountID
        having COUNT(*) >= 3
    )
    begin
        print('Cannot borrow more than 3 books simultaneously.');
        ROLLBACK;
    end
    else
    begin
        insert into Library.BorrowRecords(accountID, editionID, librarianID, borrowDate, dueDate, status)
        select accountID, editionID, librarianID, borrowDate, dueDate, status from inserted;
    end;
end;
GO

create trigger trgLogBorrowBook
ON Library.BorrowRecords after insert
as begin
    insert into Library.Log(user_type, user_id, action)
    select 'student', accountID, CONCAT('Borrowed book editionID = ', editionID)
    from inserted;
end;
GO

create trigger trgLogExtendDueDate
ON Library.BorrowRecords
after update
as begin
    insert into Library.Log(user_type, user_id, action)
    select 'student', i.accountID, CONCAT('Extended due date for editionID = ', i.editionID)
    from inserted i
    join deleted d ON i.recordID = d.recordID
    where i.dueDate > d.dueDate AND i.status = 'not returned';
end;
GO

create trigger trgLogPayFine
ON Library.Fines
after update
as begin
    insert into Library.Log(user_type, user_id, action)
    select 'student', accountID, CONCAT('Paid fineID = ', fineID)
    from inserted
    where status = 'paid';
end;
GO

create trigger trgLogAddPublisher
ON Library.Publisher
after insert
as begin
    insert into Library.Log(user_type, user_id, action)
    select 'librarian', NULL, CONCAT('Publisher added: ', name)
    from inserted;
end;
GO

create trigger trgLogAddBookEdition
ON Library.BooksAvailable
after insert
as begin
    insert into Library.Log(user_type, user_id, action)
    select 'librarian', NULL, CONCAT('Added edition: BookID = ', bookID, ', Edition = ', editionNumber)
    from inserted;
end;
GO

create trigger trgLogAddCategory
ON Library.Category
after insert
AS
begin
    insert into Library.Log(user_type, user_id, action)
    select 'librarian', NULL, CONCAT('Category added: ', name)
    from inserted;
end;
GO

create trigger trgLogShelfLocationChange
ON Library.ShelfLocation
after insert, update
AS
begin
    DECLARE @action VARCHAR(255);

    -- Log for inserted records
    if exists (select * from inserted) AND NOT exists (select * from deleted)
    begin
        insert into Library.Log(user_type, user_id, action)
        select
            'librarian',
            NULL, -- Assuming a librarian performs this action
            CONCAT('set location for editionID = ', i.editionID, ' to Aisle: ', i.aisle, ', Shelf: ', i.shelfNumber)
        from inserted i;
    end

    -- Log for updated records
    if exists (select * from inserted) AND exists (select * from deleted)
    begin
        insert into Library.Log(user_type, user_id, action)
        select
            'librarian',
            NULL,
            CONCAT('Changed location for editionID = ', i.editionID, ' from Aisle: ', d.aisle, ', Shelf: ', d.shelfNumber, ' to Aisle: ', i.aisle, ', Shelf: ', i.shelfNumber)
        from inserted i
        join deleted d ON i.locationID = d.locationID;
    end
end;
GO

create trigger Library.trgReactivateAccountOnFinePayment
ON Library.Fines
after update
AS
begin
    DECLARE @accountID INT;
    DECLARE @totalFine INT;
    DECLARE @deactivationThreshold INT = 2000; -- Same threshold from your other trigger

    -- Check if a fine was just paid
    if update(status) AND exists (select 1 from inserted i join deleted d ON i.fineID = d.fineID where i.status = 'paid' AND d.status = 'notPaid')
    begin
        -- Get the account ID for the paid fine
        select @accountID = accountID from inserted;

        -- Calculate the remaining total fine for this account
        set @totalFine = ISNULL(Library.getTotalFineByAccID(@accountID), 0);

        -- if the account is currently inactive and the total fine is now below the threshold, reactivate it
        if exists (select 1 from Library.Account where accountID = @accountID AND isActive = 0) AND @totalFine < @deactivationThreshold
        begin
            update Library.Account
            set isActive = 1
            where accountID = @accountID;

            -- Log the reactivation
            insert into Library.Log (user_type, user_id, action)
            VALUES ('system', @accountID, 'Account has been automatically reactivated due to fine payment.');
        end
    end
end;
GO