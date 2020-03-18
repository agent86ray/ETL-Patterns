/*
	SCRIPT: TEST_EXTRACT_AND_LOAD_TO_STAGING.sql
*/
USE [pubs_staging]
GO

-- Extract and load to staging
EXEC [dbo].[MERGE_PUBLISHERS];

-- See all rows loaded
SELECT * FROM [dbo].[publishers];

-- simulate changes to publishers
-- in the source database

-- do insert in [pubs]
INSERT [pubs].[dbo].[publishers] (
	pub_id
,	pub_name
,	city
,	state
,	country
,	LAST_MODIFIED	
) 
VALUES (
	'9902'
,	'Bond Publishers'
,	'New Orleans'
,	'LA'
,	'USA'
,	'20200302'	
);

-- do update in [pubs]
UPDATE [pubs].[dbo].[publishers]
SET
	city = 'Irving'
,	LAST_MODIFIED = '20200302'
WHERE pub_id = 1756;

-- Execute the CREATE_DATABASE_SNAPSHOT.sql
-- to drop and recreate the database snapshot

-- Extract and load to staging
EXEC [dbo].[MERGE_PUBLISHERS];

-- See all rows loaded
SELECT * FROM [dbo].[publishers];

