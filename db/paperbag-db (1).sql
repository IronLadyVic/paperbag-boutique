-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 21, 2014 at 01:58 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `paperbag-db`
--

-- --------------------------------------------------------

--
-- Table structure for table `producttype`
--

CREATE TABLE IF NOT EXISTS `producttype` (
  `TypeID` int(5) NOT NULL AUTO_INCREMENT,
  `TypeName` varchar(50) NOT NULL,
  `Description` varchar(250) NOT NULL,
  `DisplayOrder` varchar(5) NOT NULL DEFAULT 'Null',
  PRIMARY KEY (`TypeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `producttype`
--

INSERT INTO `producttype` (`TypeID`, `TypeName`, `Description`, `DisplayOrder`) VALUES
(1, 'Jackets', 'an outer garment extending either to the waist or the hips, typically having sleeves and a fastening down the front.', 'Null'),
(2, 'Tops', 'a garment or part placed on, fitted to, or covering the upper part of your body.', 'Null'),
(3, 'Tees', 'a short-sleeved casual top', 'Null'),
(4, 'Pants', 'Trousers', 'Null'),
(5, 'Shorts', 'Short trousers that reach only to the knees or thighs', 'Null'),
(6, 'Knitwear', 'knitted garments', 'Null'),
(7, 'Socks', 'you put on your feet to keep you warm', ''),
(8, 'Skirts', 'a woman’s outer garment fastened around the waist and hanging down around the legs.', 'Null'),
(9, 'Socks', 'you put on your feet to keep you warm', '0'),
(10, 'Socks', 'you put on your feet to keep you warm', ''),
(11, 'Eyewear', 'Protect the eyes', ''),
(12, 'Eyewear', 'Protect the eyes', ''),
(13, 'Eyewear', 'Protect the eyes', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbmember`
--

CREATE TABLE IF NOT EXISTS `tbmember` (
  `MemberID` int(5) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Mobile` int(50) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `StreetAddress` varchar(200) NOT NULL,
  `City` varchar(100) NOT NULL,
  `PostCode` int(10) NOT NULL,
  PRIMARY KEY (`MemberID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tbmember`
--

INSERT INTO `tbmember` (`MemberID`, `UserName`, `Password`, `FirstName`, `LastName`, `Mobile`, `Email`, `StreetAddress`, `City`, `PostCode`) VALUES
(1, 'Vic', '1234', 'Victoria', 'Clark', 21641875, 'clark.victoriajane@gmail.com', '115C Remuera Road', 'Auckland', 1050),
(2, 'Tom', 'Tossy', 'Tom', 'Burton', 21656325, 'tom@gmail.com', '15 Harrolds Ave', 'Christchurch', 8015),
(3, 'Paul', 'PDids', 'Paul', 'Davis', 210657324, 'pdavis@gmail.com', '15 Seaview Road', 'Auckland', 1040),
(4, 'test', 'test', 'test', 'test', 2147483647, 'test', 'test', 'test', 34646346),
(5, 'Janey', 'holiday', 'Jane', 'Clark', 213331822, 'jclark@hotmail.com', '30 Rosevalt Ave', 'Christchurch', 8015),
(6, 'Rach', 'bubbles', 'Rachel', 'Smith', 1234123, 'rachsmith@hotmail.com', '111 Arney Road', 'Auckland', 1050);

-- --------------------------------------------------------

--
-- Table structure for table `tbproduct`
--

CREATE TABLE IF NOT EXISTS `tbproduct` (
  `ProductID` int(5) NOT NULL AUTO_INCREMENT,
  `SellerID` int(5) NOT NULL,
  `BuyerID` int(5) DEFAULT NULL,
  `TypeID` int(5) NOT NULL,
  `ItemName` varchar(100) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `Size` varchar(50) NOT NULL,
  `Label` varchar(50) NOT NULL,
  `Price` double NOT NULL,
  `PhotoPath` varchar(100) NOT NULL,
  `Active` tinyint(4) NOT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `SellerID` (`SellerID`,`BuyerID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `tbproduct`
--

INSERT INTO `tbproduct` (`ProductID`, `SellerID`, `BuyerID`, `TypeID`, `ItemName`, `Description`, `Size`, `Label`, `Price`, `PhotoPath`, `Active`) VALUES
(1, 2, NULL, 1, 'Chanel Jacket', 'Black 100% wool Jacket', 'XS', 'CoCoChanel', 30, '', 1),
(2, 2, NULL, 8, 'Sass n Bide Skirt', 'Cool coloured zip skirt. Comes to the knee', 'L', 'SassnBide', 50, '', 1),
(3, 3, NULL, 3, 'Cool Tshirt', 'Tee', 'M', 'Maurice & Eve', 20, '', 1),
(4, 4, NULL, 7, 'Cool Shorts', 'Very cool shorts you can wear', 'M', 'Max Fashions', 40, 'vicsshorts.png', 1),
(5, 5, NULL, 6, 'Woolly jumper', '100% Woolly jumper, colour white', 'M', 'Trelise Cooper', 45, '', 1),
(6, 6, NULL, 5, 'Leather shorts', 'Black leather draw string shorts', 'S', 'KooKai', 80, '', 1),
(7, 3, NULL, 2, 'White silk top', 'silk white top, arm length, very cool', 'L', 'I love ugly', 100, '', 1),
(8, 4, NULL, 4, 'Jeans', 'Sass n bide', 'S', 'SassnBide', 90, '', 1),
(9, 3, 1, 6, 'Woolly jumper', 'black with gold sequins all over front and back', 'XS', 'SassnBide', 80, 'vicsjumper.png', 1),
(10, 3, 0, 6, 'Woolly jumper', 'black with gold sequins all over front and back', 'XS', 'SassnBide', 80, 'vicsjumper.png', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbproduct`
--
ALTER TABLE `tbproduct`
  ADD CONSTRAINT `tbproduct_ibfk_1` FOREIGN KEY (`SellerID`) REFERENCES `tbmember` (`MemberID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
