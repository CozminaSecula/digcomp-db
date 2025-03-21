-- **********************************************
-- 1. Insert data in table comp_cadru
-- **********************************************
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 
                   FROM digcomp.comp_cadru 
                   WHERE nume = 'DigComp'
                   AND versiune = '2.2') 
    THEN
        INSERT INTO digcomp.comp_cadru (nume, versiune, descriere)
        VALUES ('DigComp', '2.2', 'Cadrul european al competențelor digitale pentru cetățeni');
        RAISE NOTICE 'Value DigComp added.';
    ELSE
        RAISE NOTICE 'Value DigComp already exists.';
    END IF;
END $$;

-- **********************************************
-- 2. Insert data in table comp_nivel_categorie
-- **********************************************
DO $$
BEGIN
    -- Insert 'De bază'
    IF NOT EXISTS (SELECT 1
                   FROM digcomp.comp_nivel_categorie
                   WHERE nume = 'De bază') 
        THEN
        INSERT INTO digcomp.comp_nivel_categorie (nume)
        VALUES ('De bază');
        RAISE NOTICE 'Value De bază added.';
    ELSE
        RAISE NOTICE 'Value De bază already exists.';
    END IF;

    -- Insert 'Intermediar'
    IF NOT EXISTS (SELECT 1 
                   FROM digcomp.comp_nivel_categorie 
                   WHERE nume = 'Intermediar') 
        THEN
        INSERT INTO digcomp.comp_nivel_categorie (nume) 
        VALUES ('Intermediar');
        RAISE NOTICE 'Value Intermediar added.';
    ELSE
        RAISE NOTICE 'Value Intermediar already exists.';
    END IF;

    -- Insert 'Avansat'
    IF NOT EXISTS (SELECT 1 
                   FROM digcomp.comp_nivel_categorie 
                   WHERE nume = 'Avansat') 
        THEN
        INSERT INTO digcomp.comp_nivel_categorie (nume) 
        VALUES ('Avansat');
        RAISE NOTICE 'Value Avansat added.';
    ELSE
        RAISE NOTICE 'Value Avansat already exists.';
    END IF;

    -- Insert 'Specializare Ridicată'
    IF NOT EXISTS (SELECT 1 
                   FROM digcomp.comp_nivel_categorie 
                   WHERE nume = 'Specializare Ridicată') 
        THEN
        INSERT INTO digcomp.comp_nivel_categorie (nume) 
        VALUES ('Specializare Ridicată');
        RAISE NOTICE 'Value Specializare Ridicată added.';
    ELSE
        RAISE NOTICE 'Value Specializare Ridicată already exists.';
    END IF;
END $$;

-- **********************************************
-- 3. Insert data in table comp_componenta
-- **********************************************
DO $$
BEGIN
    -- Insert "Cunoștințe" if not exists
    IF NOT EXISTS (SELECT 1 
                   FROM digcomp.comp_componenta 
                   WHERE nume = 'Cunoștințe') 
    THEN
        INSERT INTO digcomp.comp_componenta (nume, descriere, exemplu)
        VALUES ('Cunoștințe',
                'Înseamnă rezultatul asimilării de informații prin învățare. Cunoștințele reprezintă ansamblul de fapte, principii, teorii și practici care au legătură cu un domeniu de activitate sau de studiu.',
                'Știe de..., Știe despre..., Înțelege că...');
        RAISE NOTICE 'Value Cunoștințe added.';
    ELSE
        RAISE NOTICE 'Value Cunoștințe already exists.';
    END IF;

    -- Insert "Abilități" if not exists
    IF NOT EXISTS (SELECT 1 
                   FROM digcomp.comp_componenta 
                   WHERE nume = 'Abilități') 
    THEN
        INSERT INTO digcomp.comp_componenta (nume, descriere, exemplu)
        VALUES ('Abilități',
                'Acestea reprezintă capacitatea de a aplica cunoștințele și de a utiliza know-how pentru a îndeplini sarcini și a rezolva probleme. În contextul Cadrului european al calificărilor, competențele sunt descrise ca fiind cognitive (care implică utilizarea gândirii logice, intuitive și creative) sau practice (care implică dexteritate manuală și utilizarea de metode, materiale, unelte și instrumente).',
                'Știe cum să facă..., Este capabil să facă..., Caută...');
        RAISE NOTICE 'Value Abilități added.';
    ELSE
        RAISE NOTICE 'Value Abilități already exists.';
    END IF;

    -- Insert "Atitudini" if not exists
    IF NOT EXISTS (SELECT 1 
                   FROM digcomp.comp_componenta 
                   WHERE nume = 'Atitudini') 
    THEN
        INSERT INTO digcomp.comp_componenta (nume, descriere, exemplu)
        VALUES ('Atitudini',
                'Acestea sunt concepute ca motivatoare ale performanței, baza pentru o performanță competentă continuă. Ele includ valorile, aspirațiile și prioritățile.',
                'Deschis la..., Curios în legătură cu..., Cântărește beneficiile și riscurile...');
        RAISE NOTICE 'Value Atitudini added.';
    ELSE
        RAISE NOTICE 'Value Atitudini already exists.';
    END IF;
END $$;

-- **********************************************
-- 4. Insert data in table interactioneaza_cu
-- **********************************************
DO $$
BEGIN
    -- Insert "Inteligența artificială" if not exists
    IF NOT EXISTS (SELECT 1 
                   FROM digcomp.interactioneaza_cu 
                   WHERE cod = 'AI'
                   AND nume = 'Inteligența artificială') 
    THEN
        INSERT INTO digcomp.interactioneaza_cu (nume, cod)
        VALUES ('Inteligența artificială', 'AI');
        RAISE NOTICE 'Value Inteligența artificială (AI) added.';
    ELSE
        RAISE NOTICE 'Value Inteligența artificială (AI) already exists.';
    END IF;

    -- Insert "Lucru la distanță" if not exists
    IF NOT EXISTS (SELECT 1 
                   FROM digcomp.interactioneaza_cu 
                   WHERE cod = 'RW'
                   AND nume = 'Lucru la distanță') 
    THEN
        INSERT INTO digcomp.interactioneaza_cu (nume, cod)
        VALUES ('Lucru la distanță', 'RW');
        RAISE NOTICE 'Value Lucru la distanță (RW) added.';
    ELSE
        RAISE NOTICE 'Value Lucru la distanță (RW) already exists.';
    END IF;

    -- Insert "Accesibilitate digitală" if not exists
    IF NOT EXISTS (SELECT 1 
                   FROM digcomp.interactioneaza_cu 
                   WHERE cod = 'DA'
                   AND nume = 'Accesibilitate digitală') 
    THEN
        INSERT INTO digcomp.interactioneaza_cu (nume, cod)
        VALUES ('Accesibilitate digitală', 'DA');
        RAISE NOTICE 'Value Accesibilitate digitală (DA) added.';
    ELSE
        RAISE NOTICE 'Value Accesibilitate digitală (DA) already exists.';
    END IF;
END $$;

-- **********************************************
-- 5. Insert data in table aplicabilitate_context
-- **********************************************
DO $$
BEGIN
    -- Insert 'Angajare'
    IF NOT EXISTS (SELECT 1
                   FROM digcomp.aplicabilitate_context 
                   WHERE nume = 'Angajare') 
        THEN
        INSERT INTO digcomp.aplicabilitate_context (nume)
        VALUES ('Angajare');
        RAISE NOTICE 'Value Angajare added.';
    ELSE
        RAISE NOTICE 'Value Angajare already exists.';
    END IF;

    -- Insert 'Învățare'
    IF NOT EXISTS (SELECT 1 
                   FROM digcomp.aplicabilitate_context 
                   WHERE nume = 'Învățare') 
        THEN
        INSERT INTO digcomp.aplicabilitate_context (nume) 
        VALUES ('Învățare');
        RAISE NOTICE 'Value Învățare added.';
    ELSE
        RAISE NOTICE 'Value Învățare already exists.';
    END IF;
   
    -- Insert 'Oricare domeniu'
    IF NOT EXISTS (SELECT 1 
                   FROM digcomp.aplicabilitate_context 
                   WHERE nume = 'Oricare domeniu') 
        THEN
        INSERT INTO digcomp.aplicabilitate_context (nume) 
        VALUES ('Oricare domeniu');
        RAISE NOTICE 'Value Oricare domeniu added.';
    ELSE
        RAISE NOTICE 'Value Oricare domeniu already exists.';
    END IF;
END $$;

-- **********************************************
-- 6. Insert data in table proces_cognitiv
-- **********************************************
DO $$
BEGIN
    -- Insert "A reaminti" if not exists
    IF NOT EXISTS (SELECT 1 
                   FROM digcomp.proces_cognitiv 
                   WHERE nivel = 'A reaminti') 
    THEN
        INSERT INTO digcomp.proces_cognitiv (nivel, definitie, capabilitate_umana, utilizeaza_ia, verbe_asociate)
        VALUES ('A reaminti',
                'Recunoaşterea şi „rechemarea" informaţiilor relevante și a conceptelor simple din memoria pe termen lung',
                'Reamintirea informaţiilor în situații în care tehnologia nu este ușor accesibilă',
                'Obținerea de informații factuale (includ fragmente izolate de informaţii, cum ar fi: definiţii, cunoştinţe despre detalii specifice); listarea răspunsurilor posibile; definirea unui termen; construirea unei cronologii simple sau a unui calendar(timeline)',
                'să amintească, să aleagă, să aranjeze, să arate, să clasifice, să comande, să definească, să descrie, să discute, să duplicheze, să eticheteze, să exemplifice, să explice, să găsească, să identifice, să ilustreze, să înregistreze, să listeze, să localizeze, să potrivească, să recite, să recunoască, să recupereze, să relateze, să repete, să reproducă, să rezume, să selecteze, să sorteze, să spună');
        RAISE NOTICE 'Value A reaminti added.';
    ELSE
        RAISE NOTICE 'Value A reaminti already exists.';
    END IF;

    -- Insert "A înţelege" if not exists
    IF NOT EXISTS (SELECT 1 
                   FROM digcomp.proces_cognitiv 
                   WHERE nivel = 'A înţelege') 
    THEN
        INSERT INTO digcomp.proces_cognitiv (nivel, definitie, capabilitate_umana, utilizeaza_ia, verbe_asociate)
        VALUES ('A înţelege',
                'Abilitatea de a construi sensul, de a explica idei sau concepte pe baza mesajelor educaţionale, inclusiv a comunicării orale, scrise și grafice.',
                'Contextualizarea răspunsurilor în cadrul considerațiilor emoționale, morale sau etice; selectarea informațiilor relevante; explicarea semnificației.',
                'Descrierea exactă conceptelor (sisteme de informaţii, cum ar fi: clasificări, categorii, principii, teorii, modele) în cuvinte diferite; recunoașterea unui exemplu înrudit; traducerea în altă limbă',
                'să abstractizeze, să categorizeze, să clarifice, să clasifice, să compare, să concluzioneze, să construiască, să contrasteze, să demonstreze, să descrie, să detecteze, să discute, să distingă, să explice, să exemplifice, să exprime, să extrapoleze, să găsească, să generalizeze, să identifice, să ilustreze, să indice, să interpreteze, să localizeze, să parafrazeze, să prezică, să raporteze, să recunoască, să redea, să reorganizeze, să revizuiască, să rezume, să selecteze, să traducă, să tragă concluzii, să înțeleagă');
        RAISE NOTICE 'Value A înţelege added.';
    ELSE
        RAISE NOTICE 'Value A înţelege already exists.';
    END IF;

    -- Insert "A aplica" if not exists
    IF NOT EXISTS (SELECT 1 
                   FROM digcomp.proces_cognitiv 
                   WHERE nivel = 'A aplica') 
    THEN
        INSERT INTO digcomp.proces_cognitiv (nivel, definitie, capabilitate_umana, utilizeaza_ia, verbe_asociate)
        VALUES ('A aplica',
                'Utilizarea de idei, concepte, proceduri, în situații noi, pentru a rezolva probleme',
                'Să opereze, să pună în aplicare, să conducă, să execute, să experimenteze și să testeze în lumea reală; să aplice creativitatea și imaginația umană la dezvoltarea de idei și soluții',
                'Să utilizeze un proces (algoritmi, tehnici şi metode, precum şi cunoştinţe despre situaţiile în care se folosesc aceste metode şi procedee), un model sau o metodă pentru a rezolva o cerecetare cantitativă sau calitativă; să ajute utilizatorii să determine unde au greșit în timpul rezolvării unei probleme, să elaboreze o prezentare, un grafic',
                'să afișeze, să aleagă, să angajeze, să aplice, să calculeze, să dezvolte, să demonstreze, să execute, să experimenteze, să folosească, să ilustreze, să implementeze, să interpreteze, să joace, să modeleze, să opereze, să practice, să programeze, să pună în aplicare, să realizeze, să rezolve, să schimbe, să schițeze, să simuleze, să utilizeze');
        RAISE NOTICE 'Value A aplica added.';
    ELSE
        RAISE NOTICE 'Value A aplica already exists.';
    END IF;

    -- Insert "A analiza" if not exists
    IF NOT EXISTS (SELECT 1 
                   FROM digcomp.proces_cognitiv 
                   WHERE nivel = 'A analiza') 
    THEN
        INSERT INTO digcomp.proces_cognitiv (nivel, definitie, capabilitate_umana, utilizeaza_ia, verbe_asociate)
        VALUES ('A analiza',
                'Descompunerea cunoştinţelor în părţi şi considerarea relaţiei dintre părţi şi structura generală, realizarea de conexiuni intre idei',
                'Să gândească și să raționeze critic în domeniile cognitiv și afectiv; să justifice analiza în profunzime și cu claritate ',
                'Să compare și să contrasteze date, să deducă tendințe și teme într-un context bine definit; să calculeze; să realizeze diagrame, mind-mapping, să prezică; să interpreteze și să se raporteze la probleme, decizii și alegeri din lumea reală',
                'să analizeze, să aprecieze, să aranjeze, să atribuie, să calculeze, să caracterizeze, să clasifice, să compare, să contrasteze, să critice, să deconstruiască, să diferențieze, să distingă, să examineze, să experimenteze, să integreze, să organizeze, să schițeze, să selecteze, să structureze, să testeze');
        RAISE NOTICE 'Value A analiza added.';
    ELSE
        RAISE NOTICE 'Value A analiza already exists.';
    END IF;

    -- Insert "A evalua" if not exists
    IF NOT EXISTS (SELECT 1 
                   FROM digcomp.proces_cognitiv 
                   WHERE nivel = 'A evalua') 
    THEN
        INSERT INTO digcomp.proces_cognitiv (nivel, definitie, capabilitate_umana, utilizeaza_ia, verbe_asociate)
        VALUES ('A evalua',
                'Formularea judecăţilor de valoare în legătură cu o anumită problemă, pe criterii de coerenţă, rigoare, eficienţă, justificarea unei poziții sau decizii.',
                'Să se angajeze într-o reflecție metacognitivă (se referă la cunoştinţele despre procesele de gândire, despre sine și felul cum pot fi folosite aceste procese în mod eficient în diferite contexte, de ex. startegii de citire a unui text pentru înţelegere); să evalueze în mod holistic consecințele etice ale cursurilor alternative de acțiune; să identifice semnificația sau să se situeze într-un context istoric sau disciplinar complet',
                'Identificarea argumentelor pro și contra ale diferitelor căi de acțiune; elaborarea și compararea considerând criterii de evaluare',
                'să aleagă, să aprecieze, să argumenteze, să atașeze, să compare, să coordoneze, să critice, să decidă, să detecteze, să estimeze, să evalueze, să ierarhizeze, să înscrie, să judece, să măsoare, să monitorizeze, să prezică, să recomande, să selecteze, să susțină, să testeze, să verifice');
        RAISE NOTICE 'Value A evalua added.';
    ELSE
        RAISE NOTICE 'Value A evalua already exists.';
    END IF;

    -- Insert "A crea" if not exists
    IF NOT EXISTS (SELECT 1 
                   FROM digcomp.proces_cognitiv 
                   WHERE nivel = 'A crea') 
    THEN
        INSERT INTO digcomp.proces_cognitiv (nivel, definitie, capabilitate_umana, utilizeaza_ia, verbe_asociate)
        VALUES ('A crea',
                'Combinarea unor lucruri existente pentru a face ceva nou. A pune elemente împreună pentru a forma un întreg coerent sau funcțional. A reorganiza elemente într-un model sau într-o structură nouă. A inventa un produs sau serviciu.',
                'Să se angajeze în procese creative și cognitive care valorifică experiențele umane trăite, interacțiunile socio-emoționale, intuiția, reflecția și judecata pentru a formula soluții originale.',
                'Sprijinirea proceselor de brainstorming; sugerarea unei game de alternative; enumerarea dezavantajelor și avantajelor potențiale; descrierea cazurilor de succes din lumea reală; crearea unui produs tangibil bazat pe contribuții umane',
                'să adapteze, să adune, să aranjeze, să asambleze, să compună, să conceapă, să construiască, să creeze, să dezvolte, să elaboreze, să extindă, să facă, să formuleze, să formuleze ipoteze, să genereze, să gestioneze, să imagineze, să inventeze, să modifice, să organizeze, să planifice, să pregătească, să proiecteze, să producă, să propună, să rafineze, să scrie, să transforme');
        RAISE NOTICE 'Value A crea added.';
    ELSE
        RAISE NOTICE 'Value A crea already exists.';
    END IF;
END $$;

-- **********************************************
-- 7. Insert data in table comp_transversala
-- **********************************************
DO $$
BEGIN
    -- Insert "Gândire critică" if not exists
    IF NOT EXISTS (SELECT 1 
                   FROM digcomp.comp_transversala 
                   WHERE nume = 'Gândire critică') 
    THEN
        INSERT INTO digcomp.comp_transversala (nume, descriere)
        VALUES ('Gândire critică',
                'Să conceptualizeze, să analizeze, să sintetizeze și să evalueze informații pentru a formula concluzii argumentate, pentru a crea soluții inovatoare sau pentru a lua măsuri.');
        RAISE NOTICE 'Value Gândire critică added to comp_transversala.';
    ELSE
        RAISE NOTICE 'Value Gândire critică already exists in comp_transversala.';
    END IF;

    -- Insert "Rezolvarea problemelor" if not exists
    IF NOT EXISTS (SELECT 1 
                   FROM digcomp.comp_transversala 
                   WHERE nume = 'Rezolvarea problemelor') 
    THEN
        INSERT INTO digcomp.comp_transversala (nume, descriere)
        VALUES ('Rezolvarea problemelor',
                'Să gândească, să înțeleagă și să abordeze probleme sau situații complexe atunci când nu există o soluție imediată.');
        RAISE NOTICE 'Value Rezolvarea problemelor added to comp_transversala.';
    ELSE
        RAISE NOTICE 'Value Rezolvarea problemelor already exists in comp_transversala.';
    END IF;

    -- Insert "Lucru în echipă" if not exists
    IF NOT EXISTS (SELECT 1 
                   FROM digcomp.comp_transversala 
                   WHERE nume = 'Lucru în echipă') 
    THEN
        INSERT INTO digcomp.comp_transversala (nume, descriere)
        VALUES ('Lucru în echipă',
                'Să opereze și să comunice fără probleme și eficient în cadrul unui grup format din persoane diferite pentru a atinge obiective comune sau partajate.');
        RAISE NOTICE 'Value Lucru în echipă added to comp_transversala.';
    ELSE
        RAISE NOTICE 'Value Lucru în echipă already exists in comp_transversala.';
    END IF;

    -- Insert "Comunicare și negociere" if not exists
    IF NOT EXISTS (SELECT 1 
                   FROM digcomp.comp_transversala 
                   WHERE nume = 'Comunicare și negociere') 
    THEN
        INSERT INTO digcomp.comp_transversala (nume, descriere)
        VALUES ('Comunicare și negociere',
                'Transmiterea eficientă a informațiilor și ideilor către audiențe diferite. Stabilirea unui dialog și colaborarea cu cealaltă (celelalte) parte (părți) pentru a ajunge la o soluție acceptabilă pentru toate părțile implicate.');
        RAISE NOTICE 'Value Comunicare și negociere added to comp_transversala.';
    ELSE
        RAISE NOTICE 'Value Comunicare și negociere already exists in comp_transversala.';
    END IF;

    -- Insert "Gândire analitică" if not exists
    IF NOT EXISTS (SELECT 1 
                   FROM digcomp.comp_transversala 
                   WHERE nume = 'Gândire analitică') 
    THEN
        INSERT INTO digcomp.comp_transversala (nume, descriere)
        VALUES ('Gândire analitică',
                'Împarte informațiile și datele în componente mai simple și mai ușor de gestionat pentru a trage concluzii.');
        RAISE NOTICE 'Value Gândire analitică added to comp_transversala.';
    ELSE
        RAISE NOTICE 'Value Gândire analitică already exists in comp_transversala.';
    END IF;

    -- Insert "Creativitate" if not exists
    IF NOT EXISTS (SELECT 1 
                   FROM digcomp.comp_transversala 
                   WHERE nume = 'Creativitate') 
    THEN
        INSERT INTO digcomp.comp_transversala (nume, descriere)
        VALUES ('Creativitate',
                'Dezvoltarea de idei creative și intenționate pentru a crea efecte valoroase.');
        RAISE NOTICE 'Value Creativitate added to comp_transversala.';
    ELSE
        RAISE NOTICE 'Value Creativitate already exists in comp_transversala.';
    END IF;

    -- Insert "Competențe interculturale" if not exists
    IF NOT EXISTS (SELECT 1 
                   FROM digcomp.comp_transversala 
                   WHERE nume = 'Competențe interculturale') 
    THEN
        INSERT INTO digcomp.comp_transversala (nume, descriere)
        VALUES ('Competențe interculturale',
                'Să interacționeze eficient și adecvat în diferite situații interculturale, prin mobilizarea atitudinilor, cunoștințelor, abilităților și valorilor relevante.');
        RAISE NOTICE 'Value Competențe interculturale added to comp_transversala.';
    ELSE
        RAISE NOTICE 'Value Competențe interculturale already exists in comp_transversala.';
    END IF;
END $$;

-- **********************************************
-- 8. Insert data în table comp_arie
-- **********************************************
DO $$
DECLARE
    v_cadru_id INTEGER;
    v_count INTEGER;
BEGIN
    -- Get the framework id
    SELECT id INTO v_cadru_id
    FROM digcomp.comp_cadru 
    WHERE nume = 'DigComp'
    AND versiune = '2.2';

    -- Check if framework id exists
    IF v_cadru_id IS NULL THEN
        RAISE EXCEPTION 'Framework DigComp 2.2 not found';
    END IF;

    -- Count existing entries
    SELECT COUNT(*) INTO v_count
    FROM digcomp.comp_arie
    WHERE nume = 'Cunoașterea informațiilor și a datelor'
    AND comp_cadru_id = v_cadru_id;

    -- Insert only if no matching record exists
    IF v_count = 0 THEN
        INSERT INTO digcomp.comp_arie (
            nume,
            descriere,
            comp_cadru_id
        ) VALUES (
            'Cunoașterea informațiilor și a datelor',
            'Navigarea, căutarea și filtrarea datelor, a informațiilor și a conținutului digital. ' ||
            'Evaluarea datelor, a informațiilor și a conținutului digital. ' ||
            'Gestionarea datelor, a informațiilor și a conținutului digital.',
            v_cadru_id
        );
        RAISE NOTICE 'Competence area "Cunoașterea informațiilor și a datelor" added successfully.';
    ELSE
        RAISE NOTICE 'Competence area "Cunoașterea informațiilor și a datelor" already exists.';
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Error inserting competence area: %', SQLERRM;
END $$;

-- **********************************************
-- 9. Insert data in table comp_descriptor
-- **********************************************
DO $$
DECLARE
    v_cadru_id INTEGER;
    v_arie_id INTEGER;
BEGIN
    -- Get the framework id
    SELECT id INTO v_cadru_id
    FROM digcomp.comp_cadru 
    WHERE nume = 'DigComp'
    AND versiune = '2.2';

    -- Validate framework exists
    IF v_cadru_id IS NULL THEN
        RAISE EXCEPTION 'Framework DigComp 2.2 not found - cannot proceed with descriptor insertion';
    END IF;

    -- Get the competence area id
    SELECT id INTO v_arie_id
    FROM digcomp.comp_arie
    WHERE nume = 'Cunoașterea informațiilor și a datelor'
    AND comp_cadru_id = v_cadru_id;

    -- Validate competence area exists
    IF v_arie_id IS NULL THEN
        RAISE EXCEPTION 'Competence area "Cunoașterea informațiilor și a datelor" not found for framework ID %', v_cadru_id;
    END IF;

    -- Insert descriptor if it doesn't exist
    IF NOT EXISTS (
        SELECT 1
        FROM digcomp.comp_descriptor
        WHERE nume = 'Navigarea, căutarea și filtrarea datelor, a informațiilor și a conținutului digital'
        AND comp_arie_id = v_arie_id
        AND scaff_cod = 'd.1'
    ) THEN
        INSERT INTO digcomp.comp_descriptor (
            nume,
            descriere,
            comp_arie_id,
            scaff_nume,
            scaff_cod
        ) VALUES (
            'Navigarea, căutarea și filtrarea datelor, a informațiilor și a conținutului digital',
            'Să articuleze nevoile de informare, să caute date, informații și conținut în mediile digitale, ' ||
            'să le acceseze și să navigheze între ele. Să creeze și să actualizeze strategii personale de căutare.',
            v_arie_id,
            'Căutarea de informații și conținut digital',
            'd.1'
        );
        RAISE NOTICE 'Descriptor added successfully';
    ELSE
        RAISE NOTICE 'Descriptor already exists';
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Error inserting descriptor: %', SQLERRM;
END $$;

-- **********************************************
-- 10. Insert data in table comp_nivel
-- **********************************************
DO $$
DECLARE
    v_nivel_id INTEGER;
    v_proces_cognitiv_id INTEGER;
    r_nivel RECORD;
BEGIN
    -- Define proficiency levels data
    FOR r_nivel IN (
        SELECT * FROM (VALUES
            (1, 'Sarcină simplă', 'Cu îndrumare', 'A reaminti', 'De bază'),
            (2, 'Sarcină simplă', 'Cu autonomie și îndrumare adecvată', 'A reaminti', 'De bază'),
            (3, 'Sarcini și probleme bine definite și de rutină', 'Pe cont propriu', 'A înţelege', 'Intermediar'),
            (4, 'Sarcini și probleme bine definite și non-rutiniere', 'În mod independent și în funcție de propriile nevoi', 'A înţelege', 'Intermediar'),
            (5, 'Sarcini și probleme diferite', 'Îndrumarea altora', 'A aplica', 'Avansat'),
            (6, 'Sarcinile cele mai potrivite', 'Capabil să mă adaptez în contexte complexe', 'A evalua', 'Avansat'),
            (7, 'Rezolvare probleme complexe cu soluții limitate', 'Integrez cunoștințele pentru practica profesională', 'A crea', 'Specializare Ridicată'),
            (8, 'Rezolvare probleme complexe cu multiple factori', 'Propun idei și procese noi în domeniu', 'A crea', 'Specializare Ridicată')
        ) AS t(granular_nivel, complexitate, autonomie, proces_cognitiv, categorie)
    ) LOOP
        -- Get category id
        SELECT id INTO v_nivel_id
        FROM digcomp.comp_nivel_categorie
        WHERE nume = r_nivel.categorie;

        IF v_nivel_id IS NULL THEN
            RAISE EXCEPTION 'Category % not found', r_nivel.categorie;
        END IF;

        -- Get cognitive process id
        SELECT id INTO v_proces_cognitiv_id
        FROM digcomp.proces_cognitiv
        WHERE nivel = r_nivel.proces_cognitiv;

        IF v_proces_cognitiv_id IS NULL THEN
            RAISE EXCEPTION 'Cognitive process % not found', r_nivel.proces_cognitiv;
        END IF;

        -- Insert if not exists
        IF NOT EXISTS (
            SELECT 1 
            FROM digcomp.comp_nivel
            WHERE granular_nivel = r_nivel.granular_nivel
            AND complexitate = r_nivel.complexitate
            AND autonomie = r_nivel.autonomie
            AND proces_cognitiv_id = v_proces_cognitiv_id
            AND comp_nivel_categorie_id = v_nivel_id
        ) THEN
            INSERT INTO digcomp.comp_nivel (
                granular_nivel,
                complexitate,
                autonomie,
                proces_cognitiv_id,
                comp_nivel_categorie_id
            ) VALUES (
                r_nivel.granular_nivel,
                r_nivel.complexitate,
                r_nivel.autonomie,
                v_proces_cognitiv_id,
                v_nivel_id
            );
            RAISE NOTICE 'Added proficiency level %', r_nivel.granular_nivel;
        ELSE
            RAISE NOTICE 'Proficiency level % already exists', r_nivel.granular_nivel;
        END IF;
    END LOOP;

EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Error inserting proficiency levels: %', SQLERRM;
END $$;

-- **********************************************
-- 11. Insert data in table comp_exemplu
-- **********************************************
DO $$
DECLARE
    v_descriptor_id INTEGER;
    -- Variables for KSA interaction IDs
    v_ai_id INTEGER;  
    v_rw_id INTEGER;  
    v_da_id INTEGER;  
    -- Variables for components IDs
    v_cunostinte_id INTEGER;
    v_abilitati_id INTEGER;
    v_atitudini_id INTEGER;
BEGIN
    -- Get descriptor id
    SELECT id INTO v_descriptor_id
    FROM digcomp.comp_descriptor
    WHERE nume = 'Navigarea, căutarea și filtrarea datelor, a informațiilor și a conținutului digital'
    AND scaff_cod = 'd.1';

    IF v_descriptor_id IS NULL THEN
        RAISE EXCEPTION 'Competence descriptor d.1 not found';
    END IF;
   
    -- Get interaction type IDs
    SELECT 
        (SELECT id FROM digcomp.interactioneaza_cu WHERE cod = 'AI') AS ai_id,
        (SELECT id FROM digcomp.interactioneaza_cu WHERE cod = 'RW') AS rw_id,
        (SELECT id FROM digcomp.interactioneaza_cu WHERE cod = 'DA') AS da_id
    INTO v_ai_id, v_rw_id, v_da_id;

    IF v_ai_id IS NULL OR v_rw_id IS NULL OR v_da_id IS NULL THEN
        RAISE EXCEPTION 'One or more interaction types not found';
    END IF;
   
    -- Get component IDs
    SELECT 
        (SELECT id FROM digcomp.comp_componenta WHERE nume = 'Cunoștințe') AS cunostinte_id,
        (SELECT id FROM digcomp.comp_componenta WHERE nume = 'Abilități') AS abilitati_id,
        (SELECT id FROM digcomp.comp_componenta WHERE nume = 'Atitudini') AS atitudini_id
    INTO v_cunostinte_id, v_abilitati_id, v_atitudini_id;

    IF v_cunostinte_id IS NULL OR v_abilitati_id IS NULL OR v_atitudini_id IS NULL THEN
        RAISE EXCEPTION 'One or more components not found';
    END IF;

    -- Insert examples with better structure and AI detection
    INSERT INTO digcomp.comp_exemplu (
        comp_descriptor_id, 
        nume, 
        descriere, 
        interactioneaza_cu_id, 
        comp_componenta_id
    )
    SELECT v_descriptor_id, nume, descriere,
           CASE 
               WHEN descriere LIKE '%AI%' OR descriere LIKE '%inteligență artificială%' THEN v_ai_id
               WHEN descriere LIKE '%RW%' OR descriere LIKE '%la distanță%' THEN v_rw_id
               WHEN descriere LIKE '%DA%' OR descriere LIKE '%accesibilitate%' THEN v_da_id
               ELSE NULL
           END,
           componenta_id
    FROM (VALUES
        ('Conștientizarea costurilor accesului la conținut online',
         'Știe că o parte din rezultatele căutărilor de conținut online poate să nu fie cu acces liber sau gratuit și că pentru a-l accesa poate fi necesară plata unei taxe sau înscrierea la un serviciu.',
         v_cunostinte_id),
         
        ('Înțelegerea modelelor de monetizare a conținutului online',
         'Conștientizează că majoritatea conținuturilor online disponibile gratuit sunt adesea plătite prin publicitate sau prin vânzarea datelor utilizatorului.',
         v_cunostinte_id),
         
        -- Add other entries following the same pattern...

        ('Preocuparea pentru accesibilitate digitală',
         'Preocupat de faptul că multe informații și conținuturi online ar putea să nu fie accesibile persoanelor cu dizabilități. DA',
         v_atitudini_id)
        
    ) AS t(nume, descriere, componenta_id)
    ON CONFLICT (comp_descriptor_id, nume) DO NOTHING;

    RAISE NOTICE 'Examples inserted successfully';
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Error inserting examples: %', SQLERRM;
END $$;

-- **********************************************
-- 12. Insert data in table scenariu
-- **********************************************
DO $$
DECLARE
    v_context_id INTEGER;
BEGIN
    -- Get context id
    SELECT id INTO v_context_id
    FROM digcomp.aplicabilitate_context
    WHERE nume = 'Angajare';

    IF v_context_id IS NULL THEN
        RAISE EXCEPTION 'Context "Angajare" not found';
    END IF;

    -- Insert if not exists using explicit check
    IF NOT EXISTS (
        SELECT 1 FROM digcomp.scenariu
        WHERE nume = 'Căutarea unui loc de muncă'
        AND aplicabilitate_context_id = v_context_id
    ) THEN
        INSERT INTO digcomp.scenariu (
            nume,
            aplicabilitate_context_id
        ) VALUES (
            'Căutarea unui loc de muncă',
            v_context_id
        );
        RAISE NOTICE 'Scenario added successfully';
    ELSE
        RAISE NOTICE 'Scenario already exists';
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Error inserting scenario: %', SQLERRM;
END $$;

-- **********************************************
-- 13. Insert data in table comp_nivel_descriptor
-- **********************************************
DO $$
DECLARE
    v_nivel_id INTEGER;
    v_descriptor_id INTEGER;
BEGIN
    -- Get descriptor id
    SELECT id INTO v_descriptor_id
    FROM digcomp.comp_descriptor
    WHERE scaff_cod = 'd.1';

    IF v_descriptor_id IS NULL THEN
        RAISE EXCEPTION 'Descriptor with code d.1 not found';
    END IF;

    -- Get competence level id for granular level 1
    SELECT id INTO v_nivel_id
    FROM digcomp.comp_nivel
    WHERE granular_nivel = 1;

    IF v_nivel_id IS NULL THEN
        RAISE EXCEPTION 'Competence level 1 not found';
    END IF;

    -- Insert the relationship if it doesn't exist
    IF NOT EXISTS (
        SELECT 1 
        FROM digcomp.comp_nivel_descriptor
        WHERE comp_nivel_id = v_nivel_id
        AND comp_descriptor_id = v_descriptor_id
    ) THEN
        INSERT INTO digcomp.comp_nivel_descriptor (
            comp_nivel_id,
            comp_descriptor_id
        ) VALUES (
            v_nivel_id,
            v_descriptor_id
        );
        RAISE NOTICE 'Competence level-descriptor relationship added successfully';
    ELSE
        RAISE NOTICE 'Competence level-descriptor relationship already exists';
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Error inserting competence level-descriptor relationship: %', SQLERRM;
END $$;

-- **********************************************  
-- 14. Insert data in table rezultat_invatare_specific 
-- **********************************************
DO $$
DECLARE
    v_scenariu_id INTEGER;
    v_nivel_id INTEGER;
BEGIN
    -- Get scenario id
    SELECT id INTO v_scenariu_id 
    FROM digcomp.scenariu 
    WHERE nume = 'Căutarea unui loc de muncă';

    IF v_scenariu_id IS NULL THEN
        RAISE EXCEPTION 'Scenario not found';
    END IF;

    -- Get competence level id
    SELECT cn.id INTO v_nivel_id
    FROM digcomp.comp_nivel cn
    JOIN digcomp.comp_nivel_descriptor cnd ON cn.id = cnd.comp_nivel_id
    JOIN digcomp.comp_descriptor cd ON cnd.comp_descriptor_id = cd.id
    WHERE cn.granular_nivel = 1
    AND cd.scaff_cod = 'd.1';

    IF v_nivel_id IS NULL THEN
        RAISE EXCEPTION 'Competence level not found';
    END IF;

    -- Insert learning outcomes using a VALUES clause
    INSERT INTO digcomp.rezultat_invatare_specific (
        descriere, 
        scenariu_id, 
        comp_nivel_id
    )
    SELECT 
        descriere,
        v_scenariu_id,
        v_nivel_id
    FROM (VALUES
        ('Pot identifica, dintr-o listă, acele portaluri de locuri de muncă care mă pot ajuta să caut un loc de muncă.'),
        ('Pot, de asemenea, să găsesc aceste portaluri de locuri de muncă în magazinul de aplicații al smartphone-ului meu, să le accesez și să navighez între ele.'),
        ('Dintr-o listă de cuvinte-cheie generice pentru căutarea unui loc de muncă disponibilă pe un blog despre căutarea unui loc de muncă, pot identifica și cuvintele-cheie care îmi sunt utile.')
    ) AS t(descriere)
    WHERE NOT EXISTS (
        SELECT 1 
        FROM digcomp.rezultat_invatare_specific
        WHERE descriere = t.descriere
        AND scenariu_id = v_scenariu_id
        AND comp_nivel_id = v_nivel_id
    );

    RAISE NOTICE 'Learning outcomes inserted successfully';

EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Error inserting learning outcomes: %', SQLERRM;
END $$;

-- **********************************************
-- 15. Insert data in table rezultat_invatare general
-- **********************************************
DO $$
DECLARE
    v_nivel_id INTEGER;
BEGIN
    -- Get competence level id
    SELECT cn.id INTO v_nivel_id
    FROM digcomp.comp_nivel cn
    JOIN digcomp.comp_nivel_descriptor cnd ON cn.id = cnd.comp_nivel_id
    JOIN digcomp.comp_descriptor cd ON cnd.comp_descriptor_id = cd.id
    WHERE cn.granular_nivel = 1
    AND cd.scaff_cod = 'd.1';

    IF v_nivel_id IS NULL THEN
        RAISE EXCEPTION 'Competence level not found';
    END IF;

    -- Insert general outcomes using a VALUES clause
    INSERT INTO digcomp.rezultat_invatare_general (
        descriere,
        comp_nivel_id
    )
    SELECT 
        descriere,
        v_nivel_id
    FROM (VALUES
        ('Pot să îmi identific nevoile de informare, să găsesc date, informații și conținuturi printr-o căutare simplă în medii digitale.'),
        ('Pot să aflu cum să accesez aceste date, informații și conținuturi și să navighez între ele.'),
        ('Pot să identific strategii simple de căutare personală.')
    ) AS t(descriere)
    WHERE NOT EXISTS (
        SELECT 1 
        FROM digcomp.rezultat_invatare_general
        WHERE descriere = t.descriere
        AND comp_nivel_id = v_nivel_id
    );

    RAISE NOTICE 'General outcomes inserted successfully';

EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Error inserting general outcomes: %', SQLERRM;
END $$;

-- **********************************************
-- 16. Insert data in table comp_transversala_descriptor
-- **********************************************
DO $$
DECLARE
    v_descriptor_id INTEGER;
    v_transversal_ids INTEGER[];
BEGIN
    -- Get descriptor id
    SELECT id INTO v_descriptor_id
    FROM digcomp.comp_descriptor
    WHERE scaff_cod = 'd.1';

    IF v_descriptor_id IS NULL THEN
        RAISE EXCEPTION 'Descriptor with code d.1 not found';
    END IF;

    -- Get transversal competence IDs
    SELECT array_agg(id) INTO v_transversal_ids
    FROM digcomp.comp_transversala
    WHERE nume IN ('Gândire critică', 'Gândire analitică');

    IF array_length(v_transversal_ids, 1) < 2 THEN
        RAISE EXCEPTION 'One or more transversal competencies not found';
    END IF;

    -- Insert relationships if they don't exist
    INSERT INTO digcomp.comp_transversala_descriptor (
        comp_transversala_id,
        comp_descriptor_id
    )
    SELECT 
        transversal_id,
        v_descriptor_id
    FROM unnest(v_transversal_ids) AS transversal_id
    WHERE NOT EXISTS (
        SELECT 1 
        FROM digcomp.comp_transversala_descriptor
        WHERE comp_transversala_id = transversal_id
        AND comp_descriptor_id = v_descriptor_id
    );

    RAISE NOTICE 'Transversal-descriptor relationships added successfully';

EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Error inserting transversal-descriptor relationships: %', SQLERRM;
END $$;
