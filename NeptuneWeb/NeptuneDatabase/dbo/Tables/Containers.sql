CREATE TABLE [dbo].[Containers] (
    [ContainerID] INT        IDENTITY (1, 1) NOT NULL,
    [Description] NCHAR (10) NULL,
    CONSTRAINT [PK_Containers] PRIMARY KEY CLUSTERED ([ContainerID] ASC)
);

