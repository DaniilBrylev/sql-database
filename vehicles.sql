-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 17 2025 г., 00:51
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `vehicles`
--

-- --------------------------------------------------------

--
-- Структура таблицы `bicycle`
--

CREATE TABLE `bicycle` (
  `serial_number` varchar(20) NOT NULL,
  `model` varchar(100) NOT NULL,
  `gear_count` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `type` enum('Mountain','Road','Hybrid') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `bicycle`
--

INSERT INTO `bicycle` (`serial_number`, `model`, `gear_count`, `price`, `type`) VALUES
('SN123456789', 'Domane', 22, 3500.00, 'Road'),
('SN456789123', 'Stumpjumper', 30, 4000.00, 'Mountain'),
('SN987654321', 'Defy', 20, 3000.00, 'Road');

-- --------------------------------------------------------

--
-- Структура таблицы `car`
--

CREATE TABLE `car` (
  `vin` varchar(17) NOT NULL,
  `model` varchar(100) NOT NULL,
  `engine_capacity` decimal(4,2) NOT NULL,
  `horsepower` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `transmission` enum('Automatic','Manual') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `car`
--

INSERT INTO `car` (`vin`, `model`, `engine_capacity`, `horsepower`, `price`, `transmission`) VALUES
('1FA6P8CF0J1234567', 'Mustang', 5.00, 450, 55000.00, 'Automatic'),
('1HGCM82633A123456', 'Camry', 2.50, 203, 24000.00, 'Automatic'),
('2HGFG3B53GH123456', 'Civic', 2.00, 158, 22000.00, 'Manual');

-- --------------------------------------------------------

--
-- Структура таблицы `motorcycle`
--

CREATE TABLE `motorcycle` (
  `vin` varchar(17) NOT NULL,
  `model` varchar(100) NOT NULL,
  `engine_capacity` decimal(4,2) NOT NULL,
  `horsepower` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `type` enum('Sport','Cruiser','Touring') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `motorcycle`
--

INSERT INTO `motorcycle` (`vin`, `model`, `engine_capacity`, `horsepower`, `price`, `type`) VALUES
('1HD1ZK3158K123456', 'Sportster', 1.20, 70, 12000.00, 'Cruiser'),
('JKBVNAF156A123456', 'Ninja', 0.90, 150, 14000.00, 'Sport'),
('JYARN28E9FA123456', 'YZF-R1', 1.00, 200, 17000.00, 'Sport');

-- --------------------------------------------------------

--
-- Структура таблицы `vehicle`
--

CREATE TABLE `vehicle` (
  `maker` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `type` enum('Car','Motorcycle','Bicycle') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `vehicle`
--

INSERT INTO `vehicle` (`maker`, `model`, `type`) VALUES
('Toyota', 'Camry', 'Car'),
('Honda', 'Civic', 'Car'),
('Giant', 'Defy', 'Bicycle'),
('Trek', 'Domane', 'Bicycle'),
('Ford', 'Mustang', 'Car'),
('Kawasaki', 'Ninja', 'Motorcycle'),
('Harley-Davidson', 'Sportster', 'Motorcycle'),
('Specialized', 'Stumpjumper', 'Bicycle'),
('Yamaha', 'YZF-R1', 'Motorcycle');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `bicycle`
--
ALTER TABLE `bicycle`
  ADD PRIMARY KEY (`serial_number`),
  ADD KEY `model` (`model`);

--
-- Индексы таблицы `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`vin`),
  ADD KEY `model` (`model`);

--
-- Индексы таблицы `motorcycle`
--
ALTER TABLE `motorcycle`
  ADD PRIMARY KEY (`vin`),
  ADD KEY `model` (`model`);

--
-- Индексы таблицы `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`model`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `bicycle`
--
ALTER TABLE `bicycle`
  ADD CONSTRAINT `bicycle_ibfk_1` FOREIGN KEY (`model`) REFERENCES `vehicle` (`model`);

--
-- Ограничения внешнего ключа таблицы `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`model`) REFERENCES `vehicle` (`model`);

--
-- Ограничения внешнего ключа таблицы `motorcycle`
--
ALTER TABLE `motorcycle`
  ADD CONSTRAINT `motorcycle_ibfk_1` FOREIGN KEY (`model`) REFERENCES `vehicle` (`model`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
