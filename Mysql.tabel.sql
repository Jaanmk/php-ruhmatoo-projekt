-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: d49803.mysql.zone.ee
-- Loomise aeg: Nov 16, 2015 kell 02:56 PM
-- Serveri versioon: 10.0.22-MariaDB-log
-- PHP versioon: 5.5.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Andmebaas: `d49803sd107026`
--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `merchandise`
--

CREATE TABLE `merchandise` (
  `price_added` int(11) NOT NULL,
  `item_weight` int(11) NOT NULL COMMENT 'kg',
  `item_name` varchar(256) COLLATE utf8_estonian_ci NOT NULL,
  `item_length` int(11) NOT NULL COMMENT 'cm',
  `item_height` int(11) NOT NULL COMMENT 'cm',
  `item_width` int(11) NOT NULL COMMENT 'cm',
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `orders`
--

CREATE TABLE `orders` (
  `ID` int(11) NOT NULL,
  `items_in` int(11) NOT NULL,
  `price_in` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `supplier` varchar(256) COLLATE utf8_estonian_ci NOT NULL,
  `storage_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `sales`
--

CREATE TABLE `sales` (
  `ID` int(11) NOT NULL,
  `buyierid` int(11) NOT NULL,
  `ammountbought` int(11) NOT NULL COMMENT 'palju klient ostab'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `statistics`
--

CREATE TABLE `statistics` (
  `ID` int(11) NOT NULL,
  `workdaybeginning` datetime NOT NULL,
  `workdayend` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `storage`
--

CREATE TABLE `storage` (
  `ID` int(11) NOT NULL,
  `merchandiseid` int(11) NOT NULL,
  `noinstorage` int(11) NOT NULL,
  `location` varchar(256) COLLATE utf8_estonian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `first_name` varchar(256) COLLATE utf8_estonian_ci NOT NULL,
  `address` varchar(256) COLLATE utf8_estonian_ci NOT NULL,
  `email` varchar(256) COLLATE utf8_estonian_ci NOT NULL,
  `phonenr` varchar(256) COLLATE utf8_estonian_ci NOT NULL,
  `creation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `VAT`
--

CREATE TABLE `VAT` (
  `0` float NOT NULL,
  `9` float NOT NULL,
  `20` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `workers`
--

CREATE TABLE `workers` (
  `ID` int(11) NOT NULL,
  `firstname` varchar(256) COLLATE utf8_estonian_ci NOT NULL,
  `lastname` varchar(256) COLLATE utf8_estonian_ci NOT NULL,
  `email` varchar(256) COLLATE utf8_estonian_ci NOT NULL,
  `phonenr` varchar(256) COLLATE utf8_estonian_ci NOT NULL,
  `workbeginning` date NOT NULL,
  `palk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `merchandise`
--
ALTER TABLE `merchandise`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksid tabelile `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `laoid` (`storage_id`);

--
-- Indeksid tabelile `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksid tabelile `statistics`
--
ALTER TABLE `statistics`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksid tabelile `storage`
--
ALTER TABLE `storage`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksid tabelile `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksid tabelile `workers`
--
ALTER TABLE `workers`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `merchandise`
--
ALTER TABLE `merchandise`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT tabelile `orders`
--
ALTER TABLE `orders`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT tabelile `sales`
--
ALTER TABLE `sales`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT tabelile `storage`
--
ALTER TABLE `storage`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT tabelile `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT tabelile `workers`
--
ALTER TABLE `workers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `merchandise`
--
ALTER TABLE `merchandise`
  ADD CONSTRAINT `merchandise_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `storage` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Piirangud tabelile `statistics`
--
ALTER TABLE `statistics`
  ADD CONSTRAINT `statistics_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `workers` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Piirangud tabelile `storage`
--
ALTER TABLE `storage`
  ADD CONSTRAINT `storage_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `orders` (`storage_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Piirangud tabelile `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `sales` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
