USE pitsarestoran;
GO

CREATE TRIGGER trg_ametimaaratus_logi ON dbo.ametimaaratusSet
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM inserted) AND NOT EXISTS (SELECT 1 FROM deleted)
        INSERT INTO dbo.ametimaaratusLogi (tegevus, kirjeldus)
        SELECT N'lisatud', t.eesnimi + N' ' + t.perekonnanimi + N' ' + i.alguskuupaev + N' ' + a.nimetus
        FROM inserted i
        JOIN dbo.tootajaSet t ON t.tootajaID = i.tootaja_tootajaID
        JOIN dbo.ametSet a ON a.ametID = i.amet_ametID;

    IF EXISTS (SELECT 1 FROM deleted) AND NOT EXISTS (SELECT 1 FROM inserted)
        INSERT INTO dbo.ametimaaratusLogi (tegevus, kirjeldus)
        SELECT N'kustutatud', t.eesnimi + N' ' + t.perekonnanimi + N' ' + d.alguskuupaev + N' ' + a.nimetus
        FROM deleted d
        JOIN dbo.tootajaSet t ON t.tootajaID = d.tootaja_tootajaID
        JOIN dbo.ametSet a ON a.ametID = d.amet_ametID;

    IF EXISTS (SELECT 1 FROM inserted) AND EXISTS (SELECT 1 FROM deleted)
        INSERT INTO dbo.ametimaaratusLogi (tegevus, kirjeldus)
        SELECT N'muudetud',
               t1.eesnimi + N' ' + t1.perekonnanimi + N' ' + d.alguskuupaev + N' ' + a1.nimetus
               + N' -> ' +
               t2.eesnimi + N' ' + t2.perekonnanimi + N' ' + i.alguskuupaev + N' ' + a2.nimetus
        FROM deleted d
        JOIN inserted i ON i.ametimaaratusID = d.ametimaaratusID
        JOIN dbo.tootajaSet t1 ON t1.tootajaID = d.tootaja_tootajaID
        JOIN dbo.ametSet a1 ON a1.ametID = d.amet_ametID
        JOIN dbo.tootajaSet t2 ON t2.tootajaID = i.tootaja_tootajaID
        JOIN dbo.ametSet a2 ON a2.ametID = i.amet_ametID;
END
GO
