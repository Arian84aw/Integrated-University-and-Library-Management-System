create function Library.showAllBooksEdition()
returns table
as return(
    select ba.editionID, b.title, b.author, ba.editionNumber, ba.availableCopies, sl.aisle, sl.shelfNumber
    from Library.BooksAvailable ba
    join Library.Books b on ba.bookID = b.bookID
    left join Library.ShelfLocation sl on ba.editionID = sl.editionID
);
GO

create function Library.getAccID(@stuID INT)
returns INT
as begin
    declare @AccountID INT;
    select @AccountID = Library.Account.accountID
    from Library.Account
    where Library.Account.personID =  @stuID;
    return @AccountID;
end;
GO

create function Library.getTotalFineByStuID(@studentID INT)
returns INT
as begin
    declare @AccountID INT;
    set @AccountID = Library.getAccID(@studentID);
    return Library.getTotalFineByAccID(@AccountID);
end;
GO

create function Library.getTotalFineByAccID(@AccountID INT)
returns INT
as begin
    return(
        select ISNULL(sum(amount), 0)
        from Library.Fines where accountID = @AccountID and status = 'notPaid'
        );
end;
GO

create function Library.showFinesByAccID(@accountID INT)
returns table
as return(
    select fineID, amount
    from Library.Fines where Library.Fines.accountID = @accountID and status = 'notPaid'
);
GO

create function Library.getBorrowHistory(@accountID INT)
returns table
as return(
    select
        b.title, ba.editionNumber, br.borrowDate, br.dueDate, br.returnDate, br.status, sl.aisle, sl.shelfNumber
    from Library.BorrowRecords br
    join Library.BooksAvailable ba on br.editionID = ba.editionID
    join Library.Books b on ba.bookID = b.bookID
    left join Library.ShelfLocation sl on br.editionID = sl.editionID
    where br.accountID = @accountID
);
GO

create function Library.GetRecommendedBooks(@studentID INT)
returns table
as return(
    with UserBooks as(
        select editionID
        from Library.BorrowRecords
        where accountID = Library.getAccID(@studentID)
    ),
    SimilarUsers as(
        select br.accountID
        from Library.BorrowRecords br
        join UserBooks ub on br.editionID = ub.editionID
        where br.accountID <> Library.getAccID(@studentID)
        group by br.accountID
        having count(DISTINCT br.editionID) >= 2
    ),
    Recommended as(
        select br.editionID, count(*) AS freq
        from Library.BorrowRecords br
        where br.accountID in(select accountID from SimilarUsers)
        and br.editionID not in(select editionID from UserBooks)
        group by br.editionID
    )
    select top 3
        r.editionID, b.title, b.author, sl.aisle, sl.shelfNumber, r.freq
    from Recommended r
    join Library.BooksAvailable ba on ba.editionID = r.editionID
    join Library.Books b on b.bookID = ba.bookID
    left join Library.ShelfLocation sl on r.editionID = sl.editionID
    ORDER BY r.freq desc
);
GO


create function Library.getAllAccountsTotalFine()
returns table
as return(
    select accountID, sum(amount) as sum
    from Library.Fines where status = 'notPaid'
    group by accountID
);
GO

create function Library.GetBookLocation(@editionID INT)
returns table
as return(
    select
        l.aisle,
        l.shelfNumber
    from Library.ShelfLocation l
    where l.editionID = @editionID
);
GO
