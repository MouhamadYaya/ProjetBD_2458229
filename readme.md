# Bibliothèque Scolaire

## Description du projet
ce système permettra de gérer la bibliothèque. 
il pourras tracker tous les livres, magazines et fichiers numériques de la collection,
savoir qui emprunte quoi, et gérer les retards avec les amendes qui vont avec.

### Gestion des documents
- Garder une liste de tous les ouvrages disponibles (livres physiques, magazines, PDFs, etc.)
- Savoir ce qui est disponible ou déjà emprunté
- Organiser tout ça par auteur, titre, année de publication

### Gestion des membres
- Enregistrer les étudiants et les profs qui peuvent emprunter
- Différencier les types de membres (les profs peuvent garder les livres plus longtemps par exemple)

### Emprunts et retours
- Enregistrer quand quelqu'un emprunte un document
- Calculer automatiquement la date de retour prévue

### Système de réservation
- Permettre de réserver un livre déjà emprunté

### Gestion des amendes
- Calculer les frais de retard
- Suivre qui doit combien

### Statistiques
- Voir quels sont les livres les plus populaires
- Savoir combien de livres sont empruntés en ce moment

## Les principales tables de la base de données
- **TypeMembre** : Étudiant ou professeur (avec durée d'emprunt différente)
- **Membre** : Les personnes inscrites à la bibliothèque
- **Auteur** : Les auteurs des documents
- **Document** : Tous les ouvrages (livres, magazines, etc.)
- **RessourceNumerique** : Infos spécifiques pour les fichiers numériques
- **Emprunt** : Qui a emprunté quoi et quand
- **Reservation** : Les réservations en attente
- **Amende** : Les frais de retard à payer
            
                 # Modele logique
@startuml
Entity Membre {
* id : integer
  --
  nom : varchar
  prenom : varchar
  telephone : varchar
  date_inscription : date
  }

Entity TypeMembre {
* id : integer
  --
  duree_emprunt_jours : integer
  description : varchar
  }

Entity Document {
* id : integer
  --
  titre : varchar
  type : varchar
  annee : integer
  }

Entity RessourceNumerique {
* id : integer
  --
  format_fichier : varchar
  taille : integer
  }

Entity Emprunt {
* id : integer
  --
  date_emprunt : timestamp
  date_retour_prevue : timestamp
  date_retour_reelle : timestamp
  etat : varchar
  }

Entity Reservation {
* id : integer
  --
  date_reservation : timestamp
  }

Entity Amende {
* id : integer
  --
  montant : integer
  payee : boolean
  }

Entity Auteur {
* id : integer
  --
  nom : varchar
  prenom : varchar
  }

TypeMembre "1" -- "*" Membre : "posssede"

Membre "1" -- "*" Emprunt : "effectue"
Membre "1" -- "*" Reservation : "réserve"
Membre "1" -- "*" Amende : "recoit"

Document "1" -- "*" Emprunt
Document "1" -- "*" Reservation : "réservé par"

Document "1" -- "0..1" RessourceNumerique : "possede"

Emprunt "1" -- "0..1" Amende : "génere"
Document "*" -- "*" Auteur
@enduml

           # Modele physique
