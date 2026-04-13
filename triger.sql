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
