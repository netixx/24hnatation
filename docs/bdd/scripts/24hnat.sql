
CREATE TABLE ACTIVITES (
                ID INT AUTO_INCREMENT NOT NULL,
                DATETIME_DEBUT DATE NOT NULL,
                DATETIME_FIN DATE NOT NULL,
                LIBELLE VARCHAR NOT NULL,
                PRIMARY KEY (ID)
);

ALTER TABLE ACTIVITES MODIFY COLUMN DATETIME_FIN DATE COMMENT 'Attention au type
';


CREATE TABLE REF_ORGA_ROLES (
                ID INT NOT NULL,
                LIBELLE VARCHAR(100) NOT NULL,
                PRIMARY KEY (ID)
);


CREATE TABLE REF_ORGA_SOUS_ROLES (
                ID INT NOT NULL,
                LIBELLE VARCHAR(100) NOT NULL,
                ID_ROLE INT NOT NULL,
                PRIMARY KEY (ID)
);


CREATE TABLE ORGANISATEURS (
                UID VARCHAR(101) NOT NULL,
                ID INT NOT NULL,
                NOM VARCHAR(50) NOT NULL,
                PRENOM VARCHAR(50) NOT NULL,
                TELEPHONE INT NOT NULL,
                EMAIL VARCHAR NOT NULL,
                ID_SOUS_ROLE INT NOT NULL,
                PRIMARY KEY (UID, ID)
);


CREATE TABLE WEBMASTERS (
                ID INT AUTO_INCREMENT NOT NULL,
                UID VARCHAR(101) NOT NULL,
                PRIMARY KEY (ID)
);


CREATE TABLE REF_TYPES (
                ID INT AUTO_INCREMENT NOT NULL,
                LIBELLE VARCHAR NOT NULL,
                PRIMARY KEY (ID)
);


CREATE TABLE REF_CATEGORIES (
                ID INT AUTO_INCREMENT NOT NULL,
                LIBELLE VARCHAR(100) NOT NULL,
                PRIMARY KEY (ID)
);


CREATE TABLE UTILISATEURS (
                ID INT NOT NULL,
                UID VARCHAR(100) NOT NULL,
                NOM VARCHAR(50) NOT NULL,
                PRENOM VARCHAR(50) NOT NULL,
                ID_TYPE INT NOT NULL,
                PRIMARY KEY (ID)
);


CREATE TABLE CRENAUX (
                ID INT NOT NULL,
                ID_UTILISATEUR INT NOT NULL,
                PRIMARY KEY (ID)
);

ALTER TABLE CRENAUX MODIFY COLUMN ID_UTILISATEUR INTEGER COMMENT 'Personne ayant r�serv� le cr�naux';


CREATE TABLE PHOTOS (
                ID INT NOT NULL,
                ID_UTILISATEUR INT NOT NULL,
                NOM_FICHIER VARCHAR NOT NULL,
                ID_CATEGORIE INT,
                PRIMARY KEY (ID)
);


ALTER TABLE REF_ORGA_SOUS_ROLES ADD CONSTRAINT ref_orga_roles_ref_orga_sous_roles_fk
FOREIGN KEY (ID_ROLE)
REFERENCES REF_ORGA_ROLES (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE ORGANISATEURS ADD CONSTRAINT ref_orga_sous_roles_organisateurs_fk
FOREIGN KEY (ID_SOUS_ROLE)
REFERENCES REF_ORGA_SOUS_ROLES (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE UTILISATEURS ADD CONSTRAINT ref_types_utilisateurs_fk
FOREIGN KEY (ID_TYPE)
REFERENCES REF_TYPES (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE PHOTOS ADD CONSTRAINT ref_categories_photos_fk
FOREIGN KEY (ID_CATEGORIE)
REFERENCES REF_CATEGORIES (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE PHOTOS ADD CONSTRAINT utilisateurs_photos_fk
FOREIGN KEY (ID_UTILISATEUR)
REFERENCES UTILISATEURS (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE CRENAUX ADD CONSTRAINT utilisateurs_crenaux_fk
FOREIGN KEY (ID_UTILISATEUR)
REFERENCES UTILISATEURS (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
