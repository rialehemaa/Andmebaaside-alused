-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Aprill 20, 2026 kell 10:34 EL
-- Serveri versioon: 10.4.32-MariaDB
-- PHP versioon: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Andmebaas: `spordiklubi_logimine`
--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `liikmed`
--

CREATE TABLE `liikmed` (
  `liigeID` int(11) NOT NULL,
  `eesnimi` varchar(50) DEFAULT NULL,
  `perekonnanimi` varchar(50) DEFAULT NULL,
  `staatus` varchar(20) DEFAULT NULL,
  `registreerimiskuupäev` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `liikmed`
--

INSERT INTO `liikmed` (`liigeID`, `eesnimi`, `perekonnanimi`, `staatus`, `registreerimiskuupäev`) VALUES
(1, 'Eduard', 'Kotkas', 'peatatud', '2026-04-20 11:24:39');

--
-- Päästikud `liikmed`
--
DELIMITER $$
CREATE TRIGGER `Lisa_liige_triger` AFTER INSERT ON `liikmed` FOR EACH ROW INSERT INTO logi(kuupaev, andmed, kasutaja)
VALUES (
    NOW(),
    CONCAT(
        'lisatud liige: ',
        NEW.eesnimi,
        ' ',
        NEW.perekonnanimi,
        ' | kuupaev: ',
        NEW.registreerimiskuupäev
    ),
    USER()
)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Uuenda_staatus_triger` AFTER UPDATE ON `liikmed` FOR EACH ROW INSERT INTO logi(kuupaev, andmed, kasutaja)
VALUES (
    NOW(),
    CONCAT(
        'vana staatus: ', OLD.staatus,
        ' | uus staatus: ', NEW.staatus,
        ' | liige: ', NEW.eesnimi, ' ', NEW.perekonnanimi,
        ' | id: ', NEW.liigeID
    ),
    USER()
)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `logi`
--

CREATE TABLE `logi` (
  `logiID` int(11) NOT NULL,
  `kuupaev` datetime DEFAULT NULL,
  `andmed` text DEFAULT NULL,
  `kasutaja` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `logi`
--

INSERT INTO `logi` (`logiID`, `kuupaev`, `andmed`, `kasutaja`) VALUES
(1, '2026-04-20 11:24:39', 'lisatud liige: Eduard Kotkas | kuupaev: 2026-04-20 11:24:39', 'root@localhost'),
(2, '2026-04-20 11:27:02', 'vana staatus: aktiivne | uus staatus: peatatud | liige: Eduard Kotkas | id: 1', 'root@localhost');

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `liikmed`
--
ALTER TABLE `liikmed`
  ADD PRIMARY KEY (`liigeID`);

--
-- Indeksid tabelile `logi`
--
ALTER TABLE `logi`
  ADD PRIMARY KEY (`logiID`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `liikmed`
--
ALTER TABLE `liikmed`
  MODIFY `liigeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT tabelile `logi`
--
ALTER TABLE `logi`
  MODIFY `logiID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
