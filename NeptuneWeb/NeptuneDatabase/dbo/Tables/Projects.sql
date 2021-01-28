CREATE TABLE [dbo].[Projects] (
    [ProjectId]   INT           IDENTITY (1, 1) NOT NULL,
    [ProjectName] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED ([ProjectName] ASC)
);

