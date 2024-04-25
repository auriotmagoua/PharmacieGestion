-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 25 avr. 2024 à 09:25
-- Version du serveur : 8.0.36-0ubuntu0.22.04.1
-- Version de PHP : 8.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `pharmacie`
--

-- --------------------------------------------------------

--
-- Structure de la table `approvisionnement`
--

CREATE TABLE `approvisionnement` (
  `idAppro` int NOT NULL,
  `numBL` varchar(255) NOT NULL,
  `qteAppro` int NOT NULL,
  `dateAppro` date NOT NULL,
  `prixU` float NOT NULL,
  `idProd` int NOT NULL,
  `idFournis` int NOT NULL,
  `etat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `approvisionnement`
--

INSERT INTO `approvisionnement` (`idAppro`, `numBL`, `qteAppro`, `dateAppro`, `prixU`, `idProd`, `idFournis`, `etat`) VALUES
(87, 'BL-00002', 5, '2024-04-25', 400, 5, 2, 'active'),
(88, 'BL-00002', 7, '2024-04-25', 450, 6, 2, 'active'),
(89, 'BL-00002', 11, '2024-04-25', 200, 9, 2, 'active');

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `idCategorie` int NOT NULL,
  `nomCategorie` varchar(255) NOT NULL,
  `etat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`idCategorie`, `nomCategorie`, `etat`) VALUES
(1, 'Analgésiques ', 'active'),
(2, 'Antibiotiques', 'active'),
(3, 'Antidépresseurs', 'active'),
(4, 'Antihistaminiques', 'active'),
(5, 'Antihypertenseurs', 'active'),
(6, 'Anticoagulants', 'active');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `idClient` int NOT NULL,
  `nomClient` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `villeClient` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `emailClient` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `telephoneClient` varchar(255) NOT NULL,
  `etat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`idClient`, `nomClient`, `villeClient`, `emailClient`, `telephoneClient`, `etat`) VALUES
(1, 'Rath', 'Legrosfort', 'monserrat.larkin@yahoo.com', '720-342-72', 'active'),
(2, 'Sporer', 'Skilesmouth', 'jkonopelski@legros.net', '796.799.89', 'active'),
(3, 'Streich', 'North Donnie', 'waters.reginald@gmail.com', '(439) 978-', 'active'),
(4, 'Barrows', 'Constanceview', 'wilkinson.bessie@wehner.com', '543.885.87', 'active'),
(5, 'Marquardt', 'Lake Candelarioville', 'whand@gmail.com', '264-890-92', 'active'),
(6, 'Bradtke', 'Yostport', 'strosin.imogene@johnston.org', '1-996-951-', 'active'),
(7, 'Cole', 'Port Gerard', 'ohodkiewicz@bode.com', '+1 (203) 6', 'active'),
(8, 'Toy', 'New Myahchester', 'cali35@kutch.com', '(459) 649-', 'active'),
(9, 'Rogahn', 'North Oren', 'tabitha79@herzog.com', '1-992-795-', 'active'),
(10, 'Dooley', 'Abbottport', 'stacy.walter@corkery.com', '1-728-641-', 'active');

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE `facture` (
  `idFact` int NOT NULL,
  `dateFact` date NOT NULL,
  `montantT` float NOT NULL,
  `idVente` int NOT NULL,
  `etat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `facture`
--

INSERT INTO `facture` (`idFact`, `dateFact`, `montantT`, `idVente`, `etat`) VALUES
(1, '1979-06-29', 58907, 76, 'active'),
(2, '1983-09-02', 38214, 49, 'active'),
(3, '1973-01-09', 81894, 73, 'active'),
(4, '1973-11-25', 33201, 53, 'active'),
(5, '1986-01-17', 83183, 90, 'active'),
(6, '2003-05-23', 17665, 93, 'active'),
(7, '1979-03-13', 32067, 86, 'active'),
(8, '1991-03-01', 3663, 44, 'active'),
(9, '1988-03-10', 76041, 12, 'active'),
(10, '1981-07-08', 52281, 68, 'active'),
(11, '1994-03-29', 45274, 34, 'active'),
(12, '1979-07-14', 87286, 78, 'active'),
(13, '2005-01-04', 36514, 22, 'active');

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `idFournis` int NOT NULL,
  `nomFournis` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `villeFournis` varchar(255) NOT NULL,
  `emailFournis` varchar(255) NOT NULL,
  `telephoneFournis` varchar(255) NOT NULL,
  `etat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`idFournis`, `nomFournis`, `villeFournis`, `emailFournis`, `telephoneFournis`, `etat`) VALUES
(1, 'McCullough', 'Lake Eusebio', 'cokuneva@denesik.org', '693.854.7', 'active'),
(2, 'Mayert', 'South Margarettaview', 'kuvalis.mellie@gmail.com', '224.599.4', 'active'),
(3, 'Murphy', 'Rempelbury', 'adolph47@yahoo.com', '1-682-545', 'active'),
(4, 'Dickinson', 'East Fiona', 'ullrich.victor@walsh.com', '(613) 990', 'active'),
(5, 'Bode', 'Hoseahaven', 'fadel.marlene@gmail.com', '802-556-5', 'active'),
(6, 'Kirlin', 'South Coty', 'willy37@lebsack.com', '+1.795.53', 'active'),
(7, 'booba', 'bawouan', 'booba@g', '690909090', 'active');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `idProd` int NOT NULL,
  `nomProd` varchar(255) NOT NULL,
  `numLot` int NOT NULL,
  `datePerem` date NOT NULL,
  `qteDispo` int NOT NULL,
  `prixU` int NOT NULL,
  `idFournis` int NOT NULL,
  `idCategorie` int NOT NULL,
  `etat` varchar(255) NOT NULL,
  `imageProd` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`idProd`, `nomProd`, `numLot`, `datePerem`, `qteDispo`, `prixU`, `idFournis`, `idCategorie`, `etat`, `imageProd`) VALUES
(1, 'Quae quia qui.', 82, '1970-06-13', 84, 302, 3, 6, 'active', 'https://lorempixel.com/200/200/?11982'),
(2, 'Consequuntur dolorum nobis nulla.', 55, '1990-08-17', 101, 492, 5, 4, 'active', 'https://lorempixel.com/200/200/?78229'),
(3, 'Vel est sapiente modi.', 33, '1971-01-20', 86, 58, 6, 1, 'active', 'https://lorempixel.com/200/200/?71785'),
(4, 'Illum consequatur debitis corrupti id.', 1, '1998-04-10', 63, 285, 2, 2, 'active', 'https://lorempixel.com/200/200/?46300'),
(5, 'Ut non possimus vero.', 7, '1991-03-27', 50, 560, 6, 3, 'active', 'https://lorempixel.com/200/200/?35982'),
(6, 'Nostrum nemo quo.', 52, '1989-05-25', 99, 509, 4, 6, 'active', 'https://lorempixel.com/200/200/?15092'),
(7, 'Deserunt adipisci et ab.', 4, '2007-09-27', 46, 673, 4, 6, 'active', 'https://lorempixel.com/200/200/?55345'),
(8, 'Non officia qui error suscipit.', 75, '2013-09-22', 91, 160, 2, 5, 'active', 'https://lorempixel.com/200/200/?51736'),
(9, 'Ab est sit aliquam.', 82, '1973-09-17', 48, 257, 5, 5, 'active', 'https://lorempixel.com/200/200/?90552'),
(10, 'Doloribus et voluptatem.', 24, '2010-07-31', 75, 979, 6, 4, 'active', 'https://lorempixel.com/200/200/?29295'),
(11, 'Qui in aliquid.', 95, '2015-10-28', 72, 209, 2, 2, 'active', 'https://lorempixel.com/200/200/?60527'),
(12, 'Quo pariatur iure.', 42, '1983-03-09', 7, 27, 3, 2, 'active', 'https://lorempixel.com/200/200/?58668'),
(13, 'Laboriosam blanditiis natus adipisci.', 18, '2006-04-23', 48, 940, 1, 3, 'active', 'https://lorempixel.com/200/200/?69373'),
(14, 'Voluptates corrupti minus soluta.', 28, '2003-03-16', 95, 29, 4, 5, 'active', 'https://lorempixel.com/200/200/?25038'),
(15, 'Dignissimos quis quasi.', 97, '2012-04-11', 159, 588, 4, 5, 'active', 'https://lorempixel.com/200/200/?72910'),
(16, 'Id perspiciatis veritatis.', 53, '2001-02-20', 21, 481, 6, 2, 'active', 'https://lorempixel.com/200/200/?30632'),
(17, 'Ipsum officia sed.', 21, '1992-09-02', 47, 842, 2, 4, 'active', 'https://lorempixel.com/200/200/?95476'),
(18, 'Et culpa occaecati.', 36, '1993-02-12', 23, 818, 1, 2, 'active', 'https://lorempixel.com/200/200/?42875'),
(19, 'Et minus quos vitae.', 70, '1970-03-12', 54, 907, 4, 3, 'active', 'https://lorempixel.com/200/200/?54620'),
(20, 'Cum aut et.', 39, '1973-03-16', 2, 601, 2, 4, 'active', 'https://lorempixel.com/200/200/?70413'),
(21, 'Quia qui voluptatem asperiores.', 97, '1992-01-18', 44, 626, 2, 1, 'active', 'https://lorempixel.com/200/200/?10113'),
(22, 'Ut occaecati voluptas omnis.', 59, '1998-03-13', 93, 143, 6, 2, 'active', 'https://lorempixel.com/200/200/?62752'),
(23, 'Cum suscipit.', 61, '2004-06-06', 5, 379, 6, 2, 'active', 'https://lorempixel.com/200/200/?99239'),
(24, 'Minus quos et totam expedita.', 18, '2023-01-18', 49, 731, 1, 3, 'active', 'https://lorempixel.com/200/200/?88439'),
(25, 'Nostrum suscipit quia fugiat quaerat.', 93, '1992-10-31', 86, 685, 3, 3, 'active', 'https://lorempixel.com/200/200/?13810'),
(26, 'Perferendis libero eos delectus.', 52, '2021-06-09', 90, 650, 6, 6, 'active', 'https://lorempixel.com/200/200/?51862'),
(27, 'Et dignissimos fugiat deserunt autem.', 40, '1975-02-06', 12, 689, 6, 1, 'active', 'https://lorempixel.com/200/200/?71516'),
(28, 'Error praesentium sint et.', 78, '1996-09-05', 88, 618, 5, 4, 'active', 'https://lorempixel.com/200/200/?48633'),
(29, 'Beatae laboriosam incidunt voluptas.', 16, '2012-05-31', 40, 180, 1, 1, 'active', 'https://lorempixel.com/200/200/?91965'),
(30, 'Dolorum consequatur porro id.', 85, '1997-10-18', 1, 845, 4, 1, 'active', 'https://lorempixel.com/200/200/?22307'),
(31, 'Qui itaque omnis ut est.', 39, '1996-08-07', 32, 211, 1, 4, 'active', 'https://lorempixel.com/200/200/?20796'),
(32, 'Perspiciatis unde.', 56, '1992-01-31', 49, 262, 3, 3, 'active', 'https://lorempixel.com/200/200/?24678'),
(33, 'Dolor inventore nisi.', 6, '2001-10-21', 24, 880, 6, 6, 'active', 'https://lorempixel.com/200/200/?78398'),
(34, 'Rerum id omnis eos.', 85, '2011-05-13', 33, 62, 1, 5, 'active', 'https://lorempixel.com/200/200/?96443'),
(35, 'Illum incidunt porro rerum.', 47, '2023-06-16', 30, 732, 4, 4, 'active', 'https://lorempixel.com/200/200/?44530'),
(36, 'Iure excepturi doloremque quasi.', 99, '2023-11-12', 23, 827, 1, 6, 'active', 'https://lorempixel.com/200/200/?64234'),
(37, 'Placeat voluptate numquam sed.', 14, '1983-11-14', 76, 708, 5, 1, 'active', 'https://lorempixel.com/200/200/?68780'),
(38, 'Dolores possimus esse.', 70, '2015-06-19', 9, 337, 4, 3, 'active', 'https://lorempixel.com/200/200/?31708'),
(39, 'Culpa aliquam sunt sed.', 62, '1999-02-26', 43, 731, 6, 6, 'active', 'https://lorempixel.com/200/200/?95479'),
(40, 'Occaecati illum sed unde.', 86, '2024-01-16', 45, 339, 3, 3, 'active', 'https://lorempixel.com/200/200/?69075'),
(41, 'Dolor est vero.', 45, '2012-12-20', 12, 661, 4, 6, 'active', 'https://lorempixel.com/200/200/?33160'),
(42, 'Beatae ut fugit.', 4, '2003-03-09', 54, 341, 5, 6, 'active', 'https://lorempixel.com/200/200/?48571'),
(43, 'Sit distinctio.', 46, '1993-08-08', 95, 281, 5, 6, 'active', 'https://lorempixel.com/200/200/?64282'),
(44, 'Ad occaecati voluptatibus.', 91, '2005-07-17', 10, 108, 6, 2, 'active', 'https://lorempixel.com/200/200/?39690'),
(45, 'Incidunt temporibus eius consequatur.', 35, '2017-07-04', 12, 908, 3, 4, 'active', 'https://lorempixel.com/200/200/?36691'),
(46, 'Et repellendus fugiat.', 85, '2003-01-06', 26, 319, 2, 3, 'active', 'https://lorempixel.com/200/200/?86585'),
(47, 'Enim voluptatum ea.', 58, '2002-09-06', 13, 631, 3, 5, 'active', 'https://lorempixel.com/200/200/?80310'),
(48, 'Et nostrum beatae repellendus.', 80, '1973-12-21', 81, 784, 6, 6, 'active', 'https://lorempixel.com/200/200/?56301'),
(49, 'Aut aliquid hic.', 31, '1996-02-18', 29, 919, 2, 2, 'active', 'https://lorempixel.com/200/200/?83776'),
(50, 'Neque cupiditate.', 61, '1992-12-28', 95, 251, 4, 6, 'active', 'https://lorempixel.com/200/200/?68828'),
(51, 'Excepturi maiores et.', 55, '2014-07-03', 13, 487, 2, 1, 'active', 'https://lorempixel.com/200/200/?73955'),
(52, 'Deserunt consectetur laborum quis.', 19, '1994-01-07', 5, 701, 2, 4, 'active', 'https://lorempixel.com/200/200/?68435'),
(53, 'Et sit eum maiores velit.', 71, '1980-04-30', 2, 402, 2, 4, 'active', 'https://lorempixel.com/200/200/?65155'),
(54, 'Culpa sint.', 55, '1994-06-05', 73, 995, 6, 6, 'active', 'https://lorempixel.com/200/200/?54865'),
(55, 'Occaecati sit saepe.', 63, '1973-02-09', 16, 457, 1, 6, 'active', 'https://lorempixel.com/200/200/?12997'),
(56, 'Sed fuga nam sed.', 84, '2016-07-23', 60, 289, 6, 5, 'active', 'https://lorempixel.com/200/200/?60144'),
(57, 'Consectetur placeat dolores sunt accusamus.', 70, '2019-07-24', 52, 924, 1, 4, 'active', 'https://lorempixel.com/200/200/?63637'),
(58, 'Ipsum velit.', 94, '2022-02-22', 44, 547, 3, 3, 'active', 'https://lorempixel.com/200/200/?37459'),
(59, 'Saepe qui ea.', 16, '2010-11-24', 22, 876, 1, 6, 'active', 'https://lorempixel.com/200/200/?61539'),
(60, 'Facere velit animi aperiam.', 62, '2021-01-06', 24, 346, 4, 5, 'active', 'https://lorempixel.com/200/200/?30575'),
(61, 'Temporibus ipsam sed.', 1, '1991-06-04', 4, 35, 1, 4, 'active', 'https://lorempixel.com/200/200/?58472'),
(62, 'Iure ipsam.', 11, '2001-06-24', 62, 967, 3, 5, 'active', 'https://lorempixel.com/200/200/?18712'),
(63, 'Sit aut aliquid.', 48, '2017-07-21', 96, 473, 5, 4, 'active', 'https://lorempixel.com/200/200/?58997'),
(64, 'Ut consequatur eveniet aut.', 32, '1991-07-11', 49, 931, 1, 1, 'active', 'https://lorempixel.com/200/200/?61371'),
(65, 'Necessitatibus quia eos qui.', 42, '2000-09-29', 52, 752, 1, 3, 'active', 'https://lorempixel.com/200/200/?19229'),
(66, 'Eius consequatur dicta.', 27, '2003-10-21', 93, 833, 3, 4, 'active', 'https://lorempixel.com/200/200/?75926'),
(67, 'Veniam nemo cupiditate.', 86, '1973-04-20', 70, 912, 6, 2, 'active', 'https://lorempixel.com/200/200/?79893'),
(68, 'Omnis id quam minus.', 92, '2017-09-19', 6, 490, 6, 1, 'active', 'https://lorempixel.com/200/200/?93879'),
(69, 'Libero et inventore similique.', 65, '1989-11-30', 3, 75, 2, 1, 'active', 'https://lorempixel.com/200/200/?56546'),
(70, 'Omnis dignissimos fugit eligendi.', 31, '1974-09-10', 16, 265, 4, 3, 'active', 'https://lorempixel.com/200/200/?73071'),
(71, 'Porro quibusdam molestiae veniam.', 26, '2017-02-21', 32, 146, 5, 5, 'active', 'https://lorempixel.com/200/200/?41158'),
(72, 'Amet a totam esse.', 14, '1998-10-11', 68, 478, 5, 5, 'active', 'https://lorempixel.com/200/200/?63794'),
(73, 'Rerum iste nobis.', 13, '2022-06-18', 59, 950, 2, 2, 'active', 'https://lorempixel.com/200/200/?20453'),
(74, 'Alias et perspiciatis id veniam.', 89, '1995-05-22', 47, 893, 2, 6, 'active', 'https://lorempixel.com/200/200/?21079'),
(75, 'Quae quis suscipit minima vero.', 16, '1980-02-20', 82, 287, 2, 4, 'active', 'https://lorempixel.com/200/200/?24969'),
(76, 'Quos perspiciatis doloremque non officiis.', 7, '1999-03-15', 41, 204, 3, 5, 'active', 'https://lorempixel.com/200/200/?11455'),
(77, 'Officiis et.', 16, '2009-09-29', 22, 836, 3, 1, 'active', 'https://lorempixel.com/200/200/?88972'),
(78, 'Ipsa ipsa suscipit excepturi ut.', 76, '1996-05-23', 3, 504, 1, 4, 'active', 'https://lorempixel.com/200/200/?29510'),
(79, 'Tempora reiciendis cumque.', 25, '1984-05-23', 24, 721, 3, 5, 'active', 'https://lorempixel.com/200/200/?98394'),
(80, 'Impedit quo.', 55, '2007-08-23', 42, 981, 2, 5, 'active', 'https://lorempixel.com/200/200/?89909'),
(81, 'Iste possimus ab.', 1, '2016-08-22', 6, 381, 1, 2, 'active', 'https://lorempixel.com/200/200/?39543'),
(82, 'Odit iste ratione.', 39, '2009-05-18', 17, 383, 5, 2, 'active', 'https://lorempixel.com/200/200/?60477'),
(83, 'Repudiandae sunt vel pariatur facere.', 44, '1983-11-13', 20, 692, 5, 2, 'active', 'https://lorempixel.com/200/200/?15042'),
(84, 'Qui eius sunt est.', 17, '1974-01-06', 4, 882, 2, 2, 'active', 'https://lorempixel.com/200/200/?63833'),
(85, 'Accusantium tenetur aperiam.', 20, '1995-02-18', 34, 977, 1, 3, 'active', 'https://lorempixel.com/200/200/?16297'),
(86, 'Nobis velit porro.', 2, '1975-05-18', 45, 528, 3, 5, 'active', 'https://lorempixel.com/200/200/?92073'),
(87, 'Reprehenderit perferendis commodi.', 36, '1991-04-08', 1, 619, 5, 5, 'active', 'https://lorempixel.com/200/200/?92005'),
(88, 'Est sunt et sed.', 5, '1994-06-06', 15, 99, 1, 6, 'active', 'https://lorempixel.com/200/200/?55561'),
(89, 'Neque illum ab.', 1, '1985-12-06', 67, 171, 1, 6, 'active', 'https://lorempixel.com/200/200/?43610'),
(90, 'Maxime quia quod deleniti.', 21, '2014-08-16', 57, 865, 4, 3, 'active', 'https://lorempixel.com/200/200/?13572'),
(91, 'Nihil esse possimus.', 21, '2022-05-20', 16, 640, 6, 2, 'active', 'https://lorempixel.com/200/200/?15463'),
(92, 'Ratione autem sed atque.', 39, '1983-07-08', 79, 438, 2, 3, 'active', 'https://lorempixel.com/200/200/?63384'),
(93, 'Blanditiis sapiente velit.', 96, '1978-11-10', 56, 856, 5, 1, 'active', 'https://lorempixel.com/200/200/?31259'),
(94, 'Cupiditate aut unde.', 95, '2000-04-29', 31, 927, 3, 3, 'active', 'https://lorempixel.com/200/200/?30582'),
(95, 'Nostrum sed distinctio at.', 28, '1971-09-28', 54, 693, 5, 5, 'active', 'https://lorempixel.com/200/200/?63127'),
(96, 'Minima accusamus aut.', 37, '2012-12-26', 34, 656, 4, 5, 'active', 'https://lorempixel.com/200/200/?68785'),
(97, 'Deleniti harum et.', 16, '1991-11-05', 6, 462, 4, 2, 'active', 'https://lorempixel.com/200/200/?52220'),
(98, 'Necessitatibus dolor qui ea minus.', 86, '1971-10-25', 90, 669, 4, 1, 'active', 'https://lorempixel.com/200/200/?89825'),
(99, 'Vel ab.', 58, '2020-01-24', 57, 916, 1, 1, 'active', 'https://lorempixel.com/200/200/?35299'),
(100, 'Aspernatur officiis adipisci eius.', 71, '1989-02-08', 70, 711, 1, 4, 'active', 'https://lorempixel.com/200/200/?15979'),
(101, 'Quidem expedita quaerat est.', 94, '1986-02-23', 85, 977, 2, 5, 'active', 'https://lorempixel.com/200/200/?45509'),
(102, 'Voluptatibus eaque numquam exercitationem.', 5, '1987-09-06', 5, 343, 4, 3, 'active', 'https://lorempixel.com/200/200/?14059'),
(103, 'Natus expedita qui.', 98, '1978-02-16', 52, 272, 5, 5, 'active', 'https://lorempixel.com/200/200/?73189'),
(104, 'Repudiandae ipsum nobis.', 4, '1972-07-03', 6, 447, 3, 5, 'active', 'https://lorempixel.com/200/200/?79233'),
(105, 'Delectus dolor itaque dignissimos.', 95, '1978-06-21', 60, 438, 4, 1, 'active', 'https://lorempixel.com/200/200/?42641'),
(106, 'Quis numquam fuga quisquam sit.', 77, '1973-07-24', 23, 50, 4, 1, 'active', 'https://lorempixel.com/200/200/?77440'),
(107, 'Assumenda sed consequatur.', 65, '1983-01-24', 10, 104, 4, 3, 'active', 'https://lorempixel.com/200/200/?52583'),
(108, 'Tenetur non ratione voluptatem.', 50, '1973-07-31', 58, 967, 3, 2, 'active', 'https://lorempixel.com/200/200/?95860'),
(109, 'A veniam.', 32, '2003-06-26', 20, 99, 6, 3, 'active', 'https://lorempixel.com/200/200/?80555'),
(110, 'Voluptatem rerum aliquid ad.', 26, '2000-08-03', 36, 460, 6, 3, 'active', 'https://lorempixel.com/200/200/?88498'),
(111, 'Illum dignissimos odit.', 26, '1971-12-05', 46, 829, 1, 6, 'active', 'https://lorempixel.com/200/200/?37201'),
(112, 'Voluptatem earum ipsam.', 54, '2022-10-03', 44, 511, 2, 6, 'active', 'https://lorempixel.com/200/200/?75149'),
(113, 'Qui rem et vel.', 32, '1992-11-05', 19, 584, 5, 1, 'active', 'https://lorempixel.com/200/200/?76136'),
(114, 'Expedita accusamus ut.', 85, '2009-06-06', 12, 366, 1, 2, 'active', 'https://lorempixel.com/200/200/?18280'),
(115, 'Aperiam nihil ut omnis.', 55, '2023-02-13', 88, 232, 6, 4, 'active', 'https://lorempixel.com/200/200/?39161'),
(116, 'Sint fugiat.', 55, '1976-02-12', 64, 641, 4, 1, 'active', 'https://lorempixel.com/200/200/?73347'),
(117, 'Deleniti laudantium.', 22, '1988-07-31', 27, 607, 5, 6, 'active', 'https://lorempixel.com/200/200/?76436'),
(118, 'Minima fuga cupiditate voluptatem.', 80, '2007-11-29', 75, 741, 6, 6, 'active', 'https://lorempixel.com/200/200/?14035'),
(119, 'Labore sed consequuntur.', 61, '1986-07-10', 2, 598, 1, 4, 'active', 'https://lorempixel.com/200/200/?77763'),
(120, 'Ipsam labore et repellat.', 49, '2009-12-28', 42, 959, 2, 4, 'active', 'https://lorempixel.com/200/200/?32361'),
(121, 'Eius quam excepturi eligendi.', 84, '2009-04-05', 31, 464, 4, 2, 'active', 'https://lorempixel.com/200/200/?18515'),
(122, 'Non quo ipsum et.', 75, '2007-08-13', 15, 321, 2, 6, 'active', 'https://lorempixel.com/200/200/?55114'),
(123, 'Veritatis odit repellendus.', 68, '1997-04-19', 82, 926, 5, 5, 'active', 'https://lorempixel.com/200/200/?82479'),
(124, 'Eius corrupti quos.', 8, '1972-12-13', 97, 211, 5, 2, 'active', 'https://lorempixel.com/200/200/?53820'),
(125, 'Et enim.', 10, '2000-08-26', 34, 570, 1, 5, 'active', 'https://lorempixel.com/200/200/?27781'),
(126, 'Praesentium ea necessitatibus.', 29, '1976-01-04', 57, 378, 1, 4, 'active', 'https://lorempixel.com/200/200/?49431'),
(127, 'Eligendi hic ratione suscipit.', 30, '1999-08-16', 66, 554, 1, 2, 'active', 'https://lorempixel.com/200/200/?17252'),
(128, 'Provident sunt molestiae ut.', 99, '1993-12-16', 70, 473, 1, 5, 'active', 'https://lorempixel.com/200/200/?31751'),
(129, 'At totam similique.', 15, '1988-08-01', 61, 917, 4, 2, 'active', 'https://lorempixel.com/200/200/?95033'),
(130, 'Minus qui quia.', 91, '1985-11-17', 16, 49, 2, 1, 'active', 'https://lorempixel.com/200/200/?25655'),
(131, 'Sint est itaque dignissimos.', 50, '2009-04-08', 77, 213, 5, 1, 'active', 'https://lorempixel.com/200/200/?75441'),
(132, 'Architecto blanditiis ipsa.', 2, '2015-12-10', 32, 708, 1, 2, 'active', 'https://lorempixel.com/200/200/?94232'),
(133, 'Ut voluptas accusantium neque.', 86, '2008-12-16', 38, 70, 1, 4, 'active', 'https://lorempixel.com/200/200/?63606'),
(134, 'Deleniti voluptatibus et.', 38, '1985-04-24', 42, 880, 2, 1, 'active', 'https://lorempixel.com/200/200/?98759'),
(135, 'Non recusandae reprehenderit.', 81, '2004-04-11', 87, 624, 5, 3, 'active', 'https://lorempixel.com/200/200/?82520'),
(136, 'Dolores doloribus quia quis.', 89, '2019-07-11', 20, 155, 6, 3, 'active', 'https://lorempixel.com/200/200/?23343'),
(137, 'Similique quisquam dolorem.', 67, '1989-03-14', 84, 467, 4, 2, 'active', 'https://lorempixel.com/200/200/?83928'),
(138, 'Dicta nisi ex sapiente.', 59, '2022-02-13', 33, 795, 4, 4, 'active', 'https://lorempixel.com/200/200/?27767'),
(139, 'Sunt qui culpa ducimus.', 32, '2000-04-07', 21, 270, 3, 4, 'active', 'https://lorempixel.com/200/200/?14675'),
(140, 'Est eos alias facere.', 33, '2015-05-09', 7, 80, 2, 1, 'active', 'https://lorempixel.com/200/200/?14473'),
(141, 'Cum molestiae quaerat dolores.', 73, '1978-01-28', 27, 243, 2, 6, 'active', 'https://lorempixel.com/200/200/?53893'),
(142, 'Est sint.', 24, '2016-06-19', 10, 180, 3, 1, 'active', 'https://lorempixel.com/200/200/?34030'),
(143, 'Quas quaerat quam.', 36, '2003-08-07', 43, 844, 5, 5, 'active', 'https://lorempixel.com/200/200/?33548'),
(144, 'Ut laudantium qui quia.', 21, '1989-01-16', 9, 635, 6, 3, 'active', 'https://lorempixel.com/200/200/?77488'),
(145, 'Quidem quisquam iusto omnis.', 100, '1970-05-21', 81, 246, 1, 2, 'active', 'https://lorempixel.com/200/200/?35430'),
(146, 'Repellendus nihil nulla.', 77, '1995-07-09', 84, 928, 2, 1, 'active', 'https://lorempixel.com/200/200/?28800'),
(147, 'Ratione aut rem.', 65, '1996-04-06', 30, 602, 5, 6, 'active', 'https://lorempixel.com/200/200/?67983'),
(148, 'Soluta libero illum.', 46, '1985-09-04', 97, 489, 1, 3, 'active', 'https://lorempixel.com/200/200/?26227'),
(149, 'Quia atque aut laboriosam.', 68, '2014-01-27', 93, 332, 5, 6, 'active', 'https://lorempixel.com/200/200/?90332'),
(150, 'Assumenda voluptate sequi qui libero.', 82, '1973-08-24', 75, 753, 1, 5, 'active', 'https://lorempixel.com/200/200/?52232'),
(151, 'Et aliquam inventore.', 100, '2017-03-04', 12, 387, 2, 6, 'active', 'https://lorempixel.com/200/200/?71382'),
(152, 'Similique maxime facere numquam.', 46, '2022-10-26', 19, 799, 3, 6, 'active', 'https://lorempixel.com/200/200/?67209'),
(153, 'Facere vitae debitis.', 94, '2021-09-21', 89, 397, 6, 2, 'active', 'https://lorempixel.com/200/200/?84645'),
(154, 'Ipsa illum nam ut.', 86, '1985-08-18', 50, 772, 3, 2, 'active', 'https://lorempixel.com/200/200/?98919'),
(155, 'Quos tempore iure consequatur.', 19, '1990-11-07', 10, 253, 3, 3, 'active', 'https://lorempixel.com/200/200/?31686'),
(156, 'Qui vel nesciunt eligendi.', 92, '2021-04-11', 78, 477, 6, 2, 'active', 'https://lorempixel.com/200/200/?11946'),
(157, 'Aut explicabo ducimus autem.', 37, '1992-09-10', 4, 707, 4, 2, 'active', 'https://lorempixel.com/200/200/?28991'),
(158, 'Molestiae repellendus voluptas facilis.', 41, '2001-11-16', 85, 806, 5, 1, 'active', 'https://lorempixel.com/200/200/?99126'),
(159, 'Iure ut quasi.', 50, '1993-10-12', 73, 725, 4, 6, 'active', 'https://lorempixel.com/200/200/?71100'),
(160, 'Qui animi placeat.', 53, '1975-05-24', 94, 66, 1, 2, 'active', 'https://lorempixel.com/200/200/?75988'),
(161, 'Est laudantium est.', 54, '1971-07-06', 7, 528, 6, 4, 'active', 'https://lorempixel.com/200/200/?98612'),
(162, 'Est veritatis reiciendis harum magnam.', 54, '2014-01-01', 29, 275, 5, 2, 'active', 'https://lorempixel.com/200/200/?97873'),
(163, 'Et similique tempora amet.', 24, '1982-12-26', 70, 73, 6, 5, 'active', 'https://lorempixel.com/200/200/?46805'),
(164, 'Suscipit rerum.', 13, '2014-12-01', 60, 556, 6, 6, 'active', 'https://lorempixel.com/200/200/?38202'),
(165, 'Velit et veniam sed.', 9, '1975-12-13', 19, 210, 3, 4, 'active', 'https://lorempixel.com/200/200/?56424'),
(166, 'Provident et.', 8, '1975-08-09', 10, 72, 5, 3, 'active', 'https://lorempixel.com/200/200/?46543'),
(167, 'Laboriosam omnis nihil quae.', 60, '1995-07-12', 8, 321, 6, 5, 'active', 'https://lorempixel.com/200/200/?13432'),
(168, 'Porro non ex magnam.', 17, '1988-01-10', 46, 657, 3, 4, 'active', 'https://lorempixel.com/200/200/?33112'),
(169, 'Illum amet nihil ut.', 12, '1978-01-07', 39, 82, 2, 2, 'active', 'https://lorempixel.com/200/200/?77902'),
(170, 'In autem.', 100, '1998-02-11', 76, 562, 2, 6, 'active', 'https://lorempixel.com/200/200/?23187'),
(171, 'Ut ut ut.', 61, '2006-02-06', 92, 30, 5, 2, 'active', 'https://lorempixel.com/200/200/?28988'),
(172, 'Qui qui tempore quisquam.', 28, '2022-06-26', 15, 371, 1, 5, 'active', 'https://lorempixel.com/200/200/?23990'),
(173, 'Sint corrupti eveniet.', 30, '1987-05-26', 2, 996, 1, 3, 'active', 'https://lorempixel.com/200/200/?29457'),
(174, 'Excepturi quo saepe.', 61, '1989-09-27', 54, 169, 6, 3, 'active', 'https://lorempixel.com/200/200/?69000'),
(175, 'In magnam et.', 29, '2011-10-31', 1, 599, 6, 3, 'active', 'https://lorempixel.com/200/200/?94611'),
(176, 'Expedita delectus fuga enim.', 61, '2000-09-19', 89, 387, 3, 2, 'active', 'https://lorempixel.com/200/200/?81023'),
(177, 'Porro non dolorem maxime nulla.', 13, '1972-05-15', 44, 320, 4, 6, 'active', 'https://lorempixel.com/200/200/?30955'),
(178, 'Id blanditiis dolores est ut.', 87, '1988-11-20', 11, 176, 6, 2, 'active', 'https://lorempixel.com/200/200/?28424'),
(179, 'Natus dolorum.', 96, '1975-02-26', 31, 118, 1, 5, 'active', 'https://lorempixel.com/200/200/?89164'),
(180, 'Incidunt eum.', 35, '1993-05-01', 21, 771, 5, 4, 'active', 'https://lorempixel.com/200/200/?69408'),
(181, 'Repudiandae nesciunt quia minima.', 39, '2018-11-10', 14, 688, 5, 2, 'active', 'https://lorempixel.com/200/200/?60698'),
(182, 'Culpa ut officia enim.', 19, '2003-01-06', 75, 615, 2, 3, 'active', 'https://lorempixel.com/200/200/?82961'),
(183, 'Rem voluptatem voluptates aut.', 73, '2018-08-19', 31, 864, 4, 5, 'active', 'https://lorempixel.com/200/200/?47542'),
(184, 'Animi animi voluptatem.', 53, '1983-03-16', 96, 752, 3, 4, 'active', 'https://lorempixel.com/200/200/?75731'),
(185, 'Ut voluptatem.', 7, '1998-06-09', 38, 273, 6, 5, 'active', 'https://lorempixel.com/200/200/?54856'),
(186, 'Dicta est voluptatum ut odit.', 14, '2001-05-12', 78, 653, 3, 6, 'active', 'https://lorempixel.com/200/200/?94638'),
(187, 'Debitis libero et.', 48, '1985-10-24', 44, 775, 4, 1, 'active', 'https://lorempixel.com/200/200/?29194'),
(188, 'Voluptas autem.', 77, '1996-04-06', 81, 819, 6, 3, 'active', 'https://lorempixel.com/200/200/?14292'),
(189, 'Aliquam perferendis non.', 91, '1982-12-22', 29, 541, 3, 3, 'active', 'https://lorempixel.com/200/200/?52235'),
(190, 'Voluptates repellat molestiae nam.', 9, '1974-07-02', 58, 440, 2, 1, 'active', 'https://lorempixel.com/200/200/?82876'),
(191, 'Sequi ipsa cum provident.', 45, '1970-06-06', 44, 344, 6, 6, 'active', 'https://lorempixel.com/200/200/?36849'),
(192, 'Illum nobis est qui repellendus.', 60, '2005-10-10', 32, 809, 3, 1, 'active', 'https://lorempixel.com/200/200/?31050'),
(193, 'Odit harum alias.', 74, '1982-10-07', 71, 426, 1, 4, 'active', 'https://lorempixel.com/200/200/?16259'),
(194, 'Reiciendis mollitia ipsam.', 93, '2010-12-20', 43, 43, 6, 2, 'active', 'https://lorempixel.com/200/200/?37720'),
(195, 'Nihil ipsum quo pariatur.', 41, '1975-05-14', 63, 275, 1, 2, 'active', 'https://lorempixel.com/200/200/?51824'),
(196, 'Dicta dolore accusantium enim.', 65, '2013-04-15', 58, 862, 6, 1, 'active', 'https://lorempixel.com/200/200/?67275'),
(197, 'Accusantium autem fugit.', 24, '2014-10-24', 20, 268, 4, 5, 'active', 'https://lorempixel.com/200/200/?15828'),
(198, 'Odio dolores maxime laudantium consectetur.', 11, '2009-04-17', 95, 871, 4, 3, 'active', 'https://lorempixel.com/200/200/?48113'),
(199, 'Provident quo est.', 45, '1970-02-27', 17, 394, 2, 1, 'active', 'https://lorempixel.com/200/200/?10713'),
(200, 'Dolorem quasi magni laborum.', 22, '2021-04-11', 47, 493, 4, 2, 'active', 'https://lorempixel.com/200/200/?71141'),
(201, 'Modi est possimus.', 15, '2002-07-03', 50, 897, 3, 5, 'active', 'https://lorempixel.com/200/200/?55106'),
(202, 'Quas iusto ipsam voluptas.', 38, '2012-07-18', 52, 847, 5, 1, 'active', 'https://lorempixel.com/200/200/?39648'),
(203, 'Placeat voluptas qui.', 41, '1993-12-25', 64, 873, 4, 5, 'active', 'https://lorempixel.com/200/200/?31774'),
(204, 'Repudiandae minus.', 91, '1998-01-12', 93, 443, 1, 2, 'active', 'https://lorempixel.com/200/200/?40822'),
(205, 'Modi eum facere.', 11, '2021-09-24', 5, 913, 6, 4, 'active', 'https://lorempixel.com/200/200/?39148'),
(206, 'Optio est error.', 29, '2011-11-04', 98, 405, 4, 5, 'active', 'https://lorempixel.com/200/200/?56580'),
(207, 'Nemo non ipsum.', 57, '2003-04-14', 82, 921, 1, 4, 'active', 'https://lorempixel.com/200/200/?52426'),
(208, 'Aut nihil at.', 17, '1984-08-04', 2, 541, 6, 2, 'active', 'https://lorempixel.com/200/200/?93919'),
(209, 'At qui ut.', 20, '2018-07-17', 70, 681, 5, 4, 'active', 'https://lorempixel.com/200/200/?28198'),
(210, 'Animi ducimus voluptates voluptatem.', 82, '1973-05-28', 17, 939, 5, 4, 'active', 'https://lorempixel.com/200/200/?71868'),
(211, 'Accusantium est quidem.', 66, '1987-08-10', 89, 643, 2, 5, 'active', 'https://lorempixel.com/200/200/?41042'),
(212, 'Rerum dolorum non ut.', 38, '1992-01-04', 9, 514, 4, 1, 'active', 'https://lorempixel.com/200/200/?54449'),
(213, 'Itaque doloremque est hic.', 22, '1987-04-17', 87, 276, 6, 3, 'active', 'https://lorempixel.com/200/200/?73625'),
(214, 'Architecto occaecati quibusdam.', 90, '2013-06-28', 56, 654, 4, 4, 'active', 'https://lorempixel.com/200/200/?65222'),
(215, 'Quos deleniti vitae repellendus.', 79, '2021-02-08', 32, 134, 6, 6, 'active', 'https://lorempixel.com/200/200/?89398'),
(216, 'Voluptate numquam rem nisi.', 1, '1985-11-24', 80, 16, 3, 5, 'active', 'https://lorempixel.com/200/200/?54279'),
(217, 'Dicta est ut.', 83, '1975-11-17', 56, 862, 3, 3, 'active', 'https://lorempixel.com/200/200/?90682'),
(218, 'A deleniti.', 34, '2018-06-06', 18, 561, 6, 4, 'active', 'https://lorempixel.com/200/200/?58974'),
(219, 'Saepe enim nostrum.', 33, '1993-04-10', 6, 722, 4, 1, 'active', 'https://lorempixel.com/200/200/?64130'),
(220, 'Vel ut adipisci.', 57, '2006-07-12', 66, 526, 2, 2, 'active', 'https://lorempixel.com/200/200/?72582'),
(221, 'Unde repellendus nulla at.', 31, '2016-11-20', 21, 461, 5, 1, 'active', 'https://lorempixel.com/200/200/?10580'),
(222, 'Assumenda commodi eius dolores.', 85, '1998-04-05', 70, 77, 2, 3, 'active', 'https://lorempixel.com/200/200/?25782'),
(223, 'Aperiam recusandae similique aut.', 96, '2006-12-08', 5, 909, 2, 2, 'active', 'https://lorempixel.com/200/200/?35261'),
(224, 'Quia necessitatibus tenetur laboriosam.', 20, '2016-07-22', 17, 697, 1, 2, 'active', 'https://lorempixel.com/200/200/?82118'),
(225, 'Enim et impedit repellendus.', 16, '2002-11-27', 38, 693, 6, 4, 'active', 'https://lorempixel.com/200/200/?52212'),
(226, 'Aut et et.', 47, '2015-10-27', 74, 190, 4, 3, 'active', 'https://lorempixel.com/200/200/?40189'),
(227, 'Quia odio quo.', 86, '1970-05-03', 7, 61, 2, 4, 'active', 'https://lorempixel.com/200/200/?26595'),
(228, 'Consequatur quod consequatur eos.', 91, '2008-01-30', 51, 934, 5, 6, 'active', 'https://lorempixel.com/200/200/?60209'),
(229, 'Quas dolor et voluptate.', 92, '2016-11-20', 23, 69, 6, 3, 'active', 'https://lorempixel.com/200/200/?37272'),
(230, 'Voluptatem dolorem necessitatibus.', 64, '1990-08-28', 15, 277, 2, 4, 'active', 'https://lorempixel.com/200/200/?20094'),
(231, 'Quod atque blanditiis.', 1, '1994-06-03', 63, 447, 1, 6, 'active', 'https://lorempixel.com/200/200/?29685'),
(232, 'Eligendi doloribus est id.', 45, '1974-04-27', 71, 374, 3, 2, 'active', 'https://lorempixel.com/200/200/?68503'),
(233, 'Voluptatem ipsum et.', 63, '2023-07-11', 25, 342, 1, 3, 'active', 'https://lorempixel.com/200/200/?85541'),
(234, 'Totam eum consequatur ex.', 26, '1998-10-07', 55, 736, 4, 6, 'active', 'https://lorempixel.com/200/200/?68057'),
(235, 'Consequatur fugiat et aut.', 24, '1991-07-01', 12, 746, 1, 5, 'active', 'https://lorempixel.com/200/200/?84227'),
(236, 'Necessitatibus in dolor vel.', 82, '1998-12-05', 65, 465, 1, 1, 'active', 'https://lorempixel.com/200/200/?43620'),
(237, 'Odit quasi voluptas.', 49, '2006-05-21', 69, 703, 2, 4, 'active', 'https://lorempixel.com/200/200/?29058'),
(238, 'Voluptatum dolorem architecto esse enim.', 55, '1984-11-05', 44, 523, 6, 5, 'active', 'https://lorempixel.com/200/200/?98838'),
(239, 'Labore consectetur quia mollitia.', 18, '1995-12-20', 47, 579, 6, 1, 'active', 'https://lorempixel.com/200/200/?17323'),
(240, 'Aut quidem nam.', 48, '2023-05-14', 29, 242, 6, 5, 'active', 'https://lorempixel.com/200/200/?29911'),
(241, 'Fugiat est ut sint.', 21, '1989-08-16', 97, 789, 2, 5, 'active', 'https://lorempixel.com/200/200/?71783'),
(242, 'Voluptatem voluptas voluptate omnis.', 65, '2022-01-01', 85, 503, 3, 6, 'active', 'https://lorempixel.com/200/200/?37698'),
(243, 'Blanditiis fugit aut et.', 30, '1979-09-02', 7, 399, 4, 5, 'active', 'https://lorempixel.com/200/200/?25110'),
(244, 'Explicabo ad qui rerum.', 89, '1993-12-09', 24, 598, 3, 1, 'active', 'https://lorempixel.com/200/200/?41166'),
(245, 'Aliquid natus.', 39, '2012-08-04', 78, 858, 2, 6, 'active', 'https://lorempixel.com/200/200/?66372'),
(246, 'Alias facilis itaque omnis cupiditate.', 89, '2004-07-21', 49, 138, 1, 6, 'active', 'https://lorempixel.com/200/200/?58463'),
(247, 'Ad nulla.', 56, '1991-05-26', 80, 626, 2, 5, 'active', 'https://lorempixel.com/200/200/?35396'),
(248, 'Odio cupiditate molestiae.', 97, '2004-02-06', 62, 676, 3, 1, 'active', 'https://lorempixel.com/200/200/?13934'),
(249, 'Excepturi eveniet asperiores eveniet.', 61, '1996-03-27', 16, 944, 6, 5, 'active', 'https://lorempixel.com/200/200/?43386'),
(250, 'Sed magnam voluptates cum.', 64, '2000-04-13', 52, 789, 3, 6, 'active', 'https://lorempixel.com/200/200/?18948'),
(251, 'Occaecati sint soluta rem.', 55, '2010-03-15', 80, 798, 4, 6, 'active', 'https://lorempixel.com/200/200/?91819'),
(252, 'Vitae dolorem vel.', 43, '2005-10-13', 46, 321, 5, 1, 'active', 'https://lorempixel.com/200/200/?61288'),
(253, 'Illum quia consequatur porro.', 18, '2010-12-25', 3, 360, 6, 5, 'active', 'https://lorempixel.com/200/200/?99456'),
(254, 'Quidem sint voluptas in.', 31, '1978-12-29', 46, 843, 5, 4, 'active', 'https://lorempixel.com/200/200/?58906'),
(255, 'Natus aliquam consequatur commodi.', 38, '2000-03-06', 44, 430, 2, 2, 'active', 'https://lorempixel.com/200/200/?62871'),
(256, 'Odit nemo repellendus.', 67, '1976-03-25', 51, 833, 5, 3, 'active', 'https://lorempixel.com/200/200/?12558'),
(257, 'Sequi maiores molestiae.', 52, '1990-02-15', 99, 613, 5, 6, 'active', 'https://lorempixel.com/200/200/?70686'),
(258, 'Aut et omnis.', 15, '2009-06-06', 63, 882, 4, 2, 'active', 'https://lorempixel.com/200/200/?29830'),
(259, 'Est aperiam qui.', 37, '2016-07-31', 68, 354, 5, 1, 'active', 'https://lorempixel.com/200/200/?67094'),
(260, 'Repellendus id perspiciatis.', 52, '1976-05-03', 66, 440, 6, 5, 'active', 'https://lorempixel.com/200/200/?27991'),
(261, 'Est rem ut.', 52, '2019-03-02', 49, 843, 2, 5, 'active', 'https://lorempixel.com/200/200/?25088'),
(262, 'Maiores dolorum repellendus reiciendis.', 82, '2010-11-03', 9, 918, 1, 6, 'active', 'https://lorempixel.com/200/200/?34019'),
(263, 'Ipsa quaerat id.', 92, '1983-04-09', 23, 649, 1, 2, 'active', 'https://lorempixel.com/200/200/?38506'),
(264, 'Aliquam laborum blanditiis sunt.', 72, '2004-02-24', 73, 729, 6, 5, 'active', 'https://lorempixel.com/200/200/?75796'),
(265, 'Et voluptatem deserunt rerum.', 33, '2011-10-14', 4, 795, 2, 4, 'active', 'https://lorempixel.com/200/200/?24713'),
(266, 'Unde nam recusandae consectetur.', 77, '2016-06-11', 67, 932, 3, 3, 'active', 'https://lorempixel.com/200/200/?25300'),
(267, 'Qui illo ut quia.', 60, '1983-12-09', 76, 615, 2, 1, 'active', 'https://lorempixel.com/200/200/?26662'),
(268, 'Omnis earum voluptatibus.', 39, '2015-04-16', 18, 124, 3, 1, 'active', 'https://lorempixel.com/200/200/?15555'),
(269, 'Delectus aperiam rerum repellat.', 92, '1983-06-21', 95, 390, 5, 2, 'active', 'https://lorempixel.com/200/200/?54013'),
(270, 'Vitae optio incidunt.', 71, '1979-05-17', 27, 980, 3, 1, 'active', 'https://lorempixel.com/200/200/?79941'),
(271, 'Nesciunt impedit praesentium occaecati.', 5, '1987-01-22', 95, 659, 5, 4, 'active', 'https://lorempixel.com/200/200/?42487'),
(272, 'Voluptatem repellendus numquam aut.', 76, '1983-09-26', 65, 976, 4, 4, 'active', 'https://lorempixel.com/200/200/?95224'),
(273, 'Totam aut sunt molestias.', 76, '1971-01-07', 42, 252, 3, 2, 'active', 'https://lorempixel.com/200/200/?84838'),
(274, 'Sed esse ea.', 92, '1986-05-16', 62, 633, 6, 5, 'active', 'https://lorempixel.com/200/200/?60588'),
(275, 'Sunt consectetur cumque aut.', 78, '1981-11-15', 61, 568, 5, 5, 'active', 'https://lorempixel.com/200/200/?20333'),
(276, 'Aut ad qui.', 69, '2016-12-10', 39, 702, 5, 6, 'active', 'https://lorempixel.com/200/200/?51235'),
(277, 'Exercitationem tempora sapiente et.', 40, '1986-03-29', 96, 553, 1, 1, 'active', 'https://lorempixel.com/200/200/?78801'),
(278, 'Ut tenetur odit explicabo.', 96, '1988-07-09', 96, 347, 4, 3, 'active', 'https://lorempixel.com/200/200/?49281'),
(279, 'Qui ratione quia.', 21, '1985-08-19', 74, 841, 2, 5, 'active', 'https://lorempixel.com/200/200/?48131'),
(280, 'Labore occaecati repellendus numquam.', 71, '1979-05-17', 8, 554, 2, 3, 'active', 'https://lorempixel.com/200/200/?62343'),
(281, 'Autem sed inventore est.', 42, '2011-08-19', 73, 990, 4, 2, 'active', 'https://lorempixel.com/200/200/?54548'),
(282, 'Quam nisi animi expedita.', 39, '1991-09-20', 78, 323, 6, 3, 'active', 'https://lorempixel.com/200/200/?96261'),
(283, 'Voluptas ipsum optio.', 57, '2002-03-10', 72, 725, 4, 3, 'active', 'https://lorempixel.com/200/200/?70355'),
(284, 'Iusto molestias officiis quo.', 99, '2018-05-12', 48, 294, 5, 6, 'active', 'https://lorempixel.com/200/200/?37165'),
(285, 'Et et exercitationem repellendus.', 47, '1986-08-15', 95, 586, 5, 5, 'active', 'https://lorempixel.com/200/200/?12408'),
(286, 'Nam id excepturi earum.', 86, '1984-07-17', 17, 155, 3, 5, 'active', 'https://lorempixel.com/200/200/?33597'),
(287, 'Culpa eos nihil nesciunt.', 91, '2009-02-23', 8, 102, 1, 5, 'active', 'https://lorempixel.com/200/200/?43607'),
(288, 'Cupiditate quisquam optio quod.', 98, '2016-09-28', 56, 673, 1, 3, 'active', 'https://lorempixel.com/200/200/?84531'),
(289, 'Explicabo omnis.', 1, '1996-02-10', 36, 257, 3, 2, 'active', 'https://lorempixel.com/200/200/?27112'),
(290, 'Quasi quisquam tempora in.', 20, '2013-06-21', 5, 751, 5, 4, 'active', 'https://lorempixel.com/200/200/?48150'),
(291, 'Amet vitae nihil voluptas labore.', 51, '2015-05-18', 64, 481, 3, 6, 'active', 'https://lorempixel.com/200/200/?31032'),
(292, 'Accusamus facilis unde eveniet sequi.', 88, '2000-09-02', 63, 39, 2, 6, 'active', 'https://lorempixel.com/200/200/?43615'),
(293, 'Dolorem fuga non.', 90, '1989-09-11', 82, 353, 5, 4, 'active', 'https://lorempixel.com/200/200/?61586'),
(294, 'Officiis ad eius labore.', 22, '1988-03-28', 86, 825, 2, 1, 'active', 'https://lorempixel.com/200/200/?31327'),
(295, 'Natus est consequatur ut.', 69, '2003-01-12', 92, 136, 3, 2, 'active', 'https://lorempixel.com/200/200/?87675'),
(296, 'Dolores voluptas officia quis.', 60, '2016-10-25', 3, 407, 1, 1, 'active', 'https://lorempixel.com/200/200/?48223'),
(297, 'Et illo repellat.', 22, '1978-03-01', 76, 256, 2, 5, 'active', 'https://lorempixel.com/200/200/?11586'),
(298, 'Voluptatem quaerat dolor.', 44, '2009-05-06', 30, 748, 6, 6, 'active', 'https://lorempixel.com/200/200/?16137'),
(299, 'Qui itaque quod.', 96, '2006-05-24', 39, 600, 3, 3, 'active', 'https://lorempixel.com/200/200/?99019'),
(300, 'Sapiente soluta est temporibus.', 90, '1995-06-13', 50, 587, 2, 4, 'active', 'https://lorempixel.com/200/200/?93890'),
(301, 'Expedita ut.', 92, '2023-12-02', 10, 590, 1, 1, 'active', 'https://lorempixel.com/200/200/?39915'),
(302, 'Eveniet sapiente sequi omnis.', 83, '1975-05-25', 1, 991, 6, 6, 'active', 'https://lorempixel.com/200/200/?49359'),
(303, 'Corrupti quibusdam sed.', 18, '2013-11-05', 84, 883, 5, 2, 'active', 'https://lorempixel.com/200/200/?67621'),
(304, 'Blanditiis ducimus in tempore.', 19, '2003-04-26', 5, 188, 4, 4, 'active', 'https://lorempixel.com/200/200/?63249'),
(305, 'Delectus ratione sed.', 32, '2004-11-16', 57, 867, 4, 6, 'active', 'https://lorempixel.com/200/200/?70461'),
(306, 'Est explicabo ipsum.', 50, '1977-01-30', 41, 890, 3, 2, 'active', 'https://lorempixel.com/200/200/?92868'),
(307, 'Dicta cupiditate dolores est.', 30, '1989-04-20', 73, 612, 6, 3, 'active', 'https://lorempixel.com/200/200/?21227'),
(308, 'A consectetur nemo.', 1, '2013-05-24', 5, 486, 5, 2, 'active', 'https://lorempixel.com/200/200/?29468'),
(309, 'Voluptas dicta nostrum.', 39, '2013-05-07', 17, 628, 6, 3, 'active', 'https://lorempixel.com/200/200/?78104'),
(310, 'Dolor veritatis delectus.', 31, '1991-04-13', 37, 578, 4, 6, 'active', 'https://lorempixel.com/200/200/?81596'),
(311, 'Assumenda laudantium molestiae.', 36, '1988-07-24', 10, 827, 4, 4, 'active', 'https://lorempixel.com/200/200/?75605'),
(312, 'Quidem error totam.', 80, '1979-06-22', 4, 164, 1, 6, 'active', 'https://lorempixel.com/200/200/?14448'),
(313, 'Et harum laboriosam ut.', 74, '1995-06-05', 41, 563, 4, 4, 'active', 'https://lorempixel.com/200/200/?17301'),
(314, 'Repellendus architecto et.', 32, '2007-06-11', 98, 54, 3, 3, 'active', 'https://lorempixel.com/200/200/?44405'),
(315, 'Corporis vero sint qui.', 28, '1992-08-29', 41, 454, 2, 5, 'active', 'https://lorempixel.com/200/200/?71771'),
(316, 'Provident sed nesciunt porro.', 61, '1972-11-11', 92, 468, 6, 1, 'active', 'https://lorempixel.com/200/200/?41370'),
(317, 'Nobis ut quia.', 58, '1972-08-18', 89, 27, 3, 2, 'active', 'https://lorempixel.com/200/200/?88381'),
(318, 'Iure ullam quo officiis.', 11, '2009-05-06', 88, 434, 3, 1, 'active', 'https://lorempixel.com/200/200/?48930'),
(319, 'Voluptates iure asperiores quidem atque.', 36, '2023-03-26', 81, 506, 3, 4, 'active', 'https://lorempixel.com/200/200/?49117'),
(320, 'Dignissimos distinctio provident et.', 43, '2007-05-15', 24, 423, 4, 3, 'active', 'https://lorempixel.com/200/200/?17130'),
(321, 'Velit dignissimos.', 57, '1996-11-09', 95, 718, 1, 1, 'active', 'https://lorempixel.com/200/200/?80675'),
(322, 'Cupiditate enim rem a amet.', 64, '1976-08-23', 80, 33, 4, 3, 'active', 'https://lorempixel.com/200/200/?79783'),
(323, 'Error et dolor et necessitatibus.', 50, '1993-09-27', 32, 200, 6, 3, 'active', 'https://lorempixel.com/200/200/?85603'),
(324, 'Quis magnam consequuntur.', 48, '2020-11-06', 71, 719, 6, 2, 'active', 'https://lorempixel.com/200/200/?97487'),
(325, 'Eaque maxime ut.', 78, '1978-04-08', 5, 312, 3, 6, 'active', 'https://lorempixel.com/200/200/?24256'),
(326, 'Molestias ex laborum.', 23, '1989-01-23', 32, 707, 6, 1, 'active', 'https://lorempixel.com/200/200/?91872'),
(327, 'Earum veritatis quia placeat.', 23, '2004-08-25', 32, 202, 1, 6, 'active', 'https://lorempixel.com/200/200/?61264'),
(328, 'Delectus ut ut dignissimos reprehenderit.', 97, '2003-08-07', 44, 672, 5, 3, 'active', 'https://lorempixel.com/200/200/?81473'),
(329, 'Ut sequi pariatur.', 70, '1988-03-03', 90, 138, 4, 1, 'active', 'https://lorempixel.com/200/200/?36010'),
(330, 'Nostrum hic.', 52, '2017-09-20', 47, 593, 6, 4, 'active', 'https://lorempixel.com/200/200/?57793'),
(331, 'Veritatis similique minus nesciunt.', 19, '1996-09-20', 85, 11, 2, 4, 'active', 'https://lorempixel.com/200/200/?82604'),
(332, 'Et voluptates ut minima fuga.', 56, '2018-10-17', 95, 849, 2, 5, 'active', 'https://lorempixel.com/200/200/?68285'),
(333, 'Quo omnis libero.', 41, '1980-04-11', 32, 139, 3, 4, 'active', 'https://lorempixel.com/200/200/?94120'),
(334, 'Aliquam non iure.', 9, '2012-07-06', 72, 429, 6, 2, 'active', 'https://lorempixel.com/200/200/?48943'),
(335, 'Aut vel eos eveniet.', 75, '2000-08-02', 29, 657, 6, 2, 'active', 'https://lorempixel.com/200/200/?13346'),
(336, 'Fugiat cupiditate deleniti reprehenderit consequatur.', 7, '1996-05-20', 24, 666, 4, 1, 'active', 'https://lorempixel.com/200/200/?96335'),
(337, 'Ex reprehenderit pariatur.', 9, '2003-05-30', 29, 324, 3, 4, 'active', 'https://lorempixel.com/200/200/?76775'),
(338, 'Ut excepturi et.', 5, '2001-05-15', 70, 482, 1, 5, 'active', 'https://lorempixel.com/200/200/?97095'),
(339, 'Non non quia.', 35, '2022-05-01', 19, 611, 3, 2, 'active', 'https://lorempixel.com/200/200/?93395'),
(340, 'Numquam et numquam earum.', 100, '2008-05-25', 41, 479, 5, 5, 'active', 'https://lorempixel.com/200/200/?93829'),
(341, 'Voluptatum tenetur dicta voluptatum est.', 5, '2010-12-05', 36, 809, 4, 4, 'active', 'https://lorempixel.com/200/200/?44462'),
(342, 'Non rem rerum.', 45, '2003-09-27', 74, 187, 2, 5, 'active', 'https://lorempixel.com/200/200/?62851'),
(343, 'Accusamus enim in.', 1, '1989-05-30', 86, 541, 3, 3, 'active', 'https://lorempixel.com/200/200/?99398'),
(344, 'Dolorum itaque sed et.', 45, '2016-03-05', 13, 159, 1, 2, 'active', 'https://lorempixel.com/200/200/?67738'),
(345, 'Reiciendis voluptatem cumque.', 3, '1993-04-17', 76, 658, 4, 5, 'active', 'https://lorempixel.com/200/200/?96002'),
(346, 'Et animi magni laboriosam.', 89, '1970-03-02', 16, 962, 3, 1, 'active', 'https://lorempixel.com/200/200/?85308'),
(347, 'Velit aut velit.', 21, '2018-08-09', 18, 655, 5, 1, 'active', 'https://lorempixel.com/200/200/?82097'),
(348, 'Quod similique.', 71, '2022-02-19', 11, 320, 4, 3, 'active', 'https://lorempixel.com/200/200/?26599'),
(349, 'Velit cumque est iusto.', 37, '2006-08-19', 84, 414, 6, 2, 'active', 'https://lorempixel.com/200/200/?91298'),
(350, 'Tempore nam alias amet nemo.', 48, '2014-06-11', 57, 239, 6, 2, 'active', 'https://lorempixel.com/200/200/?45392'),
(351, 'Neque est aperiam.', 17, '2008-07-06', 38, 437, 4, 6, 'active', 'https://lorempixel.com/200/200/?42228'),
(352, 'Accusantium cum deserunt quia.', 56, '1999-09-19', 61, 937, 4, 5, 'active', 'https://lorempixel.com/200/200/?95224'),
(353, 'Velit quia sit ipsum.', 27, '2018-12-18', 63, 857, 3, 2, 'active', 'https://lorempixel.com/200/200/?18637'),
(354, 'Deleniti nostrum iste dolores.', 93, '1987-01-25', 48, 491, 6, 3, 'active', 'https://lorempixel.com/200/200/?21823'),
(355, 'Magnam nostrum soluta perferendis.', 76, '2018-07-11', 93, 892, 6, 5, 'active', 'https://lorempixel.com/200/200/?14571'),
(356, 'Et est ut quo.', 74, '2008-03-19', 58, 534, 5, 5, 'active', 'https://lorempixel.com/200/200/?15279'),
(357, 'Et optio voluptas.', 76, '2009-12-02', 44, 31, 5, 5, 'active', 'https://lorempixel.com/200/200/?62446'),
(358, 'Fugiat consequatur libero et.', 50, '2004-10-23', 47, 987, 5, 4, 'active', 'https://lorempixel.com/200/200/?70510'),
(359, 'Dolorum iure.', 83, '2014-09-10', 41, 546, 3, 6, 'active', 'https://lorempixel.com/200/200/?44705'),
(360, 'Magni a.', 60, '2024-03-30', 3, 973, 6, 4, 'active', 'https://lorempixel.com/200/200/?77186'),
(361, 'Corporis doloremque consectetur iste.', 24, '2021-04-14', 91, 370, 4, 3, 'active', 'https://lorempixel.com/200/200/?43164'),
(362, 'Exercitationem aut non laborum.', 8, '2016-01-10', 76, 145, 5, 5, 'active', 'https://lorempixel.com/200/200/?62895'),
(363, 'Aut et hic beatae perspiciatis.', 100, '1983-05-01', 21, 331, 1, 2, 'active', 'https://lorempixel.com/200/200/?96143'),
(364, 'Aperiam laborum provident.', 28, '1996-06-10', 54, 516, 2, 2, 'active', 'https://lorempixel.com/200/200/?17877'),
(365, 'Dolorem optio exercitationem magnam.', 53, '1972-08-11', 26, 207, 3, 3, 'active', 'https://lorempixel.com/200/200/?85539'),
(366, 'Consequatur nostrum.', 100, '1973-08-29', 69, 150, 6, 4, 'active', 'https://lorempixel.com/200/200/?25530'),
(367, 'Molestias deleniti doloribus.', 47, '2016-02-13', 49, 560, 3, 4, 'active', 'https://lorempixel.com/200/200/?23795'),
(368, 'Ut eos odio.', 67, '1984-03-03', 15, 784, 4, 2, 'active', 'https://lorempixel.com/200/200/?89149'),
(369, 'Et voluptatem quia nihil.', 56, '2016-05-12', 74, 304, 2, 4, 'active', 'https://lorempixel.com/200/200/?60071'),
(370, 'Commodi facilis minus nemo.', 13, '2003-02-11', 12, 768, 2, 1, 'active', 'https://lorempixel.com/200/200/?47427'),
(371, 'Quos maiores perferendis qui voluptatum.', 44, '1987-03-22', 7, 393, 2, 5, 'active', 'https://lorempixel.com/200/200/?68889'),
(372, 'Autem molestiae ullam.', 77, '2016-05-11', 60, 885, 1, 6, 'active', 'https://lorempixel.com/200/200/?77998'),
(373, 'Rerum perspiciatis nesciunt ea.', 97, '1977-07-03', 12, 93, 2, 2, 'active', 'https://lorempixel.com/200/200/?24007'),
(374, 'Non aliquam ipsam ipsum.', 9, '1992-03-22', 74, 425, 6, 4, 'active', 'https://lorempixel.com/200/200/?41206'),
(375, 'Eos voluptatem sit.', 39, '2000-11-04', 29, 499, 6, 4, 'active', 'https://lorempixel.com/200/200/?21997'),
(376, 'Quis assumenda.', 9, '2013-06-25', 8, 293, 6, 4, 'active', 'https://lorempixel.com/200/200/?87986'),
(377, 'Qui perspiciatis veniam laudantium.', 95, '2002-08-05', 65, 354, 5, 6, 'active', 'https://lorempixel.com/200/200/?74934'),
(378, 'Sit qui eveniet dolorem.', 20, '1970-10-30', 89, 799, 4, 3, 'active', 'https://lorempixel.com/200/200/?47969'),
(379, 'Dolor nisi consequuntur.', 54, '2009-12-17', 30, 684, 3, 3, 'active', 'https://lorempixel.com/200/200/?95643'),
(380, 'Ut alias quam.', 34, '1982-11-10', 70, 758, 6, 6, 'active', 'https://lorempixel.com/200/200/?17227'),
(381, 'Et sit.', 77, '2004-04-19', 26, 760, 1, 2, 'active', 'https://lorempixel.com/200/200/?33080'),
(382, 'Eum molestiae nihil.', 39, '1988-12-11', 34, 649, 6, 6, 'active', 'https://lorempixel.com/200/200/?53589'),
(383, 'Reprehenderit sed rerum non magnam.', 5, '1980-11-27', 60, 871, 3, 6, 'active', 'https://lorempixel.com/200/200/?44596'),
(384, 'Consequatur odio dolores id.', 10, '1973-07-04', 24, 208, 3, 4, 'active', 'https://lorempixel.com/200/200/?47205'),
(385, 'Ipsum dolorem.', 19, '2009-09-06', 98, 896, 2, 6, 'active', 'https://lorempixel.com/200/200/?41575'),
(386, 'Nemo accusamus quas non.', 62, '2019-09-29', 10, 78, 5, 3, 'active', 'https://lorempixel.com/200/200/?70338'),
(387, 'Porro repellat minima asperiores.', 37, '1985-06-11', 69, 844, 6, 3, 'active', 'https://lorempixel.com/200/200/?29529'),
(388, 'Temporibus id in.', 79, '1977-08-05', 51, 36, 4, 5, 'active', 'https://lorempixel.com/200/200/?50081'),
(389, 'Aut vel animi expedita.', 100, '1978-10-20', 23, 274, 2, 4, 'active', 'https://lorempixel.com/200/200/?60984'),
(390, 'Omnis cupiditate dolor error.', 21, '1999-05-15', 36, 804, 1, 4, 'active', 'https://lorempixel.com/200/200/?69195'),
(391, 'Et tenetur quia.', 46, '1979-03-03', 53, 213, 6, 1, 'active', 'https://lorempixel.com/200/200/?88161'),
(392, 'Excepturi autem ut.', 74, '1993-11-10', 92, 419, 1, 3, 'active', 'https://lorempixel.com/200/200/?40364'),
(393, 'Rerum occaecati.', 62, '1988-12-13', 70, 606, 5, 5, 'active', 'https://lorempixel.com/200/200/?24663'),
(394, 'Aut eligendi quaerat.', 12, '1981-08-05', 98, 169, 3, 1, 'active', 'https://lorempixel.com/200/200/?16008'),
(395, 'Voluptates eveniet quis.', 14, '1972-10-16', 69, 493, 3, 4, 'active', 'https://lorempixel.com/200/200/?65256'),
(396, 'Sit aut aliquam odio doloribus.', 41, '1988-08-29', 92, 193, 2, 6, 'active', 'https://lorempixel.com/200/200/?85505'),
(397, 'Et nobis commodi corporis.', 40, '2007-12-02', 23, 287, 5, 3, 'active', 'https://lorempixel.com/200/200/?12784'),
(398, 'Corrupti modi est sed.', 69, '1976-10-27', 14, 895, 1, 4, 'active', 'https://lorempixel.com/200/200/?99675'),
(399, 'Expedita rerum ut.', 27, '1976-09-16', 69, 799, 5, 4, 'active', 'https://lorempixel.com/200/200/?66924'),
(400, 'Explicabo eum aut.', 57, '2011-09-24', 48, 131, 3, 6, 'active', 'https://lorempixel.com/200/200/?35220'),
(401, 'Aut enim fugiat.', 14, '1987-05-10', 51, 91, 1, 6, 'active', 'https://lorempixel.com/200/200/?57342'),
(402, 'Ut quis autem.', 69, '1973-09-02', 96, 727, 2, 5, 'active', 'https://lorempixel.com/200/200/?29412'),
(403, 'Animi optio.', 91, '2020-05-24', 29, 292, 3, 2, 'active', 'https://lorempixel.com/200/200/?19816'),
(404, 'Nihil voluptatem dolorem consequatur.', 7, '1985-02-02', 27, 651, 3, 2, 'active', 'https://lorempixel.com/200/200/?59282'),
(405, 'Ea repellendus nulla.', 44, '2010-07-18', 9, 581, 6, 6, 'active', 'https://lorempixel.com/200/200/?44918'),
(406, 'Rerum eius rerum ipsam corrupti.', 57, '2015-01-30', 58, 248, 6, 5, 'active', 'https://lorempixel.com/200/200/?96111'),
(407, 'Sed sed eaque.', 11, '2001-08-13', 100, 80, 3, 1, 'active', 'https://lorempixel.com/200/200/?22180'),
(408, 'In quos facilis autem sunt.', 98, '2019-07-23', 34, 644, 1, 6, 'active', 'https://lorempixel.com/200/200/?80945'),
(409, 'Totam eos dolor.', 65, '1991-09-15', 93, 231, 5, 4, 'active', 'https://lorempixel.com/200/200/?12209'),
(410, 'Officiis consectetur facere.', 45, '2017-01-10', 36, 746, 3, 1, 'active', 'https://lorempixel.com/200/200/?93553'),
(411, 'Adipisci incidunt commodi culpa.', 50, '1977-12-10', 73, 272, 1, 6, 'active', 'https://lorempixel.com/200/200/?37682'),
(412, 'Quisquam facilis unde.', 96, '2003-12-09', 52, 917, 3, 2, 'active', 'https://lorempixel.com/200/200/?14126'),
(413, 'Dolorem qui molestiae.', 2, '1983-05-05', 62, 348, 1, 2, 'active', 'https://lorempixel.com/200/200/?72542'),
(414, 'Tenetur commodi ea eum.', 23, '1974-09-23', 72, 430, 3, 4, 'active', 'https://lorempixel.com/200/200/?99591'),
(415, 'Perspiciatis laboriosam.', 3, '2016-09-09', 51, 713, 1, 1, 'active', 'https://lorempixel.com/200/200/?16347'),
(416, 'Deserunt ex similique voluptatem.', 50, '2011-01-09', 34, 204, 2, 3, 'active', 'https://lorempixel.com/200/200/?40742'),
(417, 'In itaque molestiae consequatur.', 46, '2001-01-28', 31, 986, 1, 2, 'active', 'https://lorempixel.com/200/200/?21523'),
(418, 'Perspiciatis alias.', 88, '1997-08-01', 32, 79, 6, 5, 'active', 'https://lorempixel.com/200/200/?56295'),
(419, 'Vel aspernatur dolores porro.', 73, '1984-12-26', 37, 170, 3, 1, 'active', 'https://lorempixel.com/200/200/?14009'),
(420, 'Facere ea ea optio.', 4, '2016-11-20', 32, 302, 4, 6, 'active', 'https://lorempixel.com/200/200/?31505'),
(421, 'Nihil et expedita quia vel.', 23, '1998-03-11', 80, 670, 5, 1, 'active', 'https://lorempixel.com/200/200/?20084'),
(422, 'Autem possimus quo.', 54, '2012-06-14', 44, 758, 6, 1, 'active', 'https://lorempixel.com/200/200/?31656'),
(423, 'Quia quibusdam.', 92, '1993-08-18', 68, 533, 6, 3, 'active', 'https://lorempixel.com/200/200/?74513'),
(424, 'Debitis eum eveniet ipsam.', 32, '2022-03-09', 15, 56, 5, 1, 'active', 'https://lorempixel.com/200/200/?74648'),
(425, 'Repudiandae aut nesciunt.', 6, '1985-07-01', 95, 714, 3, 4, 'active', 'https://lorempixel.com/200/200/?71531'),
(426, 'Quia quibusdam laborum velit.', 71, '2019-12-23', 8, 546, 6, 5, 'active', 'https://lorempixel.com/200/200/?90782'),
(427, 'Aperiam sed ratione.', 91, '1975-02-06', 33, 385, 5, 2, 'active', 'https://lorempixel.com/200/200/?32182'),
(428, 'Similique similique maxime eos.', 37, '1982-02-19', 72, 967, 1, 1, 'active', 'https://lorempixel.com/200/200/?35415');
INSERT INTO `produit` (`idProd`, `nomProd`, `numLot`, `datePerem`, `qteDispo`, `prixU`, `idFournis`, `idCategorie`, `etat`, `imageProd`) VALUES
(429, 'Modi qui omnis sit.', 74, '1982-02-06', 8, 408, 3, 5, 'active', 'https://lorempixel.com/200/200/?53813'),
(430, 'Velit quas et.', 70, '2009-10-12', 4, 528, 4, 5, 'active', 'https://lorempixel.com/200/200/?76397'),
(431, 'Nemo dolorem ullam debitis.', 43, '1979-11-28', 21, 680, 1, 5, 'active', 'https://lorempixel.com/200/200/?49947'),
(432, 'Fugiat quia.', 13, '1971-06-02', 88, 560, 4, 4, 'active', 'https://lorempixel.com/200/200/?37669'),
(433, 'Quibusdam quas voluptas.', 96, '1983-04-18', 75, 139, 2, 4, 'active', 'https://lorempixel.com/200/200/?50728'),
(434, 'Deserunt voluptatem a.', 63, '1974-08-28', 37, 470, 3, 5, 'active', 'https://lorempixel.com/200/200/?39032'),
(435, 'Provident et cum qui.', 65, '1976-07-18', 73, 732, 6, 1, 'active', 'https://lorempixel.com/200/200/?42279'),
(436, 'Quo et tempore.', 4, '2023-04-01', 57, 705, 4, 3, 'active', 'https://lorempixel.com/200/200/?89786'),
(437, 'Dignissimos et minima iusto.', 53, '2000-11-06', 40, 574, 2, 2, 'active', 'https://lorempixel.com/200/200/?95550'),
(438, 'Commodi qui voluptas ex est.', 39, '1985-02-28', 33, 356, 5, 2, 'active', 'https://lorempixel.com/200/200/?25010'),
(439, 'Ea molestias eum.', 78, '1985-02-19', 8, 253, 1, 1, 'active', 'https://lorempixel.com/200/200/?68668'),
(440, 'Autem id.', 48, '2007-06-15', 78, 289, 3, 5, 'active', 'https://lorempixel.com/200/200/?27299'),
(441, 'Quaerat quis quod.', 84, '1987-05-13', 23, 150, 4, 2, 'active', 'https://lorempixel.com/200/200/?52693'),
(442, 'Eius ducimus magnam.', 12, '1997-03-06', 46, 532, 6, 2, 'active', 'https://lorempixel.com/200/200/?58603'),
(443, 'Cumque voluptatem unde.', 1, '1980-07-12', 33, 352, 4, 3, 'active', 'https://lorempixel.com/200/200/?30559'),
(444, 'Iure autem adipisci.', 58, '1994-07-23', 11, 61, 2, 6, 'active', 'https://lorempixel.com/200/200/?28870'),
(445, 'Error in ab ratione.', 12, '2013-06-19', 62, 459, 4, 4, 'active', 'https://lorempixel.com/200/200/?66888'),
(446, 'Et et qui corrupti.', 100, '1993-01-17', 42, 766, 5, 6, 'active', 'https://lorempixel.com/200/200/?21124'),
(447, 'Saepe corporis repudiandae est.', 97, '2014-01-08', 22, 128, 4, 5, 'active', 'https://lorempixel.com/200/200/?54587'),
(448, 'Voluptate illo porro rerum.', 70, '2016-07-02', 5, 548, 4, 2, 'active', 'https://lorempixel.com/200/200/?17432'),
(449, 'Aliquid ut facere.', 99, '2023-08-19', 42, 839, 5, 3, 'active', 'https://lorempixel.com/200/200/?47628'),
(450, 'Libero omnis voluptas et commodi.', 7, '1985-06-28', 87, 736, 3, 6, 'active', 'https://lorempixel.com/200/200/?98408'),
(451, 'Consequatur dicta aut.', 95, '2016-01-01', 18, 625, 3, 2, 'active', 'https://lorempixel.com/200/200/?41153'),
(452, 'Quia et illo.', 83, '1984-02-28', 36, 169, 3, 5, 'active', 'https://lorempixel.com/200/200/?24008'),
(453, 'Velit non deserunt.', 23, '2007-10-03', 18, 647, 1, 3, 'active', 'https://lorempixel.com/200/200/?87423'),
(454, 'Doloremque saepe possimus distinctio.', 30, '2006-02-09', 31, 301, 6, 4, 'active', 'https://lorempixel.com/200/200/?26064'),
(455, 'Adipisci et minus.', 63, '1999-07-03', 3, 811, 6, 1, 'active', 'https://lorempixel.com/200/200/?55674'),
(456, 'Voluptatum at omnis.', 94, '2011-10-13', 34, 994, 1, 5, 'active', 'https://lorempixel.com/200/200/?49441'),
(457, 'Quod aperiam dolores qui.', 78, '2009-09-16', 12, 377, 1, 4, 'active', 'https://lorempixel.com/200/200/?66340'),
(458, 'In beatae ipsa sapiente.', 45, '2016-02-15', 96, 521, 4, 5, 'active', 'https://lorempixel.com/200/200/?43797'),
(459, 'Autem sit.', 33, '2001-12-21', 27, 995, 5, 5, 'active', 'https://lorempixel.com/200/200/?96883'),
(460, 'Eveniet voluptas rerum.', 91, '2007-04-21', 30, 173, 2, 6, 'active', 'https://lorempixel.com/200/200/?49006'),
(461, 'Ex tempora ut dolorem.', 32, '2011-08-14', 59, 933, 6, 2, 'active', 'https://lorempixel.com/200/200/?81675'),
(462, 'Velit sunt nemo.', 4, '1988-10-28', 27, 529, 1, 5, 'active', 'https://lorempixel.com/200/200/?45758'),
(463, 'Cum tempora molestias similique.', 89, '2023-04-18', 80, 811, 3, 4, 'active', 'https://lorempixel.com/200/200/?28971'),
(464, 'Alias suscipit.', 65, '1987-02-09', 56, 351, 5, 4, 'active', 'https://lorempixel.com/200/200/?41390'),
(465, 'Sequi excepturi enim.', 84, '1971-09-20', 55, 605, 3, 4, 'active', 'https://lorempixel.com/200/200/?91161'),
(466, 'Vel vel.', 13, '2024-01-29', 55, 390, 1, 1, 'active', 'https://lorempixel.com/200/200/?37937'),
(467, 'Et suscipit.', 81, '1993-07-29', 59, 778, 5, 3, 'active', 'https://lorempixel.com/200/200/?28476'),
(468, 'Asperiores dolor voluptatibus nam.', 97, '2016-06-04', 41, 696, 6, 4, 'active', 'https://lorempixel.com/200/200/?80304'),
(469, 'Ratione nulla quaerat earum.', 65, '1988-01-04', 49, 573, 3, 6, 'active', 'https://lorempixel.com/200/200/?87817'),
(470, 'Non beatae et ea.', 48, '2001-09-17', 26, 675, 2, 4, 'active', 'https://lorempixel.com/200/200/?40583'),
(471, 'Voluptates ad possimus.', 23, '1986-05-21', 97, 528, 6, 4, 'active', 'https://lorempixel.com/200/200/?12288'),
(472, 'Est quod dolorum incidunt.', 60, '2013-08-24', 87, 562, 3, 6, 'active', 'https://lorempixel.com/200/200/?39917'),
(473, 'Delectus architecto distinctio veniam.', 54, '1982-06-27', 57, 829, 1, 2, 'active', 'https://lorempixel.com/200/200/?35137'),
(474, 'Dolores ut debitis.', 59, '1993-07-05', 2, 157, 3, 1, 'active', 'https://lorempixel.com/200/200/?17605'),
(475, 'Et explicabo ad fugit.', 75, '1983-09-18', 62, 783, 6, 5, 'active', 'https://lorempixel.com/200/200/?13063'),
(476, 'Iure sit ducimus.', 65, '1989-02-12', 8, 931, 4, 1, 'active', 'https://lorempixel.com/200/200/?94656'),
(477, 'Dicta dolorem blanditiis quidem.', 86, '2010-07-18', 10, 108, 6, 3, 'active', 'https://lorempixel.com/200/200/?37631'),
(478, 'Architecto qui.', 32, '2000-04-12', 52, 966, 2, 2, 'active', 'https://lorempixel.com/200/200/?78707'),
(479, 'Quo esse minus et.', 81, '2011-10-28', 24, 981, 1, 1, 'active', 'https://lorempixel.com/200/200/?84648'),
(480, 'Ut eum cupiditate necessitatibus.', 26, '1983-08-05', 18, 261, 1, 4, 'active', 'https://lorempixel.com/200/200/?38484'),
(481, 'Ut deleniti assumenda rerum.', 34, '2014-05-25', 26, 782, 1, 3, 'active', 'https://lorempixel.com/200/200/?80687'),
(482, 'Rerum quia modi voluptatem.', 26, '1986-05-19', 67, 754, 1, 3, 'active', 'https://lorempixel.com/200/200/?95621'),
(483, 'Molestiae et error et.', 81, '1991-09-05', 64, 727, 6, 3, 'active', 'https://lorempixel.com/200/200/?36342'),
(484, 'Eum alias autem tempora possimus.', 97, '1999-06-04', 23, 148, 2, 3, 'active', 'https://lorempixel.com/200/200/?42272'),
(485, 'Sit et saepe.', 7, '1989-12-25', 65, 355, 5, 4, 'active', 'https://lorempixel.com/200/200/?99926'),
(486, 'Cumque dignissimos similique.', 7, '2017-11-15', 95, 217, 4, 1, 'active', 'https://lorempixel.com/200/200/?14441'),
(487, 'Odit tempora atque.', 11, '1993-04-05', 6, 929, 1, 5, 'active', 'https://lorempixel.com/200/200/?64075'),
(488, 'Voluptates accusantium ipsam quia.', 12, '1979-10-08', 10, 375, 4, 1, 'active', 'https://lorempixel.com/200/200/?23525'),
(489, 'Non adipisci nam quia.', 93, '2019-01-19', 42, 275, 1, 4, 'active', 'https://lorempixel.com/200/200/?23025'),
(490, 'Sint nulla rerum.', 87, '2006-05-20', 77, 518, 3, 1, 'active', 'https://lorempixel.com/200/200/?35564'),
(491, 'Velit reprehenderit id neque.', 33, '2018-04-20', 60, 828, 3, 6, 'active', 'https://lorempixel.com/200/200/?47480'),
(492, 'Ea dolor rem.', 40, '1994-06-22', 48, 586, 6, 3, 'active', 'https://lorempixel.com/200/200/?14525'),
(493, 'In odio cupiditate.', 32, '2018-12-04', 94, 492, 4, 3, 'active', 'https://lorempixel.com/200/200/?89659'),
(494, 'Qui dolorem vero non explicabo.', 30, '1972-11-16', 81, 925, 2, 1, 'active', 'https://lorempixel.com/200/200/?83294'),
(495, 'Consequatur est quos harum.', 5, '1989-12-16', 17, 422, 4, 2, 'active', 'https://lorempixel.com/200/200/?38510'),
(496, 'Nulla nisi ea.', 42, '2017-06-06', 84, 378, 2, 1, 'active', 'https://lorempixel.com/200/200/?11454'),
(497, 'Ut est esse in.', 19, '1983-12-23', 5, 688, 1, 2, 'active', 'https://lorempixel.com/200/200/?41972'),
(498, 'Natus reprehenderit reprehenderit ut facilis.', 89, '2022-01-19', 73, 657, 3, 1, 'active', 'https://lorempixel.com/200/200/?69758'),
(499, 'Qui aut voluptates.', 95, '1991-06-07', 65, 131, 3, 2, 'active', 'https://lorempixel.com/200/200/?45155'),
(500, 'Voluptatem dolor sequi rerum.', 29, '1986-07-02', 88, 205, 3, 5, 'active', 'https://lorempixel.com/200/200/?82680'),
(501, 'Odio magni expedita nulla doloribus.', 83, '1981-06-06', 77, 458, 4, 6, 'active', 'https://lorempixel.com/200/200/?97027'),
(502, 'Atque consequuntur est.', 48, '1986-05-10', 9, 995, 6, 6, 'active', 'https://lorempixel.com/200/200/?65205'),
(503, 'Sit et.', 30, '2021-03-27', 45, 56, 1, 5, 'active', 'https://lorempixel.com/200/200/?95176'),
(504, 'Voluptas quis.', 1, '2006-05-19', 17, 841, 1, 4, 'active', 'https://lorempixel.com/200/200/?61873'),
(505, 'Id nesciunt qui.', 76, '1998-02-08', 15, 909, 2, 3, 'active', 'https://lorempixel.com/200/200/?87358'),
(506, 'Doloremque neque.', 68, '1974-07-20', 53, 772, 1, 2, 'active', 'https://lorempixel.com/200/200/?44366'),
(507, 'Vel sed aut sed.', 62, '1984-05-23', 84, 29, 5, 5, 'active', 'https://lorempixel.com/200/200/?84263'),
(508, 'Sit quisquam.', 59, '2000-08-17', 3, 237, 2, 1, 'active', 'https://lorempixel.com/200/200/?17163'),
(509, 'Et eum optio voluptatem neque.', 27, '2023-07-28', 79, 181, 5, 4, 'active', 'https://lorempixel.com/200/200/?34483'),
(510, 'Rerum provident labore.', 62, '2002-01-15', 6, 319, 1, 6, 'active', 'https://lorempixel.com/200/200/?90699'),
(511, 'Natus et quae.', 27, '2020-07-06', 7, 209, 5, 5, 'active', 'https://lorempixel.com/200/200/?20984'),
(512, 'Minima dolorum sequi.', 97, '2007-07-21', 30, 465, 4, 5, 'active', 'https://lorempixel.com/200/200/?67546'),
(513, 'Harum quasi et.', 26, '1988-02-18', 98, 76, 1, 6, 'active', 'https://lorempixel.com/200/200/?84475'),
(514, 'Voluptatem id explicabo ab.', 81, '2019-11-23', 11, 542, 3, 3, 'active', 'https://lorempixel.com/200/200/?11764'),
(515, 'Voluptate libero quo optio.', 84, '1973-07-30', 91, 167, 6, 6, 'active', 'https://lorempixel.com/200/200/?64389'),
(516, 'Nulla est omnis.', 8, '1979-08-24', 27, 147, 3, 2, 'active', 'https://lorempixel.com/200/200/?65440'),
(517, 'Et in possimus est.', 25, '1975-12-26', 74, 378, 3, 5, 'active', 'https://lorempixel.com/200/200/?55003'),
(518, 'Repellendus voluptatem consequatur.', 35, '2002-09-16', 3, 215, 1, 3, 'active', 'https://lorempixel.com/200/200/?84190'),
(519, 'Cum unde dolore et.', 40, '2009-06-23', 90, 177, 6, 1, 'active', 'https://lorempixel.com/200/200/?77417'),
(520, 'Maiores nobis.', 58, '1985-08-01', 26, 371, 1, 5, 'active', 'https://lorempixel.com/200/200/?75027'),
(521, 'Distinctio ut non nostrum error.', 62, '2014-12-08', 99, 553, 5, 1, 'active', 'https://lorempixel.com/200/200/?31843'),
(522, 'Nam enim ut sapiente.', 17, '2007-10-10', 17, 986, 3, 1, 'active', 'https://lorempixel.com/200/200/?78809'),
(523, 'Dolor ab dolor.', 19, '2007-03-11', 26, 911, 1, 3, 'active', 'https://lorempixel.com/200/200/?28655'),
(524, 'Sit ut impedit ea.', 78, '2002-01-19', 10, 282, 2, 2, 'active', 'https://lorempixel.com/200/200/?22161'),
(525, 'Odio quia ut magnam.', 50, '1983-07-05', 14, 646, 3, 3, 'active', 'https://lorempixel.com/200/200/?69996'),
(526, 'Doloribus est et molestias.', 44, '2011-02-02', 77, 427, 2, 3, 'active', 'https://lorempixel.com/200/200/?71897'),
(527, 'Non voluptates.', 40, '1982-06-28', 95, 631, 6, 6, 'active', 'https://lorempixel.com/200/200/?85948'),
(528, 'Voluptatem minus unde ut.', 92, '1991-11-07', 54, 628, 1, 5, 'active', 'https://lorempixel.com/200/200/?14202'),
(529, 'Accusamus qui molestias sint.', 2, '2013-01-13', 45, 491, 5, 1, 'active', 'https://lorempixel.com/200/200/?42530'),
(530, 'Et numquam tempore.', 63, '1983-10-24', 15, 894, 1, 2, 'active', 'https://lorempixel.com/200/200/?42712'),
(531, 'Quia alias.', 34, '1984-12-25', 29, 891, 5, 5, 'active', 'https://lorempixel.com/200/200/?60731'),
(532, 'Ipsum vitae vel.', 74, '1981-05-27', 4, 461, 2, 3, 'active', 'https://lorempixel.com/200/200/?74061'),
(533, 'Quia ipsam.', 66, '1987-08-21', 50, 190, 3, 1, 'active', 'https://lorempixel.com/200/200/?45174'),
(534, 'Dolor quo praesentium magnam.', 14, '1980-06-21', 31, 943, 5, 4, 'active', 'https://lorempixel.com/200/200/?66540'),
(535, 'Commodi assumenda.', 13, '1981-03-20', 57, 804, 3, 4, 'active', 'https://lorempixel.com/200/200/?22790'),
(536, 'Est minus quaerat ab.', 47, '2013-04-11', 66, 740, 5, 4, 'active', 'https://lorempixel.com/200/200/?57822'),
(537, 'Ut in dolores minima.', 76, '1986-06-28', 1, 846, 5, 2, 'active', 'https://lorempixel.com/200/200/?95858'),
(538, 'Fugiat mollitia.', 91, '2002-09-16', 84, 925, 4, 2, 'active', 'https://lorempixel.com/200/200/?18884'),
(539, 'Officia autem illo.', 98, '2006-03-01', 7, 939, 6, 5, 'active', 'https://lorempixel.com/200/200/?49219'),
(540, 'Voluptas in illum.', 45, '2008-10-19', 63, 125, 1, 2, 'active', 'https://lorempixel.com/200/200/?10489'),
(541, 'Totam totam beatae est.', 67, '1972-06-10', 85, 981, 5, 1, 'active', 'https://lorempixel.com/200/200/?45341'),
(542, 'Quod eum ducimus.', 27, '2003-08-15', 7, 213, 6, 5, 'active', 'https://lorempixel.com/200/200/?74033'),
(543, 'Iste natus rerum.', 1, '1993-11-03', 41, 654, 1, 4, 'active', 'https://lorempixel.com/200/200/?91594'),
(544, 'Dolorum facere.', 4, '1974-10-09', 4, 548, 1, 6, 'active', 'https://lorempixel.com/200/200/?66926'),
(545, 'Possimus numquam quibusdam vero.', 5, '1986-09-09', 73, 551, 2, 6, 'active', 'https://lorempixel.com/200/200/?36667'),
(546, 'Cupiditate dolorem qui velit velit.', 99, '2013-09-15', 59, 39, 2, 4, 'active', 'https://lorempixel.com/200/200/?95053'),
(547, 'Veniam vel rem impedit.', 56, '2009-09-18', 2, 410, 2, 2, 'active', 'https://lorempixel.com/200/200/?42875'),
(548, 'Ipsa tenetur voluptatem corrupti.', 62, '1999-08-19', 11, 724, 1, 1, 'active', 'https://lorempixel.com/200/200/?94532'),
(549, 'Est quo suscipit.', 29, '1996-04-12', 76, 500, 6, 6, 'active', 'https://lorempixel.com/200/200/?47963'),
(550, 'Autem velit ipsam explicabo.', 27, '2014-03-12', 15, 755, 2, 1, 'active', 'https://lorempixel.com/200/200/?45945'),
(551, 'Est quisquam saepe aliquam maxime.', 92, '2004-09-10', 8, 776, 5, 2, 'active', 'https://lorempixel.com/200/200/?13590'),
(552, 'Aspernatur non.', 49, '2004-12-12', 28, 818, 6, 5, 'active', 'https://lorempixel.com/200/200/?69055'),
(553, 'Neque sint quis deleniti.', 54, '2003-12-22', 88, 527, 2, 5, 'active', 'https://lorempixel.com/200/200/?85633'),
(554, 'Itaque perferendis cupiditate dolor.', 69, '2010-09-01', 94, 755, 4, 2, 'active', 'https://lorempixel.com/200/200/?34146'),
(555, 'Molestiae et dolor molestiae consequatur.', 78, '1989-02-21', 30, 721, 1, 2, 'active', 'https://lorempixel.com/200/200/?42280'),
(556, 'Tempora neque dolore fugit.', 17, '1992-11-19', 58, 101, 4, 1, 'active', 'https://lorempixel.com/200/200/?63415'),
(557, 'Error qui enim dolor.', 20, '2008-06-06', 21, 556, 2, 2, 'active', 'https://lorempixel.com/200/200/?22322'),
(558, 'Sunt incidunt ipsum.', 64, '2005-12-17', 16, 876, 2, 2, 'active', 'https://lorempixel.com/200/200/?93910'),
(559, 'Totam dolorem dignissimos.', 69, '1983-03-07', 87, 999, 6, 1, 'active', 'https://lorempixel.com/200/200/?39555'),
(560, 'Esse impedit ut commodi.', 37, '1989-11-09', 32, 129, 4, 6, 'active', 'https://lorempixel.com/200/200/?63306'),
(561, 'Cupiditate amet sit.', 6, '1986-11-10', 51, 343, 3, 4, 'active', 'https://lorempixel.com/200/200/?95974'),
(562, 'A praesentium iure.', 90, '2010-09-30', 38, 777, 3, 3, 'active', 'https://lorempixel.com/200/200/?78995'),
(563, 'Sit quo odit sint.', 58, '2016-01-16', 4, 700, 6, 4, 'active', 'https://lorempixel.com/200/200/?16837'),
(564, 'Dolores enim pariatur.', 83, '2003-01-19', 52, 936, 6, 2, 'active', 'https://lorempixel.com/200/200/?10247'),
(565, 'Voluptatem tempore ut.', 95, '1987-05-10', 52, 739, 6, 4, 'active', 'https://lorempixel.com/200/200/?78537'),
(566, 'Magni consectetur adipisci.', 30, '1983-04-16', 23, 956, 6, 5, 'active', 'https://lorempixel.com/200/200/?40800'),
(567, 'Omnis qui.', 21, '1995-10-29', 5, 286, 5, 6, 'active', 'https://lorempixel.com/200/200/?79710'),
(568, 'Aliquam et et illo.', 69, '2019-10-05', 29, 327, 3, 1, 'active', 'https://lorempixel.com/200/200/?71108'),
(569, 'At eaque rerum.', 81, '1997-09-26', 98, 674, 5, 6, 'active', 'https://lorempixel.com/200/200/?44677'),
(570, 'Aut expedita eum eaque.', 29, '1982-10-09', 66, 774, 5, 1, 'active', 'https://lorempixel.com/200/200/?23270'),
(571, 'Rerum quia culpa eius.', 34, '1986-08-20', 61, 243, 1, 6, 'active', 'https://lorempixel.com/200/200/?70946'),
(572, 'Iusto vitae vero non.', 18, '2000-07-26', 93, 881, 4, 5, 'active', 'https://lorempixel.com/200/200/?59596'),
(573, 'Provident est culpa.', 12, '1987-02-28', 17, 21, 5, 4, 'active', 'https://lorempixel.com/200/200/?71474'),
(574, 'Unde expedita totam.', 28, '2006-04-01', 43, 653, 1, 2, 'active', 'https://lorempixel.com/200/200/?93251'),
(575, 'Ratione et eos quae.', 90, '1983-04-02', 83, 34, 2, 2, 'active', 'https://lorempixel.com/200/200/?44636'),
(576, 'Nulla harum et.', 41, '1970-05-12', 85, 362, 3, 2, 'active', 'https://lorempixel.com/200/200/?46153'),
(577, 'Tempore dolore dicta.', 29, '1987-12-15', 81, 697, 5, 6, 'active', 'https://lorempixel.com/200/200/?44299'),
(578, 'Tenetur et perspiciatis nihil.', 70, '1977-12-23', 35, 856, 3, 1, 'active', 'https://lorempixel.com/200/200/?13546'),
(579, 'Esse et vero nemo.', 1, '2019-01-24', 88, 110, 3, 2, 'active', 'https://lorempixel.com/200/200/?75421'),
(580, 'Cumque dolore quia quam.', 29, '1993-05-23', 37, 53, 6, 1, 'active', 'https://lorempixel.com/200/200/?90918'),
(581, 'Et fuga cum quam.', 90, '1989-11-10', 94, 890, 5, 1, 'active', 'https://lorempixel.com/200/200/?27215'),
(582, 'Porro culpa ea totam rem.', 61, '2002-01-22', 4, 772, 2, 1, 'active', 'https://lorempixel.com/200/200/?21548'),
(583, 'Est ullam ut.', 20, '2007-07-21', 43, 741, 6, 1, 'active', 'https://lorempixel.com/200/200/?90481'),
(584, 'Iure magni eaque temporibus.', 13, '2005-01-19', 22, 41, 5, 2, 'active', 'https://lorempixel.com/200/200/?15964'),
(585, 'Suscipit deserunt dicta.', 22, '1972-03-21', 83, 653, 3, 2, 'active', 'https://lorempixel.com/200/200/?45799'),
(586, 'Voluptate laborum.', 64, '2010-09-28', 49, 647, 4, 6, 'active', 'https://lorempixel.com/200/200/?50695'),
(587, 'Soluta blanditiis nihil perspiciatis totam.', 87, '1977-09-10', 48, 184, 3, 2, 'active', 'https://lorempixel.com/200/200/?27960'),
(588, 'Harum qui recusandae non.', 97, '1977-08-19', 72, 308, 3, 1, 'active', 'https://lorempixel.com/200/200/?12604'),
(589, 'Optio et omnis quisquam in.', 18, '1994-11-19', 60, 917, 4, 4, 'active', 'https://lorempixel.com/200/200/?77681'),
(590, 'Quo adipisci tenetur.', 36, '1981-01-16', 42, 264, 5, 6, 'active', 'https://lorempixel.com/200/200/?58861'),
(591, 'Veritatis autem aliquid.', 59, '2024-04-03', 95, 306, 5, 2, 'active', 'https://lorempixel.com/200/200/?29503'),
(592, 'Asperiores quidem quam commodi.', 19, '2018-09-18', 59, 29, 5, 1, 'active', 'https://lorempixel.com/200/200/?85460'),
(593, 'Illo recusandae.', 19, '2003-03-29', 70, 116, 3, 2, 'active', 'https://lorempixel.com/200/200/?28968'),
(594, 'Reiciendis qui accusantium quasi.', 66, '1998-03-13', 38, 338, 1, 3, 'active', 'https://lorempixel.com/200/200/?68321'),
(595, 'Aut in itaque.', 80, '2022-11-10', 70, 708, 6, 5, 'active', 'https://lorempixel.com/200/200/?42299'),
(596, 'Sit labore saepe.', 95, '1986-01-29', 13, 426, 3, 6, 'active', 'https://lorempixel.com/200/200/?69754'),
(597, 'Aliquid vero nesciunt nostrum eligendi.', 25, '1988-07-19', 95, 479, 1, 1, 'active', 'https://lorempixel.com/200/200/?22791'),
(598, 'Deserunt molestiae excepturi.', 83, '1992-10-02', 36, 420, 6, 4, 'active', 'https://lorempixel.com/200/200/?63215'),
(599, 'Quisquam voluptas quia.', 72, '1992-11-30', 61, 428, 5, 2, 'active', 'https://lorempixel.com/200/200/?34510'),
(600, 'Facilis consequatur magnam sit quos.', 52, '2006-04-13', 4, 322, 2, 4, 'active', 'https://lorempixel.com/200/200/?62615'),
(601, 'Sed esse aut labore aut.', 35, '1996-03-17', 37, 408, 6, 6, 'active', 'https://lorempixel.com/200/200/?87178'),
(602, 'Ratione corporis suscipit.', 8, '1988-11-29', 40, 917, 2, 4, 'active', 'https://lorempixel.com/200/200/?51068'),
(603, 'Labore dolor enim cupiditate.', 45, '1995-12-16', 58, 502, 4, 3, 'active', 'https://lorempixel.com/200/200/?26889'),
(604, 'Molestiae ea eaque.', 28, '1999-01-19', 95, 586, 5, 1, 'active', 'https://lorempixel.com/200/200/?49846'),
(605, 'Consequatur est consequatur non.', 16, '1980-06-19', 57, 646, 6, 1, 'active', 'https://lorempixel.com/200/200/?50984'),
(606, 'Ut et praesentium odio qui.', 54, '1971-05-25', 61, 338, 3, 3, 'active', 'https://lorempixel.com/200/200/?41612'),
(607, 'Sit corporis aut temporibus.', 99, '1989-12-29', 4, 905, 6, 1, 'active', 'https://lorempixel.com/200/200/?33956'),
(608, 'Qui in libero atque aperiam.', 10, '1995-04-11', 26, 476, 2, 4, 'active', 'https://lorempixel.com/200/200/?98291'),
(609, 'Officia facilis est.', 97, '2004-06-28', 86, 866, 2, 1, 'active', 'https://lorempixel.com/200/200/?42899'),
(610, 'Consectetur ratione aut.', 88, '1993-10-03', 18, 246, 4, 6, 'active', 'https://lorempixel.com/200/200/?90067'),
(611, 'Eos veritatis autem voluptatem.', 3, '2003-07-24', 50, 891, 1, 2, 'active', 'https://lorempixel.com/200/200/?40251'),
(612, 'Quis quo aut qui.', 31, '1975-09-10', 56, 616, 1, 5, 'active', 'https://lorempixel.com/200/200/?80552'),
(613, 'Ab quibusdam voluptatem repudiandae.', 46, '2008-09-01', 90, 10, 5, 6, 'active', 'https://lorempixel.com/200/200/?73836'),
(614, 'Est aspernatur assumenda alias.', 30, '2005-01-24', 17, 220, 6, 1, 'active', 'https://lorempixel.com/200/200/?11507'),
(615, 'Ad veritatis fugiat non.', 24, '2008-04-14', 16, 412, 1, 4, 'active', 'https://lorempixel.com/200/200/?89285'),
(616, 'In et aut repellat.', 13, '2011-05-29', 31, 596, 5, 5, 'active', 'https://lorempixel.com/200/200/?27675'),
(617, 'Excepturi quae soluta.', 71, '1981-10-26', 3, 926, 3, 3, 'active', 'https://lorempixel.com/200/200/?74411'),
(618, 'Quisquam alias eum.', 35, '1996-02-01', 48, 299, 3, 5, 'active', 'https://lorempixel.com/200/200/?68886'),
(619, 'Deserunt modi blanditiis.', 96, '1977-06-29', 40, 527, 1, 2, 'active', 'https://lorempixel.com/200/200/?34664'),
(620, 'A perferendis possimus aut.', 10, '2002-10-08', 19, 403, 2, 6, 'active', 'https://lorempixel.com/200/200/?80828'),
(621, 'Id et consequuntur accusantium.', 53, '1976-01-22', 18, 459, 5, 6, 'active', 'https://lorempixel.com/200/200/?21197'),
(622, 'Culpa expedita minima doloribus quo.', 8, '1986-01-05', 63, 675, 1, 4, 'active', 'https://lorempixel.com/200/200/?48005'),
(623, 'Animi sunt atque reiciendis et.', 30, '2005-01-19', 51, 463, 6, 1, 'active', 'https://lorempixel.com/200/200/?94947'),
(624, 'Quibusdam architecto est sapiente.', 51, '2013-08-01', 9, 703, 5, 1, 'active', 'https://lorempixel.com/200/200/?51722'),
(625, 'Asperiores commodi molestias.', 24, '1997-01-11', 31, 269, 1, 3, 'active', 'https://lorempixel.com/200/200/?62959'),
(626, 'Perspiciatis dolores esse.', 55, '1982-10-03', 88, 265, 1, 3, 'active', 'https://lorempixel.com/200/200/?50727'),
(627, 'Corrupti sed ipsum.', 4, '1993-01-17', 62, 603, 5, 3, 'active', 'https://lorempixel.com/200/200/?85518'),
(628, 'Repellendus minima et.', 19, '2009-09-04', 69, 79, 3, 5, 'active', 'https://lorempixel.com/200/200/?44256'),
(629, 'Est hic expedita odit.', 84, '2002-05-11', 87, 996, 3, 3, 'active', 'https://lorempixel.com/200/200/?50817'),
(630, 'Ratione sint nihil.', 15, '2000-12-28', 42, 254, 1, 4, 'active', 'https://lorempixel.com/200/200/?28460'),
(631, 'Cumque eos fugiat.', 84, '1976-07-10', 21, 164, 5, 1, 'active', 'https://lorempixel.com/200/200/?66215'),
(632, 'Deserunt velit.', 8, '2001-05-02', 84, 777, 4, 6, 'active', 'https://lorempixel.com/200/200/?79181'),
(633, 'Ipsum ut sequi.', 57, '1976-02-17', 57, 823, 3, 1, 'active', 'https://lorempixel.com/200/200/?60802'),
(634, 'Voluptatibus exercitationem dicta ut quia.', 49, '2013-06-21', 59, 406, 3, 5, 'active', 'https://lorempixel.com/200/200/?79872'),
(635, 'Et nesciunt sit porro.', 54, '1995-05-14', 96, 24, 2, 3, 'active', 'https://lorempixel.com/200/200/?13053'),
(636, 'Aut est repellendus quia.', 92, '2004-10-09', 7, 561, 4, 6, 'active', 'https://lorempixel.com/200/200/?97358'),
(637, 'Et qui ratione.', 2, '2017-08-06', 74, 685, 4, 1, 'active', 'https://lorempixel.com/200/200/?13133'),
(638, 'Consectetur perferendis tempore.', 2, '1970-01-01', 63, 727, 6, 1, 'active', 'https://lorempixel.com/200/200/?43160'),
(639, 'Perspiciatis incidunt minima.', 92, '1994-04-30', 82, 522, 2, 3, 'active', 'https://lorempixel.com/200/200/?69247'),
(640, 'Ullam quis voluptas.', 67, '1998-04-20', 96, 169, 1, 3, 'active', 'https://lorempixel.com/200/200/?43191'),
(641, 'Error qui veniam consectetur et.', 44, '1987-01-21', 26, 851, 2, 2, 'active', 'https://lorempixel.com/200/200/?70393'),
(642, 'Ut ut et.', 3, '2010-12-31', 43, 963, 4, 3, 'active', 'https://lorempixel.com/200/200/?36915'),
(643, 'Ratione necessitatibus accusamus.', 99, '2000-09-23', 37, 24, 2, 2, 'active', 'https://lorempixel.com/200/200/?27641'),
(644, 'Dolorem non omnis porro.', 13, '1978-08-19', 63, 677, 3, 1, 'active', 'https://lorempixel.com/200/200/?21590'),
(645, 'Et quas maiores unde.', 44, '1998-03-01', 49, 210, 5, 2, 'active', 'https://lorempixel.com/200/200/?89388'),
(646, 'Est ad molestiae autem.', 96, '2011-04-25', 24, 262, 6, 4, 'active', 'https://lorempixel.com/200/200/?32058'),
(647, 'Eum ut a impedit.', 9, '1981-09-26', 64, 668, 4, 6, 'active', 'https://lorempixel.com/200/200/?83573'),
(648, 'Dicta quia architecto sint.', 4, '1990-12-25', 45, 418, 1, 6, 'active', 'https://lorempixel.com/200/200/?45442'),
(649, 'Error tempora velit.', 12, '1975-04-02', 68, 697, 3, 5, 'active', 'https://lorempixel.com/200/200/?20426'),
(650, 'Similique dignissimos et qui voluptatem.', 5, '2015-01-01', 69, 227, 5, 2, 'active', 'https://lorempixel.com/200/200/?17135'),
(651, 'Aspernatur quibusdam quisquam.', 49, '1972-07-11', 64, 542, 5, 2, 'active', 'https://lorempixel.com/200/200/?65993'),
(652, 'Ea aspernatur aliquam.', 84, '1986-05-10', 58, 547, 4, 2, 'active', 'https://lorempixel.com/200/200/?41170'),
(653, 'Amet id.', 64, '1984-02-01', 12, 615, 1, 2, 'active', 'https://lorempixel.com/200/200/?58165'),
(654, 'Dolores suscipit neque.', 55, '1987-09-25', 47, 466, 2, 1, 'active', 'https://lorempixel.com/200/200/?40152'),
(655, 'Velit ea atque.', 86, '2008-04-20', 67, 822, 1, 4, 'active', 'https://lorempixel.com/200/200/?25148'),
(656, 'Quas at omnis qui.', 100, '1990-07-12', 74, 260, 3, 4, 'active', 'https://lorempixel.com/200/200/?69561'),
(657, 'Reprehenderit saepe aspernatur ullam.', 17, '1974-06-20', 43, 766, 1, 6, 'active', 'https://lorempixel.com/200/200/?29838'),
(658, 'Culpa enim nostrum sequi voluptatem.', 85, '1986-09-28', 48, 112, 3, 5, 'active', 'https://lorempixel.com/200/200/?34335'),
(659, 'Ut aut totam.', 11, '1987-07-22', 70, 496, 5, 4, 'active', 'https://lorempixel.com/200/200/?48025'),
(660, 'Iusto et.', 87, '1991-02-13', 3, 171, 5, 3, 'active', 'https://lorempixel.com/200/200/?51213'),
(661, 'Ad laboriosam illum quia.', 13, '2017-06-05', 54, 485, 3, 3, 'active', 'https://lorempixel.com/200/200/?85484'),
(662, 'Numquam voluptas tenetur vero quia.', 29, '1998-06-09', 54, 983, 6, 4, 'active', 'https://lorempixel.com/200/200/?79979'),
(663, 'Sed sint ipsam dolores.', 24, '1972-08-16', 65, 781, 4, 3, 'active', 'https://lorempixel.com/200/200/?55103'),
(664, 'Omnis sit neque.', 77, '2022-02-19', 17, 693, 6, 1, 'active', 'https://lorempixel.com/200/200/?95328'),
(665, 'Fuga eveniet eveniet maiores.', 55, '2010-09-08', 86, 514, 2, 3, 'active', 'https://lorempixel.com/200/200/?68805'),
(666, 'Sed voluptatibus temporibus.', 20, '1999-08-25', 63, 11, 2, 3, 'active', 'https://lorempixel.com/200/200/?15619'),
(667, 'Vero earum quae.', 81, '1983-04-18', 4, 253, 6, 2, 'active', 'https://lorempixel.com/200/200/?64032'),
(668, 'Vero dolor sunt.', 32, '1972-06-23', 18, 648, 5, 1, 'active', 'https://lorempixel.com/200/200/?42253'),
(669, 'Rerum iste beatae quis.', 80, '2023-10-01', 16, 557, 5, 4, 'active', 'https://lorempixel.com/200/200/?61557'),
(670, 'Quos est dolor cum.', 58, '1975-04-07', 60, 852, 5, 6, 'active', 'https://lorempixel.com/200/200/?88754'),
(671, 'Mollitia culpa.', 40, '2006-03-14', 5, 431, 1, 3, 'active', 'https://lorempixel.com/200/200/?87009'),
(672, 'Nemo magni neque fugiat.', 97, '2022-10-09', 36, 758, 3, 2, 'active', 'https://lorempixel.com/200/200/?36624'),
(673, 'Et ut quam.', 35, '1999-09-20', 77, 711, 3, 2, 'active', 'https://lorempixel.com/200/200/?60159'),
(674, 'Voluptatum mollitia aut.', 6, '2020-03-26', 68, 637, 2, 1, 'active', 'https://lorempixel.com/200/200/?46492'),
(675, 'Et repellat.', 46, '2017-10-30', 84, 502, 4, 6, 'active', 'https://lorempixel.com/200/200/?81978'),
(676, 'Dolores aut nesciunt et.', 85, '1975-12-10', 38, 562, 5, 1, 'active', 'https://lorempixel.com/200/200/?71818'),
(677, 'Et tempore.', 37, '2012-03-25', 13, 915, 4, 3, 'active', 'https://lorempixel.com/200/200/?54658'),
(678, 'Accusamus ipsum qui.', 39, '2022-12-22', 83, 57, 5, 4, 'active', 'https://lorempixel.com/200/200/?31702'),
(679, 'Esse et aut.', 100, '1988-02-05', 3, 557, 2, 3, 'active', 'https://lorempixel.com/200/200/?69918'),
(680, 'Illo architecto et.', 31, '2016-10-03', 89, 762, 3, 3, 'active', 'https://lorempixel.com/200/200/?44371'),
(681, 'Cupiditate architecto voluptas est.', 4, '1978-05-23', 61, 470, 3, 5, 'active', 'https://lorempixel.com/200/200/?90250'),
(682, 'Tempora voluptatibus magni.', 19, '2003-03-14', 42, 635, 3, 6, 'active', 'https://lorempixel.com/200/200/?96180'),
(683, 'Aut fuga qui sed.', 88, '1977-08-06', 8, 316, 2, 1, 'active', 'https://lorempixel.com/200/200/?81410'),
(684, 'Dignissimos saepe doloribus magni.', 19, '1981-05-09', 7, 174, 2, 6, 'active', 'https://lorempixel.com/200/200/?51655'),
(685, 'Sequi beatae ducimus quis unde.', 27, '1978-09-14', 36, 956, 3, 2, 'active', 'https://lorempixel.com/200/200/?44249'),
(686, 'Vitae est voluptatem porro.', 78, '1988-12-26', 57, 448, 1, 3, 'active', 'https://lorempixel.com/200/200/?60032'),
(687, 'Sed at dolor facilis.', 80, '1979-01-24', 56, 973, 1, 3, 'active', 'https://lorempixel.com/200/200/?27284'),
(688, 'Quasi sunt sit aut.', 84, '1992-12-02', 62, 120, 1, 3, 'active', 'https://lorempixel.com/200/200/?88570'),
(689, 'Et id necessitatibus maiores.', 70, '1970-07-28', 29, 911, 5, 1, 'active', 'https://lorempixel.com/200/200/?34646'),
(690, 'Ex aut ea hic.', 92, '1975-05-10', 1, 834, 6, 6, 'active', 'https://lorempixel.com/200/200/?51354'),
(691, 'Voluptas eos sit.', 47, '1996-11-15', 24, 855, 4, 4, 'active', 'https://lorempixel.com/200/200/?80618'),
(692, 'Autem amet doloribus veritatis voluptatem.', 99, '1989-04-01', 70, 763, 6, 2, 'active', 'https://lorempixel.com/200/200/?80291'),
(693, 'Aut id sed iusto.', 80, '1975-04-20', 84, 472, 3, 4, 'active', 'https://lorempixel.com/200/200/?38938'),
(694, 'Ipsam ipsum eveniet.', 8, '2012-09-18', 3, 236, 2, 3, 'active', 'https://lorempixel.com/200/200/?55299'),
(695, 'Repellat officia dolorem.', 73, '1986-02-11', 46, 737, 6, 2, 'active', 'https://lorempixel.com/200/200/?35949'),
(696, 'Mollitia ullam ipsa.', 44, '2016-01-22', 4, 812, 5, 4, 'active', 'https://lorempixel.com/200/200/?88136'),
(697, 'Minima in recusandae nobis.', 97, '1975-06-15', 18, 243, 5, 2, 'active', 'https://lorempixel.com/200/200/?54721'),
(698, 'Tempora vero ut.', 75, '2022-04-12', 76, 927, 3, 5, 'active', 'https://lorempixel.com/200/200/?63792'),
(699, 'Labore et eum.', 6, '1992-10-06', 7, 33, 4, 6, 'active', 'https://lorempixel.com/200/200/?83155'),
(700, 'Et et in nobis.', 34, '1978-03-10', 51, 424, 4, 6, 'active', 'https://lorempixel.com/200/200/?54247'),
(701, 'Non ea illum.', 77, '2007-07-16', 100, 527, 3, 2, 'active', 'https://lorempixel.com/200/200/?84591'),
(702, 'Voluptatem quia adipisci illo qui.', 48, '1972-01-05', 6, 388, 6, 2, 'active', 'https://lorempixel.com/200/200/?96650'),
(703, 'Tempora quam ab asperiores.', 4, '1986-05-26', 33, 207, 1, 5, 'active', 'https://lorempixel.com/200/200/?93285'),
(704, 'At odio et.', 59, '1989-10-25', 61, 15, 4, 2, 'active', 'https://lorempixel.com/200/200/?24638'),
(705, 'Possimus non.', 75, '1995-06-13', 41, 330, 1, 3, 'active', 'https://lorempixel.com/200/200/?88424'),
(706, 'Ullam quas impedit.', 17, '1974-10-21', 71, 285, 5, 4, 'active', 'https://lorempixel.com/200/200/?40525'),
(707, 'Sapiente qui autem.', 92, '2012-08-22', 32, 815, 5, 5, 'active', 'https://lorempixel.com/200/200/?14502'),
(708, 'Quo voluptatum mollitia.', 24, '1981-01-24', 84, 268, 2, 5, 'active', 'https://lorempixel.com/200/200/?54802'),
(709, 'Sapiente voluptatibus ea.', 30, '1998-02-09', 5, 361, 5, 6, 'active', 'https://lorempixel.com/200/200/?12733'),
(710, 'Itaque corporis ipsum.', 79, '1997-10-30', 70, 744, 5, 6, 'active', 'https://lorempixel.com/200/200/?75868'),
(711, 'Quis suscipit sunt aliquid.', 14, '2019-10-02', 80, 956, 4, 3, 'active', 'https://lorempixel.com/200/200/?95501'),
(712, 'Quasi doloribus sit ad ex.', 28, '1985-04-20', 68, 427, 4, 5, 'active', 'https://lorempixel.com/200/200/?45152'),
(713, 'Repellat blanditiis et.', 37, '1981-06-14', 93, 341, 3, 5, 'active', 'https://lorempixel.com/200/200/?82772'),
(714, 'Inventore veniam.', 8, '2020-08-09', 94, 329, 2, 3, 'active', 'https://lorempixel.com/200/200/?97335'),
(715, 'Animi neque fugiat.', 24, '1972-01-16', 56, 68, 2, 4, 'active', 'https://lorempixel.com/200/200/?97615'),
(716, 'Neque accusantium minima debitis.', 71, '2016-01-04', 52, 825, 5, 6, 'active', 'https://lorempixel.com/200/200/?74683'),
(717, 'Vel nulla consectetur.', 81, '1986-02-01', 78, 362, 4, 2, 'active', 'https://lorempixel.com/200/200/?89996'),
(718, 'Modi animi eum.', 13, '1980-01-23', 80, 146, 4, 2, 'active', 'https://lorempixel.com/200/200/?84613'),
(719, 'Reiciendis cumque voluptatem.', 96, '1998-09-29', 42, 185, 1, 4, 'active', 'https://lorempixel.com/200/200/?37723'),
(720, 'Laborum qui.', 6, '1972-04-21', 12, 825, 4, 5, 'active', 'https://lorempixel.com/200/200/?44209'),
(721, 'Maxime distinctio aspernatur.', 49, '2012-08-15', 35, 713, 1, 1, 'active', 'https://lorempixel.com/200/200/?94741'),
(722, 'Eius rerum culpa.', 75, '2008-11-18', 30, 271, 4, 2, 'active', 'https://lorempixel.com/200/200/?53828'),
(723, 'Beatae qui neque nulla.', 100, '2000-11-23', 65, 250, 3, 5, 'active', 'https://lorempixel.com/200/200/?47733'),
(724, 'Sit voluptas occaecati modi et.', 55, '1980-01-09', 61, 760, 6, 5, 'active', 'https://lorempixel.com/200/200/?12636'),
(725, 'Aut quia molestiae.', 27, '1977-03-12', 64, 348, 6, 1, 'active', 'https://lorempixel.com/200/200/?47605'),
(726, 'Molestias omnis voluptatem.', 83, '2020-02-10', 20, 329, 4, 1, 'active', 'https://lorempixel.com/200/200/?41636'),
(727, 'Et at eos.', 58, '1976-09-23', 34, 534, 4, 1, 'active', 'https://lorempixel.com/200/200/?97686'),
(728, 'Dolor magni ea.', 91, '2021-08-05', 35, 853, 1, 6, 'active', 'https://lorempixel.com/200/200/?82459'),
(729, 'Sit fugiat aut.', 30, '1983-12-19', 27, 116, 2, 2, 'active', 'https://lorempixel.com/200/200/?26777'),
(730, 'Aliquam fugiat corrupti quia.', 67, '2004-08-06', 40, 215, 1, 4, 'active', 'https://lorempixel.com/200/200/?68422'),
(731, 'Suscipit voluptatem ut pariatur.', 40, '1973-10-12', 87, 840, 2, 3, 'active', 'https://lorempixel.com/200/200/?57560'),
(732, 'Cupiditate tempore autem.', 67, '1971-05-29', 24, 159, 2, 4, 'active', 'https://lorempixel.com/200/200/?91917'),
(733, 'Placeat ut est.', 79, '1972-08-27', 25, 182, 1, 3, 'active', 'https://lorempixel.com/200/200/?23558'),
(734, 'Fuga ipsa voluptas.', 46, '1992-12-21', 49, 283, 1, 1, 'active', 'https://lorempixel.com/200/200/?20788'),
(735, 'Et ex saepe aut.', 44, '1979-01-05', 16, 441, 6, 6, 'active', 'https://lorempixel.com/200/200/?50104'),
(736, 'Fugiat magni dolorem atque.', 29, '2004-04-28', 4, 940, 3, 2, 'active', 'https://lorempixel.com/200/200/?28684'),
(737, 'Eum et sint.', 11, '1986-12-22', 2, 828, 3, 6, 'active', 'https://lorempixel.com/200/200/?73417'),
(738, 'Veniam doloribus eum eum.', 65, '1988-04-26', 54, 465, 4, 3, 'active', 'https://lorempixel.com/200/200/?72955'),
(739, 'Quia tenetur quasi natus natus.', 16, '2009-10-06', 5, 241, 5, 6, 'active', 'https://lorempixel.com/200/200/?77897'),
(740, 'Et mollitia magni.', 38, '1984-07-24', 38, 362, 4, 3, 'active', 'https://lorempixel.com/200/200/?73438'),
(741, 'Fugit quia ratione.', 45, '1984-04-23', 63, 534, 1, 4, 'active', 'https://lorempixel.com/200/200/?95503'),
(742, 'Molestiae magnam autem.', 25, '1990-11-15', 70, 803, 4, 2, 'active', 'https://lorempixel.com/200/200/?20186'),
(743, 'Eveniet quos qui.', 35, '2002-12-18', 40, 87, 4, 6, 'active', 'https://lorempixel.com/200/200/?29024'),
(744, 'Veniam architecto nihil.', 20, '1984-06-11', 93, 64, 2, 5, 'active', 'https://lorempixel.com/200/200/?50201'),
(745, 'Praesentium saepe quos.', 9, '1981-07-23', 15, 642, 2, 2, 'active', 'https://lorempixel.com/200/200/?78442'),
(746, 'Ea consequatur omnis sit.', 13, '1975-07-20', 18, 895, 2, 5, 'active', 'https://lorempixel.com/200/200/?34082'),
(747, 'Commodi ut et dolorem.', 55, '1986-01-31', 29, 232, 3, 6, 'active', 'https://lorempixel.com/200/200/?94738'),
(748, 'Mollitia quis sint facere.', 49, '1971-10-15', 64, 222, 2, 2, 'active', 'https://lorempixel.com/200/200/?80422'),
(749, 'Enim commodi reiciendis nobis doloribus.', 39, '1972-07-12', 23, 921, 2, 4, 'active', 'https://lorempixel.com/200/200/?79777'),
(750, 'Sint velit facilis pariatur.', 80, '2020-12-31', 17, 770, 6, 1, 'active', 'https://lorempixel.com/200/200/?86772'),
(751, 'Recusandae tempora molestiae.', 15, '2016-01-01', 87, 318, 5, 6, 'active', 'https://lorempixel.com/200/200/?30045'),
(752, 'Qui unde quod sed.', 41, '1988-03-13', 42, 892, 2, 2, 'active', 'https://lorempixel.com/200/200/?88626'),
(753, 'Odit atque eum ut.', 25, '2008-05-11', 38, 20, 6, 5, 'active', 'https://lorempixel.com/200/200/?15921'),
(754, 'Enim repellendus eligendi nulla quia.', 58, '1985-01-16', 55, 158, 5, 6, 'active', 'https://lorempixel.com/200/200/?77072'),
(755, 'Itaque esse voluptas.', 46, '1989-04-14', 7, 17, 2, 4, 'active', 'https://lorempixel.com/200/200/?39602'),
(756, 'Saepe perspiciatis corporis mollitia.', 93, '1997-10-23', 89, 877, 4, 5, 'active', 'https://lorempixel.com/200/200/?59257'),
(757, 'Consequuntur autem rem quas.', 8, '2009-12-05', 8, 730, 1, 3, 'active', 'https://lorempixel.com/200/200/?69574'),
(758, 'Id est ipsa quas.', 6, '2014-08-26', 50, 829, 1, 5, 'active', 'https://lorempixel.com/200/200/?15036'),
(759, 'Dignissimos dolorem dicta aliquam aut.', 43, '1970-10-24', 23, 969, 3, 6, 'active', 'https://lorempixel.com/200/200/?42715'),
(760, 'Provident vero voluptatem.', 67, '2012-05-31', 44, 350, 5, 3, 'active', 'https://lorempixel.com/200/200/?99352'),
(761, 'Totam est non.', 28, '1971-11-20', 99, 804, 5, 3, 'active', 'https://lorempixel.com/200/200/?70869'),
(762, 'Possimus omnis sit.', 8, '2003-11-02', 6, 710, 3, 2, 'active', 'https://lorempixel.com/200/200/?94140'),
(763, 'Vel illum consectetur quae.', 45, '1972-06-11', 48, 709, 5, 6, 'active', 'https://lorempixel.com/200/200/?57891'),
(764, 'Voluptatem ut esse minima.', 99, '2016-07-28', 51, 572, 1, 5, 'active', 'https://lorempixel.com/200/200/?29375'),
(765, 'Ut cum sit quo voluptas.', 51, '1992-05-31', 60, 372, 5, 6, 'active', 'https://lorempixel.com/200/200/?72420'),
(766, 'Aut sit voluptas omnis.', 98, '1999-11-22', 49, 918, 4, 5, 'active', 'https://lorempixel.com/200/200/?64274'),
(767, 'Et nostrum tempore.', 33, '2006-02-13', 81, 331, 4, 5, 'active', 'https://lorempixel.com/200/200/?88183'),
(768, 'Sit et assumenda est.', 52, '1989-08-26', 23, 713, 5, 5, 'active', 'https://lorempixel.com/200/200/?76163'),
(769, 'In ex rerum.', 78, '2000-06-03', 64, 166, 5, 5, 'active', 'https://lorempixel.com/200/200/?47011'),
(770, 'Velit at amet quam.', 76, '2010-06-14', 83, 992, 4, 2, 'active', 'https://lorempixel.com/200/200/?85667'),
(771, 'Cupiditate ratione sed inventore.', 98, '1989-03-13', 10, 359, 6, 5, 'active', 'https://lorempixel.com/200/200/?92773'),
(772, 'Nulla non fuga.', 65, '1986-03-17', 75, 562, 1, 5, 'active', 'https://lorempixel.com/200/200/?45275'),
(773, 'Sapiente id et ea.', 55, '2011-09-23', 62, 628, 3, 1, 'active', 'https://lorempixel.com/200/200/?21375'),
(774, 'Asperiores voluptatem autem et.', 38, '1990-04-24', 11, 912, 4, 2, 'active', 'https://lorempixel.com/200/200/?29109'),
(775, 'Natus enim exercitationem ut.', 86, '1998-08-08', 16, 379, 4, 5, 'active', 'https://lorempixel.com/200/200/?62539'),
(776, 'Odit non reiciendis nam.', 77, '2015-11-06', 92, 692, 5, 4, 'active', 'https://lorempixel.com/200/200/?45176'),
(777, 'Rerum ut tempora reiciendis.', 96, '1986-11-17', 42, 771, 3, 3, 'active', 'https://lorempixel.com/200/200/?20887'),
(778, 'Recusandae et aut animi.', 67, '2000-07-26', 49, 974, 4, 5, 'active', 'https://lorempixel.com/200/200/?99676'),
(779, 'Sint est et beatae.', 42, '1972-05-10', 96, 822, 5, 4, 'active', 'https://lorempixel.com/200/200/?12133'),
(780, 'Rem esse quidem fugiat sapiente.', 17, '1991-08-14', 23, 643, 5, 2, 'active', 'https://lorempixel.com/200/200/?27129'),
(781, 'Quaerat esse error quos.', 50, '1983-01-15', 59, 529, 2, 6, 'active', 'https://lorempixel.com/200/200/?34798'),
(782, 'Id molestiae dolore.', 78, '1990-05-06', 95, 543, 2, 2, 'active', 'https://lorempixel.com/200/200/?46192'),
(783, 'Necessitatibus enim dolores.', 1, '1992-03-30', 68, 913, 2, 5, 'active', 'https://lorempixel.com/200/200/?64699'),
(784, 'Provident quia accusamus.', 34, '1993-08-22', 72, 110, 4, 3, 'active', 'https://lorempixel.com/200/200/?70133'),
(785, 'At voluptatem quibusdam nesciunt quas.', 78, '1982-04-12', 61, 512, 6, 4, 'active', 'https://lorempixel.com/200/200/?31074'),
(786, 'Aut iste corporis magnam ipsum.', 15, '1978-03-12', 85, 789, 5, 3, 'active', 'https://lorempixel.com/200/200/?33175'),
(787, 'Voluptas eum sint maiores.', 60, '1970-05-14', 75, 829, 5, 5, 'active', 'https://lorempixel.com/200/200/?68567'),
(788, 'Laborum officiis tenetur eum.', 30, '2015-12-02', 17, 383, 3, 4, 'active', 'https://lorempixel.com/200/200/?26632'),
(789, 'Aut itaque nihil.', 72, '1978-07-16', 19, 935, 6, 2, 'active', 'https://lorempixel.com/200/200/?11105'),
(790, 'Voluptatem officia.', 51, '1979-10-26', 48, 959, 1, 4, 'active', 'https://lorempixel.com/200/200/?25580'),
(791, 'Dolor quo quaerat.', 87, '1992-10-18', 47, 336, 3, 3, 'active', 'https://lorempixel.com/200/200/?40981'),
(792, 'Fugiat et quis impedit.', 44, '2019-11-23', 52, 184, 1, 3, 'active', 'https://lorempixel.com/200/200/?50364'),
(793, 'Et ducimus recusandae.', 65, '2009-06-05', 52, 18, 2, 4, 'active', 'https://lorempixel.com/200/200/?48603'),
(794, 'Magni molestiae quia.', 5, '1983-06-06', 69, 961, 1, 1, 'active', 'https://lorempixel.com/200/200/?44968'),
(795, 'Est cupiditate quae.', 93, '2023-06-14', 10, 481, 2, 5, 'active', 'https://lorempixel.com/200/200/?53003'),
(796, 'Voluptates modi mollitia suscipit.', 19, '2009-01-13', 17, 91, 4, 3, 'active', 'https://lorempixel.com/200/200/?78287'),
(797, 'Vel sed aut earum.', 98, '2009-08-31', 20, 765, 3, 4, 'active', 'https://lorempixel.com/200/200/?26453'),
(798, 'Corrupti aliquid omnis.', 58, '1989-01-01', 85, 485, 1, 4, 'active', 'https://lorempixel.com/200/200/?17238'),
(799, 'Nobis vel et quo.', 10, '1998-02-15', 79, 121, 6, 3, 'active', 'https://lorempixel.com/200/200/?66989'),
(800, 'Qui dolorem enim iusto nobis.', 23, '2019-02-07', 8, 891, 6, 6, 'active', 'https://lorempixel.com/200/200/?82656'),
(801, 'Similique vel vitae commodi.', 36, '2008-04-01', 24, 278, 2, 5, 'active', 'https://lorempixel.com/200/200/?42682'),
(802, 'Doloribus enim.', 47, '2005-09-03', 71, 742, 4, 1, 'active', 'https://lorempixel.com/200/200/?17101'),
(803, 'Voluptatem omnis ab et odit.', 74, '2005-12-28', 23, 878, 3, 6, 'active', 'https://lorempixel.com/200/200/?63158'),
(804, 'Ut distinctio est doloribus possimus.', 82, '1986-12-28', 49, 312, 3, 4, 'active', 'https://lorempixel.com/200/200/?78943'),
(805, 'Quis laboriosam quia autem.', 17, '1994-02-01', 60, 580, 5, 4, 'active', 'https://lorempixel.com/200/200/?40598'),
(806, 'Optio et adipisci.', 6, '2005-03-21', 88, 965, 6, 4, 'active', 'https://lorempixel.com/200/200/?35650'),
(807, 'Voluptas voluptatum id rerum.', 51, '2013-02-22', 48, 963, 4, 1, 'active', 'https://lorempixel.com/200/200/?42401'),
(808, 'Qui quis aliquid ad.', 98, '2017-07-03', 43, 541, 1, 6, 'active', 'https://lorempixel.com/200/200/?96890'),
(809, 'Sunt et aut.', 59, '1994-12-09', 10, 14, 6, 5, 'active', 'https://lorempixel.com/200/200/?34462'),
(810, 'Et dicta repellat.', 25, '1996-03-01', 92, 374, 5, 1, 'active', 'https://lorempixel.com/200/200/?74700'),
(811, 'Voluptatem aut non.', 48, '1993-04-01', 48, 689, 5, 6, 'active', 'https://lorempixel.com/200/200/?27481'),
(812, 'Dolorum molestiae voluptatem sequi.', 80, '2001-06-26', 79, 908, 6, 4, 'active', 'https://lorempixel.com/200/200/?59990'),
(813, 'Voluptatum qui nihil.', 50, '2008-11-16', 66, 889, 6, 2, 'active', 'https://lorempixel.com/200/200/?85307'),
(814, 'Non et ea repellendus.', 71, '1970-12-11', 15, 629, 2, 3, 'active', 'https://lorempixel.com/200/200/?54723'),
(815, 'Excepturi qui enim.', 40, '1974-06-14', 27, 502, 6, 1, 'active', 'https://lorempixel.com/200/200/?78037'),
(816, 'Tempore aliquam totam enim.', 18, '2010-06-20', 21, 64, 4, 3, 'active', 'https://lorempixel.com/200/200/?48311'),
(817, 'Non qui.', 90, '1980-03-22', 42, 871, 6, 5, 'active', 'https://lorempixel.com/200/200/?89664'),
(818, 'Aperiam sequi saepe sint.', 60, '1993-03-19', 4, 22, 2, 2, 'active', 'https://lorempixel.com/200/200/?87708'),
(819, 'Id qui qui.', 17, '1975-11-09', 13, 174, 3, 4, 'active', 'https://lorempixel.com/200/200/?37167'),
(820, 'Quod fugit soluta optio maxime.', 43, '2005-11-23', 23, 713, 6, 1, 'active', 'https://lorempixel.com/200/200/?97782'),
(821, 'Voluptates iure id culpa.', 36, '1970-11-02', 35, 253, 2, 2, 'active', 'https://lorempixel.com/200/200/?21672'),
(822, 'Libero itaque officia dolorem.', 83, '2019-01-08', 11, 840, 3, 3, 'active', 'https://lorempixel.com/200/200/?93197'),
(823, 'Accusantium sed provident.', 11, '2013-10-12', 32, 251, 2, 6, 'active', 'https://lorempixel.com/200/200/?34202'),
(824, 'Aperiam vitae ipsa aspernatur.', 63, '1972-10-12', 45, 897, 3, 3, 'active', 'https://lorempixel.com/200/200/?24322'),
(825, 'Explicabo iusto pariatur nulla.', 100, '1982-06-07', 77, 313, 3, 6, 'active', 'https://lorempixel.com/200/200/?83522'),
(826, 'Illo labore iste est.', 52, '2015-11-05', 16, 703, 3, 2, 'active', 'https://lorempixel.com/200/200/?95870'),
(827, 'Consequuntur eius quos perferendis.', 79, '1978-04-02', 10, 115, 5, 1, 'active', 'https://lorempixel.com/200/200/?46726'),
(828, 'Architecto culpa in odit.', 4, '2015-09-07', 90, 552, 3, 1, 'active', 'https://lorempixel.com/200/200/?70895'),
(829, 'Eum doloribus reiciendis.', 90, '2011-03-29', 62, 202, 6, 4, 'active', 'https://lorempixel.com/200/200/?89861'),
(830, 'Sit rem et.', 65, '2003-08-02', 14, 663, 1, 2, 'active', 'https://lorempixel.com/200/200/?79731'),
(831, 'Quia omnis.', 61, '1999-02-04', 19, 419, 3, 1, 'active', 'https://lorempixel.com/200/200/?95988'),
(832, 'Aut ipsum laborum iusto.', 93, '1970-03-28', 89, 992, 2, 2, 'active', 'https://lorempixel.com/200/200/?34370'),
(833, 'Non eligendi possimus.', 89, '1995-01-20', 73, 162, 4, 2, 'active', 'https://lorempixel.com/200/200/?22534'),
(834, 'Enim aut facilis vel.', 31, '2007-12-03', 33, 525, 5, 4, 'active', 'https://lorempixel.com/200/200/?54996'),
(835, 'Hic qui atque.', 3, '1999-02-26', 7, 521, 2, 6, 'active', 'https://lorempixel.com/200/200/?26757'),
(836, 'Esse atque.', 86, '2015-02-02', 38, 340, 3, 2, 'active', 'https://lorempixel.com/200/200/?92951'),
(837, 'Blanditiis sit natus.', 74, '1986-04-13', 15, 73, 6, 3, 'active', 'https://lorempixel.com/200/200/?39790'),
(838, 'Ea quia quia quibusdam.', 15, '1971-07-12', 93, 413, 4, 6, 'active', 'https://lorempixel.com/200/200/?52719'),
(839, 'Animi pariatur enim facilis.', 63, '2013-08-11', 68, 760, 4, 4, 'active', 'https://lorempixel.com/200/200/?23734'),
(840, 'Debitis et qui.', 85, '2004-12-10', 97, 48, 5, 1, 'active', 'https://lorempixel.com/200/200/?66588'),
(841, 'Est dolor nemo eaque.', 69, '1987-04-08', 100, 614, 3, 2, 'active', 'https://lorempixel.com/200/200/?39817'),
(842, 'Esse illo labore asperiores nihil.', 80, '1983-03-14', 9, 195, 2, 5, 'active', 'https://lorempixel.com/200/200/?35794'),
(843, 'Velit cumque voluptas consequatur dicta.', 64, '1973-01-10', 22, 970, 5, 5, 'active', 'https://lorempixel.com/200/200/?17002'),
(844, 'Expedita a quo et.', 39, '2009-06-24', 7, 786, 1, 1, 'active', 'https://lorempixel.com/200/200/?74968'),
(845, 'Quas voluptatum harum.', 3, '1994-03-16', 89, 688, 6, 6, 'active', 'https://lorempixel.com/200/200/?88817'),
(846, 'Veniam qui reprehenderit.', 3, '1993-07-21', 26, 509, 2, 3, 'active', 'https://lorempixel.com/200/200/?85143'),
(847, 'Mollitia accusamus quasi odit.', 10, '1996-09-21', 45, 893, 2, 4, 'active', 'https://lorempixel.com/200/200/?55941'),
(848, 'Inventore iure aliquam inventore.', 41, '2014-05-13', 77, 708, 2, 5, 'active', 'https://lorempixel.com/200/200/?56575'),
(849, 'Sint voluptas aut temporibus.', 45, '1984-05-26', 14, 194, 6, 3, 'active', 'https://lorempixel.com/200/200/?70021'),
(850, 'Magnam ut consectetur soluta nesciunt.', 27, '1990-02-01', 76, 380, 3, 2, 'active', 'https://lorempixel.com/200/200/?19886'),
(851, 'Vitae harum consequatur.', 8, '2005-02-16', 53, 311, 2, 5, 'active', 'https://lorempixel.com/200/200/?15281'),
(852, 'Vel velit magnam corrupti.', 14, '1974-12-11', 6, 520, 2, 1, 'active', 'https://lorempixel.com/200/200/?32679'),
(853, 'Ex autem reiciendis.', 23, '2013-02-24', 22, 330, 2, 1, 'active', 'https://lorempixel.com/200/200/?53442'),
(854, 'Et repellat nam porro doloribus.', 34, '2023-10-29', 61, 113, 3, 6, 'active', 'https://lorempixel.com/200/200/?99188'),
(855, 'Consequatur officia sequi.', 73, '2000-04-26', 92, 734, 2, 3, 'active', 'https://lorempixel.com/200/200/?69293'),
(856, 'Dolorem quo at.', 45, '2022-04-04', 33, 32, 6, 3, 'active', 'https://lorempixel.com/200/200/?75193'),
(857, 'Rem sit velit.', 36, '1988-02-11', 8, 377, 2, 3, 'active', 'https://lorempixel.com/200/200/?62591'),
(858, 'Facere dolorem fugiat.', 70, '2023-07-11', 5, 736, 2, 4, 'active', 'https://lorempixel.com/200/200/?83987'),
(859, 'Molestiae qui ut.', 19, '2016-10-01', 46, 227, 5, 1, 'active', 'https://lorempixel.com/200/200/?21829');
INSERT INTO `produit` (`idProd`, `nomProd`, `numLot`, `datePerem`, `qteDispo`, `prixU`, `idFournis`, `idCategorie`, `etat`, `imageProd`) VALUES
(860, 'Dolorem et voluptates non aut.', 49, '1996-08-04', 19, 523, 4, 4, 'active', 'https://lorempixel.com/200/200/?88713'),
(861, 'Harum possimus id.', 17, '1973-02-11', 33, 67, 2, 4, 'active', 'https://lorempixel.com/200/200/?87301'),
(862, 'Dignissimos ut alias.', 79, '1971-05-28', 46, 815, 1, 5, 'active', 'https://lorempixel.com/200/200/?70526'),
(863, 'Voluptas id itaque dolorem.', 43, '1994-02-14', 36, 826, 5, 4, 'active', 'https://lorempixel.com/200/200/?91246'),
(864, 'Voluptas suscipit nihil odit.', 69, '1984-04-26', 93, 547, 2, 2, 'active', 'https://lorempixel.com/200/200/?97902'),
(865, 'Maxime exercitationem aut culpa ullam.', 2, '1991-04-13', 32, 669, 1, 1, 'active', 'https://lorempixel.com/200/200/?44543'),
(866, 'Occaecati rem dicta fugiat.', 90, '1976-01-03', 88, 943, 6, 5, 'active', 'https://lorempixel.com/200/200/?56970'),
(867, 'Ipsam suscipit consequatur voluptatem amet.', 6, '1971-07-20', 86, 646, 1, 5, 'active', 'https://lorempixel.com/200/200/?47974'),
(868, 'Omnis in voluptas qui.', 31, '1978-02-27', 61, 730, 4, 1, 'active', 'https://lorempixel.com/200/200/?37020'),
(869, 'Provident repudiandae nihil dolor.', 54, '2009-09-03', 48, 975, 4, 5, 'active', 'https://lorempixel.com/200/200/?74513'),
(870, 'Velit consequatur possimus aliquam.', 60, '1994-01-10', 56, 828, 2, 1, 'active', 'https://lorempixel.com/200/200/?93991'),
(871, 'Error adipisci non.', 36, '1977-03-13', 66, 291, 6, 2, 'active', 'https://lorempixel.com/200/200/?24076'),
(872, 'Ut ipsum minus.', 99, '2000-11-03', 98, 687, 6, 2, 'active', 'https://lorempixel.com/200/200/?83580'),
(873, 'Enim non sed.', 80, '1980-03-08', 89, 507, 5, 2, 'active', 'https://lorempixel.com/200/200/?27792'),
(874, 'Ea impedit qui nostrum.', 96, '2019-05-21', 11, 369, 4, 1, 'active', 'https://lorempixel.com/200/200/?64890'),
(875, 'Quis incidunt.', 68, '1989-08-23', 4, 82, 2, 3, 'active', 'https://lorempixel.com/200/200/?93783'),
(876, 'Ad sed dolor.', 49, '2016-02-10', 30, 852, 4, 3, 'active', 'https://lorempixel.com/200/200/?92335'),
(877, 'Dicta ut.', 12, '1997-10-03', 7, 918, 2, 6, 'active', 'https://lorempixel.com/200/200/?80366'),
(878, 'Repellat expedita laboriosam ut.', 99, '1982-09-10', 22, 824, 6, 5, 'active', 'https://lorempixel.com/200/200/?25206'),
(879, 'Sunt omnis natus ad.', 37, '1992-07-31', 14, 65, 2, 2, 'active', 'https://lorempixel.com/200/200/?80158'),
(880, 'Omnis minus maiores.', 67, '2017-05-18', 48, 796, 3, 4, 'active', 'https://lorempixel.com/200/200/?69734'),
(881, 'Quia sequi iste aliquid.', 5, '1979-07-27', 87, 207, 2, 1, 'active', 'https://lorempixel.com/200/200/?23429'),
(882, 'Nihil incidunt temporibus consequatur.', 86, '2018-03-16', 100, 994, 5, 6, 'active', 'https://lorempixel.com/200/200/?91511'),
(883, 'Qui omnis aut earum.', 17, '2010-11-11', 31, 318, 5, 5, 'active', 'https://lorempixel.com/200/200/?10460'),
(884, 'Est dignissimos expedita.', 59, '1984-12-14', 33, 977, 5, 4, 'active', 'https://lorempixel.com/200/200/?90368'),
(885, 'Illo numquam sed.', 60, '2000-05-11', 95, 52, 1, 2, 'active', 'https://lorempixel.com/200/200/?38640'),
(886, 'Odit ipsa dolor.', 65, '1999-10-15', 55, 485, 2, 4, 'active', 'https://lorempixel.com/200/200/?70772'),
(887, 'Voluptate est sint.', 41, '1980-07-10', 20, 942, 6, 3, 'active', 'https://lorempixel.com/200/200/?63455'),
(888, 'Tempora maxime eligendi provident.', 74, '2002-10-12', 58, 162, 2, 3, 'active', 'https://lorempixel.com/200/200/?77394'),
(889, 'Aut dolorem fugit.', 79, '1997-01-31', 16, 635, 1, 4, 'active', 'https://lorempixel.com/200/200/?53216'),
(890, 'Natus itaque qui deleniti.', 9, '2023-06-13', 29, 386, 3, 4, 'active', 'https://lorempixel.com/200/200/?81164'),
(891, 'Dolorem autem itaque eum.', 68, '1994-04-16', 28, 705, 2, 6, 'active', 'https://lorempixel.com/200/200/?66285'),
(892, 'Culpa ut nulla sint.', 68, '1997-12-21', 50, 753, 4, 1, 'active', 'https://lorempixel.com/200/200/?31859'),
(893, 'Et non est non possimus.', 83, '1977-08-10', 42, 76, 6, 4, 'active', 'https://lorempixel.com/200/200/?74561'),
(894, 'Expedita odio sunt.', 23, '2003-12-23', 96, 935, 3, 6, 'active', 'https://lorempixel.com/200/200/?21444'),
(895, 'Blanditiis eveniet.', 30, '2007-10-01', 45, 350, 3, 1, 'active', 'https://lorempixel.com/200/200/?94509'),
(896, 'Assumenda ut aspernatur ea.', 74, '1976-07-17', 17, 740, 4, 6, 'active', 'https://lorempixel.com/200/200/?92906'),
(897, 'Non quisquam voluptas dolorem repudiandae.', 23, '1978-12-26', 28, 25, 5, 5, 'active', 'https://lorempixel.com/200/200/?29908'),
(898, 'Tenetur commodi dolor est.', 10, '2021-01-05', 51, 732, 1, 2, 'active', 'https://lorempixel.com/200/200/?43278'),
(899, 'Repudiandae reiciendis commodi mollitia.', 50, '2011-12-16', 44, 771, 4, 2, 'active', 'https://lorempixel.com/200/200/?61334'),
(900, 'Et adipisci ut eveniet.', 16, '1987-08-31', 69, 160, 3, 6, 'active', 'https://lorempixel.com/200/200/?31897'),
(901, 'Fugit et.', 45, '1994-03-12', 6, 20, 6, 1, 'active', 'https://lorempixel.com/200/200/?30484'),
(902, 'Omnis vitae recusandae.', 28, '1971-05-29', 97, 477, 3, 3, 'active', 'https://lorempixel.com/200/200/?63359'),
(903, 'Dolores qui.', 78, '2005-10-10', 47, 443, 2, 4, 'active', 'https://lorempixel.com/200/200/?57854'),
(904, 'Qui autem molestias beatae.', 85, '1996-06-02', 72, 802, 1, 4, 'active', 'https://lorempixel.com/200/200/?80888'),
(905, 'Doloremque ex rerum omnis.', 73, '1976-07-26', 12, 702, 3, 2, 'active', 'https://lorempixel.com/200/200/?20719'),
(906, 'Voluptas quia facilis.', 16, '2022-03-15', 78, 765, 4, 5, 'active', 'https://lorempixel.com/200/200/?28788'),
(907, 'Aut ut.', 8, '1995-01-27', 74, 103, 3, 5, 'active', 'https://lorempixel.com/200/200/?49078'),
(908, 'Itaque at quisquam ab voluptatem.', 60, '2006-08-31', 45, 886, 4, 1, 'active', 'https://lorempixel.com/200/200/?83682'),
(909, 'Explicabo animi dolorum.', 62, '2021-11-08', 71, 760, 2, 1, 'active', 'https://lorempixel.com/200/200/?46759'),
(910, 'Dicta id at maxime et.', 48, '2001-01-02', 58, 449, 5, 5, 'active', 'https://lorempixel.com/200/200/?26897'),
(911, 'Labore odio ratione minima.', 85, '2017-08-26', 44, 10, 6, 1, 'active', 'https://lorempixel.com/200/200/?66656'),
(912, 'Illo maxime aut et.', 90, '1996-11-18', 64, 239, 6, 2, 'active', 'https://lorempixel.com/200/200/?96087'),
(913, 'Sunt nihil ducimus et sapiente.', 67, '1970-04-04', 82, 931, 4, 3, 'active', 'https://lorempixel.com/200/200/?74040'),
(914, 'Quisquam ad officia.', 39, '1999-03-25', 24, 489, 1, 5, 'active', 'https://lorempixel.com/200/200/?93467'),
(915, 'In sit aut quo odio.', 46, '1981-12-01', 55, 817, 1, 2, 'active', 'https://lorempixel.com/200/200/?98600'),
(916, 'Nostrum ipsam enim.', 99, '1978-03-18', 41, 193, 4, 4, 'active', 'https://lorempixel.com/200/200/?72973'),
(917, 'Adipisci quae dolores.', 64, '2016-03-09', 31, 981, 3, 4, 'active', 'https://lorempixel.com/200/200/?19959'),
(918, 'Quas pariatur illo.', 31, '2003-06-26', 83, 804, 3, 4, 'active', 'https://lorempixel.com/200/200/?56482'),
(919, 'Dolore omnis voluptate.', 58, '2005-03-19', 74, 631, 3, 5, 'active', 'https://lorempixel.com/200/200/?11150'),
(920, 'Recusandae mollitia dicta vel.', 90, '2021-07-10', 44, 946, 4, 3, 'active', 'https://lorempixel.com/200/200/?37243'),
(921, 'Rerum laborum vel beatae.', 85, '2008-12-11', 51, 579, 4, 1, 'active', 'https://lorempixel.com/200/200/?65189'),
(922, 'Et et iusto.', 29, '2021-06-21', 71, 729, 2, 1, 'active', 'https://lorempixel.com/200/200/?77098'),
(923, 'Voluptatem sunt soluta temporibus.', 71, '2007-08-05', 89, 230, 4, 5, 'active', 'https://lorempixel.com/200/200/?70436'),
(924, 'Voluptatem ut sint eum et.', 92, '1992-10-17', 37, 178, 2, 1, 'active', 'https://lorempixel.com/200/200/?97256'),
(925, 'Dolorem voluptates provident.', 13, '1972-02-18', 92, 593, 1, 2, 'active', 'https://lorempixel.com/200/200/?61336'),
(926, 'Amet autem dolore enim.', 43, '2007-10-11', 7, 467, 1, 3, 'active', 'https://lorempixel.com/200/200/?61283'),
(927, 'Accusamus quas perspiciatis.', 65, '2007-01-26', 85, 212, 5, 2, 'active', 'https://lorempixel.com/200/200/?27121'),
(928, 'Adipisci et rerum voluptates.', 83, '2005-03-27', 71, 467, 3, 2, 'active', 'https://lorempixel.com/200/200/?59449'),
(929, 'Placeat aliquid error.', 34, '1994-02-15', 3, 339, 4, 3, 'active', 'https://lorempixel.com/200/200/?71009'),
(930, 'Consequatur praesentium voluptas saepe.', 56, '1995-07-21', 91, 193, 2, 3, 'active', 'https://lorempixel.com/200/200/?96294'),
(931, 'Consequuntur quibusdam earum.', 35, '2006-11-23', 40, 391, 3, 2, 'active', 'https://lorempixel.com/200/200/?25275'),
(932, 'Fugiat maxime amet sed.', 39, '1987-11-07', 61, 657, 6, 3, 'active', 'https://lorempixel.com/200/200/?62241'),
(933, 'Magnam aliquid et non.', 91, '2020-01-10', 68, 353, 2, 2, 'active', 'https://lorempixel.com/200/200/?25901'),
(934, 'Maiores porro eos saepe.', 21, '2002-05-24', 65, 188, 2, 4, 'active', 'https://lorempixel.com/200/200/?12785'),
(935, 'In ut ad sit.', 88, '2002-10-07', 44, 561, 3, 2, 'active', 'https://lorempixel.com/200/200/?12968'),
(936, 'Tempora quaerat a distinctio.', 55, '1976-04-29', 41, 60, 6, 6, 'active', 'https://lorempixel.com/200/200/?37818'),
(937, 'Dolores explicabo eligendi.', 54, '2004-07-02', 89, 444, 2, 1, 'active', 'https://lorempixel.com/200/200/?46052'),
(938, 'Porro quia qui.', 53, '1973-10-06', 42, 717, 4, 1, 'active', 'https://lorempixel.com/200/200/?70071'),
(939, 'Omnis voluptas praesentium.', 36, '1993-04-18', 18, 808, 5, 4, 'active', 'https://lorempixel.com/200/200/?50838'),
(940, 'Vitae sit quo possimus.', 47, '1980-05-17', 61, 439, 1, 3, 'active', 'https://lorempixel.com/200/200/?96057'),
(941, 'Exercitationem a ad.', 19, '2015-02-17', 6, 517, 5, 6, 'active', 'https://lorempixel.com/200/200/?64524'),
(942, 'Rerum dignissimos soluta.', 72, '1985-02-12', 74, 974, 2, 5, 'active', 'https://lorempixel.com/200/200/?50373'),
(943, 'Nostrum enim explicabo dolorem.', 1, '2015-12-07', 69, 835, 5, 2, 'active', 'https://lorempixel.com/200/200/?57744'),
(944, 'Non nesciunt quia quam.', 16, '2023-04-02', 79, 984, 2, 4, 'active', 'https://lorempixel.com/200/200/?53165'),
(945, 'Dolorem enim voluptates eaque deserunt.', 53, '1982-10-07', 77, 262, 3, 5, 'active', 'https://lorempixel.com/200/200/?53326'),
(946, 'Officia dolores nemo.', 19, '1984-11-27', 46, 683, 1, 1, 'active', 'https://lorempixel.com/200/200/?77880'),
(947, 'Est laborum magnam qui.', 40, '1973-02-19', 13, 760, 3, 5, 'active', 'https://lorempixel.com/200/200/?93357'),
(948, 'Quas velit sunt.', 31, '1992-09-10', 50, 776, 1, 2, 'active', 'https://lorempixel.com/200/200/?14173'),
(949, 'Id reiciendis amet aut.', 29, '1992-08-23', 80, 101, 6, 5, 'active', 'https://lorempixel.com/200/200/?41836'),
(950, 'Beatae modi nisi.', 45, '1970-09-13', 41, 398, 3, 3, 'active', 'https://lorempixel.com/200/200/?39483'),
(951, 'Voluptatibus delectus ipsa.', 4, '1979-02-26', 51, 900, 1, 5, 'active', 'https://lorempixel.com/200/200/?83268'),
(952, 'Soluta voluptatem quis.', 62, '1974-12-17', 34, 850, 4, 1, 'active', 'https://lorempixel.com/200/200/?26263'),
(953, 'Totam minima eius quia.', 40, '1971-08-08', 60, 44, 5, 6, 'active', 'https://lorempixel.com/200/200/?77361'),
(954, 'Et voluptatem laudantium.', 89, '1975-09-16', 9, 582, 6, 5, 'active', 'https://lorempixel.com/200/200/?71008'),
(955, 'Omnis non necessitatibus.', 100, '2004-06-26', 58, 665, 2, 1, 'active', 'https://lorempixel.com/200/200/?32160'),
(956, 'Possimus incidunt deleniti.', 86, '1983-12-03', 25, 322, 5, 4, 'active', 'https://lorempixel.com/200/200/?66404'),
(957, 'Est ut ratione culpa.', 73, '2014-07-01', 65, 196, 6, 6, 'active', 'https://lorempixel.com/200/200/?81490'),
(958, 'Eligendi officia maiores.', 11, '2003-01-21', 17, 96, 1, 2, 'active', 'https://lorempixel.com/200/200/?58912'),
(959, 'Alias occaecati debitis.', 63, '1980-10-29', 65, 260, 5, 1, 'active', 'https://lorempixel.com/200/200/?21699'),
(960, 'Est molestias esse eos.', 16, '1986-10-24', 7, 518, 3, 3, 'active', 'https://lorempixel.com/200/200/?88182'),
(961, 'Expedita in accusamus voluptatem.', 36, '1992-11-06', 90, 727, 4, 3, 'active', 'https://lorempixel.com/200/200/?17185'),
(962, 'Vel dolores in.', 18, '1977-03-03', 30, 590, 4, 4, 'active', 'https://lorempixel.com/200/200/?57203'),
(963, 'Quia fuga quo.', 14, '1987-05-14', 95, 438, 3, 5, 'active', 'https://lorempixel.com/200/200/?30740'),
(964, 'Sit voluptate quia et.', 93, '2014-09-23', 16, 983, 3, 6, 'active', 'https://lorempixel.com/200/200/?51714'),
(965, 'Corrupti qui dolorum.', 43, '1990-07-05', 8, 339, 6, 2, 'active', 'https://lorempixel.com/200/200/?41463'),
(966, 'Nemo maiores itaque.', 59, '1984-12-23', 66, 250, 1, 2, 'active', 'https://lorempixel.com/200/200/?62563'),
(967, 'At voluptatum voluptate.', 71, '2006-06-18', 94, 118, 4, 3, 'active', 'https://lorempixel.com/200/200/?81683'),
(968, 'Reprehenderit quis est commodi.', 37, '1993-01-06', 69, 90, 5, 1, 'active', 'https://lorempixel.com/200/200/?32751'),
(969, 'Neque eaque est totam.', 91, '2000-08-13', 85, 603, 4, 6, 'active', 'https://lorempixel.com/200/200/?29231'),
(970, 'Voluptatem occaecati praesentium nesciunt nemo.', 39, '1974-05-30', 60, 357, 2, 5, 'active', 'https://lorempixel.com/200/200/?48571'),
(971, 'Excepturi autem ea.', 30, '1983-01-04', 67, 91, 4, 6, 'active', 'https://lorempixel.com/200/200/?50999'),
(972, 'Ut ad doloremque.', 40, '1984-03-07', 100, 118, 5, 5, 'active', 'https://lorempixel.com/200/200/?53902'),
(973, 'Laudantium fugit illo officia.', 47, '1999-08-28', 51, 579, 3, 2, 'active', 'https://lorempixel.com/200/200/?52582'),
(974, 'Est ut at sapiente ipsum.', 32, '2004-06-03', 84, 801, 4, 2, 'active', 'https://lorempixel.com/200/200/?15482'),
(975, 'Quisquam ut praesentium.', 38, '2020-04-09', 54, 736, 3, 4, 'active', 'https://lorempixel.com/200/200/?67342'),
(976, 'Non autem pariatur accusamus quibusdam.', 15, '2013-09-05', 32, 238, 4, 5, 'active', 'https://lorempixel.com/200/200/?67491'),
(977, 'Vel et qui rerum quam.', 88, '2013-12-10', 25, 88, 2, 3, 'active', 'https://lorempixel.com/200/200/?91509'),
(978, 'Facilis voluptates cupiditate.', 1, '1971-04-09', 56, 594, 6, 3, 'active', 'https://lorempixel.com/200/200/?86298'),
(979, 'Tempore occaecati iure quo a.', 41, '2017-06-23', 54, 368, 6, 4, 'active', 'https://lorempixel.com/200/200/?68893'),
(980, 'Perspiciatis qui enim.', 76, '2020-04-27', 56, 46, 6, 3, 'active', 'https://lorempixel.com/200/200/?80011'),
(981, 'Voluptas officiis sit numquam.', 53, '2005-02-04', 51, 470, 5, 4, 'active', 'https://lorempixel.com/200/200/?99547'),
(982, 'Et quisquam maxime.', 69, '1996-05-16', 37, 560, 4, 4, 'active', 'https://lorempixel.com/200/200/?89574'),
(983, 'Ut nihil ullam eum quia.', 91, '1998-07-01', 41, 19, 5, 1, 'active', 'https://lorempixel.com/200/200/?46551'),
(984, 'Beatae sunt veniam adipisci aperiam.', 29, '1979-01-07', 21, 237, 3, 4, 'active', 'https://lorempixel.com/200/200/?40447'),
(985, 'Tempore quam nemo rerum.', 80, '1997-06-12', 25, 105, 5, 6, 'active', 'https://lorempixel.com/200/200/?30748'),
(986, 'Molestiae enim quia.', 49, '2015-08-01', 30, 367, 6, 4, 'active', 'https://lorempixel.com/200/200/?31832'),
(987, 'Aut animi dolor et.', 7, '2005-05-29', 4, 782, 3, 2, 'active', 'https://lorempixel.com/200/200/?34414'),
(988, 'Consequatur voluptates sit eos.', 30, '1972-09-05', 8, 576, 3, 6, 'active', 'https://lorempixel.com/200/200/?13352'),
(989, 'Non accusamus.', 41, '2023-08-14', 79, 152, 5, 4, 'active', 'https://lorempixel.com/200/200/?15556'),
(990, 'Id occaecati qui neque.', 5, '1980-11-15', 87, 972, 4, 6, 'active', 'https://lorempixel.com/200/200/?42527'),
(991, 'Aut est fugit.', 57, '1996-02-10', 15, 41256, 1, 5, 'active', 'images/'),
(992, 'Veniam necessitatibus magni.', 4, '2007-04-13', 60, 223, 2, 3, 'active', 'https://lorempixel.com/200/200/?36600'),
(993, 'Quia autem amet.', 72, '1972-03-07', 47, 406, 3, 2, 'active', 'https://lorempixel.com/200/200/?80757'),
(994, 'Est eos quis illo.', 39, '1997-12-17', 75, 748, 4, 3, 'active', 'https://lorempixel.com/200/200/?99500'),
(995, 'Esse saepe aspernatur.', 90, '1998-06-21', 96, 625, 2, 2, 'active', 'https://lorempixel.com/200/200/?69191'),
(996, 'Officiis consectetur quis non.', 83, '1972-04-01', 2, 735, 2, 3, 'active', 'https://lorempixel.com/200/200/?28055'),
(997, 'Ea id nulla veniam.', 3, '1979-02-08', 12, 535, 2, 4, 'active', 'https://lorempixel.com/200/200/?92901'),
(998, 'Perspiciatis quas dolores.', 43, '2003-08-03', 75, 482, 6, 1, 'active', 'https://lorempixel.com/200/200/?21692'),
(999, 'Officiis suscipit repellendus vel.', 69, '1970-02-17', 69, 779, 4, 5, 'active', 'https://lorempixel.com/200/200/?19405'),
(1000, 'Impedit assumenda et et.', 57, '1986-02-06', 44, 193, 3, 6, 'supprimer', 'https://lorempixel.com/200/200/?70128');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `idU` int NOT NULL,
  `nomU` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `etat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`idU`, `nomU`, `login`, `password`, `etat`) VALUES
(1, 'Block', 'elinore.botsford', '5a296e12a4b77b56d476e6ae37af5529', 'active'),
(2, 'Reichert', 'omer.cummerata', '978e88e0c0b33443a90f3fc5cb0d0bb3', 'active'),
(3, 'Konopelski', 'emmanuelle.hill', '4ec75cf81fae73f551e701008128081d', 'supprimer'),
(4, 'Jacobs', 'wtillman', '038a7f9216791cc7c082ce59b4f5ed9a', 'active'),
(5, 'Marquardt', 'cyundt', 'a48952e4ece165c80a9398db8cf81cbd', 'active'),
(6, 'Stracke', 'qkerluke', '672464f470426d3da6ea549dae05e7dc', 'active'),
(7, 'Marvin', 'jeramy06', 'eccd1e22260eec7c98c3878e43921189', 'active'),
(8, 'Hermann', 'eudora.kuhn', '37d3b69f6e30d358721a737566602933', 'active'),
(9, 'Reichel', 'aiyana.feeney', '96597b07573b16f0103fda5c61156e43', 'supprimer'),
(10, 'Lehner', 'albina75', 'febff96ca9e7301d4ead48530254f27a', 'supprimer'),
(12, 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'active'),
(13, 'azerty', 'azerty', 'ab4f63f9ac65152575886860dde480a1', 'supprimer');

-- --------------------------------------------------------

--
-- Structure de la table `ventes`
--

CREATE TABLE `ventes` (
  `idVente` int NOT NULL,
  `dateVente` date NOT NULL,
  `qteVente` int NOT NULL,
  `numFact` text NOT NULL,
  `idProd` int NOT NULL,
  `idClient` int NOT NULL,
  `etat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ventes`
--

INSERT INTO `ventes` (`idVente`, `dateVente`, `qteVente`, `numFact`, `idProd`, `idClient`, `etat`) VALUES
(2, '1984-02-10', 98, '73462', 556, 2, 'active'),
(3, '2019-10-28', 59, '73462', 33, 2, 'active'),
(4, '1998-02-11', 78, '7346', 708, 8, 'active'),
(5, '1990-06-14', 72, '41087', 990, 1, 'active'),
(6, '1972-08-27', 15, '89494', 242, 5, 'active'),
(7, '2004-02-23', 11, '70041', 258, 5, 'active'),
(8, '1983-12-16', 33, '24637', 611, 6, 'active'),
(9, '1995-02-05', 80, '11200', 474, 3, 'active'),
(10, '2009-08-19', 70, '47196', 945, 3, 'active'),
(11, '2007-06-28', 91, '27362', 795, 10, 'active'),
(12, '2003-06-20', 43, '91766', 705, 3, 'active'),
(13, '1997-09-18', 61, '87906', 118, 6, 'active'),
(14, '2001-12-20', 11, '68931', 638, 1, 'active'),
(15, '1980-04-02', 29, '42791', 85, 3, 'active'),
(16, '2007-02-24', 18, '77627', 540, 10, 'active'),
(17, '2010-05-08', 63, '45845', 104, 9, 'active'),
(18, '2018-12-22', 63, '70499', 471, 1, 'active'),
(19, '2022-03-20', 91, '68028', 905, 6, 'active'),
(20, '2004-11-15', 2, '11059', 11, 5, 'active'),
(21, '2011-03-19', 69, '44757', 563, 5, 'active'),
(22, '2000-05-19', 30, '85493', 453, 1, 'active'),
(23, '2006-04-02', 95, '60388', 915, 4, 'active'),
(24, '2011-12-23', 74, '80426', 981, 9, 'active'),
(25, '1985-10-18', 1, '39833', 191, 5, 'active'),
(26, '2007-11-21', 40, '83158', 317, 3, 'active'),
(27, '1979-11-30', 72, '85004', 497, 3, 'active'),
(28, '2000-05-29', 9, '79114', 161, 7, 'active'),
(29, '2011-02-14', 9, '56943', 713, 6, 'active'),
(30, '2011-12-26', 100, '41753', 806, 7, 'active'),
(31, '2011-11-13', 3, '8322', 603, 4, 'active'),
(32, '1987-01-11', 44, '55819', 911, 5, 'active'),
(33, '1970-02-22', 80, '70235', 211, 2, 'active'),
(34, '2007-06-19', 59, '68558', 982, 7, 'active'),
(35, '1982-05-25', 43, '66014', 311, 6, 'active'),
(36, '1995-07-03', 91, '76693', 403, 5, 'active'),
(37, '1982-10-28', 86, '62892', 336, 9, 'active'),
(38, '2006-04-30', 52, '2409', 943, 10, 'active'),
(39, '2015-11-29', 23, '49677', 913, 9, 'active'),
(40, '2015-01-13', 8, '16914', 216, 6, 'active'),
(41, '1989-01-10', 69, '76422', 130, 9, 'active'),
(42, '2010-02-20', 75, '66587', 81, 4, 'active'),
(43, '2004-05-19', 10, '68460', 172, 9, 'active'),
(44, '1995-07-16', 48, '29523', 887, 6, 'active'),
(45, '1972-11-24', 14, '22284', 453, 9, 'active'),
(46, '1996-08-24', 68, '24716', 497, 5, 'active'),
(47, '1984-06-24', 100, '9802', 727, 3, 'active'),
(48, '1999-07-27', 36, '71928', 841, 1, 'active'),
(49, '2021-03-19', 6, '98205', 594, 8, 'active'),
(50, '2002-03-31', 17, '78319', 978, 10, 'active'),
(51, '1991-03-12', 23, '51030', 153, 3, 'active'),
(52, '2005-07-31', 11, '58290', 614, 10, 'active'),
(53, '2007-10-17', 89, '50739', 333, 5, 'active'),
(54, '2022-09-05', 80, '98152', 824, 7, 'active'),
(55, '2010-07-29', 37, '21705', 942, 5, 'active'),
(56, '2016-10-16', 68, '28266', 895, 2, 'active'),
(57, '2001-05-23', 79, '38991', 296, 5, 'active'),
(58, '1982-05-22', 99, '7569', 759, 5, 'active'),
(59, '2004-01-22', 68, '82250', 149, 10, 'active'),
(60, '1977-10-02', 33, '56035', 89, 8, 'active'),
(61, '1978-04-13', 60, '18244', 410, 9, 'active'),
(62, '2006-02-14', 20, '47117', 320, 2, 'active'),
(63, '2003-11-12', 49, '83492', 180, 6, 'active'),
(64, '2004-03-25', 96, '36830', 475, 10, 'active'),
(65, '1991-08-30', 9, '52658', 219, 5, 'active'),
(66, '1990-04-22', 54, '36491', 293, 1, 'active'),
(67, '1975-09-03', 10, '30363', 916, 1, 'active'),
(68, '2014-11-21', 73, '94998', 549, 6, 'active'),
(69, '2000-02-28', 100, '10673', 397, 8, 'active'),
(70, '1995-08-28', 14, '15490', 422, 2, 'active'),
(71, '2000-01-22', 34, '27103', 676, 8, 'active'),
(72, '1985-04-24', 36, '25431', 382, 6, 'active'),
(73, '2012-09-03', 29, '49268', 604, 1, 'active'),
(74, '2014-08-17', 42, '71390', 808, 7, 'active'),
(75, '2006-08-03', 19, '72948', 269, 9, 'active'),
(76, '1981-11-22', 92, '6422', 582, 2, 'active'),
(77, '2012-07-21', 79, '99048', 276, 2, 'active'),
(78, '1981-07-04', 10, '97575', 151, 7, 'active'),
(79, '2015-11-17', 54, '5468', 139, 4, 'active'),
(80, '1974-04-04', 28, '95316', 603, 10, 'active'),
(81, '2005-10-16', 6, '19769', 470, 8, 'active'),
(82, '2000-10-21', 88, '14736', 309, 10, 'active'),
(83, '2008-09-28', 2, '72132', 271, 9, 'active'),
(84, '1982-12-30', 30, '75457', 657, 4, 'active'),
(85, '2003-05-11', 2, '90239', 169, 6, 'active'),
(86, '2020-06-01', 8, '39260', 873, 2, 'active'),
(87, '2009-04-24', 62, '78650', 690, 6, 'active'),
(88, '2007-03-11', 74, '15273', 639, 8, 'active'),
(89, '1975-09-07', 59, '84666', 107, 5, 'active'),
(90, '2012-10-19', 48, '65404', 93, 7, 'active'),
(91, '1998-08-01', 96, '34385', 5, 8, 'active'),
(92, '2008-06-13', 50, '66109', 197, 10, 'active'),
(93, '2010-03-31', 54, '28531', 236, 8, 'active'),
(94, '1974-07-22', 70, '30303', 947, 1, 'active'),
(95, '2019-03-24', 78, '55127', 917, 3, 'active'),
(96, '1989-03-10', 32, '7712', 582, 5, 'active'),
(97, '1993-09-27', 69, '82527', 161, 8, 'active'),
(98, '2021-06-16', 96, '79660', 586, 6, 'active'),
(99, '2007-08-24', 30, '74452', 929, 2, 'active'),
(100, '2008-05-08', 39, '92171', 461, 8, 'active'),
(101, '1977-08-01', 90, '81326', 12, 5, 'active');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `approvisionnement`
--
ALTER TABLE `approvisionnement`
  ADD PRIMARY KEY (`idAppro`),
  ADD KEY `idProd` (`idProd`),
  ADD KEY `idFournis` (`idFournis`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`idCategorie`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`idClient`),
  ADD UNIQUE KEY `emailclient` (`emailClient`);

--
-- Index pour la table `facture`
--
ALTER TABLE `facture`
  ADD PRIMARY KEY (`idFact`),
  ADD KEY `idVente` (`idVente`);

--
-- Index pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`idFournis`),
  ADD UNIQUE KEY `emailFournis` (`emailFournis`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`idProd`),
  ADD KEY `idCategorie` (`idCategorie`),
  ADD KEY `idFournis` (`idFournis`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idU`);

--
-- Index pour la table `ventes`
--
ALTER TABLE `ventes`
  ADD PRIMARY KEY (`idVente`),
  ADD KEY `idClient` (`idClient`),
  ADD KEY `idProd` (`idProd`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `approvisionnement`
--
ALTER TABLE `approvisionnement`
  MODIFY `idAppro` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `idCategorie` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `idClient` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `facture`
--
ALTER TABLE `facture`
  MODIFY `idFact` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  MODIFY `idFournis` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `idProd` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `idU` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `ventes`
--
ALTER TABLE `ventes`
  MODIFY `idVente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `approvisionnement`
--
ALTER TABLE `approvisionnement`
  ADD CONSTRAINT `approvisionnement_ibfk_1` FOREIGN KEY (`idProd`) REFERENCES `produit` (`idProd`),
  ADD CONSTRAINT `approvisionnement_ibfk_2` FOREIGN KEY (`idFournis`) REFERENCES `fournisseur` (`idFournis`);

--
-- Contraintes pour la table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `facture_ibfk_1` FOREIGN KEY (`idVente`) REFERENCES `ventes` (`idVente`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`idCategorie`) REFERENCES `categorie` (`idCategorie`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `produit_ibfk_2` FOREIGN KEY (`idFournis`) REFERENCES `fournisseur` (`idFournis`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `ventes`
--
ALTER TABLE `ventes`
  ADD CONSTRAINT `ventes_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `client` (`idClient`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ventes_ibfk_2` FOREIGN KEY (`idProd`) REFERENCES `produit` (`idProd`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
