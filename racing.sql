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
-- База данных: `racing`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cars`
--

CREATE TABLE `cars` (
  `name` varchar(100) NOT NULL,
  `class` varchar(100) NOT NULL,
  `year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `cars`
--

INSERT INTO `cars` (`name`, `class`, `year`) VALUES
('Audi A4', 'Sedan', 2018),
('BMW 3 Series', 'Sedan', 2019),
('Chevrolet Camaro', 'Coupe', 2021),
('Ferrari 488', 'Convertible', 2019),
('Ford F-150', 'Pickup', 2021),
('Ford Mustang', 'SportsCar', 2020),
('Mercedes-Benz S-Class', 'Luxury Sedan', 2022),
('Nissan Rogue', 'SUV', 2020),
('Renault Clio', 'Hatchback', 2020),
('Toyota RAV4', 'SUV', 2021);

-- --------------------------------------------------------

--
-- Структура таблицы `classes`
--

CREATE TABLE `classes` (
  `class` varchar(100) NOT NULL,
  `type` enum('Racing','Street') NOT NULL,
  `country` varchar(100) NOT NULL,
  `numDoors` int(11) NOT NULL,
  `engineSize` decimal(3,1) NOT NULL,
  `weight` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `classes`
--

INSERT INTO `classes` (`class`, `type`, `country`, `numDoors`, `engineSize`, `weight`) VALUES
('Convertible', 'Racing', 'Italy', 2, 3.0, 1300),
('Coupe', 'Street', 'USA', 2, 2.5, 1400),
('Hatchback', 'Street', 'France', 5, 1.6, 1100),
('Luxury Sedan', 'Street', 'Germany', 4, 3.0, 1600),
('Pickup', 'Street', 'USA', 2, 2.8, 2000),
('Sedan', 'Street', 'Germany', 4, 2.0, 1200),
('SportsCar', 'Racing', 'USA', 2, 3.5, 1500),
('SUV', 'Street', 'Japan', 4, 2.5, 1800);

-- --------------------------------------------------------

--
-- Структура таблицы `races`
--

CREATE TABLE `races` (
  `name` varchar(100) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `races`
--

INSERT INTO `races` (`name`, `date`) VALUES
('Bathurst 1000', '2023-10-08'),
('Daytona 500', '2023-02-19'),
('Indy 500', '2023-05-28'),
('Le Mans', '2023-06-10'),
('Monaco Grand Prix', '2023-05-28'),
('Nürburgring 24 Hours', '2023-06-17'),
('Pikes Peak International Hill Climb', '2023-06-25'),
('Spa 24 Hours', '2023-07-29');

-- --------------------------------------------------------

--
-- Структура таблицы `results`
--

CREATE TABLE `results` (
  `car` varchar(100) NOT NULL,
  `race` varchar(100) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `results`
--

INSERT INTO `results` (`car`, `race`, `position`) VALUES
('Audi A4', 'Nürburgring 24 Hours', 8),
('BMW 3 Series', 'Le Mans', 3),
('Chevrolet Camaro', 'Monaco Grand Prix', 4),
('Ferrari 488', 'Le Mans', 1),
('Ford F-150', 'Bathurst 1000', 6),
('Ford Mustang', 'Indy 500', 1),
('Mercedes-Benz S-Class', 'Spa 24 Hours', 2),
('Nissan Rogue', 'Pikes Peak International Hill Climb', 3),
('Renault Clio', 'Daytona 500', 5),
('Toyota RAV4', 'Monaco Grand Prix', 2);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`name`),
  ADD KEY `class` (`class`);

--
-- Индексы таблицы `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`class`);

--
-- Индексы таблицы `races`
--
ALTER TABLE `races`
  ADD PRIMARY KEY (`name`);

--
-- Индексы таблицы `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`car`,`race`),
  ADD KEY `race` (`race`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`class`) REFERENCES `classes` (`class`);

--
-- Ограничения внешнего ключа таблицы `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_ibfk_1` FOREIGN KEY (`car`) REFERENCES `cars` (`name`),
  ADD CONSTRAINT `results_ibfk_2` FOREIGN KEY (`race`) REFERENCES `races` (`name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
