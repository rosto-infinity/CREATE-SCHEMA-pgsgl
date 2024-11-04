-- Créer le schéma
CREATE SCHEMA IF NOT EXISTS bureau_etude_schema;

-- Créer la table produit dans le schéma
CREATE TABLE IF NOT EXISTS bureau_etude_schema.produit (
    id SERIAL PRIMARY KEY,
    libelle VARCHAR(255) NOT NULL,
    description TEXT NOT NULL
);

-- Ajouter des index sur les colonnes de la table produit
CREATE INDEX idx_produit_libelle ON bureau_etude_schema.produit(libelle);
CREATE INDEX idx_produit_description ON bureau_etude_schema.produit(description);

-- Créer la table composant dans le schéma
CREATE TABLE IF NOT EXISTS bureau_etude_schema.composant (
    id SERIAL PRIMARY KEY,
    libelle VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    cout DECIMAL(10, 2) NOT NULL
);

-- Ajouter des index sur les colonnes de la table composant
CREATE INDEX idx_composant_libelle ON bureau_etude_schema.composant(libelle);
CREATE INDEX idx_composant_description ON bureau_etude_schema.composant(description);
CREATE INDEX idx_composant_cout ON bureau_etude_schema.composant(cout);

-- Créer la table nomenclature dans le schéma
CREATE TABLE IF NOT EXISTS bureau_etude_schema.nomenclature (
    id_produit INT NOT NULL,
    id_composant INT NOT NULL,
    nombre INT NOT NULL,
    PRIMARY KEY (id_produit, id_composant),
    FOREIGN KEY (id_produit) REFERENCES bureau_etude_schema.produit(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_composant) REFERENCES bureau_etude_schema.composant(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Ajouter des index sur les colonnes de la table nomenclature
CREATE INDEX idx_nomenclature_id_produit ON bureau_etude_schema.nomenclature(id_produit);
CREATE INDEX idx_nomenclature_id_composant ON bureau_etude_schema.nomenclature(id_composant);
CREATE INDEX idx_nomenclature_nombre ON bureau_etude_schema.nomenclature(nombre);

-- Insérer des données dans la table produit
INSERT INTO bureau_etude_schema.produit (libelle, description) VALUES
('Smartphone X1', 'Smartphone haut de gamme avec écran OLED.'),
('Tablette Y2', 'Tablette légère avec une grande autonomie.'),
('Ordinateur portable Z3', 'Ordinateur portable avec processeur i7.'),
('Montre connectée A4', 'Montre connectée avec suivi de santé.'),
('Écouteurs sans fil B5', 'Écouteurs Bluetooth avec réduction de bruit.');

-- Insérer des données dans la table composant
INSERT INTO bureau_etude_schema.composant (libelle, description, cout) VALUES
('Carte mère', 'Carte mère avec chipset avancé.', 150.00),
('Batterie', 'Batterie lithium-ion de 3000 mAh.', 30.00),
('Écran OLED', 'Écran OLED de 6,5 pouces.', 80.00),
('Processeur', 'Processeur Intel i7.', 250.00),
('Boîtier', 'Boîtier en aluminium.', 50.00),
('Haut-parleur', 'Haut-parleur stéréo.', 20.00),
('Capteur de santé', 'Capteur de fréquence cardiaque.', 15.00);

-- Insérer des données dans la table nomenclature
INSERT INTO bureau_etude_schema.nomenclature (id_produit, id_composant, nombre) VALUES
(1, 1, 1),
(1, 2, 1),
(1, 3, 1),
(2, 1, 1),
(2, 2, 1),
(2, 3, 1),
(3, 1, 1),
(3, 4, 1),
(3, 5, 1),
(4, 6, 2),
(4, 7, 1),
(5, 6, 1);


-- Explications :
-- Création du schéma : Le schéma bureau_etude_schema est créé pour organiser les tables.
-- Tables et Index : Les tables produit, composant, et nomenclature sont créées dans ce schéma, avec des index ajoutés sur les colonnes pertinentes pour améliorer les performances des requêtes.
-- Insertion de données : Les données sont insérées dans chaque table après leur création.
-- Exécutez ce script dans votre client PostgreSQL pour créer le schéma, les tables, les index et insérer les données