-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 10, 2020 at 09:38 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vanillajs`
--

-- --------------------------------------------------------

--
-- Table structure for table `OrderManifest`
--

CREATE TABLE `OrderManifest` (
  `oid` varchar(13) NOT NULL,
  `pid` int(11) NOT NULL,
  `orderqty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `OrderManifest`
--

INSERT INTO `OrderManifest` (`oid`, `pid`, `orderqty`) VALUES
('5eacbc5707739', 101, 7),
('5eacbc5707739', 102, 2),
('5eacbc5707739', 103, 3),
('5eacbd210e1ea', 101, 7),
('5eacbd210e1ea', 102, 2),
('5eacbd210e1ea', 103, 3),
('5eacbd7764ee2', 101, 2),
('5eacbd7764ee2', 102, 3),
('5eacbdcb43462', 101, 2),
('5eacbdcb43462', 102, 4),
('5eacbe1e4ae6d', 101, 2),
('5eacbe1e4ae6d', 102, 4),
('5eacbe79c4665', 101, 7),
('5eacbe79c4665', 102, 4),
('5eacc0617e06d', 101, 12),
('5eacc07b5aef8', 101, 12),
('5eacc0bc3d6d8', 101, 12),
('5eacc0bc3d6d8', 102, 10),
('5eacc0bc3d6d8', 103, 8),
('5eacc1fb59a59', 101, 2),
('5eacc1fb59a59', 102, 10),
('5eacc1fb59a59', 103, 9),
('5eacc1fb59a59', 201, 5),
('5eadf77da441e', 103, 8),
('5eadf77da441e', 202, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `oid` varchar(13) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(250) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `crednum` varchar(25) NOT NULL,
  `address` varchar(50) NOT NULL,
  `zip` int(11) NOT NULL,
  `shipmethod` enum('ground','one-day','two-day') NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`oid`, `name`, `email`, `phone`, `crednum`, `address`, `zip`, `shipmethod`, `date`) VALUES
('5eacbc5707739', 'Richard Liu', 'richardbliu@gmail.com', '310 498 6479', '4147202354591234', '1790 Daffodil Ave', 93004, 'ground', '2020-05-02'),
('5eacbd210e1ea', 'Richard Liu', 'richardbliu@gmail.com', '310 498 6479', '4147202354591234', '1790 Daffodil Ave', 93004, 'ground', '2020-05-02'),
('5eacbd7764ee2', 'Richard Liu', 'richardbliu@gmail.com', '310 498 6479', '4147202354591234', '1790 Daffodil Ave', 93004, 'ground', '2020-05-02'),
('5eacbdcb43462', 'Richard Liu', 'richardbliu@gmail.com', '310 498 6479', '4147202354591234', '1790 Daffodil Ave', 93004, 'ground', '2020-05-02'),
('5eacbe1e4ae6d', 'Richard Liu', 'richardbliu@gmail.com', '310 498 6479', '4147202354591234', '1790 Daffodil Ave', 93004, 'ground', '2020-05-02'),
('5eacbe79c4665', 'Richard Liu', 'richardbliu@gmail.com', '310 498 6479', '4147202354591234', '1790 Daffodil Ave', 93004, 'ground', '2020-05-02'),
('5eacc0617e06d', 'Richard Liu', 'richardbliu@gmail.com', '310 498 6479', '4147202354591234', '1790 Daffodil Ave', 93004, 'ground', '2020-05-02'),
('5eacc07b5aef8', 'Richard Liu', 'richardbliu@gmail.com', '310 498 6479', '4147202354591234', '1790 Daffodil Ave', 93004, 'ground', '2020-05-02'),
('5eacc0bc3d6d8', 'Ally Y', 'ally@gmail.com', '310 498 6479', '4147202354591234', '1790 D A', 93004, 'ground', '2020-05-02'),
('5eacc1fb59a59', 'Richard Liu', 'richardbliu@gmail.com', '310 498 6479', '4147202354591234', '1790 Daffodil Ave', 93004, 'ground', '2020-05-02'),
('5eadf77da441e', 'Richard Liu', 'richardbliu@gmail.com', '310 498 6479', '4147202354591234', '1790 Daffodil Ave', 93004, 'one-day', '2020-05-03');

-- --------------------------------------------------------

--
-- Table structure for table `Products`
--

CREATE TABLE `Products` (
  `pid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `imgurl` varchar(250) NOT NULL,
  `qty` int(11) NOT NULL,
  `description` varchar(500) NOT NULL,
  `category` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Products`
--

INSERT INTO `Products` (`pid`, `name`, `price`, `imgurl`, `qty`, `description`, `category`) VALUES
(101, 'Red Velvet Cupcake', 350, 'https://bakerymedia.s3-us-west-1.amazonaws.com/redvelvet.jpg', 200, '\"Our most popular cupcake, red velvet, was developed by Sprinkles founder Candace Nelson as an homage to her husband Charles and his deep Oklahoma roots. As a chocolate lover, Candace upped the chocolate quotient with Callebaut cocoa, mellowing the red color to a sophisticated hue. Set against the lily white of rich cream cheese frosting, the contrast is gorgeous... if only we had the self-restraint to sit and admire it!', 'Cupcake'),
(102, 'Vanilla Cupcake', 450, 'https://bakerymedia.s3-us-west-1.amazonaws.com/vanilla.jpg', 200, 'Purists will delight in our vanilla cupcake, though our vanilla cake is anything but simple. A favorite of the bakery staff, this soft, delicate cake is perfumed by the sweet flavor of pure vanilla for an effect that is simply... heaven.\r\n', 'Cupcake'),
(103, 'Chocolate Cupcake', 350, 'https://bakerymedia.s3-us-west-1.amazonaws.com/choccupcake.jpg', 200, 'You are perpetually on the hunt for the most decadent and complex chocolate gems to dazzle your sophisticated palate. Strike it \\\"rich\\\" with Sprinkles Dark Chocolate cupcakes! Ample cocoa gives this cake its intense flavor while fragrant Madagascar Bourbon vanilla adds a rich perfume. Topped with a creamy, bittersweet frosting and real chocolate sprinkles from France, the only other thing in the world you\'ll want is an ice cold glass of milk!\r\n', 'Cupcake'),
(201, 'Chocolate Chip Cookie', 400, 'https://bakerymedia.s3-us-west-1.amazonaws.com/chocchipcookie.jpg\r\n', 200, 'Our Chocolate Cookies will brighten your snacktime with uncompromising taste and texture.', 'Cookie'),
(202, 'Peanut Butter Cookie', 500, 'https://bakerymedia.s3-us-west-1.amazonaws.com/peanutbuttercookies.jpg\r\n', 200, 'Our Peanut Butter Cookies will brighten your snacktime with uncompromising taste and texture.', 'Cookie'),
(203, 'Snickerdoodle Cookie', 500, 'https://bakerymedia.s3-us-west-1.amazonaws.com/snickerdoodlecookie.jpg\r\n', 200, 'Our SnickerDoodle Cookies will brighten your snacktime with uncompromising taste and texture.', 'Cookie'),
(301, 'Chocolate Cake', 3000, 'https://bakerymedia.s3-us-west-1.amazonaws.com/choccake.jpeg\r\n', 20, 'From the beautiful and decorative exterior to the decadent and delicious inside, the Ultimate Chocolate Cake is a gourmet dessert to remember. The first layer is a rich brownie fudge cake, topped with a layer of light and fluffy New York-style cheesecake, and fudge filling in between. Top it all off with fancy fudge frosting and pecans, and you have a chocolate cake that memories are made of.\r\n', 'Cake'),
(302, 'Red Velvet Cake', 3000, 'https://bakerymedia.s3-us-west-1.amazonaws.com/redvelvetcake.jpg\r\n', 20, 'From the beautiful and decorative exterior to the decadent and delicious inside, the Red velvet cake is a gourmet dessert to remember.\r\n', 'Cake'),
(303, 'Lemon Cake', 3500, 'https://bakerymedia.s3-us-west-1.amazonaws.com/lemoncake.jpg\r\n', 20, ' A zingy lemon cake with mascarpone filling inside and a dreamy Swiss meringue buttercream.', 'Cake'),
(304, 'Birthday Cake', 5000, 'https://bakerymedia.s3-us-west-1.amazonaws.com/birthdaycake.jpg\r\n', 50, 'From the beautiful and decorative exterior to the decadent and delicious inside, the Birthday Cake is a gourmet dessert to remember.', 'Cake');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`oid`);

--
-- Indexes for table `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`pid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
