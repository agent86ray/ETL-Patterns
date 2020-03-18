USE [pubs_staging]
GO

CREATE TABLE [dbo].[publishers] (
	[pub_id]		[char](4) NOT NULL,
	[pub_name]		[varchar](40) NULL,
	[city]			[varchar](20) NULL,
	[state]			[char](2) NULL,
	[country]		[varchar](30) NULL,
	[LAST_MODIFIED] [date] NOT NULL,
	CONSTRAINT [UPKCL_pubind] PRIMARY KEY CLUSTERED 
	(
		[pub_id] ASC
	) 
)
GO


