-- phpMyAdmin SQL Dump
-- version 4.4.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Loomise aeg: Nov 16, 2015 kell 02:02 PM
-- Serveri versioon: 5.5.46
-- PHP versioon: 5.4.43

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Andmebaas: `if15_harjutus123`
--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `kasutajad`
--

CREATE TABLE IF NOT EXISTS `kasutajad` (
  `ID` int(11) NOT NULL,
  `nimi` varchar(256) COLLATE utf8_estonian_ci NOT NULL,
  `aadress` varchar(256) COLLATE utf8_estonian_ci NOT NULL,
  `email` varchar(256) COLLATE utf8_estonian_ci NOT NULL,
  `telefon` varchar(256) COLLATE utf8_estonian_ci NOT NULL,
  `loomiskuupäev` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `kaubad`
--

CREATE TABLE IF NOT EXISTS `kaubad` (
  `hindjuurde` int(11) NOT NULL,
  `kaal` int(11) NOT NULL COMMENT 'kg',
  `nimetus` varchar(256) COLLATE utf8_estonian_ci NOT NULL,
  `pikkus` int(11) NOT NULL COMMENT 'cm',
  `laius` int(11) NOT NULL COMMENT 'cm',
  `kõrgus` int(11) NOT NULL COMMENT 'cm',
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `käibemaks`
--

CREATE TABLE IF NOT EXISTS `käibemaks` (
  `0` float NOT NULL,
  `9` float NOT NULL,
  `20` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `ladu`
--

CREATE TABLE IF NOT EXISTS `ladu` (
  `ID` int(11) NOT NULL,
  `tooteid` int(11) NOT NULL,
  `kogusladu` int(11) NOT NULL,
  `asukoht` varchar(256) COLLATE utf8_estonian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `müük`
--

CREATE TABLE IF NOT EXISTS `müük` (
  `ID` int(11) NOT NULL,
  `ostjaid` int(11) NOT NULL,
  `kogusost` int(11) NOT NULL COMMENT 'palju klient ostab'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `statistika`
--

CREATE TABLE IF NOT EXISTS `statistika` (
  `ID` int(11) NOT NULL,
  `tööalgus` datetime NOT NULL,
  `töölõpp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `tellimused`
--

CREATE TABLE IF NOT EXISTS `tellimused` (
  `ID` int(11) NOT NULL,
  `kogussisse` int(11) NOT NULL,
  `hindsisse` int(11) NOT NULL,
  `kuupäev` date DEFAULT NULL,
  `tarnija` varchar(256) COLLATE utf8_estonian_ci NOT NULL,
  `laoid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `töötajad`
--

CREATE TABLE IF NOT EXISTS `töötajad` (
  `ID` int(11) NOT NULL,
  `eesnimi` varchar(256) COLLATE utf8_estonian_ci NOT NULL,
  `perekonnanimi` varchar(256) COLLATE utf8_estonian_ci NOT NULL,
  `email` varchar(256) COLLATE utf8_estonian_ci NOT NULL,
  `telefon` varchar(256) COLLATE utf8_estonian_ci NOT NULL,
  `tööalgus` date NOT NULL,
  `palk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `kasutajad`
--
ALTER TABLE `kasutajad`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksid tabelile `kaubad`
--
ALTER TABLE `kaubad`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksid tabelile `ladu`
--
ALTER TABLE `ladu`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksid tabelile `müük`
--
ALTER TABLE `müük`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksid tabelile `statistika`
--
ALTER TABLE `statistika`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksid tabelile `tellimused`
--
ALTER TABLE `tellimused`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `laoid` (`laoid`);

--
-- Indeksid tabelile `töötajad`
--
ALTER TABLE `töötajad`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `kasutajad`
--
ALTER TABLE `kasutajad`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT tabelile `kaubad`
--
ALTER TABLE `kaubad`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT tabelile `ladu`
--
ALTER TABLE `ladu`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT tabelile `müük`
--
ALTER TABLE `müük`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT tabelile `tellimused`
--
ALTER TABLE `tellimused`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT tabelile `töötajad`
--
ALTER TABLE `töötajad`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `kasutajad`
--
ALTER TABLE `kasutajad`
  ADD CONSTRAINT `kasutajad_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `müük` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Piirangud tabelile `kaubad`
--
ALTER TABLE `kaubad`
  ADD CONSTRAINT `kaubad_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `ladu` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Piirangud tabelile `ladu`
--
ALTER TABLE `ladu`
  ADD CONSTRAINT `ladu_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `tellimused` (`laoid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Piirangud tabelile `statistika`
--
ALTER TABLE `statistika`
  ADD CONSTRAINT `statistika_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `töötajad` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
