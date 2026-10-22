
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/08/2026 13:26:31
-- Generated from EDMX file: C:\Users\opilane\source\repos\dariia\pitsarestoran\pitsarestoran\pitsarestoranModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [pitsarestoran];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_tootajaametimaaratus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ametimaaratusSet] DROP CONSTRAINT [FK_tootajaametimaaratus];
GO
IF OBJECT_ID(N'[dbo].[FK_ametametimaaratus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ametimaaratusSet] DROP CONSTRAINT [FK_ametametimaaratus];
GO
IF OBJECT_ID(N'[dbo].[FK_KategooriaToode]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ToodeSet] DROP CONSTRAINT [FK_KategooriaToode];
GO
IF OBJECT_ID(N'[dbo].[FK_ToodePitsaKoostisosa]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PitsaKoostisosaSet] DROP CONSTRAINT [FK_ToodePitsaKoostisosa];
GO
IF OBJECT_ID(N'[dbo].[FK_KoostisosaPitsaKoostisosa]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PitsaKoostisosaSet] DROP CONSTRAINT [FK_KoostisosaPitsaKoostisosa];
GO
IF OBJECT_ID(N'[dbo].[FK_ToodeTellimuseToode]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TellimuseToodeSet] DROP CONSTRAINT [FK_ToodeTellimuseToode];
GO
IF OBJECT_ID(N'[dbo].[FK_KlientTellimus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TellimusSet] DROP CONSTRAINT [FK_KlientTellimus];
GO
IF OBJECT_ID(N'[dbo].[FK_LaudTellimus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TellimusSet] DROP CONSTRAINT [FK_LaudTellimus];
GO
IF OBJECT_ID(N'[dbo].[FK_TellimusTellimuseToode]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TellimuseToodeSet] DROP CONSTRAINT [FK_TellimusTellimuseToode];
GO
IF OBJECT_ID(N'[dbo].[FK_TellimusKohaletoimetamine]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[KohaletoimetamineSet] DROP CONSTRAINT [FK_TellimusKohaletoimetamine];
GO
IF OBJECT_ID(N'[dbo].[FK_KoostisosaKoostisosaTarnija]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[KoostisosaTarnijaSet] DROP CONSTRAINT [FK_KoostisosaKoostisosaTarnija];
GO
IF OBJECT_ID(N'[dbo].[FK_TarnijaKoostisosaTarnija]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[KoostisosaTarnijaSet] DROP CONSTRAINT [FK_TarnijaKoostisosaTarnija];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[tootajaSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[tootajaSet];
GO
IF OBJECT_ID(N'[dbo].[ametSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ametSet];
GO
IF OBJECT_ID(N'[dbo].[ametimaaratusSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ametimaaratusSet];
GO
IF OBJECT_ID(N'[dbo].[KategooriaSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[KategooriaSet];
GO
IF OBJECT_ID(N'[dbo].[ToodeSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ToodeSet];
GO
IF OBJECT_ID(N'[dbo].[PitsaKoostisosaSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PitsaKoostisosaSet];
GO
IF OBJECT_ID(N'[dbo].[KoostisosaSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[KoostisosaSet];
GO
IF OBJECT_ID(N'[dbo].[KoostisosaTarnijaSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[KoostisosaTarnijaSet];
GO
IF OBJECT_ID(N'[dbo].[TarnijaSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TarnijaSet];
GO
IF OBJECT_ID(N'[dbo].[KlientSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[KlientSet];
GO
IF OBJECT_ID(N'[dbo].[TellimusSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TellimusSet];
GO
IF OBJECT_ID(N'[dbo].[TellimuseToodeSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TellimuseToodeSet];
GO
IF OBJECT_ID(N'[dbo].[LaudSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LaudSet];
GO
IF OBJECT_ID(N'[dbo].[KohaletoimetamineSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[KohaletoimetamineSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'tootajaSet'
CREATE TABLE [dbo].[tootajaSet] (
    [tootajaID] int IDENTITY(1,1) NOT NULL,
    [eesnimi] nvarchar(max)  NOT NULL,
    [perekonnanimi] nvarchar(max)  NOT NULL,
    [telefon] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ametSet'
CREATE TABLE [dbo].[ametSet] (
    [ametID] int IDENTITY(1,1) NOT NULL,
    [nimetus] nvarchar(max)  NOT NULL,
    [kirjeldus] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ametimaaratusSet'
CREATE TABLE [dbo].[ametimaaratusSet] (
    [ametimaaratusID] int IDENTITY(1,1) NOT NULL,
    [alguskuupaev] nvarchar(max)  NOT NULL,
    [tootaja_tootajaID] int  NOT NULL,
    [amet_ametID] int  NOT NULL
);
GO

-- Creating table 'KategooriaSet'
CREATE TABLE [dbo].[KategooriaSet] (
    [kategooriaID] int IDENTITY(1,1) NOT NULL,
    [nimetus] nvarchar(max)  NOT NULL,
    [kirjeldus] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ToodeSet'
CREATE TABLE [dbo].[ToodeSet] (
    [tooteID] int IDENTITY(1,1) NOT NULL,
    [nimetus] nvarchar(max)  NOT NULL,
    [kirjeldus] nvarchar(max)  NOT NULL,
    [hind] nvarchar(max)  NOT NULL,
    [Kategooria_kategooriaID] int  NOT NULL
);
GO

-- Creating table 'PitsaKoostisosaSet'
CREATE TABLE [dbo].[PitsaKoostisosaSet] (
    [pitsaKoostisosaID] int IDENTITY(1,1) NOT NULL,
    [Toode_tooteID] int  NOT NULL,
    [Koostisosa_koostisosaID] int  NOT NULL
);
GO

-- Creating table 'KoostisosaSet'
CREATE TABLE [dbo].[KoostisosaSet] (
    [koostisosaID] int IDENTITY(1,1) NOT NULL,
    [nimetus] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'KoostisosaTarnijaSet'
CREATE TABLE [dbo].[KoostisosaTarnijaSet] (
    [koostisosaTarnijaID] int IDENTITY(1,1) NOT NULL,
    [hind] nvarchar(max)  NOT NULL,
    [Koostisosa_koostisosaID] int  NOT NULL,
    [Tarnija_TarnijaID] int  NOT NULL
);
GO

-- Creating table 'TarnijaSet'
CREATE TABLE [dbo].[TarnijaSet] (
    [TarnijaID] int IDENTITY(1,1) NOT NULL,
    [nimi] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'KlientSet'
CREATE TABLE [dbo].[KlientSet] (
    [klientID] int IDENTITY(1,1) NOT NULL,
    [eesnimi] nvarchar(max)  NOT NULL,
    [perekonnanimi] nvarchar(max)  NOT NULL,
    [telefon] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'TellimusSet'
CREATE TABLE [dbo].[TellimusSet] (
    [tellimusID] int IDENTITY(1,1) NOT NULL,
    [kuupaev] nvarchar(max)  NOT NULL,
    [kellaaeg] nvarchar(max)  NOT NULL,
    [staatus] nvarchar(max)  NOT NULL,
    [Klient_klientID] int  NOT NULL,
    [Laud_laudID] int  NOT NULL
);
GO

-- Creating table 'TellimuseToodeSet'
CREATE TABLE [dbo].[TellimuseToodeSet] (
    [tellimuseTooteID] int IDENTITY(1,1) NOT NULL,
    [kogus] nvarchar(max)  NOT NULL,
    [Toode_tooteID] int  NOT NULL,
    [Tellimus_tellimusID] int  NOT NULL
);
GO

-- Creating table 'LaudSet'
CREATE TABLE [dbo].[LaudSet] (
    [laudID] int IDENTITY(1,1) NOT NULL,
    [number] nvarchar(max)  NOT NULL,
    [kohtadeArv] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'KohaletoimetamineSet'
CREATE TABLE [dbo].[KohaletoimetamineSet] (
    [kohaletoimetamineID] int IDENTITY(1,1) NOT NULL,
    [aadress] nvarchar(max)  NOT NULL,
    [staatus] nvarchar(max)  NOT NULL,
    [Tellimus_tellimusID] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [tootajaID] in table 'tootajaSet'
ALTER TABLE [dbo].[tootajaSet]
ADD CONSTRAINT [PK_tootajaSet]
    PRIMARY KEY CLUSTERED ([tootajaID] ASC);
GO

-- Creating primary key on [ametID] in table 'ametSet'
ALTER TABLE [dbo].[ametSet]
ADD CONSTRAINT [PK_ametSet]
    PRIMARY KEY CLUSTERED ([ametID] ASC);
GO

-- Creating primary key on [ametimaaratusID] in table 'ametimaaratusSet'
ALTER TABLE [dbo].[ametimaaratusSet]
ADD CONSTRAINT [PK_ametimaaratusSet]
    PRIMARY KEY CLUSTERED ([ametimaaratusID] ASC);
GO

-- Creating primary key on [kategooriaID] in table 'KategooriaSet'
ALTER TABLE [dbo].[KategooriaSet]
ADD CONSTRAINT [PK_KategooriaSet]
    PRIMARY KEY CLUSTERED ([kategooriaID] ASC);
GO

-- Creating primary key on [tooteID] in table 'ToodeSet'
ALTER TABLE [dbo].[ToodeSet]
ADD CONSTRAINT [PK_ToodeSet]
    PRIMARY KEY CLUSTERED ([tooteID] ASC);
GO

-- Creating primary key on [pitsaKoostisosaID] in table 'PitsaKoostisosaSet'
ALTER TABLE [dbo].[PitsaKoostisosaSet]
ADD CONSTRAINT [PK_PitsaKoostisosaSet]
    PRIMARY KEY CLUSTERED ([pitsaKoostisosaID] ASC);
GO

-- Creating primary key on [koostisosaID] in table 'KoostisosaSet'
ALTER TABLE [dbo].[KoostisosaSet]
ADD CONSTRAINT [PK_KoostisosaSet]
    PRIMARY KEY CLUSTERED ([koostisosaID] ASC);
GO

-- Creating primary key on [koostisosaTarnijaID] in table 'KoostisosaTarnijaSet'
ALTER TABLE [dbo].[KoostisosaTarnijaSet]
ADD CONSTRAINT [PK_KoostisosaTarnijaSet]
    PRIMARY KEY CLUSTERED ([koostisosaTarnijaID] ASC);
GO

-- Creating primary key on [TarnijaID] in table 'TarnijaSet'
ALTER TABLE [dbo].[TarnijaSet]
ADD CONSTRAINT [PK_TarnijaSet]
    PRIMARY KEY CLUSTERED ([TarnijaID] ASC);
GO

-- Creating primary key on [klientID] in table 'KlientSet'
ALTER TABLE [dbo].[KlientSet]
ADD CONSTRAINT [PK_KlientSet]
    PRIMARY KEY CLUSTERED ([klientID] ASC);
GO

-- Creating primary key on [tellimusID] in table 'TellimusSet'
ALTER TABLE [dbo].[TellimusSet]
ADD CONSTRAINT [PK_TellimusSet]
    PRIMARY KEY CLUSTERED ([tellimusID] ASC);
GO

-- Creating primary key on [tellimuseTooteID] in table 'TellimuseToodeSet'
ALTER TABLE [dbo].[TellimuseToodeSet]
ADD CONSTRAINT [PK_TellimuseToodeSet]
    PRIMARY KEY CLUSTERED ([tellimuseTooteID] ASC);
GO

-- Creating primary key on [laudID] in table 'LaudSet'
ALTER TABLE [dbo].[LaudSet]
ADD CONSTRAINT [PK_LaudSet]
    PRIMARY KEY CLUSTERED ([laudID] ASC);
GO

-- Creating primary key on [kohaletoimetamineID] in table 'KohaletoimetamineSet'
ALTER TABLE [dbo].[KohaletoimetamineSet]
ADD CONSTRAINT [PK_KohaletoimetamineSet]
    PRIMARY KEY CLUSTERED ([kohaletoimetamineID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [tootaja_tootajaID] in table 'ametimaaratusSet'
ALTER TABLE [dbo].[ametimaaratusSet]
ADD CONSTRAINT [FK_tootajaametimaaratus]
    FOREIGN KEY ([tootaja_tootajaID])
    REFERENCES [dbo].[tootajaSet]
        ([tootajaID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_tootajaametimaaratus'
CREATE INDEX [IX_FK_tootajaametimaaratus]
ON [dbo].[ametimaaratusSet]
    ([tootaja_tootajaID]);
GO

-- Creating foreign key on [amet_ametID] in table 'ametimaaratusSet'
ALTER TABLE [dbo].[ametimaaratusSet]
ADD CONSTRAINT [FK_ametametimaaratus]
    FOREIGN KEY ([amet_ametID])
    REFERENCES [dbo].[ametSet]
        ([ametID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ametametimaaratus'
CREATE INDEX [IX_FK_ametametimaaratus]
ON [dbo].[ametimaaratusSet]
    ([amet_ametID]);
GO

-- Creating foreign key on [Kategooria_kategooriaID] in table 'ToodeSet'
ALTER TABLE [dbo].[ToodeSet]
ADD CONSTRAINT [FK_KategooriaToode]
    FOREIGN KEY ([Kategooria_kategooriaID])
    REFERENCES [dbo].[KategooriaSet]
        ([kategooriaID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_KategooriaToode'
CREATE INDEX [IX_FK_KategooriaToode]
ON [dbo].[ToodeSet]
    ([Kategooria_kategooriaID]);
GO

-- Creating foreign key on [Toode_tooteID] in table 'PitsaKoostisosaSet'
ALTER TABLE [dbo].[PitsaKoostisosaSet]
ADD CONSTRAINT [FK_ToodePitsaKoostisosa]
    FOREIGN KEY ([Toode_tooteID])
    REFERENCES [dbo].[ToodeSet]
        ([tooteID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ToodePitsaKoostisosa'
CREATE INDEX [IX_FK_ToodePitsaKoostisosa]
ON [dbo].[PitsaKoostisosaSet]
    ([Toode_tooteID]);
GO

-- Creating foreign key on [Koostisosa_koostisosaID] in table 'PitsaKoostisosaSet'
ALTER TABLE [dbo].[PitsaKoostisosaSet]
ADD CONSTRAINT [FK_KoostisosaPitsaKoostisosa]
    FOREIGN KEY ([Koostisosa_koostisosaID])
    REFERENCES [dbo].[KoostisosaSet]
        ([koostisosaID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_KoostisosaPitsaKoostisosa'
CREATE INDEX [IX_FK_KoostisosaPitsaKoostisosa]
ON [dbo].[PitsaKoostisosaSet]
    ([Koostisosa_koostisosaID]);
GO

-- Creating foreign key on [Toode_tooteID] in table 'TellimuseToodeSet'
ALTER TABLE [dbo].[TellimuseToodeSet]
ADD CONSTRAINT [FK_ToodeTellimuseToode]
    FOREIGN KEY ([Toode_tooteID])
    REFERENCES [dbo].[ToodeSet]
        ([tooteID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ToodeTellimuseToode'
CREATE INDEX [IX_FK_ToodeTellimuseToode]
ON [dbo].[TellimuseToodeSet]
    ([Toode_tooteID]);
GO

-- Creating foreign key on [Klient_klientID] in table 'TellimusSet'
ALTER TABLE [dbo].[TellimusSet]
ADD CONSTRAINT [FK_KlientTellimus]
    FOREIGN KEY ([Klient_klientID])
    REFERENCES [dbo].[KlientSet]
        ([klientID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_KlientTellimus'
CREATE INDEX [IX_FK_KlientTellimus]
ON [dbo].[TellimusSet]
    ([Klient_klientID]);
GO

-- Creating foreign key on [Laud_laudID] in table 'TellimusSet'
ALTER TABLE [dbo].[TellimusSet]
ADD CONSTRAINT [FK_LaudTellimus]
    FOREIGN KEY ([Laud_laudID])
    REFERENCES [dbo].[LaudSet]
        ([laudID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LaudTellimus'
CREATE INDEX [IX_FK_LaudTellimus]
ON [dbo].[TellimusSet]
    ([Laud_laudID]);
GO

-- Creating foreign key on [Tellimus_tellimusID] in table 'TellimuseToodeSet'
ALTER TABLE [dbo].[TellimuseToodeSet]
ADD CONSTRAINT [FK_TellimusTellimuseToode]
    FOREIGN KEY ([Tellimus_tellimusID])
    REFERENCES [dbo].[TellimusSet]
        ([tellimusID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TellimusTellimuseToode'
CREATE INDEX [IX_FK_TellimusTellimuseToode]
ON [dbo].[TellimuseToodeSet]
    ([Tellimus_tellimusID]);
GO

-- Creating foreign key on [Tellimus_tellimusID] in table 'KohaletoimetamineSet'
ALTER TABLE [dbo].[KohaletoimetamineSet]
ADD CONSTRAINT [FK_TellimusKohaletoimetamine]
    FOREIGN KEY ([Tellimus_tellimusID])
    REFERENCES [dbo].[TellimusSet]
        ([tellimusID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TellimusKohaletoimetamine'
CREATE INDEX [IX_FK_TellimusKohaletoimetamine]
ON [dbo].[KohaletoimetamineSet]
    ([Tellimus_tellimusID]);
GO

-- Creating foreign key on [Koostisosa_koostisosaID] in table 'KoostisosaTarnijaSet'
ALTER TABLE [dbo].[KoostisosaTarnijaSet]
ADD CONSTRAINT [FK_KoostisosaKoostisosaTarnija]
    FOREIGN KEY ([Koostisosa_koostisosaID])
    REFERENCES [dbo].[KoostisosaSet]
        ([koostisosaID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_KoostisosaKoostisosaTarnija'
CREATE INDEX [IX_FK_KoostisosaKoostisosaTarnija]
ON [dbo].[KoostisosaTarnijaSet]
    ([Koostisosa_koostisosaID]);
GO

-- Creating foreign key on [Tarnija_TarnijaID] in table 'KoostisosaTarnijaSet'
ALTER TABLE [dbo].[KoostisosaTarnijaSet]
ADD CONSTRAINT [FK_TarnijaKoostisosaTarnija]
    FOREIGN KEY ([Tarnija_TarnijaID])
    REFERENCES [dbo].[TarnijaSet]
        ([TarnijaID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TarnijaKoostisosaTarnija'
CREATE INDEX [IX_FK_TarnijaKoostisosaTarnija]
ON [dbo].[KoostisosaTarnijaSet]
    ([Tarnija_TarnijaID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------