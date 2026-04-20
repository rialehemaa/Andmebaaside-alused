create database Spordiklubi_Logimine;
use Spordiklubi_Logimine;
-- tabel liikmed
CREATE TABLE liikmed(
liigeID int primary key identity(1,1),
eesnimi varchar(50),
perekonnanimi varchar(50),
staatus varchar(20),
registreerimiskuupäev datetime
);
-- tabel logi
CREATE TABLE logi(
logiID int primary key identity(1,1),
kuupaev datetime,
andmed text,
kasutaja varchar(50)
);
-- INSERT TRIGGER
CREATE TRIGGER Lisa_liige_triger
ON liikmed
AFTER INSERT
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO 
			logi
			(
				kuupaev, 
				andmed, 
				kasutaja
			)
SELECT
    GETDATE(),
    CONCAT(
        'lisatud liige: ',
        i.eesnimi,
        ' ',
        i.perekonnanimi,
        ' | kuupaev: ',
        i.registreerimiskuupäev
    ),
    SYSTEM_USER
FROM
    inserted AS i
END
-- TEST INSERT
INSERT INTO liikmed(
    eesnimi,
    perekonnanimi,
    staatus,
    registreerimiskuupäev
)
VALUES (
    'Eduard',
    'Kotkas',
    'aktiivne',
    GETDATE()
);
SELECT * FROM liikmed;
SELECT * FROM logi;
-- UPDATE TRIGGER (staatus muutmine)
CREATE TRIGGER Uuenda_staatus_triger
ON liikmed
FOR UPDATE
AS
INSERT INTO logi(kuupaev, andmed, kasutaja)
SELECT
    GETDATE(),
    CONCAT(
        'vana staatus: ', d.staatus,
        ' | uus staatus: ', i.staatus,
        ' | liige: ', i.eesnimi, ' ', i.perekonnanimi,
        ' | id: ', i.liigeID
    ),
    SYSTEM_USER
FROM
    deleted d INNER JOIN inserted i
ON
    d.liigeID = i.liigeID;
-- kontrollimiseks uuendame liikme andmed
SELECT * FROM liikmed;
UPDATE liikmed 
SET staatus='peatatud'
WHERE liigeID=1;
SELECT * FROM liikmed;
SELECT * FROM logi;
-- õigused ainult liikmed tabelile
GRANT SELECT, INSERT
ON liikmed TO klubi_sekretar;
--GRANT SELECT
--ON liikmed TO klubi_sekretar;
--GRANT INSERT
--ON liikmed TO klubi_sekretar;
