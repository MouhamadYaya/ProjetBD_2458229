# 420-3N3-DM Bases de données

## Projet de conception et implémentation d'une base de données

Ce projet, à réaliser en équipe de 2 étudiants maximum, vise à mettre en pratique les concepts de modélisation et
d'implémentation d'une base de données relationnelle avec PostgreSQL.

## Description du projet
 
Vous devez concevoir et implémenter une base de données comprenant au minimum 7 entités (tables), sans compter les
tables d'associations. Vous pouvez :

- Vous inspirer d'une application ou d'un site web existant (ex: Steam, Netflix, Airbnb), ou
- Modéliser la base de données nécessaire pour un projet personnel, ou
- Choisir un des sujets proposés plus bas.

## Livrables et étapes
1. **Description générale** (1-2 pages, dans le `README.md`)
    - Contexte et objectifs de la base de données
    - Description des principales fonctionnalités à supporter
    - Identification des principales entités et leurs associations

2. **Modèle logique** (dans le `README.md`)
    - Diagramme entité-association (DEA) en format PlantUML, avec la notation UML
    - Inclusion de toutes les entités avec leurs attributs
    - Représentation claire des associations et cardinalités
    - Ne pas inclure les clés étrangères à cette étape

3. **Modèle physique** (dans le `README.md`) 
    - Conversion du modèle logique
    - Ajout des clés primaires et étrangères 
    - Diagramme en format PlantUML, avec la notation UML

4. **Scripts de création**
    - Énoncés CREATE TABLE pour toutes les tables
    - Contraintes d'intégrité (PRIMARY KEY, FOREIGN KEY, etc.)
    - Autres objets nécessaires (séquences, index, etc.)

5. **Données de test**
    - Scripts INSERT INTO pour peupler la base
    - Minimum 5 lignes par table
    - Données fictives mais cohérentes et significatives

6. **Requêtes de démonstration**
    - Minimum 10 requêtes SELECT variées démontrant :
        - Jointures (INNER, LEFT, RIGHT)
        - Agrégation (GROUP BY, HAVING)
        - Sous-requêtes
        - Tri et filtrage (ORDER BY, WHERE)
        - Au moins 3 requêtes complexes combinant plusieurs concepts

7. **Documentation**
    - Fichier README.md dans un dépôt Git contenant :
        - Description du projet
        - Modèles logique et physique (images des diagrammes)
        - Description détaillée des entités et associations
        - Guide d'installation et d'utilisation
        - Exemples de requêtes commentées
      
8. **Présentation**
    - Présentation du projet (10 minutes)
        - En personne, durant la semaine d'examens le 16 décembre entre 9:00 et 17:00 (local et horaire exact à
          déterminer)
        - Points principaux à présenter :
            - Description rapide de la BD et comment elle pourrait être utilisée
            - Survol des diagrammes logiques et physiques
            - Survol du script de création de la BD
            - Survol des tables créées dans la BD

## Critères d'évaluation

- Pertinence et complexité du modèle de données
- Qualité de la modélisation (normalisation, associations)
- Respect des bonnes pratiques SQL
- Qualité et variété des requêtes de démonstration
- Documentation claire et complète
- Utilisation appropriée de Git (commits réguliers, messages descriptifs)

## Remise

1. Dépôt git, sur GitHub ou GitLab, partagé avec l'utilisateur `profdenis`. Le nom du dépôt git et le nom du dossier
   supérieur doivent être significatifs, incluant soit les numéros de DA des membres de l'équipe, soit un nom relié au
   sujet du projet.
2. `README.md` : comme décrit plus haut.
3. Code source des diagrammes en format PlantUML, dans le fichier `README.md`.
4. `nombd_logique.png`, `nombd_physique.png` : diagrammes en version `png`.
5. `nombd_create.sql` : création de la BD.
6. `nombd_insert.sql` : insertion de données.
7. `nombd_select.sql` : les exemples de requêtes (format semblable aux TPs, avec la question de la requête en
   commentaire, suivi de la requête).
8. `LICENSE.md` : la license du projet.

**Date limite de remise : 16 décembre 2025 (avant 9:00).**

Assurez-vous de pousser vos derniers changements dans votre dépôt avant l'heure limite.

## Idées de projets

### Système de gestion d'une bibliothèque scolaire

- Gestion des livres, périodiques et ressources numériques
- Suivi des emprunts et réservations
- Gestion des adhérents (étudiants, professeurs)
- Historique des prêts et amendes
- Statistiques d'utilisation

### Application de covoiturage

- Gestion des utilisateurs (conducteurs/passagers)
- Trajets proposés et réservations
- Système de paiement et partage des frais
- Évaluations et commentaires
- Historique des trajets

### Système de gestion d'un club sportif

- Gestion des membres et abonnements
- Planning des cours et activités
- Réservation d'équipements
- Suivi des paiements
- Gestion des instructeurs

### Plateforme de gestion d'événements culturels

- Programmation des événements
- Gestion des salles et espaces
- Billetterie et réservations
- Artistes et intervenants
- Statistiques de fréquentation

### Application de gestion de colocation

- Gestion des colocataires
- Partage des dépenses
- Planning des tâches ménagères
- Inventaire des biens communs
- Messages et notifications