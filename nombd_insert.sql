SET search_path TO public;

-- =====================
-- TypeMembre
-- =====================
INSERT INTO TypeMembre (duree_emprunt_jours, descriptionn) VALUES
                                                               (7,  'Étudiant'),
                                                               (14, 'Enseignant'),
                                                               (21, 'Employé'),
                                                               (30, 'Chercheur'),
                                                               (10, 'Visiteur');

-- =====================
-- Membre
-- =====================
INSERT INTO Membre (nom, prenom, telephone, date_inscription, type_membree_id) VALUES
                                                                                   ('Tremblay', 'Jean', '514-111-1111', '2024-01-10', 1),
                                                                                   ('Gagnon', 'Marie', '514-222-2222', '2024-02-05', 2),
                                                                                   ('Roy', 'Luc', '514-333-3333', '2024-03-12', 3),
                                                                                   ('Lefebvre', 'Anne', '514-444-4444', '2024-04-01', 4),
                                                                                   ('Morin', 'Paul', '514-555-5555', '2024-05-20', 5);


INSERT INTO Emprunt
(date_emprunt, date_retour_prevue, date_retor_reelle, etat, membre_id, document_id)
VALUES
    ('2024-06-01 10:00', '2024-06-08 10:00', '2024-06-07 15:00', 'retournee', 1, 1),
    ('2024-06-03 14:30', '2024-06-17 14:30', NULL, 'en_cour', 2, 2),
    ('2024-06-05 09:00', '2024-06-26 09:00', NULL, 'en_cour', 3, 3),
    ('2024-06-07 16:00', '2024-07-07 16:00', NULL, 'en_cour', 4, 4),
    ('2024-06-10 11:15', '2024-06-20 11:15', '2024-06-25 10:00', 'en_retard', 5, 5);
INSERT INTO Document (titre, type, annee) VALUES
                                              ('Introduction aux bases de données', 'Livre', 2020),
                                              ('Programmation Java avancée', 'Livre', 2019),
                                              ('Réseaux informatiques', 'Livre', 2018),
                                              ('Apprentissage automatique', 'Livre', 2021),
                                              ('Histoire de l’informatique', 'Livre', 2017);
INSERT INTO RessourceNumerique (format_fichier, taille_ko, document_id) VALUES
                                                                            ('PDF', 2048, 1),
                                                                            ('EPUB', 1536, 2),
                                                                            ('PDF', 3072, 3),
                                                                            ('PDF', 4096, 4),
                                                                            ('EPUB', 1024, 5);
INSERT INTO Reservation (date_reservation, membre_id, document_id) VALUES
                                                                       ('2024-06-02 09:00', 1, 2),
                                                                       ('2024-06-04 10:30', 2, 3),
                                                                       ('2024-06-06 11:45', 3, 4),
                                                                       ('2024-06-08 14:00', 4, 5),
                                                                       ('2024-06-11 15:20', 5, 1);
INSERT INTO Amende (montant, payee, membre_id, emprunt_id) VALUES
                                                               (10, TRUE, 1, 1),
                                                               (25, FALSE, 5, 5),
                                                               (15, TRUE, 2, 2),
                                                               (5,  TRUE, 3, 3),
                                                               (20, FALSE, 4, 4);
INSERT INTO Auteur (nom, prenom) VALUES
                                     ('Martin', 'Pierre'),
                                     ('Dubois', 'Sophie'),
                                     ('Lavoie', 'Michel'),
                                     ('Bernard', 'Julie'),
                                     ('Moreau', 'Antoine');

INSERT INTO DocumentAuteur (document_id, auteur_id) VALUES
                                                        (1, 1),
                                                        (1, 2),
                                                        (2, 3),
                                                        (3, 4),
                                                        (4, 5);
SELECT * FROM TypeMembre;
TRUNCATE TABLE Emprunt CASCADE;
TRUNCATE TABLE document RESTART IDENTITY CASCADE;





