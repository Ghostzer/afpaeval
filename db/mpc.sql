-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 22, 2016 at 03:31 PM
-- Server version: 5.7.16-0ubuntu0.16.04.1
-- PHP Version: 7.0.8-0ubuntu0.16.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mpc`
--

-- --------------------------------------------------------

--
-- Table structure for table `bd`
--

CREATE TABLE `bd` (
  `id` int(11) NOT NULL,
  `ouvrage_id` int(11) DEFAULT NULL,
  `auteur` varchar(250) NOT NULL,
  `genre` varchar(250) NOT NULL,
  `date` date NOT NULL,
  `cover` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bd`
--

INSERT INTO `bd` (`id`, `ouvrage_id`, `auteur`, `genre`, `date`, `cover`) VALUES
(1, 1, 'Alexandre Astier', 'Humour', '2016-10-14', 'covers/kaamelott.jpg'),
(2, 2, 'ZEP', 'Humour', '2016-12-02', 'covers/titeuf.jpg'),
(3, 8, 'Midam', 'Humour', '2016-12-19', 'covers/kidpaddle.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `cd`
--

CREATE TABLE `cd` (
  `id` int(11) NOT NULL,
  `ouvrage_id` int(11) DEFAULT NULL,
  `artist` varchar(250) NOT NULL,
  `genre` varchar(250) NOT NULL,
  `date` date NOT NULL,
  `cover` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cd`
--

INSERT INTO `cd` (`id`, `ouvrage_id`, `artist`, `genre`, `date`, `cover`) VALUES
(2, 3, 'Metallica', 'Heavy metal', '2016-11-03', 'covers/metallica.jpg'),
(3, 6, 'Nero', 'Drum and Bass', '2016-12-16', 'covers/nero.jpg'),
(4, 10, 'Astrix', 'GOA', '2016-12-19', 'covers/astrix.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `emprunt`
--

CREATE TABLE `emprunt` (
  `id` int(11) NOT NULL,
  `ouvrage_id` int(11) DEFAULT NULL,
  `date_retour` date NOT NULL,
  `date_emprunt` date NOT NULL,
  `utilisateur_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `evenements`
--

CREATE TABLE `evenements` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `detail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `evenements`
--

INSERT INTO `evenements` (`id`, `titre`, `detail`, `date`) VALUES
(3, 'Porte ouverte', 'Venez découvrir notre super médiathèque ! Tout le monde est admis.', '2016-12-28 00:00:00'),
(4, 'Devenez un super héro/vilain !', 'L\'associatoin CPT "Comics Pour Tous" viendra nous rendre visite le vendredi 3 février 2017 pour une conférence sur les BD Comics. Amateur ou curieux, n\'hésitez pas ! Conférence gratuite.', '2017-02-03 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `historique`
--

CREATE TABLE `historique` (
  `id` int(11) NOT NULL,
  `ouvrage_id` int(11) DEFAULT NULL,
  `date_retour` datetime NOT NULL,
  `date_emprunt` datetime NOT NULL,
  `utilisateur_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `historique`
--

INSERT INTO `historique` (`id`, `ouvrage_id`, `date_retour`, `date_emprunt`, `utilisateur_id`) VALUES
(4, 4, '2016-11-22 00:00:00', '2016-11-08 00:00:00', 7),
(5, 9, '2016-10-19 00:00:00', '2016-10-05 00:00:00', 8),
(6, 6, '2016-11-19 00:00:00', '2016-11-05 00:00:00', 7),
(7, 10, '2016-12-25 00:00:00', '2016-12-11 00:00:00', 8);

-- --------------------------------------------------------

--
-- Table structure for table `livre`
--

CREATE TABLE `livre` (
  `id` int(11) NOT NULL,
  `ouvrage_id` int(11) DEFAULT NULL,
  `auteur` varchar(250) NOT NULL,
  `genre` varchar(250) NOT NULL,
  `date` date NOT NULL,
  `cover` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `livre`
--

INSERT INTO `livre` (`id`, `ouvrage_id`, `auteur`, `genre`, `date`, `cover`) VALUES
(1, 4, 'J.R.R. Tolkien', 'Fantaisie', '2016-12-15', 'covers/sda.jpg'),
(2, 7, 'Tom Clancy', 'Militaire', '2016-11-25', 'covers/tomclancy.jpg'),
(3, 9, 'Peter Grimsdale', 'Guerre', '2016-12-19', 'covers/bf4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `ouvrage`
--

CREATE TABLE `ouvrage` (
  `id` int(11) NOT NULL,
  `titre` varchar(250) NOT NULL,
  `annee` int(11) NOT NULL,
  `cover` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ouvrage`
--

INSERT INTO `ouvrage` (`id`, `titre`, `annee`, `cover`) VALUES
(1, 'Kaamelott & Le Serpent Géant', 1999, 'covers/asterix.jpg'),
(2, 'Titeuf C\'est pô juste !', 2002, ''),
(3, 'Ride The Lightning', 1984, ''),
(4, 'Le seigneurs des anneaux', 1981, ''),
(6, 'Between II Worlds', 2015, ''),
(7, 'Mort ou vif 2', 2009, ''),
(8, 'Kid Paddle Carnage Total', 2006, ''),
(9, 'Battlefield 4', 2013, ''),
(10, 'ArtCore', 1998, '');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `ouvrage_id` int(11) DEFAULT NULL,
  `utilisateur_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`id`, `date`, `ouvrage_id`, `utilisateur_id`) VALUES
(16, '2016-12-22', 8, 7),
(17, '2016-12-22', 9, 8),
(18, '2016-12-22', 7, 8);

-- --------------------------------------------------------

--
-- Table structure for table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id` int(11) NOT NULL,
  `nom` varchar(250) DEFAULT NULL,
  `prenom` varchar(250) DEFAULT NULL,
  `username` varchar(180) NOT NULL,
  `username_canonical` varchar(180) NOT NULL,
  `email` varchar(180) NOT NULL,
  `email_canonical` varchar(180) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `nom`, `prenom`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`) VALUES
(3, NULL, NULL, 'admin', 'admin', 'admin@admin.admin', 'admin@admin.admin', 1, NULL, '$2y$13$it43c46j0Rc5FbWdn9Mq0.2S/KtMqyqOeRYM8B6bu2jn9F/A1vNTe', '2016-12-22 14:29:43', NULL, NULL, 'a:1:{i:0;s:16:"ROLE_SUPER_ADMIN";}'),
(7, NULL, NULL, 'alice', 'alice', 'alice@alice.alice', 'alice@alice.alice', 1, NULL, '$2y$13$fda4JkwpJHYSNB5mTOwD0uVxKhrkdXZBEnloCxqvoEQh4WapqHmVq', '2016-12-22 13:54:58', NULL, NULL, 'a:0:{}'),
(8, NULL, NULL, 'bob', 'bob', 'bob@bob.bob', 'bob@bob.bob', 1, NULL, '$2y$13$jQUoEYDEpAIQ3VQUGC8YD.oaQxittas0xIA/lpMiWR0LDkLTUdW.y', '2016-12-22 14:28:37', NULL, NULL, 'a:0:{}');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bd`
--
ALTER TABLE `bd`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ouvrage_id` (`ouvrage_id`);

--
-- Indexes for table `cd`
--
ALTER TABLE `cd`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ouvrage_id` (`ouvrage_id`);

--
-- Indexes for table `emprunt`
--
ALTER TABLE `emprunt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ouvrage_id` (`ouvrage_id`),
  ADD KEY `IDX_364071D7FB88E14F` (`utilisateur_id`);

--
-- Indexes for table `evenements`
--
ALTER TABLE `evenements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `historique`
--
ALTER TABLE `historique`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ouvrage_id` (`ouvrage_id`),
  ADD KEY `IDX_EDBFD5ECFB88E14F` (`utilisateur_id`);

--
-- Indexes for table `livre`
--
ALTER TABLE `livre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ouvrage_id` (`ouvrage_id`);

--
-- Indexes for table `ouvrage`
--
ALTER TABLE `ouvrage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ouvrage_id` (`ouvrage_id`),
  ADD KEY `IDX_42C84955FB88E14F` (`utilisateur_id`);

--
-- Indexes for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_497B315E92FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_497B315EA0D96FBF` (`email_canonical`),
  ADD UNIQUE KEY `UNIQ_497B315EC05FB297` (`confirmation_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bd`
--
ALTER TABLE `bd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `cd`
--
ALTER TABLE `cd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `emprunt`
--
ALTER TABLE `emprunt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `evenements`
--
ALTER TABLE `evenements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `historique`
--
ALTER TABLE `historique`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `livre`
--
ALTER TABLE `livre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ouvrage`
--
ALTER TABLE `ouvrage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `bd`
--
ALTER TABLE `bd`
  ADD CONSTRAINT `FK_5CCDBE9B15D884B5` FOREIGN KEY (`ouvrage_id`) REFERENCES `ouvrage` (`id`);

--
-- Constraints for table `cd`
--
ALTER TABLE `cd`
  ADD CONSTRAINT `FK_45D68FDA15D884B5` FOREIGN KEY (`ouvrage_id`) REFERENCES `ouvrage` (`id`);

--
-- Constraints for table `emprunt`
--
ALTER TABLE `emprunt`
  ADD CONSTRAINT `FK_364071D715D884B5` FOREIGN KEY (`ouvrage_id`) REFERENCES `ouvrage` (`id`),
  ADD CONSTRAINT `FK_364071D7FB88E14F` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`);

--
-- Constraints for table `historique`
--
ALTER TABLE `historique`
  ADD CONSTRAINT `FK_EDBFD5EC15D884B5` FOREIGN KEY (`ouvrage_id`) REFERENCES `ouvrage` (`id`),
  ADD CONSTRAINT `FK_EDBFD5ECFB88E14F` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`);

--
-- Constraints for table `livre`
--
ALTER TABLE `livre`
  ADD CONSTRAINT `FK_AC634F9915D884B5` FOREIGN KEY (`ouvrage_id`) REFERENCES `ouvrage` (`id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `FK_42C8495515D884B5` FOREIGN KEY (`ouvrage_id`) REFERENCES `ouvrage` (`id`),
  ADD CONSTRAINT `FK_42C84955FB88E14F` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
