CREATE TABLE [dbo].[Installers] (
    [InstallerID] INT            NOT NULL,
    [Name]        NVARCHAR (50)  NOT NULL,
    [Phone]       NVARCHAR (50)  NULL,
    [Email]       NVARCHAR (50)  NULL,
    [HireDate]    DATE           NULL,
    [Lat]         DECIMAL (9, 6) NULL,
    [Long]        DECIMAL (9, 6) NULL,
    [Password]    INT            NOT NULL,
    [Photo]       IMAGE          NULL,
    CONSTRAINT [PK_Installers] PRIMARY KEY CLUSTERED ([InstallerID] ASC)
);

