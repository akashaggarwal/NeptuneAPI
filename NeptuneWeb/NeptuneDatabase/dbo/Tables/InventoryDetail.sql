CREATE TABLE [dbo].[InventoryDetail](
	[InventoryDetailId] [int] IDENTITY(1,1) NOT NULL,
	[InventoryId] [int] NOT NULL,
	[InstallerId] [bigint] NULL,
	[SerialNumber] [nvarchar](15) NOT NULL,
	[IssueDate] [datetime] NULL,
	[InstallDate] [datetime] NULL,
	[CheckedIn] [bit] NOT NULL,
	[AuditFlag] [bit] NOT NULL,
	[CheckInDate] [datetime] NULL,
	[Size] [nchar](10) NULL,
	[PrevInstaller] [bigint] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedDt] [datetime] NULL,
	[RemoteId] [int] NULL,
	[DefectiveStatus] [nvarchar](20) NULL,
	[DefectiveDate] [datetime] NULL,
	[DefectiveStatusNotes1] [nvarchar](max) NULL,
	[DefectiveStatusNotes2] [nvarchar](max) NULL,
	[AuditDate] [datetime] NULL,
	[CompoundYesNo] [bit] NOT NULL,
	[RemoteIdLowSide] [int] NULL,
	[SizeLowSide] [nchar](10) NULL,
 CONSTRAINT [PK_InventoryDetail] PRIMARY KEY CLUSTERED 
(
	[InventoryDetailId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[InventoryDetail]  WITH CHECK ADD  CONSTRAINT [FK_InventoryDetail_Inventory] FOREIGN KEY([InventoryId])
REFERENCES [dbo].[Inventory] ([InventoryId])
GO

ALTER TABLE [dbo].[InventoryDetail] CHECK CONSTRAINT [FK_InventoryDetail_Inventory]
GO

ALTER TABLE [dbo].[InventoryDetail]  WITH CHECK ADD  CONSTRAINT [FK_InventoryDetail_User] FOREIGN KEY([InstallerId])
REFERENCES [dbo].[User] ([Id])
GO

ALTER TABLE [dbo].[InventoryDetail] CHECK CONSTRAINT [FK_InventoryDetail_User]
GO

ALTER TABLE [dbo].[InventoryDetail]  WITH CHECK ADD  CONSTRAINT [FK_InventoryDetail_User1] FOREIGN KEY([PrevInstaller])
REFERENCES [dbo].[User] ([Id])
GO

ALTER TABLE [dbo].[InventoryDetail] CHECK CONSTRAINT [FK_InventoryDetail_User1]
GO

ALTER TABLE [dbo].[InventoryDetail] ADD  DEFAULT ((0)) FOR [CompoundYesNo]
GO


