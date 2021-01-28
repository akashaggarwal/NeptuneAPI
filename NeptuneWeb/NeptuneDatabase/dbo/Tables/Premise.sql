﻿CREATE TABLE [dbo].[Premise] (
    [PremiseKey]        FLOAT (53)      NOT NULL,
    [PremiseNumber]     DECIMAL (18, 2) NOT NULL,
    [AccountNumber]     NVARCHAR (25)   NOT NULL,
    [Address]           NVARCHAR (150)  NOT NULL,
    [City]              NVARCHAR (25)   NOT NULL,
    [State]             NVARCHAR (2)    NOT NULL,
    [Zip]               NVARCHAR (10)   NOT NULL,
    [Phone]             NVARCHAR (20)   NULL,
    [AltPhone]          NVARCHAR (20)   NULL,
    [Name]              NVARCHAR (50)   NULL,
    [Route]             NVARCHAR (20)   NULL,
    [Seq]               INT             NULL,
    [LocationNote]      NVARCHAR (50)   NULL,
    [MailingDate1]      DATE            NULL,
    [MailingDate2]      DATE            NULL,
    [Zone]              NVARCHAR (10)   NULL,
    [Project]           NVARCHAR (50)   NULL,
    [AssignedScheduler] NVARCHAR (20)   NULL,
    [ScheduleID]        INT             NULL,
    [WorkerOrderID]     INT             NULL,
    CONSTRAINT [PK_Premise] PRIMARY KEY CLUSTERED ([PremiseKey] ASC),
    CONSTRAINT [FK_Premise_Projects1] FOREIGN KEY ([Project]) REFERENCES [dbo].[Projects] ([ProjectName])
);

