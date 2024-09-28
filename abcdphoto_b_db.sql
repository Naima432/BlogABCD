-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 27, 2024 at 01:37 AM
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
-- Database: `abcdphoto_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `Blogs`
--

CREATE TABLE `Blogs` (
  `blog_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `event_data` date NOT NULL,
  `creation_date` datetime DEFAULT current_timestamp(),
  `modification_date` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `privacy` enum('public','private') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Blogs`
--

INSERT INTO `Blogs` (`blog_id`, `user_id`, `title`, `description`, `event_data`, `creation_date`, `modification_date`, `privacy`) VALUES
(1, 1, 'My First Blog', 'This is Neimo\'s first blog post.', '2024-09-25', '2024-09-25 18:53:39', '2024-09-25 18:53:39', 'public'),
(2, 2, 'Travel Adventures', 'Ben writes about his travel experiences.', '2024-09-24', '2024-09-25 18:53:39', '2024-09-25 18:53:39', 'private'),
(3, 3, 'My Second Blog', 'Neimo\'s second post.', '2024-09-26', '2024-09-25 18:53:39', '2024-09-25 18:53:39', 'public');

-- --------------------------------------------------------

--
-- Table structure for table `Preferences`
--

CREATE TABLE `Preferences` (
  `pref_name` varchar(100) NOT NULL,
  `pref_value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `user_id` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`user_id`, `Name`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'Neimo', 'Neimo@example.com', 'password123', 'admin', '2024-09-25 18:50:57'),
(2, 'Ben', 'Ben@example.com', 'password456', 'user', '2024-09-25 18:50:57'),
(3, 'Mohamed', 'Mohamed@example.com', 'password789', 'user', '2024-09-25 18:50:57'),
(4, 'Meng', 'meng@example.com', 'password456', 'user', '2024-09-25 18:50:57'),
(5, 'Shane', 'shane@example.com', 'password456', 'user', '2024-09-25 18:50:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Blogs`
--
ALTER TABLE `Blogs`
  ADD PRIMARY KEY (`blog_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `Preferences`
--
ALTER TABLE `Preferences`
  ADD PRIMARY KEY (`pref_name`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Blogs`
--
ALTER TABLE `Blogs`
  MODIFY `blog_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Blogs`
--
ALTER TABLE `Blogs`
  ADD CONSTRAINT `blogs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
