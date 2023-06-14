-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 14 juin 2023 à 11:56
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

CREATE DATABASE IF NOT EXISTS `projet_forum` DEFAULT CHARACTER SET latin1 COLLATE latin1_bin;
USE `projet_forum`;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet_forum`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `ID_categorie` int NOT NULL,
  `nom` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`ID_categorie`),
  UNIQUE KEY `nom` (`nom`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`ID_categorie`, `nom`, `description`) VALUES
(1, 'Jeux vidéos', 'Catégorie dédiée aux jeux vidéos'),
(2, 'Informatique', 'Catégorie dédiée à l\'informatique'),
(3, 'Sport', 'Catégorie dédiée aux sports'),
(4, 'Cuisine', 'Catégorie dédiée à la cuisine'),
(5, 'Musique', 'Catégorie dédiée à la musique');

-- --------------------------------------------------------

--
-- Structure de la table `interragir`
--

DROP TABLE IF EXISTS `interragir`;
CREATE TABLE IF NOT EXISTS `interragir` (
  `ID_user` bigint NOT NULL,
  `ID_topic` int NOT NULL,
  PRIMARY KEY (`ID_user`,`ID_topic`),
  KEY `ID_topic` (`ID_topic`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `ID_message` int NOT NULL AUTO_INCREMENT,
  `contenu` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `created_date` datetime NOT NULL,
  `update_at` datetime DEFAULT NULL,
  `joined_file` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `statut` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `ID_user` bigint NOT NULL,
  `ID_topic` int NOT NULL,
  PRIMARY KEY (`ID_message`),
  KEY `ID_user` (`ID_user`),
  KEY `ID_topic` (`ID_topic`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Déchargement des données de la table `message`
--

INSERT INTO `message` (`ID_message`, `contenu`, `created_date`, `update_at`, `joined_file`, `statut`, `ID_user`, `ID_topic`) VALUES
(1, 'Salut les amis ! Qui est fan de FIFA 22 ?', '2023-05-31 15:27:20', '0000-00-00 00:00:00', NULL, 'en ligne', 1, 1),
(2, 'Moi ! J\'adore ce jeu, les graphismes sont incroyables !', '2023-05-31 15:27:20', '0000-00-00 00:00:00', NULL, 'en ligne', 2, 1),
(3, 'Je suis aussi un grand fan de FIFA 22. Les animations sont très réalistes.', '2023-05-31 15:27:20', '0000-00-00 00:00:00', NULL, 'en ligne', 3, 1),
(4, 'Quel est votre équipe préférée dans le jeu ?', '2023-05-31 15:27:20', '0000-00-00 00:00:00', NULL, 'en ligne', 4, 1),
(5, 'Je suis un grand fan du Real Madrid. Et vous ?', '2023-05-31 15:27:20', '0000-00-00 00:00:00', NULL, 'en ligne', 5, 1),
(6, 'Moi, c\'est le FC Barcelone !', '2023-05-31 15:27:20', '0000-00-00 00:00:00', NULL, 'en ligne', 6, 1),
(7, 'Je préfère jouer avec l\'équipe nationale du Brésil.', '2023-05-31 15:27:20', '0000-00-00 00:00:00', NULL, 'en ligne', 7, 1),
(8, 'FIFA 22 est vraiment addictif. J\'y joue tous les jours !', '2023-05-31 15:27:20', '0000-00-00 00:00:00', NULL, 'en ligne', 8, 1),
(9, 'Est ce qu\'il y aurait quelqu\'un pour m\'aider a comprendre comment fonctionne les différents héros ?', '2023-05-31 16:26:07', '0000-00-00 00:00:00', NULL, 'en ligne', 24, 2),
(10, 'Bonjour à tous ! J\'ai un problème avec mon code Python. Est-ce que quelqu\'un peut m\'aider ?', '2023-05-31 16:55:38', '0000-00-00 00:00:00', NULL, 'en ligne', 1, 3),
(11, 'Bien sûr, je serais ravi de t\'aider. Peux-tu expliquer quel est ton problème ?', '2023-05-31 16:55:38', '0000-00-00 00:00:00', NULL, 'en ligne', 2, 3),
(12, 'J\'ai du mal à comprendre pourquoi mon programme renvoie une erreur de syntaxe. Voici mon code :```\r\nmessage = \'Bonjour, je suis un message\'\r\nprint(message\r\n```', '2023-05-31 16:55:38', '0000-00-00 00:00:00', NULL, 'en ligne', 1, 10),
(13, 'Peux-tu partager ton code pour que nous puissions le voir et t\'aider ?', '2023-05-31 16:55:38', '0000-00-00 00:00:00', NULL, 'en ligne', 3, 3),
(14, 'Voici mon code :', '2023-05-31 16:55:38', '0000-00-00 00:00:00', NULL, 'en ligne', 1, 3),
(15, 'Il semble que tu aies oublié une parenthèse fermante à la fin de la ligne 10.', '2023-05-31 16:55:38', '0000-00-00 00:00:00', NULL, 'en ligne', 4, 3),
(16, 'Effectivement, c\'était une erreur de syntaxe simple. Merci pour ton aide !', '2023-05-31 16:55:38', '0000-00-00 00:00:00', NULL, 'en ligne', 1, 3),
(17, 'Pas de problème, je suis content de t\'avoir aidé ! As-tu d\'autres questions ?', '2023-05-31 16:55:38', '0000-00-00 00:00:00', NULL, 'en ligne', 4, 3),
(18, 'Oui, j\'ai une autre question concernant les boucles while en Python.', '2023-05-31 16:55:38', '0000-00-00 00:00:00', NULL, 'en ligne', 1, 3),
(19, 'Je suis là pour t\'aider. Quelle est ta question sur les boucles while ?', '2023-05-31 16:55:38', '0000-00-00 00:00:00', NULL, 'en ligne', 3, 3),
(20, 'Salut tout le monde ! J\'ai besoin d\'aide pour comprendre les technologies de développement web. Est-ce que quelqu\'un peut m\'expliquer ?', '2023-05-31 17:00:40', '0000-00-00 00:00:00', NULL, 'en ligne', 1, 4),
(21, 'Bien sûr, je suis là pour t\'aider. Quels aspects des technologies de développement web te posent problème ?', '2023-05-31 17:00:40', '0000-00-00 00:00:00', NULL, 'en ligne', 2, 4),
(22, 'Je trouve difficile de comprendre la structure HTML et les sélecteurs CSS. Pouvez-vous m\'aider à les comprendre ?', '2023-05-31 17:00:40', '0000-00-00 00:00:00', NULL, 'en ligne', 1, 4),
(23, 'Bien sûr, commençons par la structure HTML. Elle est composée de balises qui définissent la structure et le contenu de la page. Par exemple, <h1> est une balise pour les titres principaux.', '2023-05-31 17:00:40', '0000-00-00 00:00:00', NULL, 'en ligne', 3, 4),
(24, 'Merci pour l\'explication. Et qu\'en est-il des sélecteurs CSS ?', '2023-05-31 17:00:40', '0000-00-00 00:00:00', NULL, 'en ligne', 1, 4),
(25, 'Les sélecteurs CSS sont utilisés pour cibler des éléments HTML spécifiques et leur appliquer des styles. Par exemple, le sélecteur \'p\' cible tous les paragraphes.', '2023-05-31 17:00:40', '0000-00-00 00:00:00', NULL, 'en ligne', 2, 4),
(26, 'Compris. Y a-t-il des ressources que vous recommandez pour approfondir mes connaissances ?', '2023-05-31 17:00:40', '0000-00-00 00:00:00', NULL, 'en ligne', 1, 4),
(27, 'Absolument ! Il existe de nombreux tutoriels en ligne, des cours et des sites web spécialisés pour apprendre le développement web. Je peux te recommander quelques-uns si tu le souhaites.', '2023-05-31 17:00:40', '0000-00-00 00:00:00', NULL, 'en ligne', 3, 4),
(28, 'Oui, je suis intéressé ! Merci pour ton aide.', '2023-05-31 17:00:40', '0000-00-00 00:00:00', NULL, 'en ligne', 1, 4),
(29, 'Pas de problème. Voici quelques ressources pour commencer : W3Schools (https://www.w3schools.com), MDN Web Docs (https://developer.mozilla.org), et FreeCodeCamp (https://www.freecodecamp.org). Ils offrent des tutoriels, des exemples et des exercices pour ', '2023-05-31 17:00:40', '0000-00-00 00:00:00', NULL, 'en ligne', 3, 4),
(35, 'Salut tout le monde ! J\'aimerais discuter des matchs de football récents. Quels sont vos avis sur les performances des joueurs ?', '2023-05-31 14:30:00', NULL, NULL, 'en ligne', 26, 5),
(36, 'Je suis d\'accord, certains joueurs ont vraiment brillé. Quels joueurs vous ont impressionnés ?', '2023-05-31 14:35:00', NULL, NULL, 'en ligne', 27, 5),
(37, 'Pour ma part, j\'ai été impressionné par la performance de Cristiano Ronaldo lors du dernier match. Il a marqué un superbe but !', '2023-05-31 14:40:00', NULL, NULL, 'en ligne', 28, 5),
(38, 'Ah oui, Ronaldo est vraiment un joueur exceptionnel. Il a une capacité incroyable à marquer des buts importants.', '2023-05-31 14:45:00', NULL, NULL, 'en ligne', 29, 5),
(39, 'Et que pensez-vous de la jeune génération de joueurs ? Certains talents prometteurs se sont révélés récemment.', '2023-05-31 14:50:00', NULL, NULL, 'en ligne', 30, 5),
(40, 'Effectivement, il y a de jeunes joueurs qui montrent beaucoup de potentiel. Quels noms vous viennent à l\'esprit ?', '2023-05-31 14:55:00', NULL, NULL, 'en ligne', 31, 5),
(41, 'Pour ma part, j\'ai été impressionné par Kylian Mbappé. Il est rapide, talentueux et a un bel avenir devant lui.', '2023-05-31 15:00:00', NULL, NULL, 'en ligne', 32, 5),
(42, 'Mbappé est certainement un joueur à surveiller. Il a déjà réalisé de grandes performances malgré son jeune âge.', '2023-05-31 15:05:00', NULL, NULL, 'en ligne', 33, 5),
(43, 'Quels autres joueurs vous ont marqué récemment ? Partagez vos impressions !', '2023-05-31 15:10:00', NULL, NULL, 'en ligne', 34, 5),
(44, 'Personnellement, j\'ai été impressionné par la performance de Lionel Messi lors de la dernière rencontre. Il a montré une fois de plus pourquoi il est considéré comme l\'un des meilleurs joueurs de tous les temps.', '2023-05-31 15:15:00', NULL, NULL, 'en ligne', 35, 5),
(45, 'Bonjour à tous ! J\'aimerais discuter des recettes véganes et des astuces de cuisine. Avez-vous des idées à partager ?', '2023-05-31 14:30:00', NULL, NULL, 'en ligne', 26, 6),
(46, 'Bien sûr ! L\'une de mes astuces de cuisine végane préférées est d\'utiliser du lait d\'amande comme substitut du lait de vache dans les recettes.', '2023-05-31 14:35:00', NULL, NULL, 'en ligne', 27, 6),
(47, 'Je recommande également d\'utiliser de la levure nutritionnelle pour obtenir une saveur fromagère dans les plats véganes, comme les sauces ou les gratins.', '2023-05-31 14:40:00', NULL, NULL, 'en ligne', 28, 6),
(48, 'Pour les recettes sucrées, remplacer les œufs par de la compote de pommes est une excellente option végane.', '2023-05-31 14:45:00', NULL, NULL, 'en ligne', 29, 6),
(49, 'J\'ai entendu dire que le tofu est un ingrédient polyvalent en cuisine végane. Quelqu\'un a des conseils pour bien le cuisiner ?', '2023-05-31 14:50:00', NULL, NULL, 'en ligne', 30, 6),
(50, 'Le secret pour préparer un tofu savoureux est de le presser pour éliminer l\'excès d\'eau, puis de le mariner avec des épices avant de le cuire.', '2023-05-31 14:55:00', NULL, NULL, 'en ligne', 31, 6),
(51, 'Les lentilles sont également une excellente source de protéines végétales. Je les utilise souvent comme substitut de viande dans les plats.', '2023-05-31 15:00:00', NULL, NULL, 'en ligne', 32, 6),
(52, 'J\'ai récemment découvert la pâte à pizza végane à base de farine de pois chiches. C\'est incroyablement délicieux !', '2023-05-31 15:05:00', NULL, NULL, 'en ligne', 33, 6),
(53, 'Merci pour toutes ces astuces ! Je vais certainement les essayer dans ma cuisine végane.', '2023-05-31 15:10:00', NULL, NULL, 'en ligne', 34, 6),
(54, 'N\'hésitez pas à partager vos recettes véganes préférées ici. J\'adore découvrir de nouvelles idées culinaires !', '2023-05-31 15:15:00', NULL, NULL, 'en ligne', 35, 6),
(55, 'Salut tout le monde ! J\'aimerais discuter de recommandations musicales. Quels artistes ou groupes recommandez-vous ?', '2023-05-31 14:30:00', NULL, NULL, 'en ligne', 26, 7),
(56, 'Pour ma part, je suis fan de la musique indie. Je recommande vivement l\'artiste Billie Eilish. Ses chansons sont incroyables !', '2023-05-31 14:35:00', NULL, NULL, 'en ligne', 27, 7),
(57, 'Je suis d\'accord, Billie Eilish a un talent exceptionnel. J\'aime aussi beaucoup les chansons de Ed Sheeran. Il a une voix magnifique !', '2023-05-31 14:40:00', NULL, NULL, 'en ligne', 28, 7),
(58, 'Et que pensez-vous de la scène musicale alternative ? Y a-t-il des groupes que vous recommandez ?', '2023-05-31 14:45:00', NULL, NULL, 'en ligne', 29, 7),
(59, 'Personnellement, j\'adore le groupe Arctic Monkeys. Leur style unique et leurs paroles captivantes en font des artistes incontournables.', '2023-05-31 14:50:00', NULL, NULL, 'en ligne', 30, 7),
(60, 'Arctic Monkeys est en effet un groupe incroyable. J\'ajouterais également Tame Impala à la liste. Leurs mélodies psychédéliques sont tout simplement géniales !', '2023-05-31 14:55:00', NULL, NULL, 'en ligne', 31, 7),
(61, 'Merci pour vos recommandations ! Je vais certainement écouter ces artistes. Avez-vous d\'autres suggestions ?', '2023-05-31 15:00:00', NULL, NULL, 'en ligne', 32, 7),
(62, 'Si vous aimez la musique pop, je vous recommande Dua Lipa. Ses chansons sont entraînantes et pleines d\'énergie !', '2023-05-31 15:05:00', NULL, NULL, 'en ligne', 33, 7),
(63, 'J\'adore Dua Lipa ! Elle a une voix incroyable et ses performances sur scène sont toujours impressionnantes.', '2023-05-31 15:10:00', NULL, NULL, 'en ligne', 34, 7),
(64, 'N\'oublions pas Taylor Swift ! Elle est une artiste talentueuse avec des chansons profondes et émotionnelles.', '2023-05-31 15:15:00', NULL, NULL, 'en ligne', 35, 7),
(65, 'Salut tout le monde ! J\'aimerais discuter des PC de jeu. Quels sont les composants matériels que vous recommandez ?', '2023-05-31 14:30:00', NULL, NULL, 'en ligne', 26, 8),
(66, 'Pour commencer, je recommande d\'avoir un processeur puissant pour une expérience de jeu fluide. Les modèles de la série Intel Core i7 ou AMD Ryzen 7 sont d\'excellents choix.', '2023-05-31 14:35:00', NULL, NULL, 'en ligne', 27, 8),
(67, 'Je suis d\'accord, un bon processeur est essentiel. En ce qui concerne la carte graphique, je recommande les modèles Nvidia GeForce RTX série 30 pour des graphismes de haute qualité.', '2023-05-31 14:40:00', NULL, NULL, 'en ligne', 28, 8),
(68, 'Et pour la mémoire RAM, il est préférable d\'avoir au moins 16 Go pour exécuter les jeux les plus récents sans problème de performances.', '2023-05-31 14:45:00', NULL, NULL, 'en ligne', 29, 8),
(69, 'Qu\'en est-il du stockage ? Je recommande d\'avoir un SSD (Solid State Drive) pour des temps de chargement rapides et un disque dur supplémentaire pour le stockage de données.', '2023-05-31 14:50:00', NULL, NULL, 'en ligne', 30, 8),
(70, 'Je suis d\'accord, un SSD améliore considérablement les temps de chargement des jeux. Pour l\'alimentation, il est important de choisir une unité avec une puissance suffisante pour prendre en charge tous les composants.', '2023-05-31 14:55:00', NULL, NULL, 'en ligne', 31, 8),
(71, 'Et n\'oublions pas le refroidissement ! Il est essentiel d\'avoir un bon système de refroidissement, comme un dissipateur thermique ou un système de refroidissement liquide, pour éviter la surchauffe du PC pendant les sessions de jeu intenses.', '2023-05-31 15:00:00', NULL, NULL, 'en ligne', 32, 8),
(72, 'Tout à fait, un bon système de refroidissement est crucial pour maintenir les températures sous contrôle. Avez-vous des marques préférées pour ces composants ?', '2023-05-31 15:05:00', NULL, NULL, 'en ligne', 33, 8),
(73, 'Personnellement, j\'aime bien les produits de marques telles que Intel, Nvidia, Corsair et ASUS. Ils offrent généralement une bonne qualité et des performances fiables.', '2023-05-31 15:10:00', NULL, NULL, 'en ligne', 34, 8),
(74, 'Je suis d\'accord, ces marques ont une bonne réputation dans l\'industrie des PC de jeu. Avez-vous d\'autres conseils ou recommandations à partager ?', '2023-05-31 15:15:00', NULL, NULL, 'en ligne', 35, 8),
(75, 'Salut à tous ! Qui est votre joueur préféré en NBA ? J\'aimerais connaître vos opinions.', '2023-05-31 14:30:00', NULL, NULL, 'en ligne', 26, 9),
(76, 'Pour ma part, je suis un grand fan de LeBron James. Son jeu complet et son impact sur le terrain sont incroyables.', '2023-05-31 14:35:00', NULL, NULL, 'en ligne', 27, 9),
(77, 'Je suis d\'accord, LeBron James est un joueur exceptionnel. Pour ma part, j\'admire la précision de Stephen Curry à trois points.', '2023-05-31 14:40:00', NULL, NULL, 'en ligne', 28, 9),
(78, 'Curry est un tireur incroyable, c\'est vrai. Qu\'en est-il de Kevin Durant ? Sa taille combinée à ses compétences en font un joueur redoutable.', '2023-05-31 14:45:00', NULL, NULL, 'en ligne', 29, 9),
(79, 'Absolument, Durant est un joueur polyvalent avec une envergure impressionnante. Et que pensez-vous de Giannis Antetokounmpo et ses exploits athlétiques ?', '2023-05-31 14:50:00', NULL, NULL, 'en ligne', 30, 9),
(80, 'Giannis est un monstre athlétique. Sa capacité à pénétrer et à défendre en fait l\'un des meilleurs joueurs actuels de la NBA.', '2023-05-31 14:55:00', NULL, NULL, 'en ligne', 31, 9),
(81, 'Je suis d\'accord, Giannis est une force de la nature. Et que dire de Kawhi Leonard et sa défense étouffante ?', '2023-05-31 15:00:00', NULL, NULL, 'en ligne', 32, 9),
(82, 'Kawhi Leonard est un véritable spécialiste de la défense. Son intensité et sa capacité à voler des ballons sont remarquables.', '2023-05-31 15:05:00', NULL, NULL, 'en ligne', 33, 9),
(83, 'Parmi les joueurs actuels, qui pourriez-vous considérer comme le plus dominant ?', '2023-05-31 15:10:00', NULL, NULL, 'en ligne', 34, 9),
(84, 'Difficile de choisir, mais je dirais que Giannis Antetokounmpo et Nikola Jokic sont parmi les plus dominants de la ligue en raison de leurs performances régulières et de leur impact sur les matchs.', '2023-05-31 15:15:00', NULL, NULL, 'en ligne', 35, 9),
(85, 'Bonjour à tous ! Je suis nouveau dans le domaine de l\'apprentissage automatique et j\'aimerais en savoir plus sur les différentes techniques.', '2023-05-31 14:30:00', NULL, NULL, 'en ligne', 10, 10),
(86, 'Bienvenue ! L\'apprentissage automatique est un domaine passionnant. Quelles techniques spécifiques souhaitez-vous explorer ?', '2023-05-31 14:35:00', NULL, NULL, 'en ligne', 11, 10),
(87, 'Il existe de nombreuses techniques en apprentissage automatique, notamment la régression linéaire, les arbres de décision, les réseaux neuronaux, etc.', '2023-05-31 14:40:00', NULL, NULL, 'en ligne', 12, 10),
(88, 'Je recommande de commencer par la régression linéaire, qui est une technique simple mais puissante pour modéliser des relations linéaires entre les variables.', '2023-05-31 14:45:00', NULL, NULL, 'en ligne', 13, 10),
(89, 'Ensuite, vous pouvez explorer les arbres de décision, qui permettent de prendre des décisions basées sur des règles conditionnelles.', '2023-05-31 14:50:00', NULL, NULL, 'en ligne', 14, 10),
(90, 'Les réseaux neuronaux sont également très populaires en apprentissage automatique, en particulier dans le domaine de l\'apprentissage en profondeur.', '2023-05-31 14:55:00', NULL, NULL, 'en ligne', 15, 10),
(91, 'Pour les applications d\'apprentissage automatique, il y a de nombreux domaines où ces techniques peuvent être utilisées, tels que la reconnaissance d\'images, la traduction automatique, la prédiction de demandes, etc.', '2023-05-31 15:00:00', NULL, NULL, 'en ligne', 16, 10),
(92, 'Je suis d\'accord. L\'apprentissage automatique a des applications variées et peut être utilisé pour résoudre des problèmes dans de nombreux domaines.', '2023-05-31 15:05:00', NULL, NULL, 'en ligne', 17, 10),
(93, 'N\'hésitez pas à poser des questions spécifiques sur les techniques ou les applications qui vous intéressent, nous sommes là pour vous aider !', '2023-05-31 15:10:00', NULL, NULL, 'en ligne', 18, 10),
(94, 'Merci beaucoup ! Je vais explorer davantage ces techniques et je reviendrai vers vous si j\'ai des questions.', '2023-05-31 15:15:00', NULL, NULL, 'en ligne', 19, 10),
(95, 'Salut à tous les guitaristes ! J\'aimerais améliorer mes techniques de jeu à la guitare. Avez-vous des conseils ou des leçons à recommander ?', '2023-05-31 14:30:00', NULL, NULL, 'en ligne', 10, 11),
(96, 'Salut ! Je te recommande de travailler sur les accords de base et les transitions entre eux. Cela te permettra de jouer de nombreuses chansons.', '2023-05-31 14:35:00', NULL, NULL, 'en ligne', 11, 11),
(97, 'Effectivement, les accords de base sont essentiels. Je te suggère également de pratiquer les techniques de picking et de strumming pour améliorer ton rythme.', '2023-05-31 14:40:00', NULL, NULL, 'en ligne', 12, 11),
(98, 'Pour progresser, je te conseille de suivre des leçons en ligne ou de prendre des cours particuliers avec un professeur de guitare expérimenté.', '2023-05-31 14:45:00', NULL, NULL, 'en ligne', 13, 11),
(99, 'Il existe de nombreuses ressources en ligne, comme des tutoriels vidéo ou des sites spécialisés, qui proposent des leçons pour tous les niveaux.', '2023-05-31 14:50:00', NULL, NULL, 'en ligne', 14, 11),
(100, 'N\'hésite pas à explorer différentes techniques de jeu, comme le fingerpicking, les bends, les hammer-ons et les pull-offs. Cela ajoutera de la variété à ton jeu.', '2023-05-31 14:55:00', NULL, NULL, 'en ligne', 15, 11),
(101, 'Je suis d\'accord avec les conseils précédents. Il est important de pratiquer régulièrement et de rester motivé. La patience est la clé de la progression à la guitare.', '2023-05-31 15:00:00', NULL, NULL, 'en ligne', 16, 11),
(102, 'Si tu as des questions spécifiques sur des techniques ou des difficultés rencontrées, n\'hésite pas à les partager. Nous sommes là pour t\'aider !', '2023-05-31 15:05:00', NULL, NULL, 'en ligne', 17, 11),
(103, 'Merci à tous pour vos conseils ! Je vais les mettre en pratique et continuer à travailler. Si j\'ai besoin d\'aide supplémentaire, je reviendrai vers vous.', '2023-05-31 15:10:00', NULL, NULL, 'en ligne', 18, 11),
(104, 'Bon courage dans ta progression à la guitare ! N\'hésite pas à partager tes progrès avec nous. Jouer de la guitare est une aventure passionnante.', '2023-05-31 15:15:00', NULL, NULL, 'en ligne', 19, 11),
(105, 'Salut à tous les gamers ! Quels sont vos jeux mobiles préférés en ce moment ? J\'aimerais découvrir de nouveaux jeux populaires.', '2023-05-31 14:30:00', NULL, NULL, 'en ligne', 10, 12),
(106, 'Salut ! En ce moment, je suis accro à Among Us. C\'est un jeu de société en ligne où il faut démasquer les imposteurs.', '2023-05-31 14:35:00', NULL, NULL, 'en ligne', 11, 12),
(107, 'Among Us est en effet très populaire. De mon côté, je passe beaucoup de temps sur Genshin Impact, un jeu de rôle et d\'aventure en monde ouvert.', '2023-05-31 14:40:00', NULL, NULL, 'en ligne', 12, 12),
(108, 'J\'adore Genshin Impact aussi ! Les graphismes sont incroyables et l\'histoire est captivante. Sinon, j\'aime bien jouer à Clash Royale pour des parties rapides.', '2023-05-31 14:45:00', NULL, NULL, 'en ligne', 13, 12),
(109, 'Clash Royale est un excellent choix. Personnellement, j\'ai été séduit par la simplicité et l\'addictivité de Among Us.', '2023-05-31 14:50:00', NULL, NULL, 'en ligne', 14, 12),
(110, 'Parmi les jeux populaires, il y a aussi Fortnite, Call of Duty Mobile et PUBG Mobile qui ont de grandes communautés de joueurs.', '2023-05-31 14:55:00', NULL, NULL, 'en ligne', 15, 12),
(111, 'Oui, ces jeux de tir en ligne sont très populaires. Il y en a vraiment pour tous les goûts sur les plateformes mobiles.', '2023-05-31 15:00:00', NULL, NULL, 'en ligne', 16, 12),
(112, 'Si vous recherchez des jeux plus relaxants, je vous recommande Stardew Valley et Monument Valley. Ce sont des jeux vraiment apaisants.', '2023-05-31 15:05:00', NULL, NULL, 'en ligne', 17, 12),
(113, 'Merci pour vos suggestions ! Je vais essayer ces jeux et voir ceux qui me plaisent le plus. Si vous en avez d\'autres à recommander, n\'hésitez pas !', '2023-05-31 15:10:00', NULL, NULL, 'en ligne', 18, 12),
(114, 'Il y a tellement de jeux mobiles géniaux à découvrir. Je suis sûr que tu trouveras celui qui te correspond le mieux. Amuse-toi bien !', '2023-05-31 15:15:00', NULL, NULL, 'en ligne', 19, 12),
(115, 'Salut à tous ! La cybersécurité est un sujet important de nos jours. Quelles sont les menaces les plus courantes et quelles sont les solutions pour s\'en protéger ?', '2023-05-31 14:30:00', NULL, NULL, 'en ligne', 10, 13),
(116, 'Salut ! Parmi les menaces courantes, il y a les attaques de phishing, les malwares, les ransomwares et les attaques par déni de service.', '2023-05-31 14:35:00', NULL, NULL, 'en ligne', 11, 13),
(117, 'Effectivement, le phishing est une menace majeure. Il est important d\'être vigilant et de ne pas cliquer sur des liens suspects ou de partager des informations sensibles.', '2023-05-31 14:40:00', NULL, NULL, 'en ligne', 12, 13),
(118, 'Les malwares, tels que les virus et les logiciels espions, peuvent infecter nos appareils. Il est recommandé d\'utiliser des antivirus et de mettre à jour régulièrement les logiciels.', '2023-05-31 14:45:00', NULL, NULL, 'en ligne', 13, 13),
(119, 'Les ransomwares sont des logiciels malveillants qui chiffrent les données et demandent une rançon pour les débloquer. Effectuer des sauvegardes régulières est une bonne pratique pour s\'en prémunir.', '2023-05-31 14:50:00', NULL, NULL, 'en ligne', 14, 13),
(120, 'Les attaques par déni de service visent à rendre un service indisponible en saturant le réseau ou les serveurs. Les pare-feu et les systèmes de détection d\'intrusion peuvent aider à atténuer ces attaques.', '2023-05-31 14:55:00', NULL, NULL, 'en ligne', 15, 13),
(121, 'Pour se protéger, il est également important de maintenir ses systèmes d\'exploitation et ses applications à jour, d\'utiliser des mots de passe forts et de se méfier des réseaux Wi-Fi publics non sécurisés.', '2023-05-31 15:00:00', NULL, NULL, 'en ligne', 16, 13),
(122, 'Il est également recommandé d\'éduquer les utilisateurs sur les bonnes pratiques en matière de cybersécurité et de mettre en place des politiques de sécurité au sein des organisations.', '2023-05-31 15:05:00', NULL, NULL, 'en ligne', 17, 13),
(123, 'Si vous avez des questions spécifiques sur des menaces ou des solutions de cybersécurité, n\'hésitez pas à les poser. Nous sommes là pour vous aider !', '2023-05-31 15:10:00', NULL, NULL, 'en ligne', 18, 13),
(124, 'Merci pour toutes ces informations ! Je vais prendre des mesures pour renforcer ma sécurité en ligne. Si j\'ai d\'autres questions, je reviendrai vers vous.', '2023-05-31 15:15:00', NULL, NULL, 'en ligne', 19, 13),
(125, 'Bonjour à tous ! J\'aimerais découvrir des recettes de cuisine saine. Avez-vous des suggestions ?', '2023-05-31 14:30:00', NULL, NULL, 'en ligne', 10, 14),
(126, 'Salut ! Les recettes à base de légumes et de protéines maigres sont un excellent choix pour une cuisine saine. Par exemple, une salade composée ou un poisson grillé avec des légumes sautés.', '2023-05-31 14:35:00', NULL, NULL, 'en ligne', 11, 14),
(127, 'Les recettes végétariennes et véganes sont également une option saine et délicieuse. Vous pouvez essayer un curry de légumes ou des tacos végétaliens.', '2023-05-31 14:40:00', NULL, NULL, 'en ligne', 12, 14),
(128, 'Une astuce pour rendre les plats plus sains est de remplacer les ingrédients riches en matières grasses par des alternatives plus légères. Par exemple, utilisez du yaourt grec à la place de la crème fraîche dans les sauces.', '2023-05-31 14:45:00', NULL, NULL, 'en ligne', 13, 14),
(129, 'Les épices peuvent également donner beaucoup de saveur à vos plats sans ajouter de calories. Essayez d\'expérimenter avec des mélanges d\'épices pour rehausser le goût de vos recettes.', '2023-05-31 14:50:00', NULL, NULL, 'en ligne', 14, 14),
(130, 'Une autre astuce est de préparer vos repas à l\'avance et de les portionner. Cela vous aidera à contrôler les portions et à éviter les excès.', '2023-05-31 14:55:00', NULL, NULL, 'en ligne', 15, 14),
(131, 'Pour les desserts, vous pouvez utiliser des fruits frais ou des édulcorants naturels comme le miel ou le sirop d\'érable à la place du sucre raffiné.', '2023-05-31 15:00:00', NULL, NULL, 'en ligne', 16, 14),
(132, 'N\'oubliez pas de boire suffisamment d\'eau tout au long de la journée pour rester hydraté et favoriser une alimentation équilibrée.', '2023-05-31 15:05:00', NULL, NULL, 'en ligne', 17, 14),
(133, 'Si vous avez des recettes spécifiques que vous souhaitez découvrir ou des astuces supplémentaires, partagez-les ici !', '2023-05-31 15:10:00', NULL, NULL, 'en ligne', 18, 14),
(134, 'Merci pour ces conseils ! Je vais essayer ces recettes et mettre en pratique ces astuces pour une cuisine plus saine.', '2023-05-31 15:15:00', NULL, NULL, 'en ligne', 19, 14),
(135, 'Salut à tous les fans de rock ! Quels sont vos groupes de rock préférés ?', '2023-05-31 14:30:00', NULL, NULL, 'en ligne', 10, 15),
(136, 'Personnellement, j\'adore Led Zeppelin. Leur album \'Led Zeppelin IV\' est un classique absolu !', '2023-05-31 14:35:00', NULL, NULL, 'en ligne', 11, 15),
(137, 'Je suis fan des Rolling Stones. Leur album \'Exile on Main St.\' est incroyablement bon !', '2023-05-31 14:40:00', NULL, NULL, 'en ligne', 12, 15),
(138, 'Un autre groupe rock que j\'apprécie beaucoup est AC/DC. Leur album \'Back in Black\' est légendaire.', '2023-05-31 14:45:00', NULL, NULL, 'en ligne', 13, 15),
(139, 'Si vous aimez le rock alternatif, je vous recommande vivement d\'écouter \'Nevermind\' de Nirvana.', '2023-05-31 14:50:00', NULL, NULL, 'en ligne', 14, 15),
(140, 'Pour les amateurs de rock progressif, je conseille l\'album \'The Dark Side of the Moon\' de Pink Floyd.', '2023-05-31 14:55:00', NULL, NULL, 'en ligne', 15, 15),
(141, 'Les Red Hot Chili Peppers sont un groupe de rock incontournable. Leur album \'Californication\' est un must !', '2023-05-31 15:00:00', NULL, NULL, 'en ligne', 16, 15),
(142, 'Si vous recherchez un son plus lourd, je recommande \'Master of Puppets\' de Metallica.', '2023-05-31 15:05:00', NULL, NULL, 'en ligne', 17, 15),
(143, 'Les Foo Fighters sont un groupe de rock moderne que j\'apprécie beaucoup. Leur album \'The Colour and the Shape\' est excellent.', '2023-05-31 15:10:00', NULL, NULL, 'en ligne', 18, 15),
(144, 'Quels sont vos albums préférés de ces groupes ou avez-vous d\'autres recommandations à partager ?', '2023-05-31 15:15:00', NULL, NULL, 'en ligne', 19, 15),
(145, 'Je suis d\'accord avec toi ! Led Zeppelin est incroyable. J\'adore aussi leur album \'Physical Graffiti\'.', '2023-05-31 15:20:00', NULL, NULL, 'en ligne', 40, 15),
(146, 'Les Beatles sont un groupe légendaire du rock. \'Abbey Road\' est un de leurs albums emblématiques.', '2023-05-31 15:25:00', NULL, NULL, 'en ligne', 41, 15),
(147, 'Pour les amateurs de rock plus moderne, je recommande vivement \'Songs for the Deaf\' de Queens of the Stone Age.', '2023-05-31 15:30:00', NULL, NULL, 'en ligne', 42, 15),
(148, 'Parmi mes groupes de rock préférés, je ne peux pas oublier les Doors. Leur album éponyme est fantastique !', '2023-05-31 15:35:00', NULL, NULL, 'en ligne', 43, 15),
(149, 'Si vous aimez le rock psychédélique, je vous conseille \'Are You Experienced\' de Jimi Hendrix.', '2023-05-31 15:40:00', NULL, NULL, 'en ligne', 44, 15),
(150, 'Un autre groupe de rock classique que j\'adore est Queen. Leur album \'A Night at the Opera\' est un chef-d\'œuvre.', '2023-05-31 15:45:00', NULL, NULL, 'en ligne', 45, 15),
(151, 'J\'ai récemment découvert le groupe Greta Van Fleet. Leur son rappelle celui de Led Zeppelin. Je recommande leur album \'Anthem of the Peaceful Army\'.', '2023-05-31 15:50:00', NULL, NULL, 'en ligne', 46, 15),
(152, 'Pour les amateurs de rock plus alternatif, je recommande vivement \'OK Computer\' de Radiohead.', '2023-05-31 15:55:00', NULL, NULL, 'en ligne', 47, 15),
(153, 'Si vous recherchez un groupe de rock progressif, je vous suggère \'In the Court of the Crimson King\' de King Crimson.', '2023-05-31 16:00:00', NULL, NULL, 'en ligne', 48, 15),
(154, 'Je suis fan de Bruce Springsteen. Son album \'Born to Run\' est un classique intemporel du rock.', '2023-05-31 16:05:00', NULL, NULL, 'en ligne', 49, 15),
(155, 'J\'ai récemment découvert le groupe Rival Sons. Leur album \'Great Western Valkyrie\' est excellent pour les amateurs de rock moderne.', '2023-05-31 16:10:00', NULL, NULL, 'en ligne', 50, 15);

-- --------------------------------------------------------

--
-- Structure de la table `posseder`
--

DROP TABLE IF EXISTS `posseder`;
CREATE TABLE IF NOT EXISTS `posseder` (
  `ID_user` bigint NOT NULL,
  `ID_role` smallint NOT NULL,
  PRIMARY KEY (`ID_user`,`ID_role`),
  KEY `ID_role` (`ID_role`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Déchargement des données de la table `posseder`
--

INSERT INTO `posseder` (`ID_user`, `ID_role`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `ID_role` smallint NOT NULL,
  `nom` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `couleur` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `permissions` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`ID_role`),
  UNIQUE KEY `nom` (`nom`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`ID_role`, `nom`, `couleur`, `permissions`) VALUES
(1, 'membre', 'gris', 'peut suivre les topics, peut écrire des messages dans les topics, peut ouvrir les topics, peut créer des topics, peut joindre des fichiers aux messages');

-- --------------------------------------------------------

--
-- Structure de la table `suivre`
--

DROP TABLE IF EXISTS `suivre`;
CREATE TABLE IF NOT EXISTS `suivre` (
  `ID_user` bigint NOT NULL,
  `ID_topic` int NOT NULL,
  PRIMARY KEY (`ID_user`,`ID_topic`),
  KEY `ID_topic` (`ID_topic`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Structure de la table `topic`
--

DROP TABLE IF EXISTS `topic`;
CREATE TABLE IF NOT EXISTS `topic` (
  `ID_topic` int NOT NULL,
  `nom` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `thème` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `nb_vue` bigint DEFAULT NULL,
  `ID_categorie` int NOT NULL,
  PRIMARY KEY (`ID_topic`),
  UNIQUE KEY `nom` (`nom`),
  KEY `ID_categorie` (`ID_categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Déchargement des données de la table `topic`
--

INSERT INTO `topic` (`ID_topic`, `nom`, `thème`, `description`, `nb_vue`, `ID_categorie`) VALUES
(1, 'FIFA 22', 'Football', 'Discussion sur le jeu FIFA 22', 0, 1),
(2, 'League of Legends', 'MOBA', 'Discussion sur le jeu League of Legends', 0, 1),
(3, 'Programmation Python', 'Langages de programmation', 'Discussion sur la programmation Python', 0, 2),
(4, 'Développement web', 'Développement web', 'Discussion sur les technologies de développement web', 0, 2),
(5, 'Football', 'Sports', 'Discussion sur les matchs de football et les joueurs', 0, 3),
(6, 'Recettes véganes', 'Cuisine', 'Discussion sur les recettes véganes et les astuces de cuisine', 0, 4),
(7, 'Recommandations musicales', 'Musique', 'Discussion sur les recommandations musicales et les artistes', 0, 5),
(8, 'PC gaming', 'Matériel de jeu', 'Discussion sur les PC de jeu et les composants matériels', 0, 2),
(9, 'Basketball', 'Sports', 'Discussion sur les matchs de basketball et les joueurs', 0, 3),
(10, 'Apprentissage automatique', 'Intelligence artificielle', 'Discussion sur les techniques et les applications d\'apprentissage automatique', 0, 2),
(11, 'Cours de guitare', 'Musique', 'Discussion sur les techniques de jeu de guitare et les leçons', 0, 5),
(12, 'Jeux mobiles', 'Jeux', 'Discussion sur les jeux mobiles et les jeux populaires sur mobile', 0, 1),
(13, 'Cybersécurité', 'Sécurité informatique', 'Discussion sur les menaces et les solutions de cybersécurité', 0, 2),
(14, 'Cuisine saine', 'Cuisine', 'Discussion sur les recettes de cuisine saine et les astuces', 0, 4),
(15, 'Musique rock', 'Musique', 'Discussion sur les groupes de musique rock et les albums', 0, 5);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `ID_user` bigint NOT NULL,
  `pseudonyme` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `Email` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `Mot_de_passe` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`ID_user`),
  UNIQUE KEY `pseudonyme` (`pseudonyme`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`ID_user`, `pseudonyme`, `Email`, `Mot_de_passe`) VALUES
(1, 'JohnDoe', 'johndoe@example.com', 'password123'),
(2, 'JaneSmith', 'janesmith@example.com', 'securepassword'),
(3, 'AliceWonder', 'alice@example.com', 'qwerty123'),
(4, 'BobMarley', 'bob@example.com', 'pass1234'),
(5, 'EmmaWatson', 'emma@example.com', 'hello123'),
(6, 'DavidBrown', 'david@example.com', 'abcdef'),
(7, 'OliviaJohnson', 'olivia@example.com', 'p@ssword'),
(8, 'MichaelTaylor', 'michael@example.com', 'test123'),
(9, 'SophiaWilson', 'sophia@example.com', 'qwertyui'),
(10, 'WilliamThomas', 'william@example.com', 'passw0rd'),
(11, 'AvaMartinez', 'ava@example.com', 'password456'),
(12, 'JamesAnderson', 'james@example.com', 'secret123'),
(13, 'IsabellaLopez', 'isabella@example.com', 'abc123'),
(14, 'LiamGarcia', 'liam@example.com', 'p@ssw0rd'),
(15, 'MiaLee', 'mia@example.com', 'test456'),
(16, 'NoahBrown', 'noah@example.com', 'password789'),
(17, 'SophiaClark', 'sophia.clark@example.com', 'securepass123'),
(18, 'ElijahSmith', 'elijahsmith@example.com', 'qwerty1234'),
(19, 'AvaHall', 'avahall@example.com', 'password12345'),
(20, 'OliverWilson', 'oliver.wilson@example.com', 'testpass123'),
(21, 'AmeliaTaylor', 'amelia.taylor@example.com', 'abc123456'),
(22, 'LucasMoore', 'lucas.moore@example.com', 'pass123456'),
(23, 'CharlotteAnderson', 'charlotte.anderson@example.com', 'passwordtest'),
(24, 'MasonJones', 'mason.jones@example.com', 'testpassword'),
(25, 'HarperGarcia', 'harper.garcia@example.com', 'passwordtest123'),
(26, 'EvelynThomas', 'evelyn.thomas@example.com', 'test123456'),
(27, 'LoganWhite', 'logan.white@example.com', 'password123test'),
(28, 'LunaClark', 'luna.clark@example.com', 'test123456789'),
(29, 'CarterHall', 'carter.hall@example.com', 'passwordtest123456'),
(30, 'EllaMoore', 'ella.moore@example.com', 'testpassword123456'),
(31, 'GraysonYoung', 'grayson.young@example.com', 'password1234567'),
(32, 'AveryWilliams', 'avery.williams@example.com', 'testpassword12345'),
(33, 'LukeMartin', 'luke.martin@example.com', 'passwordtest12345678'),
(34, 'LaylaJackson', 'layla.jackson@example.com', 'test1234567890'),
(35, 'JackHarris', 'jack.harris@example.com', 'password12345678'),
(36, 'StellaWalker', 'stella.walker@example.com', 'testpassword1234'),
(37, 'WyattKing', 'wyatt.king@example.com', 'passwordtest123456789'),
(38, 'ChloeLee', 'chloe.lee@example.com', 'test1234567890'),
(39, 'SebastianGreen', 'sebastian.green@example.com', 'password123456789'),
(40, 'ZoeyParker', 'zoey.parker@example.com', 'testpassword12345'),
(41, 'BenjaminTurner', 'benjamin.turner@example.com', 'password1234567890'),
(42, 'AddisonCollins', 'addison.collins@example.com', 'testpassword123456'),
(43, 'LeoCook', 'leo.cook@example.com', 'passwordtest1234567890'),
(44, 'NoraCarter', 'nora.carter@example.com', 'test12345678900'),
(45, 'LiamSanders', 'liam.sanders@example.com', 'password12345678900'),
(46, 'EleanorBennett', 'eleanor.bennett@example.com', 'testpassword1234567'),
(47, 'HenryRivera', 'henry.rivera@example.com', 'password123456789000'),
(48, 'GraceThompson', 'grace.thompson@example.com', 'testpassword12345678'),
(49, 'DanielPerry', 'daniel.perry@example.com', 'passwordtest123456789000'),
(50, 'HannahWard', 'hannah.ward@example.com', 'test1234567890000');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
