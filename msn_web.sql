-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 28, 2023 at 10:34 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `msn_web`
--

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--

CREATE TABLE `scores` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `emotion` varchar(255) DEFAULT NULL,
  `created` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `scores`
--

INSERT INTO `scores` (`id`, `name`, `score`, `emotion`, `created`) VALUES
(1, 'Kevin', 80, 'Happy', '2020-02-20'),
(2, 'Josh', 90, 'Sad', '2020-02-20'),
(3, 'Kevin', 85, 'Happy', '2020-02-20'),
(4, 'Kevin', 75, 'Sad', '2020-02-20'),
(5, 'Josh', 65, 'Angry', '2020-02-20'),
(6, 'David', 85, 'Happy', '2020-02-21'),
(7, 'Josh', 90, 'Sad', '2020-02-21'),
(8, 'David', 75, 'Sad', '2020-02-21'),
(9, 'Josh', 85, 'Sad', '2020-02-21'),
(10, 'Josh', 70, 'Happy', '2020-02-21'),
(11, 'Kevin', 80, 'Sad', '2020-02-21'),
(12, 'Kevin', 73, 'Sad', '2020-02-22'),
(13, 'Kevin', 75, 'Angry', '2020-02-22'),
(14, 'David', 82, 'Sad', '2020-02-22'),
(15, 'David', 65, 'Sad', '2020-02-22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `age`) VALUES
(1, 'john_doe', 'hashed_password_1', 30),
(2, 'jane_smith', 'hashed_password_2', 28),
(3, 'mike_jackson', 'hashed_password_3', 35),
(4, 'sarah_williams', 'hashed_password_4', 32),
(5, 'david_miller', 'hashed_password_5', 29),
(6, 'perdianto27', '$2a$10$443/DryONg5uP4ZScohLZO4ucvCi.4kWr/YZ9PSzHMgO/n.ToUbSS', 25),
(7, 'perdianto27', '$2a$10$hBfBALGRjZO78t4M1C/1aOrdiZENZNdvhy9hy4TVCdL0RtbW0JiCe', 25);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `scores`
--
ALTER TABLE `scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
