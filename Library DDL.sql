--------------------------------------------------------------------------------------
create schema Library;
GO

create table Library.Account(
    accountID INT PRIMARY KEY,
    personID INT unique not null,
    isActive BIT default 1,
    FOREIGN KEY (personID) REFERENCES Education.Person(ID),
);
GO

create table Library.Category(
    categoryID INT IDENTITY PRIMARY KEY,
    name varchar(50) unique not null,
);
GO

create table Library.Publisher(
    publisherID INT IDENTITY PRIMARY KEY,
    name varchar(50) unique not null,
);
GO

create table Library.Books(
    bookID INT IDENTITY PRIMARY KEY,
    title varchar(50) not null,
    author varchar(50),
    categoryID INT not null,
    FOREIGN KEY (categoryID) REFERENCES Library.Category(categoryID),
);
GO

create table Library.BooksAvailable(
    editionID INT IDENTITY PRIMARY KEY,
    bookID INT not null,
    publisherID INT not null,
    editionNumber INT not null,
    totalCopies INT default 0,
    availableCopies INT default 0,
    unique (bookID, publisherID, editionNumber),
    FOREIGN KEY (bookID) REFERENCES Library.Books(bookID),
    FOREIGN KEY (publisherID) REFERENCES Library.Publisher(publisherID),
);
GO

create table Library.Librarian(
    librarianID INT PRIMARY KEY,
    FOREIGN KEY (librarianID) REFERENCES Education.Person(ID),
);
GO

create table Library.Fines(
    fineID INT IDENTITY PRIMARY KEY,
    accountID INT not null,
    date DATETIME default getdate(),
    amount INT check (amount > 0),
    status varchar(10) default 'notPaid' check(status in ('paid', 'notPaid')),
    unique (accountID, date),
    FOREIGN KEY (accountID) REFERENCES Library.Account(accountID),
);
GO

create table Library.BorrowRecords(
    recordID INT IDENTITY PRIMARY KEY,
    accountID INT not null,
    editionID INT not null,
    librarianID INT not null,
    status varchar(20) default 'not returned' check(status IN ('not returned', 'returned')),
    borrowDate DATETIME default getdate(),
    dueDate DATETIME not null,
    returnDate DATETIME,
    FOREIGN KEY (accountID) REFERENCES Library.Account(accountID),
    FOREIGN KEY (editionID) REFERENCES Library.BooksAvailable(editionID),
    FOREIGN KEY (librarianID) REFERENCES Library.Librarian(librarianID),
);
GO

create table Library.ShelfLocation(
    locationID INT IDENTITY PRIMARY KEY,
    editionID INT NOT NULL UNIQUE,
    aisle VARCHAR(20) NOT NULL, -- شماره راهرو
    shelfNumber VARCHAR(20) NOT NULL, -- شماره قفسه
    FOREIGN KEY (editionID) REFERENCES Library.BooksAvailable(editionID)
);
GO

create table Library.Log(
    log_id INT IDENTITY PRIMARY KEY,
    user_type VARCHAR(20), -- student, librarian, system
    user_id INT,
    action VARCHAR(255),
    log_time DATETIME DEFAULT getdate(),
);
GO
