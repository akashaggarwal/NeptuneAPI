
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/06/2016 22:25:38
-- Generated from EDMX file: C:\Users\Akash\Source\Workspaces\NeptuneAPI\NeptuneWeb\NeptuneDAL\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [TEST];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Devices]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Devices];
GO
IF OBJECT_ID(N'[dbo].[Installers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Installers];
GO
IF OBJECT_ID(N'[dbo].[WorkOrders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[WorkOrders];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Devices'
CREATE TABLE [dbo].[Devices] (
    [Device_PK] int IDENTITY(1,1) NOT NULL,
    [DeviceID] nvarchar(80)  NOT NULL
);
GO

-- Creating table 'Installers'
CREATE TABLE [dbo].[Installers] (
    [InstallerID] int  NOT NULL,
    [Name] nvarchar(50)  NOT NULL,
    [Phone] nvarchar(50)  NULL,
    [Email] nvarchar(50)  NULL,
    [HireDate] datetime  NULL,
    [Lat] decimal(9,6)  NULL,
    [Long] decimal(9,6)  NULL,
    [Password] int  NOT NULL,
    [Photo] varbinary(max)  NULL
);
GO

-- Creating table 'WorkOrders'
CREATE TABLE [dbo].[WorkOrders] (
    [ScheduleID] int  NOT NULL,
    [PremiseKey] float  NOT NULL,
    [ProjectInventoryID] int  NULL,
    [InstallerID] int  NULL,
    [OrderType] nvarchar(20)  NULL,
    [InstallDate] datetime  NULL,
    [StartTime] datetime  NULL,
    [EndTime] datetime  NULL,
    [OldSerial] int  NULL,
    [NewSerial] int  NULL,
    [CorrectSerial] int  NULL,
    [PrevRead] int  NULL,
    [OldRead] int  NULL,
    [NewRead] int  NULL,
    [AltRead] int  NULL,
    [PlumbingTime] int  NULL,
    [WiringTime] int  NULL,
    [OldRemoteID] int  NULL,
    [NewRemoteID] int  NULL,
    [OldSize] nvarchar(10)  NULL,
    [NewSize] nvarchar(10)  NULL,
    [Latitude] decimal(9,6)  NULL,
    [Longitude] decimal(9,6)  NULL,
    [OldPhoto] varbinary(max)  NULL,
    [NewPhoto] varbinary(max)  NULL,
    [Photo3] varbinary(max)  NULL,
    [Sig1] varbinary(max)  NULL,
    [SkipReason] nvarchar(50)  NULL,
    [JobComplete] bit  NOT NULL,
    [JobSkipped] bit  NOT NULL,
    [JobReviewed] bit  NOT NULL,
    [JobInspected] bit  NOT NULL,
    [Dials] int  NULL,
    [CompoundMeter] bit  NULL,
    [DeviceID] nvarchar(80)  NULL,
    [DateTimeModified] datetime  NOT NULL,
    [Photo4] varbinary(max)  NULL,
    [Photo5] varbinary(max)  NULL,
    [Notes] nvarchar(1000)  NULL,
    [Photo6] varbinary(max)  NULL,
    [Photo7] varbinary(max)  NULL,
    [OldPhotoLatitude] float  NULL,
    [OldPhotoLongitude] float  NULL,
    [NewPhotoLatitude] float  NULL,
    [NewPhotoLongitude] float  NULL,
    [Photo3Latitude] float  NULL,
    [Photo3Longitude] float  NULL,
    [Photo4Latitude] float  NULL,
    [Photo4Longitude] float  NULL,
    [Photo5Latitude] float  NULL,
    [Photo5Longitude] float  NULL,
    [Photo6Latitude] float  NULL,
    [Photo6Longitude] float  NULL,
    [Photo7Latitude] float  NULL,
    [Photo7Longitude] float  NULL,
    [JobSubmissionLatitude] float  NULL,
    [JobSubmissionLongitude] float  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Device_PK] in table 'Devices'
ALTER TABLE [dbo].[Devices]
ADD CONSTRAINT [PK_Devices]
    PRIMARY KEY CLUSTERED ([Device_PK] ASC);
GO

-- Creating primary key on [InstallerID] in table 'Installers'
ALTER TABLE [dbo].[Installers]
ADD CONSTRAINT [PK_Installers]
    PRIMARY KEY CLUSTERED ([InstallerID] ASC);
GO

-- Creating primary key on [ScheduleID] in table 'WorkOrders'
ALTER TABLE [dbo].[WorkOrders]
ADD CONSTRAINT [PK_WorkOrders]
    PRIMARY KEY CLUSTERED ([ScheduleID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------