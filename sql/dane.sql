-----------------------------------------------------------------------------------------------------------
-- BZDN_P3: programowanie operacji CRUD i transakcji
-----------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-- Dodanie wierszy z danymi do tabel
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------
-- [Kursant]
-----------------------------------------------------------------------------------------------------------

EXECUTE dbo.Kursant_Wstaw 1, 'Jan', 'Kowalski', 'Kalisz', '60-050', 'Grunwaldzka', '16', 'jankowalski@poczta.fm', '+48 997 808 220', NULL;
EXECUTE dbo.Kursant_Wstaw 2, 'Anna', 'Kowalska', 'Kalisz', '60-050', NULL, '16B', 'annakowalska@poczta.fm', '+48 607 776 120', NULL;
EXECUTE dbo.Kursant_Wstaw 3, 'Kamil', 'Nowak', 'Ostrów', '55-150', 'Pó³nocna', '3/4', 'superkamil@gmail.com', '+48 100 508 320', NULL;
EXECUTE dbo.Kursant_Wstaw 4, 'Jolanta', 'Zaj¹c', 'Kalisz', '60-050', 'Kostki', '42', 'jolanta@gmail.com', '+48 699 021 018', NULL;
EXECUTE dbo.Kursant_Wstaw 5, 'Jakub', 'Michalski', 'Ostrów', '55-150', 'Jagodowa', '12', 'jakubmichalski22@o2.pl', '+48 513 899 620', NULL;
EXECUTE dbo.Kursant_Wstaw 6, 'Zuzanna', 'Walczak', 'Sulis³awice', '34-250', 'Œwitezianki', '20', 'zuza@gmail.com', '+48 723 153 246', NULL;
EXECUTE dbo.Kursant_Wstaw 7, 'Eryk', 'Symañski', 'Leziona', '58-354', NULL, '6', NULL, '+48 724 652 984', NULL;
EXECUTE dbo.Kursant_Wstaw 8, 'Natala', 'Pawlak', 'Kalisz', '60-050', 'Poznañska', '13B', NULL, '+48 662 137 299', NULL;
EXECUTE dbo.Kursant_Wstaw 9, 'Marzena', 'Wysocka', 'Leziona', '58-354', NULL, '6', 'marzenawysocka@gmail.com', '+48 791 896 988', NULL;
EXECUTE dbo.Kursant_Wstaw 10, 'Borys', 'Nowak', 'Kalisz', '55-150', 'Poznañska', '114', 'nowakborys9@o2.pl', '+48 603 536 170', NULL;
GO

-----------------------------------------------------------------------------------------------------------
-- [StanKursu]
-----------------------------------------------------------------------------------------------------------

EXECUTE dbo.StanKursu_Wstaw 1, 'Zarejestrowany';
EXECUTE dbo.StanKursu_Wstaw 2, 'W trakcie teorii';
EXECUTE dbo.StanKursu_Wstaw 3, 'Zakoñczono teoriê';
EXECUTE dbo.StanKursu_Wstaw 4, 'W trakcie jazd';
EXECUTE dbo.StanKursu_Wstaw 5, 'Zakoñczono jazdy';
EXECUTE dbo.StanKursu_Wstaw 6, 'Oczekuje na egzamin wewnêtrzny';
EXECUTE dbo.StanKursu_Wstaw 7, 'Egzamin wewnêtrzny zaliczony';
EXECUTE dbo.StanKursu_Wstaw 8, 'Oczekuje na egzamin pañstwowy';
EXECUTE dbo.StanKursu_Wstaw 9, 'Egzamin pañstwowy zaliczony';
EXECUTE dbo.StanKursu_Wstaw 10, 'Niezaliczony';
EXECUTE dbo.StanKursu_Wstaw 11, 'Przerwany';
EXECUTE dbo.StanKursu_Wstaw 12, 'Ukoñczony';
GO

-----------------------------------------------------------------------------------------------------------
-- [Kategoria]
-----------------------------------------------------------------------------------------------------------

EXECUTE dbo.Kategoria_Wstaw 1, 'Motorower', 'AM';
EXECUTE dbo.Kategoria_Wstaw 2, 'Ka¿dy motocykl', 'A';
EXECUTE dbo.Kategoria_Wstaw 3, 'Czteroko³owiec', 'B1';
EXECUTE dbo.Kategoria_Wstaw 4, 'Pojazd samochodowy o masie < 3,5ton', 'B';
EXECUTE dbo.Kategoria_Wstaw 5, 'Zespó³ pojazdów kat. B i przyczepy', 'B+E';
EXECUTE dbo.Kategoria_Wstaw 6, 'Pojazd samochodowy o masie > 3,5ton', 'C';
EXECUTE dbo.Kategoria_Wstaw 7, 'Zespó³ pojazdów kat. C i przyczepy', 'C+E';
EXECUTE dbo.Kategoria_Wstaw 8, 'Autobus', 'D';
EXECUTE dbo.Kategoria_Wstaw 9, 'Zespó³ pojazdów kat. D i przyczepy', 'D+E';
EXECUTE dbo.Kategoria_Wstaw 10, 'Pojazd wolnobie¿ny', 'T';
GO

-----------------------------------------------------------------------------------------------------------
-- [Pojazd]
-----------------------------------------------------------------------------------------------------------

EXECUTE dbo.Pojazd_Wstaw 1, 'Toyota', 'Yaris', 2010, 'PKA 1FD5', '0123456789ABCDEFG', NULL;
EXECUTE dbo.Pojazd_Wstaw 2, 'Kia', 'Rio', 2006, 'PK 89DA', '4T1BF22K8YU005156', NULL;
EXECUTE dbo.Pojazd_Wstaw 3, 'Hyundai', 'i20', 2009, 'PA 1EGAC', '1FTPW14585FA81441', 'W konserwacji';
EXECUTE dbo.Pojazd_Wstaw 4, 'Renault', 'Clio', 2009, 'MKA 9DFGB', '1G2ZJ57B594220317', NULL;
EXECUTE dbo.Pojazd_Wstaw 5, 'Audi', 'A4', 2011, 'MA E4E5', 'WAUHFBFR0A0010190', NULL;
EXECUTE dbo.Pojazd_Wstaw 6, 'Ford', 'Fiesta', 2008, 'MA SF3D6', 'WAUDG74FX5ND88616', NULL;
EXECUTE dbo.Pojazd_Wstaw 7, 'Kia', 'Rio', 2007, 'PK F5G12', '5XYKT4A18DG418921', NULL;
EXECUTE dbo.Pojazd_Wstaw 8, 'Kia', 'Rio', 2007, 'PK TG6F', 'KNDJT2A23A7159904', NULL;
EXECUTE dbo.Pojazd_Wstaw 9, 'Toyota', 'Yaris', 2014, 'PA CD5A2', 'JTDBE38K720072804', NULL;
EXECUTE dbo.Pojazd_Wstaw 10, 'Hyundai', 'i20', 2012, 'PKA T5HJ', 'KMHJG35F414262494', NULL;
EXECUTE dbo.Pojazd_Wstaw 11, 'Yamaha', 'MT-07', 2012, 'PK MT80', 'JHMRA3810WC201700', NULL;
GO

-----------------------------------------------------------------------------------------------------------
-- [Instruktor]
-----------------------------------------------------------------------------------------------------------

EXECUTE dbo.Instruktor_Wstaw 1, 'Przemys³aw', 'Rogalski', 'rogalskiprzemyslaw@osk.pl', '123 234 345', NULL;
EXECUTE dbo.Instruktor_Wstaw 2, 'Celina', 'Borkowska', 'borkowskacelina@osk.pl', '+48 691 293 237', NULL;
EXECUTE dbo.Instruktor_Wstaw 3, 'Eryk', 'WoŸniak', 'wozniakeryk@osk.pl', '+48 517 829 380', NULL;
EXECUTE dbo.Instruktor_Wstaw 4, 'Aureliusz', 'Walczak', 'walczakaureliusz@osk.pl', '+48 604 184 631', NULL;
EXECUTE dbo.Instruktor_Wstaw 5, 'Lubomir', 'Adamczyk', 'adamczyklubomir@osk.pl', '+48 721 853 351', NULL;
EXECUTE dbo.Instruktor_Wstaw 6, 'Karol', 'Maciejewski', 'maciejewskikarol@osk.pl', '+48 517 690 242', NULL;
EXECUTE dbo.Instruktor_Wstaw 7, 'Karol', 'Jab³oñski', 'jablonskikarol@osk.pl', '+48 920 517 340', NULL;
EXECUTE dbo.Instruktor_Wstaw 8, 'Rados³aw', 'Koz³owski', 'kozlowskiradoslaw@osk.pl', '+48 532 149 497', NULL;
EXECUTE dbo.Instruktor_Wstaw 9, 'Patryk', 'Adamski', 'adamskipatryk@osk.pl', '+48 029 580 910', NULL;
EXECUTE dbo.Instruktor_Wstaw 10, 'Micha³', 'Chocho³owski', 'chocholowskimichal@osk.pl', '+48 728 920 483', NULL;
GO

-----------------------------------------------------------------------------------------------------------
-- [Kurs]
-----------------------------------------------------------------------------------------------------------

EXECUTE dbo.Kurs_Wstaw 1, 4, 1, 12, 'Kurs na samochód osobowy kat. B', '2025-01-15', '2025-04-16', 2600, '2025-01-30', 2600, NULL;
EXECUTE dbo.Kurs_Wstaw 2, 8, 3, 11, 'Kurs na Autobus kat. D', '2025-02-01', '2025-05-01', 3500, '2025-02-28', 3500, 'Kursant zrezygnowa³ z kontynuowania kursu';
EXECUTE dbo.Kurs_Wstaw 3, 4, 5, 4, 'Kurs na samochód osobowy kat. B', '2025-05-01', '2025-08-01', 2600, '2025-05-30', 1100, NULL;
EXECUTE dbo.Kurs_Wstaw 4, 4, 4, 4, 'Kurs na samochód osobowy kat. B', '2025-05-01', '2025-08-01', 2600, '2025-05-30', 2200, NULL;
EXECUTE dbo.Kurs_Wstaw 5, 2, 9, 2, 'Kurs na motocykl kat. A', '2025-05-11', '2025-08-12', 1800, '2025-06-30', 0, NULL;
EXECUTE dbo.Kurs_Wstaw 6, 2, 10, 2, 'Kurs na motocykl kat. A', '2025-05-11', '2025-08-12', 1800, '2025-06-30', 0, NULL;
EXECUTE dbo.Kurs_Wstaw 7, 7, 3, 1, 'Kurs na pojazd ciê¿arowy C+E', '2025-08-20', '2025-11-20', 4600, '2025-09-30', 0, NULL;
EXECUTE dbo.Kurs_Wstaw 8, 4, 2, 1, 'Kurs na samochód osobowy kat. B', '2025-10-11', '2026-01-12', 2600, '2025-11-30', 0, NULL;
EXECUTE dbo.Kurs_Wstaw 9, 4, 6, 1, 'Kurs na samochód osobowy kat. B', '2025-10-11', '2026-01-12', 2600, '2025-11-30', 0, NULL;
EXECUTE dbo.Kurs_Wstaw 10, 4, 7, 1, 'Kurs na samochód osobowy kat. B', '2025-10-11', '2026-01-12', 2600, '2025-11-30', 0, NULL;
GO

-----------------------------------------------------------------------------------------------------------
-- [Zajecia]
-----------------------------------------------------------------------------------------------------------

EXECUTE dbo.Zajecia_Wstaw 1, 3, 7, 2, 'Praktyczne', 'Jazda po mieœcie', '2025-05-15 10:00:00', '2025-05-15 11:30:00', NULL;
EXECUTE dbo.Zajecia_Wstaw 2, 4, 7, 2, 'Praktyczne', 'Jazda po mieœcie', '2025-05-15 11:30:00', '2025-05-15 13:00:00', NULL;
EXECUTE dbo.Zajecia_Wstaw 3, 3, 7, 2, 'Praktyczne', 'Jazda po mieœcie', '2025-05-22 10:00:00', '2025-05-22 11:30:00', NULL;
EXECUTE dbo.Zajecia_Wstaw 4, 4, 7, 2, 'Praktyczne', 'Jazda po mieœcie', '2025-05-22 11:30:00', '2025-05-22 13:00:00', NULL;
EXECUTE dbo.Zajecia_Wstaw 5, 3, 7, 2, 'Praktyczne', 'Jazda po mieœcie', '2025-06-01 10:00:00', '2025-06-01 11:30:00', NULL;
EXECUTE dbo.Zajecia_Wstaw 6, 4, 7, 2, 'Praktyczne', 'Jazda po mieœcie', '2025-06-07 14:00:00', '2025-06-07 15:30:00', NULL;
EXECUTE dbo.Zajecia_Wstaw 7, 5, 11, 4, 'Teoretyczne', 'Znaki drogowe', '2025-05-20 14:00:00', '2025-05-20 15:30:00', NULL;
EXECUTE dbo.Zajecia_Wstaw 8, 6, 11, 4, 'Teoretyczne', 'Znaki drogowe', '2025-05-20 14:00:00', '2025-05-20 15:30:00', NULL;
EXECUTE dbo.Zajecia_Wstaw 9, 5, 11, 1, 'Teoretyczne', 'BHP', '2025-05-27 13:00:00', '2025-05-27 14:30:00', NULL;
EXECUTE dbo.Zajecia_Wstaw 10, 6, 11, 1, 'Teoretyczne', 'BHP', '2025-05-27 13:00:00', '2025-05-27 14:30:00', NULL;
GO

-----------------------------------------------------------------------------------------------------------
-- [EgzaminWewnetrzny]
-----------------------------------------------------------------------------------------------------------

EXECUTE dbo.EgzaminWewnetrzny_Wstaw 1, 1, 2, 'Egzamin teoretyczny kat. B', 'Teoretyczny', 1, 84, '2025-04-01 14:00:00', NULL
EXECUTE dbo.EgzaminWewnetrzny_Wstaw 2, 1, 8, 'Egzamin praktyczny kat. B', 'Praktyczny', 0, NULL, '2025-04-02 11:45:00', NULL
EXECUTE dbo.EgzaminWewnetrzny_Wstaw 3, 1, 9, 'Egzamin praktyczny kat. B', 'Praktyczny', 1, NULL, '2025-04-16 10:30:00', NULL
EXECUTE dbo.EgzaminWewnetrzny_Wstaw 4, 2, 2, 'Egzamin teoretyczny kat. D', 'Teoretyczny', 1, 51, '2025-04-16 15:00:00', NULL
EXECUTE dbo.EgzaminWewnetrzny_Wstaw 5, 2, 9, 'Egzamin praktyczny kat. D', 'Praktyczny', 0, NULL, '2025-04-24 09:15:00', NULL
EXECUTE dbo.EgzaminWewnetrzny_Wstaw 6, 3, 6, 'Egzamin teoretyczny kat. B', 'Teoretyczny', 0, NULL, '2025-07-14 11:00:00', NULL
EXECUTE dbo.EgzaminWewnetrzny_Wstaw 7, 3, 7, 'Egzamin praktyczny kat. B', 'Praktyczny', 0, NULL, '2025-07-22 11:00:00', NULL
EXECUTE dbo.EgzaminWewnetrzny_Wstaw 8, 4, 6, 'Egzamin teoretyczny kat. B', 'Teoretyczny', 0, NULL, '2025-07-14 11:00:00', NULL
EXECUTE dbo.EgzaminWewnetrzny_Wstaw 9, 4, 9, 'Egzamin praktyczny kat. B', 'Praktyczny', 0, NULL, '2025-07-23 13:30:00', NULL
EXECUTE dbo.EgzaminWewnetrzny_Wstaw 10, 5, 10, 'Egzamin teoretyczny kat. A', 'Teoretyczny', 0, NULL, '2025-08-02 10:00:00', NULL
EXECUTE dbo.EgzaminWewnetrzny_Wstaw 11, 6, 10, 'Egzamin teoretyczny kat. A', 'Teoretyczny', 0, NULL, '2025-08-02 10:00:00', NULL
GO

