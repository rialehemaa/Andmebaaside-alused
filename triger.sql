create database trigerKlimuk;
use trigerKlimuk;

--tabel linnad
CREATE TABLE linnad(
linnId int primary key identity(1,1),
linnanimi varchar(50) unique,
rahvaarv int not null);

--tabel logi
CREATE TABLE logi(
Id int primary key identity(1,1),
kuupaev datetime,
andmed TEXT);

--Insert Triger
CREATE TRIGGER linnaLisamine
ON linnad
FOR INSERT
AS
INSERT INTO logi(kuupaev, andmed)
SELECT
getdate(), inserted.linnanimi
FROM inserted;

--kontrollimiseks tuleb lisada uus linn tabelisse linnad
INSERT INTO linnad (linnanimi, rahvaarv)
VALUES ('Keila', 60000);
SELECT * FROM linnad;
SELECT * FROM logi;

--kustutame triger
drop trigger linnaLisamine;

CREATE TRIGGER linnaLisamine
ON linnad
FOR INSERT
AS
INSERT INTO logi(kuupaev, andmed)
SELECT
getdate(),
CONCAT('lisatud linn: ', inserted.linnanimi,
'| rahvaarv: ', inserted.rahvaarv, ' | id: ', inserted.linnId)
FROM inserted;

-- DELETE TRIGGER
CREATE TRIGGER linnaKustutamine
ON linnad
FOR DELETE
AS
INSERT INTO logi(kuupaev, andmed)
SELECT
getdate(),
CONCAT('kustutatud linn: ', deleted.linnanimi,
' | rahvaarv: ', deleted.rahvaarv, ' | id: ', deleted.linnId)
FROM deleted;

delete from linnad WHERE linnId=3;
SELECT * FROM linnad;
SELECT * FROM logi;

-- UPDATE TRIGGER
CREATE TRIGGER linnaUuendamine
ON linnad
FOR UPDATE
AS
INSERT INTO logi(kuupaev, andmed)
SELECT
getdate(),
CONCAT('vana linna andmed: ', d.linnanimi,
' | ', d.rahvaarv, ' | id: ', d.linnId,
' uued linna andmed: ', i.linnanimi,
' | ', i.rahvaarv, ' | id: ', i.linnId)
FROM deleted d INNER JOIN inserted i
ON d.linnId=i.linnId;

--kontrollimiseks uuendame linna andmed
SELECT * FROM linnad;

UPDATE linnad SET linnanimi='Narva uus', rahvaarv=500
WHERE linnId=2;

SELECT * FROM linnad;
select * from logi;

--lisame kasutajaNimi logi tabelisse
ALTER TABLE logi ADD kasutaja varchar(40);

--INSERT, DELETE Triger
CREATE TRIGGER linnaLisamineKustutamine
ON linnad
FOR INSERT, DELETE
AS
BEGIN
SET NOCOUNT ON;

	INSERT INTO logi(kuupaev, andmed, kasutaja)
	SELECT
	getdate(),
	CONCAT('lisatud linn: ', inserted.linnanimi,
	' | rahvaarv: ', inserted.rahvaarv, ' | id: ', inserted.linnId),
	SYSTEM_USER
	FROM inserted

	UNION ALL

	SELECT
	getdate(),
	CONCAT('kustutatud linn: ', deleted.linnanimi,
	' | rahvaarv: ', deleted.rahvaarv, ' | id: ', deleted.linnId),
	SYSTEM_USER
	FROM deleted;
END;

--deaktiveerime linnalisamine ja linnaKustutamine
DISABLE TRIGGER linnaLisamine ON linnad;
DISABLE TRIGGER linnaKustutamine ON linnad;

--kontroll
INSERT INTO linnad (linnanimi, rahvaarv)
VALUES ('Keila34', 60000);
SELECT * FROM linnad;
SELECT * FROM logi;

DELETE FROM linnad WHERE linnId=5;

CREATE TABLE auto(
autoId int primary key identity(1,1),
autoNum varchar(6) unique,
omanik varchar(25) ,
mark varchar(25),
aasta int);

CREATE TRIGGER autoLisamine
ON auto
FOR INSERT
AS
INSERT INTO logi(kuupaev, andmed)
SELECT
getdate(),
CONCAT('lisatud auto: ', inserted.mark,
' | omanik: ', inserted.omanik, ' | aasta: ', inserted.aasta, ' | id: ', inserted.autoId)
FROM inserted;
--auto1
INSERT INTO auto (autoNum, omanik, mark, aasta)
VALUES ('123ABC', 'Ivan', 'BMW', 2020);
SELECT * FROM auto;
SELECT * FROM logi;
--auto2
INSERT INTO auto (autoNum, omanik, mark, aasta)
VALUES ('456DEF', 'Lev', 'Toyota', 2018);
SELECT * FROM auto;
SELECT * FROM logi;

CREATE TRIGGER autoKustutamine
ON auto
FOR DELETE
AS
INSERT INTO logi(kuupaev, andmed)
SELECT
getdate(),
CONCAT('kustutatud auto: ', deleted.mark,
' | omanik: ', deleted.omanik, ' | aasta: ', deleted.aasta, ' | id: ', deleted.autoId)
FROM deleted;

DELETE FROM auto
WHERE autoId=1;

SELECT * FROM auto;
SELECT * FROM logi;

CREATE TRIGGER autoUuendamine
ON auto
FOR UPDATE
AS
INSERT INTO logi(kuupaev, andmed)
SELECT
getdate(),
CONCAT('vana auto: ', d.mark,
' | ', d.omanik, ' | ', d.aasta, ' | id: ', d.autoId,
' uus auto: ', i.mark,
' | ', i.omanik, ' | ', i.aasta, ' | id: ', i.autoId)
FROM deleted d INNER JOIN inserted i
ON d.autoId=i.autoId;

UPDATE auto
SET mark='Audi', aasta=2022
WHERE autoId=2;

SELECT * FROM auto;
SELECT * FROM logi;
