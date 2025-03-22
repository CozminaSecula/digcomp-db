# DigComp Database Example Queries

This document provides example queries to help you understand how to interact with the DigComp database. Each example includes context, purpose, and detailed explanations.

To see the output of these query examples visit [this page](../index.html)

## Query 1: Finding Learning Outcomes by Proficiency Level

### Context
When developing learning materials, you often need to find all learning outcomes associated with a specific proficiency level. This query helps you retrieve both general and specific learning outcomes for a given proficiency level.

```sql
WITH nivel_info AS (
    SELECT cn.id, cn.granular_nivel, cn.complexitate, cn.autonomie,
           cnc.nume as categorie,
           pc.nivel as proces_cognitiv
    FROM digcomp.comp_nivel cn
    JOIN digcomp.comp_nivel_categorie cnc ON cn.comp_nivel_categorie_id = cnc.id
    JOIN digcomp.proces_cognitiv pc ON cn.proces_cognitiv_id = pc.id
    WHERE cn.granular_nivel = 1  -- Foundation level
)
SELECT 
    'General' as tip_rezultat,
    rig.descriere,
    ni.categorie,
    ni.complexitate,
    ni.autonomie,
    ni.proces_cognitiv
FROM nivel_info ni
JOIN digcomp.rezultat_invatare_general rig ON rig.comp_nivel_id = ni.id
UNION ALL
SELECT 
    'Specific' as tip_rezultat,
    ris.descriere,
    ni.categorie,
    ni.complexitate,
    ni.autonomie,
    ni.proces_cognitiv
FROM nivel_info ni
JOIN digcomp.rezultat_invatare_specific ris ON ris.comp_nivel_id = ni.id
ORDER BY tip_rezultat;
```

## Query 2: Finding Examples with Digital Accessibility Interaction

### Context
To understand how digital accessibility relates to digital competencies, this query helps you find all examples that involve digital accessibility interaction for a specific competency descriptor.

```sql
SELECT 
    ce.nume as competenta,
    ce.nume as exemplu_nume,
    ce.descriere as exemplu_descriere,
    cc.nume as componenta,
    i.nume as interactiune_tip
FROM digcomp.comp_exemplu ce
JOIN digcomp.comp_descriptor cd ON ce.comp_descriptor_id = cd.id
JOIN digcomp.comp_componenta cc ON ce.comp_componenta_id = cc.id
JOIN digcomp.interactioneaza_cu i ON ce.interactioneaza_cu_id = i.id
WHERE cd.scaff_cod = 'd.1'
AND i.cod = 'DA'
ORDER BY cc.nume;
```

## Query 3: Analyzing Competency Structure

### Context
This query helps you understand how competencies are structured across different proficiency levels and their associated cognitive processes. It's particularly useful for curriculum development.

```sql
SELECT 
    cd.scaff_cod,
    cd.nume as competenta,
    cn.granular_nivel,
    cnc.nume as nivel_categorie,
    pc.nivel as proces_cognitiv,
    cn.complexitate,
    cn.autonomie,
    COUNT(ce.id) as numar_exemple
FROM digcomp.comp_descriptor cd
JOIN digcomp.comp_nivel_descriptor cnd ON cd.id = cnd.comp_descriptor_id
JOIN digcomp.comp_nivel cn ON cnd.comp_nivel_id = cn.id
JOIN digcomp.comp_nivel_categorie cnc ON cn.comp_nivel_categorie_id = cnc.id
JOIN digcomp.proces_cognitiv pc ON cn.proces_cognitiv_id = pc.id
LEFT JOIN digcomp.comp_exemplu ce ON cd.id = ce.comp_descriptor_id
WHERE cd.scaff_cod = 'd.1'
GROUP BY 
    cd.scaff_cod,
    cd.nume,
    cn.granular_nivel,
    cnc.nume,
    pc.nivel,
    cn.complexitate,
    cn.autonomie
ORDER BY cn.granular_nivel;
```

## How to Use These Queries

1. Connect to your DigComp database
2. Make sure you have the correct schema access (digcomp)
3. Copy and paste the query you want to use
4. Modify parameters as needed:
   - Change `scaff_cod = 'd.1'` to query different competencies
   - Adjust `granular_nivel = 1` to view different proficiency levels
   - Modify the `interactiune_tip` filter to look for different types of interactions


## Common Use Cases

1. **Curriculum Development**
   - Use Query 1 to align learning outcomes with proficiency levels
   - Map competencies to educational programs

2. **AI Integration Analysis**
   - Use Query 2 to understand AI touchpoints
   - Plan technology integration in learning

3. **Framework Analysis**
   - Use Query 3 to understand competency structure
   - Support instructional design decisions
