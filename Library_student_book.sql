create database DariaKlimuk; 
use DariaKlimuk;

 create table students(
 studentId int primary key identity(1,1),
 name varchar(25) not null,
 surname varchar(25) not null,
 birthdate date,
 gender varchar(10),
 class varchar(10),
 point int check (point >=0)
 );
 
INSERT INTO students( name, surname, birthdate, gender, class , point) VALUES
('Kirill', 'Kask', '2005-05-10', 'M', '10B', '100'),
('Kati', 'Tamm', '2004-03-12', 'F', '12A', '85'),
('Artiom', 'Lepik', '2006-07-01', 'M', '9B', '56'),
('Viiki', 'Saar', '2008-01-20', 'F', '12A', '97'),
('Andrii', 'Mets', '2011-09-09', 'M', '7B', '25');
 
 create table authors (
 authorId int primary key identity(1,1),
 name varchar(25) not null,
 surname varchar(25) not null
 );

 INSERT INTO authors (name, surname) VALUES
('Jaan','Kross'),
('Aino','Pervik'),
('Andrus','Kivirähk'),
('Oskar','Luts'),
('Eduard','Vilde');

 create table types(
 typeId int primary key identity(1,1),
 name varchar(25) unique
 );

 INSERT INTO types (name) VALUES
('Romaan'),
('Laste'),
('Fantaasia'),
('Ajalugu'),
('Draama');

 create table books(
 bookId int primary key identity(1,1),
 name varchar(25) not null,
 pagecount int check (pagecount > 0),
 point int,
 authorId int,
 typeId int,
   FOREIGN KEY (authorId) REFERENCES authors(authorId),
    FOREIGN KEY (typeId) REFERENCES types(typeId)
 );

 INSERT INTO books(name, pagecount, point, authorId, typeId) VALUES
('Raamat1',200,10,1,1),
('Raamat2',150,9,2,2),
('Raamat3',300,8,3,3),
('Raamat4',250,7,5,4),
('Raamat5',180,6,5,5);

 create table borrows(
 borrowsId int primary key identity(1,1),
 studentId int,
 bookId int,
 takenDate date default getdate(),
 broughtDate date,
  FOREIGN KEY (studentId) REFERENCES students(studentId),
    FOREIGN KEY (bookId) REFERENCES books(bookId)
);

INSERT INTO borrows(studentId, bookId, takenDate, broughtDate) VALUES
(1,1,GETDATE(),'2026-04-09'),
(2,2,GETDATE(),NULL),
(3,3,GETDATE(),GETUTCDATE()),
(4,4,GETDATE(),NULL),
(5,5,'2026-02-19' ,GETDATE());

SELECT * FROM students;
SELECT * FROM authors;
SELECT * FROM types;
SELECT * FROM books;
SELECT * FROM borrows;

create table tagasiside(
Id int primary key identity(1,1),
studentId int,
comment varchar(50) unique,
FOREIGN KEY (studentId) REFERENCES students(studentId),
);

CREATE PROCEDURE AddStudent
@name VARCHAR(25),
@surname VARCHAR(25),
@birthdate date,
@gender varchar(10),
@class varchar(10),
@point int
AS
BEGIN
    INSERT INTO students (name, surname, birthdate, gender, class , point)
    VALUES (@name, @surname, @birthdate, @gender, @class, @point);
END;

EXEC AddStudent  'Test', 'Test';
EXEC AddStudent  'Dariia', 'Klimuk';
EXEC AddStudent ' Lev' , 'Lev', '2007-05-16' ,'M', '10B', '50';


CREATE PROCEDURE CheckBooks
AS
BEGIN
    SELECT * FROM books;
END;

EXEC CheckBooks;

CREATE PROCEDURE BorrowBook
@studentid INT,
@bookid INT
AS
BEGIN
    INSERT INTO borrows (studentId, bookId, takenDate)
    VALUES ( @studentid, @bookid, GETDATE());
END;

EXEC BorrowBook 1, 1;

SELECT * FROM students;
SELECT * FROM books;
SELECT * FROM borrows;