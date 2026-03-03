-- ============================================
-- Step 2: RAW Layer — Table Creation
-- Dates loaded as VARCHAR intentionally
-- to avoid load failures (cast in CLEAN layer)
-- ============================================

USE WAREHOUSE HEALTHCARE_WH;
USE DATABASE HEALTHCARE_DB;
USE SCHEMA RAW;

CREATE OR REPLACE TABLE HEALTHCARE_DB.RAW.PATIENT_ADMISSIONS (
    NAME                VARCHAR(100),
    AGE                 INT,
    GENDER              VARCHAR(10),
    BLOOD_TYPE          VARCHAR(5),
    MEDICAL_CONDITION   VARCHAR(100),
    DATE_OF_ADMISSION   VARCHAR(20),
    DOCTOR              VARCHAR(100),
    HOSPITAL            VARCHAR(150),
    INSURANCE_PROVIDER  VARCHAR(100),
    BILLING_AMOUNT      FLOAT,
    ROOM_NUMBER         INT,
    ADMISSION_TYPE      VARCHAR(50),
    DISCHARGE_DATE      VARCHAR(20),
    MEDICATION          VARCHAR(100),
    TEST_RESULTS        VARCHAR(50)
);
