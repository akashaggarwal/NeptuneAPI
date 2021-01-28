CREATE TABLE [dbo].[WorkOrder](
	[WorkOrderId] [int] IDENTITY(1,1) NOT NULL,
	[WorkOrderTypeId] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
	[ScheduleId] [int] NULL,
	[UserId] [bigint] NULL,
	[CompleteDate] [datetime] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[CurrentSerial] [nvarchar](15) NULL,
	[CorrectSerial] [nvarchar](15) NULL,
	[PrevRead] [nvarchar](20) NULL,
	[OldRead] [nvarchar](20) NULL,
	[NewRead] [nvarchar](20) NULL,
	[AltRead] [nvarchar](20) NULL,
	[PlumbingTime] [int] NULL,
	[WiringTime] [int] NULL,
	[CurrentRemoteId] [int] NULL,
	[CurrentSize] [nvarchar](10) NULL,
	[CurrentLatitude] [decimal](9, 6) NULL,
	[CurrentLongitude] [decimal](9, 6) NULL,
	[CurrentPhoto] [image] NULL,
	[NewPhoto] [image] NULL,
	[Photo3] [image] NULL,
	[Photo4] [image] NULL,
	[Photo5] [image] NULL,
	[Sig1] [image] NULL,
	[SkipReason] [nvarchar](50) NULL,
	[JobComplete] [bit] NOT NULL,
	[JobSkipped] [bit] NOT NULL,
	[JobReviewed] [bit] NOT NULL,
	[JobInspected] [bit] NOT NULL,
	[Dials] [int] NULL,
	[CompoundMeter] [bit] NULL,
	[DateTimeModified] [datetime] NOT NULL,
	[Notes] [nvarchar](1000) NULL,
	[EmpId] [int] NULL,
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
	[User11] [nvarchar](50) NULL,
	[User12] [nvarchar](50) NULL,
	[User13] [nvarchar](50) NULL,
	[User14] [nvarchar](50) NULL,
	[User15] [nvarchar](50) NULL,
	[User16] [nvarchar](50) NULL,
	[User17] [nvarchar](50) NULL,
	[User18] [nvarchar](50) NULL,
	[User19] [nvarchar](50) NULL,
	[User20] [nvarchar](50) NULL,
	[User21] [nvarchar](50) NULL,
	[User22] [nvarchar](50) NULL,
	[User23] [nvarchar](50) NULL,
	[User24] [nvarchar](50) NULL,
	[User25] [nvarchar](50) NULL,
	[UserNote1] [nvarchar](max) NULL,
	[UserNote2] [nvarchar](max) NULL,
	[UserNote3] [nvarchar](max) NULL,
	[UserNote4] [nvarchar](max) NULL,
	[UserNote5] [nvarchar](max) NULL,
	[UserPhoto1] [image] NULL,
	[UserPhoto2] [image] NULL,
	[UserPhoto3] [image] NULL,
	[UserPhoto4] [image] NULL,
	[UserPhoto5] [image] NULL,
	[UserPhoto6] [image] NULL,
	[UserPhoto7] [image] NULL,
	[UserPhoto8] [image] NULL,
	[UserPhoto9] [image] NULL,
	[UserPhoto10] [image] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedDt] [datetime] NULL,
	[DeviceId] [int] NULL,
	[AccountMeterId] [int] NULL,
	[NewRemoteId] [int] NULL,
	[NewSerial] [nvarchar](15) NULL,
	[NewSize] [nvarchar](10) NULL,
	[NewLatitude] [decimal](9, 6) NULL,
	[NewLongitude] [decimal](9, 6) NULL,
	[WorkType] [nvarchar](20) NULL,
	[CurrentMeterType] [nvarchar](10) NULL,
	[NewMeterType] [nvarchar](10) NULL,
	[AuditCurrentPhoto] [bit] NOT NULL,
	[AuditNewPhoto] [bit] NOT NULL,
	[AuditSig1] [bit] NOT NULL,
	[AuditWorkOrder] [bit] NOT NULL,
	[NewPhotoLatitude] [decimal](9, 6) NULL,
	[NewPhotoLongitude] [decimal](9, 6) NULL,
	[OldPhotoLatitude] [decimal](9, 6) NULL,
	[OldPhotoLongitude] [decimal](9, 6) NULL,
	[Sig1Latitude] [decimal](9, 6) NULL,
	[Sig1Longitude] [decimal](9, 6) NULL,
	[Photo3Latitude] [decimal](9, 6) NULL,
	[Photo3Longitude] [decimal](9, 6) NULL,
	[Photo4Latitude] [decimal](9, 6) NULL,
	[Photo4Longitude] [decimal](9, 6) NULL,
	[Photo5Latitude] [decimal](9, 6) NULL,
	[Photo5Longitude] [decimal](9, 6) NULL,
	[UserPhoto1Latitude] [decimal](9, 6) NULL,
	[UserPhoto1Longitude] [decimal](9, 6) NULL,
	[UserPhoto2Latitude] [decimal](9, 6) NULL,
	[UserPhoto2Longitude] [decimal](9, 6) NULL,
	[AuditPhoto3] [bit] NOT NULL,
	[AuditPhoto4] [bit] NOT NULL,
	[AuditPhoto5] [bit] NOT NULL,
	[AuditUserPhoto1] [bit] NOT NULL,
	[AuditUserPhoto2] [bit] NOT NULL,
 CONSTRAINT [PK_WorkOrder] PRIMARY KEY CLUSTERED 
(
	[WorkOrderId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[WorkOrder]  WITH CHECK ADD  CONSTRAINT [FK_WorkOrder_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO

ALTER TABLE [dbo].[WorkOrder] CHECK CONSTRAINT [FK_WorkOrder_Account]
GO

ALTER TABLE [dbo].[WorkOrder]  WITH CHECK ADD  CONSTRAINT [FK_WorkOrder_AccountMeter] FOREIGN KEY([AccountMeterId])
REFERENCES [dbo].[AccountMeter] ([AccountMeterId])
GO

ALTER TABLE [dbo].[WorkOrder] CHECK CONSTRAINT [FK_WorkOrder_AccountMeter]
GO

ALTER TABLE [dbo].[WorkOrder]  WITH CHECK ADD  CONSTRAINT [FK_WorkOrder_Device] FOREIGN KEY([DeviceId])
REFERENCES [dbo].[Device] ([DeviceId])
GO

ALTER TABLE [dbo].[WorkOrder] CHECK CONSTRAINT [FK_WorkOrder_Device]
GO

ALTER TABLE [dbo].[WorkOrder]  WITH CHECK ADD  CONSTRAINT [FK_WorkOrder_Schedule] FOREIGN KEY([ScheduleId])
REFERENCES [dbo].[Schedule] ([ScheduleId])
GO

ALTER TABLE [dbo].[WorkOrder] CHECK CONSTRAINT [FK_WorkOrder_Schedule]
GO

ALTER TABLE [dbo].[WorkOrder]  WITH CHECK ADD  CONSTRAINT [FK_WorkOrder_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO

ALTER TABLE [dbo].[WorkOrder] CHECK CONSTRAINT [FK_WorkOrder_User]
GO

ALTER TABLE [dbo].[WorkOrder]  WITH CHECK ADD  CONSTRAINT [FK_WorkOrder_WorkOrderType] FOREIGN KEY([WorkOrderTypeId])
REFERENCES [dbo].[WorkOrderType] ([WorkOrderTypeId])
GO

ALTER TABLE [dbo].[WorkOrder] CHECK CONSTRAINT [FK_WorkOrder_WorkOrderType]
GO

ALTER TABLE [dbo].[WorkOrder] ADD  CONSTRAINT [DF_WorkOrder_JobComplete]  DEFAULT ((0)) FOR [JobComplete]
GO

ALTER TABLE [dbo].[WorkOrder] ADD  CONSTRAINT [DF_WorkOrder_JobSkipped]  DEFAULT ((0)) FOR [JobSkipped]
GO

ALTER TABLE [dbo].[WorkOrder] ADD  CONSTRAINT [DF_WorkOrder_JobReviewed]  DEFAULT ((0)) FOR [JobReviewed]
GO

ALTER TABLE [dbo].[WorkOrder] ADD  CONSTRAINT [DF_WorkOrder_JobInspected]  DEFAULT ((0)) FOR [JobInspected]
GO

ALTER TABLE [dbo].[WorkOrder] ADD  DEFAULT (getdate()) FOR [DateTimeModified]
GO

ALTER TABLE [dbo].[WorkOrder] ADD  CONSTRAINT [DF_WorkOrder_AuditCurrentPhoto]  DEFAULT ((0)) FOR [AuditCurrentPhoto]
GO

ALTER TABLE [dbo].[WorkOrder] ADD  CONSTRAINT [DF_WorkOrder_AuditNewPhoto]  DEFAULT ((0)) FOR [AuditNewPhoto]
GO

ALTER TABLE [dbo].[WorkOrder] ADD  CONSTRAINT [DF_WorkOrder_AuditSig1]  DEFAULT ((0)) FOR [AuditSig1]
GO

ALTER TABLE [dbo].[WorkOrder] ADD  CONSTRAINT [DF_WorkOrder_AuditWorkOrder]  DEFAULT ((0)) FOR [AuditWorkOrder]
GO

ALTER TABLE [dbo].[WorkOrder] ADD  DEFAULT ((0)) FOR [AuditPhoto3]
GO

ALTER TABLE [dbo].[WorkOrder] ADD  DEFAULT ((0)) FOR [AuditPhoto4]
GO

ALTER TABLE [dbo].[WorkOrder] ADD  DEFAULT ((0)) FOR [AuditPhoto5]
GO

ALTER TABLE [dbo].[WorkOrder] ADD  DEFAULT ((0)) FOR [AuditUserPhoto1]
GO

ALTER TABLE [dbo].[WorkOrder] ADD  DEFAULT ((0)) FOR [AuditUserPhoto2]
GO


