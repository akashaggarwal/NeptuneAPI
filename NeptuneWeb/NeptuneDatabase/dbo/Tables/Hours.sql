CREATE TABLE [dbo].[Hours] (
    [ProjectName]  NVARCHAR (50) NOT NULL,
    [Period1]      NVARCHAR (15) NULL,
    [Period2]      NVARCHAR (15) NULL,
    [Period3]      NVARCHAR (15) NULL,
    [Period4]      NVARCHAR (15) NULL,
    [Period5]      NVARCHAR (15) NULL,
    [Period6]      NVARCHAR (15) NULL,
    [Period7]      NVARCHAR (15) NULL,
    [ProjectID]    INT           NOT NULL,
    [AverageValue] INT           NULL,
    [HighValue]    INT           NULL,
    CONSTRAINT [PK_Hours] PRIMARY KEY CLUSTERED ([ProjectName] ASC),
    CONSTRAINT [FK_Hours_Projects] FOREIGN KEY ([ProjectName]) REFERENCES [dbo].[Projects] ([ProjectName])
);

