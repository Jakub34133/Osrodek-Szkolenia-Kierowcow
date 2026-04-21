-----------------------------------------------------------------------------------------------
-- PSIN_C11: uwierzytelnianie u¿ytkownika i zarz¹dzanie jego sesj¹
-----------------------------------------------------------------------------------------------------------


-- Definicja tabeli przehowuj¹cej dane kont u¿ytkowników

CREATE TABLE dbo.Uzytkownik
(
IdUzytkownik int IDENTITY(1,1) NOT NULL PRIMARY KEY,
Imie varchar(30) NOT NULL,
Nazwisko varchar(40) NOT NULL,
Konto varchar(30) NOT NULL,
Haslo varchar(100) NOT NULL,
DataZarejestrowania datetime NOT NULL
);
GO

ALTER TABLE dbo.Uzytkownik
ADD CONSTRAINT UN_Uzytkownik_Konto
UNIQUE (Konto);
GO

-- Wstawienie przyk³adowych kont u¿ytkowników
INSERT dbo.Uzytkownik
(Imie, Nazwisko, Konto, Haslo, DataZarejestrowania)
VALUES
('Andrzej', 'Nowak', 'anowak', '$2y$10$gxMVGrKJ0S9exTMG9pOMu.XWSpAsFgv9M4XmzDtE.axlXwBkJT9VK', GETDATE());
GO

INSERT dbo.Uzytkownik
(Imie, Nazwisko, Konto, Haslo, DataZarejestrowania)
VALUES
('Jan', 'Kowalski', 'jkowalski', '$2y$10$hDbg.eACqD3xFLTRH1yvUOYoifJi0XVBToxDB9TiGIrz2ApoUcqP.', GETDATE());
GO
