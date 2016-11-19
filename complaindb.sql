-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2016 at 10:23 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `complaindb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `privy` int(11) NOT NULL,
  `codename` varchar(20) NOT NULL,
  `role` enum('guest','user','admin') NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `team_id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`, `privy`, `codename`, `role`, `firstname`, `lastname`, `agent_id`, `phone`, `team_id`, `email`) VALUES
(1, 'zeoharlem@yahoo.co.uk', '$2a$08$eUAwhfJe8E9spBynZk2Nj.WaXE1wXiVJJFqVbxumVW3ggILMRKIN2', 5, '1234567890', 'admin', 'theophilus', 'alamu', 17769, '+2348098513161', 9896, 'zeoharlem@yahoo.co.uk');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` longtext,
  `description` longtext,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `description`) VALUES
(1, 'frozen foods', 'frozen foods '),
(2, 'beverages', 'beverages'),
(3, 'Bread/Bakery', 'Bread or Bakery'),
(4, 'Canned/Jarred Goods', 'Canned and Jarred Goods comprises of vegetables, spaghetti sauce, ketchup and the likes'),
(5, 'Dairy', 'cheeses, eggs, milk, yogurt, butter'),
(6, 'Dry/Baking Goods', 'Dry and Baking Goods'),
(7, 'Meat', 'Meat and Beef'),
(8, 'Produce', 'all kinds of fruits, vegetables etc'),
(9, 'stationeries', 'Paper Goods â€“ paper towels, toilet paper, aluminum foil, sandwich bags');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `category_id` int(11) NOT NULL,
  `date_reg` datetime NOT NULL,
  `register_id` int(11) NOT NULL,
  `city` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`message_id`, `title`, `description`, `category_id`, `date_reg`, `register_id`, `city`, `status`) VALUES
(1, 'unable to connect', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vitae enim sit amet lacus feugiat porttitor sit amet tincidunt sapien. Suspendisse pharetra leo a orci lobortis tempor. Morbi sagittis, dolor ac condimentum porttitor, eros risus rutrum lacus, non lacinia neque augue nec nisi. Aenean orci nunc, bibendum ac maximus in, ullamcorper et erat. Suspendisse potenti. Phasellus malesuada, sapien quis molestie consectetur, orci arcu maximus ante, id blandit sapien tortor pulvinar ligula. Proin gravida molestie neque non ', 2, '2016-11-19 08:33:44', 1, '', 'pending'),
(2, 'problem connecting to the server', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vitae enim sit amet lacus feugiat porttitor sit amet tincidunt sapien. Suspendisse pharetra leo a orci lobortis tempor. Morbi sagittis, dolor ac condimentum porttitor, eros risus rutrum lacus, non lacinia neque augue nec nisi. Aenean orci nunc, bibendum ac maximus in, ullamcorper et erat. Suspendisse potenti. Phasellus malesuada, sapien quis molestie consectetur, orci arcu maximus ante, id blandit sapien tortor pulvinar ligula. Proin gravida molestie neque non ', 3, '2016-11-19 09:49:18', 1, 'Akwa Ibom', 'pending'),
(3, 'heavy traffic logger', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vitae enim sit amet lacus feugiat porttitor sit amet tincidunt sapien. Suspendisse pharetra leo a orci lobortis tempor. Morbi sagittis, dolor ac condimentum porttitor, eros risus rutrum lacus, non lacinia neque augue nec nisi. Aenean orci nunc, bibendum ac maximus in, ullamcorper et erat. Suspendisse potenti. Phasellus malesuada, sapien quis molestie consectetur, orci arcu maximus ante, id blandit sapien tortor pulvinar ligula. Proin gravida molestie neque non ', 5, '2016-11-19 10:04:08', 1, 'Anambra', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE IF NOT EXISTS `register` (
  `register_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phonenumber` varchar(30) NOT NULL,
  `address` mediumtext NOT NULL,
  `password` varchar(200) NOT NULL,
  `codename` int(11) NOT NULL,
  `role` enum('guest','user','admin') NOT NULL,
  PRIMARY KEY (`register_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`register_id`, `firstname`, `lastname`, `email`, `phonenumber`, `address`, `password`, `codename`, `role`) VALUES
(1, 'theophilus', 'alamu', 'zeoharlem@yahoo.co.uk', '08098513161', 'goshen house papa apete ibadan nigerai', '$2y$08$ckU15EszSG7amQa6g4435O9sWFFzCaiRvoqswasIN14DpcwUVxW9y', 2147483647, 'user'),
(2, 'olufunto', 'abiola alamu', 'afuntybabe@yahoo.com', '08186982508', 'no 31, raimi alabi street, sitaga, eleyel ibadan', '$2y$08$2FNz80ZbLELC9NxpuGt9UOrbt2klJkRf81mEP.2uAYHVNRYyAR2Am', 2147483647, 'user'),
(3, 'kehinde', 'Ukpokolo', 'vendor@shop.com', '08098513163', 'no 10, educational zone, samonda, ibadan', 'U7DKej5n', 57864979, 'user'),
(4, 'ifeoluwa', 'solomon', 'hifey@pepperedrice.com', '08012334455', 'no 12, gonjo house, ashi bodija, ibadan', '$2y$08$Tq2qajJXjbhh7Mms4A5NN.R/hoYVVmZ3F7662knaE/NBenFOiFf0O', 22680123, 'user');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
