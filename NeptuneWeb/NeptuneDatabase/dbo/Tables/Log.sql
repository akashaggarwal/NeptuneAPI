CREATE TABLE [dbo].[Log] (
    [PremiseKey] FLOAT (53)     NULL,
    [LogType]    NVARCHAR (150) NOT NULL,
    [Note]       NVARCHAR (50)  NULL,
    [EntryDate]  DATE           NOT NULL,
    [EnteredBy]  NVARCHAR (50)  NOT NULL,
    [ID]         INT            IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Log_LogType] FOREIGN KEY ([LogType]) REFERENCES [dbo].[LogType] ([EventType]),
    CONSTRAINT [FK_Log_Premise] FOREIGN KEY ([PremiseKey]) REFERENCES [dbo].[Premise] ([PremiseKey])
);

