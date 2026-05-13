-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Máj 13. 09:29
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `demo`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendeles`
--

CREATE TABLE `rendeles` (
  `id` int(11) NOT NULL,
  `vasarlo_id` int(11) NOT NULL,
  `termek_id` int(11) NOT NULL,
  `datum` date DEFAULT NULL,
  `mennyiseg` int(11) DEFAULT 1 CHECK (`mennyiseg` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `rendeles`
--

INSERT INTO `rendeles` (`id`, `vasarlo_id`, `termek_id`, `datum`, `mennyiseg`) VALUES
(1, 1, 1, '2023-11-15', 1),
(2, 2, 2, '2024-01-03', 2),
(3, 3, 5, '2024-02-20', 1),
(4, 1, 3, '2024-03-05', 2),
(5, 4, 4, '2022-12-28', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `termek`
--

CREATE TABLE `termek` (
  `id` int(11) NOT NULL,
  `nev` varchar(150) NOT NULL,
  `kategoria` varchar(50) DEFAULT NULL,
  `ar` int(11) DEFAULT NULL CHECK (`ar` >= 0),
  `keszlet` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `termek`
--

INSERT INTO `termek` (`id`, `nev`, `kategoria`, `ar`, `keszlet`) VALUES
(1, 'Laptop', 'elektronika', 275000, 15),
(2, 'Egér', 'elektronika', 5500, 120),
(3, 'Vászon táska', 'ruha', 3500, 60),
(4, 'Vízforraló', 'háztartás', 12000, 40),
(5, 'Bluetooth hangszóró', 'elektronika', 19800, 25);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vasarlo`
--

CREATE TABLE `vasarlo` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telefon` varchar(30) DEFAULT NULL,
  `orszag` varchar(100) DEFAULT 'Magyarország',
  `regisztracio` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `vasarlo`
--

INSERT INTO `vasarlo` (`id`, `nev`, `email`, `telefon`, `orszag`, `regisztracio`) VALUES
(1, 'Kovács Anna', 'anna@example.com', '+36 30 123 4567', 'Magyarország', '2022-08-15'),
(2, 'Nagy Péter', 'peter@example.org', '+36 20 234 5678', 'Magyarország', '2023-01-03'),
(3, 'Szabó Eszter', 'eszter@example.hu', '+36 70 345 6789', 'Magyarország', '2024-02-20'),
(4, 'Tóth László', 'laszlo.toth@mail.com', '+36 30 987 6543', 'Magyarország', '2021-12-28'),
(5, 'Farkas Bence', 'bence.farkas@mail.hu', '+36 20 876 5432', 'Magyarország', '2024-04-11');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `rendeles`
--
ALTER TABLE `rendeles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vasarlo_id` (`vasarlo_id`),
  ADD KEY `termek_id` (`termek_id`);

--
-- A tábla indexei `termek`
--
ALTER TABLE `termek`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `vasarlo`
--
ALTER TABLE `vasarlo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `rendeles`
--
ALTER TABLE `rendeles`
  ADD CONSTRAINT `rendeles_ibfk_1` FOREIGN KEY (`vasarlo_id`) REFERENCES `vasarlo` (`id`),
  ADD CONSTRAINT `rendeles_ibfk_2` FOREIGN KEY (`termek_id`) REFERENCES `termek` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
