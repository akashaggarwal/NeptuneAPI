CREATE TABLE [dbo].[Schedule](
	[ScheduleId] [int] IDENTITY(1,1) NOT NULL,
	[ScheduledById] [bigint] NULL,
	[InstallerAssignedId] [bigint] NULL,
	[WorkOrderId] [int] NULL,
	[ScheduleDate] [datetime] NULL,
	[StartTime] [time](7) NULL,
	[EndTime] [time](7) NULL,
	[ScheduleTime] [nvarchar](10) NULL,
	[ScheduledOnDate] [datetime] NULL,
	[Note1] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedDt] [datetime] NULL,
	[ProjectHoursId] [int] NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[ScheduleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_ProjectHours] FOREIGN KEY([ProjectHoursId])
REFERENCES [dbo].[ProjectHours] ([ProjectHoursId])
GO

ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_ProjectHours]
GO

ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_User] FOREIGN KEY([ScheduledById])
REFERENCES [dbo].[User] ([Id])
GO

ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_User]
GO

ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_User1] FOREIGN KEY([InstallerAssignedId])
REFERENCES [dbo].[User] ([Id])
GO

ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_User1]
GO

ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_WorkOrder] FOREIGN KEY([WorkOrderId])
REFERENCES [dbo].[WorkOrder] ([WorkOrderId])
GO

ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_WorkOrder]
GO



