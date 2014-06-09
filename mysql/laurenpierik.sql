CLEARcdUSE mydb.sql;
INSERT INTO PROFILE (USERNAME,FIRST_NAME,LAST_NAME,CURR_TITLE,RECENT_JOBS,SUMMARY)
VALUES('laurenpierik','Lauren','Pierik','Field Representative','US Census Bureau','Summary');

INSERT INTO EXPERIENCE (SEQ,USERNAME,COMPANY,JOB_TITLE,START_DATE,END_DATE,DESCRIPTION)
VALUES('2','laurenpierik','Gap Inc./Old Navy Flagship Store','Sales Associate','2014-11-01',NULL,'Description');

INSERT INTO EXPERIENCE (SEQ,USERNAME,COMPANY,JOB_TITLE,START_DATE,END_DATE,DESCRIPTION)
VALUES('1','laurenpierik','U.S Census Bureau','Field Representative','2012-08-01',NULL,'Description');

UPDATE PROFILE
SET SUMMARY='Master of Public Health, U C Berkeley, concentration in Statistics and Epidemiology. Current trainee, Tekmeca Cloud Computing Academy programming boot camp.
I have 15 years experience in government service, salesmanship, data collecting/reporting, interviewing, training, communication. 6 years concurrent experience in retail sales and operations for Gap, Inc. Duty stations include New York and Northern California.
'
WHERE SUMMARY='Summary';

UPDATE PROFILE
SET USERNAME='laurenpierik', FIRST_NAME='Lauren', LAST_NAME='pierik', CURR_TITLE='Field Representative' RECENT_JOBS='US Census Bureau' SUMMARY='Master of Public Health, U C Berkeley, concentration in Statistics and Epidemiology. Current trainee, Tekmeca Cloud Computing Academy programming boot camp.


UPDATE EXPERIENCE 
SET START_DATE='2012-11-01' WHERE START_DATE='2014-11-01';

UPDATE EXPERIENCE
SET DESCRIPTION='I collect economic and statistical data for government agencies on a wide variety of activities and commodities. I monitor and report construction activity and market absorption in the Bay Area. I routinely handle sensitive and confidential information. Excellent interpersonal skills are required to establish rapport with individuals from a variety of demographic backgrounds. I employ changing technological tools and software. I independently manage my time and assignments to meet deadlines.
'
WHERE SEQ='1';

