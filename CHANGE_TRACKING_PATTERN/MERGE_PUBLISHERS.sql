USE [pubs_staging]
GO

CREATE PROCEDURE [dbo].[MERGE_PUBLISHERS]
AS
BEGIN
	DECLARE @MAX_LAST_MODIFIED	DATE;

	-- Get the MAX LAST_MODIFIED from the staging table
	SELECT
		@MAX_LAST_MODIFIED = MAX([LAST_MODIFIED])
	FROM [pubs_staging].[dbo].[publishers];

	-- Handle edge case - staging table is empty and 
	-- @MAX_LAST_MODIFIED IS NULL; set to arbitrary date
	IF @MAX_LAST_MODIFIED IS NULL
		SET @MAX_LAST_MODIFIED = '18991231';

	-- Get rows from source table where LAST_MODIFIED
	-- is > MAX([LAST_MODIFIED]) in staging table.
	WITH CTE_SOURCE AS (
		SELECT
			pub_id
		,	pub_name
		,	city
		,	state
		,	country
		,	LAST_MODIFIED	
		FROM [pubs_snapshot].[dbo].[publishers]	
		WHERE [LAST_MODIFIED] > @MAX_LAST_MODIFIED
	)

	MERGE [pubs_staging].[dbo].[publishers] AS tgt
	USING (
		SELECT
			pub_id
		,	pub_name
		,	city
		,	state
		,	country
		,	LAST_MODIFIED	
		FROM CTE_SOURCE
	) AS src
	ON (tgt.pub_id = src.pub_id)

	WHEN MATCHED THEN
		UPDATE SET
			pub_name = src.pub_name
		,	city = src.city
		,	state = src.state
		,	country = src.country
		,	LAST_MODIFIED = src.LAST_MODIFIED

	WHEN NOT MATCHED THEN
		INSERT (
			pub_id
		,	pub_name
		,	city
		,	state
		,	country
		,	LAST_MODIFIED	
		) 
		VALUES (
			src.pub_id
		,	src.pub_name
		,	src.city
		,	src.state
		,	src.country
		,	src.LAST_MODIFIED	
		);
END
