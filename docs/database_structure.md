# DigComp Database Documentation

This document describes the database structure implementing the European Digital Competence Framework for Citizens (DigComp 2.2) with additional enhancements.

## Table of Contents

-   [Overview](#overview)
-   [Key Concepts](#key-concepts)
-   [Database Schema](#database-schema)
-   [Tables Description](#tables-description)
-   [Relationships](#relationships)

## Overview {#overview}

### Core DigComp 2.2 Elements

The database implements the five dimensions of DigComp 2.2:

-   Competence areas (Dimension 1)

-   Competence descriptors (Dimension 2)

-   Proficiency levels (Dimension 3)

-   Knowledge, skills and attitudes examples (Dimension 4)

-   Use cases/scenarios (Dimension 5)

### Enhanced Features

The database extends the original framework with additional elements to support richer competency modeling:

1.  **Cognitive Process Dimension**
    -   Based on Bloom's Taxonomy
    -   Adds cognitive complexity levels
    -   Includes AI integration aspects
    -   Maps verbs to competency descriptions
2.  **Transversal Competencies**
    -   Cross-cutting skills like critical thinking and problem solving
    -   Links to digital competencies
    -   Enhances competency framework integration

## Key Concepts {#key-concepts}

| Term | Definition |
|-------------------------|-----------------------------------------------|
| DigComp | European Digital Competence Framework for Citizens |
| Competence Area | Main domain of digital competence (e.g., Information literacy) |
| Descriptor | Specific competence within an area |
| Proficiency Level | Mastery level (Foundation, Intermediate, Advanced, Highly Specialized) |
| Learning Outcome | Expected achievement at each proficiency level |
| KSA | Knowledge, Skills, and Attitudes components |
| Transversal Competence | Cross-cutting skills developed through specific competencies |

## Database Schema {#database-schema}

The database consists of interconnected tables representing the DigComp framework components:

``` mermaid
erDiagram
    %% Main Framework Hierarchy
    comp_cadru ||--o{ comp_arie : contains
    comp_arie ||--o{ comp_descriptor : contains
    
    %% Level and Process relationships
    comp_nivel }o--|| comp_nivel_categorie : "categorized as"
    comp_nivel }o--|| proces_cognitiv : "associated with"
    
    %% Learning outcomes
    comp_nivel ||--o{ rezultat_invatare_general : "produces"
    comp_nivel ||--o{ rezultat_invatare_specific : "produces"
    rezultat_invatare_specific }o--|| scenariu : "applied in"
    scenariu }o--|| aplicabilitate_context : "belongs to"
    
    %% Examples relationship
    comp_descriptor ||--o{ comp_exemplu : "exemplified by"
    comp_exemplu }o--|| comp_componenta : "belongs to"
    comp_exemplu }o--|| interactioneaza_cu : "interacts with"
    
    %% Junction tables
    comp_descriptor ||--o{ comp_nivel_descriptor : "linked via"
    comp_nivel ||--o{ comp_nivel_descriptor : "linked via"
    comp_descriptor ||--o{ comp_transversala_descriptor : "linked via"
    comp_transversala ||--o{ comp_transversala_descriptor : "linked via"

    %% Framework entities
    comp_cadru {
        int id PK "Primary Key"
        string nume "Name"
        string versiune "Version"
        string descriere "Description"
    }
    
    comp_arie {
        int id PK "Primary Key"
        string nume "Name"
        string descriere "Description"
        int comp_cadru_id FK "References comp_cadru(id)"
    }
    
    comp_descriptor {
        int id PK "Primary Key"
        string nume "Name"
        string descriere "Description"
        int comp_arie_id FK "References comp_arie(id)"
        string scaff_nume "Scaffold Name"
        string scaff_number "Scaffold Number"
    }
    
    comp_nivel {
        int id PK "Primary Key"
        string granular_nivel "Granular Level"
        string complexitate "Complexity"
        string autonomie "Autonomy"
        int comp_nivel_categorie_id FK "References comp_nivel_categorie(id)"
        int proces_cognitiv_id FK "References proces_cognitiv(id)"
    }
    
    %% Categorization entities
    comp_nivel_categorie {
        int id PK "Primary Key"
        string nume "Name"
    }
    
    proces_cognitiv {
        int id PK "Primary Key"
        string nivel "Level"
        string definitie "Definition"
        string capabilitate_umana "Human Capability"
        string utilizeaza_ai "Uses AI"
        string verbe_asociate "Associated Verbs"
    }
    
    comp_componenta {
        int id PK "Primary Key"
        string nume "Name"
        string descriere "Description"
        string exemplu "Example"
    }
    
    %% Example entities
    comp_exemplu {
        int id PK "Primary Key"
        string nume "Name"
        string descriere "Description"
        int comp_componenta_id FK "References comp_componenta(id)"
        int comp_descriptor_id FK "References comp_descriptor(id)"
        int interactioneaza_cu_id FK "References interactioneaza_cu(id)"
    }
    
    interactioneaza_cu {
        int id PK "Primary Key"
        string nume "Name"
        string code "Code"
    }
    
    %% Learning outcome entities
    rezultat_invatare_general {
        int id PK "Primary Key"
        string descriere "Description"
        int comp_nivel_id FK "References comp_nivel(id)"
    }
    
    rezultat_invatare_specific {
        int id PK "Primary Key"
        string descriere "Description"
        int comp_nivel_id FK "References comp_nivel(id)"
        int scenariu_id FK "References scenariu(id)"
    }
    
    scenariu {
        int id PK "Primary Key"
        string nume "Name"
        int aplicabilitate_context_id FK "References aplicabilitate_context(id)"
    }
    
    aplicabilitate_context {
        int id PK "Primary Key"
        string nume "Name"
    }
    
    %% Transversal competence entities
    comp_transversala {
        int id PK "Primary Key"
        string nume "Name"
        string descriere "Description"
    }
    
    %% Junction tables
    comp_nivel_descriptor {
        int id PK "Primary Key"
        int comp_nivel_id FK "References comp_nivel(id)"
        int comp_descriptor_id FK "References comp_descriptor(id)"
    }
    
    comp_transversala_descriptor {
        int id PK "Primary Key"
        int comp_transversala_id FK "References comp_transversala(id)"
        int comp_descriptor_id FK "References comp_descriptor(id)"
    }
```

## Tables Description {#tables-description}

### Core Tables

1.  **comp_cadru (Framework)**
    -   Stores framework metadata
    -   Primary fields: name, version, description
2.  **comp_arie (Competence Areas)**
    -   Represents major domains of digital competence
    -   Links to framework
    -   Contains area name and description
3.  **comp_descriptor (Competence Descriptor)**
    -   Represents specific competencies within an area
    -   Links to competence area
    -   Contains descriptor name, description, scaffold name, and scaffold number
4.  **comp_nivel (Proficiency Granular Level)**
    -   Represents granular levels of proficiency
    -   Links to level category and cognitive process
    -   Contains granular level, complexity, and autonomy
5.  **comp_nivel_categorie (Proficiency Level Category)**
    -   Represents categories of proficiency levels
    -   Contains category name
6.  **proces_cognitiv (Cognitive Process)**
    -   Represents cognitive processes in Bloom's taxonomy
    -   Contains level, definition, human capability, use of AI, and associated verbs
7.  **comp_componenta (Components of Competency)**
    -   Represents components of competency (Knowledge, Skills, Attitudes)
    -   Contains component name, description, and example
8.  **comp_exemplu (Competence Example)**
    -   Represents examples of competencies
    -   Links to competence component, descriptor, and interaction type
    -   Contains example name and description
9.  **interactioneaza_cu (Interacts With)**
    -   Represents interaction types
    -   Contains interaction name and code
10. **rezultat_invatare_general (General Learning Outcome)**
    -   Represents general learning outcomes
    -   Links to proficiency level
    -   Contains description
11. **rezultat_invatare_specific (Specific Learning Outcome)**
    -   Represents specific learning outcomes
    -   Links to proficiency level and scenario
    -   Contains description
12. **scenariu (Scenario)**
    -   Represents scenarios
    -   Links to application context
    -   Contains scenario name
13. **aplicabilitate_context (Domain/Context Applicability)**
    -   Represents application domains/contexts
    -   Contains domain/context name
14. **comp_transversala (Transversal Competence)**
    -   Represents transversal competencies
    -   Contains competence name and description
15. **comp_nivel_descriptor (Bridge table 1)**
    -   Represents the relationship between proficiency levels and descriptors
    -   Links to proficiency level and descriptor
16. **comp_transversala_descriptor (Bridge table 2)**
    -   Represents the relationship between transversal competencies and descriptors
    -   Links to transversal competence and descriptor

## Relationships {#relationships}

### Core Relationships

1.  Framework → Areas
    -   One framework contains multiple competence areas
    -   Enforced by foreign key constraints
2.  Areas → Descriptors
    -   Each area contains multiple competency descriptors
    -   Maintains hierarchical structure
3.  Components of Competency → Examples
    -   One component of competency can have multiple examples
    -   Links to competence component
4.  Proficiency Levels → Categories
    -   Proficiency levels are categorized by level category
    -   Links to level category
5.  Proficiency Levels → Cognitive Process
    -   Levels are associated with cognitive processes
    -   Links to cognitive process
6.  Descriptors → Examples
    -   One descriptor can have multiple competence examples
    -   Links to competence descriptor
7.  Examples → Components of Competency
    -   Examples belong to components like Knowledge, Skills, Attitudes
    -   Links to competence component
8.  Examples → Interacts With
    -   Interacts With are associated with multiple examples
    -   Links to interaction type
9.  Proficiency Granular Levels → Specific Learning Outcome
    -   Proficiency granular levels can have multiple specific learning outcomes
    -   Links to proficiency level
10. Proficiency Granular Levels → General Learning Outcome
    -   Proficiency granular levels can have multiple general learning outcomes
    -   Links to proficiency level
11. Scenarios → Specific Learning Outcome
    -   Scenario can have multiple specific learning outcomes
    -   Links to scenario
12. Scenarios → Application Domains
    -   Scenarios are associated with specific domains
    -   Links to application context
13. Transversal Competence → Bridge table 2
    -   Transversal Competence has many entries in Bridge table 2
    -   Links to transversal competence
14. Descriptors → Bridge table 2
    -   Descriptor has many entries in Bridge table 2
    -   Links to competence descriptor
15. Descriptors → Bridge table 1
    -   Descriptor has many entries in Bridge table 1
    -   Links to competence descriptor
16. Proficiency Granular Levels → Bridge table 1
    -   Proficiency Granular Levels have many entries in Bridge table 1
    -   Links to proficiency level

## Implementation Notes

-   All text fields limited to 15000 characters
-   Consistent naming conventions used throughout
-   Foreign key constraints ensure data integrity
-   Unique constraints prevent duplicate entries

