CREATE TABLE [dbo].[Devices] (
    [Device_PK] INT           IDENTITY (1, 1) NOT NULL,
    [DeviceID]  NVARCHAR (80) NOT NULL,
    CONSTRAINT [PK_Devices] PRIMARY KEY CLUSTERED ([Device_PK] ASC)
);

