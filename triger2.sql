create database trigerKlimuk;
use trigerKlimuk;

--tabel linnad
CREATE TABLE linnad(
linnId int primary key identity(1,1),
linnanimi varchar(50) unique,
rahvaarv int not null
);

--tabel logi
CREATE TABLE logi(
Id int primary key identity(1,1),
kuupaev datetime,
andmed TEXT,
kasutaja varchar(25));

-- tabel maakonnad
CREATE TABLE maakonnad(
maakondId int primary key identity(1,1),
maakondNimi varchar(25) UNIQUE
);

-- foreign key tabelis linnad
ALTER TABLE linnad ADD maakondId int;
SELECT * FROM linnad;
ALTER TABLE linnad ADD CONSTRAINT fk_maakond
FOREIGN KEY (maakondId) REFERENCES maakonnad(maakondId);

-- täidame tabelid
-- maakonnad
INSERT INTO maakonnad
VALUES ('Harjumaa'), ('Pärnumaa'), ('Virumaa');

Select * from maakonnad;

INSERT INTO linnad (linnanimi, rahvaarv, maakondId)
VALUES ('Tallinn', 600000, 1), ('Rakvere', 150000, 3);

Select * from linnad, maakonnad
WHERE linnad.maakondId=maakonnad.maakondId;


-- sama päring inner join iga
Select * from linnad inner join maakonnad
ON linnad.maakondId=maakonnad.maakondId;

-- triger, mis jälgib andmete lisamine seotud tabelite põhjal
CREATE TRIGGER linnaLisamine
ON linnad
FOR INSERT
AS
INSERT INTO logi(kuupaev, andmed, kasutaja)
SELECT
    GETDATE(),
    CONCAT('lisatud linn: ', inserted.linnanimi, ' , ', inserted.rahvaarv, ' , ', m.maakondNimi),
    SYSTEM_USER
FROM inserted INNER JOIN maakonnad m
ON inserted.maakondId=m.maakondId;

-- kontroll
INSERT INTO linnad (linnanimi, rahvaarv, maakondId)
VALUES ('Pärnu', 100000, 2);

select * from logi;
select * from linnad;

-- triger mis jälgib andmete kustutamine seotud tabelite põhjal
CREATE TRIGGER linnaKustutamine
ON linnad
FOR DELETE
AS
INSERT INTO logi(kuupaev, andmed, kasutaja)
SELECT
    GETDATE(),
    CONCAT('kustutatud linn: ', deleted.linnanimi, ' , ', deleted.rahvaarv, ' , ', m.maakondNimi),
    SYSTEM_USER
FROM deleted INNER JOIN maakonnad m
ON deleted.maakondId=m.maakondId;

-- kontroll
DELETE FROM linnad WHERE linnId=1;

SELECT * FROM logi;

DROP TRIGGER linnaKustutamine;

-- trigger, mis jälgib andmete uuendamine kahes tabelis
CREATE TRIGGER linnaUuendamine
ON linnad
FOR UPDATE
AS
INSERT INTO logi(kuupaev, andmed, kasutaja)
SELECT
getdate(),
CONCAT(
'vana linna andmed : ',deleted.linnanimi, ', ', deleted.rahvaarv, ', ', m1.maakondNimi,
' | uue linna andmed : ',inserted.linnanimi, ', ', inserted.rahvaarv, ', ', m2.maakondNimi),
SYSTEM_USER
FROM deleted
INNER JOIN inserted ON deleted.linnId=inserted.linnId
INNER JOIN maakonnad m1 ON deleted.maakondId=m1.maakondId
INNER JOIN maakonnad m2 ON inserted.maakondId=m2.maakondId
;

DROP TRIGGER linnaUuendamine;

-- kontroll
SELECT * FROM linnad;
SELECT * FROM maakonnad;

UPDATE linnad SET maakondId=1 WHERE linnId=5;

SELECT * FROM logi;

UPDATE linnad SET maakondId=1, linnanimi='uus Paide' WHERE linnId=5;
