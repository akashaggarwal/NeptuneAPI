﻿CREATE TABLE [dbo].[orders] (
    [OrderID]       FLOAT (53)     NOT NULL,
    [AccountNum]    NVARCHAR (25)  NOT NULL,
    [Address]       NVARCHAR (150) NOT NULL,
    [Name]          NVARCHAR (50)  NULL,
    [Phone]         NVARCHAR (20)  NULL,
    [Note]          NVARCHAR (50)  NULL,
    [Sig1]          IMAGE          NULL,
    [PrevRead]      INT            NULL,
    [OutRead]       INT            NULL,
    [AltRead]       INT            NULL,
    [OldMeterNum]   INT            NULL,
    [OldMIUERT]     INT            NULL,
    [WorkCode]      NVARCHAR (20)  NULL,
    [Appointment]   NVARCHAR (10)  NULL,
    [OldMeterSize]  NVARCHAR (10)  NULL,
    [OldPhoto]      IMAGE          NULL,
    [NewRead]       INT            NULL,
    [NewMeterNum]   INT            NULL,
    [NewMIUERT]     INT            NULL,
    [NewPhoto]      IMAGE          NULL,
    [PlumbingTime]  INT            NULL,
    [Photo3]        IMAGE          NULL,
    [NewLat]        DECIMAL (9, 6) NULL,
    [NewLong]       DECIMAL (9, 6) NULL,
    [InstallerID]   INT            NULL,
    [StartTime]     DATETIME       NULL,
    [EndTime]       DATETIME       NULL,
    [NewMeterSize]  NVARCHAR (10)  NULL,
    [JobComplete]   BIT            NOT NULL,
    [JobSkipped]    BIT            NOT NULL,
    [SkipReason]    NVARCHAR (50)  NULL,
    [CorrectMtrNum] INT            NULL,
    [ScheduleDate]  DATETIME       NOT NULL,
    [Installer]     INT            NULL,
    [InstallDate]   DATETIME       NULL,
    [JobReviewed]   BIT            NOT NULL,
    PRIMARY KEY CLUSTERED ([OrderID] ASC)
);

