CREATE TABLE [dbo].[ProjectInstallers] (
    [InstallerID]            INT            NULL,
    [Name]                   NVARCHAR (50)  NULL,
    [Phone]                  NVARCHAR (12)  NULL,
    [Email]                  NVARCHAR (50)  NULL,
    [HireDate]               DATE           NULL,
    [Lat]                    DECIMAL (9, 6) NULL,
    [Long]                   DECIMAL (9, 6) NULL,
    [password]               INT            NULL,
    [Photo]                  IMAGE          NULL,
    [ProjectName]            NVARCHAR (50)  NULL,
    [EquipmentID]            INT            NULL,
    [ProjectInstallerNumber] INT            NOT NULL,
    CONSTRAINT [PK_ProjectInstallers] PRIMARY KEY CLUSTERED ([ProjectInstallerNumber] ASC),
    CONSTRAINT [FK_ProjectInstallers_Projects] FOREIGN KEY ([ProjectName]) REFERENCES [dbo].[Projects] ([ProjectName])
);

