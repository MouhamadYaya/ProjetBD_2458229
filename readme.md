#Description générale (README.md — version simple)

La bibliothèque de l’école devras gérer ses collections (livres, périodiques, ressources numériques),
ses memebres (étudiants et professeurs) , les emprunts et réservations. Le système doit permettre
de suivre l’historique des prêts, les retards et les amendes associées.

               Objectifs de ma base de données
Gérer les ouvrages disponibles
Gérer les membres
Suivre les emprunts et les retours
Permettre la réservation d’un ouvrage
Calculer et enregistrer les amendes en cas de retard
Produire des statistiques simples (top des livres empruntés)

                Entités principales
Livre
Périodique
Ressource numérique
Adhérent
Emprunt
Réservation
Amende
            
                 Modele logique
@startuml
Entity Livre {
* id : integer
  --
  titre : string
  auteur : string
  annee : integer
  }

Entity Periodique {
* id : integer
  --
  titre : string
  date_publication : date
  }

Entity RessourceNumerique {
* id : integer
  --
  titre : string
  type_fichier : string
  }

Entity membre {
* id : integer
  --
  nom : string
  prenom : string
  type_membre : string
  }

entity Emprunt {
* id : integer
  --
  date_emprunt : date
  date_retour_prevue : date
  date_retour_reelle : date
  }

Entity Reservation {
* id : integer
  --
  date_reservation : date
  }

Entity Amende {
* id : integer
  --
  montant : decimal
  date_amende : date
  }

membre "1" -- "*" Emprunt
membre "1" -- "*" Reservation
Emprunt "0..1" -- "1" Amende : genere
Livre "1" -- "*" Emprunt
Livre "1" -- "*" Reservation
@enduml
