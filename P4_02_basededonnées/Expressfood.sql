-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 27, 2020 at 11:04 AM
-- Server version: 10.2.31-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hichmxzr_Expressfood2`
--

-- --------------------------------------------------------

--
-- Table structure for table `adresse`
--

CREATE TABLE `adresse` (
  `adresse_id` int(11) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `rue` varchar(100) NOT NULL,
  `numero` int(11) NOT NULL,
  `code_postal` varchar(20) NOT NULL,
  `etage` smallint(4) DEFAULT NULL,
  `batiment` varchar(50) DEFAULT NULL,
  `digicode` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `adresse`
--

INSERT INTO `adresse` (`adresse_id`, `ville`, `rue`, `numero`, `code_postal`, `etage`, `batiment`, `digicode`) VALUES
(1, 'Lille', 'Rue du Monopoly', 6, '59000', NULL, NULL, NULL),
(2, 'Nancy', 'place Stanislas', 36, '54100', NULL, NULL, NULL),
(3, 'Gap', 'rue Saint Germain', 41, '0500', NULL, NULL, NULL),
(4, 'Rennes', 'rue Lenotre', 95, '3500', 2, 'B', '4517'),
(5, 'Etampes', 'rue du Palais', 79, '91150', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `client_id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `password` binary(60) NOT NULL,
  `adresse_facturation_id` int(11) NOT NULL,
  `adresse_livraison_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`client_id`, `nom`, `prenom`, `email`, `telephone`, `password`, `adresse_facturation_id`, `adresse_livraison_id`) VALUES
(1, 'Depraetere', 'Alexandre', 'depraetere.alexandre@gmail.com', '0471202592', 0x2432792431302432796e506377572f4943545950786b78632f6e4836656c567744776d4937656c4e4d434459773148385635586f5949666c786b7543, 1, 1),
(2, 'Noel', 'Stéphanie', 'stéphanie.noel@gmail.com', '0159324030', 0x2432792431302432796e506377572f4943545950786b78632f6e4836656c567744776d4937656c4e4d434459773148385635586f5949666c786b7543, 2, 2),
(3, 'Fluet', 'Renée', 'renee.fluet@gmail.com', '0233687820', 0x2432792431302432796e506377572f4943545950786b78632f6e4836656c567744776d4937656c4e4d434459773148385635586f5949666c786b7543, 3, 3),
(4, 'Dufresne', 'Denis', 'dufresne.denis@gmail.com', ' 0289103513', 0x2432792431302432796e506377572f4943545950786b78632f6e4836656c567744776d4937656c4e4d434459773148385635586f5949666c786b7543, 4, 4),
(5, 'Valiant', 'Bernard', 'valiant.bernard', ' 0164667107', 0x2432792431302432796e506377572f4943545950786b78632f6e4836656c567744776d4937656c4e4d434459773148385635586f5949666c786b7543, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `Clientadresse`
--

CREATE TABLE `Clientadresse` (
  `Clientadresse_id` int(11) NOT NULL,
  `Client_id` int(11) NOT NULL,
  `Adresse_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Clientadresse`
--

INSERT INTO `Clientadresse` (`Clientadresse_id`, `Client_id`, `Adresse_id`) VALUES
(1, 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `commande`
--

CREATE TABLE `commande` (
  `commande_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `livreur_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `commande_statut` enum('En cours','En attente','Complétée','Annulée') NOT NULL,
  `date_livraison` datetime NOT NULL,
  `paiement` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `commande`
--

INSERT INTO `commande` (`commande_id`, `client_id`, `livreur_id`, `date`, `commande_statut`, `date_livraison`, `paiement`) VALUES
(1, 1, 2, '2018-10-02 08:25:15', 'En cours', '2018-10-02 09:30:00', 1),
(2, 3, 2, '2018-10-07 00:00:00', 'En cours', '2018-10-07 16:00:00', 1),
(3, 3, NULL, '2018-10-09 09:11:28', 'En attente', '2018-10-12 09:30:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ligne_commande`
--

CREATE TABLE `ligne_commande` (
  `commande_id` int(11) NOT NULL,
  `plat_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ligne_commande`
--

INSERT INTO `ligne_commande` (`commande_id`, `plat_id`, `quantite`) VALUES
(1, 1, 2),
(1, 3, 2),
(2, 1, 4),
(2, 4, 2),
(3, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `livreur`
--

CREATE TABLE `livreur` (
  `livreur_id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `statut_livreur` enum('En livraison','Libre','Indisponible','') NOT NULL,
  `longitude` varchar(30) NOT NULL,
  `latitude` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `livreur`
--

INSERT INTO `livreur` (`livreur_id`, `nom`, `prenom`, `telephone`, `statut_livreur`, `longitude`, `latitude`) VALUES
(1, 'Bazin', 'Didiane', '0221776563', 'En livraison', '50.629756', '3.049220'),
(2, 'Lévesque', 'Roxanne', ' 0110060818', 'En livraison', '48.691553', '6.176741');

-- --------------------------------------------------------

--
-- Table structure for table `plat`
--

CREATE TABLE `plat` (
  `plat_id` int(11) NOT NULL,
  `plat_nom` varchar(100) NOT NULL,
  `prix_unitaire` decimal(6,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `type_plat` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plat`
--

INSERT INTO `plat` (`plat_id`, `plat_nom`, `prix_unitaire`, `stock`, `type_plat`) VALUES
(1, 'Boeuf bourguignon', 10.89, 15, 1),
(2, 'Choucroute garnie', 11.20, 12, 1),
(3, 'Crème brûlée', 8.34, 14, 2),
(4, 'Riz au lait', 7.99, 9, 2);

-- --------------------------------------------------------

--
-- Table structure for table `plat_du_jour`
--

CREATE TABLE `plat_du_jour` (
  `plat_du_jour_id` int(11) NOT NULL,
  `plat_id` int(11) NOT NULL,
  `date_menu` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plat_du_jour`
--

INSERT INTO `plat_du_jour` (`plat_du_jour_id`, `plat_id`, `date_menu`) VALUES
(1, 1, '2018-10-02'),
(2, 2, '2018-10-02'),
(3, 3, '2018-10-02'),
(4, 4, '2018-10-02');

-- --------------------------------------------------------

--
-- Table structure for table `stock_livreur`
--

CREATE TABLE `stock_livreur` (
  `livreur_id` int(11) NOT NULL,
  `plat_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stock_livreur`
--

INSERT INTO `stock_livreur` (`livreur_id`, `plat_id`, `quantite`) VALUES
(1, 1, 4),
(1, 2, 2),
(1, 3, 5),
(2, 4, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adresse`
--
ALTER TABLE `adresse`
  ADD PRIMARY KEY (`adresse_id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `adresse_id` (`adresse_facturation_id`),
  ADD KEY `adresse_livraison_id` (`adresse_livraison_id`);

--
-- Indexes for table `Clientadresse`
--
ALTER TABLE `Clientadresse`
  ADD PRIMARY KEY (`Clientadresse_id`),
  ADD KEY `Client_id` (`Client_id`),
  ADD KEY `Adresse_id` (`Adresse_id`);

--
-- Indexes for table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`commande_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `livreur_id` (`livreur_id`);

--
-- Indexes for table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD PRIMARY KEY (`commande_id`,`plat_id`),
  ADD KEY `plat_id` (`plat_id`);

--
-- Indexes for table `livreur`
--
ALTER TABLE `livreur`
  ADD PRIMARY KEY (`livreur_id`);

--
-- Indexes for table `plat`
--
ALTER TABLE `plat`
  ADD PRIMARY KEY (`plat_id`);

--
-- Indexes for table `plat_du_jour`
--
ALTER TABLE `plat_du_jour`
  ADD PRIMARY KEY (`plat_du_jour_id`),
  ADD KEY `plat_id` (`plat_id`);

--
-- Indexes for table `stock_livreur`
--
ALTER TABLE `stock_livreur`
  ADD PRIMARY KEY (`livreur_id`,`plat_id`),
  ADD KEY `plat_id` (`plat_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adresse`
--
ALTER TABLE `adresse`
  MODIFY `adresse_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Clientadresse`
--
ALTER TABLE `Clientadresse`
  MODIFY `Clientadresse_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `commande`
--
ALTER TABLE `commande`
  MODIFY `commande_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `livreur`
--
ALTER TABLE `livreur`
  MODIFY `livreur_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `plat`
--
ALTER TABLE `plat`
  MODIFY `plat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `plat_du_jour`
--
ALTER TABLE `plat_du_jour`
  MODIFY `plat_du_jour_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Clientadresse`
--
ALTER TABLE `Clientadresse`
  ADD CONSTRAINT `Clientadresse_ibfk_1` FOREIGN KEY (`Client_id`) REFERENCES `client` (`client_id`),
  ADD CONSTRAINT `Clientadresse_ibfk_2` FOREIGN KEY (`Adresse_id`) REFERENCES `adresse` (`adresse_id`);

--
-- Constraints for table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`),
  ADD CONSTRAINT `commande_ibfk_2` FOREIGN KEY (`livreur_id`) REFERENCES `livreur` (`livreur_id`);

--
-- Constraints for table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD CONSTRAINT `ligne_commande_ibfk_1` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`commande_id`),
  ADD CONSTRAINT `ligne_commande_ibfk_2` FOREIGN KEY (`plat_id`) REFERENCES `plat` (`plat_id`);

--
-- Constraints for table `plat_du_jour`
--
ALTER TABLE `plat_du_jour`
  ADD CONSTRAINT `plat_du_jour_ibfk_1` FOREIGN KEY (`plat_id`) REFERENCES `plat` (`plat_id`);

--
-- Constraints for table `stock_livreur`
--
ALTER TABLE `stock_livreur`
  ADD CONSTRAINT `stock_livreur_ibfk_1` FOREIGN KEY (`livreur_id`) REFERENCES `livreur` (`livreur_id`),
  ADD CONSTRAINT `stock_livreur_ibfk_2` FOREIGN KEY (`plat_id`) REFERENCES `plat` (`plat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
