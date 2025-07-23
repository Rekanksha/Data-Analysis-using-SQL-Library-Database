create database LibraryManagement;
use LibraryManagement;
-- creating a table called authors
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);
-- Creating a table called books
CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100),
    AuthorID INT,
    Genre VARCHAR(50),
    PublishedYear INT,
    Quantity INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);
-- creating members table
CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    MembershipDate DATE
);
-- Creating borrow table
CREATE TABLE Borrowing (
    RecordID INT PRIMARY KEY AUTO_INCREMENT,
    MemberID INT,
    BookID INT,
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);
INSERT INTO Authors (FirstName, LastName) VALUES
('J.K.', 'Rowling'),
('George', 'Orwell'),
('J.R.R.', 'Tolkien'),
('Isaac', 'Asimov'),
('Agatha', 'Christie'),
('Mark', 'Twain'),
('F. Scott', 'Fitzgerald'),
('Jane', 'Austen'),
('Arthur', 'Conan Doyle'),
('Ernest', 'Hemingway'),
('Leo', 'Tolstoy'),
('Charles', 'Dickens'),
('Mary', 'Shelley'),
('H.G.', 'Wells'),
('Edgar', 'Allan Poe'),
('Herman', 'Melville'),
('Virginia', 'Woolf'),
('Gabriel', 'García Márquez');

INSERT INTO Books (Title, AuthorID, Genre, PublishedYear, Quantity) VALUES
('Harry Potter and the Sorcerer\'s Stone', 1, 'Fantasy', 1997, 10),
('1984', 2, 'Dystopian', 1949, 5),
('The Hobbit', 3, 'Fantasy', 1937, 7),
('Foundation', 4, 'Science Fiction', 1951, 8),
('Murder on the Orient Express', 5, 'Mystery', 1934, 12),
('The Adventures of Tom Sawyer', 6, 'Adventure', 1876, 10),
('The Great Gatsby', 7, 'Fiction', 1925, 6),
('Pride and Prejudice', 8, 'Romance', 1813, 9),
('Harry Potter and the Chamber of Secrets', 1, 'Fantasy', 1998, 10),
('Animal Farm', 2, 'Dystopian', 1945, 7),
('The Lord of the Rings', 3, 'Fantasy', 1954, 5),
('Sherlock Holmes: A Study in Scarlet', 9, 'Mystery', 1887, 6),
('The Old Man and the Sea', 10, 'Literary Fiction', 1952, 8),
('War and Peace', 11, 'Historical Fiction', 1869, 4),
('A Tale of Two Cities', 12, 'Historical Fiction', 1859, 9),
('Frankenstein', 13, 'Science Fiction', 1818, 7),
('The War of the Worlds', 14, 'Science Fiction', 1898, 5),
('The Raven', 15, 'Poetry', 1845, 6),
('Moby Dick', 16, 'Adventure', 1851, 3),
('To the Lighthouse', 17, 'Literary Fiction', 1927, 5),
('One Hundred Years of Solitude', 18, 'Magical Realism', 1967, 7);

INSERT INTO Members (FirstName, LastName, MembershipDate) VALUES
('John', 'Doe', '2023-01-15'),
('Jane', 'Smith', '2023-02-20'),
('Sam', 'Brown', '2023-03-05'),
('Alice', 'Johnson', '2023-03-15'),
('Bob', 'Williams', '2023-04-10'),
('Charlie', 'Davis', '2023-05-22'),
('Diana', 'Miller', '2023-06-30'),
('Eve', 'Wilson', '2023-07-14'),
('Frank', 'Parker', '2023-03-18'),
('Helen', 'Clark', '2023-04-22'),
('Tom', 'Evans', '2023-05-28'),
('Emily', 'Adams', '2023-06-05'),
('Victor', 'Hughes', '2023-07-19'),
('Grace', 'Turner', '2023-08-01'),
('Liam', 'Martin', '2023-08-08'),
('Sophia', 'Lewis', '2023-08-10'),
('Olivia', 'White', '2023-08-15'),
('James', 'Hall', '2023-08-20');

INSERT INTO Borrowing (MemberID, BookID, BorrowDate, ReturnDate) VALUES
(1, 1, '2023-08-01', NULL),
(2, 2, '2023-08-05', '2023-08-12'),
(3, 3, '2023-08-07', NULL),
(1, 4, '2023-08-10', NULL),  
(2, 5, '2023-08-12', '2023-08-19'),  
(3, 6, '2023-08-15', NULL),  
(4, 7, '2023-08-17', NULL),  
(5, 8, '2023-08-19', NULL), 
(1, 9, '2023-08-20', NULL),  
(2, 10, '2023-08-22', NULL),
(3, 11, '2023-08-24', NULL), 
(6, 19, '2023-08-11', NULL), 
(7, 20, '2023-08-12', NULL), 
(8, 21, '2023-08-13', NULL), 
(9, 22, '2023-08-14', '2023-08-19'), 
(10, 23, '2023-08-15', NULL), 
(11, 24, '2023-08-16', NULL),  
(12, 25, '2023-08-17', NULL), 
(13, 26, '2023-08-18', '2023-08-23'), 
(14, 27, '2023-08-19', NULL),  
(15, 28, '2023-08-20', NULL),  
(6, 1, '2023-08-21', NULL), 
(7, 2, '2023-08-22', NULL),  
(8, 3, '2023-08-23', NULL),  
(9, 4, '2023-08-24', NULL),  
(10, 5, '2023-08-25', NULL), 
(11, 6, '2023-08-26', NULL), 
(12, 7, '2023-08-27', NULL), 
(13, 8, '2023-08-28', NULL),
(14, 9, '2023-08-29', NULL), 
(15, 10, '2023-08-30', NULL); 

-- Find all books borrowed by John
SELECT concat(m.FirstName,' ',m.LastName) as Full_Name, b.title
FROM Borrowing as br
JOIN Books as b
ON br.BookID=b.BookID
JOIN Members as m
ON m.MemberID =br.MemberID
WHERE m.FirstName LIKE 'John%';

-- List all  books which are  never borrowed
SELECT  b.BookID,b.title FROM books as b
WHERE b.BookID NOT IN(
   SELECT br.BookID FROM Borrowing as br
);

-- Count the total number of books by each author and their name
SELECT concat(a.FirstName,' ',a.LastName) as FullName,COUNT(b.BookID) as TotalBooks
FROM Authors as a
JOIN Books as b
ON a.AuthorID=b.AuthorID
GROUP BY b.AuthorID;

-- List all books by a genre:
SELECT  b.genre,Count(*) as TotalNumber
FROM Books as b
GROUP BY Genre;

SELECT genre ,title
From Books
Order By Genre;

SELECT Genre, GROUP_CONCAT(Title) AS Titles
FROM Books
GROUP BY Genre;

-- List members who haven't borrowed any books: 
SELECT concat(FirstName,' ',LastName) as FullName
FROM members
Where memberID not in (SELECT memberID from borrowing);

-- Find the total number of books available in the library across all titles:
SELECT sum(Quantity) as TotalBooks From Books;

-- List all authors who have written more than one book in the library:

Select CONCAT(a.FirstName,' ',a.LastName) as FullName 
FROM Authors as a
Join Books as b
On a.AuthorId=b.AuthorId
Group By a.FirstName,a.LastName,a.authorID
Having count(b.BookID)>1;

-- Find the average number of books borrowed by each member:
SELECT round(AVG(cnt)) as average
FROM (
SELECT concat(m.FirstName,' ',m.LastName) as fullName ,count(br.bookID) as cnt
From
members as m
JOIN
borrowing as br
ON m.memberID=br.memberID
GROUP BY fullName) temp;

-- Find the books borrowed within a specific date range (e.g., between '2023-08-01' and '2023-08-15'): 
SELECT b.title 
FROM books as b
JOIN
borrowing as br
ON b.BookID=br.BookID
WHERE br.BorrowDate Between '2023-08-01' AND '2023-08-15';

-- Determine the most popular genre in the library based on the number of books borrowed

SELECT COUNT(b.genre) as cnt , b.genre as MostPopularGenre
From Books as b
JOIN Borrowing as br
ON b.BookID=br.BookID
GROUP BY genre
ORDER BY cnt DESC
LIMIT 1;

-- Find overdue books (books that have not been returned in 30 days):
SELECT 
  b.title,
  br.bookID
FROM Borrowing AS br
JOIN Books AS b ON br.bookID = b.bookID
WHERE 
  br.ReturnDate IS NULL
  AND DATEDIFF(CURDATE(), br.BorrowDate) > 30;

-- Find all books currently borrowed by members
SELECT concat(m.firstName,' ',m.lastName)as Name,b.title
FROM members as m
JOIN borrowing as br
ON m.memberID = br.memberID
JOIN books as b
ON b.BookID=br.BOOKId
WHERE br.ReturnDate is NULL
ORDER BY Name;

-- Identify members who have borrowed more than one book:

SELECT concat(m.firstName,' ',m.LastName)as Name,count(br.memberID) as cnt
FROM members as m
JOIN borrowing as br
ON m.memberID=br.memberID
GROUP BY m.memberID,Name
HAVING COUNT(br.memberID)>1;

-- List all books and their corresponding authors that have been borrowed at least twice:
SELECT 
b.title AS BookTitle,
CONCAT(a.FirstName, ' ', a.LastName) AS AuthorName
FROM Books AS b
JOIN Authors AS a ON b.AuthorID = a.AuthorID
JOIN Borrowing AS br ON b.BookID = br.BookID
GROUP BY b.bookID, b.Title, a.FirstName, a.LastName
HAVING COUNT(br.BookID) >= 2;

-- Find the difference in the number of books borrowed between two specific members (e.g., 'John Doe' and 'Alice Johnson'): 
SELECT (
(SELECT count(br.memberID)
FROM members as m
JOIN borrowing as br
ON m.memberID=br.memberID
WHERE m.firstName LIKE 'John%')
-
(SELECT count(br.memberID)
FROM members as m
JOIN borrowing as br
ON m.memberID=br.memberID
WHERE m.firstName LIKE 'Alice%'
))difference;

-- Identify all members who borrowed books by a specific author (e.g., 'George Orwell'):

SELECT DISTINCT concat(m.firstName,' ',m.lastName) as Name 
FROM authors as a
JOIN books as b
ON a.authorId=b.authorID
JOIN borrowing as br
ON b.bookID=br.bookID
JOIN  members as m
ON m.memberID=br.memberID
WHERE a.firstName='George';

-- Find the most borrowed book

Select * From
(SELECT b.title ,dense_rank() over (order by (count(br.bookId)) desc )as Rankss
 FROM books as b
JOIN borrowing as br
ON b.bookID = br.bookID
GROUP BY br.bookID
ORDER by count(br.bookID) DESC)temp4
Where rankss=1;

-- Identify the member who has borrowed the most books
SELECT * FROM
(SELECT concat(m.firstName,m.LastName) as fullName,dense_rank() over (order by(count(concat(m.firstName,m.LastName))) desc) rankss
From members as m
JOIN 
borrowing as br
ON br.memberId=m.memberId
GROUP BY fullName
ORDER BY count(concat(m.firstName,m.LastName)) DESC)temp5
WHERE rankss=1;







