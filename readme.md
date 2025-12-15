# Bibliothèque Scolaire

## Description du projet
ce système permettra de gérer la bibliothèque. 
il pourras tracker tous les livres et fichiers numériques de la collection,
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
- Liste des membres et leur historique d'emprunts
- Suivi des emprunts en cours et en retard
- Identifier les livres les plus empruntés avec leurs auteurs
- Identification des membres avec amendes supérieures à un seuil

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

Membre "1" -- "*" Emprunt : "fait"
Membre "1" -- "*" Reservation : "fait"
Membre "1" -- "*" Amende : "recoit"
Document "1" -- "*" Emprunt
Document "1" -- "*" Reservation 
Document "1" -- "0..1" RessourceNumerique : "possede"
Emprunt "1" -- "0..1" Amende : "génere"
Document "*" -- "*" Auteur
@enduml

           # Modele physique
@startuml
!define TABLE(name,desc) class name as "desc" << (T,#FFAAAA) >>
!define PK(x) <u>x</u>
!define FK(x) <i>x</i>
hide empty methods
hide empty fields

TABLE(Membre, "Membre") {
PK(id) : integer
nom : varchar
prenom : varchar
telephone : varchar
date_inscription : date
FK(type_membre_id) : integer
}

TABLE(TypeMembre, "TypeMembre") {
PK(id) : integer
duree_emprunt_jours : integer
description : varchar
}

TABLE(Document, "Document") {
PK(id) : integer
titre : varchar
type : varchar
annee : integer
}

TABLE(RessourceNumerique, "RessourceNumerique") {
PK(id) : integer
format_fichier : varchar
taille_ko : integer
FK(document_id) : integer
}

TABLE(Emprunt, "Emprunt") {
PK(id) : integer
date_emprunt : timestamp
date_retour_prevue : timestamp
date_retour_reelle : timestamp
etat : varchar
FK(membre_id) : integer
FK(document_id) : integer
}

TABLE(Reservation, "Reservation") {
PK(id) : integer
date_reservation : timestamp
FK(membre_id) : integer
FK(document_id) : integer
}

TABLE(Amende, "Amende") {
PK(id) : integer
montant : integer
payee : boolean
FK(membre_id) : integer
FK(emprunt_id) : integer
}

TABLE(Auteur, "Auteur") {
PK(id) : integer
nom : varchar
prenom : varchar
}

TABLE(DocumentAuteur, "DocumentAuteur") {
PK(FK(document_id)) : integer
PK(FK(auteur_id)) : integer
}

TypeMembre "1" -- "*" Membre : "possède"
Membre "1" -- "*" Emprunt : "fait"
Membre "1" -- "*" Reservation : "fait"
Membre "1" -- "*" Amende : "reçoit"

Document "1" -- "*" Emprunt
Document "1" -- "*" Reservation 
Document "1" -- "0..1" RessourceNumerique : "possède"
Emprunt "1" -- "0..1" Amende : "génère"

Document "*" -- "*" Auteur
Document "1" -- "*" DocumentAuteur
Auteur "1" -- "*" DocumentAuteur

@enduml
