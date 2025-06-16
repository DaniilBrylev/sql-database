-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 17 2025 г., 00:49
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
-- База данных: `hotels`
--

-- --------------------------------------------------------

--
-- Структура таблицы `booking`
--

CREATE TABLE `booking` (
  `ID_booking` int(11) NOT NULL,
  `ID_room` int(11) DEFAULT NULL,
  `ID_customer` int(11) DEFAULT NULL,
  `check_in_date` date NOT NULL,
  `check_out_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `booking`
--

INSERT INTO `booking` (`ID_booking`, `ID_room`, `ID_customer`, `check_in_date`, `check_out_date`) VALUES
(1, 1, 1, '2025-05-01', '2025-05-05'),
(2, 2, 2, '2025-05-02', '2025-05-06'),
(3, 3, 3, '2025-05-03', '2025-05-07'),
(4, 4, 4, '2025-05-04', '2025-05-08'),
(5, 5, 5, '2025-05-05', '2025-05-09'),
(6, 6, 6, '2025-05-06', '2025-05-10'),
(7, 7, 7, '2025-05-07', '2025-05-11'),
(8, 8, 8, '2025-05-08', '2025-05-12'),
(9, 9, 9, '2025-05-09', '2025-05-13'),
(10, 10, 10, '2025-05-10', '2025-05-14'),
(11, 1, 2, '2025-05-11', '2025-05-15'),
(12, 2, 3, '2025-05-12', '2025-05-14'),
(13, 3, 4, '2025-05-13', '2025-05-15'),
(14, 4, 5, '2025-05-14', '2025-05-16'),
(15, 5, 6, '2025-05-15', '2025-05-16'),
(16, 6, 7, '2025-05-16', '2025-05-18'),
(17, 7, 8, '2025-05-17', '2025-05-21'),
(18, 8, 9, '2025-05-18', '2025-05-19'),
(19, 9, 10, '2025-05-19', '2025-05-22'),
(20, 10, 1, '2025-05-20', '2025-05-22'),
(21, 1, 2, '2025-05-21', '2025-05-23'),
(22, 2, 3, '2025-05-22', '2025-05-25'),
(23, 3, 4, '2025-05-23', '2025-05-26'),
(24, 4, 5, '2025-05-24', '2025-05-25'),
(25, 5, 6, '2025-05-25', '2025-05-27'),
(26, 6, 7, '2025-05-26', '2025-05-29');

-- --------------------------------------------------------

--
-- Структура таблицы `customer`
--

CREATE TABLE `customer` (
  `ID_customer` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `customer`
--

INSERT INTO `customer` (`ID_customer`, `name`, `email`, `phone`) VALUES
(1, 'John Doe', 'john.doe@example.com', '+1234567890'),
(2, 'Jane Smith', 'jane.smith@example.com', '+0987654321'),
(3, 'Alice Johnson', 'alice.johnson@example.com', '+1122334455'),
(4, 'Bob Brown', 'bob.brown@example.com', '+2233445566'),
(5, 'Charlie White', 'charlie.white@example.com', '+3344556677'),
(6, 'Diana Prince', 'diana.prince@example.com', '+4455667788'),
(7, 'Ethan Hunt', 'ethan.hunt@example.com', '+5566778899'),
(8, 'Fiona Apple', 'fiona.apple@example.com', '+6677889900'),
(9, 'George Washington', 'george.washington@example.com', '+7788990011'),
(10, 'Hannah Montana', 'hannah.montana@example.com', '+8899001122');

-- --------------------------------------------------------

--
-- Структура таблицы `hotel`
--

CREATE TABLE `hotel` (
  `ID_hotel` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `hotel`
--

INSERT INTO `hotel` (`ID_hotel`, `name`, `location`) VALUES
(1, 'Grand Hotel', 'Paris, France'),
(2, 'Ocean View Resort', 'Miami, USA'),
(3, 'Mountain Retreat', 'Aspen, USA'),
(4, 'City Center Inn', 'New York, USA'),
(5, 'Desert Oasis', 'Las Vegas, USA'),
(6, 'Lakeside Lodge', 'Lake Tahoe, USA'),
(7, 'Historic Castle', 'Edinburgh, Scotland'),
(8, 'Tropical Paradise', 'Bali, Indonesia'),
(9, 'Business Suites', 'Tokyo, Japan'),
(10, 'Eco-Friendly Hotel', 'Copenhagen, Denmark');

-- --------------------------------------------------------

--
-- Структура таблицы `room`
--

CREATE TABLE `room` (
  `ID_room` int(11) NOT NULL,
  `ID_hotel` int(11) DEFAULT NULL,
  `room_type` enum('Single','Double','Suite') NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `capacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `room`
--

INSERT INTO `room` (`ID_room`, `ID_hotel`, `room_type`, `price`, `capacity`) VALUES
(1, 1, 'Single', 150.00, 1),
(2, 1, 'Double', 200.00, 2),
(3, 1, 'Suite', 350.00, 4),
(4, 2, 'Single', 120.00, 1),
(5, 2, 'Double', 180.00, 2),
(6, 2, 'Suite', 300.00, 4),
(7, 3, 'Double', 250.00, 2),
(8, 3, 'Suite', 400.00, 4),
(9, 4, 'Single', 100.00, 1),
(10, 4, 'Double', 150.00, 2),
(11, 5, 'Single', 90.00, 1),
(12, 5, 'Double', 140.00, 2),
(13, 6, 'Suite', 280.00, 4),
(14, 7, 'Double', 220.00, 2),
(15, 8, 'Single', 130.00, 1),
(16, 8, 'Double', 190.00, 2),
(17, 9, 'Suite', 360.00, 4),
(18, 10, 'Single', 110.00, 1),
(19, 10, 'Double', 160.00, 2);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`ID_booking`),
  ADD KEY `ID_room` (`ID_room`),
  ADD KEY `ID_customer` (`ID_customer`);

--
-- Индексы таблицы `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID_customer`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Индексы таблицы `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`ID_hotel`);

--
-- Индексы таблицы `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`ID_room`),
  ADD KEY `ID_hotel` (`ID_hotel`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`ID_room`) REFERENCES `room` (`ID_room`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`ID_customer`) REFERENCES `customer` (`ID_customer`);

--
-- Ограничения внешнего ключа таблицы `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`ID_hotel`) REFERENCES `hotel` (`ID_hotel`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
