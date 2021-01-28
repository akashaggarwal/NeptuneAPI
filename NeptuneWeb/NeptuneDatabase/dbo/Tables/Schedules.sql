CREATE TABLE [dbo].[Schedules] (
    [ScheduleID]        INT            NOT NULL,
    [PremiseKey]        FLOAT (53)     NOT NULL,
    [ScheduleDate]      DATETIME       CONSTRAINT [DF_schedule_ScheduleDate] DEFAULT (((12)/(15))/(2010)) NULL,
    [ScheduleTime]      NVARCHAR (10)  CONSTRAINT [DF_schedule_ScheduleTime] DEFAULT ((0)) NULL,
    [Note]              NVARCHAR (MAX) NULL,
    [ScheduledBy]       NVARCHAR (50)  NULL,
    [InstallerAssigned] INT            NULL,
    [ScheduledOnDate]   DATETIME       NULL,
    [InstallerID]       INT            NOT NULL,
    [WorkOrderID]       INT            NULL,
    CONSTRAINT [PK_Schedules] PRIMARY KEY CLUSTERED ([ScheduleID] ASC),
    CONSTRAINT [FK_Schedules_Premise] FOREIGN KEY ([PremiseKey]) REFERENCES [dbo].[Premise] ([PremiseKey]),
    CONSTRAINT [FK_Schedules_ProjectInstallers] FOREIGN KEY ([InstallerID]) REFERENCES [dbo].[ProjectInstallers] ([ProjectInstallerNumber])
);

