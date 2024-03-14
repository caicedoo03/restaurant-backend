-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2024 at 04:42 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `housekeeping`
--

-- --------------------------------------------------------

--
-- Table structure for table `absences`
--

CREATE TABLE `absences` (
  `id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `init_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `justification` varchar(200) DEFAULT NULL,
  `state` tinyint(1) NOT NULL,
  `employees_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `created_user` varchar(60) DEFAULT NULL,
  `updated_user` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `costs_fields`
--

CREATE TABLE `costs_fields` (
  `id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `state` int(11) NOT NULL,
  `description` varchar(60) NOT NULL,
  `prices` double NOT NULL,
  `created_user` varchar(60) DEFAULT NULL,
  `updated_user` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `costs_fields`
--

INSERT INTO `costs_fields` (`id`, `created_at`, `updated_at`, `state`, `description`, `prices`, `created_user`, `updated_user`) VALUES
(1, '2024-02-11 12:35:47', '2024-02-11 12:35:47', 1, 'Room', 250, '', ''),
(2, '2024-02-11 12:36:22', '2024-02-11 12:36:22', 1, 'Bathroom', 180, '', ''),
(3, '2024-02-11 12:36:38', '2024-02-11 12:39:16', 1, 'Public areas', 265, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` int(11) NOT NULL,
  `subject` varchar(40) NOT NULL,
  `description` varchar(300) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `state` tinyint(4) NOT NULL,
  `employees_id` int(11) NOT NULL,
  `created_user` varchar(60) DEFAULT NULL,
  `updated_user` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `first_name` varchar(60) NOT NULL,
  `last_name` varchar(60) NOT NULL,
  `birthday` date NOT NULL,
  `phone` varchar(15) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `postcode` varchar(60) NOT NULL,
  `beneficiary` varchar(60) NOT NULL,
  `account_number` varchar(15) NOT NULL,
  `sort_code` varchar(10) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(150) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `roll` int(11) NOT NULL,
  `created_user` varchar(60) DEFAULT NULL,
  `updated_user` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `first_name`, `last_name`, `birthday`, `phone`, `photo`, `postcode`, `beneficiary`, `account_number`, `sort_code`, `state`, `email`, `password`, `created_at`, `updated_at`, `roll`, `created_user`, `updated_user`) VALUES
(1, 'Daniel', 'Caicedo Mosquera', '1995-03-31', '07739444700', '', 'N15 4AR', 'E Caicedo Mosquera', '48545489', '20-04-40', 1, 'caicedo@hotmail.com', '$2y$12$rVppcT2x/kjuMMYYg.widOCE.iRQa3.ndKGCmg7KVn71.8FqQTeUe', '2024-03-02 01:49:27', '2024-03-02 01:49:27', 0, NULL, NULL),
(2, 'Maria Fernanda', 'Catano Cadavid', '1988-04-25', '74589632', '9eROR7Roydf6RyX64bTiWkwTY5u8AM18.jpg', 'N17 54R', 'M Fernanda Catano', '4578965', '20-04-20', 1, 'fernanda@gmail.com', '$2y$12$AKY1tKo4HdnjR7oUtIDrrO6nel/.qINWKi23XvJrncoWOhFt91jve', '2024-03-02 00:52:35', '2024-03-02 00:52:35', 1, NULL, NULL),
(6, 'Steven', 'Lozano', '1988-04-25', '74589632', 'JLTX6mhrBOyUlhMUNEuG1LIe2igHu0bd.jpg', 'Calle 34b #55-58', 'S Lozano', '4578965', '20-04-20', 1, 'steven@gmail.com', '$2y$12$yE4Ok29i2kyNPHx6POjxn.a7BRow1Tqb8XD0IN8A.jNsn3pQvflQe', '2024-03-02 03:27:25', '2024-03-02 03:27:25', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `floors`
--

CREATE TABLE `floors` (
  `id` int(11) NOT NULL,
  `floor` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `state` tinyint(1) NOT NULL,
  `has_storage` tinyint(1) NOT NULL,
  `hotels_id` int(11) NOT NULL,
  `created_user` varchar(60) DEFAULT NULL,
  `updated_user` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `floors`
--

INSERT INTO `floors` (`id`, `floor`, `updated_at`, `created_at`, `state`, `has_storage`, `hotels_id`, `created_user`, `updated_user`) VALUES
(1, 1, '2024-02-11 13:29:05', '2024-02-11 13:29:05', 1, 1, 1, '', ''),
(2, 2, '2024-02-11 13:29:19', '2024-02-11 13:29:19', 1, 1, 1, '', ''),
(3, 3, '2024-02-11 13:32:53', '2024-02-11 13:29:25', 1, 1, 1, '', ''),
(4, 4, '2024-02-11 13:33:08', '2024-02-11 13:29:32', 1, 1, 1, '', ''),
(5, 5, '2024-02-11 13:35:53', '2024-02-11 13:29:53', 1, 1, 1, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` int(11) NOT NULL,
  `init_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `state` tinyint(1) NOT NULL,
  `employees_id` int(11) NOT NULL,
  `created_user` varchar(60) DEFAULT NULL,
  `updated_user` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `postcode` varchar(60) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `hotels_groups_id` int(11) NOT NULL,
  `created_user` varchar(60) DEFAULT NULL,
  `updated_user` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`id`, `name`, `postcode`, `state`, `created_at`, `updated_at`, `hotels_groups_id`, `created_user`, `updated_user`) VALUES
(1, 'Hilton London Kensington', '179-199 Holland Park Ave, London W11 4UL', 1, '2024-01-28 21:27:26', '2024-01-28 21:27:26', 1, '', ''),
(2, 'Hilton London Metropole', '225 Edgware Rd, London W2 1JU', 1, '2024-01-28 21:28:30', '2024-01-29 22:24:03', 1, '', ''),
(3, 'Hilton London Metropoles', '225 Edgware Rd, London W2 1JU', 1, '2024-01-29 22:09:47', '2024-02-03 18:01:47', 1, '', ''),
(4, 'The Beaufort Hotel', '33 Beaufort Gardens, London SW3 1PP', 1, '2024-02-03 19:08:29', '2024-02-03 19:16:41', 2, '', ''),
(7, 'ss', 'asdasd', 1, '2024-02-05 21:23:41', '2024-02-05 21:26:46', 2, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `hotels_employees`
--

CREATE TABLE `hotels_employees` (
  `id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `employees_id` int(11) NOT NULL,
  `hotels_id` int(11) NOT NULL,
  `state` tinyint(4) NOT NULL,
  `created_user` varchar(60) DEFAULT NULL,
  `updated_user` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hotels_groups`
--

CREATE TABLE `hotels_groups` (
  `id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `state` tinyint(1) NOT NULL,
  `name` varchar(60) NOT NULL,
  `created_user` varchar(60) DEFAULT NULL,
  `updated_user` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotels_groups`
--

INSERT INTO `hotels_groups` (`id`, `created_at`, `updated_at`, `state`, `name`, `created_user`, `updated_user`) VALUES
(1, '2024-01-28 21:25:19', '2024-02-03 19:16:12', 1, 'Hilton', '', ''),
(2, '2024-02-03 15:57:26', '2024-02-03 18:00:13', 1, 'Boutique Hotels', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `logs_cavas`
--

CREATE TABLE `logs_cavas` (
  `id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `storages_id` int(11) NOT NULL,
  `tasks_id` int(11) NOT NULL,
  `created_user` varchar(60) DEFAULT NULL,
  `updated_user` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `number` varchar(5) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `state_task` int(11) NOT NULL,
  `state_reception` tinyint(1) DEFAULT NULL,
  `is_public_area` tinyint(1) DEFAULT NULL,
  `name_public_area` varchar(200) DEFAULT NULL,
  `floors_id` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `created_user` varchar(60) DEFAULT NULL,
  `updated_user` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `number`, `updated_at`, `created_at`, `state_task`, `state_reception`, `is_public_area`, `name_public_area`, `floors_id`, `state`, `created_user`, `updated_user`) VALUES
(1, '100', '2024-02-23 21:45:37', '2024-02-23 21:17:40', 0, 0, NULL, NULL, 1, 1, '', ''),
(2, '101', '2024-02-23 21:17:55', '2024-02-23 21:17:55', 0, 0, NULL, NULL, 1, 1, '', ''),
(3, '102', '2024-02-23 21:17:58', '2024-02-23 21:17:58', 0, 0, NULL, NULL, 1, 1, '', ''),
(4, '103', '2024-02-23 21:18:01', '2024-02-23 21:18:01', 0, 0, NULL, NULL, 1, 1, '', ''),
(5, '104', '2024-02-23 21:18:05', '2024-02-23 21:18:05', 0, 0, NULL, NULL, 1, 1, '', ''),
(6, '105', '2024-02-23 21:18:08', '2024-02-23 21:18:08', 0, 0, NULL, NULL, 1, 1, '', ''),
(7, '106', '2024-02-23 21:18:15', '2024-02-23 21:18:15', 0, 0, NULL, NULL, 2, 1, '', ''),
(8, '107', '2024-02-23 21:18:19', '2024-02-23 21:18:19', 0, 0, NULL, NULL, 2, 1, '', ''),
(9, '108', '2024-02-23 21:18:22', '2024-02-23 21:18:22', 0, 0, NULL, NULL, 2, 1, '', ''),
(10, '109', '2024-02-23 21:18:25', '2024-02-23 21:18:25', 0, 0, NULL, NULL, 2, 1, '', ''),
(11, '110', '2024-02-23 21:18:30', '2024-02-23 21:18:30', 0, 0, NULL, NULL, 2, 1, '', ''),
(12, '111', '2024-02-23 21:18:37', '2024-02-23 21:18:37', 0, 0, NULL, NULL, 3, 1, '', ''),
(13, '112', '2024-02-23 21:18:40', '2024-02-23 21:18:40', 0, 0, NULL, NULL, 3, 1, '', ''),
(14, '113', '2024-02-23 21:18:43', '2024-02-23 21:18:43', 0, 0, NULL, NULL, 3, 1, '', ''),
(15, '114', '2024-02-23 21:18:46', '2024-02-23 21:18:46', 0, 0, NULL, NULL, 3, 1, '', ''),
(16, '115', '2024-02-23 21:18:49', '2024-02-23 21:18:49', 0, 0, NULL, NULL, 3, 1, '', ''),
(17, '116', '2024-02-23 21:18:56', '2024-02-23 21:18:56', 0, 0, NULL, NULL, 4, 1, '', ''),
(18, '117', '2024-02-23 21:18:59', '2024-02-23 21:18:59', 0, 0, NULL, NULL, 4, 1, '', ''),
(19, '118', '2024-02-23 21:19:02', '2024-02-23 21:19:02', 0, 0, NULL, NULL, 4, 1, '', ''),
(20, '119', '2024-02-23 21:19:05', '2024-02-23 21:19:05', 0, 0, NULL, NULL, 4, 1, '', ''),
(21, '120', '2024-02-23 21:19:09', '2024-02-23 21:19:09', 0, 0, NULL, NULL, 4, 1, '', ''),
(22, NULL, '2024-02-23 21:44:10', '2024-02-23 21:28:14', 0, 0, 1, 'Dining Room', 1, 1, '', ''),
(23, NULL, '2024-02-23 21:37:14', '2024-02-23 21:37:14', 0, 0, 1, 'Meeting Room', 1, 1, '', ''),
(24, NULL, '2024-02-23 21:38:04', '2024-02-23 21:38:04', 0, 0, 1, 'Reception', 1, 1, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `storages`
--

CREATE TABLE `storages` (
  `id` int(11) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `item_name` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `floors_id` int(11) NOT NULL,
  `created_user` varchar(60) DEFAULT NULL,
  `updated_user` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `storages`
--

INSERT INTO `storages` (`id`, `code`, `item_name`, `amount`, `state`, `created_at`, `updated_at`, `floors_id`, `created_user`, `updated_user`) VALUES
(1, '4H5', 'Bleach 5ltr', 12, 1, '2024-03-02 00:28:36', '2024-03-02 03:37:05', 1, NULL, '1'),
(2, '6B1', 'Toiler Cleaner Daily Floral 1ltr (H064)', 12, 1, '2024-03-02 00:28:36', '2024-03-02 00:28:36', 1, NULL, NULL),
(3, '6BP1', 'Toile Renovator Weekly (H447) 1ltr', 12, 1, '2024-03-02 00:32:45', '2024-03-02 00:32:45', 1, NULL, NULL),
(4, '6F', 'Multi Surface Polish (H443)', 6, 1, '2024-03-02 00:32:45', '2024-03-02 00:32:45', 1, NULL, NULL),
(5, '6K', 'Spot & Stain-Carpet/Fabric Stain Remover 750mls', 6, 1, '2024-03-02 00:36:12', '2024-03-02 00:36:12', 1, NULL, NULL),
(6, 'NFC5', 'Low Foam Neutral Floor Cleaner 5ltr', 5, 1, '2024-03-02 00:36:12', '2024-03-02 00:36:12', 1, NULL, NULL),
(7, '6W5', 'Washroom Sanitiser/Cleaner', 5, 1, '2024-03-02 00:46:54', '2024-03-02 00:46:54', 1, NULL, NULL),
(8, '8AL5', 'Apple Blossom & Lime Handsoap (H449)', 20, 1, '2024-03-02 00:46:54', '2024-03-02 00:46:54', 1, NULL, NULL),
(9, '8AB5', 'Anti Bac Handsoap 5ltr', 15, 1, '2024-03-02 01:11:32', '2024-03-02 01:11:32', 1, NULL, NULL),
(10, '8HS5', 'Scottish Courtesy Fine Handsoap 5ltr', 20, 1, '2024-03-02 01:14:11', '2024-03-02 01:14:11', 1, NULL, NULL),
(11, '10AM1', 'Descaler/Aluminium Cleaner Heavy Duty (H425) 1ltr', 10, 1, '2024-03-02 01:14:11', '2024-03-02 01:14:11', 1, NULL, NULL),
(12, '10AM5', 'Heavy Duty Descaler 5ltr ', 17, 1, '2024-03-02 01:20:07', '2024-03-02 01:20:07', 1, NULL, NULL),
(13, 'DC1', 'Acid Drain Cleaner 1ltr', 8, 1, '2024-03-02 01:20:07', '2024-03-02 01:20:07', 1, NULL, NULL),
(14, 'EDC5', 'Enzyme Drain Cleaner (M510) 5ltr', 2, 1, '2024-03-02 01:25:23', '2024-03-02 01:25:23', 1, NULL, NULL),
(15, 'ED1-2X2', 'Easy Dose 1 - Odour Eliminator (H414) 2ltr', 2, 1, '2024-03-02 01:25:23', '2024-03-02 01:25:23', 1, NULL, NULL),
(16, 'ED6-2X2', 'Easy Dose 6 - Window, Glass & S/ Steel cleaner (H452)', 2, 1, '2024-03-02 01:29:08', '2024-03-02 01:29:08', 1, NULL, NULL),
(17, 'FBNS10', 'Foam Backed Non Scratch Scourer', 6, 1, '2024-03-02 01:29:08', '2024-03-02 01:29:08', 1, NULL, NULL),
(18, 'PC3', 'Urinal Blocks 3kg', 9, 1, '2024-03-02 01:32:57', '2024-03-02 01:32:57', 1, NULL, NULL),
(19, 'PUN5W', 'Urine Neutraliser 5ltr', 2, 1, '2024-03-02 01:32:57', '2024-03-02 01:32:57', 1, NULL, NULL),
(20, 'US1 ', 'Urinal Screens', 12, 1, '2024-03-02 01:35:21', '2024-03-02 01:35:21', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `task_date` datetime NOT NULL,
  `state` int(11) NOT NULL,
  `init_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `photo_task` varchar(80) DEFAULT NULL,
  `maintenance_report` tinyint(1) DEFAULT NULL,
  `description_report` varchar(400) DEFAULT NULL,
  `photo_maintenance_report` varchar(80) DEFAULT NULL,
  `employees_id` int(11) NOT NULL,
  `rooms_id` int(11) NOT NULL,
  `created_user` varchar(60) DEFAULT NULL,
  `updated_user` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absences`
--
ALTER TABLE `absences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_absences_employees1_idx` (`employees_id`);

--
-- Indexes for table `costs_fields`
--
ALTER TABLE `costs_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_emails_employees1_idx` (`employees_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `floors`
--
ALTER TABLE `floors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_floors_hotels1_idx` (`hotels_id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_holidays_employees1_idx` (`employees_id`);

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_hotels_hotels_group1_idx` (`hotels_groups_id`);

--
-- Indexes for table `hotels_employees`
--
ALTER TABLE `hotels_employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employees_id` (`employees_id`,`hotels_id`),
  ADD KEY `hotels_id` (`hotels_id`);

--
-- Indexes for table `hotels_groups`
--
ALTER TABLE `hotels_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs_cavas`
--
ALTER TABLE `logs_cavas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_logs_cavas_storages1_idx` (`storages_id`),
  ADD KEY `fk_logs_cavas_tasks1_idx` (`tasks_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_rooms_floors1_idx` (`floors_id`);

--
-- Indexes for table `storages`
--
ALTER TABLE `storages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_storages_floors1_idx` (`floors_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tasks_employees_idx` (`employees_id`),
  ADD KEY `fk_tasks_rooms1_idx` (`rooms_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absences`
--
ALTER TABLE `absences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `costs_fields`
--
ALTER TABLE `costs_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `floors`
--
ALTER TABLE `floors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `hotels_employees`
--
ALTER TABLE `hotels_employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotels_groups`
--
ALTER TABLE `hotels_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `logs_cavas`
--
ALTER TABLE `logs_cavas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `storages`
--
ALTER TABLE `storages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absences`
--
ALTER TABLE `absences`
  ADD CONSTRAINT `fk_absences_employees1` FOREIGN KEY (`employees_id`) REFERENCES `employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `emails`
--
ALTER TABLE `emails`
  ADD CONSTRAINT `fk_emails_employees1` FOREIGN KEY (`employees_id`) REFERENCES `employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `floors`
--
ALTER TABLE `floors`
  ADD CONSTRAINT `fk_floors_hotels1` FOREIGN KEY (`hotels_id`) REFERENCES `hotels` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `holidays`
--
ALTER TABLE `holidays`
  ADD CONSTRAINT `fk_holidays_employees1` FOREIGN KEY (`employees_id`) REFERENCES `employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hotels`
--
ALTER TABLE `hotels`
  ADD CONSTRAINT `fk_hotels_hotels_group1` FOREIGN KEY (`hotels_groups_id`) REFERENCES `hotels_groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hotels_employees`
--
ALTER TABLE `hotels_employees`
  ADD CONSTRAINT `hotels_employees_ibfk_1` FOREIGN KEY (`employees_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `hotels_employees_ibfk_2` FOREIGN KEY (`hotels_id`) REFERENCES `hotels` (`id`);

--
-- Constraints for table `logs_cavas`
--
ALTER TABLE `logs_cavas`
  ADD CONSTRAINT `logs_cavas_ibfk_1` FOREIGN KEY (`tasks_id`) REFERENCES `tasks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `logs_cavas_ibfk_2` FOREIGN KEY (`storages_id`) REFERENCES `storages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `fk_rooms_floors1` FOREIGN KEY (`floors_id`) REFERENCES `floors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `storages`
--
ALTER TABLE `storages`
  ADD CONSTRAINT `storages_ibfk_1` FOREIGN KEY (`floors_id`) REFERENCES `floors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`rooms_id`) REFERENCES `rooms` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`employees_id`) REFERENCES `employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
