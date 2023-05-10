-- MySQL Script generated by MySQL Workbench
-- Wed 08 Mar 2023 07:24:40 PM CET
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema cbioportal
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cbioportal
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS `cbioportal` ;
USE `cbioportal` ;


-- -----------------------------------------------------
-- Table `cbioportal`.`mutation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cbioportal`.`genomic_event` ;

CREATE TABLE IF NOT EXISTS `cbioportal`.`genomic_event` (
   `sample_unique_id` VARCHAR(45),
   `variant` VARCHAR(45),
   `hugo_gene_symbol` VARCHAR(45),
   `gene_panel_stable_id` VARCHAR(45),
   `cancer_study_identifier` VARCHAR(45),
   `genetic_profile_stable_id` VARCHAR(45))
ENGINE = MergeTree
ORDER BY (`sample_unique_id`, `variant`, `hugo_gene_symbol`, `cancer_study_identifier`, `genetic_profile_stable_id`)
PRIMARY KEY (`sample_unique_id`, `variant`, `hugo_gene_symbol`, `cancer_study_identifier`, `genetic_profile_stable_id`);

-- -----------------------------------------------------
-- Table `cbioportal`.`mutation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cbioportal`.`mutation` ;

CREATE TABLE IF NOT EXISTS `cbioportal`.`mutation` (
  `sample_unique_id` VARCHAR(45),
  `variant` VARCHAR(45),
  `hugo_gene_symbol` VARCHAR(45),
  `gene_panel_stable_id` VARCHAR(45),
  `cancer_study_identifier` VARCHAR(45),
  `genetic_profile_stable_id` VARCHAR(45))
ENGINE = MergeTree
ORDER BY (`sample_unique_id`, `variant`, `hugo_gene_symbol`, `cancer_study_identifier`)
PRIMARY KEY (`sample_unique_id`, `variant`, `hugo_gene_symbol`, `cancer_study_identifier`);

-- -----------------------------------------------------
-- Table `cbioportal`.`structural_variant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cbioportal`.`structural_variant` ;

CREATE TABLE IF NOT EXISTS `cbioportal`.`structural_variant` (
  `sample_unique_id` VARCHAR(45),
  `hugo_symbol_gene1` VARCHAR(45),
  `hugo_symbol_gene2` VARCHAR(45),
  `gene_panel_stable_id` VARCHAR(45),
  `cancer_study_identifier` VARCHAR(45),
  `genetic_profile_stable_id` VARCHAR(45))
ENGINE = MergeTree
ORDER BY (`sample_unique_id`, `hugo_symbol_gene1`, `hugo_symbol_gene2`, `cancer_study_identifier`)
PRIMARY KEY (`sample_unique_id`, `hugo_symbol_gene1`, `hugo_symbol_gene2`, `cancer_study_identifier`);

-- -----------------------------------------------------
-- Table `cbioportal`.`cna_discrete`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cbioportal`.`cna_discrete` ;

CREATE TABLE IF NOT EXISTS `cbioportal`.`cna_discrete` (
  `sample_unique_id` VARCHAR(45),
  `alteration` INT,
  `hugo_gene_symbol` VARCHAR(45),
  `gene_panel_stable_id` VARCHAR(45),
  `cancer_study_identifier` VARCHAR(45),
  `genetic_profile_stable_id` VARCHAR(45))
ENGINE = MergeTree
ORDER BY (`sample_unique_id`, `alteration`, `hugo_gene_symbol`, `cancer_study_identifier`)
PRIMARY KEY (`sample_unique_id`, `alteration`, `hugo_gene_symbol`, `cancer_study_identifier`);


-- -----------------------------------------------------
-- Table `cbioportal`.`sample_clinical_attribute_numeric`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cbioportal`.`sample_clinical_attribute_numeric` ;

CREATE TABLE IF NOT EXISTS `cbioportal`.`sample_clinical_attribute_numeric` (
  `patient_unique_id` VARCHAR(45),
  `sample_unique_id` VARCHAR(45),
  `attribute_name` VARCHAR(45),
  `attribute_value` FLOAT,
  `cancer_study_identifier` VARCHAR(45))
ENGINE = MergeTree
ORDER BY (patient_unique_id, sample_unique_id, attribute_name, attribute_value, cancer_study_identifier)
PRIMARY KEY (patient_unique_id, sample_unique_id, attribute_name, attribute_value, cancer_study_identifier);


-- -----------------------------------------------------
-- Table `cbioportal`.`sample_clinical_attribute_categorical`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cbioportal`.`sample_clinical_attribute_categorical` ;

CREATE TABLE IF NOT EXISTS `cbioportal`.`sample_clinical_attribute_categorical` (
  `patient_unique_id` VARCHAR(45),
  `sample_unique_id` VARCHAR(45),
  `attribute_name` VARCHAR(45),
  `attribute_value` VARCHAR(45),
  `cancer_study_identifier` VARCHAR(45))
ENGINE = MergeTree
ORDER BY (patient_unique_id, sample_unique_id, attribute_name, attribute_value, cancer_study_identifier)
PRIMARY KEY (patient_unique_id, sample_unique_id, attribute_name, attribute_value, cancer_study_identifier);


-- -----------------------------------------------------
-- Table `cbioportal`.`patient_clinical_attribute_categorical`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cbioportal`.`patient_clinical_attribute_categorical` ;

CREATE TABLE IF NOT EXISTS `cbioportal`.`patient_clinical_attribute_categorical` (
  `patient_unique_id` VARCHAR(45),
  `attribute_name` VARCHAR(45),
  `attribute_value` VARCHAR(45),
  `cancer_study_identifier` VARCHAR(45))
ENGINE = MergeTree
ORDER BY (patient_unique_id, attribute_name, attribute_value, cancer_study_identifier)
PRIMARY KEY (patient_unique_id, attribute_name, attribute_value, cancer_study_identifier);

-- -----------------------------------------------------
-- Table `cbioportal`.`patient_clinical_attribute_numeric`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cbioportal`.`patient_clinical_attribute_numeric` ;

CREATE TABLE IF NOT EXISTS `cbioportal`.`patient_clinical_attribute_numeric` (
  `patient_unique_id` VARCHAR(45),
  `attribute_name` VARCHAR(45),
  `attribute_value` FLOAT,
  `cancer_study_identifier` VARCHAR(45))
ENGINE = MergeTree
ORDER BY (patient_unique_id, attribute_name, attribute_value, cancer_study_identifier)
PRIMARY KEY (patient_unique_id, attribute_name, attribute_value, cancer_study_identifier);


-- -----------------------------------------------------
-- Table `cbioportal`.`genetic_profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cbioportal`.`genetic_profile` ;

CREATE TABLE IF NOT EXISTS `cbioportal`.`genetic_profile` (
  `sample_unique_id` VARCHAR(45),
  `genetic_alteration_type` VARCHAR(45),
  `datatype` VARCHAR(45),
  `value` VARCHAR(45),
  `cancer_study_identifier` VARCHAR(45))
ENGINE = MergeTree
ORDER BY (sample_unique_id, genetic_alteration_type, datatype, value, cancer_study_identifier)
PRIMARY KEY (sample_unique_id, genetic_alteration_type, datatype, value, cancer_study_identifier);


-- -----------------------------------------------------
-- Table `cbioportal`.`sample_list`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cbioportal`.`sample_list` ;

CREATE TABLE IF NOT EXISTS `cbioportal`.`sample_list` (
  `sample_unique_id` VARCHAR(45),
  `sample_list_stable_id` VARCHAR(45),
  `name` VARCHAR(45),
  `cancer_study_identifier` VARCHAR(45))
ENGINE = MergeTree
ORDER BY (sample_unique_id, sample_list_stable_id, `name`, cancer_study_identifier)
PRIMARY KEY (sample_unique_id, sample_list_stable_id, `name`, cancer_study_identifier);


-- -----------------------------------------------------
-- Table `cbioportal`.`sample`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cbioportal`.`sample` ;

CREATE TABLE IF NOT EXISTS `cbioportal`.`sample` (
   `sample_unique_id` VARCHAR(45),
   `sample_stable_id` VARCHAR(45),
   `patient_unique_id` VARCHAR(45),
   `patient_stable_id` VARCHAR(45),
   `cancer_study_identifier` VARCHAR(45))
ENGINE = MergeTree
ORDER BY (sample_unique_id, patient_unique_id, cancer_study_identifier)
PRIMARY KEY (sample_unique_id, patient_unique_id, cancer_study_identifier);

-- -----------------------------------------------------
-- Table `cbioportal`.`genetic_profile_counts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cbioportal`.`genetic_profile_counts` ;

CREATE TABLE IF NOT EXISTS `cbioportal`.`genetic_profile_counts` (
  `sample_unique_id` VARCHAR(45),
  `profile_name` VARCHAR(45),
  `genetic_profile_stable_id` VARCHAR(45),
  `cancer_study_identifier` VARCHAR(45),
  `count` INT)
ENGINE = MergeTree
ORDER BY (sample_unique_id, genetic_profile_stable_id, cancer_study_identifier)
PARTITION BY cancer_study_identifier;
