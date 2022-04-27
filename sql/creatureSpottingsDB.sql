DROP DATABASE IF EXISTS creature_spottings;
CREATE DATABASE creature_spottings;
USE creature_spottings;

DROP TABLE IF EXISTS species;
CREATE TABLE species (
speciesKey INT PRIMARY KEY AUTO_INCREMENT,
kingdom VARCHAR(30) NOT NULL,
phylum VARCHAR(30) NOT NULL,
class VARCHAR(30) NOT NULL,
speciesOrder VARCHAR(30) NOT NULL,
family VARCHAR(30) NOT NULL,
genus VARCHAR(30) NOT NULL,
species VARCHAR(30) UNIQUE NOT NULL
);

DROP TABLE IF EXISTS living_creature;
CREATE TABLE living_creature (
  lcid INT PRIMARY KEY AUTO_INCREMENT,
  pictureUrl VARCHAR(255) UNIQUE NOT NULL,
  speciesKey INT,
  UNIQUE KEY (lcid),
  FOREIGN KEY (speciesKey) REFERENCES species(speciesKey) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS flora_mushroom;
CREATE TABLE flora_mushroom (
  mid INT PRIMARY KEY AUTO_INCREMENT,
  height INT NOT NULL,
  seasonFound VARCHAR(25),
  floraLivingCreatureFK INT NOT NULL,
  UNIQUE KEY (mid),
  FOREIGN KEY (floraLivingCreatureFK) REFERENCES living_creature(lcid) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS flora_flower;
CREATE TABLE flora_flower (
  flid INT PRIMARY KEY AUTO_INCREMENT,
  numberOfPetals INT,
  seasonFound VARCHAR(25),
  floraLivingCreatureFK INT NOT NULL,
  UNIQUE KEY (flid),
  FOREIGN KEY (floraLivingCreatureFK) REFERENCES living_creature(lcid) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS flora_tree;
CREATE TABLE flora_tree (
  tid INT PRIMARY KEY AUTO_INCREMENT,
  height INT NOT NULL,
  seasonFound VARCHAR(25),
  floraLivingCreatureFK INT NOT NULL,
  UNIQUE KEY (tid),
  FOREIGN KEY (floraLivingCreatureFK) REFERENCES living_creature(lcid) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS fauna_frog;
CREATE TABLE fauna_frog (
  frid INT PRIMARY KEY AUTO_INCREMENT,
  size INT NOT NULL,
  seasonFound VARCHAR(25),
  faunaLivingCreatureFK INT NOT NULL,
  UNIQUE KEY (frid),
  FOREIGN KEY (faunaLivingCreatureFK) REFERENCES living_creature(lcid) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS fauna_fish;
CREATE TABLE fauna_fish (
  fiid INT PRIMARY KEY AUTO_INCREMENT,
  size INT NOT NULL,
  seasonFound VARCHAR(25),
  faunaLivingCreatureFK INT NOT NULL,
  UNIQUE KEY (fiid),
  FOREIGN KEY (faunaLivingCreatureFK) REFERENCES living_creature(lcid) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS occurrence_record;
CREATE TABLE occurrence_record (
ocid INT PRIMARY KEY AUTO_INCREMENT,
basisOfRecord VARCHAR(100) NOT NULL,
date DATE NOT NULL,
confirmCode VARCHAR(10) UNIQUE NOT NULL
);

DROP TABLE IF EXISTS research_group;
CREATE TABLE research_group (
rgid INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(64) UNIQUE NOT NULL
);

DROP TABLE IF EXISTS institution;
CREATE TABLE institution (
institutionCode VARCHAR(30) PRIMARY KEY
);

DROP TABLE IF EXISTS observer;
CREATE TABLE observer (
oid INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(64) UNIQUE NOT NULL,
institution VARCHAR(30),
rgid INT,
FOREIGN KEY (institution) REFERENCES institution(institutionCode) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (rgid) REFERENCES research_group(rgid) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS location;
CREATE TABLE location (
stateProvince VARCHAR(30),
countryCode VARCHAR(2),
locality VARCHAR(64),
PRIMARY KEY (stateProvince, countryCode, locality)
);

DROP TABLE IF EXISTS observes;
CREATE TABLE observes (
  ocid INT,
  oid INT,
  lcid INT,
  PRIMARY KEY(ocid, oid, lcid),
  FOREIGN KEY (ocid) REFERENCES occurrence_record(ocid) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (oid) REFERENCES observer(oid) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (lcid) REFERENCES living_creature(lcid) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS found_in;
CREATE TABLE found_in (
  lcid INT,
  stateProvince VARCHAR(30),
  countryCode VARCHAR(2),
  locality VARCHAR(64),
  PRIMARY KEY (lcid, stateProvince, countryCode, locality),
  FOREIGN KEY (lcid) REFERENCES living_creature(lcid) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (stateProvince, countryCode, locality) REFERENCES location(stateProvince, countryCode, locality) ON UPDATE CASCADE ON DELETE CASCADE
);
