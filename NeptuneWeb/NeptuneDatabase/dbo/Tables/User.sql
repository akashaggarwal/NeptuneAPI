CREATE TABLE [dbo].[User](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmpId] [int] NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[HireDate] [date] NULL,
	[Lat] [decimal](9, 6) NULL,
	[Long] [decimal](9, 6) NULL,
	[Photo] [image] NULL,
	[CanScheduleYesNo] [bit] NULL,
	[CanWorkWorkOrderYesNo] [bit] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[UpdatedDt] [datetime] NULL,
	[SecurityStamp] [nvarchar](254) NULL,
	[Discriminator] [nvarchar](254) NULL,
	[IsConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](500) NULL,
	[AccessFailedCount] [int] NULL,
	[EmailConfirmed] [bit] NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[PhoneNumberConfirmed] [bit] NULL,
	[TwoFactorEnabled] [bit] NULL,
	[LockOutEnabled] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsConfirmed]  DEFAULT ((0)) FOR [IsConfirmed]
GO


