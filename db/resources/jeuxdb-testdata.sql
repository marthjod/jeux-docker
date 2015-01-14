-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: 127.8.178.130:3306
-- Generation Time: Jan 14, 2015 at 06:06 PM
-- Server version: 5.5.40
-- PHP Version: 5.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jeuxdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `Game`
--

CREATE TABLE IF NOT EXISTS `Game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL COMMENT 'Group in which this game is played',
  `winnerId` int(11) DEFAULT NULL COMMENT 'Player who won the entire game, i.e. all its sets',
  `player1Id` int(11) NOT NULL,
  `player2Id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Game_Player_idx` (`winnerId`),
  KEY `fk_Game_Group1_idx` (`groupId`),
  KEY `fk_Game_Player1` (`player1Id`),
  KEY `fk_Game_Player2` (`player2Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=53 ;

--
-- Dumping data for table `Game`
--

INSERT INTO `Game` (`id`, `groupId`, `winnerId`, `player1Id`, `player2Id`) VALUES
(1, 2, 1, 1, 2),
(2, 2, 1, 1, 3),
(3, 2, 1, 1, 4),
(4, 2, 2, 2, 3),
(5, 2, 2, 2, 4),
(6, 2, 3, 3, 4),
(7, 3, 5, 5, 6),
(8, 3, 5, 5, 7),
(9, 3, 5, 5, 8),
(10, 3, 6, 6, 7),
(11, 3, 6, 6, 8),
(12, 3, 7, 7, 8),
(13, 4, 12, 11, 12),
(14, 4, 11, 11, 13),
(15, 4, 14, 11, 14),
(16, 4, 12, 12, 13),
(17, 4, 12, 12, 14),
(18, 4, 14, 13, 14),
(19, 5, 15, 15, 16),
(20, 5, 15, 15, 17),
(21, 5, 15, 15, 18),
(22, 5, 16, 16, 17),
(23, 5, 16, 16, 18),
(24, 5, 18, 17, 18),
(25, 9, 8, 4, 8),
(26, 9, 4, 4, 13),
(27, 9, 17, 4, 17),
(28, 9, 8, 8, 13),
(29, 9, 17, 8, 17),
(30, 9, 17, 13, 17),
(31, 8, 3, 3, 7),
(32, 8, 11, 3, 11),
(33, 8, 3, 3, 18),
(34, 8, 11, 7, 11),
(35, 8, 7, 7, 18),
(36, 8, 11, 11, 18),
(37, 7, 5, 2, 5),
(38, 7, 2, 2, 14),
(39, 7, 15, 2, 15),
(40, 7, 5, 5, 14),
(41, 7, 15, 5, 15),
(42, 7, 15, 14, 15),
(43, 6, 1, 1, 6),
(44, 6, 1, 1, 12),
(45, 6, 1, 1, 16),
(46, 6, 6, 6, 12),
(47, 6, 6, 6, 16),
(48, 6, 12, 12, 16),
(49, 10, NULL, 14, 16),
(50, 11, NULL, 2, 12),
(51, 12, NULL, 5, 6),
(52, 13, NULL, 1, 15);

-- --------------------------------------------------------

--
-- Table structure for table `GameSet`
--

CREATE TABLE IF NOT EXISTS `GameSet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player1Score` int(3) NOT NULL DEFAULT '0',
  `player2Score` int(3) NOT NULL DEFAULT '0',
  `winnerId` int(11) DEFAULT NULL COMMENT 'Player who has scored more',
  `gameId` int(11) NOT NULL COMMENT 'Game this set is part of',
  `number` int(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_GameSet_Game1_idx` (`gameId`),
  KEY `fk_GameSet_Player3_idx` (`winnerId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=157 ;

--
-- Dumping data for table `GameSet`
--

INSERT INTO `GameSet` (`id`, `player1Score`, `player2Score`, `winnerId`, `gameId`, `number`) VALUES
(1, 12, 9, 1, 1, 1),
(2, 12, 5, 1, 1, 2),
(3, 0, 0, NULL, 1, 3),
(4, 12, 4, 1, 2, 1),
(5, 12, 4, 1, 2, 2),
(6, 0, 0, NULL, 2, 3),
(7, 12, 2, 1, 3, 1),
(8, 12, 1, 1, 3, 2),
(9, 0, 0, NULL, 3, 3),
(10, 12, 5, 2, 4, 1),
(11, 11, 9, 2, 4, 2),
(12, 0, 0, NULL, 4, 3),
(13, 12, 4, 2, 5, 1),
(14, 11, 4, 2, 5, 2),
(15, 0, 0, NULL, 5, 3),
(16, 11, 6, 3, 6, 1),
(17, 12, 3, 3, 6, 2),
(18, 0, 0, NULL, 6, 3),
(19, 12, 0, 5, 7, 1),
(20, 11, 2, 5, 7, 2),
(21, 0, 0, NULL, 7, 3),
(22, 11, 6, 5, 8, 1),
(23, 7, 12, 7, 8, 2),
(24, 11, 2, 5, 8, 3),
(25, 11, 1, 5, 9, 1),
(26, 12, 7, 5, 9, 2),
(27, 0, 0, NULL, 9, 3),
(28, 12, 3, 6, 10, 1),
(29, 14, 11, 6, 10, 2),
(30, 0, 0, NULL, 10, 3),
(31, 12, 0, 6, 11, 1),
(32, 12, 6, 6, 11, 2),
(33, 0, 0, NULL, 11, 3),
(34, 12, 2, 7, 12, 1),
(35, 12, 4, 7, 12, 2),
(36, 0, 0, NULL, 12, 3),
(37, 8, 12, 12, 13, 1),
(38, 0, 12, 12, 13, 2),
(39, 0, 0, NULL, 13, 3),
(40, 13, 10, 11, 14, 1),
(41, 12, 10, 11, 14, 2),
(42, 0, 0, NULL, 14, 3),
(43, 5, 12, 14, 15, 1),
(44, 6, 11, 14, 15, 2),
(45, 0, 0, NULL, 15, 3),
(46, 12, 7, 12, 16, 1),
(47, 12, 0, 12, 16, 2),
(48, 0, 0, NULL, 16, 3),
(49, 11, 5, 12, 17, 1),
(50, 12, 2, 12, 17, 2),
(51, 0, 0, NULL, 17, 3),
(52, 11, 2, 13, 18, 1),
(53, 7, 11, 14, 18, 2),
(54, 4, 11, 14, 18, 3),
(55, 12, 6, 15, 19, 1),
(56, 11, 3, 15, 19, 2),
(57, 0, 0, NULL, 19, 3),
(58, 12, 5, 15, 20, 1),
(59, 11, 1, 15, 20, 2),
(60, 0, 0, NULL, 20, 3),
(61, 12, 0, 15, 21, 1),
(62, 12, 0, 15, 21, 2),
(63, 0, 0, NULL, 21, 3),
(64, 12, 4, 16, 22, 1),
(65, 12, 3, 16, 22, 2),
(66, 0, 0, NULL, 22, 3),
(67, 12, 1, 16, 23, 1),
(68, 11, 6, 16, 23, 2),
(69, 0, 0, NULL, 23, 3),
(70, 11, 6, 17, 24, 1),
(71, 6, 11, 18, 24, 2),
(72, 10, 12, 18, 24, 3),
(73, 4, 11, 8, 25, 1),
(74, 5, 12, 8, 25, 2),
(75, 0, 0, NULL, 25, 3),
(76, 4, 12, 13, 26, 1),
(77, 12, 0, 4, 26, 2),
(78, 11, 9, 4, 26, 3),
(79, 8, 11, 17, 27, 1),
(80, 6, 11, 17, 27, 2),
(81, 0, 0, NULL, 27, 3),
(82, 11, 9, 8, 28, 1),
(83, 0, 11, 13, 28, 2),
(84, 12, 6, 8, 28, 3),
(85, 8, 12, 17, 29, 1),
(86, 10, 12, 17, 29, 2),
(87, 0, 0, NULL, 29, 3),
(88, 11, 8, 13, 30, 1),
(89, 6, 11, 17, 30, 2),
(90, 5, 11, 17, 30, 3),
(91, 9, 11, 7, 31, 1),
(92, 11, 5, 3, 31, 2),
(93, 12, 4, 3, 31, 3),
(94, 6, 12, 11, 32, 1),
(95, 2, 11, 11, 32, 2),
(96, 0, 0, NULL, 32, 3),
(97, 7, 11, 18, 33, 1),
(98, 12, 1, 3, 33, 2),
(99, 12, 10, 3, 33, 3),
(100, 7, 12, 11, 34, 1),
(101, 8, 11, 11, 34, 2),
(102, 0, 0, NULL, 34, 3),
(103, 12, 8, 7, 35, 1),
(104, 11, 0, 7, 35, 2),
(105, 0, 0, NULL, 35, 3),
(106, 11, 2, 11, 36, 1),
(107, 11, 5, 11, 36, 2),
(108, 0, 0, NULL, 36, 3),
(109, 6, 12, 5, 37, 1),
(110, 9, 11, 5, 37, 2),
(111, 0, 0, NULL, 37, 3),
(112, 11, 5, 2, 38, 1),
(113, 11, 9, 2, 38, 2),
(114, 0, 0, NULL, 38, 3),
(115, 3, 11, 15, 39, 1),
(116, 7, 12, 15, 39, 2),
(117, 0, 0, NULL, 39, 3),
(118, 11, 5, 5, 40, 1),
(119, 11, 5, 5, 40, 2),
(120, 0, 0, NULL, 40, 3),
(121, 5, 12, 15, 41, 1),
(122, 9, 12, 15, 41, 2),
(123, 0, 0, NULL, 41, 3),
(124, 2, 12, 15, 42, 1),
(125, 2, 11, 15, 42, 2),
(126, 0, 0, NULL, 42, 3),
(127, 11, 5, 1, 43, 1),
(128, 11, 3, 1, 43, 2),
(129, 0, 0, NULL, 43, 3),
(130, 9, 12, 12, 44, 1),
(131, 12, 1, 1, 44, 2),
(132, 12, 2, 1, 44, 3),
(133, 11, 5, 1, 45, 1),
(134, 12, 7, 1, 45, 2),
(135, 0, 0, NULL, 45, 3),
(136, 12, 10, 6, 46, 1),
(137, 12, 4, 6, 46, 2),
(138, 0, 0, NULL, 46, 3),
(139, 0, 12, 16, 47, 1),
(140, 11, 5, 6, 47, 2),
(141, 12, 6, 6, 47, 3),
(142, 11, 5, 12, 48, 1),
(143, 6, 12, 16, 48, 2),
(144, 12, 8, 12, 48, 3),
(145, 0, 0, NULL, 49, 1),
(146, 0, 0, NULL, 49, 2),
(147, 0, 0, NULL, 49, 3),
(148, 0, 0, NULL, 50, 1),
(149, 0, 0, NULL, 50, 2),
(150, 0, 0, NULL, 50, 3),
(151, 0, 0, NULL, 51, 1),
(152, 0, 0, NULL, 51, 2),
(153, 0, 0, NULL, 51, 3),
(154, 0, 0, NULL, 52, 1),
(155, 0, 0, NULL, 52, 2),
(156, 0, 0, NULL, 52, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Group_`
--

CREATE TABLE IF NOT EXISTS `Group_` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `roundId` int(2) NOT NULL COMMENT 'Round this group belongs to',
  `minSets` int(1) NOT NULL DEFAULT '1' COMMENT 'Minimum number of sets to be played in each of the group''s games',
  `maxSets` int(2) NOT NULL DEFAULT '1' COMMENT 'Maximum number of sets to be played in each of the group''s games',
  `active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is this group''s games currently being played?',
  `completed` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Have all this group''s games been played?',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `Group_`
--

INSERT INTO `Group_` (`id`, `name`, `roundId`, `minSets`, `maxSets`, `active`, `completed`) VALUES
(2, 'Gruppe A', 1, 2, 3, 0, 1),
(3, 'Gruppe B', 1, 2, 3, 0, 1),
(4, 'Gruppe C', 1, 2, 3, 0, 1),
(5, 'Gruppe D', 1, 2, 3, 0, 1),
(6, 'Gruppe E', 2, 2, 3, 0, 1),
(7, 'Gruppe F', 2, 2, 3, 0, 1),
(8, 'Gruppe G (Pl. 9-12)', 2, 2, 3, 0, 1),
(9, 'Gruppe H (Pl. 13-16)', 2, 2, 3, 0, 1),
(10, 'Gruppe I (Pl. 7)', 3, 2, 3, 1, 0),
(11, 'Gruppe J (Pl. 5)', 3, 2, 3, 1, 0),
(12, 'Gruppe K (Pl. 3)', 3, 2, 3, 1, 0),
(13, 'Gruppe L (Finale)', 4, 2, 3, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Player`
--

CREATE TABLE IF NOT EXISTS `Player` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `groupId` int(3) NOT NULL COMMENT 'Group this player currently belongs to',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `points` int(3) NOT NULL DEFAULT '0' COMMENT 'Total points (0-n) player has been awarded for won sets. May be 1 per won game if only 1 set is played per game',
  `scoreRatio` int(4) DEFAULT NULL COMMENT 'Difference (-n...0...n) between player''s own and opponent''s scores (in games which this player participated in)',
  `rank` int(2) NOT NULL DEFAULT '0' COMMENT 'Rank in group. Updated after all this group''s games have been completed',
  `wonGames` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_Player_Group1_idx` (`groupId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

--
-- Dumping data for table `Player`
--

INSERT INTO `Player` (`id`, `groupId`, `name`, `points`, `scoreRatio`, `rank`, `wonGames`) VALUES
(1, 13, 'B. O.', 0, 0, 1, 0),
(2, 11, 'A. U.', 0, 0, 1, 0),
(3, 8, 'L. T.', 6, 6, 2, 2),
(4, 9, 'M. C.', 3, -16, 4, 1),
(5, 12, 'A. T.', 0, 0, 1, 0),
(6, 12, 'T. X.', 0, 0, 2, 0),
(7, 8, 'C. I.', 5, -5, 3, 1),
(8, 9, 'J. E.', 7, 5, 2, 2),
(11, 8, 'R. X.', 12, 38, 1, 3),
(12, 11, 'L. F.', 0, 0, 2, 0),
(13, 9, 'C. K.', 3, -11, 3, 0),
(14, 10, 'J. S.', 0, 0, 1, 0),
(15, 13, 'T. H.', 0, 0, 2, 0),
(16, 10, 'P. F.', 0, 0, 2, 0),
(17, 9, 'M. I.', 11, 22, 1, 3),
(18, 8, 'S. A.', 1, -39, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `RoundSwitchRule`
--

CREATE TABLE IF NOT EXISTS `RoundSwitchRule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `srcGroupId` int(11) NOT NULL COMMENT 'Group where players originate from.',
  `destGroupId` int(11) NOT NULL COMMENT 'Group players should be in in the next round.',
  `startWithRank` int(3) NOT NULL COMMENT 'Player with this rank in source group is the first to be moved from source group to destination group.',
  `additionalPlayers` int(3) NOT NULL COMMENT 'How many additional players should be moved from source to destination group?',
  `previousRoundId` int(3) NOT NULL COMMENT '(For safety. Remove if unused.) ',
  PRIMARY KEY (`id`),
  KEY `fk_rule_src_group` (`srcGroupId`),
  KEY `fk_rule_dest_group` (`destGroupId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `RoundSwitchRule`
--

INSERT INTO `RoundSwitchRule` (`id`, `srcGroupId`, `destGroupId`, `startWithRank`, `additionalPlayers`, `previousRoundId`) VALUES
(1, 2, 6, 1, 0, 0),
(2, 3, 6, 2, 0, 0),
(3, 4, 6, 1, 0, 0),
(4, 5, 6, 2, 0, 0),
(5, 2, 7, 2, 0, 0),
(6, 3, 7, 1, 0, 0),
(7, 4, 7, 2, 0, 0),
(8, 5, 7, 1, 0, 0),
(9, 2, 8, 3, 0, 0),
(10, 3, 8, 3, 0, 0),
(11, 4, 8, 3, 0, 0),
(12, 5, 8, 3, 0, 0),
(13, 2, 9, 4, 0, 0),
(14, 3, 9, 4, 0, 0),
(15, 4, 9, 4, 0, 0),
(16, 5, 9, 4, 0, 0),
(17, 6, 10, 4, 0, 0),
(18, 7, 10, 4, 0, 0),
(19, 6, 11, 3, 0, 0),
(20, 7, 11, 3, 0, 0),
(21, 6, 12, 2, 0, 0),
(22, 7, 12, 2, 0, 0),
(23, 6, 13, 1, 0, 0),
(24, 7, 13, 1, 0, 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Game`
--
ALTER TABLE `Game`
  ADD CONSTRAINT `fk_Game_Group` FOREIGN KEY (`groupId`) REFERENCES `Group_` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Game_Player1` FOREIGN KEY (`player1Id`) REFERENCES `Player` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Game_Player2` FOREIGN KEY (`player2Id`) REFERENCES `Player` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Game_Winner` FOREIGN KEY (`winnerId`) REFERENCES `Player` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `GameSet`
--
ALTER TABLE `GameSet`
  ADD CONSTRAINT `fk_GameSet_Game` FOREIGN KEY (`gameId`) REFERENCES `Game` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_GameSet_Winner` FOREIGN KEY (`winnerId`) REFERENCES `Player` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `Player`
--
ALTER TABLE `Player`
  ADD CONSTRAINT `fk_player_groupid` FOREIGN KEY (`groupId`) REFERENCES `Group_` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `RoundSwitchRule`
--
ALTER TABLE `RoundSwitchRule`
  ADD CONSTRAINT `fk_rule_dest_group` FOREIGN KEY (`destGroupId`) REFERENCES `Group_` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rule_src_group` FOREIGN KEY (`srcGroupId`) REFERENCES `Group_` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
