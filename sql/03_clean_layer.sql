-- ============================================
-- Step 3: CLEAN Layer — Transformations
-- Fixes: data types, casing, nulls
-- Adds: AGE_GROUP, LENGTH_OF_STAY_DAYS, 
--       BILLING_BAND, date parts
-- ============================================

USE WAREHOUSE HEALTHCARE_WH;
USE DATABASE HEALTHCARE_DB;
USE SCHEMA CLEAN;

CREATE OR REPLACE TABLE HEALTHCARE_DB.CLEAN.PATIENT_ADMISSIONS AS
SELECT
    INITCAP(NAME)                                           AS PATIENT_NAME,
    AGE,
    CASE 
        WHEN AGE BETWEEN 0  AND 17 THEN 'Child (0-17)'
        WHEN AGE BETWEEN 18 AND 35 THEN 'Young Adult (18-35)'
        WHEN AGE BETWEEN 36 AND 55 THEN 'Middle Aged (36-55)'
        WHEN AGE BETWEEN 56 AND 70 THEN 'Senior (56-70)'
        ELSE 'Elderly (71+)'
    END                                                     AS AGE_GROUP,
    INITCAP(GENDER)                                         AS GENDER,
    BLOOD_TYPE,
    INITCAP(MEDICAL_CONDITION)                              AS MEDICAL_CONDITION,
    TRY_TO_DATE(DATE_OF_ADMISSION, 'YYYY-MM-DD')            AS ADMISSION_DATE,
    TRY_TO_DATE(DISCHARGE_DATE, 'YYYY-MM-DD')               AS DISCHARGE_DATE,
    DATEDIFF('day', 
        TRY_TO_DATE(DATE_OF_ADMISSION, 'YYYY-MM-DD'),
        TRY_TO_DATE(DISCHARGE_DATE, 'YYYY-MM-DD')
    )                                                       AS LENGTH_OF_STAY_DAYS,
    YEAR(TRY_TO_DATE(DATE_OF_ADMISSION, 'YYYY-MM-DD'))      AS ADMISSION_YEAR,
    MONTH(TRY_TO_DATE(DATE_OF_ADMISSION, 'YYYY-MM-DD'))     AS ADMISSION_MONTH,
    MONTHNAME(TRY_TO_DATE(DATE_OF_ADMISSION, 'YYYY-MM-DD')) AS ADMISSION_MONTH_NAME,
    INITCAP(DOCTOR)                                         AS DOCTOR_NAME,
    INITCAP(HOSPITAL)                                       AS HOSPITAL_NAME,
    INITCAP(INSURANCE_PROVIDER)                             AS INSURANCE_PROVIDER,
    ROUND(BILLING_AMOUNT, 2)                                AS BILLING_AMOUNT,
    CASE
        WHEN BILLING_AMOUNT < 10000  THEN 'Low (<$10K)'
        WHEN BILLING_AMOUNT < 25000  THEN 'Medium ($10K-$25K)'
        WHEN BILLING_AMOUNT < 40000  THEN 'High ($25K-$40K)'
        ELSE 'Very High (>$40K)'
    END                                                     AS BILLING_BAND,
    ROOM_NUMBER,
    INITCAP(ADMISSION_TYPE)                                 AS ADMISSION_TYPE,
    INITCAP(MEDICATION)                                     AS MEDICATION,
    INITCAP(TEST_RESULTS)                                   AS TEST_RESULTS
FROM HEALTHCARE_DB.RAW.PATIENT_ADMISSIONS
WHERE NAME IS NOT NULL;
