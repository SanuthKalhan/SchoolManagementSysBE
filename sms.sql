-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 01, 2024 at 10:34 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'admin', '$2b$10$Jhm5PA1ShKzggRotY3RACOtjQrVDVkFmdrfAYCAMnsvV2ELWsfeLC', '2024-11-01 07:02:20', '2024-11-01 07:02:20');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `difficultyLevel` varchar(255) NOT NULL,
  `credits` int(11) NOT NULL,
  `addedDate` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `code`, `title`, `description`, `difficultyLevel`, `credits`, `addedDate`, `createdAt`, `updatedAt`) VALUES
(1, 'C001', 'Introduction to Programming', 'Learn the basics of programming.', 'Beginner', 3, '2024-11-01 08:55:36', '2024-11-01 08:55:36', '2024-11-01 08:55:36'),
(2, 'C002', 'Introduction to C++', 'Learn the basics of C++.', 'Intermediate', 4, '2024-11-01 08:59:08', '2024-11-01 08:59:08', '2024-11-01 09:04:08');

-- --------------------------------------------------------

--
-- Table structure for table `lecsubs`
--

CREATE TABLE `lecsubs` (
  `lecturerId` int(11) NOT NULL,
  `subCode` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lecturers`
--

CREATE TABLE `lecturers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `qualifications` varchar(255) NOT NULL,
  `regDate` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lecturers`
--

INSERT INTO `lecturers` (`id`, `name`, `age`, `gender`, `address`, `qualifications`, `regDate`, `createdAt`, `updatedAt`) VALUES
(1, 'Athur James', 45, 'Male', '123, sample Road, Sample', 'Diploma In Education', '2024-11-01 08:33:06', '2024-11-01 08:33:06', '2024-11-01 08:36:01'),
(2, 'Athur Coorey', 50, 'Male', '123, sample Road, Sample', 'Diploma In Education', '2024-11-01 08:34:19', '2024-11-01 08:34:19', '2024-11-01 08:34:19');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `BCURL` varchar(255) NOT NULL,
  `regDate` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `age`, `gender`, `address`, `BCURL`, `regDate`, `createdAt`, `updatedAt`) VALUES
(2, 'Aria Alex', 24, 'Female', '321, sample road, sample', '/uploads/1730448053185.pdf', '2024-11-01 08:00:53', '2024-11-01 08:00:53', '2024-11-01 08:15:39'),
(3, 'Martin Garrix', 27, 'Male', '123, tommorowland road, tommorowland', '/uploads/1730448146621.pdf', '2024-11-01 08:02:26', '2024-11-01 08:02:26', '2024-11-01 08:02:26'),
(4, 'Taylor Swift', 28, 'Female', '123, no road, no', '/uploads/1730448219922.pdf', '2024-11-01 08:03:39', '2024-11-01 08:03:39', '2024-11-01 08:03:39');

-- --------------------------------------------------------

--
-- Table structure for table `stusubs`
--

CREATE TABLE `stusubs` (
  `studentId` int(11) NOT NULL,
  `subCode` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `lecsubs`
--
ALTER TABLE `lecsubs`
  ADD PRIMARY KEY (`lecturerId`,`subCode`),
  ADD KEY `subCode` (`subCode`);

--
-- Indexes for table `lecturers`
--
ALTER TABLE `lecturers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stusubs`
--
ALTER TABLE `stusubs`
  ADD PRIMARY KEY (`studentId`,`subCode`),
  ADD KEY `subCode` (`subCode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lecturers`
--
ALTER TABLE `lecturers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lecsubs`
--
ALTER TABLE `lecsubs`
  ADD CONSTRAINT `lecsubs_ibfk_1` FOREIGN KEY (`lecturerId`) REFERENCES `lecturers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lecsubs_ibfk_2` FOREIGN KEY (`subCode`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stusubs`
--
ALTER TABLE `stusubs`
  ADD CONSTRAINT `stusubs_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stusubs_ibfk_2` FOREIGN KEY (`subCode`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
