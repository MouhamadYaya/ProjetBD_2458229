
--1 Liste de tous les membre
SELECT nom, prenom, telephone
FROM Membre
ORDER BY nom;

--2 Tous les documents de typee 'Livre'
SELECT titre, annee
FROM Document
WHERE type = 'Livre'
ORDER BY titre;

-- 3 Les emprunts en cour
SELECT date_emprunt, date_retour_prevue
FROM Emprunt
WHERE etat = 'en_cour';

-- 4 Liste des amendes non payées
SELECT m.nom, m.prenom, a.montant
FROM Amende a
          JOIN Membre m ON a.membre_id = m.id
WHERE a.payee = FALSE;

-- 5. Liste des ressources numériques avec format et taille
SELECT d.titre, rn.format_fichier, rn.taille_ko
FROM RessourceNumerique rn
          JOIN Document d ON rn.document_id = d.id
ORDER BY rn.taille_ko DESC;

-- 6 Membres avec leur type
SELECT m.nom, m.prenom, tm.descriptionn
FROM Membre m
         JOIN TypeMembre tm ON m.type_membree_id = tm.id;

--7 Membres qui ont fait au moins un emprunt
SELECT nom, prenom
FROM Membre
WHERE id IN (
    SELECT membre_id
    FROM Emprunt
);

-- 8 Total des amendes par membre (seulement ceux qui ont une amendes > 15)
SELECT m.nom, m.prenom, SUM(a.montant) AS total
FROM Membre m
         JOIN Amende a ON m.id = a.membre_id
GROUP BY m.nom, m.prenom
HAVING SUM(a.montant) > 15 ;

-- 9 Documents avec leurs auteurs et nombre d'emprunts
SELECT d.titre, a.nom AS auteur_nom, a.prenom AS auteur_prenom, COUNT(e.id) AS nbre
FROM Document d
         JOIN DocumentAuteur da ON d.id = da.document_id
         JOIN Auteur a ON da.auteur_id = a.id
         LEFT JOIN Emprunt e ON d.id = e.document_id
GROUP BY d.titre, a.nom, a.prenom;

-- 10 Membres avec emprunts en retard et leurs amendes
SELECT m.nom, m.prenom, COUNT(e.id) AS emprunts_en_retard, SUM(a.montant) AS amendes
FROM Membre m
         JOIN Emprunt e ON m.id = e.membre_id
         LEFT JOIN Amende a ON e.id = a.emprunt_id
WHERE e.etat = 'en_retard'
GROUP BY m.nom, m.prenom
ORDER BY emprunts_en_retard DESC;