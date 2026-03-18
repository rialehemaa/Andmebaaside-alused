create database Dariia;
use Dariia;
CREATE TABLE uudised(
uudisID int primary key identity(1,1),
uudisPealkiri varchar(50),
kuupaev date,
kirjeldus TEXT,
ajakirjanikID int)

CREATE TABLE ajakirjanik(
ajakirjanikID int primary key identity(1,1),
nimi varchar(50),
telefon varchar(13));


ALTER TABLE uudised ADD CONSTRAINT fk_ajakirjanik
FOREIGN KEY (ajakirjanikID)
REFERENCES ajakirjanik(ajakirjanikID);

INSERT INTO ajakirjanik(nimi,telefon)
values ('Lev','5757755874'),('Anton','57357597')

SELECT * FROM ajakirjanik;


INSERT into uudised(uudisPealkiri,kuupaev,ajakirjanikID)
values ('Homme on ises töö päev','2025-03-12',1),
('Täna on andmebaaside tund','2025-03-12',1),
('Täna on vihane ilm','2025-03-12',2)

Select * from uudised;
SELECT * FROM ajakirjanik;

--select päring 2 tabelite põhjal
SELECT * FROM uudised, ajakirjanik
WHERE uudised.ajakirjanikID=ajakirjanik.ajakirjanikID;

--alias-nimede kasutamine
SELECT * FROM uudised u, ajakirjanik a
WHERE u.ajakirjanikID=a.ajakirjanikID;

--kitsaim tulemus
SELECT u.uudisPealkiri, a.nimi
FROM uudised u, ajakirjanik a
WHERE u.ajakirjanikID=a.ajakirjanikID;

--salvestame vaade
CREATE VIEW loodudUudsed AS
SELECT u.uudisPealkiri, a.nimi
FROM uudised u,ajakirjanik a
WHERE u.ajakirjanikID=a.ajakirjanikID;

--kutsume salvestatud vaade
SELECT * From loodudUudsed;

--kasutame view tingimus ka
SELECT * From loodudUudsed
WHERE nimi Like 'Lev';

--INNER JOIN - sisemine ühendamine
SELECT u.uudisPealkiri,a.nimi as autor, kuupaev
FROM uudised as u INNER JOIN ajakirjanik as a
ON u.ajakirjanikID=a.ajakirjanikID;

CREATE VIEW kuupaevaUudised AS
SELECT u.uudisPealkiri,a.nimi as autor, kuupaev
FROM uudised as u INNER JOIN ajakirjanik as a
ON u.ajakirjanikID=a.ajakirjanikID;

--kuvame salvestatud view päring
select * from kuupaevaUudised;

select uudisPealkiri, YEAR(kuupaev) as aasta
from kuupaevaUudised;

--3.tabel
CREATE TABLE ajaleht(
ajalehtID int primary key identity(1,1),
ajalehtNimetus varchar(50));
INSERT ajaleht(ajalehtNimetus)
values ('Postimees'),('Delfi');


ALTER TABLE uudised ADD ajalehtID int;
ALTER TABLE uudised ADD constraint fk_ajaleht
FOREIGN KEY (ajalehtID) References ajaleht(ajalehtID);

UPDATE uudised SET ajalehtID=2;
SELECT * FROM ajaleht;
select * from uudised;

--select 3 tabelite põhjal
SELECT u.uudisPealkiri,a.nimi as autor,aj.ajalehtNimetus
FROM (uudised as u INNER JOIN ajakirjanik as a
ON u.ajakirjanikID=a.ajakirjanikID)
INNER JOIN ajaleht as aj
ON u.ajalehtID=aj.ajalehtID;

--loome vaade
CREATE VIEW AutoriUudisedAjalehes as
SELECT u.uudisPealkiri,a.nimi as autor,aj.ajalehtNimetus
FROM (uudised u INNER JOIN ajakirjanik a
ON u.ajakirjanikID=a.ajakirjanikID)
INNER JOIN ajaleht aj
ON u.ajalehtID=aj.ajalehtID;

--kustutame view
DROP VIEW AutoriUudisedAjalehes;

SELECT * FROM AutoriUudisedAjalehes;
Select * from uudised;

UPDATE AutoriUudisedAjalehes SET kuupaev='2026-03-18';
--viewUudisedAjakirjanikud.sql lisa Moodleesse ja github'i