-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Jun 20, 2023 at 07:53 AM
-- Server version: 8.0.33
-- PHP Version: 8.1.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ikeo`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id_client` int NOT NULL,
  `type` varchar(20) NOT NULL,
  `raison_sociale` varchar(40) NOT NULL,
  `adresse_c` varchar(30) NOT NULL,
  `ville_c` varchar(20) NOT NULL,
  `pays_c` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id_client`, `type`, `raison_sociale`, `adresse_c`, `ville_c`, `pays_c`) VALUES
(1, 'magasin', 'Bo Meuble', 'Place Vendôme', 'Paris', 'France'),
(2, 'magasin', 'Mobel', 'Porte de Brandebourg', 'Berlin', 'Allemagne'),
(3, 'magasin', 'Bo Meuble', 'Rue Jean Jaurès', 'Brest', 'France'),
(4, 'magasin', 'Tout A La Maison', 'Rue de la Bastille', 'Paris', 'France'),
(5, 'magasin', 'Bo Meuble', 'Avenue des Trois Dragons', 'Barcelone', 'Espagne'),
(6, 'centrale d\'achat', 'The World Compagny', 'Oxford street', 'Londres', 'Angleterre'),
(7, 'magasin', 'The Best Greatest Beautifulest Furniture', 'Coven Garden', 'Londres', 'Angleterre');

-- --------------------------------------------------------

--
-- Table structure for table `factures`
--

CREATE TABLE `factures` (
  `id_fact` int NOT NULL,
  `numero` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `id_client` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `factures`
--

INSERT INTO `factures` (`id_fact`, `numero`, `date`, `id_client`) VALUES
(1, 'MSQ291', '2018-06-15', 1),
(2, 'MSQ292', '2018-06-23', 5),
(3, 'MSQ293', '2018-06-23', 6),
(4, 'MSQ294', '2018-06-28', 1),
(5, 'MSQ295', '2018-07-01', 4),
(6, 'MSQ296', '2018-07-04', 7),
(7, 'MSQ297', '2018-07-12', 2);

-- --------------------------------------------------------

--
-- Table structure for table `factures_produits`
--

CREATE TABLE `factures_produits` (
  `id_fact` int NOT NULL,
  `id_produit` int NOT NULL,
  `quantite` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `factures_produits`
--

INSERT INTO `factures_produits` (`id_fact`, `id_produit`, `quantite`) VALUES
(1, 1, 20),
(1, 2, 30),
(1, 3, 10),
(2, 8, 25),
(2, 4, 32),
(3, 3, 80),
(3, 5, 70),
(3, 6, 60),
(3, 4, 60),
(3, 9, 120),
(3, 7, 90),
(4, 1, 10),
(4, 2, 10),
(4, 6, 30),
(5, 1, 25),
(5, 7, 34),
(6, 2, 40),
(6, 5, 38),
(6, 6, 54),
(7, 4, 20),
(7, 5, 34),
(7, 6, 45);

-- --------------------------------------------------------

--
-- Table structure for table `produits`
--

CREATE TABLE `produits` (
  `id_produit` int NOT NULL,
  `nom` varchar(30) NOT NULL,
  `ref` varchar(10) NOT NULL,
  `description` varchar(50) NOT NULL,
  `etat` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `produits`
--

INSERT INTO `produits` (`id_produit`, `nom`, `ref`, `description`, `etat`) VALUES
(1, 'Knutsen', 'OANT72', 'Table basse pour poser les bières', 'Non'),
(2, 'Moen', 'OANT34', 'Chaise haute de bar', 'Oui'),
(3, 'Eide', 'OANT67', 'Porte-serviettes pour 100 serviettes', 'Non'),
(4, 'Gulbrandsen', 'LXAL34', 'Lit nuage en lévitation', 'Non'),
(5, 'Naess', 'LXAL56', 'Table 128 convives', 'Non'),
(6, 'Lund', 'LXAL 78', 'Bureau-cafetière électrique', 'Non'),
(7, 'Dahl', 'LXAL12', 'Tiroir à ronds de serviette ', 'Oui'),
(8, 'Ruud', 'OANT90', 'Bureau-lit combiné', 'Non'),
(9, 'Apfelgluk', 'OANT12', 'Panier à chien (ou à chat)', 'Non');

-- --------------------------------------------------------

--
-- Table structure for table `sites_production`
--

CREATE TABLE `sites_production` (
  `id_site` int NOT NULL,
  `usine` varchar(30) NOT NULL,
  `adresse` varchar(30) NOT NULL,
  `ville` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sites_production`
--

INSERT INTO `sites_production` (`id_site`, `usine`, `adresse`, `ville`) VALUES
(1, 'Harald', 'Quai Pipervika', 'Oslo'),
(2, 'Sverre', 'Rue Strangehagen', 'Bergen'),
(3, 'Olaf', 'Place Nidaros', 'Trondheim');

-- --------------------------------------------------------

--
-- Table structure for table `sites_produits`
--

CREATE TABLE `sites_produits` (
  `id_site` int NOT NULL,
  `id_produit` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sites_produits`
--

INSERT INTO `sites_produits` (`id_site`, `id_produit`) VALUES
(1, 1),
(2, 1),
(1, 2),
(2, 2),
(1, 3),
(3, 3),
(3, 4),
(1, 5),
(2, 5),
(3, 5),
(1, 6),
(3, 6),
(2, 7),
(3, 7),
(3, 8),
(3, 9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`);

--
-- Indexes for table `factures`
--
ALTER TABLE `factures`
  ADD PRIMARY KEY (`id_fact`),
  ADD KEY `id_client` (`id_client`);

--
-- Indexes for table `factures_produits`
--
ALTER TABLE `factures_produits`
  ADD KEY `id_produit` (`id_produit`),
  ADD KEY `id_fact` (`id_fact`);

--
-- Indexes for table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id_produit`);

--
-- Indexes for table `sites_production`
--
ALTER TABLE `sites_production`
  ADD PRIMARY KEY (`id_site`);

--
-- Indexes for table `sites_produits`
--
ALTER TABLE `sites_produits`
  ADD KEY `id_produit` (`id_produit`),
  ADD KEY `id_site` (`id_site`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id_client` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `factures`
--
ALTER TABLE `factures`
  MODIFY `id_fact` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `produits`
--
ALTER TABLE `produits`
  MODIFY `id_produit` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sites_production`
--
ALTER TABLE `sites_production`
  MODIFY `id_site` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `factures`
--
ALTER TABLE `factures`
  ADD CONSTRAINT `factures_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `factures_produits`
--
ALTER TABLE `factures_produits`
  ADD CONSTRAINT `factures_produits_ibfk_3` FOREIGN KEY (`id_produit`) REFERENCES `produits` (`id_produit`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `factures_produits_ibfk_4` FOREIGN KEY (`id_fact`) REFERENCES `factures` (`id_fact`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `sites_produits`
--
ALTER TABLE `sites_produits`
  ADD CONSTRAINT `sites_produits_ibfk_1` FOREIGN KEY (`id_produit`) REFERENCES `produits` (`id_produit`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `sites_produits_ibfk_2` FOREIGN KEY (`id_site`) REFERENCES `sites_production` (`id_site`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
