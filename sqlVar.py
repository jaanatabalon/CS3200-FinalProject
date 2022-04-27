# SELECT all occurrence records of frogs
frogRecords = '''SELECT basisOfRecord, date, pictureURL, size, seasonFound, stateProvince, countryCode, locality
    FROM occurrence_record NATURAL JOIN 
    (SELECT * FROM found_in NATURAL JOIN
	(SELECT * FROM observes NATURAL JOIN 
		(SELECT * FROM living_creature JOIN fauna_frog
			WHERE lcid = faunaLivingCreatureFK) t1) t2) t3
		WHERE confirmCode = "{}"'''

fishRecords = '''SELECT basisOfRecord, date, pictureURL, size, seasonFound, stateProvince, countryCode, locality
    FROM occurrence_record NATURAL JOIN 
    (SELECT * FROM found_in NATURAL JOIN
	(SELECT * FROM observes NATURAL JOIN 
		(SELECT * FROM living_creature JOIN fauna_fish
			WHERE lcid = faunaLivingCreatureFK) t1) t2) t3
		WHERE confirmCode = "{}"'''

flowerRecords = '''SELECT basisOfRecord, date, pictureURL, numberOfPetals, seasonFound, stateProvince, countryCode, locality
    FROM occurrence_record NATURAL JOIN 
    (SELECT * FROM found_in NATURAL JOIN
	(SELECT * FROM observes NATURAL JOIN 
		(SELECT * FROM living_creature JOIN flora_flower
			WHERE lcid = floraLivingCreatureFK) t1) t2) t3
		WHERE confirmCode = "{}"'''

mushroomRecords = '''SELECT basisOfRecord, date, pictureURL, height, seasonFound, stateProvince, countryCode, locality
    FROM occurrence_record NATURAL JOIN 
    (SELECT * FROM found_in NATURAL JOIN
	(SELECT * FROM observes NATURAL JOIN 
		(SELECT * FROM living_creature JOIN flora_mushroom
			WHERE lcid = floraLivingCreatureFK) t1) t2) t3
		WHERE confirmCode = "{}"'''

treeRecords = '''SELECT basisOfRecord, date, pictureURL, height, seasonFound, stateProvince, countryCode, locality
    FROM occurrence_record NATURAL JOIN 
    (SELECT * FROM found_in NATURAL JOIN
	(SELECT * FROM observes NATURAL JOIN 
		(SELECT * FROM living_creature JOIN flora_tree
			WHERE lcid = floraLivingCreatureFK) t1) t2) t3
		WHERE confirmCode = "{}"'''

# SELECT all records of a given taxonomy class
classRecords = '''
SELECT observer.name, occurrence_record.date, 
flower.numberOfPetals AS creatureMeasurements, flower.seasonFound, location.*, 
species.species FROM living_creature NATURAL JOIN 
	observes NATURAL JOIN
    species NATURAL JOIN
    observer NATURAL JOIN
    found_in NATURAL JOIN
    location NATURAL JOIN
	occurrence_record NATURAL JOIN
    (SELECT * FROM flora_flower WHERE floraLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT * FROM species WHERE class = "{}")AS t3)) AS flower
    WHERE species.class = "{}" AND observes.lcid=flower.floraLivingCreatureFK
UNION ALL 
(SELECT observer.name, occurrence_record.date, 
tree.height, tree.seasonFound, location.*,
 species.species FROM living_creature NATURAL JOIN 
	observes NATURAL JOIN
    species NATURAL JOIN
    observer NATURAL JOIN
    found_in NATURAL JOIN
    location NATURAL JOIN
	occurrence_record NATURAL JOIN
    (SELECT * FROM flora_tree WHERE floraLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT * FROM species WHERE class = "{}")AS t4)) AS tree
	WHERE species.class = "{}" AND observes.lcid=tree.floraLivingCreatureFK)
UNION ALL
(SELECT observer.name, occurrence_record.date, 
frog.size, frog.seasonFound, location.*, 
species.species FROM living_creature NATURAL JOIN 
	observes NATURAL JOIN
    species NATURAL JOIN
    observer NATURAL JOIN
    found_in NATURAL JOIN
    location NATURAL JOIN
	occurrence_record NATURAL JOIN
    (SELECT * FROM fauna_frog WHERE faunaLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT * FROM species WHERE class = "{}") AS t1)) AS frog
    WHERE species.class = "{}" AND observes.lcid=frog.faunaLivingCreatureFK)
UNION ALL
(SELECT observer.name, occurrence_record.date, 
fish.size, fish.seasonFound, location.*, 
species.species FROM living_creature NATURAL JOIN 
	observes NATURAL JOIN
    species NATURAL JOIN
    observer NATURAL JOIN
    found_in NATURAL JOIN
    location NATURAL JOIN
	occurrence_record NATURAL JOIN
    (SELECT * FROM fauna_fish WHERE faunaLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT * FROM species WHERE class = "{}")AS t2)) AS fish
    WHERE species.class = "{}" AND observes.lcid=fish.faunaLivingCreatureFK)
UNION ALL
(SELECT observer.name, occurrence_record.date, 
mushroom.height, mushroom.seasonFound, location.*, 
species.species FROM living_creature NATURAL JOIN 
	observes NATURAL JOIN
    species NATURAL JOIN
    observer NATURAL JOIN
    found_in NATURAL JOIN
    location NATURAL JOIN
	occurrence_record NATURAL JOIN
    (SELECT * FROM flora_mushroom WHERE floraLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT * FROM species WHERE class = "{}")AS t5)) AS mushroom
	WHERE species.class = "{}" AND observes.lcid=mushroom.floraLivingCreatureFK)'''

# SELECT all records of a given taxonomy phylum
phylumRecords = '''
SELECT observer.name, occurrence_record.date, 
flower.numberOfPetals AS creatureMeasurements, flower.seasonFound, location.*, 
species.species FROM living_creature NATURAL JOIN 
	observes NATURAL JOIN
    species NATURAL JOIN
    observer NATURAL JOIN
    found_in NATURAL JOIN
    location NATURAL JOIN
	occurrence_record NATURAL JOIN
    (SELECT * FROM flora_flower WHERE floraLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT * FROM species WHERE phylum = "{}")AS t3)) AS flower
    WHERE species.phylum = "{}" AND observes.lcid=flower.floraLivingCreatureFK
UNION ALL 
(SELECT observer.name, occurrence_record.date, 
tree.height, tree.seasonFound, location.*,
 species.species FROM living_creature NATURAL JOIN 
	observes NATURAL JOIN
    species NATURAL JOIN
    observer NATURAL JOIN
    found_in NATURAL JOIN
    location NATURAL JOIN
	occurrence_record NATURAL JOIN
    (SELECT * FROM flora_tree WHERE floraLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT * FROM species WHERE phylum = "{}")AS t4)) AS tree
	WHERE species.phylum = "{}" AND observes.lcid=tree.floraLivingCreatureFK)
UNION ALL
(SELECT observer.name, occurrence_record.date, 
frog.size, frog.seasonFound, location.*, 
species.species FROM living_creature NATURAL JOIN 
	observes NATURAL JOIN
    species NATURAL JOIN
    observer NATURAL JOIN
    found_in NATURAL JOIN
    location NATURAL JOIN
	occurrence_record NATURAL JOIN
    (SELECT * FROM fauna_frog WHERE faunaLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT * FROM species WHERE phylum = "{}") AS t1)) AS frog
    WHERE species.phylum = "{}" AND observes.lcid=frog.faunaLivingCreatureFK)
UNION ALL
(SELECT observer.name, occurrence_record.date, 
fish.size, fish.seasonFound, location.*, 
species.species FROM living_creature NATURAL JOIN 
	observes NATURAL JOIN
    species NATURAL JOIN
    observer NATURAL JOIN
    found_in NATURAL JOIN
    location NATURAL JOIN
	occurrence_record NATURAL JOIN
    (SELECT * FROM fauna_fish WHERE faunaLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT * FROM species WHERE phylum = "{}")AS t2)) AS fish
    WHERE species.phylum = "{}" AND observes.lcid=fish.faunaLivingCreatureFK)
UNION ALL
(SELECT observer.name, occurrence_record.date, 
mushroom.height, mushroom.seasonFound, location.*, 
species.species FROM living_creature NATURAL JOIN 
	observes NATURAL JOIN
    species NATURAL JOIN
    observer NATURAL JOIN
    found_in NATURAL JOIN
    location NATURAL JOIN
	occurrence_record NATURAL JOIN
    (SELECT * FROM flora_mushroom WHERE floraLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT * FROM species WHERE phylum = "{}")AS t5)) AS mushroom
	WHERE species.phylum = "{}" AND observes.lcid=mushroom.floraLivingCreatureFK)'''

# SELECT all records of a given taxonomy order
orderRecords = '''
SELECT observer.name, occurrence_record.date, 
flower.numberOfPetals AS creatureMeasurements, flower.seasonFound, location.*, 
species.species FROM living_creature NATURAL JOIN 
	observes NATURAL JOIN
    species NATURAL JOIN
    observer NATURAL JOIN
    found_in NATURAL JOIN
    location NATURAL JOIN
	occurrence_record NATURAL JOIN
    (SELECT * FROM flora_flower WHERE floraLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT * FROM species WHERE speciesOrder = "{}")AS t3)) AS flower
    WHERE species.speciesOrder= "{}" AND observes.lcid=flower.floraLivingCreatureFK
UNION ALL 
(SELECT observer.name, occurrence_record.date, 
tree.height, tree.seasonFound, location.*,
 species.species FROM living_creature NATURAL JOIN 
	observes NATURAL JOIN
    species NATURAL JOIN
    observer NATURAL JOIN
    found_in NATURAL JOIN
    location NATURAL JOIN
	occurrence_record NATURAL JOIN
    (SELECT * FROM flora_tree WHERE floraLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT * FROM species WHERE speciesOrder = "{}")AS t4)) AS tree
	WHERE species.speciesOrder = "{}" AND observes.lcid=tree.floraLivingCreatureFK)
UNION ALL
(SELECT observer.name, occurrence_record.date, 
frog.size, frog.seasonFound, location.*, 
species.species FROM living_creature NATURAL JOIN 
	observes NATURAL JOIN
    species NATURAL JOIN
    observer NATURAL JOIN
    found_in NATURAL JOIN
    location NATURAL JOIN
	occurrence_record NATURAL JOIN
    (SELECT * FROM fauna_frog WHERE faunaLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT * FROM species WHERE speciesOrder = "{}") AS t1)) AS frog
    WHERE species.speciesOrder = "{}" AND observes.lcid=frog.faunaLivingCreatureFK)
UNION ALL
(SELECT observer.name, occurrence_record.date, 
fish.size, fish.seasonFound, location.*, 
species.species FROM living_creature NATURAL JOIN 
	observes NATURAL JOIN
    species NATURAL JOIN
    observer NATURAL JOIN
    found_in NATURAL JOIN
    location NATURAL JOIN
	occurrence_record NATURAL JOIN
    (SELECT * FROM fauna_fish WHERE faunaLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT * FROM species WHERE speciesOrder = "{}")AS t2)) AS fish
    WHERE species.speciesOrder = "{}" AND observes.lcid=fish.faunaLivingCreatureFK)
UNION ALL
(SELECT observer.name, occurrence_record.date, 
mushroom.height, mushroom.seasonFound, location.*, 
species.species FROM living_creature NATURAL JOIN 
	observes NATURAL JOIN
    species NATURAL JOIN
    observer NATURAL JOIN
    found_in NATURAL JOIN
    location NATURAL JOIN
	occurrence_record NATURAL JOIN
    (SELECT * FROM flora_mushroom WHERE floraLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT * FROM species WHERE speciesOrder = "{}")AS t5)) AS mushroom
	WHERE species.speciesOrder = "{}" AND observes.lcid=mushroom.floraLivingCreatureFK)'''

# SELECT all records of a given taxonomy family
familyRecords = '''
SELECT observer.name, occurrence_record.date, 
flower.numberOfPetals AS creatureMeasurements, flower.seasonFound, location.*, 
species.species FROM living_creature NATURAL JOIN 
	observes NATURAL JOIN
    species NATURAL JOIN
    observer NATURAL JOIN
    found_in NATURAL JOIN
    location NATURAL JOIN
	occurrence_record NATURAL JOIN
    (SELECT * FROM flora_flower WHERE floraLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT * FROM species WHERE family = "{}")AS t3)) AS flower
    WHERE species.family = "{}" AND observes.lcid=flower.floraLivingCreatureFK
UNION ALL 
(SELECT observer.name, occurrence_record.date, 
tree.height, tree.seasonFound, location.*,
 species.species FROM living_creature NATURAL JOIN 
	observes NATURAL JOIN
    species NATURAL JOIN
    observer NATURAL JOIN
    found_in NATURAL JOIN
    location NATURAL JOIN
	occurrence_record NATURAL JOIN
    (SELECT * FROM flora_tree WHERE floraLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT * FROM species WHERE family = "{}")AS t4)) AS tree
	WHERE species.family = "{}" AND observes.lcid=tree.floraLivingCreatureFK)
UNION ALL
(SELECT observer.name, occurrence_record.date, 
frog.size, frog.seasonFound, location.*, 
species.species FROM living_creature NATURAL JOIN 
	observes NATURAL JOIN
    species NATURAL JOIN
    observer NATURAL JOIN
    found_in NATURAL JOIN
    location NATURAL JOIN
	occurrence_record NATURAL JOIN
    (SELECT * FROM fauna_frog WHERE faunaLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT * FROM species WHERE family = "{}") AS t1)) AS frog
    WHERE species.family = "{}" AND observes.lcid=frog.faunaLivingCreatureFK)
UNION ALL
(SELECT observer.name, occurrence_record.date, 
fish.size, fish.seasonFound, location.*, 
species.species FROM living_creature NATURAL JOIN 
	observes NATURAL JOIN
    species NATURAL JOIN
    observer NATURAL JOIN
    found_in NATURAL JOIN
    location NATURAL JOIN
	occurrence_record NATURAL JOIN
    (SELECT * FROM fauna_fish WHERE faunaLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT * FROM species WHERE family = "{}")AS t2)) AS fish
    WHERE species.family = "{}" AND observes.lcid=fish.faunaLivingCreatureFK)
UNION ALL
(SELECT observer.name, occurrence_record.date, 
mushroom.height, mushroom.seasonFound, location.*, 
species.species FROM living_creature NATURAL JOIN 
	observes NATURAL JOIN
    species NATURAL JOIN
    observer NATURAL JOIN
    found_in NATURAL JOIN
    location NATURAL JOIN
	occurrence_record NATURAL JOIN
    (SELECT * FROM flora_mushroom WHERE floraLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT * FROM species WHERE family = "{}")AS t5)) AS mushroom
	WHERE species.family = "{}" AND observes.lcid=mushroom.floraLivingCreatureFK)'''

# SELECT all records of a given taxonomy species
speciesRecords = '''
SELECT observer.name, occurrence_record.date, 
flower.numberOfPetals AS creatureMeasurements, flower.seasonFound, location.*, 
species.species FROM living_creature NATURAL JOIN 
	observes NATURAL JOIN
    species NATURAL JOIN
    observer NATURAL JOIN
    found_in NATURAL JOIN
    location NATURAL JOIN
	occurrence_record NATURAL JOIN
    (SELECT * FROM flora_flower WHERE floraLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT * FROM species WHERE species = "{}")AS t3)) AS flower
    WHERE species.species = "{}" AND observes.lcid=flower.floraLivingCreatureFK
UNION ALL 
(SELECT observer.name, occurrence_record.date, 
tree.height, tree.seasonFound, location.*,
 species.species FROM living_creature NATURAL JOIN 
	observes NATURAL JOIN
    species NATURAL JOIN
    observer NATURAL JOIN
    found_in NATURAL JOIN
    location NATURAL JOIN
	occurrence_record NATURAL JOIN
    (SELECT * FROM flora_tree WHERE floraLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT * FROM species WHERE species = "{}")AS t4)) AS tree
	WHERE species.species = "{}" AND observes.lcid=tree.floraLivingCreatureFK)
UNION ALL
(SELECT observer.name, occurrence_record.date, 
frog.size, frog.seasonFound, location.*, 
species.species FROM living_creature NATURAL JOIN 
	observes NATURAL JOIN
    species NATURAL JOIN
    observer NATURAL JOIN
    found_in NATURAL JOIN
    location NATURAL JOIN
	occurrence_record NATURAL JOIN
    (SELECT * FROM fauna_frog WHERE faunaLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT * FROM species WHERE species = "{}") AS t1)) AS frog
    WHERE species.species = "{}" AND observes.lcid=frog.faunaLivingCreatureFK)
UNION ALL
(SELECT observer.name, occurrence_record.date, 
fish.size, fish.seasonFound, location.*, 
species.species FROM living_creature NATURAL JOIN 
	observes NATURAL JOIN
    species NATURAL JOIN
    observer NATURAL JOIN
    found_in NATURAL JOIN
    location NATURAL JOIN
	occurrence_record NATURAL JOIN
    (SELECT * FROM fauna_fish WHERE faunaLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT * FROM species WHERE species = "{}")AS t2)) AS fish
    WHERE species.species = "{}" AND observes.lcid=fish.faunaLivingCreatureFK)
UNION ALL
(SELECT observer.name, occurrence_record.date, 
mushroom.height, mushroom.seasonFound, location.*, 
species.species FROM living_creature NATURAL JOIN 
	observes NATURAL JOIN
    species NATURAL JOIN
    observer NATURAL JOIN
    found_in NATURAL JOIN
    location NATURAL JOIN
	occurrence_record NATURAL JOIN
    (SELECT * FROM flora_mushroom WHERE floraLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT * FROM species WHERE species = "{}")AS t5)) AS mushroom
	WHERE species.species = "{}" AND observes.lcid=mushroom.floraLivingCreatureFK)'''

#SELECT all records from a given country
countryRecords = '''SELECT observer.name, occurrence_record.date, 
        flower.numberOfPetals AS creatureMeasurements, flower.seasonFound, location.*, 
        species.species
        FROM living_creature
        NATURAL JOIN observes 
        NATURAL JOIN observer
        NATURAL JOIN found_in
        NATURAL JOIN species 
        NATURAL JOIN location 
        NATURAL JOIN occurrence_record
        NATURAL JOIN
        (SELECT * FROM flora_flower WHERE floraLivingCreatureFK IN 
        (SELECT lcid FROM living_creature NATURAL JOIN (SELECT * FROM location WHERE countryCode = "{}")AS t3)) AS flower
        WHERE location.countryCode = "{}" AND observes.lcid = flower.floraLivingCreatureFK
UNION ALL
(SELECT observer.name, occurrence_record.date, tree.height, tree.seasonFound, location.*, 
species.species
    FROM living_creature
        NATURAL JOIN observes 
        NATURAL JOIN observer
        NATURAL JOIN found_in
        NATURAL JOIN species 
        NATURAL JOIN location 
        NATURAL JOIN occurrence_record
        NATURAL JOIN
    (SELECT * FROM flora_tree WHERE floraLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT * FROM location WHERE countryCode = "{}")AS t4)) AS tree
	WHERE location.countryCode = "{}" AND observes.lcid=tree.floraLivingCreatureFK)
UNION ALL
(SELECT observer.name, occurrence_record.date, frog.size, frog.seasonFound, location.*, 
species.species
    FROM living_creature
        NATURAL JOIN observes 
        NATURAL JOIN observer
        NATURAL JOIN found_in
        NATURAL JOIN species 
        NATURAL JOIN location 
        NATURAL JOIN occurrence_record
        NATURAL JOIN
    (SELECT * FROM fauna_frog WHERE faunaLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT * FROM location WHERE countryCode = "{}") AS t1)) AS frog
    WHERE location.countryCode = "{}" AND observes.lcid=frog.faunaLivingCreatureFK)
UNION ALL
(SELECT observer.name, occurrence_record.date, fish.size, fish.seasonFound, location.*, 
species.species
    FROM living_creature
        NATURAL JOIN observes 
        NATURAL JOIN observer
        NATURAL JOIN found_in
        NATURAL JOIN species 
        NATURAL JOIN location 
        NATURAL JOIN occurrence_record
        NATURAL JOIN
    (SELECT * FROM fauna_fish WHERE faunaLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT * FROM location WHERE countryCode = "{}") AS t1)) AS fish
    WHERE location.countryCode = "{}" AND observes.lcid=fish.faunaLivingCreatureFK)
UNION ALL
(SELECT observer.name, occurrence_record.date, mushroom.height, mushroom.seasonFound, location.*, 
species.species
    FROM living_creature
        NATURAL JOIN observes 
        NATURAL JOIN observer
        NATURAL JOIN found_in
        NATURAL JOIN species 
        NATURAL JOIN location 
        NATURAL JOIN occurrence_record
        NATURAL JOIN
    (SELECT * FROM flora_mushroom WHERE floraLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT * FROM location WHERE countryCode = "{}") AS t1)) AS mushroom
    WHERE location.countryCode = "{}" AND observes.lcid=mushroom.floraLivingCreatureFK)'''

# SELECT all records from a given research group name
researchGroupRecords = '''SELECT observer.name, occurrence_record.date, frog.size AS creatureMeasurements, frog.seasonFound, location.*, species.species FROM living_creature NATURAL JOIN
	observes NATURAL JOIN
    observer JOIN 
    research_group ON observer.rgid = research_group.rgid NATURAL JOIN
    species NATURAL JOIN
    location NATURAL JOIN
    found_in NATURAL JOIN
    occurrence_record NATURAL JOIN
    (SELECT * FROM fauna_frog WHERE faunaLivingCreatureFK IN (
 		SELECT lcid FROM living_creature NATURAL JOIN 
 			observes NATURAL JOIN
			observer WHERE rgid = (SELECT rgid FROM research_group WHERE name="{}"))) AS frog
    WHERE research_group.name="{}" AND observes.lcid=frog.faunaLivingCreatureFK
UNION ALL
SELECT observer.name, occurrence_record.date, fish.size AS creatureMeasurements, fish.seasonFound, location.*, species.species FROM living_creature NATURAL JOIN
	observes NATURAL JOIN
    observer JOIN 
    research_group ON observer.rgid = research_group.rgid NATURAL JOIN
    species NATURAL JOIN
    location NATURAL JOIN
    found_in NATURAL JOIN
    occurrence_record NATURAL JOIN
    (SELECT * FROM fauna_fish WHERE faunaLivingCreatureFK IN (
 		SELECT lcid FROM living_creature NATURAL JOIN 
 			observes NATURAL JOIN
			observer WHERE rgid = (SELECT rgid FROM research_group WHERE name="{}"))) AS fish
    WHERE research_group.name="{}" AND observes.lcid=fish.faunaLivingCreatureFK
UNION ALL
SELECT observer.name, occurrence_record.date, flower.numberOfPetals AS creatureMeasurements, flower.seasonFound, location.*, species.species FROM living_creature NATURAL JOIN
	observes NATURAL JOIN
    observer JOIN 
    research_group ON observer.rgid = research_group.rgid NATURAL JOIN
    species NATURAL JOIN
    location NATURAL JOIN
    found_in NATURAL JOIN
    occurrence_record NATURAL JOIN
    (SELECT * FROM flora_flower WHERE floraLivingCreatureFK IN (
 		SELECT lcid FROM living_creature NATURAL JOIN 
 			observes NATURAL JOIN
			observer WHERE rgid = (SELECT rgid FROM research_group WHERE name="{}"))) AS flower
    WHERE research_group.name="{}" AND observes.lcid=flower.floraLivingCreatureFK
UNION ALL
SELECT observer.name, occurrence_record.date, mushroom.height AS creatureMeasurements, mushroom.seasonFound, location.*, species.species FROM living_creature NATURAL JOIN
	observes NATURAL JOIN
    observer JOIN 
    research_group ON observer.rgid = research_group.rgid NATURAL JOIN
    species NATURAL JOIN
    location NATURAL JOIN
    found_in NATURAL JOIN
    occurrence_record NATURAL JOIN
    (SELECT * FROM flora_mushroom WHERE floraLivingCreatureFK IN (
 		SELECT lcid FROM living_creature NATURAL JOIN 
 			observes NATURAL JOIN
			observer WHERE rgid = (SELECT rgid FROM research_group WHERE name="{}"))) AS mushroom
    WHERE research_group.name="{}" AND observes.lcid=mushroom.floraLivingCreatureFK
UNION ALL
SELECT observer.name, occurrence_record.date, tree.height AS creatureMeasurements, tree.seasonFound, location.*, species.species FROM living_creature NATURAL JOIN
	observes NATURAL JOIN
    observer JOIN 
    research_group ON observer.rgid = research_group.rgid NATURAL JOIN
    species NATURAL JOIN
    location NATURAL JOIN
    found_in NATURAL JOIN
    occurrence_record NATURAL JOIN
    (SELECT * FROM flora_tree WHERE floraLivingCreatureFK IN (
 		SELECT lcid FROM living_creature NATURAL JOIN 
 			observes NATURAL JOIN
			observer WHERE rgid = (SELECT rgid FROM research_group WHERE name="{}"))) AS tree
    WHERE research_group.name="{}" AND observes.lcid=tree.floraLivingCreatureFK'''

#SELECT all records from a given institution
institutionRecords = '''USE creature_spottings;
SELECT DISTINCT observer.institution, observer.name, occurrence_record.date, flower.numberOfPetals AS measurement, flower.seasonFound, location.*, species.species 
        FROM institution
        NATURAL JOIN observer
        NATURAL JOIN observes 
        NATURAL JOIN found_in
        NATURAL JOIN living_creature 
        NATURAL JOIN species 
        NATURAL JOIN location 
        NATURAL JOIN occurrence_record
        NATURAL JOIN
        (SELECT * FROM flora_flower WHERE floraLivingCreatureFK IN 
        (SELECT lcid FROM living_creature NATURAL JOIN (SELECT lcid FROM observes NATURAL JOIN (SELECT oid FROM observer NATURAL JOIN (SELECT * FROM observer WHERE institution = "{}")AS t3) AS t2) AS t1)) AS flower 
        WHERE observer.institution = "{}" AND observes.lcid = flower.floraLivingCreatureFK
UNION ALL
(SELECT observer.institution, observer.name, occurrence_record.date, tree.height, tree.seasonFound, location.*, species.species
    FROM institution
        NATURAL JOIN observer
        NATURAL JOIN observes 
        NATURAL JOIN found_in
        NATURAL JOIN living_creature 
        NATURAL JOIN species 
        NATURAL JOIN location 
        NATURAL JOIN occurrence_record
        NATURAL JOIN
    (SELECT * FROM flora_tree WHERE floraLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT lcid FROM observes NATURAL JOIN (SELECT oid FROM observer NATURAL JOIN (SELECT * FROM observer WHERE institution = "{}")AS t3) AS t2) AS t1)) AS tree
	WHERE institution.institutionCode = "{}" AND observes.lcid=tree.floraLivingCreatureFK)
UNION ALL
(SELECT observer.institution, observer.name, occurrence_record.date, frog.size, frog.seasonFound, location.*, species.species
    FROM institution
        NATURAL JOIN observer
        NATURAL JOIN observes 
        NATURAL JOIN found_in
        NATURAL JOIN living_creature 
        NATURAL JOIN species 
        NATURAL JOIN location 
        NATURAL JOIN occurrence_record
        NATURAL JOIN
    (SELECT * FROM fauna_frog WHERE faunaLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT lcid FROM observes NATURAL JOIN (SELECT oid FROM observer NATURAL JOIN (SELECT * FROM observer WHERE institution = "{}")AS t3) AS t2) AS t1)) AS frog
    WHERE institution.institutionCode = "{}" AND observes.lcid=frog.faunaLivingCreatureFK)
UNION ALL
(SELECT observer.institution, observer.name, occurrence_record.date, fish.size, fish.seasonFound, location.*, species.species
    FROM institution
        NATURAL JOIN observer
        NATURAL JOIN observes 
        NATURAL JOIN found_in
        NATURAL JOIN living_creature 
        NATURAL JOIN species 
        NATURAL JOIN location 
        NATURAL JOIN occurrence_record
        NATURAL JOIN
    (SELECT * FROM fauna_fish WHERE faunaLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT lcid FROM observes NATURAL JOIN (SELECT oid FROM observer NATURAL JOIN (SELECT * FROM observer WHERE institution = "{}")AS t3) AS t2) AS t1)) AS fish
    WHERE institution.institutionCode = "{}" AND observes.lcid=fish.faunaLivingCreatureFK)
UNION ALL
(SELECT observer.institution, observer.name, occurrence_record.date, mushroom.height, mushroom.seasonFound, location.*, species.species
    FROM institution
        NATURAL JOIN observer
        NATURAL JOIN observes 
        NATURAL JOIN found_in
        NATURAL JOIN living_creature 
        NATURAL JOIN species 
        NATURAL JOIN location 
        NATURAL JOIN occurrence_record
        NATURAL JOIN
    (SELECT * FROM flora_mushroom WHERE floraLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT lcid FROM observes NATURAL JOIN (SELECT oid FROM observer NATURAL JOIN (SELECT * FROM observer WHERE institution = "{}")AS t3) AS t2) AS t1)) AS mushroom
    WHERE institution.institutionCode = "{}" AND observes.lcid=mushroom.floraLivingCreatureFK)'''

# SELECT all records from a specified observer
observerRecords = '''SELECT observer.name, observer.institution, occurrence_record.date, flower.numberOfPetals AS measurement, flower.seasonFound, location.*, species.species
        FROM observer
        NATURAL JOIN observes 
        NATURAL JOIN found_in
        NATURAL JOIN living_creature 
        NATURAL JOIN species 
        NATURAL JOIN location 
        NATURAL JOIN occurrence_record
        NATURAL JOIN
        (SELECT * FROM flora_flower WHERE floraLivingCreatureFK IN 
        (SELECT lcid FROM living_creature NATURAL JOIN (SELECT * FROM observer NATURAL JOIN observes WHERE name = "{}")AS t3)) AS flower
        WHERE observer.name = "{}" AND observes.lcid = flower.floraLivingCreatureFK
UNION ALL
(SELECT observer.name, observer.institution, occurrence_record.date, tree.height, tree.seasonFound, location.*, species.species
    FROM observer
        NATURAL JOIN observes 
        NATURAL JOIN found_in
        NATURAL JOIN living_creature 
        NATURAL JOIN species 
        NATURAL JOIN location 
        NATURAL JOIN occurrence_record
        NATURAL JOIN
    (SELECT * FROM flora_tree WHERE floraLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT * FROM observer NATURAL JOIN observes WHERE name = "{}")AS t4)) AS tree
	WHERE observer.name = "{}" AND observes.lcid=tree.floraLivingCreatureFK)
UNION ALL
(SELECT observer.name, observer.institution, occurrence_record.date, frog.size, frog.seasonFound, location.*, species.species
    FROM observer
        NATURAL JOIN observes 
        NATURAL JOIN found_in
        NATURAL JOIN living_creature 
        NATURAL JOIN species 
        NATURAL JOIN location 
        NATURAL JOIN occurrence_record
        NATURAL JOIN
    (SELECT * FROM fauna_frog WHERE faunaLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT * FROM observer NATURAL JOIN observes WHERE name = "{}") AS t1)) AS frog
    WHERE observer.name = "{}" AND observes.lcid=frog.faunaLivingCreatureFK)
UNION ALL
(SELECT observer.name, observer.institution, occurrence_record.date, fish.size, fish.seasonFound, location.*, species.species
    FROM observer
        NATURAL JOIN observes 
        NATURAL JOIN found_in
        NATURAL JOIN living_creature 
        NATURAL JOIN species 
        NATURAL JOIN location 
        NATURAL JOIN occurrence_record
        NATURAL JOIN
    (SELECT * FROM fauna_fish WHERE faunaLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT * FROM observer NATURAL JOIN observes WHERE name = "{}") AS t1)) AS fish
    WHERE observer.name = "{}" AND observes.lcid=fish.faunaLivingCreatureFK)
UNION ALL
(SELECT observer.name, observer.institution, occurrence_record.date, mushroom.height, mushroom.seasonFound, location.*, species.species
    FROM observer
        NATURAL JOIN observes 
        NATURAL JOIN found_in
        NATURAL JOIN living_creature 
        NATURAL JOIN species 
        NATURAL JOIN location 
        NATURAL JOIN occurrence_record
        NATURAL JOIN
    (SELECT * FROM flora_mushroom WHERE floraLivingCreatureFK IN 
    (SELECT lcid FROM living_creature NATURAL JOIN (SELECT * FROM observer NATURAL JOIN observes WHERE name = "{}") AS t1)) AS mushroom
    WHERE observer.name = "{}" AND observes.lcid=mushroom.floraLivingCreatureFK)'''

# SELECT all records posted after a given date
afterDateRecords = '''SELECT observer.name, occurrence_record.date, fauna_frog.size AS creatureMeasurements, fauna_frog.seasonFound, location.*, species.species FROM occurrence_record NATURAL JOIN
	observes NATURAL JOIN
    living_creature NATURAL JOIN
    observer NATURAL JOIN
    location NATURAL JOIN 
    found_in NATURAL JOIN
    species JOIN
    fauna_frog
		ON fauna_frog.faunaLivingCreatureFK = living_creature.lcid
WHERE occurrence_record.date > '{}'
UNION ALL
SELECT observer.name, occurrence_record.date, fauna_fish.size AS creatureMeasurements, fauna_fish.seasonFound, location.*, species.species FROM occurrence_record NATURAL JOIN
	observes NATURAL JOIN
    living_creature NATURAL JOIN
    observer NATURAL JOIN
    location NATURAL JOIN 
    found_in NATURAL JOIN
    species JOIN
    fauna_fish
		ON fauna_fish.faunaLivingCreatureFK = living_creature.lcid
WHERE occurrence_record.date > '{}'
UNION ALL
SELECT observer.name, occurrence_record.date, flora_flower.numberOfPetals AS creatureMeasurements, flora_flower.seasonFound, location.*, species.species FROM occurrence_record NATURAL JOIN
	observes NATURAL JOIN
    living_creature NATURAL JOIN
    observer NATURAL JOIN
    location NATURAL JOIN 
    found_in NATURAL JOIN
    species JOIN
    flora_flower
		ON flora_flower.floraLivingCreatureFK = living_creature.lcid
WHERE occurrence_record.date > '{}'
UNION ALL
SELECT observer.name, occurrence_record.date, flora_tree.height AS creatureMeasurements, flora_tree.seasonFound, location.*, species.species FROM occurrence_record NATURAL JOIN
	observes NATURAL JOIN
    living_creature NATURAL JOIN
    observer NATURAL JOIN
    location NATURAL JOIN 
    found_in NATURAL JOIN
    species JOIN
    flora_tree
		ON flora_tree.floraLivingCreatureFK = living_creature.lcid
WHERE occurrence_record.date > '{}'
UNION ALL
SELECT observer.name, occurrence_record.date, flora_mushroom.height AS creatureMeasurements, flora_mushroom.seasonFound, location.*, species.species FROM occurrence_record NATURAL JOIN
	observes NATURAL JOIN
    living_creature NATURAL JOIN
    observer NATURAL JOIN
    location NATURAL JOIN 
    found_in NATURAL JOIN
    species JOIN
    flora_mushroom
		ON flora_mushroom.floraLivingCreatureFK = living_creature.lcid
WHERE occurrence_record.date > "{}"'''

# SELECT all records posted between two dates
betweenDatesRecords = '''SELECT observer.name, occurrence_record.date, fauna_frog.size AS creatureMeasurements, fauna_frog.seasonFound, location.*, species.species FROM occurrence_record NATURAL JOIN
	observes NATURAL JOIN
    living_creature NATURAL JOIN
    observer NATURAL JOIN
    location NATURAL JOIN 
    found_in NATURAL JOIN
    species JOIN
    fauna_frog
		ON fauna_frog.faunaLivingCreatureFK = living_creature.lcid
WHERE occurrence_record.date BETWEEN '{}' AND '{}'
UNION ALL
SELECT observer.name, occurrence_record.date, fauna_fish.size AS creatureMeasurements, fauna_fish.seasonFound, location.*, species.species FROM occurrence_record NATURAL JOIN
    observes NATURAL JOIN
    living_creature NATURAL JOIN
    observer NATURAL JOIN
    location NATURAL JOIN 
    found_in NATURAL JOIN
    species JOIN
    fauna_fish
		ON fauna_fish.faunaLivingCreatureFK = living_creature.lcid
WHERE occurrence_record.date BETWEEN '{}' AND '{}'
UNION ALL
SELECT observer.name, occurrence_record.date, flora_flower.numberOfPetals AS creatureMeasurements, flora_flower.seasonFound, location.*, species.species FROM occurrence_record NATURAL JOIN
	observes NATURAL JOIN
    living_creature NATURAL JOIN
    observer NATURAL JOIN
    location NATURAL JOIN 
    found_in NATURAL JOIN
    species JOIN
    flora_flower
		ON flora_flower.floraLivingCreatureFK = living_creature.lcid
WHERE occurrence_record.date BETWEEN '{}' AND '{}'
UNION ALL
SELECT observer.name, occurrence_record.date, flora_tree.height AS creatureMeasurements, flora_tree.seasonFound, location.*, species.species FROM occurrence_record NATURAL JOIN
	observes NATURAL JOIN
    living_creature NATURAL JOIN
    observer NATURAL JOIN
    location NATURAL JOIN 
    found_in NATURAL JOIN
    species JOIN
    flora_tree
		ON flora_tree.floraLivingCreatureFK = living_creature.lcid
WHERE occurrence_record.date BETWEEN '{}' AND '{}'
UNION ALL
SELECT observer.name, occurrence_record.date, flora_mushroom.height AS creatureMeasurements, flora_mushroom.seasonFound, location.*, species.species FROM occurrence_record NATURAL JOIN
	observes NATURAL JOIN
    living_creature NATURAL JOIN
    observer NATURAL JOIN
    location NATURAL JOIN 
    found_in NATURAL JOIN
    species JOIN
    flora_mushroom
		ON flora_mushroom.floraLivingCreatureFK = living_creature.lcid
WHERE occurrence_record.date BETWEEN '{}' AND "{}"'''

# SELECT all records posted by the current user
thisUser = '''SELECT observer.name, occurrence_record.date, fauna_frog.size AS creatureMeasurements, fauna_frog.seasonFound, location.*, species.species FROM occurrence_record NATURAL JOIN
	observes NATURAL JOIN
    observer NATURAL JOIN
    found_in NATURAL JOIN
    location NATURAL JOIN
    species NATURAL JOIN
    living_creature JOIN
    fauna_frog ON fauna_frog.faunaLivingCreatureFK = living_creature.lcid
    WHERE observes.oid = {}
UNION ALL
SELECT observer.name, occurrence_record.date, fauna_fish.size AS creatureMeasurements, fauna_fish.seasonFound, location.*, species.species FROM occurrence_record NATURAL JOIN
	observes NATURAL JOIN
    observer NATURAL JOIN
    found_in NATURAL JOIN
    location NATURAL JOIN
    species NATURAL JOIN
    living_creature JOIN
    fauna_fish ON fauna_fish.faunaLivingCreatureFK = living_creature.lcid
    WHERE observes.oid = {}
UNION ALL
SELECT observer.name, occurrence_record.date, flora_flower.numberOfPetals AS creatureMeasurements, flora_flower.seasonFound, location.*, species.species FROM occurrence_record NATURAL JOIN
	observes NATURAL JOIN
    observer NATURAL JOIN
    found_in NATURAL JOIN
    location NATURAL JOIN
    species NATURAL JOIN
    living_creature JOIN
    flora_flower ON flora_flower.floraLivingCreatureFK = living_creature.lcid
    WHERE observes.oid = {}
UNION ALL
SELECT observer.name, occurrence_record.date, flora_tree.height AS creatureMeasurements, flora_tree.seasonFound, location.*, species.species FROM occurrence_record NATURAL JOIN
	observes NATURAL JOIN
    observer NATURAL JOIN
    found_in NATURAL JOIN
    location NATURAL JOIN
    species NATURAL JOIN
    living_creature JOIN
    flora_tree ON flora_tree.floraLivingCreatureFK = living_creature.lcid
    WHERE observes.oid = {}
UNION ALL
SELECT observer.name, occurrence_record.date, flora_mushroom.height AS creatureMeasurements, flora_mushroom.seasonFound, location.*, species.species FROM occurrence_record NATURAL JOIN
	observes NATURAL JOIN
    observer NATURAL JOIN
    found_in NATURAL JOIN
    location NATURAL JOIN
    species NATURAL JOIN
    living_creature JOIN
    flora_mushroom ON flora_mushroom.floraLivingCreatureFK = living_creature.lcid
    WHERE observes.oid = {}'''