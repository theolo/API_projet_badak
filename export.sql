-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Dec 16, 2019 at 04:35 PM
-- Server version: 5.7.26
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `panier`
--
CREATE DATABASE IF NOT EXISTS `panier` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `panier`;
--
-- Database: `projet_badakdb`
--
CREATE DATABASE IF NOT EXISTS `projet_badakdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `projet_badakdb`;

-- --------------------------------------------------------

--
-- Table structure for table `bloc`
--

CREATE TABLE `bloc` (
  `id` int(10) UNSIGNED NOT NULL,
  `ordre` tinyint(3) UNSIGNED DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `id_modele` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bloc`
--

INSERT INTO `bloc` (`id`, `ordre`, `nom`, `id_modele`) VALUES
(10, 1, 'modele 1 bloc 1', 1),
(11, 2, 'modele 1 bloc 2', 1),
(12, 3, 'modele 1 bloc 3', 1),
(13, 1, 'modele 2 bloc 1', 2),
(14, 2, 'modele 2 bloc 2', 2),
(15, 3, 'modele 2 bloc 3', 2);

-- --------------------------------------------------------

--
-- Table structure for table `champ`
--

CREATE TABLE `champ` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `ordre` tinyint(3) UNSIGNED DEFAULT NULL,
  `id_ensemble` int(10) UNSIGNED DEFAULT NULL,
  `id_type` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `champ`
--

INSERT INTO `champ` (`id`, `nom`, `ordre`, `id_ensemble`, `id_type`) VALUES
(13, 'modele 1 bloc 1 ens 1 ch 1', 1, 13, 1),
(14, 'modele 1 bloc 1 ens 1 ch 2', 2, 13, 2),
(15, 'modele 1 bloc 1 ens 2 ch 1', 1, 14, 1),
(16, 'modele 1 bloc 1 ens 2 ch 2', 2, 14, 2),
(17, 'modele 1 bloc 2 ens 1 ch 1', 1, 15, 1),
(18, 'modele 1 bloc 2 ens 1 ch 2', 2, 15, 2),
(19, 'modele 1 bloc 2 ens 2 ch 1', 1, 16, 1),
(20, 'modele 1 bloc 2 ens 2 ch 2', 2, 16, 2),
(21, 'modele 1 bloc 3 ens 1 ch 1', 1, 17, 1),
(22, 'modele 2 bloc 1 ens 1 ch 1', 1, 18, 1),
(23, 'modele 2 bloc 2 ens 1 ch 1', 1, 19, 1);

-- --------------------------------------------------------

--
-- Table structure for table `contenu`
--

CREATE TABLE `contenu` (
  `id_page` int(10) UNSIGNED NOT NULL,
  `id_champ` int(10) UNSIGNED NOT NULL,
  `contenu` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contenu`
--

INSERT INTO `contenu` (`id_page`, `id_champ`, `contenu`) VALUES
(1, 13, 'mon titre genial'),
(1, 14, 'mon paragraphe trop court'),
(1, 15, 'content'),
(1, 16, ''),
(2, 22, 'test add field'),
(2, 23, 'test add field 2'),
(3, 13, 'un autre titre');

-- --------------------------------------------------------

--
-- Table structure for table `ensemble_champ`
--

CREATE TABLE `ensemble_champ` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `ordre` tinyint(3) UNSIGNED DEFAULT NULL,
  `id_bloc` int(10) UNSIGNED DEFAULT NULL,
  `id_type_ensemble` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ensemble_champ`
--

INSERT INTO `ensemble_champ` (`id`, `nom`, `ordre`, `id_bloc`, `id_type_ensemble`) VALUES
(13, 'modele 1 bloc 1 ens 1', 1, 10, 1),
(14, 'modele 1 bloc 1 ens 2', 2, 10, 2),
(15, 'modele 1 bloc 2 ens 1', 1, 11, 1),
(16, 'modele 1 bloc 2 ens 2', 2, 11, 2),
(17, 'modele 1 bloc 3 ens 1', 1, 12, 1),
(18, 'modele 2 bloc 1 ens 1', 1, 13, 1),
(19, 'modele 2 bloc 2 ens 1', 1, 14, 2);

-- --------------------------------------------------------

--
-- Table structure for table `info_page`
--

CREATE TABLE `info_page` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `description` text,
  `id_page` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `info_projet`
--

CREATE TABLE `info_projet` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `description` text,
  `id_projet` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `modele`
--

CREATE TABLE `modele` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modele`
--

INSERT INTO `modele` (`id`, `nom`) VALUES
(1, 'Modele 1'),
(2, 'Modele 2'),
(3, 'Modele 3'),
(4, 'Modele 4'),
(5, 'Modele 5'),
(6, 'nouveau modele');

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `description` text,
  `titre` varchar(255) DEFAULT '',
  `h1` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `id_projet` int(10) UNSIGNED DEFAULT NULL,
  `id_modele` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id`, `nom`, `description`, `titre`, `h1`, `url`, `id_projet`, `id_modele`) VALUES
(1, 'Home', 'La page Home', 'Accueil', 'Les pierres, c\'est bien', 'https://www.K-you.com/home', 1, 1),
(2, 'Créations', 'Les créations de l\'équipe', 'okokok', 'okokokok', 'okokokok', 1, 2),
(3, 'Type de pierre', 'Liste des differents type de pierre', 'Pierre', 'Les pierres', '/pierre', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `projet`
--

CREATE TABLE `projet` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `description` text,
  `id_user` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projet`
--

INSERT INTO `projet` (`id`, `nom`, `description`, `id_user`) VALUES
(1, 'Le projet de pierre', 'c\'est un projet solide', 2),
(2, 'Le projet d\'eau', 'Un projet cool quand il fait chaud', 2),
(4, 'Le projet privée', 'Un projet très coûeux', 2);

-- --------------------------------------------------------

--
-- Table structure for table `type_champ`
--

CREATE TABLE `type_champ` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `type_champ`
--

INSERT INTO `type_champ` (`id`, `type`) VALUES
(1, 'text'),
(2, 'textarea'),
(3, 'url'),
(4, 'date'),
(5, 'button');

-- --------------------------------------------------------

--
-- Table structure for table `type_ensemble`
--

CREATE TABLE `type_ensemble` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `type_ensemble`
--

INSERT INTO `type_ensemble` (`id`, `type`) VALUES
(1, 'Bandeau titre i+h'),
(2, 'Card i+h+p+b'),
(3, 'Paragraphe h+p'),
(4, 'Paragraphe Nav h+p+b'),
(5, 'Bandeau para i+h+p'),
(6, 'Bandeau bouton h+p+b'),
(7, 'custom');

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `entreprise` varchar(50) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `admin`, `prenom`, `entreprise`, `email`, `password`) VALUES
(2, 'Entreprise 1', 0, 'Entreprise 1', 'Entreprise 1', 'theo@gmail.com', '$2y$10$J82eLlI7tsuCBlXfuAallOAqokllzk.Y6LUr.y959638qd0sd6v16'),
(5, 'admin', 1, 'admin', 'admin', 'admin@gmail.com', '$2y$10$c9FN3wQlagvK33xW0Dl9xOtxlXOQL0v1ovsWAZf8otpgrZnekq2Be');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bloc`
--
ALTER TABLE `bloc`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `FK_bloc_modele_idx` (`id_modele`);

--
-- Indexes for table `champ`
--
ALTER TABLE `champ`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `FK_champ_ensemble_idx` (`id_ensemble`) USING BTREE,
  ADD KEY `FK_champ_type` (`id_type`) USING BTREE;

--
-- Indexes for table `contenu`
--
ALTER TABLE `contenu`
  ADD PRIMARY KEY (`id_page`,`id_champ`),
  ADD KEY `FK_contenu_champ_idx` (`id_champ`) USING BTREE;

--
-- Indexes for table `ensemble_champ`
--
ALTER TABLE `ensemble_champ`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `FK_ensemble_bloc_idx` (`id_bloc`) USING BTREE,
  ADD KEY `FK_ensemble_type_idx` (`id_type_ensemble`) USING BTREE;

--
-- Indexes for table `info_page`
--
ALTER TABLE `info_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `FK_info_page_page_idx` (`id_page`);

--
-- Indexes for table `info_projet`
--
ALTER TABLE `info_projet`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `FK_info_projet_projet_idx` (`id_projet`);

--
-- Indexes for table `modele`
--
ALTER TABLE `modele`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `FK_page_projet_idx` (`id_projet`),
  ADD KEY `FK_page_modele_idx` (`id_modele`);

--
-- Indexes for table `projet`
--
ALTER TABLE `projet`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `FK_projet_user_idx` (`id_user`);

--
-- Indexes for table `type_champ`
--
ALTER TABLE `type_champ`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_ensemble`
--
ALTER TABLE `type_ensemble`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bloc`
--
ALTER TABLE `bloc`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `champ`
--
ALTER TABLE `champ`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `ensemble_champ`
--
ALTER TABLE `ensemble_champ`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `info_page`
--
ALTER TABLE `info_page`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `info_projet`
--
ALTER TABLE `info_projet`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modele`
--
ALTER TABLE `modele`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `projet`
--
ALTER TABLE `projet`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `type_champ`
--
ALTER TABLE `type_champ`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `type_ensemble`
--
ALTER TABLE `type_ensemble`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bloc`
--
ALTER TABLE `bloc`
  ADD CONSTRAINT `FK_bloc_modele` FOREIGN KEY (`id_modele`) REFERENCES `modele` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `champ`
--
ALTER TABLE `champ`
  ADD CONSTRAINT `lien_champ_ensemble` FOREIGN KEY (`id_ensemble`) REFERENCES `ensemble_champ` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `lien_champ_type` FOREIGN KEY (`id_type`) REFERENCES `type_champ` (`id`);

--
-- Constraints for table `contenu`
--
ALTER TABLE `contenu`
  ADD CONSTRAINT `FK_contenu_champ` FOREIGN KEY (`id_champ`) REFERENCES `champ` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_contenu_page` FOREIGN KEY (`id_page`) REFERENCES `page` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ensemble_champ`
--
ALTER TABLE `ensemble_champ`
  ADD CONSTRAINT `FK_ensemble_bloc` FOREIGN KEY (`id_bloc`) REFERENCES `bloc` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ensemble_type` FOREIGN KEY (`id_type_ensemble`) REFERENCES `type_ensemble` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `info_page`
--
ALTER TABLE `info_page`
  ADD CONSTRAINT `FK_info_page_page` FOREIGN KEY (`id_page`) REFERENCES `page` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `info_projet`
--
ALTER TABLE `info_projet`
  ADD CONSTRAINT `FK_info_projet_projet` FOREIGN KEY (`id_projet`) REFERENCES `projet` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `page`
--
ALTER TABLE `page`
  ADD CONSTRAINT `FK_page_modele` FOREIGN KEY (`id_modele`) REFERENCES `modele` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_page_projet` FOREIGN KEY (`id_projet`) REFERENCES `projet` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `projet`
--
ALTER TABLE `projet`
  ADD CONSTRAINT `FK_projet_user` FOREIGN KEY (`id_user`) REFERENCES `utilisateur` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;
--
-- Database: `stimdb`
--
CREATE DATABASE IF NOT EXISTS `stimdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `stimdb`;

-- --------------------------------------------------------

--
-- Table structure for table `ami`
--

CREATE TABLE `ami` (
  `id_utilisateur_1` int(10) UNSIGNED NOT NULL,
  `id_utilisateur_2` int(10) UNSIGNED NOT NULL,
  `date_debut` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table qui représente les liens d’amitié entre les différents utilisateurs';

--
-- Dumping data for table `ami`
--

INSERT INTO `ami` (`id_utilisateur_1`, `id_utilisateur_2`, `date_debut`) VALUES
(1, 11, '2019-09-01 00:00:00'),
(2, 3, '2019-09-15 00:00:00'),
(2, 9, '2019-09-20 00:00:00'),
(3, 2, '2019-09-15 00:00:00'),
(3, 5, '2019-09-10 00:00:00'),
(3, 8, '2019-09-12 00:00:00'),
(4, 5, '2019-09-24 00:00:00'),
(5, 3, '2019-09-10 00:00:00'),
(5, 4, '2019-09-24 00:00:00'),
(5, 9, '2019-09-07 00:00:00'),
(6, 7, '2019-09-05 00:00:00'),
(6, 10, '2019-09-08 00:00:00'),
(6, 11, '2019-09-03 00:00:00'),
(7, 6, '2019-09-05 00:00:00'),
(7, 10, '2019-09-06 00:00:00'),
(7, 11, '2019-09-02 00:00:00'),
(8, 3, '2019-09-12 00:00:00'),
(9, 2, '2019-09-20 00:00:00'),
(9, 5, '2019-09-07 00:00:00'),
(10, 6, '2019-09-08 00:00:00'),
(10, 7, '2019-09-06 00:00:00'),
(10, 11, '2019-09-04 00:00:00'),
(11, 1, '2019-09-01 00:00:00'),
(11, 6, '2019-09-03 00:00:00'),
(11, 7, '2019-09-02 00:00:00'),
(11, 10, '2019-09-04 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `developpeur`
--

CREATE TABLE `developpeur` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table des différents développeur de jeux pour les jeux sur la plate-forme';

--
-- Dumping data for table `developpeur`
--

INSERT INTO `developpeur` (`id`, `nom`) VALUES
(1, 'Valve'),
(2, 'Ubisoft'),
(3, 'FromSoftware'),
(4, 'A44'),
(5, 'Hello Games'),
(6, 'IO interactive'),
(7, 'Square Enix'),
(8, 'Eidos'),
(9, 'Galactic Cafe'),
(10, 'Mega Crit Games'),
(11, 'Team Cherry');

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table des différents genre possible pour les jeux de la plate-forme';

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`id`, `nom`) VALUES
(1, 'Action'),
(2, 'Aventure'),
(3, 'Rpg'),
(4, 'Casual'),
(5, 'Course automobile'),
(6, 'Massivement multi joueur'),
(7, 'Indépendant'),
(8, 'Simulation'),
(9, 'Sport'),
(10, 'Statégie'),
(11, 'Gratuit');

-- --------------------------------------------------------

--
-- Table structure for table `jeu`
--

CREATE TABLE `jeu` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prix` decimal(13,2) NOT NULL,
  `description` text,
  `date_parution` datetime DEFAULT NULL,
  `id_developpeur` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table des jeux disponible sur la plate-forme';

--
-- Dumping data for table `jeu`
--

INSERT INTO `jeu` (`id`, `nom`, `prix`, `description`, `date_parution`, `id_developpeur`) VALUES
(1, 'Assassin\'s Creed® Origins', '59.99', 'L\'Égypte ancienne, époque de grandeur et d\'intrigues, sombre dans une impitoyable lutte pour le pouvoir. *The Discovery Tour by Assassin\'s Creed®: Ancient Egypt est maintenant disponible en tant que mise à jour gratuite !', '2017-10-27 00:00:00', 2),
(2, 'Dota 2', '0.00', 'Chaque jour, des millions de joueurs du monde entier s\'affrontent dans l\'univers de Dota. Choisissant parmi plus d\'une centaine de héros, les joueurs incarnent des personnages différents offrant ainsi des combinaisons uniques et originales pour des parties toujours riches en rebondissements.', '2013-07-09 00:00:00', 1),
(3, 'Tom Clancy\'s Rainbow Six® Siege', '19.99', 'Tom Clancy\'s Rainbow Six Siege marque le retour de la célèbre franchise de FPS dans un tout nouvel opus développé par le studio d’Ubisoft Montréal.', '2015-12-01 00:00:00', 2),
(4, 'FINAL FANTASY VII', '12.99', 'À Midgar, une cité contrôlée par le méga-conglomérat Shinra Inc., le réacteur Mako No. 1 a été détruit par le groupe de rebelles AVALANCHE.AVALANCHE fut secrètement crée afin de mener le combat contre la Shinra Inc.', '2013-07-04 00:00:00', 7),
(5, 'DARK SOULS™ III', '59.99', 'Dark Souls repousse une fois de plus ses limites avec un nouveau chapitre ambitieux de la série légendaire et encensée par la critique. Préparez-vous à embrasser les ténèbres !', '2016-04-11 00:00:00', 3),
(6, 'No Man\'s Sky', '54.99', 'No Man\'s Sky est un jeu de science-fiction sur l\'exploration et la survie dans un univers infini généré de manière dynamique.', '2016-08-12 00:00:00', 5),
(7, 'Ashen', '39.99', 'Ashen is an action RPG about a wanderer in search of a place to call home. This is a world where nothing lasts, no matter how tightly you cling to it. At its core, Ashen is about forging relationships. Players can guide those they trust to their camp - together, you might just stand a chance.', '2019-12-09 00:00:00', 4),
(8, 'The Stanley Parable', '11.99', 'The Stanley Parable is a first person exploration game. You will play as Stanley, and you will not play as Stanley. You will follow a story, you will not follow a story. You will have a choice, you will have no choice. The game will end, the game will never end.', '2013-10-17 00:00:00', 9),
(9, 'Hollow Knight', '14.99', 'Choisissez votre destin dans Hollow Knight ! Une aventure épique et pleine d’action, qui vous plongera dans un vaste royaume en ruine peuplé d’insectes et de héros. Dans un monde en 2D classique, dessiné à la main.', '2017-02-24 00:00:00', 11),
(10, 'Slay the Spire', '20.99', 'En fusionnant jeu de cartes et roguelike, nous avons créé le jeu de cartes solo le plus intéressant possible. Construisez votre deck, rencontrez toutes sortes d\'ennemis bizarres, découvrez des reliques aux pouvoirs immenses, et éradiquez la tour !', '2019-01-23 00:00:00', 10);

-- --------------------------------------------------------

--
-- Table structure for table `langue`
--

CREATE TABLE `langue` (
  `id` int(10) UNSIGNED NOT NULL,
  `langue` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table des différentes langues possible pour les jeux sur la plate-forme';

--
-- Dumping data for table `langue`
--

INSERT INTO `langue` (`id`, `langue`) VALUES
(1, 'Anglais'),
(2, 'Allemand'),
(3, 'Français'),
(4, 'Italien'),
(5, 'Russe'),
(6, 'Japonais'),
(7, 'Portugais'),
(8, 'Norvégien'),
(9, 'Espagnol'),
(10, 'Néerlandais');

-- --------------------------------------------------------

--
-- Table structure for table `lien_jeu_genre`
--

CREATE TABLE `lien_jeu_genre` (
  `id_jeu` int(10) UNSIGNED NOT NULL,
  `id_genre` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table qui relie les jeux à leurs genre';

--
-- Dumping data for table `lien_jeu_genre`
--

INSERT INTO `lien_jeu_genre` (`id_jeu`, `id_genre`) VALUES
(1, 1),
(2, 1),
(3, 1),
(5, 1),
(6, 1),
(7, 1),
(9, 1),
(1, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(1, 3),
(4, 3),
(7, 3),
(9, 7),
(10, 7),
(2, 10),
(10, 10),
(2, 11);

-- --------------------------------------------------------

--
-- Table structure for table `lien_jeu_langue`
--

CREATE TABLE `lien_jeu_langue` (
  `id_jeu` int(10) UNSIGNED NOT NULL,
  `id_langue` int(10) UNSIGNED NOT NULL,
  `interface` tinyint(4) DEFAULT NULL,
  `audio` tinyint(4) DEFAULT NULL,
  `sous-titre` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table de liens entre les jeux et leurs langues (selon interface, audio et sous-titre)';

--
-- Dumping data for table `lien_jeu_langue`
--

INSERT INTO `lien_jeu_langue` (`id_jeu`, `id_langue`, `interface`, `audio`, `sous-titre`) VALUES
(1, 1, 1, 1, 1),
(1, 2, 1, 1, 1),
(1, 3, 1, 1, 1),
(1, 4, 1, 1, 1),
(1, 5, 1, 1, 1),
(1, 6, 1, 1, 1),
(1, 7, 1, 1, 1),
(1, 9, 1, 1, 1),
(1, 10, 1, 0, 1),
(2, 1, 1, 1, 0),
(2, 2, 1, 0, 0),
(2, 3, 1, 0, 0),
(2, 4, 1, 0, 0),
(2, 5, 1, 0, 0),
(2, 6, 1, 0, 0),
(2, 7, 1, 0, 0),
(2, 8, 1, 0, 0),
(2, 10, 1, 0, 0),
(3, 1, 1, 1, 1),
(3, 2, 1, 1, 1),
(3, 3, 1, 1, 1),
(3, 4, 1, 1, 1),
(3, 5, 1, 1, 1),
(3, 6, 1, 1, 1),
(3, 9, 1, 1, 1),
(3, 10, 1, 0, 1),
(4, 1, 1, 0, 0),
(4, 2, 1, 0, 0),
(4, 3, 1, 0, 0),
(4, 9, 1, 0, 0),
(5, 1, 1, 1, 1),
(5, 2, 1, 0, 1),
(5, 3, 1, 0, 1),
(5, 4, 1, 0, 1),
(5, 5, 1, 0, 1),
(5, 6, 1, 0, 1),
(5, 9, 1, 0, 1),
(6, 1, 1, 1, 0),
(6, 2, 1, 1, 0),
(6, 3, 1, 1, 0),
(6, 4, 1, 1, 0),
(6, 5, 1, 1, 0),
(6, 6, 1, 1, 0),
(6, 7, 1, 1, 0),
(6, 9, 1, 1, 0),
(6, 10, 1, 0, 0),
(7, 1, 1, 1, 1),
(8, 1, 1, 1, 1),
(8, 2, 1, 0, 1),
(8, 3, 1, 0, 1),
(8, 4, 1, 0, 1),
(8, 5, 1, 0, 1),
(8, 7, 1, 0, 1),
(8, 9, 1, 0, 1),
(8, 10, 1, 0, 1),
(9, 1, 1, 1, 1),
(9, 2, 1, 1, 1),
(9, 3, 1, 1, 1),
(9, 4, 1, 1, 1),
(9, 5, 1, 1, 1),
(9, 6, 1, 1, 1),
(9, 9, 1, 1, 1),
(10, 1, 1, 0, 0),
(10, 2, 1, 0, 0),
(10, 3, 1, 0, 0),
(10, 4, 1, 0, 0),
(10, 5, 1, 0, 0),
(10, 6, 1, 0, 0),
(10, 9, 1, 0, 0),
(10, 10, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `lien_jeu_utilisateur`
--

CREATE TABLE `lien_jeu_utilisateur` (
  `id_jeu` int(10) UNSIGNED NOT NULL,
  `id_utilisateur` int(10) UNSIGNED NOT NULL,
  `cle_achat` varchar(50) NOT NULL,
  `date_achat` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table qui défini les jeux obtenu par utilisateur';

--
-- Dumping data for table `lien_jeu_utilisateur`
--

INSERT INTO `lien_jeu_utilisateur` (`id_jeu`, `id_utilisateur`, `cle_achat`, `date_achat`) VALUES
(1, 1, 'asdasdasdasdasdasdasdasdasd', '2019-09-05 00:00:00'),
(1, 3, 'fdfsdfwefefwetertertertertergdfg', '2019-09-01 00:00:00'),
(1, 11, 'qwdsdsadcasdcasdc', '2019-09-01 00:00:00'),
(2, 6, 'qweqweqweqweasdasdasdzxc', '2019-09-03 00:00:00'),
(3, 11, 'wcwecqwecervtyruytnrtngsdf', '2019-09-01 00:00:00'),
(4, 11, 'knwvjnkjnekrjv ejrkvje rkj', '2019-09-01 00:00:00'),
(5, 8, 'fsdfwefrgrthytghngnfgbfgbsfbdg', '2019-09-01 00:00:00'),
(5, 11, 'avsdewqevdsvasdvqw', '2019-09-01 00:00:00'),
(7, 2, 'wrwerwerwerwerewrwerwerqwq', '2019-09-04 00:00:00'),
(7, 11, 'qwdfqwdqwd', '2019-09-01 00:00:00'),
(8, 2, 'wqeqweqweqweasdasdasd', '2019-09-02 00:00:00'),
(8, 3, 'fajgkmtysvcsefasdffgvsfghdfg', '2019-09-05 00:00:00'),
(9, 9, 'aafjnjnkgsngusekjgskdfsdfgs', '2019-09-02 00:00:00'),
(10, 4, 'dfgbdfgbdfgbewwerwerwerwr', '2019-09-01 00:00:00'),
(10, 7, 'hutniukjtydhrsgeafwsdnyudtrg', '2019-09-11 00:00:00'),
(10, 11, 'wvewevqedvdcadcqwecddsc', '2019-09-01 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `lien_succes_utilisateur`
--

CREATE TABLE `lien_succes_utilisateur` (
  `id_utilisateur` int(10) UNSIGNED NOT NULL,
  `id_succes` int(10) UNSIGNED NOT NULL,
  `date_obtention` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table qui défini quels succès un utilisateur a débloqué';

--
-- Dumping data for table `lien_succes_utilisateur`
--

INSERT INTO `lien_succes_utilisateur` (`id_utilisateur`, `id_succes`, `date_obtention`) VALUES
(1, 5, NULL),
(1, 15, '2019-09-01 00:00:00'),
(2, 3, '2019-09-19 00:00:00'),
(2, 7, NULL),
(3, 14, '2019-09-01 00:00:00'),
(5, 1, '2019-09-01 00:00:00'),
(5, 5, '2019-09-01 00:00:00'),
(7, 2, '2019-09-01 00:00:00'),
(7, 13, '2019-09-01 00:00:00'),
(8, 15, '2019-09-01 00:00:00'),
(9, 10, '2019-09-06 00:00:00'),
(10, 3, '2019-09-18 00:00:00'),
(10, 14, NULL),
(11, 1, '2019-09-04 00:00:00'),
(11, 6, NULL),
(11, 7, NULL),
(11, 11, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `succes`
--

CREATE TABLE `succes` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `description` text,
  `point` int(11) DEFAULT NULL,
  `id_jeu` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='liste des succès dans les jeux (défi)';

--
-- Dumping data for table `succes`
--

INSERT INTO `succes` (`id`, `nom`, `description`, `point`, `id_jeu`) VALUES
(1, 'Aventurier du tombeau perdu', 'Terminez un tombeau.', NULL, 1),
(2, 'Il vous manque 8880…', 'Atteignez le niveau 20.', NULL, 1),
(3, 'Permis de monte', 'Utilisez au moins une fois chaque type de véhicule.', NULL, 1),
(4, 'Premier combat', 'Gagnez votre premier combat', NULL, 4),
(5, 'Bravoure', 'Utilisez la 1è limite de Cloud', NULL, 4),
(6, 'Embraser', 'Allumer un Feu pour la première fois.', NULL, 5),
(7, 'Étreindre la Flamme', 'Devenir un Porte-Braises pour la première fois.', NULL, 5),
(8, 'Contact', 'Obtenir le statut « Connu » dans Aliens colons rencontrés', NULL, 6),
(9, 'Fondation', 'Obtenir le statut « Entrepreneur » dans Unités accumulées', NULL, 6),
(10, 'Beat the game', 'Complete The Stanley Parable.', NULL, 8),
(11, 'Welcome back!', 'Quit the game and then start it again.', NULL, 8),
(12, 'Charmé', 'Obtenir votre premier Charme', NULL, 9),
(13, 'Tromperie', 'Vaincre le Faux Chevalier', NULL, 9),
(14, 'Même pas mal', 'Gagnez un combat avec 1 PV restant.', NULL, 10),
(15, 'Ascension 0', 'Débloquez le mode Ascension.', NULL, 10);

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(10) UNSIGNED NOT NULL,
  `pseudo` varchar(50) NOT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `email` varchar(64) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('en ligne','occupé','absent','hors ligne') DEFAULT 'hors ligne',
  `valid` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table qui regroupe les utilisateurs et leurs informations';

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `pseudo`, `prenom`, `nom`, `email`, `password`, `status`, `valid`) VALUES
(1, 'Paulito75', 'Paul', 'Ochon', 'paul.ochon@exemple.com', 'paul75', 'en ligne', b'1'),
(2, 'withoutPlomb95', 'Jerry', 'Canne', 'jerry.canne@exemple.com', 'jpejmf98', 'hors ligne', b'1'),
(3, 'kilometrik', 'Cécile', 'Houinksa', 'cecile.houinksa@exemple.com', 'sahuzsahuz', 'occupé', b'1'),
(4, 'RunBabyRun', 'Eva', 'Kuassion', 'eva.kuassion@exemple.com', 'pouette', 'en ligne', b'1'),
(5, 'jennyHS', 'Jennifer', 'Nicuivre', 'jennifer.nicuivre@exemple.com', 'Gpatrodmétaux', 'absent', b'1'),
(6, 'WanWan37', 'Wanny', 'Plusnimoins', 'wanny.plusnimoins@exemple.com', 'C-moyen', 'en ligne', b'1'),
(7, 'Ritoux', 'Tommy', 'Truand', 'tommy.truand@exemple.com', 'jeustrim', 'en ligne', b'1'),
(8, 'MDRJPP', 'Henry', 'Gole', 'henry.gole@exemple.com', 'XD', 'hors ligne', b'0'),
(9, 'sékohasa', 'Kelly', 'Diote', 'kelly.diote@exemple.com', 'jsépamoa', 'hors ligne', b'0'),
(10, 'Sol-21', 'Remi', 'Fasole', 'remi.fasole@exemple.com', 'lasido', 'en ligne', b'1'),
(11, 'XVI-L', 'Theo', 'Bligé', 'theo.blige@exemple.com', 'introuvable', 'absent', b'1');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view1`
-- (See below for the actual view)
--
CREATE TABLE `view1` (
`id` int(10) unsigned
,`pseudo` varchar(50)
,`prenom` varchar(50)
,`nom` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view2`
-- (See below for the actual view)
--
CREATE TABLE `view2` (
`id` int(10) unsigned
,`nom` varchar(50)
,`langue` varchar(50)
,`interface` tinyint(4)
,`audio` tinyint(4)
,`sous-titre` tinyint(4)
);

-- --------------------------------------------------------

--
-- Structure for view `view1`
--
DROP TABLE IF EXISTS `view1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view1`  AS  select `utilisateur`.`id` AS `id`,`utilisateur`.`pseudo` AS `pseudo`,`utilisateur`.`prenom` AS `prenom`,`utilisateur`.`nom` AS `nom` from `utilisateur` ;

-- --------------------------------------------------------

--
-- Structure for view `view2`
--
DROP TABLE IF EXISTS `view2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view2`  AS  select `jeu`.`id` AS `id`,`jeu`.`nom` AS `nom`,`langue`.`langue` AS `langue`,`lien_jeu_langue`.`interface` AS `interface`,`lien_jeu_langue`.`audio` AS `audio`,`lien_jeu_langue`.`sous-titre` AS `sous-titre` from ((`jeu` join `lien_jeu_langue` on((`lien_jeu_langue`.`id_jeu` = `jeu`.`id`))) join `langue` on((`langue`.`id` = `lien_jeu_langue`.`id_langue`))) order by `jeu`.`nom` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ami`
--
ALTER TABLE `ami`
  ADD PRIMARY KEY (`id_utilisateur_1`,`id_utilisateur_2`),
  ADD KEY `fk_ami_utilisateur1_idx` (`id_utilisateur_2`);

--
-- Indexes for table `developpeur`
--
ALTER TABLE `developpeur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `jeu`
--
ALTER TABLE `jeu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `FK_developpeur_idx` (`id_developpeur`);

--
-- Indexes for table `langue`
--
ALTER TABLE `langue`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `lien_jeu_genre`
--
ALTER TABLE `lien_jeu_genre`
  ADD PRIMARY KEY (`id_jeu`,`id_genre`),
  ADD KEY `FK_genre_lien_idx` (`id_genre`);

--
-- Indexes for table `lien_jeu_langue`
--
ALTER TABLE `lien_jeu_langue`
  ADD PRIMARY KEY (`id_jeu`,`id_langue`),
  ADD KEY `FK_lien_langue_idx` (`id_langue`);

--
-- Indexes for table `lien_jeu_utilisateur`
--
ALTER TABLE `lien_jeu_utilisateur`
  ADD PRIMARY KEY (`id_jeu`,`id_utilisateur`),
  ADD KEY `FK_lien_utilisateur_idx` (`id_utilisateur`);

--
-- Indexes for table `lien_succes_utilisateur`
--
ALTER TABLE `lien_succes_utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`,`id_succes`),
  ADD KEY `FK_lien_succes_idx` (`id_succes`);

--
-- Indexes for table `succes`
--
ALTER TABLE `succes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_succes_jeu_idx` (`id_jeu`);

--
-- Indexes for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD UNIQUE KEY `pseudo_UNIQUE` (`pseudo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `developpeur`
--
ALTER TABLE `developpeur`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `jeu`
--
ALTER TABLE `jeu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `langue`
--
ALTER TABLE `langue`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `succes`
--
ALTER TABLE `succes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ami`
--
ALTER TABLE `ami`
  ADD CONSTRAINT `FK_lien_utilisateur_1` FOREIGN KEY (`id_utilisateur_1`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ami_utilisateur1` FOREIGN KEY (`id_utilisateur_2`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `jeu`
--
ALTER TABLE `jeu`
  ADD CONSTRAINT `FK_developpeur` FOREIGN KEY (`id_developpeur`) REFERENCES `developpeur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `lien_jeu_genre`
--
ALTER TABLE `lien_jeu_genre`
  ADD CONSTRAINT `FK_genre_lien` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_jeu_lien` FOREIGN KEY (`id_jeu`) REFERENCES `jeu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `lien_jeu_langue`
--
ALTER TABLE `lien_jeu_langue`
  ADD CONSTRAINT `FK_lien_jeu2` FOREIGN KEY (`id_jeu`) REFERENCES `jeu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_lien_langue` FOREIGN KEY (`id_langue`) REFERENCES `langue` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `lien_jeu_utilisateur`
--
ALTER TABLE `lien_jeu_utilisateur`
  ADD CONSTRAINT `FK_lien_jeu` FOREIGN KEY (`id_jeu`) REFERENCES `jeu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_lien_utilisateur` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `lien_succes_utilisateur`
--
ALTER TABLE `lien_succes_utilisateur`
  ADD CONSTRAINT `FK_lien_succes` FOREIGN KEY (`id_succes`) REFERENCES `succes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_lien_utilisateur2` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `succes`
--
ALTER TABLE `succes`
  ADD CONSTRAINT `FK_succes_jeu` FOREIGN KEY (`id_jeu`) REFERENCES `jeu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Database: `tds1`
--
CREATE DATABASE IF NOT EXISTS `tds1` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `tds1`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `imageUrl` varchar(255) NOT NULL,
  `deadline` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `description`, `imageUrl`, `deadline`) VALUES
(1, 'Alimentation', 'Boisson, boulangerie, cremerie, ...', '/images/category/diet.svg', NULL),
(2, 'Cuisine/Vaiselle', 'Cuisine, vaiselle, bio-compostable, ...', '/images/category/kitchen.svg', NULL),
(3, 'Hygiène et droguerie', 'Hygiène, pharmacie, droguerie, ...', '/images/category/hand-wash.svg', NULL),
(4, 'Papeterie & Bureautique', 'Fourniture de bureau, papeteries, piles, ...', '/images/category/stationery.svg', NULL),
(5, 'Petit matériels', 'Bazar, electroménager, jeux, ...', '/images/category/stock.svg', NULL),
(6, 'Aménagements', 'Aménagement, chapiteaux, tentes, ...', '/images/category/wooden.svg', NULL),
(7, 'Mobilier', 'Table, chaise, ...', '/images/category/furniture.svg', NULL),
(8, 'Plomberie', 'Eviers, pompes, tuyaux, ...', '/images/category/plumbing.svg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `command`
--

CREATE TABLE `command` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `nb_items` int(11) NOT NULL,
  `statut` tinyint(1) NOT NULL,
  `commentaire` varchar(255) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `prix_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `command`
--

INSERT INTO `command` (`id`, `date`, `nb_items`, `statut`, `commentaire`, `nom`, `prix_total`) VALUES
(1, '2019-05-10 00:00:00', 1, 0, 'fghj', '1', 100),
(2, '2019-05-23 00:00:00', 1, 1, 'rt', '2', 200),
(3, '2019-05-08 00:00:00', 123, 0, 'okokokokok', '?????', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `commande_has_Designation`
--

CREATE TABLE `commande_has_Designation` (
  `commande_id_commande` int(11) NOT NULL,
  `Designation_id` int(11) NOT NULL,
  `quantite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `commission`
--

CREATE TABLE `commission` (
  `id` int(11) NOT NULL,
  `nom_commission` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `commission`
--

INSERT INTO `commission` (`id`, `nom_commission`) VALUES
(1, 'ABC'),
(2, 'ZA');

-- --------------------------------------------------------

--
-- Table structure for table `Designation`
--

CREATE TABLE `Designation` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `unit` varchar(45) NOT NULL,
  `prix` int(11) NOT NULL,
  `sous_categories_id` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `fournisseur_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Designation`
--

INSERT INTO `Designation` (`id`, `nom`, `unit`, `prix`, `sous_categories_id`, `stock`, `fournisseur_id`) VALUES
(1, 'Café en grain', 'kg', 2, 1, 0, 2),
(2, 'marque1', 'piece', 4, 1, 1, 2),
(3, 'frigo', 'piece', 100, 2, 0, 3),
(5, 'Café Moulu', 'gr', 4, 1, 1, 2),
(6, 'Eau', 'Litre', 100, 1, 1, 3),
(7, 'Sirop De Citron', 'Litre', 100, 1, 1, 3),
(8, 'Baguette', 'piece', 100, 2, 1, 3),
(9, 'Bagel', 'piece', 100, 2, 1, 3),
(10, 'Croissant', 'piece', 100, 2, 0, 3),
(11, 'Bouteille cola', 'litre', 4, 3, 1, 2),
(12, 'Schtroumpfs', 'kg', 100, 3, 0, 3),
(13, 'Fraise tagada', 'kg', 100, 3, 0, 3),
(14, 'Dragibus', 'kg', 100, 3, 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `adresse` varchar(45) NOT NULL,
  `cp` varchar(45) DEFAULT NULL,
  `ville` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `tel` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fournisseur`
--

INSERT INTO `fournisseur` (`id`, `nom`, `adresse`, `cp`, `ville`, `email`, `tel`) VALUES
(1, 'Auchan', '23 rue de la f', '37', 'Tours', NULL, '654343'),
(2, 'Express', '22 rue jean moulin', '37', 'Tours', NULL, NULL),
(3, 'conforma', '33 rue jean Francois', '37', 'Tours', NULL, '08799');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_member` varchar(255) DEFAULT NULL,
  `email` varchar(64) NOT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `valid` tinyint(1) NOT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `budget` int(11) DEFAULT NULL,
  `id_role` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `message` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `notification` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_product` varchar(255) NOT NULL,
  `unit` varchar(45) NOT NULL,
  `price` int(11) NOT NULL,
  `id_sub_category` int(10) UNSIGNED NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `id_provider` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `provider`
--

CREATE TABLE `provider` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_provider` varchar(255) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `zip_code` varchar(45) DEFAULT NULL,
  `town` varchar(100) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quantite`
--

CREATE TABLE `quantite` (
  `id` int(11) NOT NULL,
  `unit` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_role` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Role_utilisateur`
--

CREATE TABLE `Role_utilisateur` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Role_utilisateur`
--

INSERT INTO `Role_utilisateur` (`id`, `nom`) VALUES
(1, 'RC'),
(2, 'RA'),
(3, 'Gestionnaire');

-- --------------------------------------------------------

--
-- Table structure for table `sous_categories`
--

CREATE TABLE `sous_categories` (
  `id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `imageUrl` varchar(255) NOT NULL,
  `categories_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sous_categories`
--

INSERT INTO `sous_categories` (`id`, `title`, `description`, `imageUrl`, `categories_id`) VALUES
(1, 'Boisson', 'Café, infusion, sirop...', '/images/subcategory/sake.svg', 1),
(2, 'Boulangerie', 'Bagel, Baguette, Croissant...', '/images/subcategory/bread.svg', 1),
(3, 'Confiserie', 'Dragibus, Fraises Tagada, Softi Fruits...', '/images/subcategory/candy.svg', 1),
(4, 'Epicerie Salée', 'Cacahuète, Houmous, Semoule de Blé...', '/images/subcategory/chips.svg', 1),
(5, 'Epicerie Sucrée', 'Chocolat en poudre, confiture d\\\'abricot, Galette au beurre...', '/images/subcategory/jam.svg', 1),
(6, 'Fruits et légumes frais', 'Abricot, Aneth, Cerise...', '/images/subcategory/harvest.svg', 1),
(7, 'Fruits sec', 'Abricot sec, Amandes, Dates sèches...', '/images/subcategory/almond.svg', 1),
(8, 'Sauces et condiments', 'Cornichons, Gros Sel, Poivre...', '/images/subcategory/salt-and-pepper.svg', 1),
(9, 'Surgelés', 'Pains Burger, Cornet de frites...', '/images/subcategory/snowflake.svg', 1),
(10, 'Viandes et Poissons', 'Jambon, Rillettes, Saindoux...', '/images/subcategory/meat.svg', 1),
(43, 'Cuisine', 'Bouilloire, cafetiere, film alimentaire...', '/images/subcategory/coffee-machine.svg', 2),
(44, 'Vaiselle', 'Corbeilles, couteaux, saladier...', '/images/subcategory/plate.svg', 2),
(45, 'Vaiselle bio-compostable', 'Assiettes en pulpe, couteaux en bois...', '/images/subcategory/bio.svg', 2),
(46, 'Hygiène', 'Diffuseur, essuie-tout, savon...', '/images/subcategory/snowflake.svg', 3),
(47, 'Droguerie', 'Bougie, pelotte de ficelle, film de palettisation transparent...', '/images/subcategory/aromatic-candle.svg', 3),
(48, 'Ménage', 'Balayette, brosse, désinfectant...', '/images/subcategory/broom.svg', 3),
(49, 'Pharmacie', 'Bombe anti-moustique, pince à tiques, Spay...', '/images/subcategory/pharma.svg', 3),
(50, 'Fournitures de bureau', 'Adhésif, colle, ciseaux...', '/images/subcategory/tape.svg', 4),
(51, 'Papeterie', 'Bloc Post-it, cahiers, chemise...', '/images/subcategory/post-it.svg', 4),
(52, 'Piles', 'Pile LR03 Alcaline, Pile LR6 Alcaline... ', '/images/subcategory/battery.svg', 4),
(53, 'Bazar', 'Cadenas, cintres, fil de peche...', '/images/subcategory/design.svg', 5),
(54, 'Électroménager et électricité', 'Aspirateur, fer à repasser, multi-prise...', '/images/subcategory/vacuum.svg', 5),
(55, 'Jeux', 'Ballon de football, boules de campagne, jeu de molky...', '/images/subcategory/ball.svg', 5),
(56, 'Luminaires', 'Halogènes, lampes de chevet, lampes sur pied...', '/images/subcategory/lighting.svg', 5),
(57, 'Aménagements', 'Abreuvoir, bacs plastique, barrières...', '/images/subcategory/water-trough.svg', 6),
(58, 'Chapiteaux-Tentes-Structures', 'Cabanes, chalets, ponts alu 2m...', '/images/subcategory/camping-tent.svg', 6);

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_sub_category` varchar(100) NOT NULL,
  `id_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_unit` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `password` varchar(300) NOT NULL,
  `valid` tinyint(1) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `budget` int(11) DEFAULT NULL,
  `Role_utilisateur_id` int(11) DEFAULT NULL,
  `date_ajout` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `password`, `valid`, `email`, `admin`, `budget`, `Role_utilisateur_id`, `date_ajout`) VALUES
(1, 'Theo', '123', 1, 'theo@gmail.com', NULL, NULL, 1, '2019-05-14 10:02:04'),
(2, 'gerg', '1233', 1, 'gerg@gmail.com', NULL, NULL, 2, '2019-05-14 10:02:04'),
(3, 'Maxime', '1234', 1, 'maxime@gmail.com', NULL, NULL, 3, '2019-05-14 10:02:04'),
(4, 'manar', '1234', 1, 'manar@gmail.com', NULL, NULL, 3, '2019-05-14 10:02:04'),
(5, 'paul', '0', 1, 'qdsfghj', NULL, NULL, 1, '2019-05-14 10:02:04'),
(6, 'sam', '88888', 1, 'dfygjhk', NULL, NULL, 2, '2019-05-14 10:02:04'),
(7, 'lili', '789', 1, 'dfthgjk', NULL, NULL, 3, '2019-05-14 10:02:04'),
(8, 'soso', '890', 1, 'rtgyhu', NULL, NULL, 1, '2019-05-14 10:02:04'),
(9, 'toto', '888', 1, 'fdghhj', NULL, NULL, 1, '2019-05-14 10:02:04'),
(11, 'New', 'User', NULL, 'New@test.com', NULL, NULL, 2, '2019-05-14 10:02:04'),
(12, 'New2', '123456', NULL, 'New2@test.com', NULL, NULL, 3, '2019-05-14 10:02:04'),
(13, 'New2', '123456', NULL, 'New2@test.com', NULL, NULL, 3, '2019-05-14 10:03:17'),
(14, 'New2', '123456', NULL, 'New2@test.com', NULL, NULL, 3, '2019-05-15 07:39:13'),
(15, 'New2', '123456', NULL, 'New2@test.com', NULL, NULL, 3, '2019-05-15 07:43:12'),
(16, 'New2', '123456', NULL, 'New2@test.com', NULL, NULL, 3, '2019-05-16 11:18:32'),
(17, 'oui', 'non', NULL, 'qwewqe@qwe.fr', NULL, NULL, 1, '2019-05-23 12:26:15'),
(23, 'aaaaa', '$2y$10$BgIOLyUpKIkz92vnZxXQ/ud/Vh7YvqLXVK5xWj/GRtPUeDFVOTHr6', NULL, 'New2@test.com', NULL, NULL, 1, '2019-05-23 12:36:51'),
(24, 'Nouvel Utilisateur', '$2y$10$dUqSD7Z1yfAK/moBHgOJ6eV02V.plIp6THeC2BQhGAPf2vdC6qG5O', NULL, 'adresse@test.com', NULL, NULL, 1, '2019-05-23 13:11:34'),
(25, '', '$2y$10$Uh5eGcw/OXfkUHXIL0mTee3SYsF432kBdwGNe1RED9oCx77AWswTa', NULL, '', NULL, NULL, NULL, '2019-05-23 13:27:25'),
(26, 'Nouvel Utilisateur', '$2y$10$YSC00y3ibkEaHXDVWHiisun4uW7KBvToTm6AHBwvNEKdWN/i77xSO', NULL, 'adresse@test.com', NULL, NULL, 1, '2019-05-23 13:27:26'),
(27, 'Nouvel Utilisateur', '$2y$10$Tpa.mqASyLIicQ1O.Svx3uYvlvH8VKihUALmznGWtWyZUdiw.OZFy', NULL, 'adresse@test.com', NULL, NULL, 1, '2019-05-23 14:10:52'),
(28, '', '$2y$10$KF0Byj2x/vMft6XbmdI.xetezd9H6mSNeboPKTYiwp0hpruqz233a', NULL, '', NULL, NULL, NULL, '2019-05-23 14:46:59'),
(29, 'Nouvel Utilisateur', '$2y$10$hirIQ4C.FUcgQxSRM65Pw..NMNo4STeG6pQaTigAccxhr.UcRJh2i', NULL, 'adresse@test.com', NULL, NULL, 1, '2019-05-23 14:46:59'),
(30, 'Nouvel Utilisateur', '$2y$10$dyAb6nnXvEv/by3brpHAJ.5/yb24mYzSHzYhjvl22EnD8HWhzRQaa', NULL, 'adresse@test.com', NULL, NULL, 1, '2019-05-23 14:47:37'),
(31, 'Nouvel Utilisateur', '$2y$10$b5UhDtXBvZVdVQxj4o4qMuDZcmqE0J85Pcj5T3i.tDCyt0hJmt2UG', NULL, 'adresse@test.com', NULL, NULL, 1, '2019-05-23 14:50:26'),
(32, 'Nouvel Utilisateur', '$2y$10$PIPI/Ck8xv1/CuqAARYqTeg5HyDCWqV5sP31hasOGeMF3.yAvmub2', NULL, 'adresse@test.com', NULL, NULL, 1, '2019-05-23 14:52:28'),
(33, '', '$2y$10$IBvaEUsT0mncQ1rh2zz3cOLovKFvxcfKWVXvTdtL7PufyzdUVvUW6', NULL, '', NULL, NULL, NULL, '2019-05-23 15:16:23'),
(34, '', '$2y$10$4Wf9QDLdz/QXEkxpJDl3ie0zsfkBUS9pJ6fRKh9MmrVRJtQOfVcli', NULL, '', NULL, NULL, NULL, '2019-05-23 15:17:15'),
(35, '', '$2y$10$A4WOdzJjS8LwO5cyjXiYhOAYMzmp2TaH/repp9782KobVqx/lLOxS', NULL, '', NULL, NULL, NULL, '2019-05-23 15:19:38'),
(36, '', '$2y$10$oaOdDiaChRQ2Z6OKcxIcZebWx98SnIJdr2KgzgqcCE7s16lF9Raje', NULL, '', NULL, NULL, NULL, '2019-05-23 15:19:39'),
(37, '', '$2y$10$jn5Rigpho/TrJsw1X2IxmOjfN4NstoPOU01vc6O2AnRr1pjQbpnqm', NULL, '', NULL, NULL, NULL, '2019-05-23 15:19:40'),
(38, '', '$2y$10$BydIeLx.9BCtncNk6.m91.XDpfGCQRah1gwuZ6saGYKA49aoFyUv2', NULL, '', NULL, NULL, NULL, '2019-05-23 15:19:43'),
(39, '', '$2y$10$jZ6uMYEBAAuRki8Gd3IjpuGrL5V8zIcjW.DZqz6pIJUb7YWDlRoWW', NULL, '', NULL, NULL, NULL, '2019-05-23 15:19:48'),
(40, '', '$2y$10$/h3w9tkaQvFUvY7Q6Eoshe0oSweRUC2wF1iPG71rV2OwsOLnVg5DC', NULL, '', NULL, NULL, NULL, '2019-05-23 15:19:49'),
(41, '', '$2y$10$iAYUBHouHUJOTP4EtZyY/eQ69MQIzsfxhJ10VG7rx46jMKl75Gezm', NULL, '', NULL, NULL, NULL, '2019-05-23 15:21:57'),
(42, '', '$2y$10$A0m0XNheKdX9AcXFOD/wzO6ZVXhmQ98NKaENGGg70QGtPnc3Jh5Ym', NULL, '', NULL, NULL, NULL, '2019-05-23 15:22:04'),
(43, '', '$2y$10$uwK12tDRo/b4hO4ubHK5KeLYFqlZ3TRvdM5KOgUBHTc3MLNBHQ/fa', NULL, '', NULL, NULL, NULL, '2019-05-23 15:22:10'),
(44, '', '$2y$10$tUXN3wWrj1FdHSW//faSz.62yUAr4rkpRXyWPGRwov8B3zT5UFu9u', NULL, '', NULL, NULL, NULL, '2019-05-23 15:22:50'),
(45, '', '$2y$10$eubpEUJdo5j8qsVVRy7Tp.kyGRhztsX6415oZWzgCrWcpJIVzLJ8q', NULL, '', NULL, NULL, NULL, '2019-05-23 15:24:28'),
(46, '', '$2y$10$XxViwUG2nd/4BEUCStBK/e1uh1Jn/YTiDl3PBLbYHGvtvb4ggCEnm', NULL, '', NULL, NULL, NULL, '2019-05-23 15:24:45'),
(47, '', '$2y$10$pb/IOcXcEUTC8LW8Nx7MmeaDeS0qVfwOELXZni2SFKU3fMqH8xJcu', NULL, '', NULL, NULL, NULL, '2019-05-23 15:24:45'),
(48, '', '$2y$10$zVrv5Xjdj2NuJugf4xX9EO3o.RqIabrYgL4DPXoUq2m4YTGF24b3y', NULL, '', NULL, NULL, NULL, '2019-05-23 15:24:57'),
(49, 'Hello', '$2y$10$SbzMW22zU4PUNOBk3eL8LuGYjZRbN8O6jVD.0HvJ4/f35qGWSzVzq', NULL, 'adresse@test.com', NULL, NULL, 1, '2019-05-23 15:24:57'),
(50, 'AA', '$2y$10$ASGDI7JD7df7pJtPKy8EF.zEi0v6UnSpv1p0eP8U/KiR7wtXbnG96', NULL, 'adresse@test.com', NULL, NULL, 1, '2019-05-23 15:26:04'),
(51, 'AA', '$2y$10$AxSL8yM6OT.fsT4AnqVzcu8KKczPl7b7/teo4ZW5TRND0Y4feaE.e', NULL, 'adresse@test.com', NULL, NULL, 1, '2019-05-23 15:26:43'),
(52, '', '$2y$10$wWyGrb/A5KDXjgvL94QTT.UjpUC2u0anzgJ9/Qy5PicLDnDXIqLce', NULL, '', NULL, NULL, NULL, '2019-05-24 07:54:27'),
(53, 'AA', '$2y$10$lrLNvdBAUYLqo1aowCUjg.GxOEQrF3QoZ2Wiw.aqthr3ktDcJCZTy', NULL, 'adresse@test.com', NULL, NULL, 1, '2019-05-24 07:54:27'),
(54, 'AA', '$2y$10$LjWDcs/rdna2UR06Jjv99.sWDFmCxQMeA9MnQla45VgaiYp8qleha', NULL, 'adresse@test.com', NULL, NULL, 1, '2019-05-24 09:17:19'),
(55, 'AA', '$2y$10$qCkAyLXozb7CnsYiCQ2xoOEC8S7eb08CjNNHUBgMwL/Hwpwh01/m6', NULL, 'adresse@test.com', NULL, NULL, 1, '2019-05-24 09:18:03'),
(56, 'azert', '$2y$10$ZfFH8.k1AJ06pOQ0MbsZWO1LBXJFmr0rVMRxcT8PoCJlrqG97CbNW', NULL, '', NULL, NULL, 1, '2019-05-24 09:29:52'),
(57, '', '$2y$10$Lb0sEUQvWCN3jw.Yrkekve3rlP7ibkUK2TNmiRnRiSxr6XYs9K4hy', NULL, '', NULL, NULL, NULL, '2019-05-24 09:35:08'),
(58, '', '$2y$10$ae.hQXcKT33Z1ehiAqMzCO7dSEBWOOK62oxnL4I/Neceisx5SyL0W', NULL, '', NULL, NULL, NULL, '2019-05-24 09:38:15'),
(59, 'Doe Jhon', '$2y$10$k/bCHDMeGDNIzxLXmsVxR.cgoDgOIpsA89H8h5D9nQWzvaLRvf4ei', NULL, 'jhon@doe.com', NULL, NULL, 1, '2019-05-24 09:38:16'),
(60, 'Mike', '$2y$10$lnzjBjNRAfSGlj6hMwynoua40sg.ijJ5baPd4HlwCbJ9J9I2qgcii', NULL, 'mike@codeofaninja.com', NULL, NULL, NULL, '2019-05-24 09:55:34'),
(61, '', '$2y$10$g7dc/u8.tJmESyaQ.UTGKeKjp4XgsbSpYX2XhadkFPx8eZP3cUYya', NULL, '', NULL, NULL, NULL, '2019-05-24 09:57:46'),
(62, 'Mike', '$2y$10$uDNwf2GGx9j5/VjHbw2z9edGy7.THWmpthWrd/ppdkvO8rDngcPZK', NULL, 'mike@codeofaninja.com', NULL, NULL, NULL, '2019-05-24 09:59:27'),
(63, 'Mike', '$2y$10$R1xhRJmlX4KwnxXz.bZ9jek1fECbUu8RoxUIaohSveWUqa5XiA9eC', NULL, 'mike@codeofaninja.com', NULL, NULL, NULL, '2019-05-24 09:59:52'),
(64, 'Clark Emilie', '$2y$10$TRazOc.btSyYhmlk4SyXJOeNyzE2gJlTC2THCiQBs2VLaa2UKB9ZK', NULL, 'emilie@clark.com', NULL, NULL, 1, '2019-05-24 10:00:07'),
(65, 'Mike', '$2y$10$leISEAoiQY0HuFUnN8VtfuTWFIilYflqkXDIgQK6yiEEhPzAv9H9a', NULL, 'mike@codeofaninja.com', NULL, NULL, NULL, '2019-05-24 10:00:31'),
(66, 'Mikeokok', '$2y$10$Ff6zc4EytVzQYLjKTBI4se5GMaIJU.0rTGXksmmEe.Tl0XxDftpoa', NULL, 'mike@codeofaninja.com', NULL, NULL, NULL, '2019-05-24 10:00:37'),
(67, '', '$2y$10$FV3onA5Ocroc8aPBNd..yOnjuVtq/xxogTOJJKNJUjvpiesNb0JBG', NULL, '', NULL, NULL, NULL, '2019-05-24 10:00:43'),
(68, 'Mikeokok', '$2y$10$HDZnlJfBQ0NRXd629RbkI.HeLPLIJ.aQASDH5bsCfstlXQKegIkDK', NULL, 'mike@codeofaninja.com', NULL, NULL, NULL, '2019-05-24 10:02:30'),
(69, 'Mikeokok', '$2y$10$2jHm0htBT5aGf5bZTDZ09.POLGq/JMsxlFuj1HmyL9vUtLbcsqHF.', NULL, 'mike@codeofaninja.com', NULL, NULL, 1, '2019-05-24 10:02:50'),
(70, 'Mikeokok', '$2y$10$xXa9Z58Wj8cnYe57tgKSpO3gQ0G5EtZNcBgvRG/bQ5FvRomV0bwzK', NULL, 'mike@codeofaninja.com', NULL, NULL, 1, '2019-05-24 10:03:46'),
(71, 'hello', '$2y$10$FqXvz2f3TyKxO8cM4iM49uWQMo2v58WyMpl7AChR1um6/PtNi5FGK', NULL, 'hello@world.com', NULL, NULL, NULL, '2019-05-24 10:04:11'),
(72, 'hhhh', '$2y$10$O0M1EwwMeqiCH9kIZfpU5ueV6lcvpDUXNa3uf7L/I1SerDM/Rl5Lm', NULL, 'email@zae.fr', NULL, NULL, 2, '2019-05-24 10:15:40'),
(73, 'Mikeokok', '$2y$10$vs72.nFk36aBJP4qWl7so.43bNm0GRrEGAD1bB1DUwL6DJiNcMZpS', NULL, 'mike@codeofaninja.com', NULL, NULL, 1, '2019-05-24 10:18:54'),
(74, 'Mikeokok', '$2y$10$oHKxUTSuYM1zV6CU0IXKlOqFVZdlkzi3p1vr89eDTAPSs.qU3kkW6', NULL, 'mike@codeofaninja.com', NULL, NULL, 1, '2019-05-24 10:19:43'),
(75, 'Hello', '$2y$10$eOCLSud.jaH83ZLr3o53ieL5JR39IT/mX/UrBLo1r1Hkk295c/p.y', NULL, 'hello@theo.com', NULL, NULL, 3, '2019-05-24 10:20:25'),
(76, 'Testpoourtheo', '$2y$10$XkkaUyVmUWq7Q3lVMFswzeNSjAsyIhICApt0hQpYR0ZWGtjN6//TG', NULL, 'test@theo.com', NULL, NULL, 3, '2019-05-24 10:21:58'),
(77, 'Deuxiemetestpourtheo', '$2y$10$MYL5TBba3SSHN6dSbzg3tuTTs5D1e.lU8STAFPpbXcbgZSs4e1sQO', NULL, 'deuxieme@test.com', NULL, NULL, 2, '2019-05-24 10:22:38'),
(78, 'Deuxiemetestpourtheo', '$2y$10$zLsJrEhmPFX8nue1jhN4rOmWgm5nA2CaI0YCXrF8Oh3DW2N.JA9RK', NULL, 'deuxieme@test.com', NULL, NULL, 2, '2019-05-24 10:25:43'),
(79, '', '$2y$10$Q5/J0cRka.PHuIGFcg7xS.VqQkvId4QdRGmrrOjud3AuJqB1gUE5O', NULL, '', NULL, NULL, NULL, '2019-05-24 12:21:43'),
(80, '', '$2y$10$jpxurLaaYSj7fHu66v04iu229iECrV3/e99zINnAzuS3SSWPJ4WWO', NULL, '', NULL, NULL, NULL, '2019-05-24 12:21:51'),
(81, '', '$2y$10$Lb9uknck/HspxlPVALgtGOUG3wNJfuvAamUhpYs1S7ylixu5jX6J6', NULL, '', NULL, NULL, NULL, '2019-05-24 12:21:52'),
(82, '', '$2y$10$IGEieQ/bgUWTtjCJLqH6guhznW1XcTRq8y8XYI8iIYvll0OEJbrRa', NULL, '', NULL, NULL, NULL, '2019-07-08 09:36:17'),
(83, '', '$2y$10$GNsFIRo59GIM5xDguq24K./rX02FeZoMuZx6gGBdShBb7Jv40d2CS', NULL, '', NULL, NULL, NULL, '2019-07-08 12:39:58'),
(84, 'Test Test 02', '$2y$10$0dCFWPTtqFjhuijxrkUrPOupgdTDotsmu6m1ZmpWTRhfNjgfHyTFa', NULL, 'Test@02.com', NULL, NULL, 2, '2019-07-08 12:39:58'),
(85, '', '$2y$10$xW18TUZVrDBfAB21lMejpe5lxrVhCwGGZvhOsOx1R4AQ04K0D8ub6', NULL, '', NULL, NULL, NULL, '2019-07-09 09:22:21'),
(86, 'Database test', '$2y$10$kkIjS5xyPNWaVCtwRhjxueqF.Evgc.wUFd2ugV9xZVD9qtkdle3Se', NULL, 'data@base.com', NULL, NULL, 1, '2019-07-09 09:22:22'),
(87, '', '$2y$10$WP65TPS3n0/6KM8J6aLf6OtImk7zXb3kgWLfrwN4Z5SH4szLxW2QG', NULL, '', NULL, NULL, NULL, '2019-07-11 15:16:12'),
(88, 'php', '$2y$10$0nczaEKYIRr2CKBcAuo4Wu.iJqnPNLIbypfbVA5EqOAdoGJTaFXGO', NULL, 'php', NULL, NULL, 2, '2019-07-11 15:28:11');

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur_has_categories`
--

CREATE TABLE `utilisateur_has_categories` (
  `utilisateur_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `utilisateur_has_categories`
--

INSERT INTO `utilisateur_has_categories` (`utilisateur_id`, `categories_id`) VALUES
(4, 1),
(7, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur_has_commande`
--

CREATE TABLE `utilisateur_has_commande` (
  `utilisateur_id` int(11) NOT NULL,
  `commande_id_commande` int(11) NOT NULL,
  `valid` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `utilisateur_has_commande`
--

INSERT INTO `utilisateur_has_commande` (`utilisateur_id`, `commande_id_commande`, `valid`) VALUES
(1, 2, 0),
(4, 3, 0),
(5, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur_has_Designation`
--

CREATE TABLE `utilisateur_has_Designation` (
  `utilisateur_id` int(11) NOT NULL,
  `Designation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur_has_utilisateur`
--

CREATE TABLE `utilisateur_has_utilisateur` (
  `utilisateur_id` int(11) NOT NULL,
  `utilisateur_id1` int(11) NOT NULL,
  `commission_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `utilisateur_has_utilisateur`
--

INSERT INTO `utilisateur_has_utilisateur` (`utilisateur_id`, `utilisateur_id1`, `commission_id`) VALUES
(2, 5, 1),
(2, 8, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `command`
--
ALTER TABLE `command`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commande_has_Designation`
--
ALTER TABLE `commande_has_Designation`
  ADD PRIMARY KEY (`commande_id_commande`,`Designation_id`),
  ADD KEY `fk_commande_has_Designation_Designation1_idx` (`Designation_id`),
  ADD KEY `fk_commande_has_Designation_commande1_idx` (`commande_id_commande`);

--
-- Indexes for table `commission`
--
ALTER TABLE `commission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Designation`
--
ALTER TABLE `Designation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Designation_sous-categories1_idx` (`sous_categories_id`),
  ADD KEY `fk_Designation_fournisseur1_idx` (`fournisseur_id`);

--
-- Indexes for table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_utilisateur_nom-utilisateur1_idx` (`id_role`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_Designation_sous-categories1_idx` (`id_sub_category`),
  ADD KEY `fk_Designation_fournisseur1_idx` (`id_provider`);

--
-- Indexes for table `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `quantite`
--
ALTER TABLE `quantite`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `Role_utilisateur`
--
ALTER TABLE `Role_utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sous_categories`
--
ALTER TABLE `sous_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_sous-categories_categories_idx` (`categories_id`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_sous-categories_categories_idx` (`id_category`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_utilisateur_nom-utilisateur1_idx` (`Role_utilisateur_id`);

--
-- Indexes for table `utilisateur_has_categories`
--
ALTER TABLE `utilisateur_has_categories`
  ADD PRIMARY KEY (`utilisateur_id`,`categories_id`),
  ADD KEY `fk_utilisateur_has_categories_categories1_idx` (`categories_id`),
  ADD KEY `fk_utilisateur_has_categories_utilisateur1_idx` (`utilisateur_id`);

--
-- Indexes for table `utilisateur_has_commande`
--
ALTER TABLE `utilisateur_has_commande`
  ADD PRIMARY KEY (`utilisateur_id`,`commande_id_commande`),
  ADD KEY `fk_utilisateur_has_commande_commande1_idx` (`commande_id_commande`),
  ADD KEY `fk_utilisateur_has_commande_utilisateur1_idx` (`utilisateur_id`);

--
-- Indexes for table `utilisateur_has_Designation`
--
ALTER TABLE `utilisateur_has_Designation`
  ADD PRIMARY KEY (`utilisateur_id`,`Designation_id`),
  ADD KEY `fk_utilisateur_has_Designation_Designation1_idx` (`Designation_id`),
  ADD KEY `fk_utilisateur_has_Designation_utilisateur1_idx` (`utilisateur_id`);

--
-- Indexes for table `utilisateur_has_utilisateur`
--
ALTER TABLE `utilisateur_has_utilisateur`
  ADD PRIMARY KEY (`utilisateur_id`,`utilisateur_id1`),
  ADD KEY `fk_utilisateur_has_utilisateur_utilisateur2_idx` (`utilisateur_id1`),
  ADD KEY `fk_utilisateur_has_utilisateur_utilisateur1_idx` (`utilisateur_id`),
  ADD KEY `fk_utilisateur_has_utilisateur_commission1_idx` (`commission_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `command`
--
ALTER TABLE `command`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `commission`
--
ALTER TABLE `commission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Designation`
--
ALTER TABLE `Designation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `provider`
--
ALTER TABLE `provider`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quantite`
--
ALTER TABLE `quantite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Role_utilisateur`
--
ALTER TABLE `Role_utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sous_categories`
--
ALTER TABLE `sous_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `commande_has_Designation`
--
ALTER TABLE `commande_has_Designation`
  ADD CONSTRAINT `fk_commande_has_Designation_Designation1` FOREIGN KEY (`Designation_id`) REFERENCES `Designation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_commande_has_Designation_commande1` FOREIGN KEY (`commande_id_commande`) REFERENCES `command` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Designation`
--
ALTER TABLE `Designation`
  ADD CONSTRAINT `fk_Designation_sous-categories1` FOREIGN KEY (`sous_categories_id`) REFERENCES `sous_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `fk_member_role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_provider` FOREIGN KEY (`id_provider`) REFERENCES `provider` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_product_sub_category` FOREIGN KEY (`id_sub_category`) REFERENCES `sub_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD CONSTRAINT `fk_sub_category_category` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `utilisateur_has_categories`
--
ALTER TABLE `utilisateur_has_categories`
  ADD CONSTRAINT `fk_utilisateur_has_categories_utilisateur1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `utilisateur_has_commande`
--
ALTER TABLE `utilisateur_has_commande`
  ADD CONSTRAINT `fk_utilisateur_has_commande_utilisateur1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `utilisateur_has_Designation`
--
ALTER TABLE `utilisateur_has_Designation`
  ADD CONSTRAINT `fk_utilisateur_has_Designation_Designation1` FOREIGN KEY (`Designation_id`) REFERENCES `Designation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_utilisateur_has_Designation_utilisateur1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `utilisateur_has_utilisateur`
--
ALTER TABLE `utilisateur_has_utilisateur`
  ADD CONSTRAINT `fk_utilisateur_has_utilisateur_commission1` FOREIGN KEY (`commission_id`) REFERENCES `commission` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Database: `tds2`
--
CREATE DATABASE IF NOT EXISTS `tds2` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `tds2`;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text,
  `imageUrl` varchar(255) DEFAULT NULL,
  `deadline` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `title`, `description`, `imageUrl`, `deadline`) VALUES
(1, 'Alimentation', 'Boisson, boulangerie, cremerie, ...', '/images/category/diet.svg', NULL),
(2, 'Cuisine/Vaiselle', 'Cuisine, vaiselle, bio-compostable, ...', '/images/category/kitchen.svg', NULL),
(3, 'Hygiène et droguerie', 'Hygiène, pharmacie, droguerie, ...', '/images/category/hand-wash.svg', NULL),
(4, 'Papeterie & Bureautique', 'Fourniture de bureau, papeteries, piles, ...', '/images/category/stationery.svg', NULL),
(5, 'Petit matériels', 'Bazar, electroménager, jeux, ...', '/images/category/stock.svg', NULL),
(6, 'Aménagements', 'Aménagement, chapiteaux, tentes, ...', '/images/category/wooden.svg', NULL),
(7, 'Mobilier', 'Table, chaise, ...', '/images/category/furniture.svg', NULL),
(8, 'Plomberie', 'Eviers, pompes, tuyaux, ...', '/images/category/plumbing.svg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `command`
--

CREATE TABLE `command` (
  `id` int(10) UNSIGNED NOT NULL,
  `command_nb` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `nb_item` int(11) DEFAULT NULL,
  `total_price` int(11) NOT NULL,
  `comment` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `id_commission` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `command`
--

INSERT INTO `command` (`id`, `command_nb`, `creation_date`, `nb_item`, `total_price`, `comment`, `status`, `id_commission`) VALUES
(1, 1, '2019-05-10 00:00:00', 10, 100, 'fghj', 0, NULL),
(2, 2, '2019-05-23 00:00:00', 50, 200, 'rtlol', 1, NULL),
(3, 3, '2019-05-08 00:00:00', 123, 1000, 'okokokokok', 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `commission`
--

CREATE TABLE `commission` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_commission` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `commission`
--

INSERT INTO `commission` (`id`, `name_commission`) VALUES
(1, 'Com1'),
(2, 'Com2'),
(3, 'Com3');

-- --------------------------------------------------------

--
-- Table structure for table `link_command_product`
--

CREATE TABLE `link_command_product` (
  `id_command` int(10) UNSIGNED NOT NULL,
  `id_product` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `link_command_product`
--

INSERT INTO `link_command_product` (`id_command`, `id_product`, `quantity`) VALUES
(1, 1, 1),
(1, 5, 7),
(1, 6, 2),
(1, 9, 3),
(2, 7, 1),
(2, 11, 1),
(2, 14, 3),
(3, 6, 1),
(3, 10, 4),
(3, 12, 100),
(3, 13, 10);

-- --------------------------------------------------------

--
-- Table structure for table `link_member_category`
--

CREATE TABLE `link_member_category` (
  `id_member` int(10) UNSIGNED NOT NULL,
  `id_category` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `link_member_category`
--

INSERT INTO `link_member_category` (`id_member`, `id_category`) VALUES
(1, 1),
(2, 1),
(3, 1),
(1, 2),
(3, 2),
(2, 3),
(4, 3),
(2, 5),
(1, 6),
(2, 6),
(3, 7),
(4, 7),
(4, 8);

-- --------------------------------------------------------

--
-- Table structure for table `link_member_command`
--

CREATE TABLE `link_member_command` (
  `id_member` int(10) UNSIGNED NOT NULL,
  `id_command` int(10) UNSIGNED NOT NULL,
  `valid` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `link_member_command`
--

INSERT INTO `link_member_command` (`id_member`, `id_command`, `valid`) VALUES
(2, 1, NULL),
(3, 2, NULL),
(4, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `link_member_member`
--

CREATE TABLE `link_member_member` (
  `id_member1` int(10) UNSIGNED NOT NULL,
  `id_commission` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `link_member_member`
--

INSERT INTO `link_member_member` (`id_member1`, `id_commission`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `link_member_product`
--

CREATE TABLE `link_member_product` (
  `id_member` int(10) UNSIGNED NOT NULL,
  `id_product` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `link_member_product`
--

INSERT INTO `link_member_product` (`id_member`, `id_product`) VALUES
(2, 8),
(2, 9);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_member` varchar(255) DEFAULT NULL,
  `email` varchar(64) NOT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `budget` int(11) DEFAULT NULL,
  `id_role` int(10) UNSIGNED DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `name_member`, `email`, `pass`, `valid`, `admin`, `budget`, `id_role`, `creation_date`) VALUES
(1, 'Theo', 'theo@gmail.com', '123', 1, 0, NULL, 1, '2019-05-14 10:02:04'),
(2, 'gerg', 'gerg@gmail.com', '1233', 1, 0, NULL, 2, '2019-05-14 10:02:04'),
(3, 'Maxime', 'maxime@gmail.com', '1234', 1, 1, NULL, 3, '2019-05-14 10:02:04'),
(4, 'manar', 'manar@gmail.com', '1234', 1, 1, NULL, 3, '2019-05-14 10:02:04'),
(5, 'paul', 'qdsfghj', '0', 1, 0, NULL, 1, '2019-05-14 10:02:04'),
(6, 'sam', 'dfygjhk', '88888', 1, 0, NULL, 2, '2019-05-14 10:02:04'),
(7, 'lili', 'dfthgjk', '789', 1, 0, NULL, 3, '2019-05-14 10:02:04'),
(8, 'soso', 'rtgyhu', '890', 1, 0, NULL, 1, '2019-05-14 10:02:04'),
(9, 'toto', 'fdghhj', '888', 1, 0, NULL, 1, '2019-05-14 10:02:04'),
(11, 'New', 'New@test.com', 'User', 1, 0, NULL, 2, '2019-05-14 10:02:04'),
(12, 'New2', 'New2@test.com', '123456', 1, 0, NULL, 3, '2019-05-14 10:02:04'),
(13, 'New2', 'New2@test.com', '123456', 1, 0, NULL, 3, '2019-05-14 10:03:17'),
(14, 'New2', 'New2@test.com', '123456', 1, 0, NULL, 3, '2019-05-15 07:39:13'),
(15, '', 'New2@test.com', '123456', 1, 0, NULL, 3, '2019-05-15 07:43:12'),
(16, 'New2', 'New2@test.com', '123456', 1, 0, NULL, 3, '2019-05-16 11:18:32'),
(17, 'oui', 'qwewqe@qwe.fr', 'non', 1, 0, NULL, 1, '2019-05-23 12:26:15'),
(23, 'aaaaa', 'New2@test.com', '$2y$10$BgIOLyUpKIkz92vnZxXQ/ud/Vh7YvqLXVK5xWj/GRtPUeDFVOTHr6', 1, 0, NULL, 1, '2019-05-23 12:36:51'),
(24, 'Nouvel Utilisateur', 'adresse@test.com', '$2y$10$dUqSD7Z1yfAK/moBHgOJ6eV02V.plIp6THeC2BQhGAPf2vdC6qG5O', 1, 0, NULL, 1, '2019-05-23 13:11:34'),
(26, 'Nouvel Utilisateur', 'adresse@test.com', '$2y$10$YSC00y3ibkEaHXDVWHiisun4uW7KBvToTm6AHBwvNEKdWN/i77xSO', 1, 0, NULL, 1, '2019-05-23 13:27:26'),
(27, 'Nouvel Utilisateur', 'adresse@test.com', '$2y$10$Tpa.mqASyLIicQ1O.Svx3uYvlvH8VKihUALmznGWtWyZUdiw.OZFy', 1, 0, NULL, 1, '2019-05-23 14:10:52'),
(29, 'Nouvel Utilisateur', 'adresse@test.com', '$2y$10$hirIQ4C.FUcgQxSRM65Pw..NMNo4STeG6pQaTigAccxhr.UcRJh2i', 1, 0, NULL, 1, '2019-05-23 14:46:59'),
(30, 'Nouvel Utilisateur', 'adresse@test.com', '$2y$10$dyAb6nnXvEv/by3brpHAJ.5/yb24mYzSHzYhjvl22EnD8HWhzRQaa', 1, 0, NULL, 1, '2019-05-23 14:47:37'),
(31, 'Nouvel Utilisateur', 'adresse@test.com', '$2y$10$b5UhDtXBvZVdVQxj4o4qMuDZcmqE0J85Pcj5T3i.tDCyt0hJmt2UG', 1, 0, NULL, 1, '2019-05-23 14:50:26'),
(32, 'Nouvel Utilisateur', 'adresse@test.com', '$2y$10$PIPI/Ck8xv1/CuqAARYqTeg5HyDCWqV5sP31hasOGeMF3.yAvmub2', 1, 0, NULL, 1, '2019-05-23 14:52:28'),
(49, 'Hello', 'adresse@test.com', '$2y$10$SbzMW22zU4PUNOBk3eL8LuGYjZRbN8O6jVD.0HvJ4/f35qGWSzVzq', 1, 0, NULL, 1, '2019-05-23 15:24:57'),
(50, 'AA', 'adresse@test.com', '$2y$10$ASGDI7JD7df7pJtPKy8EF.zEi0v6UnSpv1p0eP8U/KiR7wtXbnG96', 1, 0, NULL, 1, '2019-05-23 15:26:04'),
(51, 'AA', 'adresse@test.com', '$2y$10$AxSL8yM6OT.fsT4AnqVzcu8KKczPl7b7/teo4ZW5TRND0Y4feaE.e', 1, 0, NULL, 1, '2019-05-23 15:26:43'),
(53, 'AA', 'adresse@test.com', '$2y$10$lrLNvdBAUYLqo1aowCUjg.GxOEQrF3QoZ2Wiw.aqthr3ktDcJCZTy', 1, 0, NULL, 1, '2019-05-24 07:54:27'),
(54, 'AA', 'adresse@test.com', '$2y$10$LjWDcs/rdna2UR06Jjv99.sWDFmCxQMeA9MnQla45VgaiYp8qleha', 1, 0, NULL, 1, '2019-05-24 09:17:19'),
(55, 'AA', 'adresse@test.com', '$2y$10$qCkAyLXozb7CnsYiCQ2xoOEC8S7eb08CjNNHUBgMwL/Hwpwh01/m6', 1, 0, NULL, 1, '2019-05-24 09:18:03'),
(56, 'azert', '', '$2y$10$ZfFH8.k1AJ06pOQ0MbsZWO1LBXJFmr0rVMRxcT8PoCJlrqG97CbNW', 1, 0, NULL, 1, '2019-05-24 09:29:52'),
(59, 'Doe Jhon', 'jhon@doe.com', '$2y$10$k/bCHDMeGDNIzxLXmsVxR.cgoDgOIpsA89H8h5D9nQWzvaLRvf4ei', 1, 0, NULL, 1, '2019-05-24 09:38:16'),
(64, 'Clark Emilie', 'emilie@clark.com', '$2y$10$TRazOc.btSyYhmlk4SyXJOeNyzE2gJlTC2THCiQBs2VLaa2UKB9ZK', 1, 0, NULL, 1, '2019-05-24 10:00:07'),
(69, 'Mikeokok', 'mike@codeofaninja.com', '$2y$10$2jHm0htBT5aGf5bZTDZ09.POLGq/JMsxlFuj1HmyL9vUtLbcsqHF.', 1, 0, NULL, 1, '2019-05-24 10:02:50'),
(70, 'Mikeokok', 'mike@codeofaninja.com', '$2y$10$xXa9Z58Wj8cnYe57tgKSpO3gQ0G5EtZNcBgvRG/bQ5FvRomV0bwzK', 1, 0, NULL, 1, '2019-05-24 10:03:46'),
(72, 'hhhh', 'email@zae.fr', '$2y$10$O0M1EwwMeqiCH9kIZfpU5ueV6lcvpDUXNa3uf7L/I1SerDM/Rl5Lm', 1, 0, NULL, 2, '2019-05-24 10:15:40'),
(73, 'Mikeokok', 'mike@codeofaninja.com', '$2y$10$vs72.nFk36aBJP4qWl7so.43bNm0GRrEGAD1bB1DUwL6DJiNcMZpS', 1, 0, NULL, 1, '2019-05-24 10:18:54'),
(74, 'Mikeokok', 'mike@codeofaninja.com', '$2y$10$oHKxUTSuYM1zV6CU0IXKlOqFVZdlkzi3p1vr89eDTAPSs.qU3kkW6', 1, 0, NULL, 1, '2019-05-24 10:19:43'),
(75, 'Hello', 'hello@theo.com', '$2y$10$eOCLSud.jaH83ZLr3o53ieL5JR39IT/mX/UrBLo1r1Hkk295c/p.y', 1, 0, NULL, 3, '2019-05-24 10:20:25'),
(76, 'Testpoourtheo', 'test@theo.com', '$2y$10$XkkaUyVmUWq7Q3lVMFswzeNSjAsyIhICApt0hQpYR0ZWGtjN6//TG', 1, 0, NULL, 3, '2019-05-24 10:21:58'),
(77, 'Deuxiemetestpourtheo', 'deuxieme@test.com', '$2y$10$MYL5TBba3SSHN6dSbzg3tuTTs5D1e.lU8STAFPpbXcbgZSs4e1sQO', 1, 0, NULL, 2, '2019-05-24 10:22:38'),
(78, 'Deuxiemetestpourtheo', 'deuxieme@test.com', '$2y$10$zLsJrEhmPFX8nue1jhN4rOmWgm5nA2CaI0YCXrF8Oh3DW2N.JA9RK', 1, 0, NULL, 2, '2019-05-24 10:25:43'),
(84, 'Test Test 02', 'Test@02.com', '$2y$10$0dCFWPTtqFjhuijxrkUrPOupgdTDotsmu6m1ZmpWTRhfNjgfHyTFa', 1, 0, NULL, 2, '2019-07-08 12:39:58'),
(86, 'Database test', 'data@base.com', '$2y$10$kkIjS5xyPNWaVCtwRhjxueqF.Evgc.wUFd2ugV9xZVD9qtkdle3Se', 1, 0, NULL, 1, '2019-07-09 09:22:22'),
(88, 'php', 'php', '$2y$10$0nczaEKYIRr2CKBcAuo4Wu.iJqnPNLIbypfbVA5EqOAdoGJTaFXGO', 1, 1, NULL, 2, '2019-07-11 15:28:11'),
(89, 'qweqweqwe', 'qweqwe@qwe.qwe', '$2y$10$92nQJj8cfFqK8WtOE3PmJufJGHJ0PS.tQk5/qDcTshuss7s7PiDnC', NULL, NULL, NULL, 2, NULL),
(90, 'qweqweqwe', 'qweqwe@qwe.qwe', '$2y$10$15IETnlAJaSJV7CG3dcJYOOiEXzf49bJDGrvEe3.EfRgaoeuyWxa2', NULL, NULL, NULL, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `message` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `notification` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_product` varchar(255) NOT NULL,
  `unit` varchar(45) NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `id_sub_category` int(10) UNSIGNED DEFAULT NULL,
  `id_provider` int(10) UNSIGNED DEFAULT NULL,
  `valid` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name_product`, `unit`, `price`, `stock`, `id_sub_category`, `id_provider`, `valid`) VALUES
(1, 'Café en grain', 'kg', 2, 0, 1, 2, NULL),
(2, 'marque1', 'piece', 4, 1, 1, 2, NULL),
(3, 'frigo', 'piece', 100, 0, 2, 3, NULL),
(5, 'Café Moulu', 'gr', 4, 1, 1, 2, NULL),
(6, 'Eau', 'Litre', 100, 1, 1, 3, NULL),
(7, 'Sirop De Citron', 'Litre', 100, 1, 1, 3, NULL),
(8, 'Baguette', 'piece', 100, 1, 2, 3, NULL),
(9, 'Bagel', 'piece', 100, 1, 2, 3, NULL),
(10, 'Croissant', 'piece', 100, 0, 2, 3, NULL),
(11, 'Bouteille cola', 'litre', 4, 1, 3, 2, NULL),
(12, 'Schtroumpfs', 'kg', 100, 0, 3, 3, NULL),
(13, 'Fraise tagada', 'kg', 100, 0, 3, 3, NULL),
(14, 'Dragibus', 'kg', 100, 0, 3, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `provider`
--

CREATE TABLE `provider` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_provider` varchar(255) NOT NULL,
  `adress` varchar(255) DEFAULT NULL,
  `zip_code` varchar(45) DEFAULT NULL,
  `town` varchar(100) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `provider`
--

INSERT INTO `provider` (`id`, `name_provider`, `adress`, `zip_code`, `town`, `email`, `phone`) VALUES
(1, 'Auchan', '23 rue de la f', '37', 'Tours', NULL, '654343'),
(2, 'Express', '22 rue jean moulin', '37', 'Tours', NULL, NULL),
(3, 'conforma', '33 rue jean Francois', '37', 'Tours', NULL, '08799');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_role` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name_role`) VALUES
(1, 'RC'),
(2, 'RA'),
(3, 'Gestionnaire');

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text,
  `imageUrl` varchar(255) DEFAULT NULL,
  `id_category` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sub_category`
--

INSERT INTO `sub_category` (`id`, `title`, `description`, `imageUrl`, `id_category`) VALUES
(1, 'Boisson', 'Café, infusion, sirop...', '/images/subcategory/sake.svg', 1),
(2, 'Boulangerie', 'Bagel, Baguette, Croissant...', '/images/subcategory/bread.svg', 1),
(3, 'Confiserie', 'Dragibus, Fraises Tagada, Softi Fruits...', '/images/subcategory/candy.svg', 1),
(4, 'Epicerie Salée', 'Cacahuète, Houmous, Semoule de Blé...', '/images/subcategory/chips.svg', 1),
(5, 'Epicerie Sucrée', 'Chocolat en poudre, confiture d\\\'abricot, Galette au beurre...', '/images/subcategory/jam.svg', 1),
(6, 'Fruits et légumes frais', 'Abricot, Aneth, Cerise...', '/images/subcategory/harvest.svg', 1),
(7, 'Fruits sec', 'Abricot sec, Amandes, Dates sèches...', '/images/subcategory/almond.svg', 1),
(8, 'Sauces et condiments', 'Cornichons, Gros Sel, Poivre...', '/images/subcategory/salt-and-pepper.svg', 1),
(9, 'Surgelés', 'Pains Burger, Cornet de frites...', '/images/subcategory/snowflake.svg', 1),
(10, 'Viandes et Poissons', 'Jambon, Rillettes, Saindoux...', '/images/subcategory/meat.svg', 1),
(43, 'Cuisine', 'Bouilloire, cafetiere, film alimentaire...', '/images/subcategory/coffee-machine.svg', 2),
(44, 'Vaiselle', 'Corbeilles, couteaux, saladier...', '/images/subcategory/plate.svg', 2),
(45, 'Vaiselle bio-compostable', 'Assiettes en pulpe, couteaux en bois...', '/images/subcategory/bio.svg', 2),
(46, 'Hygiène', 'Diffuseur, essuie-tout, savon...', '/images/subcategory/snowflake.svg', 3),
(47, 'Droguerie', 'Bougie, pelotte de ficelle, film de palettisation transparent...', '/images/subcategory/aromatic-candle.svg', 3),
(48, 'Ménage', 'Balayette, brosse, désinfectant...', '/images/subcategory/broom.svg', 3),
(49, 'Pharmacie', 'Bombe anti-moustique, pince à tiques, Spay...', '/images/subcategory/pharma.svg', 3),
(50, 'Fournitures de bureau', 'Adhésif, colle, ciseaux...', '/images/subcategory/tape.svg', 4),
(51, 'Papeterie', 'Bloc Post-it, cahiers, chemise...', '/images/subcategory/post-it.svg', 4),
(52, 'Piles', 'Pile LR03 Alcaline, Pile LR6 Alcaline... ', '/images/subcategory/battery.svg', 4),
(53, 'Bazar', 'Cadenas, cintres, fil de peche...', '/images/subcategory/design.svg', 5),
(54, 'Électroménager et électricité', 'Aspirateur, fer à repasser, multi-prise...', '/images/subcategory/vacuum.svg', 5),
(55, 'Jeux', 'Ballon de football, boules de campagne, jeu de molky...', '/images/subcategory/ball.svg', 5),
(56, 'Luminaires', 'Halogènes, lampes de chevet, lampes sur pied...', '/images/subcategory/lighting.svg', 5),
(57, 'Aménagements', 'Abreuvoir, bacs plastique, barrières...', '/images/subcategory/water-trough.svg', 6),
(58, 'Chapiteaux-Tentes-Structures', 'Cabanes, chalets, ponts alu 2m...', '/images/subcategory/camping-tent.svg', 6);

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_unit` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `command`
--
ALTER TABLE `command`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `FK_command_commission_idx` (`id_commission`);

--
-- Indexes for table `commission`
--
ALTER TABLE `commission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `link_command_product`
--
ALTER TABLE `link_command_product`
  ADD PRIMARY KEY (`id_command`,`id_product`),
  ADD KEY `fk_link_product3_idx` (`id_product`);

--
-- Indexes for table `link_member_category`
--
ALTER TABLE `link_member_category`
  ADD PRIMARY KEY (`id_member`,`id_category`),
  ADD KEY `fk_link_category1_idx` (`id_category`);

--
-- Indexes for table `link_member_command`
--
ALTER TABLE `link_member_command`
  ADD PRIMARY KEY (`id_member`,`id_command`),
  ADD KEY `fk_link_command4_idx` (`id_command`);

--
-- Indexes for table `link_member_member`
--
ALTER TABLE `link_member_member`
  ADD PRIMARY KEY (`id_member1`,`id_commission`),
  ADD KEY `fk_link_commission5_idx` (`id_commission`);

--
-- Indexes for table `link_member_product`
--
ALTER TABLE `link_member_product`
  ADD PRIMARY KEY (`id_member`,`id_product`),
  ADD KEY `fk_link_product2_idx` (`id_product`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_member_role_idx` (`id_role`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_product_sub_category_idx` (`id_sub_category`),
  ADD KEY `fk_product_provider_idx` (`id_provider`);

--
-- Indexes for table `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_sub_category_category_idx` (`id_category`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `command`
--
ALTER TABLE `command`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `commission`
--
ALTER TABLE `commission`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `provider`
--
ALTER TABLE `provider`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `command`
--
ALTER TABLE `command`
  ADD CONSTRAINT `FK_command_commission` FOREIGN KEY (`id_commission`) REFERENCES `commission` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `link_command_product`
--
ALTER TABLE `link_command_product`
  ADD CONSTRAINT `fk_link_command3` FOREIGN KEY (`id_command`) REFERENCES `command` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_link_product3` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `link_member_category`
--
ALTER TABLE `link_member_category`
  ADD CONSTRAINT `fk_link_category1` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_link_member1` FOREIGN KEY (`id_member`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `link_member_command`
--
ALTER TABLE `link_member_command`
  ADD CONSTRAINT `fk_link_command4` FOREIGN KEY (`id_command`) REFERENCES `command` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_link_member4` FOREIGN KEY (`id_member`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `link_member_member`
--
ALTER TABLE `link_member_member`
  ADD CONSTRAINT `fk_link_commission5` FOREIGN KEY (`id_commission`) REFERENCES `commission` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_link_member5` FOREIGN KEY (`id_member1`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `link_member_product`
--
ALTER TABLE `link_member_product`
  ADD CONSTRAINT `fk_link_member2` FOREIGN KEY (`id_member`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_link_product2` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `fk_member_role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_provider` FOREIGN KEY (`id_provider`) REFERENCES `provider` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_product_sub_category` FOREIGN KEY (`id_sub_category`) REFERENCES `sub_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD CONSTRAINT `fk_sub_category_category` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Database: `test_symf`
--
CREATE DATABASE IF NOT EXISTS `test_symf` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `test_symf`;

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contenu` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id`, `nom`, `contenu`) VALUES
(5, 'L\'ARTICLE 3', 'Le contenu de l\'article 3 est en majuscule'),
(6, 'oui', 'oui oui oui'),
(7, 'okok', 'okok');

-- --------------------------------------------------------

--
-- Table structure for table `commentaire`
--

CREATE TABLE `commentaire` (
  `id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `pseudo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contenu` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `commentaire`
--

INSERT INTO `commentaire` (`id`, `article_id`, `pseudo`, `contenu`) VALUES
(1, 5, 'Genji', 'Yojin no ken Wokule'),
(2, 6, 'Lustic', 'un com pour l\'article oui'),
(3, 5, 'qweqwe', 'qweqwe'),
(4, 5, 'okok', 'okok');

-- --------------------------------------------------------

--
-- Table structure for table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20190716101750', '2019-07-16 10:19:07'),
('20190718073830', '2019-07-18 07:40:08'),
('20190718090654', '2019-07-18 09:07:37'),
('20190718135941', '2019-07-18 13:59:54');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(1, 'theo@gmail.com', '[]', '$2y$13$Y3LtaIEYaau/1VmSWvpXCOi1L1VVS5clycQ5fXv6qtW3GYh808yvK');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_67F068BC7294869C` (`article_id`);

--
-- Indexes for table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `FK_67F068BC7294869C` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`);
--
-- Database: `touiteur`
--
CREATE DATABASE IF NOT EXISTS `touiteur` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `touiteur`;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) UNSIGNED NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(16) NOT NULL,
  `message` varchar(256) NOT NULL,
  `likes` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `timestamp`, `name`, `message`, `likes`) VALUES
(23, '2019-05-03 10:00:02', 'Theo', 'Salutation', 0),
(24, '2019-05-03 10:07:50', 'Theo', 'Hello', 0),
(25, '2019-05-03 10:07:48', 'Theo', 'Test touit', 2),
(26, '2019-05-03 10:07:46', 'Theo', 'Bonjour =)', 1),
(27, '2019-06-20 08:59:22', 'qweqwe', 'qweqweqwe', 0),
(28, '2019-06-20 08:59:35', 'qweqwe', 'toutou toutou toutou toutou toutou toutou toutou toutou toutou toutou ', 0),
(29, '2019-06-20 09:00:08', 'qweqwe', 'test test test test test test test test test test test test test ', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- Database: `wordpressTest`
--
CREATE DATABASE IF NOT EXISTS `wordpressTest` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `wordpressTest`;

-- --------------------------------------------------------

--
-- Table structure for table `dwwm19_commentmeta`
--

CREATE TABLE `dwwm19_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dwwm19_comments`
--

CREATE TABLE `dwwm19_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `dwwm19_comments`
--

INSERT INTO `dwwm19_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Un commentateur WordPress', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2019-04-23 09:34:58', '2019-04-23 07:34:58', 'Bonjour, ceci est un commentaire.\nPour débuter avec la modération, la modification et la suppression de commentaires, veuillez visiter l’écran des Commentaires dans le Tableau de bord.\nLes avatars des personnes qui commentent arrivent depuis <a href=\"https://gravatar.com\">Gravatar</a>.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `dwwm19_links`
--

CREATE TABLE `dwwm19_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dwwm19_options`
--

CREATE TABLE `dwwm19_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `dwwm19_options`
--

INSERT INTO `dwwm19_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost:8888/wordpress', 'yes'),
(2, 'home', 'http://localhost:8888/wordpress', 'yes'),
(3, 'blogname', 'DW2019', 'yes'),
(4, 'blogdescription', 'Un site utilisant WordPress', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'locastro.theo@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '0', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'j F Y', 'yes'),
(24, 'time_format', 'G \\h i \\m\\i\\n', 'yes'),
(25, 'links_updated_date_format', 'j F Y G \\h i \\m\\i\\n', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:141:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:9:\"photos/?$\";s:26:\"index.php?post_type=photos\";s:39:\"photos/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?post_type=photos&feed=$matches[1]\";s:34:\"photos/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?post_type=photos&feed=$matches[1]\";s:26:\"photos/page/([0-9]{1,})/?$\";s:44:\"index.php?post_type=photos&paged=$matches[1]\";s:10:\"voyages/?$\";s:27:\"index.php?post_type=voyages\";s:40:\"voyages/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=voyages&feed=$matches[1]\";s:35:\"voyages/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=voyages&feed=$matches[1]\";s:27:\"voyages/page/([0-9]{1,})/?$\";s:45:\"index.php?post_type=voyages&paged=$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:34:\"photos/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:44:\"photos/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:64:\"photos/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"photos/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"photos/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:40:\"photos/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:23:\"photos/([^/]+)/embed/?$\";s:39:\"index.php?photos=$matches[1]&embed=true\";s:27:\"photos/([^/]+)/trackback/?$\";s:33:\"index.php?photos=$matches[1]&tb=1\";s:47:\"photos/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?photos=$matches[1]&feed=$matches[2]\";s:42:\"photos/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?photos=$matches[1]&feed=$matches[2]\";s:35:\"photos/([^/]+)/page/?([0-9]{1,})/?$\";s:46:\"index.php?photos=$matches[1]&paged=$matches[2]\";s:42:\"photos/([^/]+)/comment-page-([0-9]{1,})/?$\";s:46:\"index.php?photos=$matches[1]&cpage=$matches[2]\";s:31:\"photos/([^/]+)(?:/([0-9]+))?/?$\";s:45:\"index.php?photos=$matches[1]&page=$matches[2]\";s:23:\"photos/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:33:\"photos/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:53:\"photos/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"photos/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"photos/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:29:\"photos/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:46:\"genre/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?evenement=$matches[1]&feed=$matches[2]\";s:41:\"genre/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?evenement=$matches[1]&feed=$matches[2]\";s:22:\"genre/([^/]+)/embed/?$\";s:42:\"index.php?evenement=$matches[1]&embed=true\";s:34:\"genre/([^/]+)/page/?([0-9]{1,})/?$\";s:49:\"index.php?evenement=$matches[1]&paged=$matches[2]\";s:16:\"genre/([^/]+)/?$\";s:31:\"index.php?evenement=$matches[1]\";s:35:\"voyages/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:45:\"voyages/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:65:\"voyages/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"voyages/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"voyages/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:41:\"voyages/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:24:\"voyages/([^/]+)/embed/?$\";s:40:\"index.php?voyages=$matches[1]&embed=true\";s:28:\"voyages/([^/]+)/trackback/?$\";s:34:\"index.php?voyages=$matches[1]&tb=1\";s:48:\"voyages/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?voyages=$matches[1]&feed=$matches[2]\";s:43:\"voyages/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?voyages=$matches[1]&feed=$matches[2]\";s:36:\"voyages/([^/]+)/page/?([0-9]{1,})/?$\";s:47:\"index.php?voyages=$matches[1]&paged=$matches[2]\";s:43:\"voyages/([^/]+)/comment-page-([0-9]{1,})/?$\";s:47:\"index.php?voyages=$matches[1]&cpage=$matches[2]\";s:32:\"voyages/([^/]+)(?:/([0-9]+))?/?$\";s:46:\"index.php?voyages=$matches[1]&page=$matches[2]\";s:24:\"voyages/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:34:\"voyages/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:54:\"voyages/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"voyages/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"voyages/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:30:\"voyages/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:38:\"index.php?&page_id=5&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:4:{i:0;s:34:\"advanced-custom-fields-pro/acf.php\";i:1;s:36:\"contact-form-7/wp-contact-form-7.php\";i:2;s:29:\"easy-wp-smtp/easy-wp-smtp.php\";i:3;s:47:\"regenerate-thumbnails/regenerate-thumbnails.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'dwwm2019', 'yes'),
(41, 'stylesheet', 'dwwm2019', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '44719', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '0', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'page', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:1:{s:29:\"easy-wp-smtp/easy-wp-smtp.php\";s:17:\"swpsmtp_uninstall\";}', 'no'),
(82, 'timezone_string', 'Europe/Paris', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '5', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'wp_page_for_privacy_policy', '3', 'yes'),
(92, 'show_comments_cookies_opt_in', '1', 'yes'),
(93, 'initial_db_version', '44719', 'yes'),
(94, 'dwwm19_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes'),
(95, 'fresh_site', '0', 'yes'),
(96, 'WPLANG', 'fr_FR', 'yes'),
(97, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(98, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(99, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(100, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(102, 'sidebars_widgets', 'a:2:{s:19:\"wp_inactive_widgets\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}', 'yes'),
(103, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'cron', 'a:5:{i:1572885298;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1572896098;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1572939328;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1572939330;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}', 'yes'),
(113, 'theme_mods_twentynineteen', 'a:3:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1556010493;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}s:18:\"nav_menu_locations\";a:0:{}}', 'yes'),
(131, 'can_compress_scripts', '1', 'no'),
(144, 'current_theme', 'dwwm2019 - sur mesure', 'yes'),
(145, 'theme_mods_dwwm2019', 'a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:2:{s:9:\"principal\";i:4;s:6:\"social\";i:5;}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1556010120;s:4:\"data\";a:1:{s:19:\"wp_inactive_widgets\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}', 'yes'),
(146, 'theme_switched', '', 'yes'),
(154, 'recently_activated', 'a:0:{}', 'yes'),
(215, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}', 'yes'),
(245, 'wpcf7', 'a:2:{s:7:\"version\";s:5:\"5.1.1\";s:13:\"bulk_validate\";a:4:{s:9:\"timestamp\";d:1556191033;s:7:\"version\";s:5:\"5.1.1\";s:11:\"count_valid\";i:1;s:13:\"count_invalid\";i:0;}}', 'yes'),
(252, 'swpsmtp_options', 'a:5:{s:16:\"from_email_field\";s:0:\"\";s:15:\"from_name_field\";s:0:\"\";s:23:\"force_from_name_replace\";i:0;s:13:\"smtp_settings\";a:6:{s:4:\"host\";s:16:\"smtp.example.com\";s:15:\"type_encryption\";s:4:\"none\";s:4:\"port\";i:25;s:13:\"autentication\";s:3:\"yes\";s:8:\"username\";s:0:\"\";s:8:\"password\";s:0:\"\";}s:15:\"allowed_domains\";s:12:\"bG9jYWxob3N0\";}', 'yes'),
(256, 'acf_version', '5.7.13', 'yes'),
(259, 'acf_pro_license', 'YToyOntzOjM6ImtleSI7czo3MjoiYjNKa1pYSmZhV1E5TVRRek1Ua3lmSFI1Y0dVOWNHVnljMjl1WVd4OFpHRjBaVDB5TURFNExURXdMVEkxSURBM09qTTBPakE0IjtzOjM6InVybCI7czozMToiaHR0cDovL2xvY2FsaG9zdDo4ODg4L3dvcmRwcmVzcyI7fQ==', 'yes'),
(270, 'category_children', 'a:0:{}', 'yes'),
(272, 'options_copyright_label', 'Lustic', 'no'),
(273, '_options_copyright_label', 'field_5cc1c60e72d95', 'no'),
(274, 'options_reseaux_sociaux_0_libelle', 'Twitter', 'no'),
(275, '_options_reseaux_sociaux_0_libelle', 'field_5cc1c87976f06', 'no'),
(276, 'options_reseaux_sociaux_0_url', 'https://www.twitter.com', 'no'),
(277, '_options_reseaux_sociaux_0_url', 'field_5cc1c84976f04', 'no'),
(278, 'options_reseaux_sociaux_0_class', 'fa-twitter', 'no'),
(279, '_options_reseaux_sociaux_0_class', 'field_5cc1c86876f05', 'no'),
(280, 'options_reseaux_sociaux_1_libelle', 'Facebook', 'no'),
(281, '_options_reseaux_sociaux_1_libelle', 'field_5cc1c87976f06', 'no'),
(282, 'options_reseaux_sociaux_1_url', 'https://www.facebook.com', 'no'),
(283, '_options_reseaux_sociaux_1_url', 'field_5cc1c84976f04', 'no'),
(284, 'options_reseaux_sociaux_1_class', 'fa-facebook', 'no'),
(285, '_options_reseaux_sociaux_1_class', 'field_5cc1c86876f05', 'no'),
(286, 'options_reseaux_sociaux_2_libelle', 'Instagram', 'no'),
(287, '_options_reseaux_sociaux_2_libelle', 'field_5cc1c87976f06', 'no'),
(288, 'options_reseaux_sociaux_2_url', 'https://www.instagram.com', 'no'),
(289, '_options_reseaux_sociaux_2_url', 'field_5cc1c84976f04', 'no'),
(290, 'options_reseaux_sociaux_2_class', 'fa-instagram', 'no'),
(291, '_options_reseaux_sociaux_2_class', 'field_5cc1c86876f05', 'no'),
(292, 'options_reseaux_sociaux_3_libelle', 'Github', 'no'),
(293, '_options_reseaux_sociaux_3_libelle', 'field_5cc1c87976f06', 'no'),
(294, 'options_reseaux_sociaux_3_url', 'https://www.github.com', 'no'),
(295, '_options_reseaux_sociaux_3_url', 'field_5cc1c84976f04', 'no'),
(296, 'options_reseaux_sociaux_3_class', 'fa-github', 'no'),
(297, '_options_reseaux_sociaux_3_class', 'field_5cc1c86876f05', 'no'),
(298, 'options_reseaux_sociaux_4_libelle', 'linkedIn', 'no'),
(299, '_options_reseaux_sociaux_4_libelle', 'field_5cc1c87976f06', 'no'),
(300, 'options_reseaux_sociaux_4_url', 'https://www.linkedin.com', 'no'),
(301, '_options_reseaux_sociaux_4_url', 'field_5cc1c84976f04', 'no'),
(302, 'options_reseaux_sociaux_4_class', 'fa-linkedin', 'no'),
(303, '_options_reseaux_sociaux_4_class', 'field_5cc1c86876f05', 'no'),
(304, 'options_reseaux_sociaux', '5', 'no'),
(305, '_options_reseaux_sociaux', 'field_5cc1c63672d97', 'no'),
(369, '_transient_timeout_acf_plugin_updates', '1572987347', 'no'),
(370, '_transient_acf_plugin_updates', 'a:4:{s:7:\"plugins\";a:1:{s:34:\"advanced-custom-fields-pro/acf.php\";a:8:{s:4:\"slug\";s:26:\"advanced-custom-fields-pro\";s:6:\"plugin\";s:34:\"advanced-custom-fields-pro/acf.php\";s:11:\"new_version\";s:5:\"5.8.6\";s:3:\"url\";s:36:\"https://www.advancedcustomfields.com\";s:6:\"tested\";s:5:\"5.2.4\";s:7:\"package\";s:251:\"https://connect.advancedcustomfields.com/v2/plugins/download?token=eyJwIjoicHJvIiwiayI6ImIzSmtaWEpmYVdROU1UUXpNVGt5ZkhSNWNHVTljR1Z5YzI5dVlXeDhaR0YwWlQweU1ERTRMVEV3TFRJMUlEQTNPak0wT2pBNCIsIndwX3VybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4ODg4XC93b3JkcHJlc3MifQ==\";s:5:\"icons\";a:1:{s:7:\"default\";s:63:\"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png\";}s:7:\"banners\";a:2:{s:3:\"low\";s:77:\"https://ps.w.org/advanced-custom-fields/assets/banner-772x250.jpg?rev=1729102\";s:4:\"high\";s:78:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg?rev=1729099\";}}}s:10:\"expiration\";i:172800;s:6:\"status\";i:1;s:7:\"checked\";a:1:{s:34:\"advanced-custom-fields-pro/acf.php\";s:6:\"5.7.13\";}}', 'no'),
(374, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:3:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/fr_FR/wordpress-5.2.4.zip\";s:6:\"locale\";s:5:\"fr_FR\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/fr_FR/wordpress-5.2.4.zip\";s:10:\"no_content\";b:0;s:11:\"new_bundled\";b:0;s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.2.4\";s:7:\"version\";s:5:\"5.2.4\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.0\";s:15:\"partial_version\";s:0:\"\";}i:1;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.2.4.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.2.4.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.2.4-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.2.4-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.2.4\";s:7:\"version\";s:5:\"5.2.4\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.0\";s:15:\"partial_version\";s:0:\"\";}i:2;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/fr_FR/wordpress-5.2.4.zip\";s:6:\"locale\";s:5:\"fr_FR\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/fr_FR/wordpress-5.2.4.zip\";s:10:\"no_content\";b:0;s:11:\"new_bundled\";b:0;s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.2.4\";s:7:\"version\";s:5:\"5.2.4\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.0\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}}s:12:\"last_checked\";i:1572878683;s:15:\"version_checked\";s:5:\"5.1.3\";s:12:\"translations\";a:0:{}}', 'no'),
(377, 'auto_core_update_notified', 'a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:23:\"locastro.theo@gmail.com\";s:7:\"version\";s:5:\"5.1.3\";s:9:\"timestamp\";i:1572814574;}', 'no'),
(380, '_site_transient_timeout_theme_roots', '1572880484', 'no'),
(381, '_site_transient_theme_roots', 'a:4:{s:8:\"dwwm2019\";s:7:\"/themes\";s:14:\"twentynineteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:13:\"twentysixteen\";s:7:\"/themes\";}', 'no'),
(382, '_site_transient_update_themes', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1572878686;s:7:\"checked\";a:4:{s:8:\"dwwm2019\";s:3:\"1.0\";s:14:\"twentynineteen\";s:3:\"1.3\";s:15:\"twentyseventeen\";s:3:\"2.1\";s:13:\"twentysixteen\";s:3:\"1.9\";}s:8:\"response\";a:3:{s:14:\"twentynineteen\";a:6:{s:5:\"theme\";s:14:\"twentynineteen\";s:11:\"new_version\";s:3:\"1.4\";s:3:\"url\";s:44:\"https://wordpress.org/themes/twentynineteen/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/theme/twentynineteen.1.4.zip\";s:8:\"requires\";s:5:\"4.9.6\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:15:\"twentyseventeen\";a:6:{s:5:\"theme\";s:15:\"twentyseventeen\";s:11:\"new_version\";s:3:\"2.2\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentyseventeen/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentyseventeen.2.2.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:13:\"twentysixteen\";a:6:{s:5:\"theme\";s:13:\"twentysixteen\";s:11:\"new_version\";s:3:\"2.0\";s:3:\"url\";s:43:\"https://wordpress.org/themes/twentysixteen/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/theme/twentysixteen.2.0.zip\";s:8:\"requires\";s:3:\"4.4\";s:12:\"requires_php\";s:5:\"5.2.4\";}}s:12:\"translations\";a:0:{}}', 'no'),
(383, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1572878686;s:7:\"checked\";a:7:{s:34:\"advanced-custom-fields-pro/acf.php\";s:6:\"5.7.13\";s:19:\"akismet/akismet.php\";s:5:\"4.1.1\";s:33:\"classic-editor/classic-editor.php\";s:3:\"1.4\";s:36:\"contact-form-7/wp-contact-form-7.php\";s:5:\"5.1.1\";s:29:\"easy-wp-smtp/easy-wp-smtp.php\";s:7:\"1.3.9.1\";s:9:\"hello.php\";s:5:\"1.7.1\";s:47:\"regenerate-thumbnails/regenerate-thumbnails.php\";s:5:\"3.1.0\";}s:8:\"response\";a:6:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.1.3\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.1.3.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.2.4\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:33:\"classic-editor/classic-editor.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:28:\"w.org/plugins/classic-editor\";s:4:\"slug\";s:14:\"classic-editor\";s:6:\"plugin\";s:33:\"classic-editor/classic-editor.php\";s:11:\"new_version\";s:3:\"1.5\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/classic-editor/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/plugin/classic-editor.1.5.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/classic-editor/assets/icon-256x256.png?rev=1998671\";s:2:\"1x\";s:67:\"https://ps.w.org/classic-editor/assets/icon-128x128.png?rev=1998671\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:70:\"https://ps.w.org/classic-editor/assets/banner-1544x500.png?rev=1998671\";s:2:\"1x\";s:69:\"https://ps.w.org/classic-editor/assets/banner-772x250.png?rev=1998676\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.2.4\";s:12:\"requires_php\";s:5:\"5.2.4\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:36:\"contact-form-7/wp-contact-form-7.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:28:\"w.org/plugins/contact-form-7\";s:4:\"slug\";s:14:\"contact-form-7\";s:6:\"plugin\";s:36:\"contact-form-7/wp-contact-form-7.php\";s:11:\"new_version\";s:5:\"5.1.4\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/contact-form-7/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/contact-form-7.5.1.4.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:66:\"https://ps.w.org/contact-form-7/assets/icon-256x256.png?rev=984007\";s:2:\"1x\";s:66:\"https://ps.w.org/contact-form-7/assets/icon-128x128.png?rev=984007\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:69:\"https://ps.w.org/contact-form-7/assets/banner-1544x500.png?rev=860901\";s:2:\"1x\";s:68:\"https://ps.w.org/contact-form-7/assets/banner-772x250.png?rev=880427\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.2.4\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:9:\"hello.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.2.4\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:47:\"regenerate-thumbnails/regenerate-thumbnails.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:35:\"w.org/plugins/regenerate-thumbnails\";s:4:\"slug\";s:21:\"regenerate-thumbnails\";s:6:\"plugin\";s:47:\"regenerate-thumbnails/regenerate-thumbnails.php\";s:11:\"new_version\";s:5:\"3.1.1\";s:3:\"url\";s:52:\"https://wordpress.org/plugins/regenerate-thumbnails/\";s:7:\"package\";s:70:\"https://downloads.wordpress.org/plugin/regenerate-thumbnails.3.1.1.zip\";s:5:\"icons\";a:1:{s:2:\"1x\";s:74:\"https://ps.w.org/regenerate-thumbnails/assets/icon-128x128.png?rev=1753390\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:77:\"https://ps.w.org/regenerate-thumbnails/assets/banner-1544x500.jpg?rev=1753390\";s:2:\"1x\";s:76:\"https://ps.w.org/regenerate-thumbnails/assets/banner-772x250.jpg?rev=1753390\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.1.3\";s:12:\"requires_php\";s:5:\"5.2.4\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:34:\"advanced-custom-fields-pro/acf.php\";O:8:\"stdClass\":8:{s:4:\"slug\";s:26:\"advanced-custom-fields-pro\";s:6:\"plugin\";s:34:\"advanced-custom-fields-pro/acf.php\";s:11:\"new_version\";s:5:\"5.8.6\";s:3:\"url\";s:36:\"https://www.advancedcustomfields.com\";s:6:\"tested\";s:5:\"5.2.4\";s:7:\"package\";s:251:\"https://connect.advancedcustomfields.com/v2/plugins/download?token=eyJwIjoicHJvIiwiayI6ImIzSmtaWEpmYVdROU1UUXpNVGt5ZkhSNWNHVTljR1Z5YzI5dVlXeDhaR0YwWlQweU1ERTRMVEV3TFRJMUlEQTNPak0wT2pBNCIsIndwX3VybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4ODg4XC93b3JkcHJlc3MifQ==\";s:5:\"icons\";a:1:{s:7:\"default\";s:63:\"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png\";}s:7:\"banners\";a:2:{s:3:\"low\";s:77:\"https://ps.w.org/advanced-custom-fields/assets/banner-772x250.jpg?rev=1729102\";s:4:\"high\";s:78:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg?rev=1729099\";}}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:1:{s:29:\"easy-wp-smtp/easy-wp-smtp.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:26:\"w.org/plugins/easy-wp-smtp\";s:4:\"slug\";s:12:\"easy-wp-smtp\";s:6:\"plugin\";s:29:\"easy-wp-smtp/easy-wp-smtp.php\";s:11:\"new_version\";s:7:\"1.3.9.1\";s:3:\"url\";s:43:\"https://wordpress.org/plugins/easy-wp-smtp/\";s:7:\"package\";s:55:\"https://downloads.wordpress.org/plugin/easy-wp-smtp.zip\";s:5:\"icons\";a:1:{s:2:\"1x\";s:65:\"https://ps.w.org/easy-wp-smtp/assets/icon-128x128.png?rev=1242044\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:67:\"https://ps.w.org/easy-wp-smtp/assets/banner-772x250.png?rev=1650323\";}s:11:\"banners_rtl\";a:0:{}}}}', 'no'),
(384, '_transient_timeout_easy_wp_smtp_sd_code', '1572922200', 'no'),
(385, '_transient_easy_wp_smtp_sd_code', 'c61efb313c880f2617115a2dbb6a8901', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `dwwm19_postmeta`
--

CREATE TABLE `dwwm19_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `dwwm19_postmeta`
--

INSERT INTO `dwwm19_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(3, 5, '_edit_lock', '1556198494:1'),
(4, 1, '_edit_lock', '1556287991:1'),
(5, 9, '_wp_attached_file', '2019/04/Capture-d’écran-2019-03-20-à-13.59.18.png'),
(6, 9, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:2560;s:6:\"height\";i:1050;s:4:\"file\";s:53:\"2019/04/Capture-d’écran-2019-03-20-à-13.59.18.png\";s:5:\"sizes\";a:6:{s:10:\"img-pitite\";a:4:{s:4:\"file\";s:53:\"Capture-d’écran-2019-03-20-à-13.59.18-400x200.png\";s:5:\"width\";i:400;s:6:\"height\";i:200;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:53:\"Capture-d’écran-2019-03-20-à-13.59.18-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:53:\"Capture-d’écran-2019-03-20-à-13.59.18-300x123.png\";s:5:\"width\";i:300;s:6:\"height\";i:123;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:53:\"Capture-d’écran-2019-03-20-à-13.59.18-768x315.png\";s:5:\"width\";i:768;s:6:\"height\";i:315;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:54:\"Capture-d’écran-2019-03-20-à-13.59.18-1024x420.png\";s:5:\"width\";i:1024;s:6:\"height\";i:420;s:9:\"mime-type\";s:9:\"image/png\";}s:8:\"img-home\";a:4:{s:4:\"file\";s:55:\"Capture-d’écran-2019-03-20-à-13.59.18-1920x1050.png\";s:5:\"width\";i:1920;s:6:\"height\";i:1050;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(7, 5, '_thumbnail_id', '9'),
(11, 13, '_edit_lock', '1556090373:1'),
(12, 14, '_wp_attached_file', '2019/04/10662309-2.jpg'),
(13, 14, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:910;s:6:\"height\";i:607;s:4:\"file\";s:22:\"2019/04/10662309-2.jpg\";s:5:\"sizes\";a:4:{s:10:\"img-pitite\";a:4:{s:4:\"file\";s:22:\"10662309-2-400x200.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"10662309-2-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:22:\"10662309-2-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:22:\"10662309-2-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:12:\"yurakp/123RF\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(15, 13, '_thumbnail_id', '14'),
(17, 17, '_edit_lock', '1556090369:1'),
(18, 18, '_wp_attached_file', '2019/04/photo-fraise-b.-plantevin-2-.jpg'),
(19, 18, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:600;s:6:\"height\";i:400;s:4:\"file\";s:40:\"2019/04/photo-fraise-b.-plantevin-2-.jpg\";s:5:\"sizes\";a:3:{s:10:\"img-pitite\";a:4:{s:4:\"file\";s:40:\"photo-fraise-b.-plantevin-2--400x200.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:40:\"photo-fraise-b.-plantevin-2--150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:40:\"photo-fraise-b.-plantevin-2--300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(21, 20, '_edit_lock', '1556090364:1'),
(22, 21, '_wp_attached_file', '2019/04/I-Autre-5900_1200x1200-tomate-moneymaker-ab.net_.jpg'),
(23, 21, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1200;s:6:\"height\";i:1200;s:4:\"file\";s:60:\"2019/04/I-Autre-5900_1200x1200-tomate-moneymaker-ab.net_.jpg\";s:5:\"sizes\";a:5:{s:10:\"img-pitite\";a:4:{s:4:\"file\";s:60:\"I-Autre-5900_1200x1200-tomate-moneymaker-ab.net_-400x200.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:60:\"I-Autre-5900_1200x1200-tomate-moneymaker-ab.net_-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:60:\"I-Autre-5900_1200x1200-tomate-moneymaker-ab.net_-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:60:\"I-Autre-5900_1200x1200-tomate-moneymaker-ab.net_-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:62:\"I-Autre-5900_1200x1200-tomate-moneymaker-ab.net_-1024x1024.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(25, 20, '_thumbnail_id', '21'),
(27, 17, '_thumbnail_id', '18'),
(28, 23, '_edit_lock', '1556825620:1'),
(29, 25, '_wp_attached_file', '2019/04/10660346.jpg'),
(30, 25, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:910;s:6:\"height\";i:607;s:4:\"file\";s:20:\"2019/04/10660346.jpg\";s:5:\"sizes\";a:4:{s:10:\"img-pitite\";a:4:{s:4:\"file\";s:20:\"10660346-400x200.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"10660346-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"10660346-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:20:\"10660346-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(32, 23, '_thumbnail_id', '25'),
(33, 23, '_edit_last', '1'),
(35, 20, '_edit_last', '1'),
(37, 17, '_edit_last', '1'),
(39, 13, '_edit_last', '1'),
(45, 1, '_edit_last', '1'),
(130, 39, '_menu_item_type', 'post_type'),
(131, 39, '_menu_item_menu_item_parent', '0'),
(132, 39, '_menu_item_object_id', '5'),
(133, 39, '_menu_item_object', 'page'),
(134, 39, '_menu_item_target', ''),
(135, 39, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(136, 39, '_menu_item_xfn', ''),
(137, 39, '_menu_item_url', ''),
(172, 46, '_menu_item_type', 'custom'),
(173, 46, '_menu_item_menu_item_parent', '0'),
(174, 46, '_menu_item_object_id', '46'),
(175, 46, '_menu_item_object', 'custom'),
(176, 46, '_menu_item_target', ''),
(177, 46, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(178, 46, '_menu_item_xfn', ''),
(179, 46, '_menu_item_url', 'http://www.twitter.com'),
(181, 47, '_form', '<div class=\"fields\">\n    <div class=\"field half\">\n        <label for=\"name\">Name</label>\n        [text* text-505 id:name]\n    </div>\n    <div class=\"field half\">\n        <label for=\"email\">Email</label>\n        [text* text-505 id:email]\n    </div>\n    <div class=\"field\">\n        <label for=\"message\">Message</label>\n        [textarea* textarea-501 id:message]\n    </div>\n</div>\n<ul class=\"actions\">\n    <li>[submit class:primary]</li>\n    <li><input type=\"reset\" value=\"Clear\" /></li>\n</ul>'),
(182, 47, '_mail', 'a:9:{s:6:\"active\";b:1;s:7:\"subject\";s:23:\"DW2019 \"[your-subject]\"\";s:6:\"sender\";s:32:\"DW2019 <locastro.theo@gmail.com>\";s:9:\"recipient\";s:23:\"locastro.theo@gmail.com\";s:4:\"body\";s:197:\"De : [your-name] <[your-email]>\nObjet : [your-subject]\n\nCorps du message :\n[your-message]\n\n-- \nCet e-mail a été envoyé via le formulaire de contact de DW2019 (http://localhost:8888/wordpress)\";s:18:\"additional_headers\";s:0:\"\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";b:0;s:13:\"exclude_blank\";b:0;}'),
(183, 47, '_mail_2', 'a:9:{s:6:\"active\";b:0;s:7:\"subject\";s:23:\"DW2019 \"[your-subject]\"\";s:6:\"sender\";s:32:\"DW2019 <locastro.theo@gmail.com>\";s:9:\"recipient\";s:12:\"[your-email]\";s:4:\"body\";s:139:\"Corps du message :\n[your-message]\n\n-- \nCet e-mail a été envoyé via le formulaire de contact de DW2019 (http://localhost:8888/wordpress)\";s:18:\"additional_headers\";s:33:\"Reply-To: locastro.theo@gmail.com\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";b:0;s:13:\"exclude_blank\";b:0;}'),
(184, 47, '_messages', 'a:23:{s:12:\"mail_sent_ok\";s:45:\"Merci pour votre message. Il a été envoyé.\";s:12:\"mail_sent_ng\";s:102:\"Une erreur s’est produite lors de l’envoi de votre message. Veuillez essayer à nouveau plus tard.\";s:16:\"validation_error\";s:88:\"Un ou plusieurs champs contiennent une erreur. Veuillez vérifier et essayer à nouveau.\";s:4:\"spam\";s:102:\"Une erreur s’est produite lors de l’envoi de votre message. Veuillez essayer à nouveau plus tard.\";s:12:\"accept_terms\";s:77:\"Vous devez accepter les termes et conditions avant d’envoyer votre message.\";s:16:\"invalid_required\";s:25:\"Ce champ est obligatoire.\";s:16:\"invalid_too_long\";s:23:\"Le champ est trop long.\";s:17:\"invalid_too_short\";s:24:\"Le champ est trop court.\";s:12:\"invalid_date\";s:32:\"Le format de date est incorrect.\";s:14:\"date_too_early\";s:47:\"La date précède la première date autorisée.\";s:13:\"date_too_late\";s:57:\"La date est postérieure à la dernière date autorisée.\";s:13:\"upload_failed\";s:72:\"Une erreur inconnue s’est produite lors du téléversement du fichier.\";s:24:\"upload_file_type_invalid\";s:79:\"Vous n’avez pas les droits nécessaires pour téléverser ce type de fichier.\";s:21:\"upload_file_too_large\";s:31:\"Le fichier est trop volumineux.\";s:23:\"upload_failed_php_error\";s:63:\"Une erreur s’est produite lors du téléversement du fichier.\";s:14:\"invalid_number\";s:33:\"Le format du nombre est invalide.\";s:16:\"number_too_small\";s:50:\"Le nombre est plus petit que le minimum autorisé.\";s:16:\"number_too_large\";s:50:\"Le nombre est plus grand que le maximum autorisé.\";s:23:\"quiz_answer_not_correct\";s:42:\"La réponse à la question est incorrecte.\";s:17:\"captcha_not_match\";s:29:\"Le code entré est incorrect.\";s:13:\"invalid_email\";s:38:\"L’adresse e-mail n’est pas valide.\";s:11:\"invalid_url\";s:27:\"L’URL n’est pas valide.\";s:11:\"invalid_tel\";s:45:\"Le numéro de téléphone n’est pas valide.\";}'),
(185, 47, '_additional_settings', ''),
(186, 47, '_locale', 'fr_FR'),
(188, 48, '_menu_item_type', 'custom'),
(189, 48, '_menu_item_menu_item_parent', '0'),
(190, 48, '_menu_item_object_id', '48'),
(191, 48, '_menu_item_object', 'custom'),
(192, 48, '_menu_item_target', ''),
(193, 48, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(194, 48, '_menu_item_xfn', ''),
(195, 48, '_menu_item_url', 'http://www.facebook.com'),
(197, 49, '_menu_item_type', 'custom'),
(198, 49, '_menu_item_menu_item_parent', '0'),
(199, 49, '_menu_item_object_id', '49'),
(200, 49, '_menu_item_object', 'custom'),
(201, 49, '_menu_item_target', ''),
(202, 49, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(203, 49, '_menu_item_xfn', ''),
(204, 49, '_menu_item_url', 'http://www.instagram.com'),
(206, 50, '_menu_item_type', 'custom'),
(207, 50, '_menu_item_menu_item_parent', '0'),
(208, 50, '_menu_item_object_id', '50'),
(209, 50, '_menu_item_object', 'custom'),
(210, 50, '_menu_item_target', ''),
(211, 50, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(212, 50, '_menu_item_xfn', ''),
(213, 50, '_menu_item_url', 'http://www.github.com'),
(215, 51, '_menu_item_type', 'custom'),
(216, 51, '_menu_item_menu_item_parent', '0'),
(217, 51, '_menu_item_object_id', '51'),
(218, 51, '_menu_item_object', 'custom'),
(219, 51, '_menu_item_target', ''),
(220, 51, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(221, 51, '_menu_item_xfn', ''),
(222, 51, '_menu_item_url', 'http://www.linkedin.com'),
(226, 54, '_edit_last', '1'),
(227, 54, '_edit_lock', '1556198481:1'),
(228, 5, '_edit_last', '1'),
(229, 5, 'titre_bas', 'Le titre de l\'article en bas'),
(230, 5, '_titre_bas', 'field_5cc186ebf8d0a'),
(231, 5, 'para_bas', 'Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas '),
(232, 5, 'para_bas', 'Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas '),
(233, 5, '_para_bas', 'field_5cc1879c4f068'),
(234, 5, '_para_bas', 'field_5cc1879c4f068'),
(235, 58, 'titre_bas', 'Le titre de l\'article en bas'),
(236, 58, 'titre_bas', 'Le titre de l\'article en bas'),
(237, 58, '_titre_bas', 'field_5cc186ebf8d0a'),
(238, 58, '_titre_bas', 'field_5cc186ebf8d0a'),
(239, 58, 'para_bas', 'Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas '),
(240, 58, 'para_bas', 'Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas '),
(241, 58, '_para_bas', 'field_5cc1879c4f068'),
(242, 58, '_para_bas', 'field_5cc1879c4f068'),
(243, 60, 'titre_bas', 'Le titre de l\'article en bas'),
(244, 60, 'titre_bas', 'Le titre de l\'article en bas'),
(245, 60, '_titre_bas', 'field_5cc186ebf8d0a'),
(246, 60, '_titre_bas', 'field_5cc186ebf8d0a'),
(247, 60, 'para_bas', 'Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas '),
(248, 60, 'para_bas', 'Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas '),
(249, 60, '_para_bas', 'field_5cc1879c4f068'),
(250, 60, '_para_bas', 'field_5cc1879c4f068'),
(251, 2, '_edit_lock', '1556825408:1'),
(252, 61, '_edit_last', '1'),
(253, 61, '_edit_lock', '1556202765:1'),
(258, 5, 'cat_img', ''),
(259, 5, '_cat_img', 'field_5cc19ab070a5a'),
(260, 5, 'link_bas', '13'),
(261, 5, 'link_bas', '13'),
(262, 5, '_link_bas', 'field_5cc1a506d3d29'),
(263, 5, '_link_bas', 'field_5cc1a506d3d29'),
(264, 66, 'titre_bas', 'Le titre de l\'article en bas'),
(265, 66, 'titre_bas', 'Le titre de l\'article en bas'),
(266, 66, '_titre_bas', 'field_5cc186ebf8d0a'),
(267, 66, '_titre_bas', 'field_5cc186ebf8d0a'),
(268, 66, 'para_bas', 'Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas '),
(269, 66, 'para_bas', 'Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas '),
(270, 66, '_para_bas', 'field_5cc1879c4f068'),
(271, 66, '_para_bas', 'field_5cc1879c4f068'),
(272, 66, 'cat_img', ''),
(273, 66, 'cat_img', ''),
(274, 66, '_cat_img', 'field_5cc19ab070a5a'),
(275, 66, '_cat_img', 'field_5cc19ab070a5a'),
(276, 66, 'link_bas', '13'),
(277, 66, 'link_bas', '13'),
(278, 66, '_link_bas', 'field_5cc1a506d3d29'),
(279, 66, '_link_bas', 'field_5cc1a506d3d29'),
(280, 68, 'titre_bas', 'Le titre de l\'article en bas'),
(281, 68, 'titre_bas', 'Le titre de l\'article en bas'),
(282, 68, '_titre_bas', 'field_5cc186ebf8d0a'),
(283, 68, '_titre_bas', 'field_5cc186ebf8d0a'),
(284, 68, 'para_bas', 'Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas '),
(285, 68, 'para_bas', 'Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas Le paragraphe de l\'article en bas '),
(286, 68, '_para_bas', 'field_5cc1879c4f068'),
(287, 68, '_para_bas', 'field_5cc1879c4f068'),
(288, 68, 'cat_img', ''),
(289, 68, 'cat_img', ''),
(290, 68, '_cat_img', 'field_5cc19ab070a5a'),
(291, 68, '_cat_img', 'field_5cc19ab070a5a'),
(292, 68, 'link_bas', '13'),
(293, 68, 'link_bas', '13'),
(294, 68, '_link_bas', 'field_5cc1a506d3d29'),
(295, 68, '_link_bas', 'field_5cc1a506d3d29'),
(296, 69, '_edit_last', '1'),
(297, 69, '_edit_lock', '1556203567:1'),
(298, 77, '_edit_lock', '1556262672:1'),
(299, 79, '_menu_item_type', 'post_type'),
(300, 79, '_menu_item_menu_item_parent', '0'),
(301, 79, '_menu_item_object_id', '77'),
(302, 79, '_menu_item_object', 'page'),
(303, 79, '_menu_item_target', ''),
(304, 79, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(305, 79, '_menu_item_xfn', ''),
(306, 79, '_menu_item_url', ''),
(308, 3, '_edit_lock', '1556264002:1'),
(309, 81, '_menu_item_type', 'post_type'),
(310, 81, '_menu_item_menu_item_parent', '0'),
(311, 81, '_menu_item_object_id', '3'),
(312, 81, '_menu_item_object', 'page'),
(313, 81, '_menu_item_target', ''),
(314, 81, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(315, 81, '_menu_item_xfn', ''),
(316, 81, '_menu_item_url', ''),
(319, 83, '_edit_lock', '1556271681:1'),
(320, 83, '_wp_page_template', 'custemp.php'),
(321, 85, '_edit_lock', '1556825627:1'),
(322, 86, '_edit_lock', '1556269915:1'),
(323, 87, '_edit_lock', '1556290781:1'),
(324, 88, '_wp_attached_file', '2019/04/250px-Flag_of_France.svg_.png'),
(325, 88, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:250;s:6:\"height\";i:167;s:4:\"file\";s:37:\"2019/04/250px-Flag_of_France.svg_.png\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:37:\"250px-Flag_of_France.svg_-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(326, 87, '_thumbnail_id', '88'),
(327, 89, '_edit_lock', '1556290756:1'),
(328, 90, '_wp_attached_file', '2019/04/it.png'),
(329, 90, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:580;s:6:\"height\";i:387;s:4:\"file\";s:14:\"2019/04/it.png\";s:5:\"sizes\";a:3:{s:10:\"img-pitite\";a:4:{s:4:\"file\";s:14:\"it-400x200.png\";s:5:\"width\";i:400;s:6:\"height\";i:200;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:14:\"it-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:14:\"it-300x200.png\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(330, 89, '_thumbnail_id', '90'),
(331, 91, '_edit_lock', '1556290740:1'),
(332, 92, '_wp_attached_file', '2019/04/210uaqEmyZL.jpg'),
(333, 92, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:280;s:6:\"height\";i:180;s:4:\"file\";s:23:\"2019/04/210uaqEmyZL.jpg\";s:5:\"sizes\";a:1:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:23:\"210uaqEmyZL-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(334, 91, '_thumbnail_id', '92'),
(335, 93, '_edit_lock', '1556825605:1'),
(336, 93, '_wp_page_template', 'voyages.php'),
(339, 97, '_edit_last', '1'),
(340, 97, '_edit_lock', '1556291848:1'),
(352, 91, '_edit_last', '1'),
(353, 91, 'prix', '1300$'),
(354, 91, '_prix', 'field_5cc2ff8adf381'),
(355, 91, 'note', '6'),
(356, 91, '_note', 'field_5cc2ffcfdf382'),
(357, 104, 'prix', '1300$'),
(358, 104, '_prix', 'field_5cc2ff8adf381'),
(359, 104, 'note', '6'),
(360, 104, '_note', 'field_5cc2ffcfdf382'),
(361, 105, 'prix', '1300$'),
(362, 105, '_prix', 'field_5cc2ff8adf381'),
(363, 105, 'note', '6'),
(364, 105, '_note', 'field_5cc2ffcfdf382'),
(365, 89, '_edit_last', '1'),
(366, 89, 'prix', '123123$'),
(367, 89, '_prix', 'field_5cc2ff8adf381'),
(368, 89, 'note', '10'),
(369, 89, 'note', '10'),
(370, 89, '_note', 'field_5cc2ffcfdf382'),
(371, 89, '_note', 'field_5cc2ffcfdf382'),
(372, 108, 'prix', '123123$'),
(373, 108, '_prix', 'field_5cc2ff8adf381'),
(374, 108, '_prix', 'field_5cc2ff8adf381'),
(375, 108, 'note', '10'),
(376, 108, 'note', '10'),
(377, 108, '_note', 'field_5cc2ffcfdf382'),
(378, 108, '_note', 'field_5cc2ffcfdf382'),
(379, 87, '_edit_last', '1'),
(380, 87, 'prix', '1000$'),
(381, 87, '_prix', 'field_5cc2ff8adf381'),
(382, 87, 'note', '8'),
(383, 87, '_note', 'field_5cc2ffcfdf382'),
(384, 111, 'prix', '1000$'),
(385, 111, '_prix', 'field_5cc2ff8adf381'),
(386, 111, 'note', '8'),
(387, 111, '_note', 'field_5cc2ffcfdf382'),
(389, 113, '_wp_attached_file', '2019/04/260px-Tour_Eiffel_Wikimedia_Commons.jpg'),
(390, 113, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:260;s:6:\"height\";i:481;s:4:\"file\";s:47:\"2019/04/260px-Tour_Eiffel_Wikimedia_Commons.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:47:\"260px-Tour_Eiffel_Wikimedia_Commons-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:47:\"260px-Tour_Eiffel_Wikimedia_Commons-162x300.jpg\";s:5:\"width\";i:162;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:10:\"img-pitite\";a:4:{s:4:\"file\";s:47:\"260px-Tour_Eiffel_Wikimedia_Commons-260x200.jpg\";s:5:\"width\";i:260;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(391, 114, '_wp_attached_file', '2019/04/1200px-Colosseum_in_Rome-April_2007-1-_copie_2B.jpg'),
(392, 114, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1200;s:6:\"height\";i:704;s:4:\"file\";s:59:\"2019/04/1200px-Colosseum_in_Rome-April_2007-1-_copie_2B.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:59:\"1200px-Colosseum_in_Rome-April_2007-1-_copie_2B-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:59:\"1200px-Colosseum_in_Rome-April_2007-1-_copie_2B-300x176.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:176;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:59:\"1200px-Colosseum_in_Rome-April_2007-1-_copie_2B-768x451.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:451;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:60:\"1200px-Colosseum_in_Rome-April_2007-1-_copie_2B-1024x601.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:601;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:10:\"img-pitite\";a:4:{s:4:\"file\";s:59:\"1200px-Colosseum_in_Rome-April_2007-1-_copie_2B-400x200.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(393, 115, '_wp_attached_file', '2019/04/25090502-puerta-de-alcala-célèbre-monument-espagnol-à-place-de-l-indépendance-madrid-espagne.jpg'),
(394, 115, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1300;s:6:\"height\";i:866;s:4:\"file\";s:108:\"2019/04/25090502-puerta-de-alcala-célèbre-monument-espagnol-à-place-de-l-indépendance-madrid-espagne.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:108:\"25090502-puerta-de-alcala-célèbre-monument-espagnol-à-place-de-l-indépendance-madrid-espagne-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:108:\"25090502-puerta-de-alcala-célèbre-monument-espagnol-à-place-de-l-indépendance-madrid-espagne-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:108:\"25090502-puerta-de-alcala-célèbre-monument-espagnol-à-place-de-l-indépendance-madrid-espagne-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:109:\"25090502-puerta-de-alcala-célèbre-monument-espagnol-à-place-de-l-indépendance-madrid-espagne-1024x682.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:682;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:10:\"img-pitite\";a:4:{s:4:\"file\";s:108:\"25090502-puerta-de-alcala-célèbre-monument-espagnol-à-place-de-l-indépendance-madrid-espagne-400x200.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"9\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:20:\"Canon EOS 5D Mark II\";s:7:\"caption\";s:80:\"Puerta de Alcala - famous Spanish monument at Independence Square, Madrid, Spain\";s:17:\"created_timestamp\";s:10:\"1314990910\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:2:\"35\";s:3:\"iso\";s:3:\"100\";s:13:\"shutter_speed\";s:5:\"0.008\";s:5:\"title\";s:16:\"Puerta de Alcala\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:44:{i:0;s:6:\"madrid\";i:1;s:8:\"monument\";i:2;s:5:\"spain\";i:3;s:12:\"architecture\";i:4;s:6:\"europe\";i:5;s:4:\"gate\";i:6;s:8:\"landmark\";i:7;s:6:\"puerta\";i:8;s:6:\"alcala\";i:9;s:4:\"arch\";i:10;s:6:\"travel\";i:11;s:4:\"city\";i:12;s:7:\"tourism\";i:13;s:7:\"history\";i:14;s:6:\"square\";i:15;s:6:\"street\";i:16;s:3:\"old\";i:17;s:7:\"spanish\";i:18;s:5:\"plaza\";i:19;s:8:\"building\";i:20;s:4:\"door\";i:21;s:5:\"stone\";i:22;s:6:\"famous\";i:23;s:5:\"urban\";i:24;s:6:\"symbol\";i:25;s:10:\"historical\";i:26;s:12:\"independence\";i:27;s:7:\"tourist\";i:28;s:6:\"column\";i:29;s:7:\"ancient\";i:30;s:8:\"historic\";i:31;s:9:\"landscape\";i:32;s:3:\"sky\";i:33;s:10:\"horizontal\";i:34;s:6:\"flower\";i:35;s:8:\"outdoors\";i:36;s:3:\"art\";i:37;s:2:\"de\";i:38;s:8:\"european\";i:39;s:12:\"neoclassical\";i:40;s:8:\"exterior\";i:41;s:9:\"touristic\";i:42;s:13:\"architectural\";i:43;s:19:\"travel destinations\";}}}'),
(395, 116, '_wp_attached_file', '2019/04/arc-de-triomphe-1024x576.jpg'),
(396, 116, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1024;s:6:\"height\";i:576;s:4:\"file\";s:36:\"2019/04/arc-de-triomphe-1024x576.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:36:\"arc-de-triomphe-1024x576-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:36:\"arc-de-triomphe-1024x576-300x169.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:36:\"arc-de-triomphe-1024x576-768x432.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:432;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:37:\"arc-de-triomphe-1024x576-1024x576.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:10:\"img-pitite\";a:4:{s:4:\"file\";s:36:\"arc-de-triomphe-1024x576-400x200.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(397, 117, '_wp_attached_file', '2019/04/Top-10-des-plus-beaux-monuments-d’Espagne.jpg'),
(398, 117, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1024;s:6:\"height\";i:681;s:4:\"file\";s:55:\"2019/04/Top-10-des-plus-beaux-monuments-d’Espagne.jpg\";s:5:\"sizes\";a:5:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:55:\"Top-10-des-plus-beaux-monuments-d’Espagne-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:55:\"Top-10-des-plus-beaux-monuments-d’Espagne-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:55:\"Top-10-des-plus-beaux-monuments-d’Espagne-768x511.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:511;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:56:\"Top-10-des-plus-beaux-monuments-d’Espagne-1024x681.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:681;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:10:\"img-pitite\";a:4:{s:4:\"file\";s:55:\"Top-10-des-plus-beaux-monuments-d’Espagne-400x200.jpg\";s:5:\"width\";i:400;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(399, 118, '_wp_attached_file', '2019/04/220px-Tour_de_Pise-2017.jpg'),
(400, 118, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:220;s:6:\"height\";i:338;s:4:\"file\";s:35:\"2019/04/220px-Tour_de_Pise-2017.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:35:\"220px-Tour_de_Pise-2017-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:35:\"220px-Tour_de_Pise-2017-195x300.jpg\";s:5:\"width\";i:195;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:10:\"img-pitite\";a:4:{s:4:\"file\";s:35:\"220px-Tour_de_Pise-2017-220x200.jpg\";s:5:\"width\";i:220;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(401, 89, 'galerie_image', 'a:2:{i:0;s:3:\"114\";i:1;s:3:\"118\";}'),
(402, 89, '_galerie_image', 'field_5cc315dad7134'),
(403, 91, 'galerie_image', 'a:2:{i:0;s:3:\"117\";i:1;s:3:\"115\";}'),
(404, 91, '_galerie_image', 'field_5cc315dad7134'),
(405, 87, 'galerie_image', 'a:2:{i:0;s:3:\"113\";i:1;s:3:\"116\";}'),
(406, 87, 'galerie_image', 'a:2:{i:0;s:3:\"113\";i:1;s:3:\"116\";}'),
(407, 87, '_galerie_image', 'field_5cc315dad7134'),
(408, 87, '_galerie_image', 'field_5cc315dad7134'),
(412, 91, 'img_0_image', '117'),
(413, 91, '_img_0_image', 'field_5cc31c0ea08c9'),
(414, 91, 'img_1_image', '115'),
(415, 91, '_img_1_image', 'field_5cc31c0ea08c9'),
(416, 91, '_img_1_image', 'field_5cc31c0ea08c9'),
(417, 91, 'img', '2'),
(418, 91, 'img', '2'),
(419, 91, '_img', 'field_5cc31bf8e8cbe'),
(420, 91, '_img', 'field_5cc31bf8e8cbe'),
(421, 89, 'img_0_image', '114'),
(422, 89, '_img_0_image', 'field_5cc31c0ea08c9'),
(423, 89, 'img_1_image', '118'),
(424, 89, '_img_1_image', 'field_5cc31c0ea08c9'),
(425, 89, 'img', '2'),
(426, 89, '_img', 'field_5cc31bf8e8cbe'),
(427, 89, '_img', 'field_5cc31bf8e8cbe'),
(428, 87, 'img_0_image', '113'),
(429, 87, 'img_0_image', '113'),
(430, 87, '_img_0_image', 'field_5cc31c0ea08c9'),
(431, 87, '_img_0_image', 'field_5cc31c0ea08c9'),
(432, 87, 'img_1_image', '116'),
(433, 87, 'img_1_image', '116'),
(434, 87, '_img_1_image', 'field_5cc31c0ea08c9'),
(435, 87, '_img_1_image', 'field_5cc31c0ea08c9'),
(440, 87, 'img', '2'),
(441, 87, 'img', '2'),
(442, 87, '_img', 'field_5cc31bf8e8cbe'),
(443, 87, '_img', 'field_5cc31bf8e8cbe'),
(444, 123, '_edit_lock', '1556825591:1'),
(446, 123, '_thumbnail_id', '117');

-- --------------------------------------------------------

--
-- Table structure for table `dwwm19_posts`
--

CREATE TABLE `dwwm19_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `dwwm19_posts`
--

INSERT INTO `dwwm19_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2019-04-23 09:34:58', '2019-04-23 07:34:58', '<!-- wp:paragraph -->\n<p>Bienvenue sur WordPress. Ceci est votre premier article. Modifiez-le ou supprimez-le, puis commencez à écrire !</p>\n<!-- /wp:paragraph -->', 'Bonjour tout le monde !', '', 'publish', 'open', 'open', '', 'bonjour-tout-le-monde', '', '', '2019-04-26 16:13:11', '2019-04-26 14:13:11', '', 0, 'http://localhost:8888/wordpress/?p=1', 0, 'post', '', 1),
(2, 1, '2019-04-23 09:34:58', '2019-04-23 07:34:58', '<!-- wp:paragraph -->\n<p>Ceci est une page d’exemple. C’est différent d’un article de blog parce qu’elle restera au même endroit et apparaîtra dans la navigation de votre site (dans la plupart des thèmes). La plupart des gens commencent par une page « À propos » qui les présente aux visiteurs du site. Cela pourrait ressembler à quelque chose comme cela :</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Bonjour ! Je suis un mécanicien qui aspire à devenir acteur, et voici mon site. J’habite à Bordeaux, j’ai un super chien baptisé Russell, et j’aime la vodka-ananas (ainsi qu’être surpris par la pluie soudaine lors de longues balades sur la plage au coucher du soleil).</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>... ou quelque chose comme cela :</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>La société 123 Machin Truc a été créée en 1971, et n’a cessé de proposer au public des machins-trucs de qualité depuis lors. Située à Saint-Remy-en-Bouzemont-Saint-Genest-et-Isson, 123 Machin Truc emploie 2 000 personnes, et fabrique toutes sortes de bidules super pour la communauté bouzemontoise.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>En tant que nouvel·le utilisateur ou utilisatrice de WordPress, vous devriez vous rendre sur <a href=\"http://localhost:8888/wordpress/wp-admin/\">votre tableau de bord</a> pour supprimer cette page et créer de nouvelles pages pour votre contenu. Amusez-vous bien !</p>\n<!-- /wp:paragraph -->', 'Page d’exemple', '', 'publish', 'closed', 'open', '', 'page-d-exemple', '', '', '2019-04-23 09:34:58', '2019-04-23 07:34:58', '', 0, 'http://localhost:8888/wordpress/?page_id=2', 0, 'page', '', 0),
(3, 1, '2019-04-23 09:34:58', '2019-04-23 07:34:58', '<!-- wp:heading -->\n<h2>Qui sommes-nous&nbsp;?</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>L’adresse de notre site Web est&nbsp;: http://localhost:8888/wordpress.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>Utilisation des données personnelles collectées</h2>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Commentaires</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Quand vous laissez un commentaire sur notre site web, les données inscrites dans le formulaire de commentaire, mais aussi votre adresse IP et l’agent utilisateur de votre navigateur sont collectés pour nous aider à la détection des commentaires indésirables.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Une chaîne anonymisée créée à partir de votre adresse de messagerie (également appelée hash) peut être envoyée au service Gravatar pour vérifier si vous utilisez ce dernier. Les clauses de confidentialité du service Gravatar sont disponibles ici&nbsp;: https://automattic.com/privacy/. Après validation de votre commentaire, votre photo de profil sera visible publiquement à coté de votre commentaire.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Médias</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Si vous êtes un utilisateur ou une utilisatrice enregistré·e et que vous téléversez des images sur le site web, nous vous conseillons d’éviter de téléverser des images contenant des données EXIF de coordonnées GPS. Les visiteurs de votre site web peuvent télécharger et extraire des données de localisation depuis ces images.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Formulaires de contact</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Cookies</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Si vous déposez un commentaire sur notre site, il vous sera proposé d’enregistrer votre nom, adresse de messagerie et site web dans des cookies. C’est uniquement pour votre confort afin de ne pas avoir à saisir ces informations si vous déposez un autre commentaire plus tard. Ces cookies expirent au bout d’un an.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Si vous avez un compte et que vous vous connectez sur ce site, un cookie temporaire sera créé afin de déterminer si votre navigateur accepte les cookies. Il ne contient pas de données personnelles et sera supprimé automatiquement à la fermeture de votre navigateur.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Lorsque vous vous connecterez, nous mettrons en place un certain nombre de cookies pour enregistrer vos informations de connexion et vos préférences d’écran. La durée de vie d’un cookie de connexion est de deux jours, celle d’un cookie d’option d’écran est d’un an. Si vous cochez «&nbsp;Se souvenir de moi&nbsp;», votre cookie de connexion sera conservé pendant deux semaines. Si vous vous déconnectez de votre compte, le cookie de connexion sera effacé.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>En modifiant ou en publiant une publication, un cookie supplémentaire sera enregistré dans votre navigateur. Ce cookie ne comprend aucune donnée personnelle. Il indique simplement l’ID de la publication que vous venez de modifier. Il expire au bout d’un jour.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Contenu embarqué depuis d’autres sites</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Les articles de ce site peuvent inclure des contenus intégrés (par exemple des vidéos, images, articles…). Le contenu intégré depuis d’autres sites se comporte de la même manière que si le visiteur se rendait sur cet autre site.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Ces sites web pourraient collecter des données sur vous, utiliser des cookies, embarquer des outils de suivis tiers, suivre vos interactions avec ces contenus embarqués si vous disposez d’un compte connecté sur leur site web.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Statistiques et mesures d’audience</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading -->\n<h2>Utilisation et transmission de vos données personnelles</h2>\n<!-- /wp:heading -->\n\n<!-- wp:heading -->\n<h2>Durées de stockage de vos données</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Si vous laissez un commentaire, le commentaire et ses métadonnées sont conservés indéfiniment. Cela permet de reconnaître et approuver automatiquement les commentaires suivants au lieu de les laisser dans la file de modération.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Pour les utilisateurs et utilisatrices qui s’enregistrent sur notre site (si cela est possible), nous stockons également les données personnelles indiquées dans leur profil. Tous les utilisateurs et utilisatrices peuvent voir, modifier ou supprimer leurs informations personnelles à tout moment (à l’exception de leur nom d’utilisateur·ice). Les gestionnaires du site peuvent aussi voir et modifier ces informations.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>Les droits que vous avez sur vos données</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Si vous avez un compte ou si vous avez laissé des commentaires sur le site, vous pouvez demander à recevoir un fichier contenant toutes les données personnelles que nous possédons à votre sujet, incluant celles que vous nous avez fournies. Vous pouvez également demander la suppression des données personnelles vous concernant. Cela ne prend pas en compte les données stockées à des fins administratives, légales ou pour des raisons de sécurité.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>Transmission de vos données personnelles</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Les commentaires des visiteurs peuvent être vérifiés à l’aide d’un service automatisé de détection des commentaires indésirables.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>Informations de contact</h2>\n<!-- /wp:heading -->\n\n<!-- wp:heading -->\n<h2>Informations supplémentaires</h2>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Comment nous protégeons vos données</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Procédures mises en œuvre en cas de fuite de données</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Les services tiers qui nous transmettent des données</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Opérations de marketing automatisé et/ou de profilage réalisées à l’aide des données personnelles</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Affichage des informations liées aux secteurs soumis à des régulations spécifiques</h3>\n<!-- /wp:heading -->', 'Politique de confidentialité', '', 'publish', 'closed', 'open', '', 'politique-de-confidentialite', '', '', '2019-04-26 09:35:40', '2019-04-26 07:35:40', '', 0, 'http://localhost:8888/wordpress/?page_id=3', 0, 'page', '', 0),
(5, 1, '2019-04-23 10:59:26', '2019-04-23 08:59:26', '<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusamus iure obcaecati commodi veritatis quas cumque harum fuga voluptatem, nesciunt cupiditate?</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><br></p>\n<!-- /wp:paragraph -->', 'Salut, mon nom est Lustic', '', 'publish', 'closed', 'closed', '', 'accueil', '', '', '2019-04-25 14:22:31', '2019-04-25 12:22:31', '', 0, 'http://localhost:8888/wordpress/?page_id=5', 0, 'page', '', 0),
(6, 1, '2019-04-23 10:59:26', '2019-04-23 08:59:26', '', 'Accueil', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2019-04-23 10:59:26', '2019-04-23 08:59:26', '', 5, 'http://localhost:8888/wordpress/2019/04/23/5-revision-v1/', 0, 'revision', '', 0),
(7, 1, '2019-04-23 15:07:28', '2019-04-23 13:07:28', '<!-- wp:paragraph -->\n<p>okok okok</p>\n<!-- /wp:paragraph -->', 'Accueil', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2019-04-23 15:07:28', '2019-04-23 13:07:28', '', 5, 'http://localhost:8888/wordpress/2019/04/23/5-revision-v1/', 0, 'revision', '', 0),
(8, 1, '2019-04-23 15:23:47', '2019-04-23 13:23:47', '<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusamus iure obcaecati commodi veritatis quas cumque harum fuga voluptatem, nesciunt cupiditate?</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><br></p>\n<!-- /wp:paragraph -->', 'Salut, mon nom est Lustic', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2019-04-23 15:23:47', '2019-04-23 13:23:47', '', 5, 'http://localhost:8888/wordpress/2019/04/23/5-revision-v1/', 0, 'revision', '', 0),
(9, 1, '2019-04-23 16:10:47', '2019-04-23 14:10:47', '', 'Capture d’écran 2019-03-20 à 13.59.18', '', 'inherit', 'open', 'closed', '', 'capture-decran-2019-03-20-a-13-59-18', '', '', '2019-04-23 16:10:47', '2019-04-23 14:10:47', '', 5, 'http://localhost:8888/wordpress/wp-content/uploads/2019/04/Capture-d’écran-2019-03-20-à-13.59.18.png', 0, 'attachment', 'image/png', 0),
(13, 1, '2019-04-23 17:12:06', '2019-04-23 15:12:06', '<!-- wp:image {\"id\":14} -->\n<figure class=\"wp-block-image\"><img src=\"http://localhost:8888/wordpress/wp-content/uploads/2019/04/10662309-2.jpg\" alt=\"\" class=\"wp-image-14\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>La banane est le fruit ou la baie dérivant de l’inflorescence du bananier. Les bananes sont des fruits très généralement stériles issus de variétés domestiquées. Seuls les fruits des bananiers sauvages et de quelques cultivars domestiques contiennent des graines.</p>\n<!-- /wp:paragraph -->', 'Les bananes', '', 'publish', 'open', 'open', '', 'les-bananes', '', '', '2019-04-24 09:19:33', '2019-04-24 07:19:33', '', 0, 'http://localhost:8888/wordpress/?p=13', 0, 'post', '', 0),
(14, 1, '2019-04-23 17:11:48', '2019-04-23 15:11:48', '', '10662309-2', '', 'inherit', 'open', 'closed', '', '10662309-2', '', '', '2019-04-23 17:11:48', '2019-04-23 15:11:48', '', 13, 'http://localhost:8888/wordpress/wp-content/uploads/2019/04/10662309-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(15, 1, '2019-04-23 17:12:06', '2019-04-23 15:12:06', '<!-- wp:paragraph -->\n<p>La banane est le fruit ou la baie dérivant de l’inflorescence du bananier. Les bananes sont des fruits très généralement stériles issus de variétés domestiquées. Seuls les fruits des bananiers sauvages et de quelques cultivars domestiques contiennent des graines.</p>\n<!-- /wp:paragraph -->', 'Les bananes', '', 'inherit', 'closed', 'closed', '', '13-revision-v1', '', '', '2019-04-23 17:12:06', '2019-04-23 15:12:06', '', 13, 'http://localhost:8888/wordpress/2019/04/23/13-revision-v1/', 0, 'revision', '', 0),
(16, 1, '2019-04-23 17:13:51', '2019-04-23 15:13:51', '<!-- wp:image {\"id\":14} -->\n<figure class=\"wp-block-image\"><img src=\"http://localhost:8888/wordpress/wp-content/uploads/2019/04/10662309-2.jpg\" alt=\"\" class=\"wp-image-14\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>La banane est le fruit ou la baie dérivant de l’inflorescence du bananier. Les bananes sont des fruits très généralement stériles issus de variétés domestiquées. Seuls les fruits des bananiers sauvages et de quelques cultivars domestiques contiennent des graines.</p>\n<!-- /wp:paragraph -->', 'Les bananes', '', 'inherit', 'closed', 'closed', '', '13-revision-v1', '', '', '2019-04-23 17:13:51', '2019-04-23 15:13:51', '', 13, 'http://localhost:8888/wordpress/2019/04/23/13-revision-v1/', 0, 'revision', '', 0),
(17, 1, '2019-04-23 17:16:58', '2019-04-23 15:16:58', '<!-- wp:image {\"id\":18} -->\n<figure class=\"wp-block-image\"><img src=\"http://localhost:8888/wordpress/wp-content/uploads/2019/04/photo-fraise-b.-plantevin-2-.jpg\" alt=\"\" class=\"wp-image-18\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>La fraise est un fruit rouge issu des fraisiers, espèces de plantes herbacées appartenant au genre Fragaria, dont plusieurs sont cultivées.</p>\n<!-- /wp:paragraph -->', 'Les fraises', '', 'publish', 'open', 'open', '', 'les-fraises', '', '', '2019-04-24 09:19:29', '2019-04-24 07:19:29', '', 0, 'http://localhost:8888/wordpress/?p=17', 0, 'post', '', 0),
(18, 1, '2019-04-23 17:16:47', '2019-04-23 15:16:47', '', 'photo-fraise-b.-plantevin-2-', '', 'inherit', 'open', 'closed', '', 'photo-fraise-b-plantevin-2', '', '', '2019-04-23 17:16:47', '2019-04-23 15:16:47', '', 17, 'http://localhost:8888/wordpress/wp-content/uploads/2019/04/photo-fraise-b.-plantevin-2-.jpg', 0, 'attachment', 'image/jpeg', 0),
(19, 1, '2019-04-23 17:16:58', '2019-04-23 15:16:58', '<!-- wp:image {\"id\":18} -->\n<figure class=\"wp-block-image\"><img src=\"http://localhost:8888/wordpress/wp-content/uploads/2019/04/photo-fraise-b.-plantevin-2-.jpg\" alt=\"\" class=\"wp-image-18\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>La fraise est un fruit rouge issu des fraisiers, espèces de plantes herbacées appartenant au genre Fragaria, dont plusieurs sont cultivées.</p>\n<!-- /wp:paragraph -->', 'Les fraises', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2019-04-23 17:16:58', '2019-04-23 15:16:58', '', 17, 'http://localhost:8888/wordpress/2019/04/23/17-revision-v1/', 0, 'revision', '', 0),
(20, 1, '2019-04-23 17:22:05', '2019-04-23 15:22:05', '<!-- wp:image {\"id\":21} -->\n<figure class=\"wp-block-image\"><img src=\"http://localhost:8888/wordpress/wp-content/uploads/2019/04/I-Autre-5900_1200x1200-tomate-moneymaker-ab.net_-1024x1024.jpg\" alt=\"\" class=\"wp-image-21\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Le plant de tomates est une espèce de plantes herbacées du genre solanum de la famille des Solanacées, originaire du nord-ouest de l\'Amérique du Sud, largement cultivée pour son fruit. Le terme désigne aussi ce fruit charnu. La tomate se consomme comme un légume-fruit, crue ou cuite</p>\n<!-- /wp:paragraph -->', 'Les tomates', '', 'publish', 'open', 'open', '', 'les-tomates', '', '', '2019-04-24 09:19:24', '2019-04-24 07:19:24', '', 0, 'http://localhost:8888/wordpress/?p=20', 0, 'post', '', 0),
(21, 1, '2019-04-23 17:21:31', '2019-04-23 15:21:31', '', 'I-Autre-5900_1200x1200-tomate-moneymaker-ab.net', '', 'inherit', 'open', 'closed', '', 'i-autre-5900_1200x1200-tomate-moneymaker-ab-net', '', '', '2019-04-23 17:21:31', '2019-04-23 15:21:31', '', 20, 'http://localhost:8888/wordpress/wp-content/uploads/2019/04/I-Autre-5900_1200x1200-tomate-moneymaker-ab.net_.jpg', 0, 'attachment', 'image/jpeg', 0),
(22, 1, '2019-04-23 17:22:05', '2019-04-23 15:22:05', '<!-- wp:image {\"id\":21} -->\n<figure class=\"wp-block-image\"><img src=\"http://localhost:8888/wordpress/wp-content/uploads/2019/04/I-Autre-5900_1200x1200-tomate-moneymaker-ab.net_-1024x1024.jpg\" alt=\"\" class=\"wp-image-21\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Le plant de tomates est une espèce de plantes herbacées du genre solanum de la famille des Solanacées, originaire du nord-ouest de l\'Amérique du Sud, largement cultivée pour son fruit. Le terme désigne aussi ce fruit charnu. La tomate se consomme comme un légume-fruit, crue ou cuite</p>\n<!-- /wp:paragraph -->', 'Les tomates', '', 'inherit', 'closed', 'closed', '', '20-revision-v1', '', '', '2019-04-23 17:22:05', '2019-04-23 15:22:05', '', 20, 'http://localhost:8888/wordpress/2019/04/23/20-revision-v1/', 0, 'revision', '', 0),
(23, 1, '2019-04-23 17:25:47', '2019-04-23 15:25:47', '<!-- wp:image {\"id\":25,\"align\":\"center\"} -->\n<div class=\"wp-block-image\"><figure class=\"aligncenter\"><img src=\"http://localhost:8888/wordpress/wp-content/uploads/2019/04/10660346.jpg\" alt=\"\" class=\"wp-image-25\"/></figure></div>\n<!-- /wp:image -->\n\n<!-- wp:paragraph {\"align\":\"center\"} -->\n<p style=\"text-align:center\">Le poireau est une espèce de plante herbacée vivace largement cultivée comme plante potagère pour ses feuilles consommées comme légumes. Il appartient à la famille des Amaryllidacées. Noms communs: poireau, porreau, poirée, poirette, asperge du pauvre.</p>\n<!-- /wp:paragraph -->', 'Les poireaux', '', 'publish', 'open', 'open', '', 'les-poireaux', '', '', '2019-04-24 15:08:09', '2019-04-24 13:08:09', '', 0, 'http://localhost:8888/wordpress/?p=23', 0, 'post', '', 0),
(24, 1, '2019-04-23 17:24:54', '2019-04-23 15:24:54', '<!-- wp:paragraph -->\n<p>Le poireau est une espèce de plante herbacée vivace largement cultivée comme plante potagère pour ses feuilles consommées comme légumes. Il appartient à la famille des Amaryllidacées. Noms communs: poireau, porreau, poirée, poirette, asperge du pauvre.</p>\n<!-- /wp:paragraph -->', 'Les poireaux', '', 'inherit', 'closed', 'closed', '', '23-revision-v1', '', '', '2019-04-23 17:24:54', '2019-04-23 15:24:54', '', 23, 'http://localhost:8888/wordpress/2019/04/23/23-revision-v1/', 0, 'revision', '', 0),
(25, 1, '2019-04-23 17:25:29', '2019-04-23 15:25:29', '', '10660346', '', 'inherit', 'open', 'closed', '', '10660346', '', '', '2019-04-23 17:25:29', '2019-04-23 15:25:29', '', 23, 'http://localhost:8888/wordpress/wp-content/uploads/2019/04/10660346.jpg', 0, 'attachment', 'image/jpeg', 0),
(26, 1, '2019-04-23 17:25:47', '2019-04-23 15:25:47', '<!-- wp:image {\"id\":25} -->\n<figure class=\"wp-block-image\"><img src=\"http://localhost:8888/wordpress/wp-content/uploads/2019/04/10660346.jpg\" alt=\"\" class=\"wp-image-25\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Le poireau est une espèce de plante herbacée vivace largement cultivée comme plante potagère pour ses feuilles consommées comme légumes. Il appartient à la famille des Amaryllidacées. Noms communs: poireau, porreau, poirée, poirette, asperge du pauvre.</p>\n<!-- /wp:paragraph -->', 'Les poireaux', '', 'inherit', 'closed', 'closed', '', '23-revision-v1', '', '', '2019-04-23 17:25:47', '2019-04-23 15:25:47', '', 23, 'http://localhost:8888/wordpress/2019/04/23/23-revision-v1/', 0, 'revision', '', 0),
(27, 1, '2019-04-24 09:19:39', '2019-04-24 07:19:39', '<!-- wp:paragraph -->\n<p>Bienvenue sur WordPress. Ceci est votre premier article. Modifiez-le ou supprimez-le, puis commencez à écrire !</p>\n<!-- /wp:paragraph -->', 'Bonjour tout le monde !', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2019-04-24 09:19:39', '2019-04-24 07:19:39', '', 1, 'http://localhost:8888/wordpress/2019/04/24/1-revision-v1/', 0, 'revision', '', 0),
(28, 1, '2019-04-24 15:08:09', '2019-04-24 13:08:09', '<!-- wp:image {\"id\":25,\"align\":\"center\"} -->\n<div class=\"wp-block-image\"><figure class=\"aligncenter\"><img src=\"http://localhost:8888/wordpress/wp-content/uploads/2019/04/10660346.jpg\" alt=\"\" class=\"wp-image-25\"/></figure></div>\n<!-- /wp:image -->\n\n<!-- wp:paragraph {\"align\":\"center\"} -->\n<p style=\"text-align:center\">Le poireau est une espèce de plante herbacée vivace largement cultivée comme plante potagère pour ses feuilles consommées comme légumes. Il appartient à la famille des Amaryllidacées. Noms communs: poireau, porreau, poirée, poirette, asperge du pauvre.</p>\n<!-- /wp:paragraph -->', 'Les poireaux', '', 'inherit', 'closed', 'closed', '', '23-revision-v1', '', '', '2019-04-24 15:08:09', '2019-04-24 13:08:09', '', 23, 'http://localhost:8888/wordpress/2019/04/24/23-revision-v1/', 0, 'revision', '', 0),
(39, 1, '2019-04-24 16:52:27', '2019-04-24 14:52:27', '', 'Accueil', '', 'publish', 'closed', 'closed', '', '39', '', '', '2019-04-26 09:35:53', '2019-04-26 07:35:53', '', 0, 'http://localhost:8888/wordpress/?p=39', 1, 'nav_menu_item', '', 0),
(46, 1, '2019-04-25 11:16:01', '2019-04-25 09:16:01', '', '<a href=\"#\" class=\"icon alt fa-twitter\"><span class=\"label\">Twitter</span></a>', '', 'publish', 'closed', 'closed', '', 'twitter', '', '', '2019-04-25 11:32:24', '2019-04-25 09:32:24', '', 0, 'http://localhost:8888/wordpress/?p=46', 1, 'nav_menu_item', '', 0),
(47, 1, '2019-04-25 11:17:13', '2019-04-25 09:17:13', '<div class=\"fields\">\r\n    <div class=\"field half\">\r\n        <label for=\"name\">Name</label>\r\n        [text* text-505 id:name]\r\n    </div>\r\n    <div class=\"field half\">\r\n        <label for=\"email\">Email</label>\r\n        [text* text-505 id:email]\r\n    </div>\r\n    <div class=\"field\">\r\n        <label for=\"message\">Message</label>\r\n        [textarea* textarea-501 id:message]\r\n    </div>\r\n</div>\r\n<ul class=\"actions\">\r\n    <li>[submit class:primary]</li>\r\n    <li><input type=\"reset\" value=\"Clear\" /></li>\r\n</ul>\n1\nDW2019 \"[your-subject]\"\nDW2019 <locastro.theo@gmail.com>\nlocastro.theo@gmail.com\nDe : [your-name] <[your-email]>\r\nObjet : [your-subject]\r\n\r\nCorps du message :\r\n[your-message]\r\n\r\n-- \r\nCet e-mail a été envoyé via le formulaire de contact de DW2019 (http://localhost:8888/wordpress)\n\n\n\n\n\nDW2019 \"[your-subject]\"\nDW2019 <locastro.theo@gmail.com>\n[your-email]\nCorps du message :\r\n[your-message]\r\n\r\n-- \r\nCet e-mail a été envoyé via le formulaire de contact de DW2019 (http://localhost:8888/wordpress)\nReply-To: locastro.theo@gmail.com\n\n\n\nMerci pour votre message. Il a été envoyé.\nUne erreur s’est produite lors de l’envoi de votre message. Veuillez essayer à nouveau plus tard.\nUn ou plusieurs champs contiennent une erreur. Veuillez vérifier et essayer à nouveau.\nUne erreur s’est produite lors de l’envoi de votre message. Veuillez essayer à nouveau plus tard.\nVous devez accepter les termes et conditions avant d’envoyer votre message.\nCe champ est obligatoire.\nLe champ est trop long.\nLe champ est trop court.\nLe format de date est incorrect.\nLa date précède la première date autorisée.\nLa date est postérieure à la dernière date autorisée.\nUne erreur inconnue s’est produite lors du téléversement du fichier.\nVous n’avez pas les droits nécessaires pour téléverser ce type de fichier.\nLe fichier est trop volumineux.\nUne erreur s’est produite lors du téléversement du fichier.\nLe format du nombre est invalide.\nLe nombre est plus petit que le minimum autorisé.\nLe nombre est plus grand que le maximum autorisé.\nLa réponse à la question est incorrecte.\nLe code entré est incorrect.\nL’adresse e-mail n’est pas valide.\nL’URL n’est pas valide.\nLe numéro de téléphone n’est pas valide.', 'From contact', '', 'publish', 'closed', 'closed', '', 'formulaire-de-contact-1', '', '', '2019-04-25 11:27:47', '2019-04-25 09:27:47', '', 0, 'http://localhost:8888/wordpress/?post_type=wpcf7_contact_form&#038;p=47', 0, 'wpcf7_contact_form', '', 0),
(48, 1, '2019-04-25 11:28:39', '2019-04-25 09:28:39', '', '<a href=\"#\" class=\"icon alt fa-facebook\"><span class=\"label\">Facebook</span></a>', '', 'publish', 'closed', 'closed', '', 'facebook', '', '', '2019-04-25 11:32:24', '2019-04-25 09:32:24', '', 0, 'http://localhost:8888/wordpress/?p=48', 2, 'nav_menu_item', '', 0),
(49, 1, '2019-04-25 11:28:39', '2019-04-25 09:28:39', '', '<a href=\"#\" class=\"icon alt fa-instagram\"><span class=\"label\">Instagram</span></a>', '', 'publish', 'closed', 'closed', '', 'instagram', '', '', '2019-04-25 11:32:24', '2019-04-25 09:32:24', '', 0, 'http://localhost:8888/wordpress/?p=49', 3, 'nav_menu_item', '', 0),
(50, 1, '2019-04-25 11:32:24', '2019-04-25 09:32:24', '', '<a href=\"#\" class=\"icon alt fa-github\"><span class=\"label\">GitHub</span></a>', '', 'publish', 'closed', 'closed', '', 'github', '', '', '2019-04-25 11:32:24', '2019-04-25 09:32:24', '', 0, 'http://localhost:8888/wordpress/?p=50', 4, 'nav_menu_item', '', 0),
(51, 1, '2019-04-25 11:32:24', '2019-04-25 09:32:24', '', '<a href=\"#\" class=\"icon alt fa-linkedin\"><span class=\"label\">LinkedIn</span></a>', '', 'publish', 'closed', 'closed', '', 'linkedin', '', '', '2019-04-25 11:32:24', '2019-04-25 09:32:24', '', 0, 'http://localhost:8888/wordpress/?p=51', 5, 'nav_menu_item', '', 0),
(54, 1, '2019-04-25 12:10:32', '2019-04-25 10:10:32', 'a:7:{s:8:\"location\";a:2:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:8:\"taxonomy\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:8:\"category\";}}i:1;a:1:{i:0;a:3:{s:5:\"param\";s:4:\"page\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:1:\"5\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}', 'Paragraphe bas de page', 'paragraphe-bas-de-page', 'publish', 'closed', 'closed', '', 'group_5cc18433cfbf4', '', '', '2019-04-25 14:29:29', '2019-04-25 12:29:29', '', 0, 'http://localhost:8888/wordpress/?post_type=acf-field-group&#038;p=54', 0, 'acf-field-group', '', 0),
(55, 1, '2019-04-25 12:10:32', '2019-04-25 10:10:32', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:33:\"Titre de l\'article en bas de page\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'titre bas', 'titre_bas', 'publish', 'closed', 'closed', '', 'field_5cc186ebf8d0a', '', '', '2019-04-25 12:10:32', '2019-04-25 10:10:32', '', 54, 'http://localhost:8888/wordpress/?post_type=acf-field&p=55', 0, 'acf-field', '', 0),
(56, 1, '2019-04-25 12:11:03', '2019-04-25 10:11:03', 'a:10:{s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:38:\"Paragraphe de l\'article en bas de page\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:9:\"new_lines\";s:0:\"\";}', 'para bas', 'para_bas', 'publish', 'closed', 'closed', '', 'field_5cc1879c4f068', '', '', '2019-04-25 14:23:23', '2019-04-25 12:23:23', '', 54, 'http://localhost:8888/wordpress/?post_type=acf-field&#038;p=56', 1, 'acf-field', '', 0),
(57, 1, '2019-04-25 12:13:26', '2019-04-25 10:13:26', '<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusamus iure obcaecati commodi veritatis quas cumque harum fuga voluptatem, nesciunt cupiditate?</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><br></p>\n<!-- /wp:paragraph -->', 'Salut, mon nom est Lustic', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2019-04-25 12:13:26', '2019-04-25 10:13:26', '', 5, 'http://localhost:8888/wordpress/2019/04/25/5-revision-v1/', 0, 'revision', '', 0),
(58, 1, '2019-04-25 12:13:26', '2019-04-25 10:13:26', '<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusamus iure obcaecati commodi veritatis quas cumque harum fuga voluptatem, nesciunt cupiditate?</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><br></p>\n<!-- /wp:paragraph -->', 'Salut, mon nom est Lustic', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2019-04-25 12:13:26', '2019-04-25 10:13:26', '', 5, 'http://localhost:8888/wordpress/2019/04/25/5-revision-v1/', 0, 'revision', '', 0),
(59, 1, '2019-04-25 12:13:47', '2019-04-25 10:13:47', '<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusamus iure obcaecati commodi veritatis quas cumque harum fuga voluptatem, nesciunt cupiditate?</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><br></p>\n<!-- /wp:paragraph -->', 'Salut, mon nom est Lustic', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2019-04-25 12:13:47', '2019-04-25 10:13:47', '', 5, 'http://localhost:8888/wordpress/2019/04/25/5-revision-v1/', 0, 'revision', '', 0),
(60, 1, '2019-04-25 12:13:47', '2019-04-25 10:13:47', '<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusamus iure obcaecati commodi veritatis quas cumque harum fuga voluptatem, nesciunt cupiditate?</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><br></p>\n<!-- /wp:paragraph -->', 'Salut, mon nom est Lustic', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2019-04-25 12:13:47', '2019-04-25 10:13:47', '', 5, 'http://localhost:8888/wordpress/2019/04/25/5-revision-v1/', 0, 'revision', '', 0),
(61, 1, '2019-04-25 13:32:08', '2019-04-25 11:32:08', 'a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:8:\"taxonomy\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:8:\"category\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}', 'image pour categorie', 'image-pour-categorie', 'publish', 'closed', 'closed', '', 'group_5cc19aa64c781', '', '', '2019-04-25 16:07:31', '2019-04-25 14:07:31', '', 0, 'http://localhost:8888/wordpress/?post_type=acf-field-group&#038;p=61', 0, 'acf-field-group', '', 0),
(62, 1, '2019-04-25 13:32:08', '2019-04-25 11:32:08', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'cat img', 'cat_img', 'publish', 'closed', 'closed', '', 'field_5cc19ab070a5a', '', '', '2019-04-25 16:07:31', '2019-04-25 14:07:31', '', 61, 'http://localhost:8888/wordpress/?post_type=acf-field&#038;p=62', 0, 'acf-field', '', 0),
(63, 1, '2019-04-25 14:16:51', '2019-04-25 12:16:51', 'a:10:{s:4:\"type\";s:9:\"page_link\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"post_type\";s:0:\"\";s:8:\"taxonomy\";s:0:\"\";s:10:\"allow_null\";i:0;s:14:\"allow_archives\";i:1;s:8:\"multiple\";i:0;}', 'link bas', 'link_bas', 'publish', 'closed', 'closed', '', 'field_5cc1a506d3d29', '', '', '2019-04-25 14:18:01', '2019-04-25 12:18:01', '', 54, 'http://localhost:8888/wordpress/?post_type=acf-field&#038;p=63', 2, 'acf-field', '', 0),
(65, 1, '2019-04-25 14:18:21', '2019-04-25 12:18:21', '<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusamus iure obcaecati commodi veritatis quas cumque harum fuga voluptatem, nesciunt cupiditate?</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><br></p>\n<!-- /wp:paragraph -->', 'Salut, mon nom est Lustic', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2019-04-25 14:18:21', '2019-04-25 12:18:21', '', 5, 'http://localhost:8888/wordpress/2019/04/25/5-revision-v1/', 0, 'revision', '', 0),
(66, 1, '2019-04-25 14:18:21', '2019-04-25 12:18:21', '<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusamus iure obcaecati commodi veritatis quas cumque harum fuga voluptatem, nesciunt cupiditate?</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><br></p>\n<!-- /wp:paragraph -->', 'Salut, mon nom est Lustic', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2019-04-25 14:18:21', '2019-04-25 12:18:21', '', 5, 'http://localhost:8888/wordpress/2019/04/25/5-revision-v1/', 0, 'revision', '', 0),
(67, 1, '2019-04-25 14:19:55', '2019-04-25 12:19:55', '<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusamus iure obcaecati commodi veritatis quas cumque harum fuga voluptatem, nesciunt cupiditate?</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><br></p>\n<!-- /wp:paragraph -->', 'Salut, mon nom est Lustic', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2019-04-25 14:19:55', '2019-04-25 12:19:55', '', 5, 'http://localhost:8888/wordpress/2019/04/25/5-revision-v1/', 0, 'revision', '', 0),
(68, 1, '2019-04-25 14:19:55', '2019-04-25 12:19:55', '<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusamus iure obcaecati commodi veritatis quas cumque harum fuga voluptatem, nesciunt cupiditate?</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><br></p>\n<!-- /wp:paragraph -->', 'Salut, mon nom est Lustic', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2019-04-25 14:19:55', '2019-04-25 12:19:55', '', 5, 'http://localhost:8888/wordpress/2019/04/25/5-revision-v1/', 0, 'revision', '', 0),
(69, 1, '2019-04-25 16:40:49', '2019-04-25 14:40:49', 'a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:12:\"options_page\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:11:\"acf-options\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}', 'Option1', 'option1', 'publish', 'closed', 'closed', '', 'group_5cc1c5a33244b', '', '', '2019-04-25 16:48:27', '2019-04-25 14:48:27', '', 0, 'http://localhost:8888/wordpress/?post_type=acf-field-group&#038;p=69', 0, 'acf-field-group', '', 0),
(70, 1, '2019-04-25 16:40:49', '2019-04-25 14:40:49', 'a:7:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}', 'Copyright', 'copyright', 'publish', 'closed', 'closed', '', 'field_5cc1c5bc72d94', '', '', '2019-04-25 16:40:49', '2019-04-25 14:40:49', '', 69, 'http://localhost:8888/wordpress/?post_type=acf-field&p=70', 0, 'acf-field', '', 0),
(71, 1, '2019-04-25 16:40:49', '2019-04-25 14:40:49', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'Copyright Label', 'copyright_label', 'publish', 'closed', 'closed', '', 'field_5cc1c60e72d95', '', '', '2019-04-25 16:40:49', '2019-04-25 14:40:49', '', 69, 'http://localhost:8888/wordpress/?post_type=acf-field&p=71', 1, 'acf-field', '', 0),
(72, 1, '2019-04-25 16:40:49', '2019-04-25 14:40:49', 'a:7:{s:4:\"type\";s:3:\"tab\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"placement\";s:3:\"top\";s:8:\"endpoint\";i:0;}', 'Réseaux Sociaux', 'reseaux_sociaux', 'publish', 'closed', 'closed', '', 'field_5cc1c62272d96', '', '', '2019-04-25 16:40:49', '2019-04-25 14:40:49', '', 69, 'http://localhost:8888/wordpress/?post_type=acf-field&p=72', 2, 'acf-field', '', 0),
(73, 1, '2019-04-25 16:40:49', '2019-04-25 14:40:49', 'a:10:{s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"collapsed\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:6:\"layout\";s:5:\"table\";s:12:\"button_label\";s:0:\"\";}', 'Réseaux Sociaux', 'reseaux_sociaux', 'publish', 'closed', 'closed', '', 'field_5cc1c63672d97', '', '', '2019-04-25 16:40:49', '2019-04-25 14:40:49', '', 69, 'http://localhost:8888/wordpress/?post_type=acf-field&p=73', 3, 'acf-field', '', 0),
(74, 1, '2019-04-25 16:48:27', '2019-04-25 14:48:27', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'libelle', 'libelle', 'publish', 'closed', 'closed', '', 'field_5cc1c87976f06', '', '', '2019-04-25 16:48:27', '2019-04-25 14:48:27', '', 73, 'http://localhost:8888/wordpress/?post_type=acf-field&p=74', 0, 'acf-field', '', 0),
(75, 1, '2019-04-25 16:48:27', '2019-04-25 14:48:27', 'a:7:{s:4:\"type\";s:3:\"url\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}', 'url', 'url', 'publish', 'closed', 'closed', '', 'field_5cc1c84976f04', '', '', '2019-04-25 16:48:27', '2019-04-25 14:48:27', '', 73, 'http://localhost:8888/wordpress/?post_type=acf-field&p=75', 1, 'acf-field', '', 0),
(76, 1, '2019-04-25 16:48:27', '2019-04-25 14:48:27', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'class', 'class', 'publish', 'closed', 'closed', '', 'field_5cc1c86876f05', '', '', '2019-04-25 16:48:27', '2019-04-25 14:48:27', '', 73, 'http://localhost:8888/wordpress/?post_type=acf-field&p=76', 2, 'acf-field', '', 0),
(77, 1, '2019-04-26 09:13:23', '2019-04-26 07:13:23', '<!-- wp:paragraph -->\n<p>Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem </p>\n<!-- /wp:paragraph -->', 'Mentions légales', '', 'publish', 'closed', 'closed', '', 'mentions-legales', '', '', '2019-04-26 09:13:23', '2019-04-26 07:13:23', '', 0, 'http://localhost:8888/wordpress/?page_id=77', 0, 'page', '', 0),
(78, 1, '2019-04-26 09:13:23', '2019-04-26 07:13:23', '<!-- wp:paragraph -->\n<p>Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem </p>\n<!-- /wp:paragraph -->', 'Mentions légales', '', 'inherit', 'closed', 'closed', '', '77-revision-v1', '', '', '2019-04-26 09:13:23', '2019-04-26 07:13:23', '', 77, 'http://localhost:8888/wordpress/2019/04/26/77-revision-v1/', 0, 'revision', '', 0),
(79, 1, '2019-04-26 09:14:48', '2019-04-26 07:14:48', ' ', '', '', 'publish', 'closed', 'closed', '', '79', '', '', '2019-04-26 09:35:53', '2019-04-26 07:35:53', '', 0, 'http://localhost:8888/wordpress/?p=79', 2, 'nav_menu_item', '', 0),
(80, 1, '2019-04-26 09:35:40', '2019-04-26 07:35:40', '<!-- wp:heading -->\n<h2>Qui sommes-nous&nbsp;?</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>L’adresse de notre site Web est&nbsp;: http://localhost:8888/wordpress.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>Utilisation des données personnelles collectées</h2>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Commentaires</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Quand vous laissez un commentaire sur notre site web, les données inscrites dans le formulaire de commentaire, mais aussi votre adresse IP et l’agent utilisateur de votre navigateur sont collectés pour nous aider à la détection des commentaires indésirables.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Une chaîne anonymisée créée à partir de votre adresse de messagerie (également appelée hash) peut être envoyée au service Gravatar pour vérifier si vous utilisez ce dernier. Les clauses de confidentialité du service Gravatar sont disponibles ici&nbsp;: https://automattic.com/privacy/. Après validation de votre commentaire, votre photo de profil sera visible publiquement à coté de votre commentaire.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Médias</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Si vous êtes un utilisateur ou une utilisatrice enregistré·e et que vous téléversez des images sur le site web, nous vous conseillons d’éviter de téléverser des images contenant des données EXIF de coordonnées GPS. Les visiteurs de votre site web peuvent télécharger et extraire des données de localisation depuis ces images.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Formulaires de contact</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Cookies</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Si vous déposez un commentaire sur notre site, il vous sera proposé d’enregistrer votre nom, adresse de messagerie et site web dans des cookies. C’est uniquement pour votre confort afin de ne pas avoir à saisir ces informations si vous déposez un autre commentaire plus tard. Ces cookies expirent au bout d’un an.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Si vous avez un compte et que vous vous connectez sur ce site, un cookie temporaire sera créé afin de déterminer si votre navigateur accepte les cookies. Il ne contient pas de données personnelles et sera supprimé automatiquement à la fermeture de votre navigateur.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Lorsque vous vous connecterez, nous mettrons en place un certain nombre de cookies pour enregistrer vos informations de connexion et vos préférences d’écran. La durée de vie d’un cookie de connexion est de deux jours, celle d’un cookie d’option d’écran est d’un an. Si vous cochez «&nbsp;Se souvenir de moi&nbsp;», votre cookie de connexion sera conservé pendant deux semaines. Si vous vous déconnectez de votre compte, le cookie de connexion sera effacé.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>En modifiant ou en publiant une publication, un cookie supplémentaire sera enregistré dans votre navigateur. Ce cookie ne comprend aucune donnée personnelle. Il indique simplement l’ID de la publication que vous venez de modifier. Il expire au bout d’un jour.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Contenu embarqué depuis d’autres sites</h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Les articles de ce site peuvent inclure des contenus intégrés (par exemple des vidéos, images, articles…). Le contenu intégré depuis d’autres sites se comporte de la même manière que si le visiteur se rendait sur cet autre site.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Ces sites web pourraient collecter des données sur vous, utiliser des cookies, embarquer des outils de suivis tiers, suivre vos interactions avec ces contenus embarqués si vous disposez d’un compte connecté sur leur site web.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Statistiques et mesures d’audience</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading -->\n<h2>Utilisation et transmission de vos données personnelles</h2>\n<!-- /wp:heading -->\n\n<!-- wp:heading -->\n<h2>Durées de stockage de vos données</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Si vous laissez un commentaire, le commentaire et ses métadonnées sont conservés indéfiniment. Cela permet de reconnaître et approuver automatiquement les commentaires suivants au lieu de les laisser dans la file de modération.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Pour les utilisateurs et utilisatrices qui s’enregistrent sur notre site (si cela est possible), nous stockons également les données personnelles indiquées dans leur profil. Tous les utilisateurs et utilisatrices peuvent voir, modifier ou supprimer leurs informations personnelles à tout moment (à l’exception de leur nom d’utilisateur·ice). Les gestionnaires du site peuvent aussi voir et modifier ces informations.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>Les droits que vous avez sur vos données</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Si vous avez un compte ou si vous avez laissé des commentaires sur le site, vous pouvez demander à recevoir un fichier contenant toutes les données personnelles que nous possédons à votre sujet, incluant celles que vous nous avez fournies. Vous pouvez également demander la suppression des données personnelles vous concernant. Cela ne prend pas en compte les données stockées à des fins administratives, légales ou pour des raisons de sécurité.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>Transmission de vos données personnelles</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Les commentaires des visiteurs peuvent être vérifiés à l’aide d’un service automatisé de détection des commentaires indésirables.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>Informations de contact</h2>\n<!-- /wp:heading -->\n\n<!-- wp:heading -->\n<h2>Informations supplémentaires</h2>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Comment nous protégeons vos données</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Procédures mises en œuvre en cas de fuite de données</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Les services tiers qui nous transmettent des données</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Opérations de marketing automatisé et/ou de profilage réalisées à l’aide des données personnelles</h3>\n<!-- /wp:heading -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3>Affichage des informations liées aux secteurs soumis à des régulations spécifiques</h3>\n<!-- /wp:heading -->', 'Politique de confidentialité', '', 'inherit', 'closed', 'closed', '', '3-revision-v1', '', '', '2019-04-26 09:35:40', '2019-04-26 07:35:40', '', 3, 'http://localhost:8888/wordpress/2019/04/26/3-revision-v1/', 0, 'revision', '', 0),
(81, 1, '2019-04-26 09:35:53', '2019-04-26 07:35:53', ' ', '', '', 'publish', 'closed', 'closed', '', '81', '', '', '2019-04-26 09:35:53', '2019-04-26 07:35:53', '', 0, 'http://localhost:8888/wordpress/?p=81', 3, 'nav_menu_item', '', 0);
INSERT INTO `dwwm19_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(83, 1, '2019-04-26 10:28:47', '2019-04-26 08:28:47', '', 'Mes réalisations', '', 'publish', 'closed', 'closed', '', 'mes-realisations', '', '', '2019-04-26 10:28:47', '2019-04-26 08:28:47', '', 0, 'http://localhost:8888/wordpress/?page_id=83', 0, 'page', '', 0),
(84, 1, '2019-04-26 10:28:47', '2019-04-26 08:28:47', '', 'Mes réalisations', '', 'inherit', 'closed', 'closed', '', '83-revision-v1', '', '', '2019-04-26 10:28:47', '2019-04-26 08:28:47', '', 83, 'http://localhost:8888/wordpress/2019/04/26/83-revision-v1/', 0, 'revision', '', 0),
(85, 1, '2019-04-26 11:05:02', '2019-04-26 09:05:02', '', 'Photo 1', '', 'publish', 'open', 'closed', '', 'photo-1', '', '', '2019-04-26 11:05:02', '2019-04-26 09:05:02', '', 0, 'http://localhost:8888/wordpress/?post_type=photos&#038;p=85', 0, 'photos', '', 0),
(86, 1, '2019-04-26 11:06:35', '2019-04-26 09:06:35', '', 'Photo 2', '', 'publish', 'open', 'closed', '', 'photo-2', '', '', '2019-04-26 11:06:35', '2019-04-26 09:06:35', '', 0, 'http://localhost:8888/wordpress/?post_type=photos&#038;p=86', 0, 'photos', '', 0),
(87, 1, '2019-04-26 11:27:41', '2019-04-26 09:27:41', '<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<!-- /wp:paragraph -->', 'Voyage en France', '', 'publish', 'open', 'closed', '', 'voyage-en-france', '', '', '2019-04-26 16:59:41', '2019-04-26 14:59:41', '', 0, 'http://localhost:8888/wordpress/?post_type=voyages&#038;p=87', 0, 'voyages', '', 0),
(88, 1, '2019-04-26 11:27:08', '2019-04-26 09:27:08', '', '250px-Flag_of_France.svg', '', 'inherit', 'open', 'closed', '', '250px-flag_of_france-svg', '', '', '2019-04-26 11:27:08', '2019-04-26 09:27:08', '', 87, 'http://localhost:8888/wordpress/wp-content/uploads/2019/04/250px-Flag_of_France.svg_.png', 0, 'attachment', 'image/png', 0),
(89, 1, '2019-04-26 11:28:16', '2019-04-26 09:28:16', '<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<!-- /wp:paragraph -->', 'Voyage en Italie', '', 'publish', 'open', 'closed', '', 'voyage-en-italie', '', '', '2019-04-26 16:59:15', '2019-04-26 14:59:15', '', 0, 'http://localhost:8888/wordpress/?post_type=voyages&#038;p=89', 0, 'voyages', '', 0),
(90, 1, '2019-04-26 11:28:06', '2019-04-26 09:28:06', '', 'it', '', 'inherit', 'open', 'closed', '', 'it', '', '', '2019-04-26 11:28:06', '2019-04-26 09:28:06', '', 89, 'http://localhost:8888/wordpress/wp-content/uploads/2019/04/it.png', 0, 'attachment', 'image/png', 0),
(91, 1, '2019-04-26 11:28:51', '2019-04-26 09:28:51', '<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<!-- /wp:paragraph -->', 'Voyage en Espagne', '', 'publish', 'open', 'closed', '', 'voyage-en-espagne', '', '', '2019-04-26 16:59:00', '2019-04-26 14:59:00', '', 0, 'http://localhost:8888/wordpress/?post_type=voyages&#038;p=91', 0, 'voyages', '', 0),
(92, 1, '2019-04-26 11:28:46', '2019-04-26 09:28:46', '', '210uaqEmyZL', '', 'inherit', 'open', 'closed', '', '210uaqemyzl', '', '', '2019-04-26 11:28:46', '2019-04-26 09:28:46', '', 91, 'http://localhost:8888/wordpress/wp-content/uploads/2019/04/210uaqEmyZL.jpg', 0, 'attachment', 'image/jpeg', 0),
(93, 1, '2019-04-26 11:43:58', '2019-04-26 09:43:58', '', 'Mes voyages', '', 'publish', 'closed', 'closed', '', 'mes-voyages', '', '', '2019-05-02 21:32:09', '2019-05-02 19:32:09', '', 0, 'http://localhost:8888/wordpress/?page_id=93', 0, 'page', '', 0),
(94, 1, '2019-04-26 11:43:58', '2019-04-26 09:43:58', '', 'Mes voyages', '', 'inherit', 'closed', 'closed', '', '93-revision-v1', '', '', '2019-04-26 11:43:58', '2019-04-26 09:43:58', '', 93, 'http://localhost:8888/wordpress/2019/04/26/93-revision-v1/', 0, 'revision', '', 0),
(95, 1, '2019-04-26 12:08:35', '2019-04-26 10:08:35', '<!-- wp:paragraph -->\n<p>coucou</p>\n<!-- /wp:paragraph -->', 'Mes voyages', '', 'inherit', 'closed', 'closed', '', '93-revision-v1', '', '', '2019-04-26 12:08:35', '2019-04-26 10:08:35', '', 93, 'http://localhost:8888/wordpress/2019/04/26/93-revision-v1/', 0, 'revision', '', 0),
(97, 1, '2019-04-26 14:54:29', '2019-04-26 12:54:29', 'a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:7:\"voyages\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}', 'voyage info', 'voyage-info', 'publish', 'closed', 'closed', '', 'group_5cc2ff7f877f8', '', '', '2019-04-26 17:01:22', '2019-04-26 15:01:22', '', 0, 'http://localhost:8888/wordpress/?post_type=acf-field-group&#038;p=97', 0, 'acf-field-group', '', 0),
(98, 1, '2019-04-26 14:56:21', '2019-04-26 12:56:21', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:4:\"Prix\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'prix', 'prix', 'publish', 'closed', 'closed', '', 'field_5cc2ff8adf381', '', '', '2019-04-26 14:56:21', '2019-04-26 12:56:21', '', 97, 'http://localhost:8888/wordpress/?post_type=acf-field&p=98', 0, 'acf-field', '', 0),
(99, 1, '2019-04-26 14:56:21', '2019-04-26 12:56:21', 'a:12:{s:4:\"type\";s:6:\"number\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:3:\"min\";i:0;s:3:\"max\";i:10;s:4:\"step\";i:1;}', 'note', 'note', 'publish', 'closed', 'closed', '', 'field_5cc2ffcfdf382', '', '', '2019-04-26 14:56:21', '2019-04-26 12:56:21', '', 97, 'http://localhost:8888/wordpress/?post_type=acf-field&p=99', 1, 'acf-field', '', 0),
(103, 1, '2019-04-26 14:57:52', '2019-04-26 12:57:52', '<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<!-- /wp:paragraph -->', 'Voyage en Espagne', '', 'inherit', 'closed', 'closed', '', '91-revision-v1', '', '', '2019-04-26 14:57:52', '2019-04-26 12:57:52', '', 91, 'http://localhost:8888/wordpress/2019/04/26/91-revision-v1/', 0, 'revision', '', 0),
(104, 1, '2019-04-26 14:57:53', '2019-04-26 12:57:53', '<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<!-- /wp:paragraph -->', 'Voyage en Espagne', '', 'inherit', 'closed', 'closed', '', '91-revision-v1', '', '', '2019-04-26 14:57:53', '2019-04-26 12:57:53', '', 91, 'http://localhost:8888/wordpress/2019/04/26/91-revision-v1/', 0, 'revision', '', 0),
(105, 1, '2019-04-26 14:57:53', '2019-04-26 12:57:53', '<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<!-- /wp:paragraph -->', 'Voyage en Espagne', '', 'inherit', 'closed', 'closed', '', '91-revision-v1', '', '', '2019-04-26 14:57:53', '2019-04-26 12:57:53', '', 91, 'http://localhost:8888/wordpress/2019/04/26/91-revision-v1/', 0, 'revision', '', 0),
(106, 1, '2019-04-26 14:58:21', '2019-04-26 12:58:21', '<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<!-- /wp:paragraph -->', 'Voyage en Italie', '', 'inherit', 'closed', 'closed', '', '89-revision-v1', '', '', '2019-04-26 14:58:21', '2019-04-26 12:58:21', '', 89, 'http://localhost:8888/wordpress/2019/04/26/89-revision-v1/', 0, 'revision', '', 0),
(107, 1, '2019-04-26 14:58:22', '2019-04-26 12:58:22', '<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<!-- /wp:paragraph -->', 'Voyage en Italie', '', 'inherit', 'closed', 'closed', '', '89-revision-v1', '', '', '2019-04-26 14:58:22', '2019-04-26 12:58:22', '', 89, 'http://localhost:8888/wordpress/2019/04/26/89-revision-v1/', 0, 'revision', '', 0),
(108, 1, '2019-04-26 14:58:22', '2019-04-26 12:58:22', '<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<!-- /wp:paragraph -->', 'Voyage en Italie', '', 'inherit', 'closed', 'closed', '', '89-revision-v1', '', '', '2019-04-26 14:58:22', '2019-04-26 12:58:22', '', 89, 'http://localhost:8888/wordpress/2019/04/26/89-revision-v1/', 0, 'revision', '', 0),
(109, 1, '2019-04-26 14:58:42', '2019-04-26 12:58:42', '<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<!-- /wp:paragraph -->', 'Voyage en France', '', 'inherit', 'closed', 'closed', '', '87-revision-v1', '', '', '2019-04-26 14:58:42', '2019-04-26 12:58:42', '', 87, 'http://localhost:8888/wordpress/2019/04/26/87-revision-v1/', 0, 'revision', '', 0),
(110, 1, '2019-04-26 14:58:42', '2019-04-26 12:58:42', '<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<!-- /wp:paragraph -->', 'Voyage en France', '', 'inherit', 'closed', 'closed', '', '87-revision-v1', '', '', '2019-04-26 14:58:42', '2019-04-26 12:58:42', '', 87, 'http://localhost:8888/wordpress/2019/04/26/87-revision-v1/', 0, 'revision', '', 0),
(111, 1, '2019-04-26 14:58:42', '2019-04-26 12:58:42', '<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n<!-- /wp:paragraph -->', 'Voyage en France', '', 'inherit', 'closed', 'closed', '', '87-revision-v1', '', '', '2019-04-26 14:58:42', '2019-04-26 12:58:42', '', 87, 'http://localhost:8888/wordpress/2019/04/26/87-revision-v1/', 0, 'revision', '', 0),
(113, 1, '2019-04-26 16:33:13', '2019-04-26 14:33:13', '', '260px-Tour_Eiffel_Wikimedia_Commons', '', 'inherit', 'open', 'closed', '', '260px-tour_eiffel_wikimedia_commons', '', '', '2019-04-26 16:33:13', '2019-04-26 14:33:13', '', 0, 'http://localhost:8888/wordpress/wp-content/uploads/2019/04/260px-Tour_Eiffel_Wikimedia_Commons.jpg', 0, 'attachment', 'image/jpeg', 0),
(114, 1, '2019-04-26 16:33:14', '2019-04-26 14:33:14', '', '1200px-Colosseum_in_Rome-April_2007-1-_copie_2B', '', 'inherit', 'open', 'closed', '', '1200px-colosseum_in_rome-april_2007-1-_copie_2b', '', '', '2019-04-26 16:33:14', '2019-04-26 14:33:14', '', 0, 'http://localhost:8888/wordpress/wp-content/uploads/2019/04/1200px-Colosseum_in_Rome-April_2007-1-_copie_2B.jpg', 0, 'attachment', 'image/jpeg', 0),
(115, 1, '2019-04-26 16:33:15', '2019-04-26 14:33:15', '', 'Puerta de Alcala', 'Puerta de Alcala - famous Spanish monument at Independence Square, Madrid, Spain', 'inherit', 'open', 'closed', '', 'puerta-de-alcala', '', '', '2019-04-26 16:35:25', '2019-04-26 14:35:25', '', 0, 'http://localhost:8888/wordpress/wp-content/uploads/2019/04/25090502-puerta-de-alcala-célèbre-monument-espagnol-à-place-de-l-indépendance-madrid-espagne.jpg', 0, 'attachment', 'image/jpeg', 0),
(116, 1, '2019-04-26 16:33:16', '2019-04-26 14:33:16', '', 'arc-de-triomphe-1024x576', '', 'inherit', 'open', 'closed', '', 'arc-de-triomphe-1024x576', '', '', '2019-04-26 16:35:41', '2019-04-26 14:35:41', '', 0, 'http://localhost:8888/wordpress/wp-content/uploads/2019/04/arc-de-triomphe-1024x576.jpg', 0, 'attachment', 'image/jpeg', 0),
(117, 1, '2019-04-26 16:33:16', '2019-04-26 14:33:16', '', 'Top-10-des-plus-beaux-monuments-d’Espagne', '', 'inherit', 'open', 'closed', '', 'top-10-des-plus-beaux-monuments-despagne', '', '', '2019-04-26 16:34:34', '2019-04-26 14:34:34', '', 0, 'http://localhost:8888/wordpress/wp-content/uploads/2019/04/Top-10-des-plus-beaux-monuments-d’Espagne.jpg', 0, 'attachment', 'image/jpeg', 0),
(118, 1, '2019-04-26 16:33:58', '2019-04-26 14:33:58', '', '220px-Tour_de_Pise-2017', '', 'inherit', 'open', 'closed', '', '220px-tour_de_pise-2017', '', '', '2019-04-26 16:35:03', '2019-04-26 14:35:03', '', 0, 'http://localhost:8888/wordpress/wp-content/uploads/2019/04/220px-Tour_de_Pise-2017.jpg', 0, 'attachment', 'image/jpeg', 0),
(119, 1, '2019-04-26 16:56:08', '2019-04-26 14:56:08', 'a:10:{s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"collapsed\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:6:\"layout\";s:5:\"table\";s:12:\"button_label\";s:0:\"\";}', 'img v', 'img_v', 'publish', 'closed', 'closed', '', 'field_5cc31bf8e8cbe', '', '', '2019-04-26 17:01:22', '2019-04-26 15:01:22', '', 97, 'http://localhost:8888/wordpress/?post_type=acf-field&#038;p=119', 2, 'acf-field', '', 0),
(120, 1, '2019-04-26 16:56:32', '2019-04-26 14:56:32', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:5:\"array\";s:12:\"preview_size\";s:9:\"thumbnail\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'image v', 'image_v', 'publish', 'closed', 'closed', '', 'field_5cc31c0ea08c9', '', '', '2019-04-26 17:01:22', '2019-04-26 15:01:22', '', 119, 'http://localhost:8888/wordpress/?post_type=acf-field&#038;p=120', 0, 'acf-field', '', 0),
(122, 1, '2019-05-02 21:32:09', '2019-05-02 19:32:09', '', 'Mes voyages', '', 'inherit', 'closed', 'closed', '', '93-revision-v1', '', '', '2019-05-02 21:32:09', '2019-05-02 19:32:09', '', 93, 'http://localhost:8888/wordpress/2019/05/02/93-revision-v1/', 0, 'revision', '', 0),
(123, 1, '2019-05-02 21:34:35', '2019-05-02 19:34:35', '<!-- wp:image {\"id\":117} -->\n<figure class=\"wp-block-image\"><img src=\"http://localhost:8888/wordpress/wp-content/uploads/2019/04/Top-10-des-plus-beaux-monuments-d’Espagne-1024x681.jpg\" alt=\"\" class=\"wp-image-117\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p> un nouvel article un nouvel article un nouvel article un nouvel article un nouvel article un nouvel articleun nouvel article un nouvel articleun nouvel article un nouvel article un nouvel article un nouvel article un nouvel article un nouvel article un nouvel article un nouvel article un nouvel article un nouvel article </p>\n<!-- /wp:paragraph -->', 'Coucou', '', 'publish', 'open', 'open', '', 'coucou', '', '', '2019-05-02 21:35:16', '2019-05-02 19:35:16', '', 0, 'http://localhost:8888/wordpress/?p=123', 0, 'post', '', 0),
(124, 1, '2019-05-02 21:34:35', '2019-05-02 19:34:35', '<!-- wp:paragraph -->\n<p> un nouvel article un nouvel article un nouvel article un nouvel article un nouvel article un nouvel articleun nouvel article un nouvel articleun nouvel article un nouvel article un nouvel article un nouvel article un nouvel article un nouvel article un nouvel article un nouvel article un nouvel article un nouvel article </p>\n<!-- /wp:paragraph -->', 'Coucou', '', 'inherit', 'closed', 'closed', '', '123-revision-v1', '', '', '2019-05-02 21:34:35', '2019-05-02 19:34:35', '', 123, 'http://localhost:8888/wordpress/2019/05/02/123-revision-v1/', 0, 'revision', '', 0),
(125, 1, '2019-05-02 21:35:16', '2019-05-02 19:35:16', '<!-- wp:image {\"id\":117} -->\n<figure class=\"wp-block-image\"><img src=\"http://localhost:8888/wordpress/wp-content/uploads/2019/04/Top-10-des-plus-beaux-monuments-d’Espagne-1024x681.jpg\" alt=\"\" class=\"wp-image-117\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p> un nouvel article un nouvel article un nouvel article un nouvel article un nouvel article un nouvel articleun nouvel article un nouvel articleun nouvel article un nouvel article un nouvel article un nouvel article un nouvel article un nouvel article un nouvel article un nouvel article un nouvel article un nouvel article </p>\n<!-- /wp:paragraph -->', 'Coucou', '', 'inherit', 'closed', 'closed', '', '123-revision-v1', '', '', '2019-05-02 21:35:16', '2019-05-02 19:35:16', '', 123, 'http://localhost:8888/wordpress/2019/05/02/123-revision-v1/', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `dwwm19_termmeta`
--

CREATE TABLE `dwwm19_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `dwwm19_termmeta`
--

INSERT INTO `dwwm19_termmeta` (`meta_id`, `term_id`, `meta_key`, `meta_value`) VALUES
(1, 2, 'cat_img', '18'),
(2, 2, '_cat_img', 'field_5cc19ab070a5a'),
(3, 3, 'cat_img', '25'),
(4, 3, '_cat_img', 'field_5cc19ab070a5a'),
(5, 2, 'titre_bas', 'Ah mais ouais'),
(6, 2, '_titre_bas', 'field_5cc186ebf8d0a'),
(7, 2, 'para_bas', 'Ah bah super'),
(8, 2, '_para_bas', 'field_5cc1879c4f068'),
(9, 2, 'link_bas', '20'),
(10, 2, '_link_bas', 'field_5cc1a506d3d29');

-- --------------------------------------------------------

--
-- Table structure for table `dwwm19_terms`
--

CREATE TABLE `dwwm19_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `dwwm19_terms`
--

INSERT INTO `dwwm19_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Non classé', 'non-classe', 0),
(2, 'Fruits', 'fruits', 0),
(3, 'Légumes', 'legumes', 0),
(4, 'principal', 'principal', 0),
(5, 'social', 'social', 0);

-- --------------------------------------------------------

--
-- Table structure for table `dwwm19_term_relationships`
--

CREATE TABLE `dwwm19_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `dwwm19_term_relationships`
--

INSERT INTO `dwwm19_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(13, 2, 0),
(17, 2, 0),
(20, 2, 0),
(23, 3, 0),
(39, 4, 0),
(46, 5, 0),
(48, 5, 0),
(49, 5, 0),
(50, 5, 0),
(51, 5, 0),
(79, 4, 0),
(81, 4, 0),
(123, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `dwwm19_term_taxonomy`
--

CREATE TABLE `dwwm19_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `dwwm19_term_taxonomy`
--

INSERT INTO `dwwm19_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'category', 'c\'est les fruits', 0, 3),
(3, 3, 'category', 'c\'est les légumes', 0, 2),
(4, 4, 'nav_menu', '', 0, 3),
(5, 5, 'nav_menu', '', 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `dwwm19_usermeta`
--

CREATE TABLE `dwwm19_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `dwwm19_usermeta`
--

INSERT INTO `dwwm19_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'theo'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'false'),
(11, 1, 'locale', ''),
(12, 1, 'dwwm19_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'dwwm19_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'wp496_privacy'),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:1:{s:64:\"4b5f29e3c29bfcdbdee62286367e6484610ee80eca62613b2692a258fb2cbabc\";a:4:{s:10:\"expiration\";i:1556998131;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:82:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:66.0) Gecko/20100101 Firefox/66.0\";s:5:\"login\";i:1556825331;}}'),
(17, 1, 'dwwm19_dashboard_quick_press_last_post_id', '121'),
(18, 1, 'dwwm19_user-settings', 'libraryContent=browse'),
(19, 1, 'dwwm19_user-settings-time', '1556029506'),
(20, 1, 'managenav-menuscolumnshidden', 'a:4:{i:0;s:11:\"link-target\";i:1;s:15:\"title-attribute\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";}'),
(21, 1, 'metaboxhidden_nav-menus', 'a:1:{i:0;s:12:\"add-post_tag\";}'),
(22, 1, 'nav_menu_recently_edited', '4'),
(23, 1, 'closedpostboxes_page', 'a:1:{i:0;s:23:\"acf-group_5cc19aa64c781\";}'),
(24, 1, 'metaboxhidden_page', 'a:0:{}');

-- --------------------------------------------------------

--
-- Table structure for table `dwwm19_users`
--

CREATE TABLE `dwwm19_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `dwwm19_users`
--

INSERT INTO `dwwm19_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'theo', '$P$B9DeangZ7MWAOOAt4GqPw0r2mwgeF60', 'theo', 'locastro.theo@gmail.com', '', '2019-04-23 07:34:58', '1572878752:$P$B6PQjT08aqnMrY.66Fh3IivjmhkjQk1', 0, 'theo');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dwwm19_commentmeta`
--
ALTER TABLE `dwwm19_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `dwwm19_comments`
--
ALTER TABLE `dwwm19_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `dwwm19_links`
--
ALTER TABLE `dwwm19_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `dwwm19_options`
--
ALTER TABLE `dwwm19_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `dwwm19_postmeta`
--
ALTER TABLE `dwwm19_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `dwwm19_posts`
--
ALTER TABLE `dwwm19_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `dwwm19_termmeta`
--
ALTER TABLE `dwwm19_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `dwwm19_terms`
--
ALTER TABLE `dwwm19_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `dwwm19_term_relationships`
--
ALTER TABLE `dwwm19_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `dwwm19_term_taxonomy`
--
ALTER TABLE `dwwm19_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `dwwm19_usermeta`
--
ALTER TABLE `dwwm19_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `dwwm19_users`
--
ALTER TABLE `dwwm19_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dwwm19_commentmeta`
--
ALTER TABLE `dwwm19_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dwwm19_comments`
--
ALTER TABLE `dwwm19_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dwwm19_links`
--
ALTER TABLE `dwwm19_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dwwm19_options`
--
ALTER TABLE `dwwm19_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=386;

--
-- AUTO_INCREMENT for table `dwwm19_postmeta`
--
ALTER TABLE `dwwm19_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=447;

--
-- AUTO_INCREMENT for table `dwwm19_posts`
--
ALTER TABLE `dwwm19_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `dwwm19_termmeta`
--
ALTER TABLE `dwwm19_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `dwwm19_terms`
--
ALTER TABLE `dwwm19_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dwwm19_term_taxonomy`
--
ALTER TABLE `dwwm19_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dwwm19_usermeta`
--
ALTER TABLE `dwwm19_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `dwwm19_users`
--
ALTER TABLE `dwwm19_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
