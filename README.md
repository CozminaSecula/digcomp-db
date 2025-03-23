# DigComp Database 

## 1. Overview

### 1.1 DigComp Database Implementation

A PostgreSQL database implementation of the European Digital Competence Framework for Citizens (DigComp 2.2) with enhanced features. This repository includes:

- **Database Schema**: Complete SQL implementation of the DigComp 2.2 framework
- **Data Scripts**: SQL scripts for data population and management
- **Documentation**: Detailed documentation of database structure
- **Query Examples**: Sample SQL queries for use cases
- **Utilities**: Database connection and query helpers
- **Web Interface**: Quarto web interface for results

[View Documentation](docs/database_structure.md) | [View Schema](src/schema.sql) | [View Queries](src/queries.md)

### 1.2 Background

The [Digital Competence Framework for Citizens (DigComp)](https://publications.jrc.ec.europa.eu/repository/handle/JRC128415) provides a structured approach to digital skills development across Europe. The latest update, DigComp 2.2, expands upon previous versions, offering a more detailed and accessible framework tailored to the evolving digital landscape with new and more examples of knowledge, skills and attitudes (KSAs).

This project aims to implement a structured database for DigComp 2.2. A structured database can enable organizations, educational institutions, and training providers to operationalize competence areas, proficiency levels, and real-world examples for practical applications.

The framework is structured into various dimensions, including:

-   Competence areas

-   Competences

-   Proficiency levels

-   Examples of knowledge, skills, and attitudes

-   Use cases and implementation scenarios

The project presentation and documentation are in English, while the database content is in Romanian. For demonstration purposes, this project includes data for only one competence area.

### 1.3 Problem statement

Currently, DigComp primarily exists as documentation, which poses several challenges such as difficulty in systematically tracking competence development, difficulty in creating customizable learning paths based on specific needs and difficulty in integrating competence areas into real-world use cases.

A structured database can help organizations to effectively implement digital competence frameworks. This project aims to address these challenges by providing a comprehensive database implementation of DigComp 2.2.

## 2. Business Value & Project Vision

### 2.1 Benefits of a DigComp database implementation

A structured database for DigComp 2.2 enables:

- Efficient storage and retrieval of all framework components

- Creation of customized learning pathways

- Clear tracking of competence progression through proficiency levels

- Development of assessment tools mapped to framework elements

- Filtering of competence examples based on specific contexts

- Bridging theoretical competence with real-world applications

### 2.2 Project vision

The goal is to develop a comprehensive database system that makes the DigComp 2.2 framework fully operational for:

1. **Education Sector**
   - Curriculum alignment with EU standards
   - Learning outcome tracking
   - Student competency assessment

2. **Corporate Training**
   - Skills gap analysis
   - Training program development
   - Digital transformation planning

3. **Workforce Development**
   - Professional development tracking
   - Competency-based hiring
   - Career progression mapping

The system will facilitate assessment, development, and validation of digital competences in alignment with European standards, ensuring clear digital skill advancement pathways.

## References

- [DigComp 2.2 Framework](https://publications.jrc.ec.europa.eu/repository/handle/JRC128415)
- European Commission, Joint Research Centre, Bacigalupo, M., Binasco, A., Bekh, O., Israel, H. and Weikert García, L., "Scaffold", a deck of cards to design competence-oriented learning experiences, Publications Office of the European Union, Luxembourg, 2024, https://data.europa.eu/doi/10.2760/057661, JRC136622
- [Bloom’s Taxonomy Revisited](https://ecampus.oregonstate.edu/faculty/artificial-intelligence-tools/blooms-taxonomy-revisited/)

