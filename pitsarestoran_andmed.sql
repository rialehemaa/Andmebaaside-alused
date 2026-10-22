USE [pitsarestoran];
GO

-- ============================================================
-- 0) Vana sisu kustutamine (FK-de jargi) ja ID-de nullimine
--    Kui tabelites on juba andmeid, mida sa sailitada tahad, jata see plokk valja.
-- ============================================================
DELETE FROM dbo.KohaletoimetamineSet;
DELETE FROM dbo.TellimuseToodeSet;
DELETE FROM dbo.TellimusSet;
DELETE FROM dbo.KoostisosaTarnijaSet;
DELETE FROM dbo.PitsaKoostisosaSet;
DELETE FROM dbo.ToodeSet;
DELETE FROM dbo.KategooriaSet;
DELETE FROM dbo.KoostisosaSet;
DELETE FROM dbo.TarnijaSet;
DELETE FROM dbo.ametimaaratusSet;
DELETE FROM dbo.ametSet;
DELETE FROM dbo.tootajaSet;
DELETE FROM dbo.KlientSet;
DELETE FROM dbo.LaudSet;

DBCC CHECKIDENT ('dbo.KohaletoimetamineSet', RESEED, 0);
DBCC CHECKIDENT ('dbo.TellimuseToodeSet', RESEED, 0);
DBCC CHECKIDENT ('dbo.TellimusSet', RESEED, 0);
DBCC CHECKIDENT ('dbo.KoostisosaTarnijaSet', RESEED, 0);
DBCC CHECKIDENT ('dbo.PitsaKoostisosaSet', RESEED, 0);
DBCC CHECKIDENT ('dbo.ToodeSet', RESEED, 0);
DBCC CHECKIDENT ('dbo.KategooriaSet', RESEED, 0);
DBCC CHECKIDENT ('dbo.KoostisosaSet', RESEED, 0);
DBCC CHECKIDENT ('dbo.TarnijaSet', RESEED, 0);
DBCC CHECKIDENT ('dbo.ametimaaratusSet', RESEED, 0);
DBCC CHECKIDENT ('dbo.ametSet', RESEED, 0);
DBCC CHECKIDENT ('dbo.tootajaSet', RESEED, 0);
DBCC CHECKIDENT ('dbo.KlientSet', RESEED, 0);
DBCC CHECKIDENT ('dbo.LaudSet', RESEED, 0);
GO

-- ============================================================
-- 1) Tootajad, ametid, ametimaaratused
-- ============================================================
INSERT INTO dbo.tootajaSet (eesnimi, perekonnanimi, telefon) VALUES
(N'Andres',  N'Kuusk',   N'5551001'),
(N'Liisa',   N'Mets',    N'5551002'),
(N'Maksim',  N'Petrov',  N'5551003'),
(N'Kristina',N'Rebane',  N'5551004'),
(N'Taavi',   N'Sepp',    N'5551005');

INSERT INTO dbo.ametSet (nimetus, kirjeldus) VALUES
(N'Kokk',          N'Valmistab pitsasid ja muid toite'),
(N'Ettekandja',    N'Teenindab kliente saalis'),
(N'Kuller',        N'Viib tellimused koju'),
(N'Administraator',N'Juhib restorani toood ja vahetust');

-- alguskuupaev, tootaja_tootajaID, amet_ametID
-- (Liisa on algul ettekandja, hiljem administraator -> ametite ajalugu)
INSERT INTO dbo.ametimaaratusSet (alguskuupaev, tootaja_tootajaID, amet_ametID) VALUES
(N'2023-03-01', 1, 1),
(N'2022-06-15', 2, 2),
(N'2024-01-10', 3, 3),
(N'2021-09-01', 4, 4),
(N'2024-05-20', 5, 2),
(N'2025-02-01', 2, 4);

-- ============================================================
-- 2) Kategooriad, tooted
-- ============================================================
INSERT INTO dbo.KategooriaSet (nimetus, kirjeldus) VALUES
(N'Pitsad',       N'Ahjus kupsetatud pitsad'),
(N'Joogid',       N'Karastusjoogid ja vesi'),
(N'Magustoidud',  N'Magusad toidud');

-- nimetus, kirjeldus, hind, Kategooria_kategooriaID
INSERT INTO dbo.ToodeSet (nimetus, kirjeldus, hind, Kategooria_kategooriaID) VALUES
(N'Margherita',      N'Klassikaline tomati ja mozzarellaga pitsa', N'8.50',  1),
(N'Pepperoni',       N'Vurtsika pepperoni vorstiga pitsa',         N'9.90',  1),
(N'Quattro Formaggi',N'Neli juustu',                               N'11.20', 1),
(N'Coca-Cola 0.5L',  N'Karastusjook',                              N'2.50',  2),
(N'Vesi 0.5L',       N'Gaseerimata mineraalvesi',                  N'1.80',  2),
(N'Tiramisu',        N'Itaalia kohvimagustoit',                    N'4.50',  3);

-- ============================================================
-- 3) Koostisosad, pitsade koostis (Toode <-> Koostisosa)
-- ============================================================
INSERT INTO dbo.KoostisosaSet (nimetus) VALUES
(N'Tomatikaste'),   -- 1
(N'Mozzarella'),    -- 2
(N'Pepperoni vorst'),-- 3
(N'Basiilik'),      -- 4
(N'Gorgonzola'),    -- 5
(N'Parmesan'),      -- 6
(N'Cheddar'),       -- 7
(N'Pitsataigen');   -- 8

-- Toode_tooteID, Koostisosa_koostisosaID
INSERT INTO dbo.PitsaKoostisosaSet (Toode_tooteID, Koostisosa_koostisosaID) VALUES
(1, 8), (1, 1), (1, 2), (1, 4),            -- Margherita
(2, 8), (2, 1), (2, 2), (2, 3),            -- Pepperoni
(3, 8), (3, 2), (3, 5), (3, 6), (3, 7);    -- Quattro Formaggi

-- ============================================================
-- 4) Tarnijad ja nende koostisosade hinnad
-- ============================================================
INSERT INTO dbo.TarnijaSet (nimi) VALUES
(N'Eesti Juustukoda OU'),
(N'Tallinna Kook AS'),
(N'Fresh Veg OU');

-- hind, Koostisosa_koostisosaID, Tarnija_TarnijaID
INSERT INTO dbo.KoostisosaTarnijaSet (hind, Koostisosa_koostisosaID, Tarnija_TarnijaID) VALUES
(N'3.20', 2, 1),
(N'6.50', 5, 1),
(N'7.80', 6, 1),
(N'4.90', 7, 1),
(N'1.10', 1, 3),
(N'0.90', 4, 3),
(N'5.40', 3, 2),
(N'0.80', 8, 2);

-- ============================================================
-- 5) Kliendid ja lauad  (laud 5 = "kohaletoimetamine", ei ole pohjas laud)
-- ============================================================
INSERT INTO dbo.KlientSet (eesnimi, perekonnanimi, telefon) VALUES
(N'Mari',   N'Tamm',    N'5552001'),
(N'Jaan',   N'Kask',    N'5552002'),
(N'Olga',   N'Ivanova', N'5552003'),
(N'Peeter', N'Magi',    N'5552004'),
(N'Katrin', N'Saar',    N'5552005');

-- number, kohtadeArv
INSERT INTO dbo.LaudSet (number, kohtadeArv) VALUES
(N'1', N'2'),
(N'2', N'4'),
(N'3', N'4'),
(N'4', N'6'),
(N'0', N'0');

-- ============================================================
-- 6) Tellimused, tellimuse tooted, kohaletoimetamine
-- ============================================================
-- kuupaev, kellaaeg, staatus, Klient_klientID, Laud_laudID
INSERT INTO dbo.TellimusSet (kuupaev, kellaaeg, staatus, Klient_klientID, Laud_laudID) VALUES
(N'2026-10-10', N'18:30', N'valmis',         1, 2),
(N'2026-10-10', N'19:15', N'valmis',         2, 1),
(N'2026-10-11', N'12:40', N'valmis',         3, 5),
(N'2026-10-12', N'20:05', N'valmistamisel',  4, 3),
(N'2026-10-13', N'17:50', N'ootel',          5, 4),
(N'2026-10-14', N'13:20', N'valmis',         1, 5),
(N'2026-10-14', N'21:00', N't' + NCHAR(252) + N'histatud', 2, 3);

-- kogus, Toode_tooteID, Tellimus_tellimusID
INSERT INTO dbo.TellimuseToodeSet (kogus, Toode_tooteID, Tellimus_tellimusID) VALUES
(N'2', 1, 1),
(N'1', 4, 1),
(N'1', 2, 2),
(N'2', 5, 2),
(N'1', 3, 3),
(N'1', 4, 3),
(N'2', 2, 4),
(N'1', 6, 4),
(N'3', 1, 5),
(N'1', 2, 6),
(N'1', 3, 7);

-- aadress, staatus, Tellimus_tellimusID  (ainult tellimused laua 5-ga)
INSERT INTO dbo.KohaletoimetamineSet (aadress, staatus, Tellimus_tellimusID) VALUES
(N'Narva mnt 22, Tallinn', N'kohale toimetatud', 3),
(N'Tamme 12, Paide',       N'teel',               6);
GO

-- ============================================================
-- 7) Kontroll: tabelite ridade arv ja JOIN-ide test
-- ============================================================
SELECT 'tootajaSet' AS tabel, COUNT(*) AS ridu FROM dbo.tootajaSet
UNION ALL SELECT 'ametSet', COUNT(*) FROM dbo.ametSet
UNION ALL SELECT 'ametimaaratusSet', COUNT(*) FROM dbo.ametimaaratusSet
UNION ALL SELECT 'KategooriaSet', COUNT(*) FROM dbo.KategooriaSet
UNION ALL SELECT 'ToodeSet', COUNT(*) FROM dbo.ToodeSet
UNION ALL SELECT 'KoostisosaSet', COUNT(*) FROM dbo.KoostisosaSet
UNION ALL SELECT 'PitsaKoostisosaSet', COUNT(*) FROM dbo.PitsaKoostisosaSet
UNION ALL SELECT 'TarnijaSet', COUNT(*) FROM dbo.TarnijaSet
UNION ALL SELECT 'KoostisosaTarnijaSet', COUNT(*) FROM dbo.KoostisosaTarnijaSet
UNION ALL SELECT 'KlientSet', COUNT(*) FROM dbo.KlientSet
UNION ALL SELECT 'LaudSet', COUNT(*) FROM dbo.LaudSet
UNION ALL SELECT 'TellimusSet', COUNT(*) FROM dbo.TellimusSet
UNION ALL SELECT 'TellimuseToodeSet', COUNT(*) FROM dbo.TellimuseToodeSet
UNION ALL SELECT 'KohaletoimetamineSet', COUNT(*) FROM dbo.KohaletoimetamineSet;

-- Tootaja + amet
SELECT t.eesnimi, t.perekonnanimi, a.nimetus AS amet, am.alguskuupaev
FROM dbo.ametimaaratusSet am
JOIN dbo.tootajaSet t ON t.tootajaID = am.tootaja_tootajaID
JOIN dbo.ametSet a ON a.ametID = am.amet_ametID;

-- Tellimus + klient + toode
SELECT te.tellimusID, k.eesnimi, k.perekonnanimi, tt.nimetus AS toode, ttt.kogus, te.staatus
FROM dbo.TellimuseToodeSet ttt
JOIN dbo.TellimusSet te ON te.tellimusID = ttt.Tellimus_tellimusID
JOIN dbo.KlientSet k ON k.klientID = te.Klient_klientID
JOIN dbo.ToodeSet tt ON tt.tooteID = ttt.Toode_tooteID
ORDER BY te.tellimusID;
GO
