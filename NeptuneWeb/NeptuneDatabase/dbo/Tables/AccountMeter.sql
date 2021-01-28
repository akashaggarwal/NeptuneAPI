CREATE TABLE [dbo].[AccountMeter](
	[AccountMeterId] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[SerialNumber] [nvarchar](15) NULL,
	[RemoteId] [int] NULL,
	[UnitofMeasure] [nvarchar](10) NULL,
	[Size] [nvarchar](10) NULL,
	[MeterType] [nvarchar](10) NULL,
	[Latitude] [decimal](9, 6) NULL,
	[Longitude] [decimal](9, 6) NULL,
	[Reading] [nvarchar](20) NULL,
	[InstallDt] [datetime] NULL,
	[PreviousSerialNumber] [nvarchar](15) NULL,
	[PreviousRemoteId] [int] NULL,
	[PreviousUnitofMeasure] [nvarchar](10) NULL,
	[PreviousSize] [nvarchar](10) NULL,
	[PreviousMeterType] [nvarchar](10) NULL,
	[PreviousLatitude] [decimal](9, 6) NULL,
	[PreviousLongitude] [decimal](9, 6) NULL,
	[PreviousReading] [nvarchar](20) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedDt] [datetime] NULL,
	[User1] [nvarchar](50) NULL,
	[User2] [nvarchar](50) NULL,
	[User3] [nvarchar](50) NULL,
	[User4] [nvarchar](50) NULL,
	[User5] [nvarchar](50) NULL,
	[UserNote1] [nvarchar](500) NULL,
 CONSTRAINT [PK_AccountMeter] PRIMARY KEY CLUSTERED 
(
	[AccountMeterId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[AccountMeter]  WITH CHECK ADD  CONSTRAINT [FK_AccountMeter_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO

ALTER TABLE [dbo].[AccountMeter] CHECK CONSTRAINT [FK_AccountMeter_Account]
GO


