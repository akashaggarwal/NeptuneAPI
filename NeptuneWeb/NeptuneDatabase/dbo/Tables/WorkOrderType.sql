CREATE TABLE [dbo].[WorkOrderType](
	[WorkOrderTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Note1] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedDt] [datetime] NULL,
	[SystemNumber] [int] NULL,
 CONSTRAINT [PK_WorkOrderType] PRIMARY KEY CLUSTERED 
(
	[WorkOrderTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


