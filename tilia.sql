-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 04, 2016 at 02:03 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 7.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tilia`
--

-- --------------------------------------------------------

--
-- Table structure for table `tiles`
--

CREATE TABLE `tiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_persian_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8_persian_ci NOT NULL,
  `source` varchar(1024) COLLATE utf8_persian_ci NOT NULL,
  `tileHeight` int(10) UNSIGNED NOT NULL,
  `tileWidth` int(10) UNSIGNED NOT NULL,
  `realHeight` int(10) UNSIGNED NOT NULL,
  `realwidth` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `tiles`
--

INSERT INTO `tiles` (`id`, `title`, `description`, `source`, `tileHeight`, `tileWidth`, `realHeight`, `realwidth`) VALUES
(1, 'Cabin', 'A dribble shot of wierd cabin', 'cabin.jpg', 450, 600, 600, 800),
(2, 'Ball', 'What the heck is this', 'ball.jpg', 300, 400, 600, 800),
(3, 'pencil', 'Beautiful!', 'pencils.gif', 450, 600, 600, 800),
(4, 'lion', 'Bila misar, Khoshgele lion', 'lion.jpg', 300, 400, 600, 800),
(5, 'Face', 'Face off!', 'face.jpg', 300, 400, 600, 800),
(6, 'Earth seed', 'Come on grow on!', 'seed.gif', 300, 400, 600, 800),
(7, 'weekend', 'Day n Night!', 'weekend.png', 450, 600, 600, 800),
(8, 'tortoise', 'It''s a chelonioidea, not a tortoise...', 'beach.png', 300, 400, 600, 800),
(9, 'Save Water', 'We''ve all got to do our bit!', 'button.png', 300, 400, 600, 800);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tiles`
--
ALTER TABLE `tiles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tiles`
--
ALTER TABLE `tiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
