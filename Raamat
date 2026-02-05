
CREATE DATABASE raamatDariia;
use Dariia;

-- tabeli zanr loomine
CREATE TABLE zanr(
zanrID int PRIMARY KEY identity(1,1),
zanrNimetus varchar(50) not null,
kirjeldus TEXT
);
SELECT * from zanr;
-- tabeli täitmine
INSERT INTO zanr(zanrNimetus, kirjeldus)
VALUES ('komöödia', 'kõige parim zanr maailmas minu arvates'),
('detektiiv', 'detektiiv zanr keskendub kangelastele'),
('romaantika', 'see on romaantika zanr'),
('draama', 'tõsise konflikti ja tugevate emotsioonidega mängufilm');

-- tabeli autor loomine
CREATE TABLE autor(
autorID int PRIMARY KEY identity(1,1),
eesnimi varchar(50),
perenimi varchar(50) not null,
synniaasta int check(synniaasta > 1900),
elukoht varchar(30)
);
SELECT * FROM autor;
-- tabeli autor täitmine
INSERT INTO autor(eesnimi, perenimi, synniaasta)
VALUES
('Jaan', 'Kross', 1920),
('Ene', 'Mihkelson', 1944),
('Viivi', 'Luinik', 1946),
('Andrus', 'Kivirähk', 1970),
('Tõnu', 'Õnnepalu', 1962);

-- tabeli uuendamine
UPDATE autor SET elukoht='Tallinn';

-- kustutamine tabelist
DELETE FROM autor WHERE autorID=1;

-- tabeli raamat loomine
CREATE TABLE raamat(
raamatID int PRIMARY KEY identity(1,1),
raamatNimetus varchar(100) UNIQUE,
lk int,
autorID int,
FOREIGN KEY (autorID) REFERENCES autor(autorID),
zanrID int,
FOREIGN KEY (zanrID) REFERENCES zanr(zanrID),
);

--drop table raamat;

SELECT * FROM autor;
SELECT * FROM zanr;

INSERT INTO raamat(raamatNimetus, lk, autorID, zanrID)
VALUES ('Oskar ja asjad', 200,2,3);

Select * FROM raamat;

