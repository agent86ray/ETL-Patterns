/*
	SCRIPT: ADD_LAST_MODIFIED_TO_PUBLISHERS.sql
*/
USE pubs;
GO

ALTER TABLE [dbo].[publishers]
ADD [LAST_MODIFIED] DATE NOT NULL
DEFAULT GETDATE();
GO

-- set [LAST_MODIFIED] to a couple of days ago
-- so we can see changes when we test
UPDATE [pubs_snapshot].[dbo].[publishers]
SET [LAST_MODIFIED] = '20200301';
GO

CREATE NONCLUSTERED INDEX NC_publishers_LAST_MODIFIED
ON [dbo].[publishers] ([LAST_MODIFIED])
GO

