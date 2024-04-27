-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : sam. 27 avr. 2024 à 00:41
-- Version du serveur :  8.0.36-0ubuntu0.20.04.1
-- Version de PHP : 7.4.3-4ubuntu2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
  `etat` text NOT NULL,
  `idU` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `approvisionnement`
--

INSERT INTO `approvisionnement` (`idAppro`, `numBL`, `qteAppro`, `dateAppro`, `prixU`, `idProd`, `idFournis`, `etat`, `idU`) VALUES
(87, 'BL-00002', 5, '2024-04-25', 400, 5, 2, 'active', 14),
(88, 'BL-00002', 7, '2024-04-25', 450, 6, 2, 'active', 14),
(89, 'BL-00002', 11, '2024-04-25', 200, 9, 2, 'active', 14),
(91, '12000', 4, '2024-04-25', 700, 1, 7, 'active', 14),
(92, '12000', 23, '2024-04-25', 200, 2, 2, 'active', 14);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `idCategorie` int NOT NULL,
  `nomCategorie` varchar(255) NOT NULL,
  `etat` text NOT NULL,
  `idU` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`idCategorie`, `nomCategorie`, `etat`, `idU`) VALUES
(1, 'Analgésiques ', 'active', 14),
(2, 'Antibiotiques', 'active', 14),
(3, 'Antidépresseurs', 'active', 14),
(4, 'Antihistaminiques', 'active', 14),
(5, 'Antihypertenseurs', 'active', 14),
(6, 'Anticoagulants', 'active', 14);

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
  `etat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'active',
  `idU` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`idClient`, `nomClient`, `villeClient`, `emailClient`, `telephoneClient`, `etat`, `idU`) VALUES
(1, 'Rath', 'Legrosfort', 'monserrat.larkin@yahoo.com', '720-342-72', 'active', 14),
(2, 'Sporer', 'Skilesmouth', 'jkonopelski@legros.net', '796.799.89', 'active', 14),
(3, 'Streich', 'North Donnie', 'waters.reginald@gmail.com', '(439) 978-', 'active', 14),
(4, 'Barrows', 'Constanceview', 'wilkinson.bessie@wehner.com', '543.885.87', 'active', 14),
(5, 'Marquardt', 'Lake Candelarioville', 'whand@gmail.com', '264-890-92', 'active', 14),
(6, 'Bradtke', 'Yostport', 'strosin.imogene@johnston.org', '1-996-951-', 'active', 14),
(7, 'Cole', 'Port Gerard', 'ohodkiewicz@bode.com', '+1 (203) 6', 'active', 14),
(8, 'Toy', 'New Myahchester', 'cali35@kutch.com', '(459) 649-', 'active', 14),
(9, 'Rogahn', 'North Oren', 'tabitha79@herzog.com', '1-992-795-', 'active', 14),
(10, 'Dooley', 'Abbottport', 'stacy.walter@corkery.com', '1-728-641-', 'active', 14),
(11, 'auriot', 'bafoussam', 'auriotmagoua@gmail.com', '699128531', 'active', 14),
(12, 'lenora', 'lenora', 'lenora@gmail.com', '697738847', 'active', 14);

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
  `etat` varchar(255) NOT NULL,
  `idU` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`idFournis`, `nomFournis`, `villeFournis`, `emailFournis`, `telephoneFournis`, `etat`, `idU`) VALUES
(1, 'McCullough', 'Lake Eusebio', 'cokuneva@denesik.org', '693.854.7', 'active', 14),
(2, 'Mayert', 'South Margarettaview', 'kuvalis.mellie@gmail.com', '224.599.4', 'active', 14),
(3, 'Murphy', 'Rempelbury', 'adolph47@yahoo.com', '1-682-545', 'active', 14),
(4, 'Dickinson', 'East Fiona', 'ullrich.victor@walsh.com', '(613) 990', 'active', 14),
(5, 'Bode', 'Hoseahaven', 'fadel.marlene@gmail.com', '802-556-5', 'active', 14),
(6, 'Kirlin', 'South Coty', 'willy37@lebsack.com', '+1.795.53', 'active', 14),
(7, 'booba', 'bawouan', 'booba@g', '690909090', 'active', 14),
(8, 'lenora', 'lenora', 'lenora@gmail.com', '697116394', 'active', 14);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `idProd` int NOT NULL,
  `nomProd` varchar(255) NOT NULL,
  `prixU` int NOT NULL,
  `idCategorie` int NOT NULL,
  `dateAjout` text NOT NULL,
  `dateModif` text NOT NULL,
  `idU` int NOT NULL,
  `etat` varchar(255) NOT NULL,
  `imageProd` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`idProd`, `nomProd`, `prixU`, `idCategorie`, `dateAjout`, `dateModif`, `idU`, `etat`, `imageProd`) VALUES
(1, 'ibuprofen', 326, 6, '', '', 14, 'active', 'images/para.png'),
(2, 'Consequuntur dolorum nobis nulla.', 493, 4, '', '', 14, 'active', 'images/pillue.jpeg'),
(3, 'Vel est sapiente modi.', 58, 1, '', '', 14, 'active', 'images/capsule.jpeg'),
(4, 'Illum consequatur debitis corrupti id.', 285, 2, '', '', 14, 'active', 'images/pillule.jpeg'),
(5, 'Ut non possimus vero.', 560, 3, '', '', 14, 'active', 'images/quinine.jpeg'),
(6, 'Nostrum nemo quo.', 509, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?15092'),
(7, 'Deserunt adipisci et ab.', 673, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?55345'),
(8, 'Non officia qui error suscipit.', 160, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?51736'),
(9, 'Ab est sit aliquam.', 257, 5, '', '', 14, 'supprimer', 'https://lorempixel.com/200/200/?90552'),
(10, 'Doloribus et voluptatem.', 979, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?29295'),
(11, 'Qui in aliquid.', 209, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?60527'),
(12, 'Quo pariatur iure.', 27, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?58668'),
(13, 'Laboriosam blanditiis natus adipisci.', 940, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?69373'),
(14, 'Voluptates corrupti minus soluta.', 29, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?25038'),
(15, 'Dignissimos quis quasi.', 588, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?72910'),
(16, 'Id perspiciatis veritatis.', 481, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?30632'),
(17, 'Ipsum officia sed.', 842, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?95476'),
(18, 'Et culpa occaecati.', 818, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?42875'),
(19, 'Et minus quos vitae.', 907, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?54620'),
(20, 'Cum aut et.', 601, 4, '', '', 14, 'supprimer', 'https://lorempixel.com/200/200/?70413'),
(21, 'Quia qui voluptatem asperiores.', 626, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?10113'),
(22, 'Ut occaecati voluptas omnis.', 143, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?62752'),
(23, 'Cum suscipit.', 379, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?99239'),
(24, 'Minus quos et totam expedita.', 731, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?88439'),
(25, 'Nostrum suscipit quia fugiat quaerat.', 685, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?13810'),
(26, 'Perferendis libero eos delectus.', 650, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?51862'),
(27, 'Et dignissimos fugiat deserunt autem.', 689, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?71516'),
(28, 'Error praesentium sint et.', 618, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?48633'),
(29, 'Beatae laboriosam incidunt voluptas.', 180, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?91965'),
(30, 'Dolorum consequatur porro id.', 845, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?22307'),
(31, 'Qui itaque omnis ut est.', 211, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?20796'),
(32, 'Perspiciatis unde.', 262, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?24678'),
(33, 'Dolor inventore nisi.', 880, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?78398'),
(34, 'Rerum id omnis eos.', 62, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?96443'),
(35, 'Illum incidunt porro rerum.', 732, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?44530'),
(36, 'Iure excepturi doloremque quasi.', 827, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?64234'),
(37, 'Placeat voluptate numquam sed.', 708, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?68780'),
(38, 'Dolores possimus esse.', 337, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?31708'),
(39, 'Culpa aliquam sunt sed.', 731, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?95479'),
(40, 'Occaecati illum sed unde.', 339, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?69075'),
(41, 'Dolor est vero.', 661, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?33160'),
(42, 'Beatae ut fugit.', 341, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?48571'),
(43, 'Sit distinctio.', 281, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?64282'),
(44, 'Ad occaecati voluptatibus.', 108, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?39690'),
(45, 'Incidunt temporibus eius consequatur.', 908, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?36691'),
(46, 'Et repellendus fugiat.', 319, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?86585'),
(47, 'Enim voluptatum ea.', 631, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?80310'),
(48, 'Et nostrum beatae repellendus.', 784, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?56301'),
(49, 'Aut aliquid hic.', 919, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?83776'),
(50, 'Neque cupiditate.', 251, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?68828'),
(51, 'Excepturi maiores et.', 487, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?73955'),
(52, 'Deserunt consectetur laborum quis.', 701, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?68435'),
(53, 'Et sit eum maiores velit.', 402, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?65155'),
(54, 'Culpa sint.', 995, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?54865'),
(55, 'Occaecati sit saepe.', 457, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?12997'),
(56, 'Sed fuga nam sed.', 289, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?60144'),
(57, 'Consectetur placeat dolores sunt accusamus.', 924, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?63637'),
(58, 'Ipsum velit.', 547, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?37459'),
(59, 'Saepe qui ea.', 876, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?61539'),
(60, 'Facere velit animi aperiam.', 346, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?30575'),
(61, 'Temporibus ipsam sed.', 35, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?58472'),
(62, 'Iure ipsam.', 967, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?18712'),
(63, 'Sit aut aliquid.', 473, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?58997'),
(64, 'Ut consequatur eveniet aut.', 931, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?61371'),
(65, 'Necessitatibus quia eos qui.', 752, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?19229'),
(66, 'Eius consequatur dicta.', 833, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?75926'),
(67, 'Veniam nemo cupiditate.', 912, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?79893'),
(68, 'Omnis id quam minus.', 490, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?93879'),
(69, 'Libero et inventore similique.', 75, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?56546'),
(70, 'Omnis dignissimos fugit eligendi.', 265, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?73071'),
(71, 'Porro quibusdam molestiae veniam.', 146, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?41158'),
(72, 'Amet a totam esse.', 478, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?63794'),
(73, 'Rerum iste nobis.', 950, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?20453'),
(74, 'Alias et perspiciatis id veniam.', 893, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?21079'),
(75, 'Quae quis suscipit minima vero.', 287, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?24969'),
(76, 'Quos perspiciatis doloremque non officiis.', 204, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?11455'),
(77, 'Officiis et.', 836, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?88972'),
(78, 'Ipsa ipsa suscipit excepturi ut.', 504, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?29510'),
(79, 'Tempora reiciendis cumque.', 721, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?98394'),
(80, 'Impedit quo.', 981, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?89909'),
(81, 'Iste possimus ab.', 381, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?39543'),
(82, 'Odit iste ratione.', 383, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?60477'),
(83, 'Repudiandae sunt vel pariatur facere.', 692, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?15042'),
(84, 'Qui eius sunt est.', 882, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?63833'),
(85, 'Accusantium tenetur aperiam.', 977, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?16297'),
(86, 'Nobis velit porro.', 528, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?92073'),
(87, 'Reprehenderit perferendis commodi.', 619, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?92005'),
(88, 'Est sunt et sed.', 99, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?55561'),
(89, 'Neque illum ab.', 171, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?43610'),
(90, 'Maxime quia quod deleniti.', 865, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?13572'),
(91, 'Nihil esse possimus.', 640, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?15463'),
(92, 'Ratione autem sed atque.', 438, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?63384'),
(93, 'Blanditiis sapiente velit.', 856, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?31259'),
(94, 'Cupiditate aut unde.', 927, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?30582'),
(95, 'Nostrum sed distinctio at.', 693, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?63127'),
(96, 'Minima accusamus aut.', 656, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?68785'),
(97, 'Deleniti harum et.', 462, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?52220'),
(98, 'Necessitatibus dolor qui ea minus.', 669, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?89825'),
(99, 'Vel ab.', 916, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?35299'),
(100, 'Aspernatur officiis adipisci eius.', 711, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?15979'),
(101, 'Quidem expedita quaerat est.', 977, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?45509'),
(102, 'Voluptatibus eaque numquam exercitationem.', 343, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?14059'),
(103, 'Natus expedita qui.', 272, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?73189'),
(104, 'Repudiandae ipsum nobis.', 447, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?79233'),
(105, 'Delectus dolor itaque dignissimos.', 438, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?42641'),
(106, 'Quis numquam fuga quisquam sit.', 50, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?77440'),
(107, 'Assumenda sed consequatur.', 104, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?52583'),
(108, 'Tenetur non ratione voluptatem.', 967, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?95860'),
(109, 'A veniam.', 99, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?80555'),
(110, 'Voluptatem rerum aliquid ad.', 460, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?88498'),
(111, 'Illum dignissimos odit.', 829, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?37201'),
(112, 'Voluptatem earum ipsam.', 511, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?75149'),
(113, 'Qui rem et vel.', 584, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?76136'),
(114, 'Expedita accusamus ut.', 366, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?18280'),
(115, 'Aperiam nihil ut omnis.', 232, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?39161'),
(116, 'Sint fugiat.', 641, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?73347'),
(117, 'Deleniti laudantium.', 607, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?76436'),
(118, 'Minima fuga cupiditate voluptatem.', 741, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?14035'),
(119, 'Labore sed consequuntur.', 598, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?77763'),
(120, 'Ipsam labore et repellat.', 959, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?32361'),
(121, 'Eius quam excepturi eligendi.', 464, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?18515'),
(122, 'Non quo ipsum et.', 321, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?55114'),
(123, 'Veritatis odit repellendus.', 926, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?82479'),
(124, 'Eius corrupti quos.', 211, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?53820'),
(125, 'Et enim.', 570, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?27781'),
(126, 'Praesentium ea necessitatibus.', 378, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?49431'),
(127, 'Eligendi hic ratione suscipit.', 554, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?17252'),
(128, 'Provident sunt molestiae ut.', 473, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?31751'),
(129, 'At totam similique.', 917, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?95033'),
(130, 'Minus qui quia.', 49, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?25655'),
(131, 'Sint est itaque dignissimos.', 213, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?75441'),
(132, 'Architecto blanditiis ipsa.', 708, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?94232'),
(133, 'Ut voluptas accusantium neque.', 70, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?63606'),
(134, 'Deleniti voluptatibus et.', 880, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?98759'),
(135, 'Non recusandae reprehenderit.', 624, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?82520'),
(136, 'Dolores doloribus quia quis.', 155, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?23343'),
(137, 'Similique quisquam dolorem.', 467, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?83928'),
(138, 'Dicta nisi ex sapiente.', 795, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?27767'),
(139, 'Sunt qui culpa ducimus.', 270, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?14675'),
(140, 'Est eos alias facere.', 80, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?14473'),
(141, 'Cum molestiae quaerat dolores.', 243, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?53893'),
(142, 'Est sint.', 180, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?34030'),
(143, 'Quas quaerat quam.', 844, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?33548'),
(144, 'Ut laudantium qui quia.', 635, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?77488'),
(145, 'Quidem quisquam iusto omnis.', 246, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?35430'),
(146, 'Repellendus nihil nulla.', 928, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?28800'),
(147, 'Ratione aut rem.', 602, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?67983'),
(148, 'Soluta libero illum.', 489, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?26227'),
(149, 'Quia atque aut laboriosam.', 332, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?90332'),
(150, 'Assumenda voluptate sequi qui libero.', 753, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?52232'),
(151, 'Et aliquam inventore.', 387, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?71382'),
(152, 'Similique maxime facere numquam.', 799, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?67209'),
(153, 'Facere vitae debitis.', 397, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?84645'),
(154, 'Ipsa illum nam ut.', 772, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?98919'),
(155, 'Quos tempore iure consequatur.', 253, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?31686'),
(156, 'Qui vel nesciunt eligendi.', 477, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?11946'),
(157, 'Aut explicabo ducimus autem.', 707, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?28991'),
(158, 'Molestiae repellendus voluptas facilis.', 806, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?99126'),
(159, 'Iure ut quasi.', 725, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?71100'),
(160, 'Qui animi placeat.', 66, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?75988'),
(161, 'Est laudantium est.', 528, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?98612'),
(162, 'Est veritatis reiciendis harum magnam.', 275, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?97873'),
(163, 'Et similique tempora amet.', 73, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?46805'),
(164, 'Suscipit rerum.', 556, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?38202'),
(165, 'Velit et veniam sed.', 210, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?56424'),
(166, 'Provident et.', 72, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?46543'),
(167, 'Laboriosam omnis nihil quae.', 321, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?13432'),
(168, 'Porro non ex magnam.', 657, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?33112'),
(169, 'Illum amet nihil ut.', 82, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?77902'),
(170, 'In autem.', 562, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?23187'),
(171, 'Ut ut ut.', 30, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?28988'),
(172, 'Qui qui tempore quisquam.', 371, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?23990'),
(173, 'Sint corrupti eveniet.', 996, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?29457'),
(174, 'Excepturi quo saepe.', 169, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?69000'),
(175, 'In magnam et.', 599, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?94611'),
(176, 'Expedita delectus fuga enim.', 387, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?81023'),
(177, 'Porro non dolorem maxime nulla.', 320, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?30955'),
(178, 'Id blanditiis dolores est ut.', 176, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?28424'),
(179, 'Natus dolorum.', 118, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?89164'),
(180, 'Incidunt eum.', 771, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?69408'),
(181, 'Repudiandae nesciunt quia minima.', 688, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?60698'),
(182, 'Culpa ut officia enim.', 615, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?82961'),
(183, 'Rem voluptatem voluptates aut.', 864, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?47542'),
(184, 'Animi animi voluptatem.', 752, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?75731'),
(185, 'Ut voluptatem.', 273, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?54856'),
(186, 'Dicta est voluptatum ut odit.', 653, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?94638'),
(187, 'Debitis libero et.', 775, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?29194'),
(188, 'Voluptas autem.', 819, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?14292'),
(189, 'Aliquam perferendis non.', 541, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?52235'),
(190, 'Voluptates repellat molestiae nam.', 440, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?82876'),
(191, 'Sequi ipsa cum provident.', 344, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?36849'),
(192, 'Illum nobis est qui repellendus.', 809, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?31050'),
(193, 'Odit harum alias.', 426, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?16259'),
(194, 'Reiciendis mollitia ipsam.', 43, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?37720'),
(195, 'Nihil ipsum quo pariatur.', 275, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?51824'),
(196, 'Dicta dolore accusantium enim.', 862, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?67275'),
(197, 'Accusantium autem fugit.', 268, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?15828'),
(198, 'Odio dolores maxime laudantium consectetur.', 871, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?48113'),
(199, 'Provident quo est.', 394, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?10713'),
(200, 'Dolorem quasi magni laborum.', 493, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?71141'),
(201, 'Modi est possimus.', 897, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?55106'),
(202, 'Quas iusto ipsam voluptas.', 847, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?39648'),
(203, 'Placeat voluptas qui.', 873, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?31774'),
(204, 'Repudiandae minus.', 443, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?40822'),
(205, 'Modi eum facere.', 913, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?39148'),
(206, 'Optio est error.', 405, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?56580'),
(207, 'Nemo non ipsum.', 921, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?52426'),
(208, 'Aut nihil at.', 541, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?93919'),
(209, 'At qui ut.', 681, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?28198'),
(210, 'Animi ducimus voluptates voluptatem.', 939, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?71868'),
(211, 'Accusantium est quidem.', 643, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?41042'),
(212, 'Rerum dolorum non ut.', 514, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?54449'),
(213, 'Itaque doloremque est hic.', 276, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?73625'),
(214, 'Architecto occaecati quibusdam.', 654, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?65222'),
(215, 'Quos deleniti vitae repellendus.', 134, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?89398'),
(216, 'Voluptate numquam rem nisi.', 16, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?54279'),
(217, 'Dicta est ut.', 862, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?90682'),
(218, 'A deleniti.', 561, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?58974'),
(219, 'Saepe enim nostrum.', 722, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?64130'),
(220, 'Vel ut adipisci.', 526, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?72582'),
(221, 'Unde repellendus nulla at.', 461, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?10580'),
(222, 'Assumenda commodi eius dolores.', 77, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?25782'),
(223, 'Aperiam recusandae similique aut.', 909, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?35261'),
(224, 'Quia necessitatibus tenetur laboriosam.', 697, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?82118'),
(225, 'Enim et impedit repellendus.', 693, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?52212'),
(226, 'Aut et et.', 190, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?40189'),
(227, 'Quia odio quo.', 61, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?26595'),
(228, 'Consequatur quod consequatur eos.', 934, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?60209'),
(229, 'Quas dolor et voluptate.', 69, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?37272'),
(230, 'Voluptatem dolorem necessitatibus.', 277, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?20094'),
(231, 'Quod atque blanditiis.', 447, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?29685'),
(232, 'Eligendi doloribus est id.', 374, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?68503'),
(233, 'Voluptatem ipsum et.', 342, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?85541'),
(234, 'Totam eum consequatur ex.', 736, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?68057'),
(235, 'Consequatur fugiat et aut.', 746, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?84227'),
(236, 'Necessitatibus in dolor vel.', 465, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?43620'),
(237, 'Odit quasi voluptas.', 703, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?29058'),
(238, 'Voluptatum dolorem architecto esse enim.', 523, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?98838'),
(239, 'Labore consectetur quia mollitia.', 579, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?17323'),
(240, 'Aut quidem nam.', 242, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?29911'),
(241, 'Fugiat est ut sint.', 789, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?71783'),
(242, 'Voluptatem voluptas voluptate omnis.', 503, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?37698'),
(243, 'Blanditiis fugit aut et.', 399, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?25110'),
(244, 'Explicabo ad qui rerum.', 598, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?41166'),
(245, 'Aliquid natus.', 858, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?66372'),
(246, 'Alias facilis itaque omnis cupiditate.', 138, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?58463'),
(247, 'Ad nulla.', 626, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?35396'),
(248, 'Odio cupiditate molestiae.', 676, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?13934'),
(249, 'Excepturi eveniet asperiores eveniet.', 944, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?43386'),
(250, 'Sed magnam voluptates cum.', 789, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?18948'),
(251, 'Occaecati sint soluta rem.', 798, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?91819'),
(252, 'Vitae dolorem vel.', 321, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?61288'),
(253, 'Illum quia consequatur porro.', 360, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?99456'),
(254, 'Quidem sint voluptas in.', 843, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?58906'),
(255, 'Natus aliquam consequatur commodi.', 430, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?62871'),
(256, 'Odit nemo repellendus.', 833, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?12558'),
(257, 'Sequi maiores molestiae.', 613, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?70686'),
(258, 'Aut et omnis.', 882, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?29830'),
(259, 'Est aperiam qui.', 354, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?67094'),
(260, 'Repellendus id perspiciatis.', 440, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?27991'),
(261, 'Est rem ut.', 843, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?25088'),
(262, 'Maiores dolorum repellendus reiciendis.', 918, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?34019'),
(263, 'Ipsa quaerat id.', 649, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?38506'),
(264, 'Aliquam laborum blanditiis sunt.', 729, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?75796'),
(265, 'Et voluptatem deserunt rerum.', 795, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?24713'),
(266, 'Unde nam recusandae consectetur.', 932, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?25300'),
(267, 'Qui illo ut quia.', 615, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?26662'),
(268, 'Omnis earum voluptatibus.', 124, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?15555'),
(269, 'Delectus aperiam rerum repellat.', 390, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?54013'),
(270, 'Vitae optio incidunt.', 980, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?79941'),
(271, 'Nesciunt impedit praesentium occaecati.', 659, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?42487'),
(272, 'Voluptatem repellendus numquam aut.', 976, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?95224'),
(273, 'Totam aut sunt molestias.', 252, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?84838'),
(274, 'Sed esse ea.', 633, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?60588'),
(275, 'Sunt consectetur cumque aut.', 568, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?20333'),
(276, 'Aut ad qui.', 702, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?51235'),
(277, 'Exercitationem tempora sapiente et.', 553, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?78801'),
(278, 'Ut tenetur odit explicabo.', 347, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?49281'),
(279, 'Qui ratione quia.', 841, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?48131'),
(280, 'Labore occaecati repellendus numquam.', 554, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?62343'),
(281, 'Autem sed inventore est.', 990, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?54548'),
(282, 'Quam nisi animi expedita.', 323, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?96261'),
(283, 'Voluptas ipsum optio.', 725, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?70355'),
(284, 'Iusto molestias officiis quo.', 294, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?37165'),
(285, 'Et et exercitationem repellendus.', 586, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?12408'),
(286, 'Nam id excepturi earum.', 155, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?33597'),
(287, 'Culpa eos nihil nesciunt.', 102, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?43607'),
(288, 'Cupiditate quisquam optio quod.', 673, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?84531'),
(289, 'Explicabo omnis.', 257, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?27112'),
(290, 'Quasi quisquam tempora in.', 751, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?48150'),
(291, 'Amet vitae nihil voluptas labore.', 481, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?31032'),
(292, 'Accusamus facilis unde eveniet sequi.', 39, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?43615'),
(293, 'Dolorem fuga non.', 353, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?61586'),
(294, 'Officiis ad eius labore.', 825, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?31327'),
(295, 'Natus est consequatur ut.', 136, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?87675'),
(296, 'Dolores voluptas officia quis.', 407, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?48223'),
(297, 'Et illo repellat.', 256, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?11586'),
(298, 'Voluptatem quaerat dolor.', 748, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?16137'),
(299, 'Qui itaque quod.', 600, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?99019'),
(300, 'Sapiente soluta est temporibus.', 587, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?93890'),
(301, 'Expedita ut.', 590, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?39915'),
(302, 'Eveniet sapiente sequi omnis.', 991, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?49359'),
(303, 'Corrupti quibusdam sed.', 883, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?67621'),
(304, 'Blanditiis ducimus in tempore.', 188, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?63249'),
(305, 'Delectus ratione sed.', 867, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?70461'),
(306, 'Est explicabo ipsum.', 890, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?92868'),
(307, 'Dicta cupiditate dolores est.', 612, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?21227'),
(308, 'A consectetur nemo.', 486, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?29468'),
(309, 'Voluptas dicta nostrum.', 628, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?78104'),
(310, 'Dolor veritatis delectus.', 578, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?81596'),
(311, 'Assumenda laudantium molestiae.', 827, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?75605'),
(312, 'Quidem error totam.', 164, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?14448'),
(313, 'Et harum laboriosam ut.', 563, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?17301'),
(314, 'Repellendus architecto et.', 54, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?44405'),
(315, 'Corporis vero sint qui.', 454, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?71771'),
(316, 'Provident sed nesciunt porro.', 468, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?41370'),
(317, 'Nobis ut quia.', 27, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?88381'),
(318, 'Iure ullam quo officiis.', 434, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?48930'),
(319, 'Voluptates iure asperiores quidem atque.', 506, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?49117'),
(320, 'Dignissimos distinctio provident et.', 423, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?17130'),
(321, 'Velit dignissimos.', 718, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?80675'),
(322, 'Cupiditate enim rem a amet.', 33, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?79783'),
(323, 'Error et dolor et necessitatibus.', 200, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?85603'),
(324, 'Quis magnam consequuntur.', 719, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?97487'),
(325, 'Eaque maxime ut.', 312, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?24256'),
(326, 'Molestias ex laborum.', 707, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?91872'),
(327, 'Earum veritatis quia placeat.', 202, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?61264'),
(328, 'Delectus ut ut dignissimos reprehenderit.', 672, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?81473'),
(329, 'Ut sequi pariatur.', 138, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?36010'),
(330, 'Nostrum hic.', 593, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?57793'),
(331, 'Veritatis similique minus nesciunt.', 11, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?82604'),
(332, 'Et voluptates ut minima fuga.', 849, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?68285'),
(333, 'Quo omnis libero.', 139, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?94120'),
(334, 'Aliquam non iure.', 429, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?48943'),
(335, 'Aut vel eos eveniet.', 657, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?13346'),
(336, 'Fugiat cupiditate deleniti reprehenderit consequatur.', 666, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?96335'),
(337, 'Ex reprehenderit pariatur.', 324, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?76775'),
(338, 'Ut excepturi et.', 482, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?97095'),
(339, 'Non non quia.', 611, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?93395'),
(340, 'Numquam et numquam earum.', 479, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?93829'),
(341, 'Voluptatum tenetur dicta voluptatum est.', 809, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?44462'),
(342, 'Non rem rerum.', 187, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?62851'),
(343, 'Accusamus enim in.', 541, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?99398'),
(344, 'Dolorum itaque sed et.', 159, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?67738'),
(345, 'Reiciendis voluptatem cumque.', 658, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?96002'),
(346, 'Et animi magni laboriosam.', 962, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?85308'),
(347, 'Velit aut velit.', 655, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?82097'),
(348, 'Quod similique.', 320, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?26599'),
(349, 'Velit cumque est iusto.', 414, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?91298'),
(350, 'Tempore nam alias amet nemo.', 239, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?45392'),
(351, 'Neque est aperiam.', 437, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?42228'),
(352, 'Accusantium cum deserunt quia.', 937, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?95224'),
(353, 'Velit quia sit ipsum.', 857, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?18637'),
(354, 'Deleniti nostrum iste dolores.', 491, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?21823'),
(355, 'Magnam nostrum soluta perferendis.', 892, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?14571'),
(356, 'Et est ut quo.', 534, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?15279'),
(357, 'Et optio voluptas.', 31, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?62446'),
(358, 'Fugiat consequatur libero et.', 987, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?70510'),
(359, 'Dolorum iure.', 546, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?44705'),
(360, 'Magni a.', 973, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?77186'),
(361, 'Corporis doloremque consectetur iste.', 370, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?43164'),
(362, 'Exercitationem aut non laborum.', 145, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?62895'),
(363, 'Aut et hic beatae perspiciatis.', 331, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?96143'),
(364, 'Aperiam laborum provident.', 516, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?17877'),
(365, 'Dolorem optio exercitationem magnam.', 207, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?85539'),
(366, 'Consequatur nostrum.', 150, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?25530'),
(367, 'Molestias deleniti doloribus.', 560, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?23795'),
(368, 'Ut eos odio.', 784, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?89149'),
(369, 'Et voluptatem quia nihil.', 304, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?60071'),
(370, 'Commodi facilis minus nemo.', 768, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?47427'),
(371, 'Quos maiores perferendis qui voluptatum.', 393, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?68889'),
(372, 'Autem molestiae ullam.', 885, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?77998'),
(373, 'Rerum perspiciatis nesciunt ea.', 93, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?24007'),
(374, 'Non aliquam ipsam ipsum.', 425, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?41206'),
(375, 'Eos voluptatem sit.', 499, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?21997'),
(376, 'Quis assumenda.', 293, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?87986'),
(377, 'Qui perspiciatis veniam laudantium.', 354, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?74934'),
(378, 'Sit qui eveniet dolorem.', 799, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?47969'),
(379, 'Dolor nisi consequuntur.', 684, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?95643'),
(380, 'Ut alias quam.', 758, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?17227'),
(381, 'Et sit.', 760, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?33080'),
(382, 'Eum molestiae nihil.', 649, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?53589'),
(383, 'Reprehenderit sed rerum non magnam.', 871, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?44596'),
(384, 'Consequatur odio dolores id.', 208, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?47205'),
(385, 'Ipsum dolorem.', 896, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?41575'),
(386, 'Nemo accusamus quas non.', 78, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?70338'),
(387, 'Porro repellat minima asperiores.', 844, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?29529'),
(388, 'Temporibus id in.', 36, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?50081'),
(389, 'Aut vel animi expedita.', 274, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?60984'),
(390, 'Omnis cupiditate dolor error.', 804, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?69195'),
(391, 'Et tenetur quia.', 213, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?88161'),
(392, 'Excepturi autem ut.', 419, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?40364'),
(393, 'Rerum occaecati.', 606, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?24663'),
(394, 'Aut eligendi quaerat.', 169, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?16008'),
(395, 'Voluptates eveniet quis.', 493, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?65256'),
(396, 'Sit aut aliquam odio doloribus.', 193, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?85505'),
(397, 'Et nobis commodi corporis.', 287, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?12784'),
(398, 'Corrupti modi est sed.', 895, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?99675'),
(399, 'Expedita rerum ut.', 799, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?66924'),
(400, 'Explicabo eum aut.', 131, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?35220'),
(401, 'Aut enim fugiat.', 91, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?57342'),
(402, 'Ut quis autem.', 727, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?29412'),
(403, 'Animi optio.', 292, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?19816'),
(404, 'Nihil voluptatem dolorem consequatur.', 651, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?59282'),
(405, 'Ea repellendus nulla.', 581, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?44918'),
(406, 'Rerum eius rerum ipsam corrupti.', 248, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?96111'),
(407, 'Sed sed eaque.', 80, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?22180'),
(408, 'In quos facilis autem sunt.', 644, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?80945'),
(409, 'Totam eos dolor.', 231, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?12209'),
(410, 'Officiis consectetur facere.', 746, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?93553'),
(411, 'Adipisci incidunt commodi culpa.', 272, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?37682'),
(412, 'Quisquam facilis unde.', 917, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?14126'),
(413, 'Dolorem qui molestiae.', 348, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?72542'),
(414, 'Tenetur commodi ea eum.', 430, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?99591'),
(415, 'Perspiciatis laboriosam.', 713, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?16347'),
(416, 'Deserunt ex similique voluptatem.', 204, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?40742'),
(417, 'In itaque molestiae consequatur.', 986, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?21523'),
(418, 'Perspiciatis alias.', 79, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?56295'),
(419, 'Vel aspernatur dolores porro.', 170, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?14009'),
(420, 'Facere ea ea optio.', 302, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?31505'),
(421, 'Nihil et expedita quia vel.', 670, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?20084'),
(422, 'Autem possimus quo.', 758, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?31656'),
(423, 'Quia quibusdam.', 533, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?74513'),
(424, 'Debitis eum eveniet ipsam.', 56, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?74648'),
(425, 'Repudiandae aut nesciunt.', 714, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?71531'),
(426, 'Quia quibusdam laborum velit.', 546, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?90782'),
(427, 'Aperiam sed ratione.', 385, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?32182'),
(428, 'Similique similique maxime eos.', 967, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?35415'),
(429, 'Modi qui omnis sit.', 408, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?53813'),
(430, 'Velit quas et.', 528, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?76397'),
(431, 'Nemo dolorem ullam debitis.', 680, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?49947'),
(432, 'Fugiat quia.', 560, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?37669'),
(433, 'Quibusdam quas voluptas.', 139, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?50728'),
(434, 'Deserunt voluptatem a.', 470, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?39032'),
(435, 'Provident et cum qui.', 732, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?42279'),
(436, 'Quo et tempore.', 705, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?89786'),
(437, 'Dignissimos et minima iusto.', 574, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?95550'),
(438, 'Commodi qui voluptas ex est.', 356, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?25010'),
(439, 'Ea molestias eum.', 253, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?68668'),
(440, 'Autem id.', 289, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?27299'),
(441, 'Quaerat quis quod.', 150, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?52693'),
(442, 'Eius ducimus magnam.', 532, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?58603'),
(443, 'Cumque voluptatem unde.', 352, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?30559'),
(444, 'Iure autem adipisci.', 61, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?28870'),
(445, 'Error in ab ratione.', 459, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?66888'),
(446, 'Et et qui corrupti.', 766, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?21124'),
(447, 'Saepe corporis repudiandae est.', 128, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?54587'),
(448, 'Voluptate illo porro rerum.', 548, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?17432'),
(449, 'Aliquid ut facere.', 839, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?47628'),
(450, 'Libero omnis voluptas et commodi.', 736, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?98408'),
(451, 'Consequatur dicta aut.', 625, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?41153'),
(452, 'Quia et illo.', 169, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?24008'),
(453, 'Velit non deserunt.', 647, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?87423'),
(454, 'Doloremque saepe possimus distinctio.', 301, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?26064'),
(455, 'Adipisci et minus.', 811, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?55674'),
(456, 'Voluptatum at omnis.', 994, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?49441'),
(457, 'Quod aperiam dolores qui.', 377, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?66340'),
(458, 'In beatae ipsa sapiente.', 521, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?43797'),
(459, 'Autem sit.', 995, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?96883'),
(460, 'Eveniet voluptas rerum.', 173, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?49006'),
(461, 'Ex tempora ut dolorem.', 933, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?81675'),
(462, 'Velit sunt nemo.', 529, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?45758'),
(463, 'Cum tempora molestias similique.', 811, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?28971'),
(464, 'Alias suscipit.', 351, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?41390'),
(465, 'Sequi excepturi enim.', 605, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?91161'),
(466, 'Vel vel.', 390, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?37937'),
(467, 'Et suscipit.', 778, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?28476'),
(468, 'Asperiores dolor voluptatibus nam.', 696, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?80304'),
(469, 'Ratione nulla quaerat earum.', 573, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?87817'),
(470, 'Non beatae et ea.', 675, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?40583'),
(471, 'Voluptates ad possimus.', 528, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?12288'),
(472, 'Est quod dolorum incidunt.', 562, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?39917'),
(473, 'Delectus architecto distinctio veniam.', 829, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?35137'),
(474, 'Dolores ut debitis.', 157, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?17605'),
(475, 'Et explicabo ad fugit.', 783, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?13063'),
(476, 'Iure sit ducimus.', 931, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?94656'),
(477, 'Dicta dolorem blanditiis quidem.', 108, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?37631'),
(478, 'Architecto qui.', 966, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?78707'),
(479, 'Quo esse minus et.', 981, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?84648'),
(480, 'Ut eum cupiditate necessitatibus.', 261, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?38484'),
(481, 'Ut deleniti assumenda rerum.', 782, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?80687'),
(482, 'Rerum quia modi voluptatem.', 754, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?95621'),
(483, 'Molestiae et error et.', 727, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?36342');
INSERT INTO `produit` (`idProd`, `nomProd`, `prixU`, `idCategorie`, `dateAjout`, `dateModif`, `idU`, `etat`, `imageProd`) VALUES
(484, 'Eum alias autem tempora possimus.', 148, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?42272'),
(485, 'Sit et saepe.', 355, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?99926'),
(486, 'Cumque dignissimos similique.', 217, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?14441'),
(487, 'Odit tempora atque.', 929, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?64075'),
(488, 'Voluptates accusantium ipsam quia.', 375, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?23525'),
(489, 'Non adipisci nam quia.', 275, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?23025'),
(490, 'Sint nulla rerum.', 518, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?35564'),
(491, 'Velit reprehenderit id neque.', 828, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?47480'),
(492, 'Ea dolor rem.', 586, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?14525'),
(493, 'In odio cupiditate.', 492, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?89659'),
(494, 'Qui dolorem vero non explicabo.', 925, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?83294'),
(495, 'Consequatur est quos harum.', 422, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?38510'),
(496, 'Nulla nisi ea.', 378, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?11454'),
(497, 'Ut est esse in.', 688, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?41972'),
(498, 'Natus reprehenderit reprehenderit ut facilis.', 657, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?69758'),
(499, 'Qui aut voluptates.', 131, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?45155'),
(500, 'Voluptatem dolor sequi rerum.', 205, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?82680'),
(501, 'Odio magni expedita nulla doloribus.', 458, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?97027'),
(502, 'Atque consequuntur est.', 995, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?65205'),
(503, 'Sit et.', 56, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?95176'),
(504, 'Voluptas quis.', 841, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?61873'),
(505, 'Id nesciunt qui.', 909, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?87358'),
(506, 'Doloremque neque.', 772, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?44366'),
(507, 'Vel sed aut sed.', 29, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?84263'),
(508, 'Sit quisquam.', 237, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?17163'),
(509, 'Et eum optio voluptatem neque.', 181, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?34483'),
(510, 'Rerum provident labore.', 319, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?90699'),
(511, 'Natus et quae.', 209, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?20984'),
(512, 'Minima dolorum sequi.', 465, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?67546'),
(513, 'Harum quasi et.', 76, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?84475'),
(514, 'Voluptatem id explicabo ab.', 542, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?11764'),
(515, 'Voluptate libero quo optio.', 167, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?64389'),
(516, 'Nulla est omnis.', 147, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?65440'),
(517, 'Et in possimus est.', 378, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?55003'),
(518, 'Repellendus voluptatem consequatur.', 215, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?84190'),
(519, 'Cum unde dolore et.', 177, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?77417'),
(520, 'Maiores nobis.', 371, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?75027'),
(521, 'Distinctio ut non nostrum error.', 553, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?31843'),
(522, 'Nam enim ut sapiente.', 986, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?78809'),
(523, 'Dolor ab dolor.', 911, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?28655'),
(524, 'Sit ut impedit ea.', 282, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?22161'),
(525, 'Odio quia ut magnam.', 646, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?69996'),
(526, 'Doloribus est et molestias.', 427, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?71897'),
(527, 'Non voluptates.', 631, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?85948'),
(528, 'Voluptatem minus unde ut.', 628, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?14202'),
(529, 'Accusamus qui molestias sint.', 491, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?42530'),
(530, 'Et numquam tempore.', 894, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?42712'),
(531, 'Quia alias.', 891, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?60731'),
(532, 'Ipsum vitae vel.', 461, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?74061'),
(533, 'Quia ipsam.', 190, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?45174'),
(534, 'Dolor quo praesentium magnam.', 943, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?66540'),
(535, 'Commodi assumenda.', 804, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?22790'),
(536, 'Est minus quaerat ab.', 740, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?57822'),
(537, 'Ut in dolores minima.', 846, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?95858'),
(538, 'Fugiat mollitia.', 925, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?18884'),
(539, 'Officia autem illo.', 939, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?49219'),
(540, 'Voluptas in illum.', 125, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?10489'),
(541, 'Totam totam beatae est.', 981, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?45341'),
(542, 'Quod eum ducimus.', 213, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?74033'),
(543, 'Iste natus rerum.', 654, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?91594'),
(544, 'Dolorum facere.', 548, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?66926'),
(545, 'Possimus numquam quibusdam vero.', 551, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?36667'),
(546, 'Cupiditate dolorem qui velit velit.', 39, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?95053'),
(547, 'Veniam vel rem impedit.', 410, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?42875'),
(548, 'Ipsa tenetur voluptatem corrupti.', 724, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?94532'),
(549, 'Est quo suscipit.', 500, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?47963'),
(550, 'Autem velit ipsam explicabo.', 755, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?45945'),
(551, 'Est quisquam saepe aliquam maxime.', 776, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?13590'),
(552, 'Aspernatur non.', 818, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?69055'),
(553, 'Neque sint quis deleniti.', 527, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?85633'),
(554, 'Itaque perferendis cupiditate dolor.', 755, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?34146'),
(555, 'Molestiae et dolor molestiae consequatur.', 721, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?42280'),
(556, 'Tempora neque dolore fugit.', 101, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?63415'),
(557, 'Error qui enim dolor.', 556, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?22322'),
(558, 'Sunt incidunt ipsum.', 876, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?93910'),
(559, 'Totam dolorem dignissimos.', 999, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?39555'),
(560, 'Esse impedit ut commodi.', 129, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?63306'),
(561, 'Cupiditate amet sit.', 343, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?95974'),
(562, 'A praesentium iure.', 777, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?78995'),
(563, 'Sit quo odit sint.', 700, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?16837'),
(564, 'Dolores enim pariatur.', 936, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?10247'),
(565, 'Voluptatem tempore ut.', 739, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?78537'),
(566, 'Magni consectetur adipisci.', 956, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?40800'),
(567, 'Omnis qui.', 286, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?79710'),
(568, 'Aliquam et et illo.', 327, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?71108'),
(569, 'At eaque rerum.', 674, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?44677'),
(570, 'Aut expedita eum eaque.', 774, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?23270'),
(571, 'Rerum quia culpa eius.', 243, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?70946'),
(572, 'Iusto vitae vero non.', 881, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?59596'),
(573, 'Provident est culpa.', 21, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?71474'),
(574, 'Unde expedita totam.', 653, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?93251'),
(575, 'Ratione et eos quae.', 34, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?44636'),
(576, 'Nulla harum et.', 362, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?46153'),
(577, 'Tempore dolore dicta.', 697, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?44299'),
(578, 'Tenetur et perspiciatis nihil.', 856, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?13546'),
(579, 'Esse et vero nemo.', 110, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?75421'),
(580, 'Cumque dolore quia quam.', 53, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?90918'),
(581, 'Et fuga cum quam.', 890, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?27215'),
(582, 'Porro culpa ea totam rem.', 772, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?21548'),
(583, 'Est ullam ut.', 741, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?90481'),
(584, 'Iure magni eaque temporibus.', 41, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?15964'),
(585, 'Suscipit deserunt dicta.', 653, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?45799'),
(586, 'Voluptate laborum.', 647, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?50695'),
(587, 'Soluta blanditiis nihil perspiciatis totam.', 184, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?27960'),
(588, 'Harum qui recusandae non.', 308, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?12604'),
(589, 'Optio et omnis quisquam in.', 917, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?77681'),
(590, 'Quo adipisci tenetur.', 264, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?58861'),
(591, 'Veritatis autem aliquid.', 306, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?29503'),
(592, 'Asperiores quidem quam commodi.', 29, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?85460'),
(593, 'Illo recusandae.', 116, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?28968'),
(594, 'Reiciendis qui accusantium quasi.', 338, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?68321'),
(595, 'Aut in itaque.', 708, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?42299'),
(596, 'Sit labore saepe.', 426, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?69754'),
(597, 'Aliquid vero nesciunt nostrum eligendi.', 479, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?22791'),
(598, 'Deserunt molestiae excepturi.', 420, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?63215'),
(599, 'Quisquam voluptas quia.', 428, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?34510'),
(600, 'Facilis consequatur magnam sit quos.', 322, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?62615'),
(601, 'Sed esse aut labore aut.', 408, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?87178'),
(602, 'Ratione corporis suscipit.', 917, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?51068'),
(603, 'Labore dolor enim cupiditate.', 502, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?26889'),
(604, 'Molestiae ea eaque.', 586, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?49846'),
(605, 'Consequatur est consequatur non.', 646, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?50984'),
(606, 'Ut et praesentium odio qui.', 338, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?41612'),
(607, 'Sit corporis aut temporibus.', 905, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?33956'),
(608, 'Qui in libero atque aperiam.', 476, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?98291'),
(609, 'Officia facilis est.', 866, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?42899'),
(610, 'Consectetur ratione aut.', 246, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?90067'),
(611, 'Eos veritatis autem voluptatem.', 891, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?40251'),
(612, 'Quis quo aut qui.', 616, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?80552'),
(613, 'Ab quibusdam voluptatem repudiandae.', 10, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?73836'),
(614, 'Est aspernatur assumenda alias.', 220, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?11507'),
(615, 'Ad veritatis fugiat non.', 412, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?89285'),
(616, 'In et aut repellat.', 596, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?27675'),
(617, 'Excepturi quae soluta.', 926, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?74411'),
(618, 'Quisquam alias eum.', 299, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?68886'),
(619, 'Deserunt modi blanditiis.', 527, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?34664'),
(620, 'A perferendis possimus aut.', 403, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?80828'),
(621, 'Id et consequuntur accusantium.', 459, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?21197'),
(622, 'Culpa expedita minima doloribus quo.', 675, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?48005'),
(623, 'Animi sunt atque reiciendis et.', 463, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?94947'),
(624, 'Quibusdam architecto est sapiente.', 703, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?51722'),
(625, 'Asperiores commodi molestias.', 269, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?62959'),
(626, 'Perspiciatis dolores esse.', 265, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?50727'),
(627, 'Corrupti sed ipsum.', 603, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?85518'),
(628, 'Repellendus minima et.', 79, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?44256'),
(629, 'Est hic expedita odit.', 996, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?50817'),
(630, 'Ratione sint nihil.', 254, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?28460'),
(631, 'Cumque eos fugiat.', 164, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?66215'),
(632, 'Deserunt velit.', 777, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?79181'),
(633, 'Ipsum ut sequi.', 823, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?60802'),
(634, 'Voluptatibus exercitationem dicta ut quia.', 406, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?79872'),
(635, 'Et nesciunt sit porro.', 24, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?13053'),
(636, 'Aut est repellendus quia.', 561, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?97358'),
(637, 'Et qui ratione.', 685, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?13133'),
(638, 'Consectetur perferendis tempore.', 727, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?43160'),
(639, 'Perspiciatis incidunt minima.', 522, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?69247'),
(640, 'Ullam quis voluptas.', 169, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?43191'),
(641, 'Error qui veniam consectetur et.', 851, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?70393'),
(642, 'Ut ut et.', 963, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?36915'),
(643, 'Ratione necessitatibus accusamus.', 24, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?27641'),
(644, 'Dolorem non omnis porro.', 677, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?21590'),
(645, 'Et quas maiores unde.', 210, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?89388'),
(646, 'Est ad molestiae autem.', 262, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?32058'),
(647, 'Eum ut a impedit.', 668, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?83573'),
(648, 'Dicta quia architecto sint.', 418, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?45442'),
(649, 'Error tempora velit.', 697, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?20426'),
(650, 'Similique dignissimos et qui voluptatem.', 227, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?17135'),
(651, 'Aspernatur quibusdam quisquam.', 542, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?65993'),
(652, 'Ea aspernatur aliquam.', 547, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?41170'),
(653, 'Amet id.', 615, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?58165'),
(654, 'Dolores suscipit neque.', 466, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?40152'),
(655, 'Velit ea atque.', 822, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?25148'),
(656, 'Quas at omnis qui.', 260, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?69561'),
(657, 'Reprehenderit saepe aspernatur ullam.', 766, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?29838'),
(658, 'Culpa enim nostrum sequi voluptatem.', 112, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?34335'),
(659, 'Ut aut totam.', 496, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?48025'),
(660, 'Iusto et.', 171, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?51213'),
(661, 'Ad laboriosam illum quia.', 485, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?85484'),
(662, 'Numquam voluptas tenetur vero quia.', 983, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?79979'),
(663, 'Sed sint ipsam dolores.', 781, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?55103'),
(664, 'Omnis sit neque.', 693, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?95328'),
(665, 'Fuga eveniet eveniet maiores.', 514, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?68805'),
(666, 'Sed voluptatibus temporibus.', 11, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?15619'),
(667, 'Vero earum quae.', 253, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?64032'),
(668, 'Vero dolor sunt.', 648, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?42253'),
(669, 'Rerum iste beatae quis.', 557, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?61557'),
(670, 'Quos est dolor cum.', 852, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?88754'),
(671, 'Mollitia culpa.', 431, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?87009'),
(672, 'Nemo magni neque fugiat.', 758, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?36624'),
(673, 'Et ut quam.', 711, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?60159'),
(674, 'Voluptatum mollitia aut.', 637, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?46492'),
(675, 'Et repellat.', 502, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?81978'),
(676, 'Dolores aut nesciunt et.', 562, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?71818'),
(677, 'Et tempore.', 915, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?54658'),
(678, 'Accusamus ipsum qui.', 57, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?31702'),
(679, 'Esse et aut.', 557, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?69918'),
(680, 'Illo architecto et.', 762, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?44371'),
(681, 'Cupiditate architecto voluptas est.', 470, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?90250'),
(682, 'Tempora voluptatibus magni.', 635, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?96180'),
(683, 'Aut fuga qui sed.', 316, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?81410'),
(684, 'Dignissimos saepe doloribus magni.', 174, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?51655'),
(685, 'Sequi beatae ducimus quis unde.', 956, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?44249'),
(686, 'Vitae est voluptatem porro.', 448, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?60032'),
(687, 'Sed at dolor facilis.', 973, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?27284'),
(688, 'Quasi sunt sit aut.', 120, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?88570'),
(689, 'Et id necessitatibus maiores.', 911, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?34646'),
(690, 'Ex aut ea hic.', 834, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?51354'),
(691, 'Voluptas eos sit.', 855, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?80618'),
(692, 'Autem amet doloribus veritatis voluptatem.', 763, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?80291'),
(693, 'Aut id sed iusto.', 472, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?38938'),
(694, 'Ipsam ipsum eveniet.', 236, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?55299'),
(695, 'Repellat officia dolorem.', 737, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?35949'),
(696, 'Mollitia ullam ipsa.', 812, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?88136'),
(697, 'Minima in recusandae nobis.', 243, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?54721'),
(698, 'Tempora vero ut.', 927, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?63792'),
(699, 'Labore et eum.', 33, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?83155'),
(700, 'Et et in nobis.', 424, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?54247'),
(701, 'Non ea illum.', 527, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?84591'),
(702, 'Voluptatem quia adipisci illo qui.', 388, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?96650'),
(703, 'Tempora quam ab asperiores.', 207, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?93285'),
(704, 'At odio et.', 15, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?24638'),
(705, 'Possimus non.', 330, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?88424'),
(706, 'Ullam quas impedit.', 285, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?40525'),
(707, 'Sapiente qui autem.', 815, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?14502'),
(708, 'Quo voluptatum mollitia.', 268, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?54802'),
(709, 'Sapiente voluptatibus ea.', 361, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?12733'),
(710, 'Itaque corporis ipsum.', 744, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?75868'),
(711, 'Quis suscipit sunt aliquid.', 956, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?95501'),
(712, 'Quasi doloribus sit ad ex.', 427, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?45152'),
(713, 'Repellat blanditiis et.', 341, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?82772'),
(714, 'Inventore veniam.', 329, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?97335'),
(715, 'Animi neque fugiat.', 68, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?97615'),
(716, 'Neque accusantium minima debitis.', 825, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?74683'),
(717, 'Vel nulla consectetur.', 362, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?89996'),
(718, 'Modi animi eum.', 146, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?84613'),
(719, 'Reiciendis cumque voluptatem.', 185, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?37723'),
(720, 'Laborum qui.', 825, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?44209'),
(721, 'Maxime distinctio aspernatur.', 713, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?94741'),
(722, 'Eius rerum culpa.', 271, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?53828'),
(723, 'Beatae qui neque nulla.', 250, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?47733'),
(724, 'Sit voluptas occaecati modi et.', 760, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?12636'),
(725, 'Aut quia molestiae.', 348, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?47605'),
(726, 'Molestias omnis voluptatem.', 329, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?41636'),
(727, 'Et at eos.', 534, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?97686'),
(728, 'Dolor magni ea.', 853, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?82459'),
(729, 'Sit fugiat aut.', 116, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?26777'),
(730, 'Aliquam fugiat corrupti quia.', 215, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?68422'),
(731, 'Suscipit voluptatem ut pariatur.', 840, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?57560'),
(732, 'Cupiditate tempore autem.', 159, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?91917'),
(733, 'Placeat ut est.', 182, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?23558'),
(734, 'Fuga ipsa voluptas.', 283, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?20788'),
(735, 'Et ex saepe aut.', 441, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?50104'),
(736, 'Fugiat magni dolorem atque.', 940, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?28684'),
(737, 'Eum et sint.', 828, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?73417'),
(738, 'Veniam doloribus eum eum.', 465, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?72955'),
(739, 'Quia tenetur quasi natus natus.', 241, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?77897'),
(740, 'Et mollitia magni.', 362, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?73438'),
(741, 'Fugit quia ratione.', 534, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?95503'),
(742, 'Molestiae magnam autem.', 803, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?20186'),
(743, 'Eveniet quos qui.', 87, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?29024'),
(744, 'Veniam architecto nihil.', 64, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?50201'),
(745, 'Praesentium saepe quos.', 642, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?78442'),
(746, 'Ea consequatur omnis sit.', 895, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?34082'),
(747, 'Commodi ut et dolorem.', 232, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?94738'),
(748, 'Mollitia quis sint facere.', 222, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?80422'),
(749, 'Enim commodi reiciendis nobis doloribus.', 921, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?79777'),
(750, 'Sint velit facilis pariatur.', 770, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?86772'),
(751, 'Recusandae tempora molestiae.', 318, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?30045'),
(752, 'Qui unde quod sed.', 892, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?88626'),
(753, 'Odit atque eum ut.', 20, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?15921'),
(754, 'Enim repellendus eligendi nulla quia.', 158, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?77072'),
(755, 'Itaque esse voluptas.', 17, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?39602'),
(756, 'Saepe perspiciatis corporis mollitia.', 877, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?59257'),
(757, 'Consequuntur autem rem quas.', 730, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?69574'),
(758, 'Id est ipsa quas.', 829, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?15036'),
(759, 'Dignissimos dolorem dicta aliquam aut.', 969, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?42715'),
(760, 'Provident vero voluptatem.', 350, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?99352'),
(761, 'Totam est non.', 804, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?70869'),
(762, 'Possimus omnis sit.', 710, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?94140'),
(763, 'Vel illum consectetur quae.', 709, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?57891'),
(764, 'Voluptatem ut esse minima.', 572, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?29375'),
(765, 'Ut cum sit quo voluptas.', 372, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?72420'),
(766, 'Aut sit voluptas omnis.', 918, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?64274'),
(767, 'Et nostrum tempore.', 331, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?88183'),
(768, 'Sit et assumenda est.', 713, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?76163'),
(769, 'In ex rerum.', 166, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?47011'),
(770, 'Velit at amet quam.', 992, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?85667'),
(771, 'Cupiditate ratione sed inventore.', 359, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?92773'),
(772, 'Nulla non fuga.', 562, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?45275'),
(773, 'Sapiente id et ea.', 628, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?21375'),
(774, 'Asperiores voluptatem autem et.', 912, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?29109'),
(775, 'Natus enim exercitationem ut.', 379, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?62539'),
(776, 'Odit non reiciendis nam.', 692, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?45176'),
(777, 'Rerum ut tempora reiciendis.', 771, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?20887'),
(778, 'Recusandae et aut animi.', 974, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?99676'),
(779, 'Sint est et beatae.', 822, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?12133'),
(780, 'Rem esse quidem fugiat sapiente.', 643, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?27129'),
(781, 'Quaerat esse error quos.', 529, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?34798'),
(782, 'Id molestiae dolore.', 543, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?46192'),
(783, 'Necessitatibus enim dolores.', 913, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?64699'),
(784, 'Provident quia accusamus.', 110, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?70133'),
(785, 'At voluptatem quibusdam nesciunt quas.', 512, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?31074'),
(786, 'Aut iste corporis magnam ipsum.', 789, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?33175'),
(787, 'Voluptas eum sint maiores.', 829, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?68567'),
(788, 'Laborum officiis tenetur eum.', 383, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?26632'),
(789, 'Aut itaque nihil.', 935, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?11105'),
(790, 'Voluptatem officia.', 959, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?25580'),
(791, 'Dolor quo quaerat.', 336, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?40981'),
(792, 'Fugiat et quis impedit.', 184, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?50364'),
(793, 'Et ducimus recusandae.', 18, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?48603'),
(794, 'Magni molestiae quia.', 961, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?44968'),
(795, 'Est cupiditate quae.', 481, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?53003'),
(796, 'Voluptates modi mollitia suscipit.', 91, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?78287'),
(797, 'Vel sed aut earum.', 765, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?26453'),
(798, 'Corrupti aliquid omnis.', 485, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?17238'),
(799, 'Nobis vel et quo.', 121, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?66989'),
(800, 'Qui dolorem enim iusto nobis.', 891, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?82656'),
(801, 'Similique vel vitae commodi.', 278, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?42682'),
(802, 'Doloribus enim.', 742, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?17101'),
(803, 'Voluptatem omnis ab et odit.', 878, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?63158'),
(804, 'Ut distinctio est doloribus possimus.', 312, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?78943'),
(805, 'Quis laboriosam quia autem.', 580, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?40598'),
(806, 'Optio et adipisci.', 965, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?35650'),
(807, 'Voluptas voluptatum id rerum.', 963, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?42401'),
(808, 'Qui quis aliquid ad.', 541, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?96890'),
(809, 'Sunt et aut.', 14, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?34462'),
(810, 'Et dicta repellat.', 374, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?74700'),
(811, 'Voluptatem aut non.', 689, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?27481'),
(812, 'Dolorum molestiae voluptatem sequi.', 908, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?59990'),
(813, 'Voluptatum qui nihil.', 889, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?85307'),
(814, 'Non et ea repellendus.', 629, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?54723'),
(815, 'Excepturi qui enim.', 502, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?78037'),
(816, 'Tempore aliquam totam enim.', 64, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?48311'),
(817, 'Non qui.', 871, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?89664'),
(818, 'Aperiam sequi saepe sint.', 22, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?87708'),
(819, 'Id qui qui.', 174, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?37167'),
(820, 'Quod fugit soluta optio maxime.', 713, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?97782'),
(821, 'Voluptates iure id culpa.', 253, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?21672'),
(822, 'Libero itaque officia dolorem.', 840, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?93197'),
(823, 'Accusantium sed provident.', 251, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?34202'),
(824, 'Aperiam vitae ipsa aspernatur.', 897, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?24322'),
(825, 'Explicabo iusto pariatur nulla.', 313, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?83522'),
(826, 'Illo labore iste est.', 703, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?95870'),
(827, 'Consequuntur eius quos perferendis.', 115, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?46726'),
(828, 'Architecto culpa in odit.', 552, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?70895'),
(829, 'Eum doloribus reiciendis.', 202, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?89861'),
(830, 'Sit rem et.', 663, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?79731'),
(831, 'Quia omnis.', 419, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?95988'),
(832, 'Aut ipsum laborum iusto.', 992, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?34370'),
(833, 'Non eligendi possimus.', 162, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?22534'),
(834, 'Enim aut facilis vel.', 525, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?54996'),
(835, 'Hic qui atque.', 521, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?26757'),
(836, 'Esse atque.', 340, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?92951'),
(837, 'Blanditiis sit natus.', 73, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?39790'),
(838, 'Ea quia quia quibusdam.', 413, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?52719'),
(839, 'Animi pariatur enim facilis.', 760, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?23734'),
(840, 'Debitis et qui.', 48, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?66588'),
(841, 'Est dolor nemo eaque.', 614, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?39817'),
(842, 'Esse illo labore asperiores nihil.', 195, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?35794'),
(843, 'Velit cumque voluptas consequatur dicta.', 970, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?17002'),
(844, 'Expedita a quo et.', 786, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?74968'),
(845, 'Quas voluptatum harum.', 688, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?88817'),
(846, 'Veniam qui reprehenderit.', 509, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?85143'),
(847, 'Mollitia accusamus quasi odit.', 893, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?55941'),
(848, 'Inventore iure aliquam inventore.', 708, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?56575'),
(849, 'Sint voluptas aut temporibus.', 194, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?70021'),
(850, 'Magnam ut consectetur soluta nesciunt.', 380, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?19886'),
(851, 'Vitae harum consequatur.', 311, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?15281'),
(852, 'Vel velit magnam corrupti.', 520, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?32679'),
(853, 'Ex autem reiciendis.', 330, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?53442'),
(854, 'Et repellat nam porro doloribus.', 113, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?99188'),
(855, 'Consequatur officia sequi.', 734, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?69293'),
(856, 'Dolorem quo at.', 32, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?75193'),
(857, 'Rem sit velit.', 377, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?62591'),
(858, 'Facere dolorem fugiat.', 736, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?83987'),
(859, 'Molestiae qui ut.', 227, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?21829'),
(860, 'Dolorem et voluptates non aut.', 523, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?88713'),
(861, 'Harum possimus id.', 67, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?87301'),
(862, 'Dignissimos ut alias.', 815, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?70526'),
(863, 'Voluptas id itaque dolorem.', 826, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?91246'),
(864, 'Voluptas suscipit nihil odit.', 547, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?97902'),
(865, 'Maxime exercitationem aut culpa ullam.', 669, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?44543'),
(866, 'Occaecati rem dicta fugiat.', 943, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?56970'),
(867, 'Ipsam suscipit consequatur voluptatem amet.', 646, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?47974'),
(868, 'Omnis in voluptas qui.', 730, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?37020'),
(869, 'Provident repudiandae nihil dolor.', 975, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?74513'),
(870, 'Velit consequatur possimus aliquam.', 828, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?93991'),
(871, 'Error adipisci non.', 291, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?24076'),
(872, 'Ut ipsum minus.', 687, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?83580'),
(873, 'Enim non sed.', 507, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?27792'),
(874, 'Ea impedit qui nostrum.', 369, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?64890'),
(875, 'Quis incidunt.', 82, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?93783'),
(876, 'Ad sed dolor.', 852, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?92335'),
(877, 'Dicta ut.', 918, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?80366'),
(878, 'Repellat expedita laboriosam ut.', 824, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?25206'),
(879, 'Sunt omnis natus ad.', 65, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?80158'),
(880, 'Omnis minus maiores.', 796, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?69734'),
(881, 'Quia sequi iste aliquid.', 207, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?23429'),
(882, 'Nihil incidunt temporibus consequatur.', 994, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?91511'),
(883, 'Qui omnis aut earum.', 318, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?10460'),
(884, 'Est dignissimos expedita.', 977, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?90368'),
(885, 'Illo numquam sed.', 52, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?38640'),
(886, 'Odit ipsa dolor.', 485, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?70772'),
(887, 'Voluptate est sint.', 942, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?63455'),
(888, 'Tempora maxime eligendi provident.', 162, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?77394'),
(889, 'Aut dolorem fugit.', 635, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?53216'),
(890, 'Natus itaque qui deleniti.', 386, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?81164'),
(891, 'Dolorem autem itaque eum.', 705, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?66285'),
(892, 'Culpa ut nulla sint.', 753, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?31859'),
(893, 'Et non est non possimus.', 76, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?74561'),
(894, 'Expedita odio sunt.', 935, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?21444'),
(895, 'Blanditiis eveniet.', 350, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?94509'),
(896, 'Assumenda ut aspernatur ea.', 740, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?92906'),
(897, 'Non quisquam voluptas dolorem repudiandae.', 25, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?29908'),
(898, 'Tenetur commodi dolor est.', 732, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?43278'),
(899, 'Repudiandae reiciendis commodi mollitia.', 771, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?61334'),
(900, 'Et adipisci ut eveniet.', 160, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?31897'),
(901, 'Fugit et.', 20, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?30484'),
(902, 'Omnis vitae recusandae.', 477, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?63359'),
(903, 'Dolores qui.', 443, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?57854'),
(904, 'Qui autem molestias beatae.', 802, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?80888'),
(905, 'Doloremque ex rerum omnis.', 702, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?20719'),
(906, 'Voluptas quia facilis.', 765, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?28788'),
(907, 'Aut ut.', 103, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?49078'),
(908, 'Itaque at quisquam ab voluptatem.', 886, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?83682'),
(909, 'Explicabo animi dolorum.', 760, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?46759'),
(910, 'Dicta id at maxime et.', 449, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?26897'),
(911, 'Labore odio ratione minima.', 10, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?66656'),
(912, 'Illo maxime aut et.', 239, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?96087'),
(913, 'Sunt nihil ducimus et sapiente.', 931, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?74040'),
(914, 'Quisquam ad officia.', 489, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?93467'),
(915, 'In sit aut quo odio.', 817, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?98600'),
(916, 'Nostrum ipsam enim.', 193, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?72973'),
(917, 'Adipisci quae dolores.', 981, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?19959'),
(918, 'Quas pariatur illo.', 804, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?56482'),
(919, 'Dolore omnis voluptate.', 631, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?11150'),
(920, 'Recusandae mollitia dicta vel.', 946, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?37243'),
(921, 'Rerum laborum vel beatae.', 579, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?65189'),
(922, 'Et et iusto.', 729, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?77098'),
(923, 'Voluptatem sunt soluta temporibus.', 230, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?70436'),
(924, 'Voluptatem ut sint eum et.', 178, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?97256'),
(925, 'Dolorem voluptates provident.', 593, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?61336'),
(926, 'Amet autem dolore enim.', 467, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?61283'),
(927, 'Accusamus quas perspiciatis.', 212, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?27121'),
(928, 'Adipisci et rerum voluptates.', 467, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?59449'),
(929, 'Placeat aliquid error.', 339, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?71009'),
(930, 'Consequatur praesentium voluptas saepe.', 193, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?96294'),
(931, 'Consequuntur quibusdam earum.', 391, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?25275'),
(932, 'Fugiat maxime amet sed.', 657, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?62241'),
(933, 'Magnam aliquid et non.', 353, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?25901'),
(934, 'Maiores porro eos saepe.', 188, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?12785'),
(935, 'In ut ad sit.', 561, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?12968'),
(936, 'Tempora quaerat a distinctio.', 60, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?37818'),
(937, 'Dolores explicabo eligendi.', 444, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?46052'),
(938, 'Porro quia qui.', 717, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?70071'),
(939, 'Omnis voluptas praesentium.', 808, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?50838'),
(940, 'Vitae sit quo possimus.', 439, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?96057'),
(941, 'Exercitationem a ad.', 517, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?64524'),
(942, 'Rerum dignissimos soluta.', 974, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?50373'),
(943, 'Nostrum enim explicabo dolorem.', 835, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?57744'),
(944, 'Non nesciunt quia quam.', 984, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?53165'),
(945, 'Dolorem enim voluptates eaque deserunt.', 262, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?53326'),
(946, 'Officia dolores nemo.', 683, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?77880'),
(947, 'Est laborum magnam qui.', 760, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?93357'),
(948, 'Quas velit sunt.', 776, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?14173'),
(949, 'Id reiciendis amet aut.', 101, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?41836'),
(950, 'Beatae modi nisi.', 398, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?39483'),
(951, 'Voluptatibus delectus ipsa.', 900, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?83268'),
(952, 'Soluta voluptatem quis.', 850, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?26263'),
(953, 'Totam minima eius quia.', 44, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?77361'),
(954, 'Et voluptatem laudantium.', 582, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?71008'),
(955, 'Omnis non necessitatibus.', 665, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?32160'),
(956, 'Possimus incidunt deleniti.', 322, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?66404'),
(957, 'Est ut ratione culpa.', 196, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?81490'),
(958, 'Eligendi officia maiores.', 96, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?58912'),
(959, 'Alias occaecati debitis.', 260, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?21699'),
(960, 'Est molestias esse eos.', 518, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?88182'),
(961, 'Expedita in accusamus voluptatem.', 727, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?17185'),
(962, 'Vel dolores in.', 590, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?57203'),
(963, 'Quia fuga quo.', 438, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?30740'),
(964, 'Sit voluptate quia et.', 983, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?51714'),
(965, 'Corrupti qui dolorum.', 339, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?41463'),
(966, 'Nemo maiores itaque.', 250, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?62563');
INSERT INTO `produit` (`idProd`, `nomProd`, `prixU`, `idCategorie`, `dateAjout`, `dateModif`, `idU`, `etat`, `imageProd`) VALUES
(967, 'At voluptatum voluptate.', 118, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?81683'),
(968, 'Reprehenderit quis est commodi.', 90, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?32751'),
(969, 'Neque eaque est totam.', 603, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?29231'),
(970, 'Voluptatem occaecati praesentium nesciunt nemo.', 357, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?48571'),
(971, 'Excepturi autem ea.', 91, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?50999'),
(972, 'Ut ad doloremque.', 118, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?53902'),
(973, 'Laudantium fugit illo officia.', 579, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?52582'),
(974, 'Est ut at sapiente ipsum.', 801, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?15482'),
(975, 'Quisquam ut praesentium.', 736, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?67342'),
(976, 'Non autem pariatur accusamus quibusdam.', 238, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?67491'),
(977, 'Vel et qui rerum quam.', 88, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?91509'),
(978, 'Facilis voluptates cupiditate.', 594, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?86298'),
(979, 'Tempore occaecati iure quo a.', 368, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?68893'),
(980, 'Perspiciatis qui enim.', 46, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?80011'),
(981, 'Voluptas officiis sit numquam.', 470, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?99547'),
(982, 'Et quisquam maxime.', 560, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?89574'),
(983, 'Ut nihil ullam eum quia.', 19, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?46551'),
(984, 'Beatae sunt veniam adipisci aperiam.', 237, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?40447'),
(985, 'Tempore quam nemo rerum.', 105, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?30748'),
(986, 'Molestiae enim quia.', 367, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?31832'),
(987, 'Aut animi dolor et.', 782, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?34414'),
(988, 'Consequatur voluptates sit eos.', 576, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?13352'),
(989, 'Non accusamus.', 152, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?15556'),
(990, 'Id occaecati qui neque.', 972, 6, '', '', 14, 'active', 'https://lorempixel.com/200/200/?42527'),
(991, 'Aut est fugit.', 41256, 5, '', '', 14, 'active', 'images/'),
(992, 'Veniam necessitatibus magni.', 223, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?36600'),
(993, 'Quia autem amet.', 406, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?80757'),
(994, 'Est eos quis illo.', 748, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?99500'),
(995, 'Esse saepe aspernatur.', 625, 2, '', '', 14, 'active', 'https://lorempixel.com/200/200/?69191'),
(996, 'Officiis consectetur quis non.', 735, 3, '', '', 14, 'active', 'https://lorempixel.com/200/200/?28055'),
(997, 'Ea id nulla veniam.', 535, 4, '', '', 14, 'active', 'https://lorempixel.com/200/200/?92901'),
(998, 'Perspiciatis quas dolores.', 482, 1, '', '', 14, 'active', 'https://lorempixel.com/200/200/?21692'),
(999, 'Officiis suscipit repellendus vel.', 779, 5, '', '', 14, 'active', 'https://lorempixel.com/200/200/?19405'),
(1000, 'Impedit assumenda et et.', 193, 6, '', '', 14, 'supprimer', 'https://lorempixel.com/200/200/?70128'),
(1001, 'analgin 500', 500, 1, '', '', 14, 'active', 'images/chasser.png'),
(1002, 'paracetamole 600', 100, 1, '2024-04-26', '', 14, 'active', 'images/client2.png'),
(1003, 'paracetamole 250', 130, 5, '2024-04-26', '2024-04-26', 14, 'active', 'images/droitInfo.png'),
(1004, 'amoxicilin', 34, 2, '2024-04-26', '2024-04-26', 14, 'active', 'images/capsule.jpeg'),
(1005, 'diamicron', 8500, 4, '2024-04-26', '2024-04-26', 14, 'active', 'images/para.png'),
(1006, 'paracetamole 250', 899, 1, '2024-04-26', '2024-04-26', 14, 'active', NULL),
(1007, 'dexametazole', 1500, 1, '2024-04-27', '2024-04-27', 14, 'active', 'images/capsule.jpeg'),
(1008, 'vitamine B complexe', 23400, 3, '2024-04-27', '2024-04-27', 14, 'active', NULL),
(1009, 'anginovac', 2300, 1, '2024-04-27', '2024-04-27', 12, 'active', NULL),
(1010, 'vitamine B complexe', 44, 1, '2024-04-27', '2024-04-27', 12, 'active', NULL),
(1012, 'dexametazole', 445, 1, '2024-04-27', '2024-04-27', 12, 'active', 'images/XDcaisse.png'),
(1013, 'anginovac', 222, 1, '2024-04-27', '2024-04-27', 12, 'active', NULL);

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
(13, 'azerty', 'azerty', 'ab4f63f9ac65152575886860dde480a1', 'supprimer'),
(14, 'auriot', 'auriot', '4774d342222136587ee1fdb3c5be34b1', 'active');

-- --------------------------------------------------------

--
-- Structure de la table `ventes`
--

CREATE TABLE `ventes` (
  `idVente` int NOT NULL,
  `dateVente` date NOT NULL,
  `qteVente` int NOT NULL,
  `prixVente` double NOT NULL,
  `numFact` text NOT NULL,
  `idProd` int NOT NULL,
  `idClient` int NOT NULL,
  `etat` varchar(255) NOT NULL,
  `idU` int NOT NULL,
  `idAnnuler` int DEFAULT NULL,
  `dateAnnuler` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ventes`
--

INSERT INTO `ventes` (`idVente`, `dateVente`, `qteVente`, `prixVente`, `numFact`, `idProd`, `idClient`, `etat`, `idU`, `idAnnuler`, `dateAnnuler`) VALUES
(2, '1984-02-10', 98, 0, '73462', 556, 2, 'active', 1, 0, '2024-04-26'),
(3, '2019-10-28', 59, 0, '73462', 33, 2, 'active', 1, 0, '2024-04-26'),
(4, '1998-02-11', 78, 0, '7346', 708, 8, 'supprimer', 1, 14, '2024-04-26'),
(5, '1990-06-14', 72, 0, '41087', 990, 1, 'active', 1, 0, '2024-04-26'),
(6, '1972-08-27', 15, 0, '89494', 242, 5, 'active', 1, 0, '2024-04-26'),
(7, '2004-02-23', 11, 0, '70041', 258, 5, 'active', 1, 0, '2024-04-26'),
(8, '1983-12-16', 33, 0, '24637', 611, 6, 'active', 1, 0, '2024-04-26'),
(9, '1995-02-05', 80, 0, '11200', 474, 3, 'active', 1, 0, '2024-04-26'),
(10, '2009-08-19', 70, 0, '47196', 945, 3, 'active', 1, 0, '2024-04-26'),
(11, '2007-06-28', 91, 0, '27362', 795, 10, 'active', 1, 0, '2024-04-26'),
(12, '2003-06-20', 43, 0, '91766', 705, 3, 'active', 1, 0, '2024-04-26'),
(13, '1997-09-18', 61, 0, '87906', 118, 6, 'supprimer', 1, 14, '2024-04-26'),
(14, '2001-12-20', 11, 0, '68931', 638, 1, 'active', 1, 0, '2024-04-26'),
(15, '1980-04-02', 29, 0, '42791', 85, 3, 'active', 1, 0, '2024-04-26'),
(16, '2007-02-24', 18, 0, '77627', 540, 10, 'active', 1, 0, '2024-04-26'),
(17, '2010-05-08', 63, 0, '45845', 104, 9, 'active', 1, 0, '2024-04-26'),
(18, '2018-12-22', 63, 0, '70499', 471, 1, 'active', 1, 0, '2024-04-26'),
(19, '2022-03-20', 91, 0, '68028', 905, 6, 'active', 1, 0, '2024-04-26'),
(20, '2004-11-15', 2, 0, '11059', 11, 5, 'active', 1, 0, '2024-04-26'),
(21, '2011-03-19', 69, 0, '44757', 563, 5, 'active', 1, 0, '2024-04-26'),
(22, '2000-05-19', 30, 0, '85493', 453, 1, 'active', 1, 0, '2024-04-26'),
(23, '2006-04-02', 95, 0, '60388', 915, 4, 'active', 1, 0, '2024-04-26'),
(24, '2011-12-23', 74, 0, '80426', 981, 9, 'active', 1, 0, '2024-04-26'),
(25, '1985-10-18', 1, 0, '39833', 191, 5, 'active', 1, 0, '2024-04-26'),
(26, '2007-11-21', 40, 0, '83158', 317, 3, 'active', 1, 0, '2024-04-26'),
(27, '1979-11-30', 72, 0, '85004', 497, 3, 'active', 1, 0, '2024-04-26'),
(28, '2000-05-29', 9, 0, '79114', 161, 7, 'active', 1, 0, '2024-04-26'),
(29, '2011-02-14', 9, 0, '56943', 713, 6, 'active', 1, 0, '2024-04-26'),
(30, '2011-12-26', 100, 0, '41753', 806, 7, 'active', 1, 0, '2024-04-26'),
(31, '2011-11-13', 3, 0, '8322', 603, 4, 'active', 1, 0, '2024-04-26'),
(32, '1987-01-11', 44, 0, '55819', 911, 5, 'active', 1, 0, '2024-04-26'),
(33, '1970-02-22', 80, 0, '70235', 211, 2, 'active', 1, 0, '2024-04-26'),
(34, '2007-06-19', 59, 0, '68558', 982, 7, 'active', 1, 0, '2024-04-26'),
(35, '1982-05-25', 43, 0, '66014', 311, 6, 'active', 1, 0, '2024-04-26'),
(36, '1995-07-03', 91, 0, '76693', 403, 5, 'active', 1, 0, '2024-04-26'),
(37, '1982-10-28', 86, 0, '62892', 336, 9, 'active', 1, 0, '2024-04-26'),
(38, '2006-04-30', 52, 0, '2409', 943, 10, 'active', 1, 0, '2024-04-26'),
(39, '2015-11-29', 23, 0, '49677', 913, 9, 'active', 1, 0, '2024-04-26'),
(40, '2015-01-13', 8, 0, '16914', 216, 6, 'active', 1, 0, '2024-04-26'),
(41, '1989-01-10', 69, 0, '76422', 130, 9, 'active', 1, 0, '2024-04-26'),
(42, '2010-02-20', 75, 0, '66587', 81, 4, 'active', 1, 0, '2024-04-26'),
(43, '2004-05-19', 10, 0, '68460', 172, 9, 'active', 1, 0, '2024-04-26'),
(44, '1995-07-16', 48, 0, '29523', 887, 6, 'active', 1, 0, '2024-04-26'),
(45, '1972-11-24', 14, 0, '22284', 453, 9, 'active', 1, 0, '2024-04-26'),
(46, '1996-08-24', 68, 0, '24716', 497, 5, 'active', 1, 0, '2024-04-26'),
(47, '1984-06-24', 100, 0, '9802', 727, 3, 'active', 1, 0, '2024-04-26'),
(48, '1999-07-27', 36, 0, '71928', 841, 1, 'active', 1, 0, '2024-04-26'),
(49, '2021-03-19', 6, 0, '98205', 594, 8, 'active', 1, 0, '2024-04-26'),
(50, '2002-03-31', 17, 0, '78319', 978, 10, 'active', 1, 0, '2024-04-26'),
(51, '1991-03-12', 23, 0, '51030', 153, 3, 'active', 1, 0, '2024-04-26'),
(52, '2005-07-31', 11, 0, '58290', 614, 10, 'active', 1, 0, '2024-04-26'),
(53, '2007-10-17', 89, 0, '50739', 333, 5, 'active', 1, 0, '2024-04-26'),
(54, '2022-09-05', 80, 0, '98152', 824, 7, 'active', 1, 0, '2024-04-26'),
(55, '2010-07-29', 37, 0, '21705', 942, 5, 'active', 1, 0, '2024-04-26'),
(56, '2016-10-16', 68, 0, '28266', 895, 2, 'active', 1, 0, '2024-04-26'),
(57, '2001-05-23', 79, 0, '38991', 296, 5, 'active', 1, 0, '2024-04-26'),
(58, '1982-05-22', 99, 0, '7569', 759, 5, 'active', 1, 0, '2024-04-26'),
(59, '2004-01-22', 68, 0, '82250', 149, 10, 'active', 1, 0, '2024-04-26'),
(60, '1977-10-02', 33, 0, '56035', 89, 8, 'active', 1, 0, '2024-04-26'),
(61, '1978-04-13', 60, 0, '18244', 410, 9, 'active', 1, 0, '2024-04-26'),
(62, '2006-02-14', 20, 0, '47117', 320, 2, 'active', 1, 0, '2024-04-26'),
(63, '2003-11-12', 49, 0, '83492', 180, 6, 'active', 1, 0, '2024-04-26'),
(64, '2004-03-25', 96, 0, '36830', 475, 10, 'active', 1, 0, '2024-04-26'),
(65, '1991-08-30', 9, 0, '52658', 219, 5, 'active', 1, 0, '2024-04-26'),
(66, '1990-04-22', 54, 0, '36491', 293, 1, 'active', 1, 0, '2024-04-26'),
(67, '1975-09-03', 10, 0, '30363', 916, 1, 'active', 1, 0, '2024-04-26'),
(68, '2014-11-21', 73, 0, '94998', 549, 6, 'active', 1, 0, '2024-04-26'),
(69, '2000-02-28', 100, 0, '10673', 397, 8, 'active', 1, 0, '2024-04-26'),
(70, '1995-08-28', 14, 0, '15490', 422, 2, 'active', 1, 0, '2024-04-26'),
(71, '2000-01-22', 34, 0, '27103', 676, 8, 'active', 1, 0, '2024-04-26'),
(72, '1985-04-24', 36, 0, '25431', 382, 6, 'active', 1, 0, '2024-04-26'),
(73, '2012-09-03', 29, 0, '49268', 604, 1, 'active', 1, 0, '2024-04-26'),
(74, '2014-08-17', 42, 0, '71390', 808, 7, 'active', 1, 0, '2024-04-26'),
(75, '2006-08-03', 19, 0, '72948', 269, 9, 'active', 1, 0, '2024-04-26'),
(76, '1981-11-22', 92, 0, '6422', 582, 2, 'active', 1, 0, '2024-04-26'),
(77, '2012-07-21', 79, 0, '99048', 276, 2, 'active', 1, 0, '2024-04-26'),
(78, '1981-07-04', 10, 0, '97575', 151, 7, 'active', 1, 0, '2024-04-26'),
(79, '2015-11-17', 54, 0, '5468', 139, 4, 'active', 1, 0, '2024-04-26'),
(80, '1974-04-04', 28, 0, '95316', 603, 10, 'active', 1, 0, '2024-04-26'),
(81, '2005-10-16', 6, 0, '19769', 470, 8, 'active', 1, 0, '2024-04-26'),
(82, '2000-10-21', 88, 0, '14736', 309, 10, 'active', 1, 0, '2024-04-26'),
(83, '2008-09-28', 2, 0, '72132', 271, 9, 'active', 1, 0, '2024-04-26'),
(84, '1982-12-30', 30, 0, '75457', 657, 4, 'active', 1, 0, '2024-04-26'),
(85, '2003-05-11', 2, 0, '90239', 169, 6, 'active', 1, 0, '2024-04-26'),
(86, '2020-06-01', 8, 0, '39260', 873, 2, 'active', 1, 0, '2024-04-26'),
(87, '2009-04-24', 62, 0, '78650', 690, 6, 'active', 1, 0, '2024-04-26'),
(88, '2007-03-11', 74, 0, '15273', 639, 8, 'active', 1, 0, '2024-04-26'),
(89, '1975-09-07', 59, 0, '84666', 107, 5, 'active', 1, 0, '2024-04-26'),
(90, '2012-10-19', 48, 0, '65404', 93, 7, 'active', 1, 0, '2024-04-26'),
(91, '1998-08-01', 96, 0, '34385', 5, 8, 'active', 1, 0, '2024-04-26'),
(92, '2008-06-13', 50, 0, '66109', 197, 10, 'active', 1, 0, '2024-04-26'),
(93, '2010-03-31', 54, 0, '28531', 236, 8, 'active', 1, 0, '2024-04-26'),
(94, '1974-07-22', 70, 0, '30303', 947, 1, 'active', 1, 0, '2024-04-26'),
(95, '2019-03-24', 78, 0, '55127', 917, 3, 'active', 1, 0, '2024-04-26'),
(96, '1989-03-10', 32, 0, '7712', 582, 5, 'active', 1, 0, '2024-04-26'),
(97, '1993-09-27', 69, 0, '82527', 161, 8, 'active', 1, 0, '2024-04-26'),
(98, '2021-06-16', 96, 0, '79660', 586, 6, 'active', 1, 0, '2024-04-26'),
(99, '2007-08-24', 30, 0, '74452', 929, 2, 'active', 1, 0, '2024-04-26'),
(100, '2008-05-08', 39, 0, '92171', 461, 8, 'active', 1, 0, '2024-04-26'),
(101, '1977-08-01', 90, 0, '81326', 12, 5, 'active', 1, 0, '2024-04-26'),
(102, '2024-04-25', 5, 0, 'CM-ICAB-2024-CDRI-1327', 2, 1, 'active', 1, 0, '2024-04-26'),
(103, '2024-04-25', 5, 0, 'CM-ICAB-2024-CDRI-1327', 4, 1, 'active', 1, 0, '2024-04-26'),
(104, '2024-04-25', 4, 0, 'FACT-2024-1328', 3, 1, 'active', 1, 0, '2024-04-26'),
(105, '2024-04-25', 55, 0, 'FACT-1329', 8, 1, 'active', 1, 0, '2024-04-26'),
(106, '2024-04-25', 12, 0, 'FACT-1330', 1, 4, 'active', 1, 0, '2024-04-26'),
(107, '2024-04-25', 14, 0, 'FACT-1330', 2, 4, 'active', 1, 0, '2024-04-26'),
(108, '2024-04-26', 5, 0, 'FACT-1331', 2, 1, 'active', 1, 0, '2024-04-26'),
(109, '2024-04-25', 6, 1, 'FACT-1331', 3, 1, 'active', 1, 0, '2024-04-26'),
(110, '2024-04-25', 6, 1, 'FACT-1332', 2, 1, 'active', 1, 0, '2024-04-26'),
(111, '2024-04-25', 4, 1, 'FACT-1332', 3, 1, 'active', 1, 0, '2024-04-26'),
(112, '2024-04-25', 5, 1, 'FACT-1333', 2, 1, 'active', 1, 0, '2024-04-26'),
(113, '2024-04-25', 6, 1, 'FACT-1333', 2, 1, 'active', 1, 0, '2024-04-26'),
(114, '2024-04-25', 5, 1, 'FACT-1333', 5, 1, 'active', 1, 0, '2024-04-26'),
(115, '2024-04-25', 4, 1, 'FACT-1334', 2, 1, 'active', 1, 0, '2024-04-26'),
(116, '2024-04-25', 5, 1, 'FACT-1334', 4, 1, 'active', 1, 0, '2024-04-26'),
(117, '2024-04-25', 7, 1, 'FACT-1334', 10, 1, 'active', 1, 0, '2024-04-26'),
(118, '2024-04-25', 8, 1, 'FACT-1334', 3, 1, 'active', 1, 0, '2024-04-26'),
(119, '2024-04-25', 6, 2, 'FACT-1334', 9, 1, 'active', 1, 0, '2024-04-26'),
(120, '2024-04-25', 7, 2, 'FACT-1334', 6, 1, 'active', 1, 0, '2024-04-26'),
(121, '2024-04-25', 10, 1, 'FACT-1334', 9, 1, 'active', 1, 0, '2024-04-26'),
(122, '2024-04-25', 1, 1, 'FACT-1334', 5, 1, 'active', 1, 0, '2024-04-26'),
(123, '2024-04-25', 8, 2, 'FACT-1334', 8, 1, 'active', 1, 0, '2024-04-26'),
(124, '2024-04-25', 3, 2, 'FACT-1335', 2, 11, 'active', 1, 0, '2024-04-26'),
(125, '2024-04-25', 5, 1, 'FACT-1335', 4, 11, 'active', 1, 0, '2024-04-26'),
(126, '2024-04-25', 13, 2, 'FACT-1335', 9, 11, 'active', 1, 0, '2024-04-26'),
(127, '2024-04-25', 32, 1, 'FACT-1335', 8, 11, 'active', 1, 0, '2024-04-26'),
(128, '2024-04-25', 4, 2, 'FACT-1335', 10, 11, 'active', 1, 0, '2024-04-26'),
(129, '2024-04-25', 33, 2, 'FACT-1336', 2, 1, 'active', 1, 0, '2024-04-26'),
(130, '2024-04-25', 6, 1, 'FACT-1337', 4, 1, 'active', 1, 0, '2024-04-26'),
(131, '2024-04-26', 5, 2, 'FACT-1338', 4, 1, 'active', 1, 0, '2024-04-26'),
(132, '2024-04-26', 5, 492, 'FACT-1339', 2, 1, 'active', 1, 0, '2024-04-26'),
(133, '2024-04-26', 5, 492, 'FACT-1340', 2, 1, 'active', 14, 0, '2024-04-26');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `approvisionnement`
--
ALTER TABLE `approvisionnement`
  ADD PRIMARY KEY (`idAppro`),
  ADD KEY `idProd` (`idProd`),
  ADD KEY `idFournis` (`idFournis`),
  ADD KEY `fk_approvisionnement_user` (`idU`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`idCategorie`),
  ADD KEY `fk_categorie_user` (`idU`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`idClient`),
  ADD UNIQUE KEY `emailclient` (`emailClient`),
  ADD KEY `fk_client_user` (`idU`);

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
  ADD UNIQUE KEY `emailFournis` (`emailFournis`),
  ADD KEY `fk_fournisseur_user` (`idU`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`idProd`),
  ADD KEY `idCategorie` (`idCategorie`),
  ADD KEY `fk_produit_user` (`idU`);

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
  ADD KEY `idProd` (`idProd`),
  ADD KEY `fk_ventes_user` (`idU`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `approvisionnement`
--
ALTER TABLE `approvisionnement`
  MODIFY `idAppro` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `idCategorie` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `idClient` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `facture`
--
ALTER TABLE `facture`
  MODIFY `idFact` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  MODIFY `idFournis` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `idProd` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1014;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `idU` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `ventes`
--
ALTER TABLE `ventes`
  MODIFY `idVente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `approvisionnement`
--
ALTER TABLE `approvisionnement`
  ADD CONSTRAINT `approvisionnement_ibfk_1` FOREIGN KEY (`idProd`) REFERENCES `produit` (`idProd`),
  ADD CONSTRAINT `approvisionnement_ibfk_2` FOREIGN KEY (`idFournis`) REFERENCES `fournisseur` (`idFournis`),
  ADD CONSTRAINT `fk_approvisionnement_user` FOREIGN KEY (`idU`) REFERENCES `user` (`idU`);

--
-- Contraintes pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD CONSTRAINT `fk_categorie_user` FOREIGN KEY (`idU`) REFERENCES `user` (`idU`);

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `fk_client_user` FOREIGN KEY (`idU`) REFERENCES `user` (`idU`);

--
-- Contraintes pour la table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `facture_ibfk_1` FOREIGN KEY (`idVente`) REFERENCES `ventes` (`idVente`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD CONSTRAINT `fk_fournisseur_user` FOREIGN KEY (`idU`) REFERENCES `user` (`idU`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `fk_produit_user` FOREIGN KEY (`idU`) REFERENCES `user` (`idU`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`idCategorie`) REFERENCES `categorie` (`idCategorie`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `ventes`
--
ALTER TABLE `ventes`
  ADD CONSTRAINT `fk_ventes_user` FOREIGN KEY (`idU`) REFERENCES `user` (`idU`),
  ADD CONSTRAINT `ventes_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `client` (`idClient`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ventes_ibfk_2` FOREIGN KEY (`idProd`) REFERENCES `produit` (`idProd`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
