-----------------------------------------------------------------------------------------------------------
-- BZDN_P3: programowanie operacji CRUD i transakcji
-----------------------------------------------------------------------------------------------------------


---------------------------------
-- Tabele
---------------------------------

CREATE TABLE dbo.Kurs
(
	IdKurs int NOT NULL,
	IdKategoria int NOT NULL,
	IdKursant int NOT NULL,
	IdStanKursu int NOT NULL,
	Nazwa varchar(50) NOT NULL,
	DataRozpoczecia date NOT NULL,
	DataZakonczenia date NOT NULL,
	Cena money NOT NULL,
	TerminPlatnosci date NOT NULL,
	Zaplacono money NOT NULL,
	Opis varchar(200) NULL
);
GO

CREATE TABLE dbo.Kursant
(
	IdKursant int NOT NULL,
	Imie varchar(30) NOT NULL,
	Nazwisko varchar(30) NOT NULL,
	Miejscowosc varchar(50) NOT NULL,
	KodPocztowy char(6) NOT NULL,
	Ulica varchar(50) NULL,
	NumerDomu varchar(10) NOT NULL,
	Email varchar(50) NULL,
	Telefon varchar(20) NOT NULL,
	Uwagi varchar(200) NULL
);
GO

CREATE TABLE dbo.Kategoria
(
	IdKategoria int NOT NULL,
	Nazwa varchar(50) NOT NULL,
	Skrot varchar(10) NULL
);
GO

CREATE TABLE dbo.StanKursu
(
	IdStanKursu int NOT NULL,
	Nazwa varchar(50) NOT NULL
);
GO

CREATE TABLE dbo.EgzaminWewnetrzny
(
	IdEgzamin int NOT NULL,
	IdKurs int NOT NULL,
	IdEgzaminator int NOT NULL,
	Nazwa varchar(50) NOT NULL,
	Rodzaj varchar(50) NOT NULL,
	WynikEgzaminu bit NOT NULL,
	WynikEgzaminuPunkty smallint NULL,
	DataEgzaminu datetime NOT NULL,
	Opis varchar(200) NULL
);
GO

CREATE TABLE dbo.Instruktor
(
	IdInstruktor int NOT NULL,
	Imie varchar(30) NOT NULL,
	Nazwisko varchar(30) NOT NULL,
	Email varchar(50) NOT NULL,
	Telefon varchar(20) NOT NULL,
	Uwagi varchar(200) NULL
);
GO

CREATE TABLE dbo.Pojazd
(
	IdPojazd int NOT NULL,
	Marka varchar(20) NOT NULL,
	Model varchar(30) NOT NULL,
	RokProdukcji int NOT NULL,
	NrRejestracyjny varchar(10) NOT NULL,
	VIN varchar(30) NOT NULL,
	Opis varchar(200) NULL
);
GO

CREATE TABLE dbo.Zajecia
(
	IdZajecia int NOT NULL,
	IdKurs int NOT NULL,
	IdPojazd int NOT NULL,
	IdInstruktor int NOT NULL,
	Rodzaj varchar(20) NOT NULL,
	Temat varchar(50) NOT NULL,
	DataZajecOd datetime NOT NULL,
	DataZajecDo datetime NOT NULL,
	Opis varchar(200) NULL
);
GO

---------------------------------
-- Klucze g³ówne
---------------------------------

ALTER TABLE dbo.Kurs
ADD CONSTRAINT PK_Kurs
PRIMARY KEY (IdKurs);
GO

ALTER TABLE dbo.Kursant
ADD CONSTRAINT PK_Kursant
PRIMARY KEY (IdKursant);
GO

ALTER TABLE dbo.Kategoria
ADD CONSTRAINT PK_Kategoria
PRIMARY KEY (IdKategoria);
GO

ALTER TABLE dbo.StanKursu
ADD CONSTRAINT PK_StanKursu
PRIMARY KEY (IdStanKursu);
GO

ALTER TABLE dbo.EgzaminWewnetrzny
ADD CONSTRAINT PK_EgzaminWewnetrzny
PRIMARY KEY (IdEgzamin);
GO

ALTER TABLE dbo.Instruktor
ADD CONSTRAINT PK_Instruktor
PRIMARY KEY (IdInstruktor);
GO

ALTER TABLE dbo.Pojazd
ADD CONSTRAINT PK_Pojazd
PRIMARY KEY (IdPojazd);
GO

ALTER TABLE dbo.Zajecia
ADD CONSTRAINT PK_Zajecia
PRIMARY KEY (IdZajecia);
GO

---------------------------------
-- Klucze obce (powi¹zania)
---------------------------------

ALTER TABLE dbo.Kurs
ADD CONSTRAINT FK_Kurs_Kursant
FOREIGN KEY (IdKursant)
REFERENCES dbo.Kursant(IdKursant);
GO

ALTER TABLE dbo.Kurs
ADD CONSTRAINT FK_Kurs_Kategoria
FOREIGN KEY (IdKategoria)
REFERENCES dbo.Kategoria(IdKategoria);
GO

ALTER TABLE dbo.Kurs
ADD CONSTRAINT FK_Kurs_StanKursu
FOREIGN KEY (IdStanKursu)
REFERENCES dbo.StanKursu(IdStanKursu);
GO

ALTER TABLE dbo.Zajecia
ADD CONSTRAINT FK_Zajecia_Kurs
FOREIGN KEY (IdKurs)
REFERENCES dbo.Kurs(Idkurs);
GO

ALTER TABLE dbo.Zajecia
ADD CONSTRAINT FK_Zajecia_Pojazd
FOREIGN KEY (IdPojazd)
REFERENCES dbo.Pojazd(IdPojazd);
GO

ALTER TABLE dbo.Zajecia
ADD CONSTRAINT FK_Zajecia_Instruktor
FOREIGN KEY (IdInstruktor)
REFERENCES dbo.Instruktor(IdInstruktor);
GO

ALTER TABLE dbo.EgzaminWewnetrzny
ADD CONSTRAINT FK_Egzamin_Kurs
FOREIGN KEY (IdKurs)
REFERENCES dbo.Kurs(IdKurs);
GO

ALTER TABLE dbo.EgzaminWewnetrzny
ADD CONSTRAINT FK_Egzamin_Instruktor
FOREIGN KEY (IdEgzaminator)
REFERENCES dbo.Instruktor(IdInstruktor);
GO

---------------------------------
-- Ograniczenia
---------------------------------

-- Cena: nieujemna
ALTER TABLE dbo.Kurs
ADD CONSTRAINT CK_Kurs_Cena
CHECK (Cena >= 0);
GO

-- Zaplata: nieujemna
ALTER TABLE dbo.Kurs
ADD CONSTRAINT CK_Kurs_Zaplacono
CHECK (Zaplacono >= 0);
GO

---------------------------------
-- Data zakoñczenia nie mo¿e byæ wczeœniejsza ni¿ data rozpoczêcia kursu
ALTER TABLE dbo.Kurs
ADD CONSTRAINT CK_Kurs_DataZakonczenia
CHECK (DataZakonczenia >= DataRozpoczecia);
GO

-- Nie mo¿na zap³aciæ wiêcej ni¿ kosztuje kurs
ALTER TABLE dbo.Kurs
ADD CONSTRAINT CK_Kurs_Zaplacono2
CHECK (Cena >= Zaplacono);
GO

-- Data zakoñczenia nie mo¿e byæ wczeœniejsza ni¿ data rozpoczêcia zajêæ
ALTER TABLE dbo.Zajecia
ADD CONSTRAINT CK_Zajecia_DataZajecDo
CHECK (DataZajecDo >= DataZajecOd);
GO

---------------------------------
-- Kod Pocztowy: 2cyfry, myœlnik, 3cyfry
ALTER TABLE dbo.Kursant
ADD CONSTRAINT CK_Kursant_KodPocztowy
CHECK (KodPocztowy LIKE '[0-9][0-9]-[0-9][0-9][0-9]');
GO

-- Rok Produkcji: 4cyfry, powy¿ej roku 999
ALTER TABLE dbo.Pojazd
ADD CONSTRAINT CK_Pojazd_RokProdukcji
CHECK (RokProdukcji LIKE '[1-9][0-9][0-9][0-9]');
GO

-- Numer VIN: d³ugoœæ 17znaków liczbowych/du¿ych liter, bez liter I, O, Q
ALTER TABLE dbo.Pojazd
ADD CONSTRAINT CK_Pojazd_VIN
CHECK (LEN(VIN) = 17 AND -- d³ugoœæ 17 znaków
	VIN NOT LIKE '%I%' AND -- Bez liter I, O, Q
	VIN NOT LIKE '%O%' AND
	VIN NOT LIKE '%Q%' AND
	VIN NOT LIKE '%[^A-Z0-9]%'); -- (^) - negacja, wszystko oprócz [A-Z0-9]
GO

-- Numer rejestracyjny: 2-3 litery, liczba, 3-4znaki
ALTER TABLE dbo.Pojazd
ADD CONSTRAINT CK_Pojazd_NrRejestracyjny
CHECK (NrRejestracyjny LIKE '[A-Z][A-Z] [A-Z0-9][A-Z0-9][A-Z0-9][A-Z0-9]' OR
	NrRejestracyjny LIKE '[A-Z][A-Z][A-Z] [A-Z0-9][A-Z0-9][A-Z0-9][A-Z0-9]' OR
	NrRejestracyjny LIKE '[A-Z][A-Z] [A-Z0-9][A-Z0-9][A-Z0-9][A-Z0-9][A-Z0-9]' OR
	NrRejestracyjny LIKE '[A-Z][A-Z][A-Z] [A-Z0-9][A-Z0-9][A-Z0-9][A-Z0-9][A-Z0-9]'); 
GO

---------------------------------
-- Unikalnoœæ kolumn
---------------------------------

ALTER TABLE dbo.Pojazd
ADD CONSTRAINT UN_Pojazd_NrRejestracyjny
UNIQUE (NrRejestracyjny);
GO

ALTER TABLE dbo.Pojazd
ADD CONSTRAINT UN_Pojazd_VIN
UNIQUE (VIN);
GO

ALTER TABLE dbo.StanKursu
ADD CONSTRAINT UN_StanKursu_Nazwa
UNIQUE (Nazwa);
GO

ALTER TABLE dbo.Kategoria
ADD CONSTRAINT UN_Kategoria_Nazwa
UNIQUE (Nazwa);
GO

ALTER TABLE dbo.Kategoria
ADD CONSTRAINT UN_Kategoria_Skrot
UNIQUE (Skrot);
GO

---------------------------------
-- Wartoœci domyœlne
---------------------------------

ALTER TABLE dbo.Kurs
ADD CONSTRAINT DF_Kurs_IdStanKursu
DEFAULT (1) FOR IdStanKursu; --'Wstêpna Rejestracja' na Kurs
GO

ALTER TABLE dbo.Kurs
ADD CONSTRAINT DF_Kurs_Zaplacono
DEFAULT (0) FOR Zaplacono;
GO

ALTER TABLE dbo.Kursant
ADD CONSTRAINT DF_Kursant_Miejscowosc
DEFAULT ('Kalisz') FOR Miejscowosc;
GO

ALTER TABLE dbo.Zajecia
ADD CONSTRAINT DF_Zajecia_Rodzaj
DEFAULT ('Teoretyczne') FOR Rodzaj;
GO

ALTER TABLE dbo.EgzaminWewnetrzny
ADD CONSTRAINT DF_Egzamin_Rodzaj
DEFAULT ('Teoretyczny') FOR Rodzaj;
GO

ALTER TABLE dbo.EgzaminWewnetrzny
ADD CONSTRAINT DF_Egzamin_WynikEgzaminu
DEFAULT (0) FOR WynikEgzaminu; -- wstêpnie 'niezaliczony'
GO
