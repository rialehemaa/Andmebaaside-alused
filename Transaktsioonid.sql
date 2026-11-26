create database transaktsioonVideo;
use transaktsioonVideo;

--Osa 1. Video näide (tblMailingAddress ja tblPhysicalAddress)
--1. tabel Mailing
CREATE TABLE tblMailingAddress(
AddressId int NOT NULL primary key,
EmployeeNumber int,
HouseNumber nvarchar(50),
StreetAddress nvarchar(50),
City nvarchar(10),
PostalCode nvarchar(50));

--tabel Physical
CREATE TABLE tblPhysicalAddress(
AddressId int NOT NULL primary key,
EmployeeNumber int,
HouseNumber nvarchar(50),
StreetAddress nvarchar(50),
City nvarchar(10),
PostalCode nvarchar(50));

INSERT INTO tblMailingAddress VALUES (1, 101, '#10', 'King Street', 'Londoon', 'CR27DW');
INSERT INTO tblPhysicalAddress VALUES (1, 101, '#10', 'King Street', 'Londoon', 'CR27DW');

--2. kontroll
SELECT * FROM tblMailingAddress;
SELECT * FROM tblPhysicalAddress;

--3. protseduur
Create Procedure spUpdateAddress
as
Begin
 Begin Try
  Begin Transaction
   Update tblMailingAddress set City = 'LONDON' 
   where AddressId = 1 and EmployeeNumber = 101
   
   Update tblPhysicalAddress set City = 'LONDON' 
   where AddressId = 1 and EmployeeNumber = 101
  Commit Transaction
 End Try
 Begin Catch
  Rollback Transaction
 End Catch
End

Execute spUpdateAddress
SELECT * FROM tblMailingAddress;
SELECT * FROM tblPhysicalAddress;

--4. teine UPDATE ebaõnnestub
Alter Procedure spUpdateAddress
as
Begin
 Begin Try
  Begin Transaction
   Update tblMailingAddress set City = 'LONDON12' 
   where AddressId = 1 and EmployeeNumber = 101
   
   Update tblPhysicalAddress set City = 'LONDON LONDON' 
   where AddressId = 1 and EmployeeNumber = 101
  Commit Transaction
 End Try
 Begin Catch
  Rollback Transaction
 End Catch
End

Execute spUpdateAddress

SELECT * FROM tblMailingAddress;
SELECT * FROM tblPhysicalAddress;

--5. ilma transaktsioonita
Update tblMailingAddress set City = 'LONDON12' 
where AddressId = 1 and EmployeeNumber = 101
SELECT * FROM tblMailingAddress;

Update tblPhysicalAddress set City = 'LONDON LONDON' 
where AddressId = 1 and EmployeeNumber = 101
SELECT * FROM tblPhysicalAddress;

SELECT * FROM tblMailingAddress;
SELECT * FROM tblPhysicalAddress;

--Osa 2. Sama muster uutel tabelitel: pangaülekanne
--1. tabelid
Create Table tblArveldusarve
(
   KontoId int NOT NULL primary key,
   KliendiNr int,
   Omanik nvarchar(30),
   Saldo decimal(10,2) check (Saldo >= 0)
)

Insert into tblArveldusarve values (1, 201, 'Mari Maasikas', 500.00)
SELECT * FROM tblArveldusarve;

Create Table tblHoiusarve
(
   KontoId int NOT NULL primary key,
   KliendiNr int,
   Omanik nvarchar(30),
   Saldo decimal(10,2) check (Saldo >= 0)
)

Insert into tblHoiusarve values (1, 201, 'Mari Maasikas', 1000.00)
SELECT * FROM tblHoiusarve;

--2. kontrollpäring
Select * from tblArveldusarve
Select * from tblHoiusarve

--3. protseduur
Create Procedure spUlekanne
as
Begin
 Begin Try
  Begin Transaction
   Update tblHoiusarve set Saldo = Saldo + 200
   where KontoId = 1 and KliendiNr = 201

   Update tblArveldusarve set Saldo = Saldo - 200
   where KontoId = 1 and KliendiNr = 201
  Commit Transaction
 End Try
 Begin Catch
  Rollback Transaction
 End Catch
End

Execute spUlekanne

Select * from tblArveldusarve
Select * from tblHoiusarve

--4. summa 1000, teine UPDATE ebaõnnestub
Alter Procedure spUlekanne
as
Begin
 Begin Try
  Begin Transaction
   Update tblHoiusarve set Saldo = Saldo + 1000
   where KontoId = 1 and KliendiNr = 201

   Update tblArveldusarve set Saldo = Saldo - 1000   -- CHECK viga: 300 - 1000 < 0
   where KontoId = 1 and KliendiNr = 201
  Commit Transaction
 End Try
 Begin Catch
  Rollback Transaction
 End Catch
End

Execute spUlekanne
Select * from tblArveldusarve
Select * from tblHoiusarve


--5. ilma transaktsioonita
Update tblHoiusarve set Saldo = Saldo + 1000
where KontoId = 1 and KliendiNr = 201
Select * from tblHoiusarve

Update tblArveldusarve set Saldo = Saldo - 1000   -- viga: CHECK
where KontoId = 1 and KliendiNr = 201
Select * from tblArveldusarve

Select * from tblArveldusarve
Select * from tblHoiusarve

--lisaülesanne: parameeter @Summa
Alter Procedure spUlekanne
@Summa decimal(10,2)
as
Begin
 Begin Try
  Begin Transaction
   Update tblHoiusarve set Saldo = Saldo + @Summa
   where KontoId = 1 and KliendiNr = 201

   Update tblArveldusarve set Saldo = Saldo - @Summa
   where KontoId = 1 and KliendiNr = 201
  Commit Transaction
 End Try
 Begin Catch
  Rollback Transaction
 End Catch
End

EXEC spUlekanne @Summa = 50

Select * from tblArveldusarve
Select * from tblHoiusarve

