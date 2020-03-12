-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 12 mars 2020 à 10:46
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_contentieux_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `affaire`
--

CREATE TABLE `affaire` (
  `id_affaire` bigint(20) NOT NULL,
  `description_affaire` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `statut` int(11) NOT NULL,
  `titre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `document`
--

CREATE TABLE `document` (
  `id_document` bigint(20) NOT NULL,
  `date_creation` date DEFAULT NULL,
  `description_document` varchar(255) DEFAULT NULL,
  `nom_document` varchar(255) DEFAULT NULL,
  `affaire_id_affaire` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `phase`
--

CREATE TABLE `phase` (
  `id_phase` bigint(20) NOT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `nom_phase` varchar(255) DEFAULT NULL,
  `tache_id_tache` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `profil`
--

CREATE TABLE `profil` (
  `id_user` bigint(20) NOT NULL,
  `id_role` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id_role` bigint(20) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `tache`
--

CREATE TABLE `tache` (
  `id_tache` bigint(20) NOT NULL,
  `date_creation` date DEFAULT NULL,
  `description_tache` varchar(255) DEFAULT NULL,
  `statut_audience` bit(1) NOT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `affaire_id_affaire` bigint(20) DEFAULT NULL,
  `tribunal_id_tribunal` bigint(20) DEFAULT NULL,
  `utilisateur_id_utilisateur` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `tiers`
--

CREATE TABLE `tiers` (
  `dtype` varchar(31) NOT NULL,
  `id_tiers` bigint(20) NOT NULL,
  `adresse_tiers` varchar(255) DEFAULT NULL,
  `tel_tiers` varchar(255) DEFAULT NULL,
  `siret` varchar(255) DEFAULT NULL,
  `cin` varchar(255) DEFAULT NULL,
  `nom_physique` varchar(255) DEFAULT NULL,
  `prenom_physique` varchar(255) DEFAULT NULL,
  `utilisateur_id_utilisateur` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `tribunal`
--

CREATE TABLE `tribunal` (
  `id_tribunal` bigint(20) NOT NULL,
  `adresse_tribunal` varchar(255) DEFAULT NULL,
  `fax` double NOT NULL,
  `region` varchar(255) DEFAULT NULL,
  `tel_tribunal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_utilisateur` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nom_utilisateur` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `prenom_utilisateur` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_utilisateur`, `email`, `nom_utilisateur`, `password`, `prenom_utilisateur`, `username`) VALUES
(1, 'oussama.adaming@gmail.com', 'ayari', 'ouss', 'oussama', 'ouss'),
(2, 'jean.adaming@gmail.com', 'jean', 'jean', 'jean', 'jean');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `affaire`
--
ALTER TABLE `affaire`
  ADD PRIMARY KEY (`id_affaire`);

--
-- Index pour la table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`id_document`),
  ADD KEY `FK4orjje0kbck0tewl8lwrsb5nn` (`affaire_id_affaire`);

--
-- Index pour la table `phase`
--
ALTER TABLE `phase`
  ADD PRIMARY KEY (`id_phase`),
  ADD KEY `FKr7byj80vutirq3o0dk7wlvs9a` (`tache_id_tache`);

--
-- Index pour la table `profil`
--
ALTER TABLE `profil`
  ADD PRIMARY KEY (`id_user`,`id_role`),
  ADD KEY `FKs4fmnq1qfcpfu26dypt7brumn` (`id_role`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Index pour la table `tache`
--
ALTER TABLE `tache`
  ADD PRIMARY KEY (`id_tache`),
  ADD KEY `FKc1g5ovqypeaiey0hkxvdi0ond` (`affaire_id_affaire`),
  ADD KEY `FKkjult7p6jsw8fsp4lb9xbt5cn` (`tribunal_id_tribunal`),
  ADD KEY `FKkfl1fk6orgjsj5avg880mra93` (`utilisateur_id_utilisateur`);

--
-- Index pour la table `tiers`
--
ALTER TABLE `tiers`
  ADD PRIMARY KEY (`id_tiers`),
  ADD KEY `FKjag2mfl757anyt3n0aippwuo6` (`utilisateur_id_utilisateur`);

--
-- Index pour la table `tribunal`
--
ALTER TABLE `tribunal`
  ADD PRIMARY KEY (`id_tribunal`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `affaire`
--
ALTER TABLE `affaire`
  MODIFY `id_affaire` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `document`
--
ALTER TABLE `document`
  MODIFY `id_document` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `phase`
--
ALTER TABLE `phase`
  MODIFY `id_phase` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id_role` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tache`
--
ALTER TABLE `tache`
  MODIFY `id_tache` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tiers`
--
ALTER TABLE `tiers`
  MODIFY `id_tiers` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tribunal`
--
ALTER TABLE `tribunal`
  MODIFY `id_tribunal` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_utilisateur` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `FK4orjje0kbck0tewl8lwrsb5nn` FOREIGN KEY (`affaire_id_affaire`) REFERENCES `affaire` (`id_affaire`);

--
-- Contraintes pour la table `phase`
--
ALTER TABLE `phase`
  ADD CONSTRAINT `FKr7byj80vutirq3o0dk7wlvs9a` FOREIGN KEY (`tache_id_tache`) REFERENCES `tache` (`id_tache`);

--
-- Contraintes pour la table `profil`
--
ALTER TABLE `profil`
  ADD CONSTRAINT `FKs4fmnq1qfcpfu26dypt7brumn` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`),
  ADD CONSTRAINT `FKtjfyhnxqttueuexra336e3p4b` FOREIGN KEY (`id_user`) REFERENCES `utilisateur` (`id_utilisateur`);

--
-- Contraintes pour la table `tache`
--
ALTER TABLE `tache`
  ADD CONSTRAINT `FKc1g5ovqypeaiey0hkxvdi0ond` FOREIGN KEY (`affaire_id_affaire`) REFERENCES `affaire` (`id_affaire`),
  ADD CONSTRAINT `FKkfl1fk6orgjsj5avg880mra93` FOREIGN KEY (`utilisateur_id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`),
  ADD CONSTRAINT `FKkjult7p6jsw8fsp4lb9xbt5cn` FOREIGN KEY (`tribunal_id_tribunal`) REFERENCES `tribunal` (`id_tribunal`);

--
-- Contraintes pour la table `tiers`
--
ALTER TABLE `tiers`
  ADD CONSTRAINT `FKjag2mfl757anyt3n0aippwuo6` FOREIGN KEY (`utilisateur_id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
