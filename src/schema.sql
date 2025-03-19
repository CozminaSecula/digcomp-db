-- **********************************************
-- Step 1: CREATE DATABASE digcomp;
-- **********************************************

-- **********************************************
-- Step 2: Create schema
-- **********************************************
DROP SCHEMA IF EXISTS digcomp CASCADE;
CREATE SCHEMA IF NOT EXISTS digcomp;

-- **********************************************
-- Step 3: Drop existing tables (if any)
-- **********************************************
-- Drop tables with foreign key dependencies first:
DROP TABLE IF EXISTS digcomp.comp_nivel_descriptor CASCADE;
DROP TABLE IF EXISTS digcomp.comp_transversala_descriptor CASCADE;
DROP TABLE IF EXISTS digcomp.rezultat_invatare_general CASCADE;
DROP TABLE IF EXISTS digcomp.rezultat_invatare_specific CASCADE;
DROP TABLE IF EXISTS digcomp.scenariu CASCADE;
DROP TABLE IF EXISTS digcomp.comp_exemplu CASCADE;
DROP TABLE IF EXISTS digcomp.comp_descriptor CASCADE;
DROP TABLE IF EXISTS digcomp.comp_arie CASCADE;
DROP TABLE IF EXISTS digcomp.comp_cadru CASCADE;
DROP TABLE IF EXISTS digcomp.comp_nivel_categorie CASCADE;
DROP TABLE IF EXISTS digcomp.comp_componenta CASCADE;
DROP TABLE IF EXISTS digcomp.interactioneaza_cu CASCADE;
DROP TABLE IF EXISTS digcomp.aplicabilitate_context CASCADE;
DROP TABLE IF EXISTS digcomp.comp_transversala CASCADE;
DROP TABLE IF EXISTS digcomp.proces_cognitiv CASCADE;

-- **********************************************
-- Step 4: Create primary tables first
-- **********************************************
CREATE TABLE digcomp.comp_cadru (
    id              INTEGER CONSTRAINT pk_comp_cadru PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    nume            VARCHAR(255) NOT NULL,
    versiune        VARCHAR(20) NOT NULL,
    descriere       TEXT NOT NULL,
    CONSTRAINT chk_comp_cadru_descriere_length CHECK (LENGTH(descriere) <= 15000),
    CONSTRAINT uq_comp_cadru_nume_versiune UNIQUE (nume, versiune)
);

CREATE TABLE IF NOT EXISTS digcomp.comp_nivel_categorie (
    id              INTEGER CONSTRAINT pk_comp_nivel_categorie PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    nume            VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS digcomp.comp_componenta(
    id              INTEGER CONSTRAINT pk_comp_componenta PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    nume            VARCHAR(100) NOT NULL,
    descriere       TEXT NOT NULL CONSTRAINT chk_comp_componenta_descriere_length CHECK (LENGTH(descriere) <= 15000), 
    exemplu         TEXT NOT NULL CONSTRAINT chk_comp_componenta_exemplu_length CHECK (LENGTH(exemplu) <= 15000)
);

CREATE TABLE IF NOT EXISTS digcomp.interactioneaza_cu (
    id              INTEGER CONSTRAINT pk_interactioneaza_cu PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    nume            VARCHAR(100) NOT NULL,
    cod             VARCHAR(10) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS digcomp.aplicabilitate_context(
    id              INTEGER CONSTRAINT pk_aplicabilitate_context PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    nume            VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS digcomp.proces_cognitiv (
    id              INTEGER CONSTRAINT pk_proces_cognitiv PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    nivel           VARCHAR(100) NOT NULL UNIQUE,
    definitie       TEXT NOT NULL CONSTRAINT chk_proces_cognitiv_definitie_length CHECK (LENGTH(definitie) <= 15000),
    capabilitate_umana TEXT NOT NULL CONSTRAINT chk_proces_cognitiv_capabilitate_umana_length CHECK (LENGTH(capabilitate_umana) <= 15000),
    utilizeaza_ia TEXT NOT NULL CONSTRAINT chk_proces_cognitiv_utilizeaza_ia_length CHECK (LENGTH(utilizeaza_ia) <= 15000),
    verbe_asociate TEXT NOT NULL CONSTRAINT chk_proces_cognitiv_verbe_asociate_length CHECK (LENGTH(verbe_asociate) <= 15000)
);

CREATE TABLE IF NOT EXISTS digcomp.comp_transversala (
    id          INTEGER CONSTRAINT pk_comp_transversala PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    nume        VARCHAR(255) NOT NULL,
    descriere   TEXT NOT NULL CONSTRAINT chk_comp_transversala_descriere_length CHECK (LENGTH(descriere) <= 15000)
);

-- **********************************************
-- Step 5: Create tables that have foreign key dependencies
-- **********************************************

CREATE TABLE IF NOT EXISTS digcomp.comp_arie (
    id                      INTEGER CONSTRAINT pk_comp_arie PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    nume                    VARCHAR(100) NOT NULL,
    descriere               TEXT NOT NULL,
    comp_cadru_id           INTEGER NOT NULL,
    CONSTRAINT chk_comp_arie_descriere_length CHECK (LENGTH(descriere) <= 15000),
    CONSTRAINT fk_comp_arie_comp_cadru
        FOREIGN KEY (comp_cadru_id) REFERENCES digcomp.comp_cadru(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS digcomp.comp_descriptor(
    id                      INTEGER CONSTRAINT pk_comp_descriptor PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    nume                    VARCHAR(100) NOT NULL,
    descriere               TEXT NOT NULL CONSTRAINT chk_comp_descriptor_descriere_length CHECK (LENGTH(descriere) <= 15000),
    scaff_nume              VARCHAR(255) NOT NULL,
    scaff_cod               VARCHAR(10) NOT NULL,
    comp_arie_id            INTEGER NOT NULL,
    CONSTRAINT fk_comp_descriptor_comp_arie
        FOREIGN KEY (comp_arie_id) REFERENCES digcomp.comp_arie(id)
);

CREATE TABLE IF NOT EXISTS digcomp.comp_nivel(
    id                      INTEGER CONSTRAINT pk_comp_nivel PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    granular_nivel          INTEGER NOT NULL,
    complexitate            VARCHAR(255) NOT NULL,
    autonomie               VARCHAR(255) NOT NULL,
    comp_nivel_categorie_id INTEGER NOT NULL,
    proces_cognitiv_id      INTEGER NOT NULL,
    CONSTRAINT fk_comp_nivel_comp_nivel_categorie
        FOREIGN KEY (comp_nivel_categorie_id) REFERENCES digcomp.comp_nivel_categorie(id),
    CONSTRAINT fk_comp_nivel_proces_cognitiv
        FOREIGN KEY (proces_cognitiv_id) REFERENCES digcomp.proces_cognitiv(id)
);

CREATE TABLE IF NOT EXISTS digcomp.comp_exemplu(
    id                      INTEGER CONSTRAINT pk_comp_exemplu PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    nume                    VARCHAR(255) NOT NULL,
    descriere               TEXT NOT NULL,
    comp_componenta_id  INTEGER NOT NULL,
    comp_descriptor_id      INTEGER NOT NULL,
    interactioneaza_cu_id   INTEGER,
    CONSTRAINT chk_comp_exemplu_descriere_length CHECK (LENGTH(descriere) <= 15000),
    CONSTRAINT fk_comp_exemplu_comp_componenta
        FOREIGN KEY (comp_componenta_id) REFERENCES digcomp.comp_componenta(id) ON DELETE CASCADE,
    CONSTRAINT fk_comp_exemplu_comp_descriptor
        FOREIGN KEY (comp_descriptor_id) REFERENCES digcomp.comp_descriptor(id) ON DELETE CASCADE,
    CONSTRAINT fk_comp_exemplu_interactioneaza_cu
        FOREIGN KEY (interactioneaza_cu_id) REFERENCES digcomp.interactioneaza_cu(id) ON DELETE SET NULL,
    CONSTRAINT uq_comp_exemplu_descriptor_component_nume UNIQUE (comp_componenta_id, comp_descriptor_id, nume)
);

CREATE TABLE IF NOT EXISTS digcomp.scenariu(
    id                         INTEGER CONSTRAINT pk_scenariu PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    nume                       VARCHAR(255) NOT NULL,
    aplicabilitate_context_id  INTEGER NOT NULL,
    CONSTRAINT fk_scenariu_aplicabilitate_context
        FOREIGN KEY (aplicabilitate_context_id) REFERENCES digcomp.aplicabilitate_context(id)
);

CREATE TABLE IF NOT EXISTS digcomp.rezultat_invatare_specific(
    id                         INTEGER CONSTRAINT pk_rezultat_invatare_specific PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    descriere                  TEXT NOT NULL CONSTRAINT chk_rezultat_invatare_specific_descriere_length CHECK (LENGTH(descriere) <= 15000),
    scenariu_id                INTEGER NOT NULL,
    comp_nivel_id              INTEGER NOT NULL,
    CONSTRAINT fk_rezultat_invatare_specific_scenariu
        FOREIGN KEY (scenariu_id) REFERENCES digcomp.scenariu(id),
    CONSTRAINT fk_rezultat_invatare_specific_comp_nivel
        FOREIGN KEY (comp_nivel_id) REFERENCES digcomp.comp_nivel(id)
);

CREATE TABLE IF NOT EXISTS digcomp.rezultat_invatare_general(
    id                      INTEGER CONSTRAINT pk_rezultat_invatare_general PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    descriere               TEXT NOT NULL CONSTRAINT chk_rezultat_invatare_general_descriere_length CHECK (LENGTH(descriere) <= 15000),
    comp_nivel_id           INTEGER NOT NULL,
    CONSTRAINT fk_rezultat_invatare_general_comp_nivel
        FOREIGN KEY (comp_nivel_id) REFERENCES digcomp.comp_nivel(id)
);

CREATE TABLE IF NOT EXISTS digcomp.comp_transversala_descriptor (
    id                   INTEGER CONSTRAINT pk_comp_transversala_descriptor PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    comp_transversala_id INTEGER NOT NULL,
    comp_descriptor_id  INTEGER NOT NULL,
    CONSTRAINT fk_comp_transversala_descriptor_comp_transversala
    FOREIGN KEY (comp_transversala_id) REFERENCES digcomp.comp_transversala(id),
    CONSTRAINT fk_comp_transversala_descriptor_comp_descriptor
    FOREIGN KEY (comp_descriptor_id) REFERENCES digcomp.comp_descriptor(id),
    CONSTRAINT uq_comp_transversala_descriptor UNIQUE (comp_transversala_id, comp_descriptor_id)
);

CREATE TABLE IF NOT EXISTS digcomp.comp_nivel_descriptor (
    id                   INTEGER CONSTRAINT pk_comp_nivel_descriptor PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    comp_nivel_id INTEGER NOT NULL,
    comp_descriptor_id  INTEGER NOT NULL,
    CONSTRAINT fk_comp_nivel_descriptor_comp_nivel
    FOREIGN KEY (comp_nivel_id) REFERENCES digcomp.comp_nivel(id),
    CONSTRAINT fk_comp_nivel_descriptor_comp_descriptor
    FOREIGN KEY (comp_descriptor_id) REFERENCES digcomp.comp_descriptor(id),
    CONSTRAINT uq_comp_nivel_descriptor UNIQUE (comp_nivel_id, comp_descriptor_id)
);
