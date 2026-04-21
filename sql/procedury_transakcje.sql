-----------------------------------------------------------------------------------------------------------
-- BZDN_P3: programowanie operacji CRUD i transakcji
-----------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------------------
-- Kolejnoœæ wstawiania wierszy do bazy danych
-----------------------------------------------------------------------------------------------------------

/*
	(1) [Kategoria], [Kursant], [StanKursu], [Pojazd], [Instruktor]

	(2) [Kurs]

	(3) [EgzaminWewnetrzny], [Zajecia]
*/

-----------------------------------------------------------------------------------------------------------
-- Kolejnoœæ usuwania wierszy z bazy danych
-----------------------------------------------------------------------------------------------------------

/*
	(1) [EgzaminWewnetrzny], [Zajecia]

	(2) [Kurs], [Pojazd], [Instruktor]

	(3) [Kategoria], [Kursant], [StanKursu]
*/

-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-- Procedury
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------
-- [Kursant]
-----------------------------------------------------------------------------------------------------------

-- Wstawianie
CREATE OR ALTER PROCEDURE dbo.Kursant_Wstaw
@Par_IdKursant int, 
@Par_Imie varchar(30), 
@Par_Nazwisko varchar(30), 
@Par_Miejscowosc varchar(50), 
@Par_KodPocztowy char(6), 
@Par_Ulica varchar(50), 
@Par_NumerDomu varchar(10), 
@Par_Email varchar(50), 
@Par_Telefon varchar(20), 
@Par_Uwagi varchar(200)
AS
BEGIN
INSERT dbo.Kursant (IdKursant, Imie, Nazwisko, Miejscowosc, KodPocztowy, Ulica, NumerDomu, Email, Telefon, Uwagi)
VALUES (@Par_IdKursant, @Par_Imie, @Par_Nazwisko, @Par_Miejscowosc, @Par_KodPocztowy, @Par_Ulica, @Par_NumerDomu, @Par_Email, @Par_Telefon, @Par_Uwagi);
END;
GO

-- Modyfikowanie
CREATE OR ALTER PROCEDURE dbo.Kursant_Aktualizuj
@Par_IdKursant int, 
@Par_Imie varchar(30), 
@Par_Nazwisko varchar(30), 
@Par_Miejscowosc varchar(50), 
@Par_KodPocztowy char(6), 
@Par_Ulica varchar(50), 
@Par_NumerDomu varchar(10), 
@Par_Email varchar(50), 
@Par_Telefon varchar(20), 
@Par_Uwagi varchar(200)
AS
BEGIN
UPDATE dbo.Kursant
SET Imie = @Par_Imie,
	Nazwisko = @Par_Nazwisko,
	Miejscowosc = @Par_Miejscowosc, 
	KodPocztowy = @Par_KodPocztowy,
	Ulica = @Par_Ulica, 
	NumerDomu = @Par_NumerDomu, 
	Email = @Par_Email, 
	Telefon = @Par_Telefon, 
	Uwagi = @Par_Uwagi
WHERE IdKursant = @Par_IdKursant;
END;
GO

-- Usuwanie
CREATE OR ALTER PROCEDURE dbo.Kursant_Usun
@Par_IdKursant int
AS
BEGIN
DELETE dbo.Kursant
WHERE IdKursant = @Par_IdKursant;
END;
GO

-----------------------------------------------------------------------------------------------------------
-- [StanKursu]
-----------------------------------------------------------------------------------------------------------

-- Wstawianie
CREATE OR ALTER PROCEDURE dbo.StanKursu_Wstaw
@Par_IdStanKursu int, 
@Par_Nazwa varchar(50)
AS
BEGIN
INSERT dbo.StanKursu (IdStanKursu, Nazwa)
VALUES (@Par_IdStanKursu, @Par_Nazwa);
END;
GO

-- Modyfikowanie
CREATE OR ALTER PROCEDURE dbo.StanKursu_Aktualizuj
@Par_IdStanKursu int, 
@Par_Nazwa varchar(50)
AS
BEGIN
UPDATE dbo.StanKursu
SET Nazwa = @Par_Nazwa
WHERE IdStanKursu = @Par_IdStanKursu;
END;
GO

-- Usuwanie
CREATE OR ALTER PROCEDURE dbo.StanKursu_Usun
@Par_IdStanKursu int
AS
BEGIN
DELETE dbo.StanKursu
WHERE IdStanKursu = @Par_IdStanKursu;
END;
GO

-----------------------------------------------------------------------------------------------------------
-- [Kategoria]
-----------------------------------------------------------------------------------------------------------

-- Wstawianie
CREATE OR ALTER PROCEDURE dbo.Kategoria_Wstaw
@Par_IdKategoria int, 
@Par_Nazwa varchar(50),
@Par_Skrot varchar(10)
AS
BEGIN
INSERT dbo.Kategoria (IdKategoria, Nazwa, Skrot)
VALUES (@Par_IdKategoria, @Par_Nazwa, @Par_Skrot);
END;
GO

-- Modyfikowanie
CREATE OR ALTER PROCEDURE dbo.Kategoria_Aktualizuj
@Par_IdKategoria int, 
@Par_Nazwa varchar(50),
@Par_Skrot varchar(10)
AS
BEGIN
UPDATE dbo.Kategoria
SET Nazwa = @Par_Nazwa,
	Skrot = @Par_Skrot
WHERE IdKategoria = @Par_IdKategoria;
END;
GO

-- Usuwanie
CREATE OR ALTER PROCEDURE dbo.Kategoria_Usun
@Par_IdKategoria int
AS
BEGIN
DELETE dbo.Kategoria
WHERE IdKategoria = @Par_IdKategoria;
END;
GO

-----------------------------------------------------------------------------------------------------------
-- [Pojazd]
-----------------------------------------------------------------------------------------------------------

-- Wstawianie
CREATE OR ALTER PROCEDURE dbo.Pojazd_Wstaw
@Par_IdPojazd int, 
@Par_Marka varchar(20), 
@Par_Model varchar(30), 
@Par_RokProdukcji int, 
@Par_NrRejestracyjny varchar(10), 
@Par_VIN varchar(30), 
@Par_Opis varchar(200)
AS
BEGIN
INSERT dbo.Pojazd (IdPojazd, Marka, Model, RokProdukcji, NrRejestracyjny, VIN, Opis)
VALUES (@Par_IdPojazd, @Par_Marka, @Par_Model, @Par_RokProdukcji, @Par_NrRejestracyjny, @Par_VIN, @Par_Opis);
END;
GO

-- Modyfikowanie
CREATE OR ALTER PROCEDURE dbo.Pojazd_Aktualizuj
@Par_IdPojazd int, 
@Par_Marka varchar(20), 
@Par_Model varchar(30), 
@Par_RokProdukcji int, 
@Par_NrRejestracyjny varchar(10), 
@Par_VIN varchar(30), 
@Par_Opis varchar(200)
AS
BEGIN
UPDATE dbo.Pojazd 
SET Marka = @Par_Marka, 
	Model = @Par_Model, 
	RokProdukcji = @Par_RokProdukcji, 
	NrRejestracyjny = @Par_NrRejestracyjny, 
	VIN = @Par_VIN, 
	Opis = @Par_Opis
WHERE IdPojazd = @Par_IdPojazd;
END;
GO

-- Usuwanie
CREATE OR ALTER PROCEDURE dbo.Pojazd_Usun
@Par_IdPojazd int
AS
BEGIN
DELETE dbo.Pojazd
WHERE IdPojazd = @Par_IdPojazd;
END;
GO

-----------------------------------------------------------------------------------------------------------
-- [Instruktor]
-----------------------------------------------------------------------------------------------------------

-- Wstawianie
CREATE OR ALTER PROCEDURE dbo.Instruktor_Wstaw
@Par_IdInstruktor int, 
@Par_Imie varchar(30), 
@Par_Nazwisko varchar(30), 
@Par_Email varchar(50), 
@Par_Telefon varchar(20), 
@Par_Uwagi varchar(200)
AS
BEGIN
INSERT dbo.Instruktor (IdInstruktor, Imie, Nazwisko, Email, Telefon, Uwagi)
VALUES (@Par_IdInstruktor, @Par_Imie, @Par_Nazwisko, @Par_Email, @Par_Telefon, @Par_Uwagi);
END;
GO

-- Modyfikowanie
CREATE OR ALTER PROCEDURE dbo.Instruktor_Aktualizuj
@Par_IdInstruktor int, 
@Par_Imie varchar(30), 
@Par_Nazwisko varchar(30), 
@Par_Email varchar(50), 
@Par_Telefon varchar(20), 
@Par_Uwagi varchar(200)
AS
BEGIN
UPDATE dbo.Instruktor 
SET Imie = @Par_Imie, 
	Nazwisko = @Par_Nazwisko, 
	Email = @Par_Email, 
	Telefon = @Par_Telefon, 
	Uwagi = @Par_Uwagi
WHERE IdInstruktor = @Par_IdInstruktor;
END;
GO

-- Usuwanie
CREATE OR ALTER PROCEDURE dbo.Instruktor_Usun
@Par_IdInstruktor int
AS
BEGIN
DELETE dbo.Instruktor
WHERE IdInstruktor = @Par_IdInstruktor;
END;
GO

-----------------------------------------------------------------------------------------------------------
-- [Kurs]
-----------------------------------------------------------------------------------------------------------

-- Wstawianie
CREATE OR ALTER PROCEDURE dbo.Kurs_Wstaw
@Par_IdKurs int, 
@Par_IdKategoria int, 
@Par_IdKursant int, 
@Par_IdStanKursu int, 
@Par_Nazwa varchar(50), 
@Par_DataRozpoczecia date, 
@Par_DataZakonczenia date, 
@Par_Cena money, 
@Par_TerminPlatnosci date, 
@Par_Zaplacono money, 
@Par_Opis varchar(200)
AS
BEGIN
INSERT dbo.Kurs (IdKurs, IdKategoria, IdKursant, IdStanKursu, Nazwa, DataRozpoczecia, DataZakonczenia, Cena, TerminPlatnosci, Zaplacono, Opis)
VALUES (@Par_IdKurs, @Par_IdKategoria, @Par_IdKursant, @Par_IdStanKursu, @Par_Nazwa, @Par_DataRozpoczecia, @Par_DataZakonczenia, @Par_Cena, @Par_TerminPlatnosci, @Par_Zaplacono, @Par_Opis);
END;
GO

-- Modyfikowanie
CREATE OR ALTER PROCEDURE dbo.Kurs_Aktualizuj
@Par_IdKurs int, 
@Par_IdKategoria int, 
@Par_IdKursant int, 
@Par_IdStanKursu int, 
@Par_Nazwa varchar(50), 
@Par_DataRozpoczecia date, 
@Par_DataZakonczenia date, 
@Par_Cena money, 
@Par_TerminPlatnosci date, 
@Par_Zaplacono money, 
@Par_Opis varchar(200)
AS
BEGIN
UPDATE dbo.Kurs 
SET IdKategoria = @Par_IdKategoria, 
	IdKursant = @Par_IdKursant, 
	IdStanKursu = @Par_IdStanKursu, 
	Nazwa = @Par_Nazwa, 
	DataRozpoczecia = @Par_DataRozpoczecia, 
	DataZakonczenia = @Par_DataZakonczenia, 
	Cena = @Par_Cena, 
	TerminPlatnosci =  @Par_TerminPlatnosci, 
	Zaplacono = @Par_Zaplacono, 
	Opis = @Par_Opis
WHERE IdKurs = @Par_IdKurs;
END;
GO

-- Usuwanie
CREATE OR ALTER PROCEDURE dbo.Kurs_Usun
@Par_IdKurs int
AS
BEGIN
DELETE dbo.Kurs
WHERE IdKurs = @Par_IdKurs;
END;
GO

-----------------------------------------------------------------------------------------------------------
-- [Zajecia]
-----------------------------------------------------------------------------------------------------------
-- Wstawianie
CREATE OR ALTER PROCEDURE dbo.Zajecia_Wstaw
@Par_IdZajecia int, 
@Par_IdKurs int, 
@Par_IdPojazd int, 
@Par_IdInstruktor int, 
@Par_Rodzaj varchar(20), 
@Par_Temat varchar(50), 
@Par_DataZajecOd datetime, 
@Par_DataZajecDo datetime, 
@Par_Opis varchar(200)
AS
BEGIN
INSERT dbo.Zajecia (IdZajecia, IdKurs, IdPojazd, IdInstruktor, Rodzaj, Temat, DataZajecOd, DataZajecDo, Opis)
VALUES (@Par_IdZajecia, @Par_IdKurs, @Par_IdPojazd, @Par_IdInstruktor, @Par_Rodzaj, @Par_Temat, @Par_DataZajecOd, @Par_DataZajecDo, @Par_Opis);
END;
GO

-- Modyfikowanie
CREATE OR ALTER PROCEDURE dbo.Zajecia_Aktualizuj
@Par_IdZajecia int, 
@Par_IdKurs int, 
@Par_IdPojazd int, 
@Par_IdInstruktor int, 
@Par_Rodzaj varchar(20), 
@Par_Temat varchar(50), 
@Par_DataZajecOd datetime, 
@Par_DataZajecDo datetime, 
@Par_Opis varchar(200)
AS
BEGIN
UPDATE dbo.Zajecia 
SET IdKurs = @Par_IdKurs, 
	IdPojazd = @Par_IdPojazd, 
	IdInstruktor = @Par_IdInstruktor, 
	Rodzaj = @Par_Rodzaj, 
	Temat = @Par_Temat, 
	DataZajecOd = @Par_DataZajecOd, 
	DataZajecDo = @Par_DataZajecDo, 
	Opis = @Par_Opis
WHERE IdZajecia = @Par_IdZajecia;
END;
GO

-- Usuwanie
CREATE OR ALTER PROCEDURE dbo.Zajecia_Usun
@Par_IdZajecia int
AS
BEGIN
DELETE dbo.Zajecia
WHERE IdZajecia = @Par_IdZajecia;
END;
GO

-----------------------------------------------------------------------------------------------------------
-- [EgzaminWewnetrzny]
-----------------------------------------------------------------------------------------------------------

-- Wstawianie
CREATE OR ALTER PROCEDURE dbo.EgzaminWewnetrzny_Wstaw
@Par_IdEgzamin int, 
@Par_IdKurs int, 
@Par_IdEgzaminator int, 
@Par_Nazwa varchar(50), 
@Par_Rodzaj varchar(50), 
@Par_WynikEgzaminu bit, 
@Par_WynikEgzaminuPunkty smallint, 
@Par_DataEgzaminu datetime, 
@Par_Opis varchar(200)
AS
BEGIN
INSERT dbo.EgzaminWewnetrzny (IdEgzamin, IdKurs, IdEgzaminator, Nazwa, Rodzaj, WynikEgzaminu, WynikEgzaminuPunkty, DataEgzaminu, Opis)
VALUES (@Par_IdEgzamin, @Par_IdKurs, @Par_IdEgzaminator, @Par_Nazwa, @Par_Rodzaj, @Par_WynikEgzaminu, @Par_WynikEgzaminuPunkty, @Par_DataEgzaminu, @Par_Opis);
END;
GO

-- Modyfikowanie
CREATE OR ALTER PROCEDURE dbo.EgzaminWewnetrzny_Aktualizuj
@Par_IdEgzamin int, 
@Par_IdKurs int, 
@Par_IdEgzaminator int, 
@Par_Nazwa varchar(50), 
@Par_Rodzaj varchar(50), 
@Par_WynikEgzaminu bit, 
@Par_WynikEgzaminuPunkty smallint, 
@Par_DataEgzaminu datetime, 
@Par_Opis varchar(200)
AS
BEGIN
UPDATE dbo.EgzaminWewnetrzny 
SET IdKurs = @Par_IdKurs, 
	IdEgzaminator = @Par_IdEgzaminator, 
	Nazwa = @Par_Nazwa, 
	Rodzaj = @Par_Rodzaj, 
	WynikEgzaminu = @Par_WynikEgzaminu, 
	WynikEgzaminuPunkty = @Par_WynikEgzaminuPunkty, 
	DataEgzaminu = @Par_DataEgzaminu, 
	Opis = @Par_Opis
WHERE IdEgzamin = @Par_IdEgzamin;
END;
GO

-- Usuwanie
CREATE OR ALTER PROCEDURE dbo.EgzaminWewnetrzny_Usun
@Par_IdEgzamin int
AS
BEGIN
DELETE dbo.EgzaminWewnetrzny 
WHERE IdEgzamin = @Par_IdEgzamin;
END;
GO


-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-- Transakcje
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------
-- Archiwizowanie danych tabeli [Instruktor]
----------------------------------------------------------------------------------------
CREATE TABLE dbo.Instruktor_Kopia
(
	IdInstruktor int NOT NULL PRIMARY KEY,
	Imie varchar(30) NOT NULL,
	Nazwisko varchar(30) NOT NULL,
	Email varchar(50) NOT NULL,
	Telefon varchar(20) NOT NULL,
	Uwagi varchar(200) NULL,
	DataArchiwizacji datetime NOT NULL
);
GO

CREATE OR ALTER PROCEDURE dbo.Instruktor_Archiwizuj
@Par_IdInstruktor int
AS
BEGIN
-- Przerwanie transakcji (runtime error)
SET XACT_ABORT ON;
BEGIN TRANSACTION

-- (1) skopiowanie danych instruktora do tabeli archiwalnej
INSERT dbo.Instruktor_Kopia 
(IdInstruktor, Imie, Nazwisko, Email, Telefon, Uwagi, DataArchiwizacji)
SELECT IdInstruktor, Imie, Nazwisko, Email, Telefon, Uwagi, GETDATE()
FROM dbo.Instruktor
WHERE IdInstruktor = @Par_IdInstruktor;

-- Wprowadzenie opóŸnienia
WAITFOR DELAY '00:00:15';

-- (2) usuniêcie danych z tabeli orginalnej
DELETE dbo.Instruktor
WHERE IdInstruktor = @Par_IdInstruktor;

-- () wycofanie lub zatwierdzenie transakcji
IF (@@ERROR <> 0)
	BEGIN
	RAISERROR('Archwizacja danych Instruktorów nie powiod³a siê', 16, 1);
	ROLLBACK TRANSACTION;
	END
ELSE
	COMMIT TRANSACTION;
END;
GO

----------------------------------------------------------------------------------------
-- Monitorowanie zmian wp³at do kursu [Kurs.Zaplacono]
----------------------------------------------------------------------------------------
CREATE TABLE dbo.KursZaplacono_Historia
(
	IdKursZaplacono int NOT NULL PRIMARY KEY IDENTITY(1,1),
	IdKurs int NOT NULL,
	DataGodzZmiany datetime NOT NULL,
	ZaplaconoPrzed money NOT NULL,
	ZaplaconoPo money NOT NULL
);
GO

CREATE OR ALTER PROCEDURE dbo.Kurs_ZmienZaplacono
@Par_IdKurs int,
@Par_Zaplacono money
AS
BEGIN
-- Przerwanie transakcji (runtime error)
SET XACT_ABORT ON;
BEGIN TRANSACTION

DECLARE @Var_ZaplaconoPrzed money;

SELECT @Var_ZaplaconoPrzed = Zaplacono
FROM dbo.Kurs
WHERE IdKurs = @Par_IdKurs;

-- (1) Modyfikacja Zaplaty Kursu
UPDATE dbo.Kurs
SET Zaplacono = @Par_Zaplacono
WHERE IdKurs = @Par_IdKurs;

-- (2) Dodanie wiersza w tabeli nowych historii cen
IF (@Var_ZaplaconoPrzed <> @Par_Zaplacono) -- czy takie same ceny
	INSERT dbo.KursZaplacono_Historia 
	(IdKurs, DataGodzZmiany, ZaplaconoPrzed, ZaplaconoPo)
	VALUES
	(@Par_IdKurs, GETDATE(), @Var_ZaplaconoPrzed, @Par_Zaplacono)


-- () wycofanie lub zatwierdzenie transakcji
IF (@@ERROR <> 0)
	BEGIN
	RAISERROR('Modyfikacja zap³aty kursu nie powiod³a siê', 16, 1);
	ROLLBACK TRANSACTION;
	END
ELSE
	COMMIT TRANSACTION;
END;
GO