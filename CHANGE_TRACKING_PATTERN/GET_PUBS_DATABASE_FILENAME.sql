/*
	SCRIPT: GET_PUBS_DATABASE_FILENAME.sql
*/
USE pubs
GO

SELECT 
	[name]
,	[physical_name] 
FROM sys.database_files
WHERE [name] = 'pubs'
AND [type_desc] = 'ROWS'


