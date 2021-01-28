CREATE TABLE [dbo].[ProjectHours](
	[ProjectHoursId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[Hours] [nvarchar](20) NULL,
	[Seq] [int] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedDt] [datetime] NULL,
	[MaxScheduleCount] [int] NULL,
 CONSTRAINT [PK_ProjectHours] PRIMARY KEY CLUSTERED 
(
	[ProjectHoursId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[ProjectHours]  WITH CHECK ADD  CONSTRAINT [FK_ProjectHours_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([ProjectId])
GO

ALTER TABLE [dbo].[ProjectHours] CHECK CONSTRAINT [FK_ProjectHours_Project]
GO


