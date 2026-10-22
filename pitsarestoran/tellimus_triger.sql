USE pitsarestoran;
GO

DROP TRIGGER IF EXISTS dbo.trg_tellimus_topelt;
GO

CREATE TRIGGER trg_tellimus_topelt ON dbo.TellimusSet
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN dbo.TellimusSet t
          ON t.Klient_klientID = i.Klient_klientID
         AND t.kuupaev = i.kuupaev
         AND t.kellaaeg = i.kellaaeg
         AND t.tellimusID <> i.tellimusID
        WHERE i.staatus NOT IN (N'valmis', N'tühistatud', N'broneeritud')
          AND t.staatus NOT IN (N'valmis', N'tühistatud', N'broneeritud')
    )
    BEGIN
        RAISERROR (N'Klient on sel ajal juba teise laua taga.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END
GO
