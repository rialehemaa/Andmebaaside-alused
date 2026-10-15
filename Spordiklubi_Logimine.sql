CREATE DATABASE Spordiklubi_Logimine;
USE Spordiklubi_Logimine;

-- tabel liikmed
CREATE TABLE liikmed(
    liigeID INT PRIMARY KEY IDENTITY(1,1),
    eesnimi VARCHAR(50),
    perekonnanimi VARCHAR(50),
    staatus VARCHAR(20),
    registreerimiskuupäev DATETIME
);

-- tabel logi
CREATE TABLE logi(
    logiID INT PRIMARY KEY IDENTITY(1,1),
    kuupaev DATETIME,
    andmed TEXT,
    kasutaja VARCHAR(50)
);

-- tabel treenerid (teine tabel)
CREATE TABLE treenerid(
    treenerID INT PRIMARY KEY IDENTITY(1,1),
    treenerNimi VARCHAR(50)
);

-- liisame foreign key в liikmed
ALTER TABLE liikmed ADD treenerID INT;

ALTER TABLE liikmed ADD CONSTRAINT fk_treener
FOREIGN KEY (treenerID) REFERENCES treenerid(treenerID);

-- insert treenerid
INSERT INTO treenerid
VALUES ('Treener Ivan'), ('Treener Anna'), ('Treener Mark');

SELECT * FROM treenerid;

-- INSERT LISAMINE TRIGGER
CREATE TRIGGER Lisa_liige_triger
ON liikmed
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO logi(kuupaev, andmed, kasutaja)
    SELECT
        GETDATE(),
        CONCAT(
            'lisatud liige: ',i.eesnimi,
            ' ', i.perekonnanimi,
            ' | treener: ', t.treenerNimi,
            ' | kuupaev: ', i.registreerimiskuupäev
        ),
        SYSTEM_USER
    FROM inserted i
    INNER JOIN treenerid t
        ON i.treenerID = t.treenerID;
END;

-- Andmete lisamine
INSERT INTO liikmed(
    eesnimi,
    perekonnanimi,
    staatus,
    registreerimiskuupäev,
    treenerID
)
VALUES (
    'Karl',
    'Petrov',
    'aktiivne',
    GETDATE(),
    1
);

SELECT * FROM liikmed;
SELECT * FROM logi;


-- INSERT KUSTUTAMINE TRIGGER
CREATE TRIGGER LiigeKustutamine
ON liikmed
FOR DELETE
AS
INSERT INTO logi(kuupaev, andmed, kasutaja)
SELECT
    GETDATE(),
    CONCAT(
        'kustutatud liige: ',
        d.eesnimi, ' ', d.perekonnanimi,
        ' | treener: ', t.treenerNimi
    ),
    SYSTEM_USER
FROM deleted d
INNER JOIN treenerid t
    ON d.treenerID = t.treenerID;

-- kustutamine prov test
DELETE FROM liikmed WHERE liigeID=1;

SELECT * FROM liikmed;
SELECT * FROM logi;

-- INSERT UPDATE TRIGGER
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
        ' | vana treener: ', t1.treenerNimi,
        ' | uus treener: ', t2.treenerNimi
    ),
    SYSTEM_USER
FROM deleted d
INNER JOIN inserted i
    ON d.liigeID = i.liigeID
INNER JOIN treenerid t1
    ON d.treenerID = t1.treenerID
INNER JOIN treenerid t2
    ON i.treenerID = t2.treenerID;

UPDATE liikmed
SET staatus='peatatud', treenerID=3
WHERE liigeID=2;

SELECT * FROM liikmed;
SELECT * FROM logi;

-- õigused ainult liikmed tabelile
GRANT SELECT, INSERT
ON liikmed TO klubi_sekretar;

-- alternatiivne variant
-- GRANT SELECT ON liikmed TO klubi_sekretar;
-- GRANT INSERT ON liikmed TO klubi_sekretar;