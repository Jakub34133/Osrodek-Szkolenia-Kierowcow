------------------------------------------------
-- PSIN_C8
------------------------------------------------


------------------------------------------------
-- SELECT
------------------------------------------------
SELECT IdInstruktor, Imie, Nazwisko, Email, Telefon, Uwagi
FROM dbo.Instruktor
ORDER BY Nazwisko ASC, Imie ASC;
GO

------------------------------------------------
-- INSERT
------------------------------------------------
INSERT dbo.Instruktor 
(IdInstruktor, Imie, Nazwisko, Email, Telefon, Uwagi)
VALUES
(6, 'Krysia', 'Kucharska', 'krysia@gmail.com', '+48 538 090 175', NULL);
GO

------------------------------------------------
-- UPDATE
------------------------------------------------
UPDATE dbo.Instruktor
SET Imie = 'Krysia', 
	Nazwisko = 'Kucharska', 
	Email = 'krysia@gmail.com', 
	Telefon = '+48 600 100 100', 
	Uwagi = NULL
WHERE IdInstruktor = 6;
GO


------------------------------------------------
-- DELETE
------------------------------------------------
DELETE dbo.Instruktor
WHERE IdInstruktor = 6;
GO
