CREATE TABLE [dbo].[MasterKeyTable] (
    [PremiseKey] FLOAT (53) NOT NULL,
    CONSTRAINT [PK_MasterKeyTable] PRIMARY KEY CLUSTERED ([PremiseKey] ASC),
    CONSTRAINT [FK_MasterKeyTable_Premise] FOREIGN KEY ([PremiseKey]) REFERENCES [dbo].[Premise] ([PremiseKey])
);

