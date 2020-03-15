/*
	SCRIPT: CREATE_DATABASE_SNAPSHOT.sql

	Change FILENAME path below as necessary
*/
USE pubs
GO

CREATE DATABASE pubs_snapshot
ON  (
	NAME=pubs
,	FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\pubs_snapshot.mdf'
) 
AS SNAPSHOT OF pubs;

