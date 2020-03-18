/*
	SCRIPT: CREATE_DATABASE_SNAPSHOT.sql

	Change FILENAME path below as necessary
*/
USE master
GO

-- drop the snapshot if it exists
IF EXISTS (
	SELECT 
		s1.[name]			AS [SNAPSHOT_DATABASE]
	,	s1.[create_date]	AS [SNAPSHOT_CREATE_DATE]
	,	s0.[name]			AS [SNAPSHOT_OF_DATABASE]
	FROM sys.databases s1
	JOIN sys.databases s0
		ON s0.[database_id] = s1.[source_database_id]
	WHERE s1.[name] = 'pubs_snapshot'
)
BEGIN
	DROP DATABASE pubs_snapshot;
END

CREATE DATABASE pubs_snapshot
ON  (
	NAME=pubs
,	FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\pubs_snapshot.mdf'
) 
AS SNAPSHOT OF pubs;

