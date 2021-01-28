CREATE TABLE [dbo].[Equipment] (
    [EquipmentID]      INT       NOT NULL,
    [ScheduleID]       INT       NULL,
    [SerialNumber]     INT       NULL,
    [InventoryID]      INT       NULL,
    [ContainerID]      INT       NULL,
    [OldSerial]        INT       NULL,
    [InstallationType] CHAR (50) NULL,
    [InstallerID]      INT       NULL,
    CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED ([EquipmentID] ASC),
    CONSTRAINT [FK_Equipment_Containers] FOREIGN KEY ([ContainerID]) REFERENCES [dbo].[Containers] ([ContainerID]),
    CONSTRAINT [FK_Equipment_ProjectInstallers] FOREIGN KEY ([InstallerID]) REFERENCES [dbo].[ProjectInstallers] ([ProjectInstallerNumber]),
    CONSTRAINT [FK_Equipment_WorkOrders] FOREIGN KEY ([ScheduleID]) REFERENCES [dbo].[WorkOrders] ([ScheduleID])
);

