USE creature_spottings;

DROP PROCEDURE IF EXISTS insert_observer;
DELIMITER $$
CREATE PROCEDURE insert_observer(name VARCHAR(64), institution VARCHAR(30), rgid INT)
BEGIN
	INSERT INTO observer (name, institution, rgid) VALUES (name, institution, rgid);
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS insert_occurrence_record;
DELIMITER $$
CREATE PROCEDURE insert_occurrence_record(basisOfRecord varchar(100), date date, confirmCode varchar(10))
BEGIN
	INSERT INTO occurrence_record(basisOfRecord, date, confirmCode) 
	VALUES (basisOfRecord, date, confirmCode);
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS insert_living_creature;
DELIMITER $$
CREATE PROCEDURE insert_living_creature(pictureURL VARCHAR(255), speciesKey INT)
BEGIN
	INSERT INTO living_creature (pictureURL, speciesKey) VALUES (pictureURL, speciesKey);
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS insert_observes;
DELIMITER $$
CREATE PROCEDURE insert_observes(ocid_n int, oid_n int, lcid_n int)
BEGIN
	INSERT INTO observes (ocid, oid, lcid) VALUES (ocid_n, oid_n, lcid_n);
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS insert_found_in;
DELIMITER $$
CREATE PROCEDURE insert_found_in(lcid_n int, sp_n VARCHAR(30), c_n VARCHAR(2), l_n VARCHAR(64))
BEGIN
	INSERT INTO found_in (lcid, stateProvince, countryCode, locality) VALUES (lcid_n, sp_n, c_n, l_n);
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS insert_location;
DELIMITER $$
CREATE PROCEDURE insert_location(stateProvince_new VARCHAR(30), countryCode_new VARCHAR(2), locality_new VARCHAR(64))
BEGIN

	-- If the given location does not exist in location table yet, insert a record
    IF NOT EXISTS (SELECT * FROM location WHERE location.stateProvince = stateProvince_new 
					AND location.countryCode = countryCode_new
					AND location.locality = locality_new) THEN
 		INSERT INTO location (stateProvince, countryCode, locality) VALUES (stateProvince_new, countryCode_new, locality_new);
	END IF;
    
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS insert_flower;
DELIMITER $$
CREATE PROCEDURE insert_flower(numberOfPetals int, seasonFound varchar(25), floraLivingCreatureFK int)
BEGIN
	INSERT INTO flora_flower (numberOfPetals, seasonFound, floraLivingCreatureFK) 
	VALUES (numberOfPetals, seasonFound, floraLivingCreatureFK);
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS insert_tree;
DELIMITER $$
CREATE PROCEDURE insert_tree(height int, seasonFound varchar(25), floraLivingCreatureFK int)
BEGIN
	INSERT INTO flora_tree (height, seasonFound, floraLivingCreatureFK)
	VALUES (height, seasonFound, floraLivingCreatureFK);
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS insert_mushroom;
DELIMITER $$
CREATE PROCEDURE insert_mushroom(height int, seasonFound varchar(25), floraLivingCreatureFK int)
BEGIN
	INSERT INTO flora_mushroom (height, seasonFound, floraLivingCreatureFK)
	VALUES (height, seasonFound, floraLivingCreatureFK);
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS insert_fish;
DELIMITER $$
CREATE PROCEDURE insert_fish(size int, seasonFound varchar(25), faunaLivingCreatureFK int)
BEGIN
	INSERT INTO fauna_fish (size, seasonFound, faunaLivingCreatureFK)
	VALUES (size, seasonFound, faunaLivingCreatureFK);
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS insert_frog;
DELIMITER $$
CREATE PROCEDURE insert_frog(size int, seasonFound varchar(25), faunaLivingCreatureFK int)
BEGIN
	INSERT INTO fauna_frog (size, seasonFound, faunaLivingCreatureFK)
	VALUES (size, seasonFound, faunaLivingCreatureFK);
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS delete_occurrence_record;
DELIMITER $$
CREATE PROCEDURE delete_occurrence_record(ocid_n int)
BEGIN
	DELETE FROM occurrence_record WHERE ocid = ocid_n;
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS pre_delete_record;
DELIMITER $$
CREATE TRIGGER pre_delete_record
	BEFORE DELETE ON occurrence_record FOR EACH ROW
	BEGIN
		DECLARE old_lcid INT;
		DECLARE old_url VARCHAR(255);
		SELECT lcid INTO old_lcid FROM observes WHERE ocid = OLD.ocid;

		-- DELETE found_in
		DELETE FROM found_in WHERE lcid = old_lcid;

		-- DELETE subclasses
		DELETE FROM fauna_frog WHERE faunaLivingCreatureFK = old_lcid;
		DELETE FROM fauna_fish WHERE faunaLivingCreatureFK = old_lcid;
		DELETE FROM flora_flower WHERE floraLivingCreatureFK = old_lcid;
		DELETE FROM flora_mushroom WHERE floraLivingCreatureFK = old_lcid;
		DELETE FROM flora_tree WHERE floraLivingCreatureFK = old_lcid;

		-- DELETE observes
		SELECT pictureURL INTO old_url FROM living_creature WHERE lcid = old_lcid;
		DELETE FROM observes WHERE lcid = old_lcid;

		-- DELETE living_creature (this does not work)
		DELETE FROM living_creature WHERE NOT EXISTS (SELECT * FROM observes WHERE lcid = old_lcid) AND lcid = old_lcid;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS update_date;
DELIMITER $$
CREATE PROCEDURE update_date(d date, code VARCHAR(10))
BEGIN
	UPDATE occurrence_record
	SET date = d
	WHERE confirmCode = code;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS update_url;
DELIMITER $$
CREATE PROCEDURE update_url(url VARCHAR(255), code VARCHAR(10))
BEGIN
	UPDATE living_creature
	SET pictureURL = url
	WHERE lcid = (
		SELECT lcid FROM observes 
		WHERE ocid = (SELECT ocid FROM occurrence_record WHERE confirmCode = code));
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS update_location;
DELIMITER $$
CREATE PROCEDURE update_location(sp VARCHAR(30), c VARCHAR(2), l VARCHAR(64), code VARCHAR(10))
BEGIN
	UPDATE found_in
	SET stateProvince = sp, countryCode = c, locality = l
	WHERE lcid = (
		SELECT lcid FROM observes 
		WHERE ocid = (SELECT ocid FROM occurrence_record WHERE confirmCode = code));
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS pre_update_location;
DELIMITER $$
CREATE TRIGGER pre_update_location
BEFORE UPDATE ON found_in FOR EACH ROW
BEGIN
	CALL insert_location(NEW.stateProvince, NEW.countryCode, NEW.locality);
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS update_frogSzn;
DELIMITER $$
CREATE PROCEDURE update_frogSzn(szn VARCHAR(25), code VARCHAR(10))
BEGIN
	UPDATE fauna_frog
	SET seasonFound = szn
	WHERE faunaLivingCreatureFK = (
		SELECT lcid FROM observes 
		WHERE ocid = (SELECT ocid FROM occurrence_record WHERE confirmCode = code));
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS update_frogLength;
DELIMITER $$
CREATE PROCEDURE update_frogLength(l INT, code VARCHAR(10))
BEGIN
	UPDATE fauna_frog
	SET size = l
	WHERE faunaLivingCreatureFK = (
		SELECT lcid FROM observes 
		WHERE ocid = (SELECT ocid FROM occurrence_record WHERE confirmCode = code));
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS update_fishSzn;
DELIMITER $$
CREATE PROCEDURE update_fishSzn(szn VARCHAR(25), code VARCHAR(10))
BEGIN
	UPDATE fauna_fish
	SET seasonFound = szn
	WHERE faunaLivingCreatureFK = (
		SELECT lcid FROM observes 
		WHERE ocid = (SELECT ocid FROM occurrence_record WHERE confirmCode = code));
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS update_fishLength;
DELIMITER $$
CREATE PROCEDURE update_fishLength(l INT, code VARCHAR(10))
BEGIN
	UPDATE fauna_fish
	SET size = l
	WHERE faunaLivingCreatureFK = (
		SELECT lcid FROM observes 
		WHERE ocid = (SELECT ocid FROM occurrence_record WHERE confirmCode = code));
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS update_flowerSzn;
DELIMITER $$
CREATE PROCEDURE update_flowerSzn(szn VARCHAR(25), code VARCHAR(10))
BEGIN
	UPDATE flora_flower
	SET seasonFound = szn
	WHERE floraLivingCreatureFK = (
		SELECT lcid FROM observes 
		WHERE ocid = (SELECT ocid FROM occurrence_record WHERE confirmCode = code));
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS update_flowerPetals;
DELIMITER $$
CREATE PROCEDURE update_flowerPetals(p INT, code VARCHAR(10))
BEGIN
	UPDATE flora_flower
	SET numberOfPetals = p
	WHERE floraLivingCreatureFK = (
		SELECT lcid FROM observes 
		WHERE ocid = (SELECT ocid FROM occurrence_record WHERE confirmCode = code));
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS update_mushroomSzn;
DELIMITER $$
CREATE PROCEDURE update_mushroomSzn(szn VARCHAR(25), code VARCHAR(10))
BEGIN
	UPDATE flora_mushroom
	SET seasonFound = szn
	WHERE floraLivingCreatureFK = (
		SELECT lcid FROM observes 
		WHERE ocid = (SELECT ocid FROM occurrence_record WHERE confirmCode = code));
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS update_mushroomHeight;
DELIMITER $$
CREATE PROCEDURE update_mushroomHeight(h INT, code VARCHAR(10))
BEGIN
	UPDATE flora_mushroom
	SET height = h
	WHERE floraLivingCreatureFK = (
		SELECT lcid FROM observes 
		WHERE ocid = (SELECT ocid FROM occurrence_record WHERE confirmCode = code));
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS update_treeSzn;
DELIMITER $$
CREATE PROCEDURE update_treeSzn(szn VARCHAR(25), code VARCHAR(10))
BEGIN
	UPDATE flora_tree
	SET seasonFound = szn
	WHERE floraLivingCreatureFK = (
		SELECT lcid FROM observes 
		WHERE ocid = (SELECT ocid FROM occurrence_record WHERE confirmCode = code));
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS update_treeHeight;
DELIMITER $$
CREATE PROCEDURE update_treeHeight(h INT, code VARCHAR(10))
BEGIN
	UPDATE flora_tree
	SET height = h
	WHERE floraLivingCreatureFK = (
		SELECT lcid FROM observes 
		WHERE ocid = (SELECT ocid FROM occurrence_record WHERE confirmCode = code));
END$$
DELIMITER ;