CREATE TABLE [dbo].[Account](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[PremiseNumber] [decimal](18, 2) NULL,
	[AccountNumber] [nvarchar](25) NULL,
	[Address] [nvarchar](150) NULL,
	[City] [nvarchar](25) NULL,
	[State] [nvarchar](2) NULL,
	[Zip] [nvarchar](10) NULL,
	[Phone] [nvarchar](20) NULL,
	[AltPhone] [nvarchar](20) NULL,
	[Name] [nvarchar](50) NULL,
	[TennantName] [nvarchar](50) NULL,
	[TennantPhone] [nvarchar](20) NULL,
	[TennantAltPhone] [nvarchar](20) NULL,
	[Route] [nvarchar](20) NULL,
	[Seq] [int] NULL,
	[LocationNote] [nvarchar](50) NULL,
	[MailingDate1] [date] NULL,
	[MailingDate2] [date] NULL,
	[Zone] [nvarchar](10) NULL,
	[AssignedScheduler] [bigint] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedDt] [datetime] NULL,
	[NecoSection] [nvarchar](10) NULL,
	[User1] [nvarchar](50) NULL,
	[User2] [nvarchar](50) NULL,
	[User3] [nvarchar](50) NULL,
	[User4] [nvarchar](50) NULL,
	[User5] [nvarchar](50) NULL,
	[User6] [nvarchar](50) NULL,
	[User7] [nvarchar](50) NULL,
	[User8] [nvarchar](50) NULL,
	[User9] [nvarchar](50) NULL,
	[User10] [nvarchar](50) NULL,
	[EmailAddress] [varchar](254) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

GO

ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([ProjectId])
GO

ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Project]
GO

ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_User] FOREIGN KEY([AssignedScheduler])
REFERENCES [dbo].[User] ([Id])
GO

ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_User]
GO


