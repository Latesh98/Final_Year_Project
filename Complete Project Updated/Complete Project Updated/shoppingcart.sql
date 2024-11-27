-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2024 at 03:30 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shoppingcart`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(10) NOT NULL,
  `producttype` text NOT NULL,
  `name` text NOT NULL,
  `image` text NOT NULL,
  `price` text NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `producttype`, `name`, `image`, `price`, `description`) VALUES
(1, 'Laptop', 'Laptop', '2.jpg', '25000', NULL),
(2, 'Shoes', 'aaa', 'shoes.jpg', '1111', NULL),
(3, 'Cloths', 'aaa', 'intro-bg.jpg', '1111', NULL),
(4, 'Shoes', 'Bata', '6.jpg', '1122', NULL),
(5, 'Laptop', 'Dell', '2.jpg', '2500', NULL),
(6, 'Shoes', 'Canvas', 'shoes.jpg', '1200', NULL),
(7, 'Mobile', 'OnePlus7T', 'OnePlus.jpg', '30000', NULL),
(8, 'Phone', 'IPhone11', 'iphone11.jpg', '45000', NULL),
(10, 'Watch', 'Fastrack', 'fwatch.png', '2200', 'Fastract More Trending Metalic, Multifuction, Branded Watch for Mens.');

-- --------------------------------------------------------

--
-- Table structure for table `productsby`
--

CREATE TABLE `productsby` (
  `id` int(10) NOT NULL,
  `custid` varchar(10) NOT NULL,
  `productid` varchar(10) NOT NULL,
  `paymenttype` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `productsby`
--

INSERT INTO `productsby` (`id`, `custid`, `productid`, `paymenttype`) VALUES
(21, '1', '4', 'online'),
(22, '1', '4', 'online'),
(23, '2', '4', 'online'),
(24, '3', '5', 'online'),
(25, '1', '2', 'online'),
(26, '4', '5', 'cash'),
(27, '4', '5', 'online'),
(28, '5', '7', 'online'),
(29, '5', '7', 'online'),
(30, '1', '', 'online'),
(31, '1', '10', 'online'),
(32, '5', '10', 'online'),
(33, 'null', '10', 'online'),
(34, 'null', '10', 'online'),
(35, 'null', '10', 'online');

-- --------------------------------------------------------

--
-- Table structure for table `similarproduct`
--

CREATE TABLE `similarproduct` (
  `id` int(10) NOT NULL,
  `producttype` text NOT NULL,
  `name` text NOT NULL,
  `image` text NOT NULL,
  `price` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `similarproduct`
--

INSERT INTO `similarproduct` (`id`, `producttype`, `name`, `image`, `price`) VALUES
(1, 'Laptop', 'Mouse', '71rj+ivDUjL._AC_UL320_.jpg', '1300'),
(2, 'Laptop', 'Bag', '81cB0YABm3L._AC_UL320_.jpg', '500'),
(3, 'Shoes', 'Canvas', 'rsc045-11-red-tape-lgrn-original-imaf4as3xsgvsvrg.jpeg', '1300');

-- --------------------------------------------------------

--
-- Table structure for table `stop`
--

CREATE TABLE `stop` (
  `words` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stopwords`
--

CREATE TABLE `stopwords` (
  `words` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `stopwords`
--

INSERT INTO `stopwords` (`words`) VALUES
('i'),
('we'),
('ok'),
('now'),
('us'),
('the'),
('our'),
('group'),
('get'),
('want'),
('show'),
('give');

-- --------------------------------------------------------

--
-- Table structure for table `stopwords2`
--

CREATE TABLE `stopwords2` (
  `words` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `stopwords2`
--

INSERT INTO `stopwords2` (`words`) VALUES
('i'),
('we'),
('ok'),
('now'),
('us'),
('the'),
('our'),
('group'),
('get'),
('want'),
('show'),
('give'),
('number');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uid` int(10) NOT NULL,
  `fname` text NOT NULL,
  `address` text NOT NULL,
  `mobile` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `fname`, `address`, `mobile`, `email`, `password`) VALUES
(1, 'Ravi', 'Pune', '8459594800', 'ravi@gmail.com', '111111'),
(3, 'Aditya', 'Pune', '8888888888', 'adi@gmail.com', '111111'),
(24, 'Ravina', 'Mumbai', '8372927382', 'aa', '1111'),
(25, 'Raj', 'Pune', '9999999999', 'adi123', '11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productsby`
--
ALTER TABLE `productsby`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `similarproduct`
--
ALTER TABLE `similarproduct`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `productsby`
--
ALTER TABLE `productsby`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `similarproduct`
--
ALTER TABLE `similarproduct`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
