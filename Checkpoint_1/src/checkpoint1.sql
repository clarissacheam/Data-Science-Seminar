-- CREATING TEMPORARY INSTANCES REQUIRED FOR QUESTIONS 1 AND 2
-- table will hold neighborhood, category of complaint, date of complaint
-- this will provide insight on what complaint happened in which neighborhood
-- and when did the investigation close

DROP TABLE IF EXISTS temp_ncd_data;
CREATE TEMP TABLE temp_ncd_data AS(
    (
        select crid,name, da.incident_date, dac.category from data_area d, data_allegation_areas daa, data_allegation da, data_allegationcategory dac
where da.most_common_category_id=dac.id and da.crid = daa.allegation_id and daa.area_id = d.id and d.area_type like 'neigh%' order by area_id
    )
);

-- table will hold all records from temp_ncd_data pre-copa
-- ie. neighborhood, category of complaint of all records from before September 15

DROP TABLE IF EXISTS pre_copa;
CREATE TEMP TABLE pre_copa AS(
    select name, category from temp_ncd_data where incident_date < '2017-09-15'
);

--table will hold all records from temp_ncd_data post-copa
-- ie. neighborhood, category of complaint of all records from after September 15

DROP TABLE IF EXISTS post_copa;
CREATE TEMP TABLE post_copa AS(
    SELECT name,category FROM temp_ncd_data WHERE incident_date >= '2017-09-15'
);

-- table will hold all records from pre-copa grouped by neighborhood
-- and category with counts of each category

DROP TABLE IF EXISTS nccprec;
CREATE TEMP TABLE nccprec AS(
    SELECT name, category, count(category) count_pre_copa
FROM pre_copa GROUP BY category, name
);

-- table will hold all records from post-copa grouped by neighborhood
-- and category with counts of each category

DROP TABLE IF EXISTS nccpostc;
CREATE TEMP TABLE nccpostc AS(
    SELECT name, category, count(category) count_post_copa
FROM post_copa GROUP BY  name,category
);

-- REQUIRED TEMPORARY INSTANCES CREATED

-- QUESTION 1
-- What are the top 3 complaints in each neighborhood before COPA?
WITH cte AS
  ( SELECT name, category,
           ROW_NUMBER() OVER (PARTITION BY name
                              ORDER BY count_pre_copa DESC
                             )
             AS rn
    FROM nccprec
  )
SELECT name, category
FROM cte
WHERE rn <= 3
ORDER BY name, rn ;

-- QUESTION 1 ENDS

-- QUESTION 2
-- What are the top 3 complaints in each neighborhood after COPA?
WITH cte AS
  ( SELECT name, category,
           ROW_NUMBER() OVER (PARTITION BY name
                              ORDER BY count_post_copa DESC
                             )
             AS rn
    FROM nccpostc
  )
SELECT name, category
FROM cte
WHERE rn <= 3
ORDER BY name, rn ;

--QUESTION 2 ENDS

-- QUESTION 3
-- For all officers that had sustained allegations, what were the disciplinary action taken
-- Join tables data_officer, data_officerallegation and data_allegationcategory on officer id
-- and allegation category id

SELECT d_o.id,d_o.first_name,d_o.last_name, dac.category, dac.allegation_name, doa.final_outcome
FROM data_officer d_o,data_officerallegation doa, data_allegationcategory dac
WHERE d_o.sustained_count>0 AND doa.officer_id=d_o.id AND doa.allegation_category_id=dac.id ORDER BY d_o.id;

-- QUESTION 3 ENDS

-- CREATING TEMPORARY INSTANCES REQUIRED FOR QUESTIONS 4

-- this table allegation_findings
-- has data on category, end date of findings of all sustained allegation
DROP TABLE IF EXISTS  allegation_findings;
CREATE TEMP TABLE allegation_findings AS (
  SELECT dac.category, doa.end_date, doa.final_finding
  FROM data_officerallegation doa, data_allegationcategory dac
  WHERE DOA.final_finding LIKE 'SU' AND dac.id=doa.allegation_category_id
  ORDER BY category
);

-- from allegation_findings
-- create table precopa_allegation_findings
-- get all records pre_copa

DROP TABLE IF EXISTS precopa_allegation_findings;
CREATE TEMP TABLE precopa_allegation_findings AS (
    SELECT *
    FROM allegation_findings
    WHERE end_date < '2017-09-15'
);

-- from allegation_findings
-- create postcopa_allegation_findings
-- get all records post_copa

DROP TABLE IF EXISTS postcopa_allegation_findings;
CREATE TEMP TABLE postcopa_allegation_findings AS(
    SELECT *
    FROM allegation_findings
    WHERE end_date >= '2017-09-15'
);

-- from precopa_allegation_findings
-- create prefindings
-- to get the count of all sustained allegations
-- per category, pre copa

DROP TABLE IF EXISTS prefindings;
CREATE TEMP TABLE prefindings AS (
  SELECT category, count(final_finding) precopa
    FROM precopa_allegation_findings GROUP BY category
);

-- from postcopa_allegation_findings
-- create postfindings
-- to get the count of all sustained allegations
-- per category, post copa

DROP TABLE IF EXISTS postfindings;
CREATE TEMP TABLE postfindings AS(
SELECT category, count(final_finding) postcopa
FROM postcopa_allegation_findings GROUP BY category
);

-- REQUIRED TEMPORARY INSTANCES CREATED

-- QUESTION 4
-- For each type of allegation, how many were sustained before copa and after copa
-- 49.9 years pre-copa, 0.78 years post-copa
SELECT prefindings.category, precopa/49.9 as pre_copa_allegations_per_year, postcopa/0.78 pre_copa_allegations_per_year
FROM prefindings,postfindings
WHERE prefindings.category=postfindings.category;

-- QUESTION 4 ENDS
