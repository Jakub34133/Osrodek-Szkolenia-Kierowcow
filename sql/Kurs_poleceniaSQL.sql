---------------------------------------------------------------------
-- PSIN_C10: 
---------------------------------------------------------------------


---------------------------------------------------------------------
-- Procedury SELECT
---------------------------------------------------------------------

-- SELECT dla wyświetlania danych kursów w tabeli

CREATE OR ALTER PROCEDURE dbo.Kurs_Pokaz
AS
BEGIN
SELECT dbo.Kurs.IdKurs, dbo.Kursant.Imie + ' ' + dbo.Kursant.Nazwisko + ' (' + dbo.Kursant.Miejscowosc + ')' AS [KursantDane],
dbo.StanKursu.Nazwa AS [StanKursuNazwa], dbo.Kategoria.Skrot AS [KategoriaSkrot],
dbo.Kurs.Nazwa AS [KursNazwa], DataRozpoczecia, DataZakonczenia, Cena, TerminPlatnosci, Zaplacono
FROM dbo.Kurs
	INNER JOIN dbo.Kategoria
	ON dbo.Kurs.IdKategoria = dbo.Kategoria.IdKategoria
		INNER JOIN dbo.Kursant
		ON dbo.Kurs.IdKursant = dbo.Kursant.IdKursant
			INNER JOIN dbo.StanKursu
			ON dbo.Kurs.IdStanKursu = dbo.StanKursu.IdStanKursu
ORDER BY DataRozpoczecia DESC;
END;
GO

-- SELECT dla wybierania Kursantów w formularzu

CREATE OR ALTER PROCEDURE dbo.Kursant_PokazSlownik
AS
BEGIN
SELECT IdKursant, dbo.Kursant.Imie + ' ' + dbo.Kursant.Nazwisko + ' (' + dbo.Kursant.Miejscowosc + ')' AS [KursantDane]
FROM dbo.Kursant
ORDER BY Nazwisko ASC, Imie ASC;
END;
GO

-- SELECT dla wybierania Kategorii w formularzu

CREATE OR ALTER PROCEDURE dbo.Kategoria_PokazSlownik
AS
BEGIN
SELECT IdKategoria, Skrot
FROM dbo.Kategoria
ORDER BY IdKategoria;
END;
GO

-- SELECT dla wybierania StanuKursu w formularzu

CREATE OR ALTER PROCEDURE dbo.StanKursu_PokazSlownik
AS
BEGIN
SELECT IdStanKursu, Nazwa
FROM dbo.StanKursu
ORDER BY IdStanKursu;
END;
GO

-- SELECT do pobrania wiersza, który będzie edytowany

CREATE OR ALTER PROCEDURE dbo.Kurs_Wybierz
@Par_IdKurs int
AS
BEGIN
SELECT IdKategoria, IdKursant, IdStanKursu, Nazwa, DataRozpoczecia, DataZakonczenia, Cena, TerminPlatnosci, Zaplacono
FROM dbo.Kurs
WHERE IdKurs = @Par_IdKurs;
END;
GO

-- SELECT do pobrania największego IdKurs
CREATE OR ALTER PROCEDURE dbo.Kurs_NajwiekszeId
AS
BEGIN
SELECT TOP 1 IdKurs 
FROM dbo.Kurs
ORDER BY IdKurs DESC;
END;
GO

-- C10
-- SELECT do pobrania informacji szczegółowych wybranego kursu
CREATE OR ALTER PROCEDURE dbo.Kurs_Szczegoly
@Par_IdKurs int
AS
BEGIN
SELECT Skrot AS [KategoriaSkrot], dbo.Kategoria.Nazwa AS [KategoriaNazwa],
Imie + ' ' + Nazwisko AS [KursantDane], Miejscowosc AS [KursantMiejscowosc],
dbo.StanKursu.Nazwa AS [StanKursu], dbo.Kurs.Nazwa AS [KursNazwa], 
DataRozpoczecia, DataZakonczenia, Cena, TerminPlatnosci, Zaplacono
FROM dbo.Kurs
	INNER JOIN dbo.Kategoria
	ON dbo.Kategoria.IdKategoria = dbo.Kurs.IdKategoria
		INNER JOIN dbo.Kursant
		ON dbo.Kursant.IdKursant = dbo.Kurs.IdKursant
			INNER JOIN dbo.StanKursu
			ON dbo.StanKursu.IdStanKursu = dbo.Kurs.IdStanKursu
WHERE IdKurs = @Par_IdKurs;
END;
GO

-- SELECT do pobrania tabeli zajęć obowiązujących w wybranym kursie
CREATE OR ALTER PROCEDURE dbo.KursZajecia_Szczegoly
@Par_IdKurs int
AS
BEGIN
SELECT IdZajecia, Marka + ' ' + Model + ' (' + NrRejestracyjny + ')' AS [Pojazd], Imie + ' ' + Nazwisko AS [Instruktor],
Rodzaj, Temat, DataZajecOd, DataZajecDo
FROM dbo.Zajecia
	INNER JOIN dbo.Kurs
	ON dbo.Kurs.IdKurs = dbo.Zajecia.IdKurs
		INNER JOIN dbo.Pojazd
		ON dbo.Pojazd.IdPojazd = dbo.Zajecia.IdPojazd
			INNER JOIN dbo.Instruktor
			ON dbo.Instruktor.IdInstruktor = dbo.Zajecia.IdInstruktor
WHERE dbo.Kurs.IdKurs = @Par_IdKurs
ORDER BY DataZajecOd DESC;
END;
GO

---------------------------------------------------------------------
-- Procedura INSERT
---------------------------------------------------------------------

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

---------------------------------------------------------------------
-- Procedura UPDATE
---------------------------------------------------------------------

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

---------------------------------------------------------------------
-- Procedura DELETE
---------------------------------------------------------------------

CREATE OR ALTER PROCEDURE dbo.Kurs_Usun
@Par_IdKurs int
AS
BEGIN
DELETE dbo.Kurs
WHERE IdKurs = @Par_IdKurs;
END;
GO

