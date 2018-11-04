-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Dim 04 Novembre 2018 à 11:15
-- Version du serveur :  5.7.18
-- Version de PHP :  7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `borabora`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `verifRdvDisponible` (IN `startV` DATETIME, IN `endV` DATETIME, IN `cabineV` VARCHAR(10), OUT `nb_result` INT ZEROFILL)  BEGIN 
	SELECT COUNT(resourceId) INTO nb_result FROM planning WHERE resourceId = cabineV AND ((planning.start >= startV AND planning.start < endV) OR (planning.end > startV AND planning.end <= endV)); 
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `brasserie`
--

CREATE TABLE `brasserie` (
  `num_plat` int(3) NOT NULL,
  `lib_plat` varchar(50) DEFAULT NULL,
  `prix_plat` float DEFAULT NULL,
  `cat` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `brasserie`
--

INSERT INTO `brasserie` (`num_plat`, `lib_plat`, `prix_plat`, `cat`) VALUES
(1, 'Salade Tahitienne', 2050, 'ENTSAL'),
(2, 'Os à la Moelle au sel de Guérande', 1500, 'ENTSAL'),
(3, 'Salade Tiède au Jarret', 2050, 'ENTSAL'),
(4, 'Tartine au Chèvre Chaud sur Salade', 1750, 'ENTSAL'),
(5, 'Salade Jean Pierre', 2050, 'ENTSAL'),
(6, 'Salade Verte huile olive ou vinaigrette', 800, 'ENTSAL'),
(7, 'Salade Verta Roquefort et Noix', 950, 'ENTSAL'),
(8, 'Crevettes poelées et flambées', 2950, 'CREPAY'),
(9, 'Crevettes poelées au Curry et amandes', 2950, 'CREPAY'),
(10, 'Tartare de Thon à la moutarde et Garniture', 2450, 'PROMER'),
(11, 'Steack de Thon mi-cuit sauce vierge Fruits frais', 2850, 'PROMER'),
(12, 'Noix d\'Entrecôte 200g', 2850, 'VIANDE'),
(13, 'Noix d\'Entrecôte 350g', 3750, 'VIANDE'),
(14, 'La Churascaia 500g', 5100, 'VIANDE'),
(15, 'Travers de Porc Sauce Barbecue', 3150, 'VIANDE'),
(16, 'Escalope de Veau Normande', 2650, 'VIANDE'),
(17, 'Os à la Moelle en accompagnement', 500, 'VIANDE'),
(18, 'Tartare de Boeuf aux Condiments', 2650, 'VIANDE'),
(19, 'Sauce au choix', 300, 'VIANDE'),
(20, 'Hamburger pur Boeuf Frites à Volonté', 2050, 'HAMBUR'),
(21, 'Tagliatelle Carbonara', 1700, 'PATES'),
(22, 'Tagliatelle au Saumon', 2800, 'PATES'),
(23, 'Tagliatelle Crevttes Décortiquées', 2800, 'PATES'),
(24, 'Flammekueche Formule à Volonté', 2050, 'FLAMME'),
(25, 'La Classique', 1200, 'FLAMME'),
(26, 'La Forestière', 1350, 'FLAMME'),
(27, 'La Gratinée', 1350, 'FLAMME'),
(28, 'La Spéciale', 1500, 'FLAMME'),
(29, 'La Chèvre Chaud', 1600, 'FLAMME'),
(30, 'La Choucroute', 1750, 'FLAMME'),
(31, 'La Napolitaine', 1450, 'FLAMME'),
(32, 'La Saumon', 1800, 'FLAMME'),
(33, 'La Végétarienne', 1500, 'FLAMME'),
(34, 'La Crevette', 1950, 'FLAMME'),
(35, 'Les Trois Fromages', 1700, 'FLAMME'),
(36, 'La Charcutière', 1800, 'FLAMME'),
(37, 'La Pomme', 950, 'FLAMME'),
(38, 'La Pomme Glacée', 1200, 'FLAMME'),
(39, 'La Belle Hélène', 1150, 'FLAMME'),
(40, 'La Ch\'ti', 1200, 'FLAMME'),
(41, 'La Normande', 1200, 'FLAMME'),
(42, 'La Cococ', 1600, 'FLAMME'),
(43, 'La Spéciale Sucrée', 1100, 'FLAMME'),
(44, 'La Tout Chocolat', 1100, 'FLAMME'),
(45, 'La Martiniquaise', 1200, 'FLAMME');

-- --------------------------------------------------------

--
-- Structure de la table `cat_brasserie`
--

CREATE TABLE `cat_brasserie` (
  `categorie` varchar(6) NOT NULL,
  `libelle` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `cat_brasserie`
--

INSERT INTO `cat_brasserie` (`categorie`, `libelle`) VALUES
('CREPAY', 'Crevette Pays'),
('ENTSAL', 'Entrées, Salades'),
('FLAMME', 'Flammekueche '),
('HAMBUR', 'Hamburger'),
('PATES', 'Les Pâtes'),
('PROMER', 'Produits de la Mer'),
('VIANDE', 'Les Viandes');

-- --------------------------------------------------------

--
-- Structure de la table `cat_cons`
--

CREATE TABLE `cat_cons` (
  `categorie` varchar(6) NOT NULL,
  `libelle` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `cat_cons`
--

INSERT INTO `cat_cons` (`categorie`, `libelle`) VALUES
('ALCOOL', 'Alcool'),
('APEBIE', 'Apéritif à la bière'),
('APERIT', 'Apéritif'),
('BIEAMB', 'Bière ambrée'),
('BIEBLA', 'Bière blanche'),
('BIEBLO', 'Bière blonde'),
('BIESCO', 'Bière scotch'),
('BIESPE', 'Bière spéciale'),
('COKBIE', 'Apéritif à la bière'),
('COKTAI', 'Coktail'),
('EAUMIN', 'Eaux minérales'),
('JUSFRA', 'Jus de fruits frais'),
('LACAVE', 'La cave'),
('NECTAR', 'Nectars'),
('SODAS', 'Sodas'),
('WHISKY', 'Whisky');

-- --------------------------------------------------------

--
-- Structure de la table `chambre`
--

CREATE TABLE `chambre` (
  `N°_Chambre` int(11) NOT NULL,
  `Type_Chambre` varchar(50) NOT NULL,
  `Prix_Chambre` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `chambre`
--

INSERT INTO `chambre` (`N°_Chambre`, `Type_Chambre`, `Prix_Chambre`) VALUES
(1, 'Classique', 17000),
(2, 'Classique', 17000),
(3, 'Classique', 17000),
(4, 'Classique', 17000),
(5, 'Classique', 17000),
(6, 'Classique', 17000),
(7, 'Classique', 17000),
(8, 'Classique', 17000),
(9, 'Classique', 17000),
(10, 'Classique', 17000),
(11, 'Classique', 17000),
(12, 'Classique', 17000),
(13, 'Classique', 17000),
(14, 'Classique', 17000),
(15, 'Classique', 17000),
(16, 'Classique', 17000),
(17, 'Classique', 17000),
(18, 'Classique', 17000),
(19, 'Classique', 17000),
(20, 'Classique', 17000),
(30, 'Suite Classique', 37000),
(31, 'Suite Classique', 37000),
(32, 'Suite Classique', 37000),
(33, 'Suite Classique', 37000),
(34, 'Suite Classique', 37000),
(35, 'Suite Classique', 37000),
(36, 'Suite Classique', 37000),
(37, 'Suite Classique', 37000),
(38, 'Suite Classique', 37000),
(39, 'Suite Classique', 37000),
(40, 'Suite Classique', 37000),
(41, 'Suite Classique', 37000),
(42, 'Suite Classique', 37000),
(43, 'Suite Classique', 37000),
(44, 'Suite Classique', 37000),
(45, 'Suite Classique', 37000),
(46, 'Suite Classique', 37000),
(47, 'Suite Classique', 37000),
(48, 'Suite Classique', 37000),
(49, 'Suite Classique', 37000),
(50, 'Suite Classique', 37000),
(60, 'Bungalow Vue Mer', 32000),
(61, 'Bungalow Vue Mer', 32000),
(62, 'Bungalow Vue Mer', 32000),
(63, 'Bungalow Vue Mer', 32000),
(64, 'Bungalow Vue Mer', 32000),
(65, 'Bungalow Vue Mer', 32000),
(66, 'Bungalow Vue Mer', 32000),
(67, 'Bungalow Vue Mer', 32000),
(68, 'Bungalow Vue Mer', 32000),
(69, 'Bungalow Vue Mer', 32000),
(70, 'Bungalow Vue Mer', 32000),
(71, 'Bungalow Vue Mer', 32000),
(72, 'Bungalow Vue Mer', 32000),
(73, 'Bungalow Vue Mer', 32000),
(74, 'Bungalow Vue Mer', 32000),
(75, 'Bungalow Vue Mer', 32000),
(76, 'Bungalow Vue Mer', 32000),
(77, 'Bungalow Vue Mer', 32000),
(78, 'Bungalow Vue Mer', 32000),
(79, 'Bungalow Vue Mer', 32000),
(80, 'Bungalow Vue Mer', 32000),
(90, 'Bungalow Vue Jardin', 26000),
(91, 'Bungalow Vue Jardin', 26000),
(92, 'Bungalow Vue Jardin', 26000),
(93, 'Bungalow Vue Jardin', 26000),
(94, 'Bungalow Vue Jardin', 26000),
(95, 'Bungalow Vue Jardin', 26000),
(96, 'Bungalow Vue Jardin', 26000),
(97, 'Bungalow Vue Jardin', 26000),
(98, 'Bungalow Vue Jardin', 26000),
(99, 'Bungalow Vue Jardin', 26000),
(100, 'Bungalow Vue Jardin', 26000),
(101, 'Bungalow Vue Jardin', 26000),
(102, 'Bungalow Vue Jardin', 26000),
(103, 'Bungalow Vue Jardin', 26000),
(104, 'Bungalow Vue Jardin', 26000),
(105, 'Bungalow Vue Jardin', 26000),
(106, 'Bungalow Vue Jardin', 26000),
(107, 'Bungalow Vue Jardin', 26000),
(108, 'Bungalow Vue Jardin', 26000),
(109, 'Bungalow Vue Jardin', 26000),
(110, 'Bungalow Vue Jardin', 26000);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `Num_Client` int(11) NOT NULL,
  `Nom_Client` varchar(30) NOT NULL,
  `Prenom_Client` varchar(30) NOT NULL,
  `Nationalite` varchar(20) NOT NULL,
  `Chambre_Client` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`Num_Client`, `Nom_Client`, `Prenom_Client`, `Nationalite`, `Chambre_Client`) VALUES
(201801, 'DUPONT', 'Andre', 'Française', ''),
(201802, 'DURAND', 'Paule', 'Française', ''),
(201803, 'SMITH', 'John', 'Australien', ''),
(201804, 'WILLIAMS', 'Isabella', 'Australien', ''),
(201805, 'ROSSI', 'Stephano', 'Italien', ''),
(201806, 'RUSSO', 'Isabella', 'Italien', '');

-- --------------------------------------------------------

--
-- Structure de la table `comprend_bar`
--

CREATE TABLE `comprend_bar` (
  `num_fact` int(11) NOT NULL,
  `num_cons` int(3) NOT NULL,
  `qte` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `comprend_brasserie`
--

CREATE TABLE `comprend_brasserie` (
  `num_fact` int(11) NOT NULL,
  `num_plat` int(3) NOT NULL,
  `qte` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `consommation`
--

CREATE TABLE `consommation` (
  `id` int(3) NOT NULL,
  `libelle` varchar(50) DEFAULT NULL,
  `prix` float DEFAULT NULL,
  `categorie` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `consommation`
--

INSERT INTO `consommation` (`id`, `libelle`, `prix`, `categorie`) VALUES
(1, 'Demi 25cl', 700, 'BIEBLA'),
(2, 'Taverne 33cl', 800, 'BIEBLA'),
(3, 'Brasseur 50cl', 1000, 'BIEBLA'),
(4, 'Formidable 100cl', 1900, 'BIEBLA'),
(5, 'Pichet 1,5l', 3200, 'BIEBLA'),
(6, 'Le mètre 25cl *10', 5000, 'BIEBLA'),
(7, 'Demi 25cl', 700, 'BIEBLO'),
(8, 'Taverne 33cl', 800, 'BIEBLO'),
(9, 'Brasseur 50cl', 1000, 'BIEBLO'),
(10, 'Formidable 100cl', 1900, 'BIEBLO'),
(11, 'Pichet 1,5l', 3200, 'BIEBLO'),
(12, 'Le mètre 25cl *10', 5000, 'BIEBLO'),
(13, 'Demi 25cl', 700, 'BIEBLO'),
(14, 'Taverne 33cl', 800, 'BIEBLO'),
(15, 'Brasseur 50cl', 1000, 'BIEBLO'),
(16, 'Formidable 100cl', 1900, 'BIEBLO'),
(17, 'Pichet 1,5l', 3200, 'BIEBLO'),
(18, 'Le mètre 25cl *10', 5000, 'BIEBLO'),
(19, 'Le Panaché 25cl', 650, 'APEBIE'),
(20, 'Le Panaché 33cl', 700, 'APEBIE'),
(21, 'Le Panaché 50cl', 900, 'APEBIE'),
(22, 'Le Panaché 1l', 1500, 'APEBIE'),
(23, 'Le Panaché Pitcher', 3200, 'APEBIE'),
(24, 'Le Tango 25 cl', 700, 'APEBIE'),
(25, 'Le Tango 33 cl', 800, 'APEBIE'),
(26, 'Le Tango 50 cl', 1100, 'APEBIE'),
(27, 'Le Tango 1l', 1100, 'APEBIE'),
(28, 'Le Tango Pitcher', 3200, 'APEBIE'),
(29, 'Le Monaco 25 cl', 700, 'APEBIE'),
(30, 'Le Monaco 33 cl', 800, 'APEBIE'),
(31, 'Le Monaco 50 cl', 1100, 'APEBIE'),
(32, 'Le Monaco 1l', 1100, 'APEBIE'),
(33, 'Le Monaco Pitcher', 3200, 'APEBIE'),
(34, 'Picon Bière 25 cl', 1100, 'APEBIE'),
(35, 'Picon Bière 33 cl', 1350, 'APEBIE'),
(36, 'Picon Bière 50 cl', 1900, 'APEBIE'),
(37, 'Picon Bière 1l', 2400, 'APEBIE'),
(38, 'Picon Bière Pitcher', 4200, 'APEBIE'),
(39, 'Le Nord Express 25 cl', 1100, 'APEBIE'),
(40, 'Le Nord Express 33 cl', 1350, 'APEBIE'),
(41, 'Le Nord Express 50 cl', 1900, 'APEBIE'),
(42, 'Le Nord Express 1l', 2400, 'APEBIE'),
(43, 'Le Nord Express Pitcher', 4200, 'APEBIE'),
(45, 'Le Mexicanos 25 cl', 1100, 'APEBIE'),
(46, 'Le Mexicanos 33 cl', 1350, 'APEBIE'),
(47, 'Le Mexicanos 50 cl', 1900, 'APEBIE'),
(48, 'Le Mexicanos 1l', 2400, 'APEBIE'),
(49, 'Le Mexicanos Pitcher', 4200, 'APEBIE'),
(50, 'Le Habana 25 cl', 1100, 'APEBIE'),
(51, 'Le Habana 33 cl', 1350, 'APEBIE'),
(52, 'Le Habana 50 cl', 1900, 'APEBIE'),
(53, 'Le Habana 1l', 2400, 'APEBIE'),
(54, 'Le Habana Pitcher', 4200, 'APEBIE'),
(55, 'L\'Irlandais 25 cl', 1100, 'APEBIE'),
(56, 'L\'Irlandais 33 cl', 1350, 'APEBIE'),
(57, 'L\'Irlandais 50 cl', 1900, 'APEBIE'),
(58, 'L\'Irlandais 1l', 2400, 'APEBIE'),
(59, 'L\'Irlandais Pitcher', 4200, 'APEBIE'),
(60, 'Le Boucanier 25 cl', 1100, 'APEBIE'),
(61, 'Le Boucanier 33 cl', 1350, 'APEBIE'),
(62, 'Le Boucanier 50 cl', 1900, 'APEBIE'),
(63, 'Le Boucanier 1l', 2400, 'APEBIE'),
(64, 'Le Boucanier', 4200, 'APEBIE'),
(65, 'Campari 2 cl', 1000, 'APERIT'),
(66, 'Martini 2 cl', 1000, 'APERIT'),
(67, 'Ricard 2 cl', 1000, 'APERIT'),
(68, 'Coupe de champagne Taitin', 2100, 'APERIT'),
(69, 'Kir Royal Taitingeri 12 c', 2300, 'APERIT'),
(70, 'Whisky classique', 1050, 'WHISKY'),
(71, 'Bourbon:Jim Beam', 1300, 'WHISKY'),
(72, 'Vieux Scotch Chivas Regal', 1500, 'WHISKY'),
(73, 'Vieux Scotch Johnnie Black Label', 1500, 'WHISKY'),
(74, 'Single Pure Malt Glenfiddich', 1500, 'WHISKY'),
(75, 'Single Pure Malt Glenlivet', 1500, 'WHISKY'),
(76, 'Gin 4cl', 1000, 'ALCOOL'),
(77, 'Vodka 4cl', 1000, 'ALCOOL'),
(78, 'Tequila 4 cl', 1000, 'ALCOOL'),
(79, 'Rhum', 1000, 'ALCOOL'),
(80, 'Vodka Zubrowska 4cl', 1300, 'ALCOOL'),
(81, 'Vodka Absolut 4cl', 1300, 'ALCOOL'),
(82, 'Rhum Damoiseau 4cl', 1300, 'ALCOOL'),
(83, 'Rhum Bacardi 4cl', 1300, 'ALCOOL'),
(84, 'Gin Bombay 4cl', 1300, 'ALCOOL'),
(85, 'Gin Gordon\'s 4cl', 1300, 'ALCOOL'),
(86, 'Vodka Red Bull 4cl', 1500, 'ALCOOL'),
(87, 'Pinacolada', 1500, 'COKTAI'),
(88, 'Planteur', 1500, 'COKTAI'),
(89, 'Punch Coco', 1500, 'COKTAI'),
(90, 'Sancerre Les Montachins Blanc 37,5cl', 3800, 'LACAVE'),
(91, 'Sancerre Les Montachins Blanc 75cl', 6200, 'LACAVE'),
(92, 'Riesling Hugel 37,5cl', 3250, 'LACAVE'),
(93, 'Riesling Hugel 75cl', 5500, 'LACAVE'),
(94, 'Muscadet sur Lie 37,5cl', 2200, 'LACAVE'),
(95, 'Muscadet sur Lie 75cl', 3900, 'LACAVE'),
(96, 'Cristal de Provence Rosé 37,5cl', 2300, 'LACAVE'),
(97, 'Cristal de Provence Rosé 75cl', 4200, 'LACAVE'),
(98, 'Beaujolais Village Georges Duboeuf 37,5cl', 2200, 'LACAVE'),
(99, 'Beaujolais Village Georges Duboeuf 75cl', 3800, 'LACAVE'),
(100, 'Bordeaux Manoir du Passager 75 l', 3900, 'LACAVE'),
(101, 'Clos La Maurasse Graves rouge ou blanc 75cl', 5500, 'LACAVE'),
(102, 'Château Castera Cru Bourgeois Medoc 75 cl', 5900, 'LACAVE'),
(103, 'Riesling Hugel 75cl', 5500, 'LACAVE'),
(104, 'Champagne Taittinger 75 cl', 12500, 'LACAVE'),
(105, 'Bordeaux Manoir du Passager Le Verre Rouge ou Blan', 950, 'LACAVE'),
(106, 'Medoc Château Castera le verre', 1300, 'LACAVE'),
(107, 'Les Nectars Poire 25cl', 700, 'NECTAR'),
(108, 'Les Nectars Abricot 25cl', 700, 'NECTAR'),
(109, 'Les Nectars Tomate 25cl', 700, 'NECTAR'),
(110, 'Coca Cola 33cl', 630, 'SODAS'),
(111, 'Coca Zéro 33cl', 630, 'SODAS'),
(112, 'Orangina 33cl', 630, 'SODAS'),
(113, 'Ice Tea 33cl', 630, 'SODAS'),
(114, '7 Up 33cl', 630, 'SODAS'),
(115, 'Schweppes Tonic 33cl', 630, 'SODAS'),
(116, 'Maxi Soda 50cl', 850, 'SODAS'),
(117, 'Red Bull', 900, 'SODAS'),
(118, 'Mont Dore 50cl', 500, 'EAUMIN'),
(119, 'Mont Dore 1,50l', 650, 'EAUMIN'),
(120, 'San Pellegrino 50cl', 650, 'EAUMIN'),
(121, 'San Pellegrino 75cl', 850, 'EAUMIN'),
(122, 'Perrier boîte 33cl', 630, 'EAUMIN');

-- --------------------------------------------------------

--
-- Structure de la table `contacts`
--

CREATE TABLE `contacts` (
  `idContact` int(11) NOT NULL,
  `identiteContact` varchar(255) NOT NULL,
  `mailContact` varchar(255) NOT NULL,
  `titreContact` varchar(255) NOT NULL,
  `contenuContact` text NOT NULL,
  `dateContact` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `traiteContact` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `contacts`
--

INSERT INTO `contacts` (`idContact`, `identiteContact`, `mailContact`, `titreContact`, `contenuContact`, `dateContact`, `traiteContact`) VALUES
(4, 'Quesada Hugo', 'hugo.quesada.pro@gmail.com', 'Amelioration', 'Ton site pu la merde        ', '2018-05-28 04:42:25', 1),
(5, 'Test etst', 'hugo.quesada.pro@gmail.com8', 'hezciouezhiuho u', 'ehgfysgf hofjejçe _ejçf jezçjfezfe fze', '2018-07-01 20:05:39', 1),
(6, 'Test etst', 'jean.dujardin@actor.holy', 'hezciouezhiuho u', 'e et rz tr ts tsqh gddzudkzg kdygzzeL IYQL IL IZGQGG DLKSQH LKDHKSQ d s', '2018-08-27 00:18:38', 1);

-- --------------------------------------------------------

--
-- Structure de la table `date_programme`
--

CREATE TABLE `date_programme` (
  `id` int(11) NOT NULL,
  `date_prog` date NOT NULL,
  `titre_programme` varchar(200) NOT NULL,
  `desc_programme` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `date_programme`
--

INSERT INTO `date_programme` (`id`, `date_prog`, `titre_programme`, `desc_programme`) VALUES
(1, '2018-03-06', 'La chasse aux Oeufs de Pâques', 'Venez nous rejoindre lors de cette grande fête annuelle !'),
(2, '2018-05-17', 'NOTRE feu d\'Artifice du 14 Juillet', 'Venez assister à notre célèbre feu d\'artifice !');

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

CREATE TABLE `employe` (
  `idEmploye` int(11) NOT NULL,
  `nomEmploye` varchar(25) NOT NULL,
  `prenomEmploye` varchar(25) NOT NULL,
  `telEmploye` varchar(11) NOT NULL,
  `passEmploye` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `employe`
--

INSERT INTO `employe` (`idEmploye`, `nomEmploye`, `prenomEmploye`, `telEmploye`, `passEmploye`) VALUES
(1, 'marolf', 'beber', '15.16.17', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08');

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE `facture` (
  `num_fact` int(11) NOT NULL,
  `date_fact` datetime DEFAULT NULL,
  `Num_Table` int(11) NOT NULL,
  `Nb_Personnes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `planning`
--

CREATE TABLE `planning` (
  `id` int(11) NOT NULL,
  `resourceId` varchar(10) NOT NULL,
  `title` varchar(20) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `soin` int(11) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déclencheurs `planning`
--
DELIMITER $$
CREATE TRIGGER `TimeVerifInsert` BEFORE INSERT ON `planning` FOR EACH ROW BEGIN
  SET NEW.end = NEW.end + INTERVAL 30 MINUTE;
  IF DATE_FORMAT(NEW.start, '%H:%i:%s') < '08:00:00' THEN
  	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "L'heure de debut minimale est de 8h00";
  END IF;
  IF DATE_FORMAT(NEW.end, '%H:%i:%s') > '20:00:00' THEN
  	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "L'heure de debut maximale est de 20h00";
  END IF;
  IF NEW.end < NEW.start THEN
  	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "L'heure de fin ne peut pas etre inferieure a l'heure de depart";
  END IF;
  IF NEW.start > NEW.end THEN
  	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "L'heure de depart ne peut pas etre superieur a l'heure de fin";
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `dateUpdt` BEFORE UPDATE ON `planning` FOR EACH ROW SET NEW.end = NEW.end + INTERVAL 30 MINUTE
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `soins`
--

CREATE TABLE `soins` (
  `idSoin` int(11) NOT NULL,
  `libelleSoin` varchar(255) NOT NULL,
  `descriptionSoin` text NOT NULL,
  `prixSoin` int(11) NOT NULL,
  `dureeSoin` time NOT NULL DEFAULT '00:30:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `soins`
--

INSERT INTO `soins` (`idSoin`, `libelleSoin`, `descriptionSoin`, `prixSoin`, `dureeSoin`) VALUES
(1, 'Soin Contour des Yeux Éclats', 'Soin décongestionnant et hydratant - A combiner avec un soin visage SOIN TEEN Gommage sous vapeur et masque clarifiant - Adapté aux peaux des 12/18 ans', 6500, '00:30:00'),
(2, 'Soin Éclat Immédiat aux Fleurs', 'Soin éclat et dynamisant - Toutes peaux', 9500, '01:00:00'),
(3, 'Soin Prodigieux à l\'Immortelle Bleue', 'Soin défatigant et anti-stress - Toutes peaux', 12500, '01:00:00'),
(4, 'Soin Express aux Extraits d\'Arbres - Pour Homme', 'Soin anti-terne - Toutes peaux', 9500, '00:30:00'),
(5, 'Soin Aroma-Lacté Crème Fraîche', 'Soin hydratant et stimulant - Peaux déshydratées', 13000, '01:30:00'),
(6, 'Soin Aroma-Perfection aux Plantes', 'Soin purifiant et détoxifiant - Peaux mixtes et obstruées', 13000, '01:30:00'),
(7, 'Soin Ultra Réconfortant au Miel', 'Soin apaisant et relipidant - Peaux sèches et sensibles', 13000, '01:30:00'),
(8, 'Soin Beau Joueur - Pour Homme', 'Soin énergisant, hydratant, clarifiant ou anti-âge - Toutes peaux', 13000, '01:30:00'),
(9, 'Soin Bio-Beauté', 'Soin apaisant, clarifiant ou hydratant - Selon le besoin de la peau', 13000, '01:30:00'),
(10, 'Soin Nuxellence', 'Soin lumière et jeunesse', 16000, '01:30:00'),
(11, 'Soin Nirvanesque', 'Soin décrispant et délassant', 16000, '01:30:00'),
(12, 'Soin Merveillance Expert', 'Soin lissant et combleur', 16000, '01:30:00'),
(13, 'Enveloppement', 'Soin nourrissant et hydratant, accompagné d’un modelage du cuir chevelu ou des pieds - Toutes peaux', 6500, '00:30:00'),
(14, 'Soin Révélateur d’Éclat Immédiat', 'Gommage du corps sous vapeur et application d’un soin hydratant - Toutes peaux', 9000, '01:30:00'),
(15, 'Soin Body Relaxant', 'Gommage du corps sous vapeur et modelage délassant du corps - Toutes peaux', 13000, '01:30:00'),
(16, 'Soin du Dos', 'Gommage du dos sous vapeur, masque purifiant et modelage du dos - Toutes peaux', 14000, '01:30:00'),
(17, 'Soin Prodigieux', 'Gommage du corps sous vapeur, enveloppement hydratant et modelage avec application de l’Huile Prodigieuse - Toutes peaux', 14000, '01:30:00'),
(18, 'Soin Rêve de Miel', 'Gommage du corps sous vapeur, enveloppement ultra-réparateur et modelage nutritif régénérant - Peaux sèches et sensibles', 15000, '01:30:00'),
(19, 'Soin Pureté du Dos - Pour Homme', 'Gommage du dos sous vapeur, masque purifiant et modelage du dos - Toutes peaux', 14000, '01:30:00'),
(20, 'Soin Rêverie Orientale', 'Soin détoxifiant, relaxant et purifiant, Hammam, gommage, enveloppement détoxifiant au Rassoul et long modelage apaisant', 18000, '02:00:00');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `brasserie`
--
ALTER TABLE `brasserie`
  ADD PRIMARY KEY (`num_plat`),
  ADD KEY `brasserie_ibfk_1` (`cat`);

--
-- Index pour la table `cat_brasserie`
--
ALTER TABLE `cat_brasserie`
  ADD PRIMARY KEY (`categorie`);

--
-- Index pour la table `cat_cons`
--
ALTER TABLE `cat_cons`
  ADD PRIMARY KEY (`categorie`);

--
-- Index pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD PRIMARY KEY (`N°_Chambre`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`Num_Client`);

--
-- Index pour la table `comprend_bar`
--
ALTER TABLE `comprend_bar`
  ADD PRIMARY KEY (`num_fact`,`num_cons`),
  ADD KEY `fk1_comprend_bar` (`num_cons`);

--
-- Index pour la table `comprend_brasserie`
--
ALTER TABLE `comprend_brasserie`
  ADD PRIMARY KEY (`num_fact`,`num_plat`),
  ADD KEY `comprend_brasseriefk_1` (`num_plat`);

--
-- Index pour la table `consommation`
--
ALTER TABLE `consommation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `consommation_ibfk_1` (`categorie`);

--
-- Index pour la table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`idContact`);

--
-- Index pour la table `date_programme`
--
ALTER TABLE `date_programme`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`idEmploye`);

--
-- Index pour la table `facture`
--
ALTER TABLE `facture`
  ADD PRIMARY KEY (`num_fact`);

--
-- Index pour la table `planning`
--
ALTER TABLE `planning`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`),
  ADD KEY `soin` (`soin`);

--
-- Index pour la table `soins`
--
ALTER TABLE `soins`
  ADD PRIMARY KEY (`idSoin`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `idContact` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `date_programme`
--
ALTER TABLE `date_programme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `employe`
--
ALTER TABLE `employe`
  MODIFY `idEmploye` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `facture`
--
ALTER TABLE `facture`
  MODIFY `num_fact` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `planning`
--
ALTER TABLE `planning`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `soins`
--
ALTER TABLE `soins`
  MODIFY `idSoin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `brasserie`
--
ALTER TABLE `brasserie`
  ADD CONSTRAINT `brasserie_ibfk_1` FOREIGN KEY (`cat`) REFERENCES `cat_brasserie` (`categorie`);

--
-- Contraintes pour la table `comprend_bar`
--
ALTER TABLE `comprend_bar`
  ADD CONSTRAINT `comprend_baribfk_1` FOREIGN KEY (`num_cons`) REFERENCES `consommation` (`id`),
  ADD CONSTRAINT `comprend_baribfk_2` FOREIGN KEY (`num_fact`) REFERENCES `facture` (`num_fact`);

--
-- Contraintes pour la table `comprend_brasserie`
--
ALTER TABLE `comprend_brasserie`
  ADD CONSTRAINT `comprend_brasseriefk_1` FOREIGN KEY (`num_plat`) REFERENCES `brasserie` (`num_plat`),
  ADD CONSTRAINT `comprend_brasseriefk_2` FOREIGN KEY (`num_fact`) REFERENCES `facture` (`num_fact`);

--
-- Contraintes pour la table `consommation`
--
ALTER TABLE `consommation`
  ADD CONSTRAINT `consommation_ibfk_1` FOREIGN KEY (`categorie`) REFERENCES `cat_cons` (`categorie`);

--
-- Contraintes pour la table `planning`
--
ALTER TABLE `planning`
  ADD CONSTRAINT `planning_ibfk_2` FOREIGN KEY (`soin`) REFERENCES `soins` (`idSoin`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
