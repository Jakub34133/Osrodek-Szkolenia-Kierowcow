-----------------------------------------------------------------------------------------------------------
-- BZDN_P3: programowanie operacji CRUD i transakcji
-----------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-- Testowanie Procedur
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------
-- [Kursant]
-----------------------------------------------------------------------------------------------------------
SELECT * FROM dbo.Kursant;
GO
/*
IdKursant   Imie                           Nazwisko                       Miejscowosc                                        KodPocztowy Ulica                                              NumerDomu  Email                                              Telefon              Uwagi
----------- ------------------------------ ------------------------------ -------------------------------------------------- ----------- -------------------------------------------------- ---------- -------------------------------------------------- -------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Jan                            Kowalski                       Kalisz                                             60-050      Grunwaldzka                                        16         jankowalski@poczta.fm                              +48 997 808 220      NULL
2           Anna                           Kowalska                       Kalisz                                             60-050      NULL                                               16B        annakowalska@poczta.fm                             +48 607 776 120      NULL
3           Kamil                          Nowak                          Ostrów                                             55-150      Pó³nocna                                           3/4        superkamil@gmail.com                               +48 100 508 320      NULL
4           Jolanta                        Zaj¹c                          Kalisz                                             60-050      Kostki                                             42         jolanta@gmail.com                                  +48 699 021 018      NULL
5           Jakub                          Michalski                      Ostrów                                             55-150      Jagodowa                                           12         jakubmichalski22@o2.pl                             +48 513 899 620      NULL
6           Zuzanna                        Walczak                        Sulis³awice                                        34-250      Œwitezianki                                        20         zuza@gmail.com                                     +48 723 153 246      NULL
7           Eryk                           Symañski                       Leziona                                            58-354      NULL                                               6          NULL                                               +48 724 652 984      NULL
8           Natala                         Pawlak                         Kalisz                                             60-050      Poznañska                                          13B        NULL                                               +48 662 137 299      NULL
9           Marzena                        Wysocka                        Leziona                                            58-354      NULL                                               6          marzenawysocka@gmail.com                           +48 791 896 988      NULL
10          Borys                          Nowak                          Kalisz                                             55-150      Poznañska                                          114        nowakborys9@o2.pl                                  +48 603 536 170      NULL

(10 rows affected)
*/

-- Wstawianie
EXECUTE dbo.Kursant_Wstaw 11, 'Krystian', 'Mazurek', 'Kalisz', '60-050', 'Grunwaldzka', '20B', 'krystian@poczta.fm', '+48 600 100 100', NULL;
GO

/*
(1 row affected)
IdKursant   Imie                           Nazwisko                       Miejscowosc                                        KodPocztowy Ulica                                              NumerDomu  Email                                              Telefon              Uwagi
----------- ------------------------------ ------------------------------ -------------------------------------------------- ----------- -------------------------------------------------- ---------- -------------------------------------------------- -------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Jan                            Kowalski                       Kalisz                                             60-050      Grunwaldzka                                        16         jankowalski@poczta.fm                              +48 997 808 220      NULL
2           Anna                           Kowalska                       Kalisz                                             60-050      NULL                                               16B        annakowalska@poczta.fm                             +48 607 776 120      NULL
3           Kamil                          Nowak                          Ostrów                                             55-150      Pó³nocna                                           3/4        superkamil@gmail.com                               +48 100 508 320      NULL
4           Jolanta                        Zaj¹c                          Kalisz                                             60-050      Kostki                                             42         jolanta@gmail.com                                  +48 699 021 018      NULL
5           Jakub                          Michalski                      Ostrów                                             55-150      Jagodowa                                           12         jakubmichalski22@o2.pl                             +48 513 899 620      NULL
6           Zuzanna                        Walczak                        Sulis³awice                                        34-250      Œwitezianki                                        20         zuza@gmail.com                                     +48 723 153 246      NULL
7           Eryk                           Symañski                       Leziona                                            58-354      NULL                                               6          NULL                                               +48 724 652 984      NULL
8           Natala                         Pawlak                         Kalisz                                             60-050      Poznañska                                          13B        NULL                                               +48 662 137 299      NULL
9           Marzena                        Wysocka                        Leziona                                            58-354      NULL                                               6          marzenawysocka@gmail.com                           +48 791 896 988      NULL
10          Borys                          Nowak                          Kalisz                                             55-150      Poznañska                                          114        nowakborys9@o2.pl                                  +48 603 536 170      NULL
11          Krystian                       Mazurek                        Kalisz                                             60-050      Grunwaldzka                                        20B        krystian@poczta.fm                                 +48 600 100 100      NULL

(11 rows affected)
*/

-- Modywfikowanie
EXECUTE dbo.Kursant_Aktualizuj 11, 'Krystian', 'Mazurek', 'Kalisz', '60-050', 'Grunwaldzka', '20B', 'mazurekkrystian2@poczta.fm', '+48 600 100 100', NULL;
GO -- zmiana e-maila

/*
(1 row affected)
IdKursant   Imie                           Nazwisko                       Miejscowosc                                        KodPocztowy Ulica                                              NumerDomu  Email                                              Telefon              Uwagi
----------- ------------------------------ ------------------------------ -------------------------------------------------- ----------- -------------------------------------------------- ---------- -------------------------------------------------- -------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Jan                            Kowalski                       Kalisz                                             60-050      Grunwaldzka                                        16         jankowalski@poczta.fm                              +48 997 808 220      NULL
2           Anna                           Kowalska                       Kalisz                                             60-050      NULL                                               16B        annakowalska@poczta.fm                             +48 607 776 120      NULL
3           Kamil                          Nowak                          Ostrów                                             55-150      Pó³nocna                                           3/4        superkamil@gmail.com                               +48 100 508 320      NULL
4           Jolanta                        Zaj¹c                          Kalisz                                             60-050      Kostki                                             42         jolanta@gmail.com                                  +48 699 021 018      NULL
5           Jakub                          Michalski                      Ostrów                                             55-150      Jagodowa                                           12         jakubmichalski22@o2.pl                             +48 513 899 620      NULL
6           Zuzanna                        Walczak                        Sulis³awice                                        34-250      Œwitezianki                                        20         zuza@gmail.com                                     +48 723 153 246      NULL
7           Eryk                           Symañski                       Leziona                                            58-354      NULL                                               6          NULL                                               +48 724 652 984      NULL
8           Natala                         Pawlak                         Kalisz                                             60-050      Poznañska                                          13B        NULL                                               +48 662 137 299      NULL
9           Marzena                        Wysocka                        Leziona                                            58-354      NULL                                               6          marzenawysocka@gmail.com                           +48 791 896 988      NULL
10          Borys                          Nowak                          Kalisz                                             55-150      Poznañska                                          114        nowakborys9@o2.pl                                  +48 603 536 170      NULL
11          Krystian                       Mazurek                        Kalisz                                             60-050      Grunwaldzka                                        20B        mazurekkrystian2@poczta.fm                         +48 600 100 100      NULL

(11 rows affected)
*/

-- Usuwanie
EXECUTE dbo.Kursant_Usun 11;
GO
/*
(1 row affected)
IdKursant   Imie                           Nazwisko                       Miejscowosc                                        KodPocztowy Ulica                                              NumerDomu  Email                                              Telefon              Uwagi
----------- ------------------------------ ------------------------------ -------------------------------------------------- ----------- -------------------------------------------------- ---------- -------------------------------------------------- -------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Jan                            Kowalski                       Kalisz                                             60-050      Grunwaldzka                                        16         jankowalski@poczta.fm                              +48 997 808 220      NULL
2           Anna                           Kowalska                       Kalisz                                             60-050      NULL                                               16B        annakowalska@poczta.fm                             +48 607 776 120      NULL
3           Kamil                          Nowak                          Ostrów                                             55-150      Pó³nocna                                           3/4        superkamil@gmail.com                               +48 100 508 320      NULL
4           Jolanta                        Zaj¹c                          Kalisz                                             60-050      Kostki                                             42         jolanta@gmail.com                                  +48 699 021 018      NULL
5           Jakub                          Michalski                      Ostrów                                             55-150      Jagodowa                                           12         jakubmichalski22@o2.pl                             +48 513 899 620      NULL
6           Zuzanna                        Walczak                        Sulis³awice                                        34-250      Œwitezianki                                        20         zuza@gmail.com                                     +48 723 153 246      NULL
7           Eryk                           Symañski                       Leziona                                            58-354      NULL                                               6          NULL                                               +48 724 652 984      NULL
8           Natala                         Pawlak                         Kalisz                                             60-050      Poznañska                                          13B        NULL                                               +48 662 137 299      NULL
9           Marzena                        Wysocka                        Leziona                                            58-354      NULL                                               6          marzenawysocka@gmail.com                           +48 791 896 988      NULL
10          Borys                          Nowak                          Kalisz                                             55-150      Poznañska                                          114        nowakborys9@o2.pl                                  +48 603 536 170      NULL

(10 rows affected)
*/

-----------------------------------------------------------------------------------------------------------
-- [StanKursu]
-----------------------------------------------------------------------------------------------------------
SELECT * FROM dbo.StanKursu ORDER BY IdStanKursu;
GO

/*
IdStanKursu Nazwa
----------- --------------------------------------------------
1           Zarejestrowany
2           W trakcie teorii
3           Zakoñczono teoriê
4           W trakcie jazd
5           Zakoñczono jazdy
6           Oczekuje na egzamin wewnêtrzny
7           Egzamin wewnêtrzny zaliczony
8           Oczekuje na egzamin pañstwowy
9           Egzamin pañstwowy zaliczony
10          Niezaliczony
11          Przerwany
12          Ukoñczony

(12 rows affected)
*/

-- Wstawianie
EXECUTE dbo.StanKursu_Wstaw 13, 'Oczekuje na prawo jazdy';
GO

/*
(1 row affected)
IdStanKursu Nazwa
----------- --------------------------------------------------
1           Zarejestrowany
2           W trakcie teorii
3           Zakoñczono teoriê
4           W trakcie jazd
5           Zakoñczono jazdy
6           Oczekuje na egzamin wewnêtrzny
7           Egzamin wewnêtrzny zaliczony
8           Oczekuje na egzamin pañstwowy
9           Egzamin pañstwowy zaliczony
10          Niezaliczony
11          Przerwany
12          Ukoñczony
13          Oczekuje na prawo jazdy

(13 rows affected)
*/

-- Modywfikowanie
EXECUTE dbo.StanKursu_Aktualizuj 13, 'Oczekuje na wydanie dokumentów';
GO

/*
(1 row affected)
IdStanKursu Nazwa
----------- --------------------------------------------------
1           Zarejestrowany
2           W trakcie teorii
3           Zakoñczono teoriê
4           W trakcie jazd
5           Zakoñczono jazdy
6           Oczekuje na egzamin wewnêtrzny
7           Egzamin wewnêtrzny zaliczony
8           Oczekuje na egzamin pañstwowy
9           Egzamin pañstwowy zaliczony
10          Niezaliczony
11          Przerwany
12          Ukoñczony
13          Oczekuje na wydanie dokumentów

(13 rows affected)

*/

-- Usuwanie
EXECUTE dbo.StanKursu_Usun 13;
GO
/*
(1 row affected)
IdStanKursu Nazwa
----------- --------------------------------------------------
1           Zarejestrowany
2           W trakcie teorii
3           Zakoñczono teoriê
4           W trakcie jazd
5           Zakoñczono jazdy
6           Oczekuje na egzamin wewnêtrzny
7           Egzamin wewnêtrzny zaliczony
8           Oczekuje na egzamin pañstwowy
9           Egzamin pañstwowy zaliczony
10          Niezaliczony
11          Przerwany
12          Ukoñczony

(12 rows affected)
*/

-----------------------------------------------------------------------------------------------------------
-- [Kategoria]
-----------------------------------------------------------------------------------------------------------
SELECT * FROM dbo.Kategoria;
GO

/*
IdKategoria Nazwa                                              Skrot
----------- -------------------------------------------------- ----------
1           Motorower                                          AM
2           Ka¿dy motocykl                                     A
3           Czteroko³owiec                                     B1
4           Pojazd samochodowy o masie < 3,5ton                B
5           Zespó³ pojazdów kat. B i przyczepy                 B+E
6           Pojazd samochodowy o masie > 3,5ton                C
7           Zespó³ pojazdów kat. C i przyczepy                 C+E
8           Autobus                                            D
9           Zespó³ pojazdów kat. D i przyczepy                 D+E
10          Pojazd wolnobie¿ny                                 T

(10 rows affected)
*/

-- Wstawianie
EXECUTE dbo.Kategoria_Wstaw 11, 'Tramwaj', 'Tramwaj';
GO

/*
(1 row affected)
IdKategoria Nazwa                                              Skrot
----------- -------------------------------------------------- ----------
1           Motorower                                          AM
2           Ka¿dy motocykl                                     A
3           Czteroko³owiec                                     B1
4           Pojazd samochodowy o masie < 3,5ton                B
5           Zespó³ pojazdów kat. B i przyczepy                 B+E
6           Pojazd samochodowy o masie > 3,5ton                C
7           Zespó³ pojazdów kat. C i przyczepy                 C+E
8           Autobus                                            D
9           Zespó³ pojazdów kat. D i przyczepy                 D+E
10          Pojazd wolnobie¿ny                                 T
11          Tramwaj                                            Tramwaj

(11 rows affected)
*/

-- Modywfikowanie
EXECUTE dbo.Kategoria_Aktualizuj 11, 'Tramwaj', 'TM';
GO -- zmiana skrótu

/*
(1 row affected)
IdKategoria Nazwa                                              Skrot
----------- -------------------------------------------------- ----------
1           Motorower                                          AM
2           Ka¿dy motocykl                                     A
3           Czteroko³owiec                                     B1
4           Pojazd samochodowy o masie < 3,5ton                B
5           Zespó³ pojazdów kat. B i przyczepy                 B+E
6           Pojazd samochodowy o masie > 3,5ton                C
7           Zespó³ pojazdów kat. C i przyczepy                 C+E
8           Autobus                                            D
9           Zespó³ pojazdów kat. D i przyczepy                 D+E
10          Pojazd wolnobie¿ny                                 T
11          Tramwaj                                            TM

(11 rows affected)
*/

-- Usuwanie
EXECUTE dbo.Kategoria_Usun 11;
GO

/*
(1 row affected)
IdKategoria Nazwa                                              Skrot
----------- -------------------------------------------------- ----------
1           Motorower                                          AM
2           Ka¿dy motocykl                                     A
3           Czteroko³owiec                                     B1
4           Pojazd samochodowy o masie < 3,5ton                B
5           Zespó³ pojazdów kat. B i przyczepy                 B+E
6           Pojazd samochodowy o masie > 3,5ton                C
7           Zespó³ pojazdów kat. C i przyczepy                 C+E
8           Autobus                                            D
9           Zespó³ pojazdów kat. D i przyczepy                 D+E
10          Pojazd wolnobie¿ny                                 T

(10 rows affected)
*/

-----------------------------------------------------------------------------------------------------------
-- [Pojazd]
-----------------------------------------------------------------------------------------------------------
SELECT * FROM dbo.Pojazd;
GO

/*
IdPojazd    Marka                Model                          RokProdukcji NrRejestracyjny VIN                            Opis
----------- -------------------- ------------------------------ ------------ --------------- ------------------------------ --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Toyota               Yaris                          2010         PKA 1FD5        0123456789ABCDEFG              NULL
2           Kia                  Rio                            2006         PK 89DA         4T1BF22K8YU005156              NULL
3           Hyundai              i20                            2009         PA 1EGAC        1FTPW14585FA81441              W konserwacji
4           Renault              Clio                           2009         MKA 9DFGB       1G2ZJ57B594220317              NULL
5           Audi                 A4                             2011         MA E4E5         WAUHFBFR0A0010190              NULL
6           Ford                 Fiesta                         2008         MA SF3D6        WAUDG74FX5ND88616              NULL
7           Kia                  Rio                            2007         PK F5G12        5XYKT4A18DG418921              NULL
8           Kia                  Rio                            2007         PK TG6F         KNDJT2A23A7159904              NULL
9           Toyota               Yaris                          2014         PA CD5A2        JTDBE38K720072804              NULL
10          Hyundai              i20                            2012         PKA T5HJ        KMHJG35F414262494              NULL
11          Yamaha               MT-07                          2012         PK MT80         JHMRA3810WC201700              NULL

(11 rows affected)
*/

-- Wstawianie
EXECUTE dbo.Pojazd_Wstaw 12, 'Kia', 'Rio', 2007, 'PK 0ABCD', '1C4NJDBBXCD538212', NULL;
GO

/*
(1 row affected)
IdPojazd    Marka                Model                          RokProdukcji NrRejestracyjny VIN                            Opis
----------- -------------------- ------------------------------ ------------ --------------- ------------------------------ --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Toyota               Yaris                          2010         PKA 1FD5        0123456789ABCDEFG              NULL
2           Kia                  Rio                            2006         PK 89DA         4T1BF22K8YU005156              NULL
3           Hyundai              i20                            2009         PA 1EGAC        1FTPW14585FA81441              W konserwacji
4           Renault              Clio                           2009         MKA 9DFGB       1G2ZJ57B594220317              NULL
5           Audi                 A4                             2011         MA E4E5         WAUHFBFR0A0010190              NULL
6           Ford                 Fiesta                         2008         MA SF3D6        WAUDG74FX5ND88616              NULL
7           Kia                  Rio                            2007         PK F5G12        5XYKT4A18DG418921              NULL
8           Kia                  Rio                            2007         PK TG6F         KNDJT2A23A7159904              NULL
9           Toyota               Yaris                          2014         PA CD5A2        JTDBE38K720072804              NULL
10          Hyundai              i20                            2012         PKA T5HJ        KMHJG35F414262494              NULL
11          Yamaha               MT-07                          2012         PK MT80         JHMRA3810WC201700              NULL
12          Kia                  Rio                            2007         PK 0ABCD        1C4NJDBBXCD538212              NULL

(12 rows affected)
*/

-- Modywfikowanie
EXECUTE dbo.Pojazd_Aktualizuj 12, 'Kia', 'Rio', 2008, 'PK 0ABCD', '1C4NJDBBXCD538212', NULL;
GO -- zmiana roku produkcji

/*
(1 row affected)
IdPojazd    Marka                Model                          RokProdukcji NrRejestracyjny VIN                            Opis
----------- -------------------- ------------------------------ ------------ --------------- ------------------------------ --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Toyota               Yaris                          2010         PKA 1FD5        0123456789ABCDEFG              NULL
2           Kia                  Rio                            2006         PK 89DA         4T1BF22K8YU005156              NULL
3           Hyundai              i20                            2009         PA 1EGAC        1FTPW14585FA81441              W konserwacji
4           Renault              Clio                           2009         MKA 9DFGB       1G2ZJ57B594220317              NULL
5           Audi                 A4                             2011         MA E4E5         WAUHFBFR0A0010190              NULL
6           Ford                 Fiesta                         2008         MA SF3D6        WAUDG74FX5ND88616              NULL
7           Kia                  Rio                            2007         PK F5G12        5XYKT4A18DG418921              NULL
8           Kia                  Rio                            2007         PK TG6F         KNDJT2A23A7159904              NULL
9           Toyota               Yaris                          2014         PA CD5A2        JTDBE38K720072804              NULL
10          Hyundai              i20                            2012         PKA T5HJ        KMHJG35F414262494              NULL
11          Yamaha               MT-07                          2012         PK MT80         JHMRA3810WC201700              NULL
12          Kia                  Rio                            2008         PK 0ABCD        1C4NJDBBXCD538212              NULL

(12 rows affected)
*/

-- Usuwanie
EXECUTE dbo.Pojazd_Usun 12;
GO

/*
(1 row affected)
IdPojazd    Marka                Model                          RokProdukcji NrRejestracyjny VIN                            Opis
----------- -------------------- ------------------------------ ------------ --------------- ------------------------------ --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Toyota               Yaris                          2010         PKA 1FD5        0123456789ABCDEFG              NULL
2           Kia                  Rio                            2006         PK 89DA         4T1BF22K8YU005156              NULL
3           Hyundai              i20                            2009         PA 1EGAC        1FTPW14585FA81441              W konserwacji
4           Renault              Clio                           2009         MKA 9DFGB       1G2ZJ57B594220317              NULL
5           Audi                 A4                             2011         MA E4E5         WAUHFBFR0A0010190              NULL
6           Ford                 Fiesta                         2008         MA SF3D6        WAUDG74FX5ND88616              NULL
7           Kia                  Rio                            2007         PK F5G12        5XYKT4A18DG418921              NULL
8           Kia                  Rio                            2007         PK TG6F         KNDJT2A23A7159904              NULL
9           Toyota               Yaris                          2014         PA CD5A2        JTDBE38K720072804              NULL
10          Hyundai              i20                            2012         PKA T5HJ        KMHJG35F414262494              NULL
11          Yamaha               MT-07                          2012         PK MT80         JHMRA3810WC201700              NULL

(11 rows affected)
*/

-----------------------------------------------------------------------------------------------------------
-- [Instruktor]
-----------------------------------------------------------------------------------------------------------
SELECT * FROM dbo.Instruktor;
GO

/*
IdInstruktor Imie                           Nazwisko                       Email                                              Telefon              Uwagi
------------ ------------------------------ ------------------------------ -------------------------------------------------- -------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1            Przemys³aw                     Rogalski                       rogalskiprzemyslaw@osk.pl                          123 234 345          NULL
2            Celina                         Borkowska                      borkowskacelina@osk.pl                             +48 691 293 237      NULL
3            Eryk                           WoŸniak                        wozniakeryk@osk.pl                                 +48 517 829 380      NULL
4            Aureliusz                      Walczak                        walczakaureliusz@osk.pl                            +48 604 184 631      NULL
5            Lubomir                        Adamczyk                       adamczyklubomir@osk.pl                             +48 721 853 351      NULL
6            Karol                          Maciejewski                    maciejewskikarol@osk.pl                            +48 517 690 242      NULL
7            Karol                          Jab³oñski                      jablonskikarol@osk.pl                              +48 920 517 340      NULL
8            Rados³aw                       Koz³owski                      kozlowskiradoslaw@osk.pl                           +48 532 149 497      NULL
9            Patryk                         Adamski                        adamskipatryk@osk.pl                               +48 029 580 910      NULL
10           Micha³                         Chocho³owski                   chocholowskimichal@osk.pl                          +48 728 920 483      NULL

(10 rows affected)
*/

-- Wstawianie
EXECUTE dbo.Instruktor_Wstaw 11, 'Piotr', 'Borkowski', 'borkowskipiotr@osk.pl', '+ 48 902 000 299', NULL;
GO

/*
(1 row affected)
IdInstruktor Imie                           Nazwisko                       Email                                              Telefon              Uwagi
------------ ------------------------------ ------------------------------ -------------------------------------------------- -------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1            Przemys³aw                     Rogalski                       rogalskiprzemyslaw@osk.pl                          123 234 345          NULL
2            Celina                         Borkowska                      borkowskacelina@osk.pl                             +48 691 293 237      NULL
3            Eryk                           WoŸniak                        wozniakeryk@osk.pl                                 +48 517 829 380      NULL
4            Aureliusz                      Walczak                        walczakaureliusz@osk.pl                            +48 604 184 631      NULL
5            Lubomir                        Adamczyk                       adamczyklubomir@osk.pl                             +48 721 853 351      NULL
6            Karol                          Maciejewski                    maciejewskikarol@osk.pl                            +48 517 690 242      NULL
7            Karol                          Jab³oñski                      jablonskikarol@osk.pl                              +48 920 517 340      NULL
8            Rados³aw                       Koz³owski                      kozlowskiradoslaw@osk.pl                           +48 532 149 497      NULL
9            Patryk                         Adamski                        adamskipatryk@osk.pl                               +48 029 580 910      NULL
10           Micha³                         Chocho³owski                   chocholowskimichal@osk.pl                          +48 728 920 483      NULL
11           Piotr                          Borkowski                      borkowskipiotr@osk.pl                              + 48 902 000 299     NULL

(11 rows affected)
*/

-- Modywfikowanie
EXECUTE dbo.Instruktor_Aktualizuj 11, 'Piotr', 'Borkowski', 'borkowskipiotr@osk.pl', '+ 48 800 900 111', NULL;
GO -- zmiana numeru telefonu

/*
(1 row affected)
IdInstruktor Imie                           Nazwisko                       Email                                              Telefon              Uwagi
------------ ------------------------------ ------------------------------ -------------------------------------------------- -------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1            Przemys³aw                     Rogalski                       rogalskiprzemyslaw@osk.pl                          123 234 345          NULL
2            Celina                         Borkowska                      borkowskacelina@osk.pl                             +48 691 293 237      NULL
3            Eryk                           WoŸniak                        wozniakeryk@osk.pl                                 +48 517 829 380      NULL
4            Aureliusz                      Walczak                        walczakaureliusz@osk.pl                            +48 604 184 631      NULL
5            Lubomir                        Adamczyk                       adamczyklubomir@osk.pl                             +48 721 853 351      NULL
6            Karol                          Maciejewski                    maciejewskikarol@osk.pl                            +48 517 690 242      NULL
7            Karol                          Jab³oñski                      jablonskikarol@osk.pl                              +48 920 517 340      NULL
8            Rados³aw                       Koz³owski                      kozlowskiradoslaw@osk.pl                           +48 532 149 497      NULL
9            Patryk                         Adamski                        adamskipatryk@osk.pl                               +48 029 580 910      NULL
10           Micha³                         Chocho³owski                   chocholowskimichal@osk.pl                          +48 728 920 483      NULL
11           Piotr                          Borkowski                      borkowskipiotr@osk.pl                              + 48 800 900 111     NULL

(11 rows affected)
*/

-- Usuwanie
EXECUTE dbo.Instruktor_Usun 11;
GO

/*
(1 row affected)
IdInstruktor Imie                           Nazwisko                       Email                                              Telefon              Uwagi
------------ ------------------------------ ------------------------------ -------------------------------------------------- -------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1            Przemys³aw                     Rogalski                       rogalskiprzemyslaw@osk.pl                          123 234 345          NULL
2            Celina                         Borkowska                      borkowskacelina@osk.pl                             +48 691 293 237      NULL
3            Eryk                           WoŸniak                        wozniakeryk@osk.pl                                 +48 517 829 380      NULL
4            Aureliusz                      Walczak                        walczakaureliusz@osk.pl                            +48 604 184 631      NULL
5            Lubomir                        Adamczyk                       adamczyklubomir@osk.pl                             +48 721 853 351      NULL
6            Karol                          Maciejewski                    maciejewskikarol@osk.pl                            +48 517 690 242      NULL
7            Karol                          Jab³oñski                      jablonskikarol@osk.pl                              +48 920 517 340      NULL
8            Rados³aw                       Koz³owski                      kozlowskiradoslaw@osk.pl                           +48 532 149 497      NULL
9            Patryk                         Adamski                        adamskipatryk@osk.pl                               +48 029 580 910      NULL
10           Micha³                         Chocho³owski                   chocholowskimichal@osk.pl                          +48 728 920 483      NULL

(10 rows affected)
*/

-----------------------------------------------------------------------------------------------------------
-- [Kurs]
-----------------------------------------------------------------------------------------------------------
SELECT * FROM dbo.Kurs;
GO

/*
IdKurs      IdKategoria IdKursant   IdStanKursu Nazwa                                              DataRozpoczecia DataZakonczenia Cena                  TerminPlatnosci Zaplacono             Opis
----------- ----------- ----------- ----------- -------------------------------------------------- --------------- --------------- --------------------- --------------- --------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           4           1           12          Kurs na samochód osobowy kat. B                    2025-01-15      2025-04-16      2600,00               2025-01-30      2200,00               NULL
2           8           3           11          Kurs na Autobus kat. D                             2025-02-01      2025-05-01      3500,00               2025-02-28      3500,00               Kursant zrezygnowa³ z kontynuowania kursu
3           4           5           4           Kurs na samochód osobowy kat. B                    2025-05-01      2025-08-01      2600,00               2025-05-30      1100,00               NULL
4           4           4           4           Kurs na samochód osobowy kat. B                    2025-05-01      2025-08-01      2600,00               2025-05-30      2200,00               NULL
5           2           9           2           Kurs na motocykl kat. A                            2025-05-11      2025-08-12      1800,00               2025-06-30      0,00                  NULL
6           2           10          2           Kurs na motocykl kat. A                            2025-05-11      2025-08-12      1800,00               2025-06-30      0,00                  NULL
7           7           3           1           Kurs na pojazd ciê¿arowy C+E                       2025-08-20      2025-11-20      4600,00               2025-09-30      0,00                  NULL
8           4           2           1           Kurs na samochód osobowy kat. B                    2025-10-11      2026-01-12      2600,00               2025-11-30      0,00                  NULL
9           4           6           1           Kurs na samochód osobowy kat. B                    2025-10-11      2026-01-12      2600,00               2025-11-30      0,00                  NULL
10          4           7           1           Kurs na samochód osobowy kat. B                    2025-10-11      2026-01-12      2600,00               2025-11-30      0,00                  NULL

(10 rows affected)
*/

-- Wstawianie
EXECUTE dbo.Kurs_Wstaw 11, 4, 9, 1, 'Kurs na samochód osobowy kat. B', '2025-10-11', '2026-01-12', 2600, '2025-11-30', 0, NULL;
GO

/*
(1 row affected)
IdKurs      IdKategoria IdKursant   IdStanKursu Nazwa                                              DataRozpoczecia DataZakonczenia Cena                  TerminPlatnosci Zaplacono             Opis
----------- ----------- ----------- ----------- -------------------------------------------------- --------------- --------------- --------------------- --------------- --------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           4           1           12          Kurs na samochód osobowy kat. B                    2025-01-15      2025-04-16      2600,00               2025-01-30      2200,00               NULL
2           8           3           11          Kurs na Autobus kat. D                             2025-02-01      2025-05-01      3500,00               2025-02-28      3500,00               Kursant zrezygnowa³ z kontynuowania kursu
3           4           5           4           Kurs na samochód osobowy kat. B                    2025-05-01      2025-08-01      2600,00               2025-05-30      1100,00               NULL
4           4           4           4           Kurs na samochód osobowy kat. B                    2025-05-01      2025-08-01      2600,00               2025-05-30      2200,00               NULL
5           2           9           2           Kurs na motocykl kat. A                            2025-05-11      2025-08-12      1800,00               2025-06-30      0,00                  NULL
6           2           10          2           Kurs na motocykl kat. A                            2025-05-11      2025-08-12      1800,00               2025-06-30      0,00                  NULL
7           7           3           1           Kurs na pojazd ciê¿arowy C+E                       2025-08-20      2025-11-20      4600,00               2025-09-30      0,00                  NULL
8           4           2           1           Kurs na samochód osobowy kat. B                    2025-10-11      2026-01-12      2600,00               2025-11-30      0,00                  NULL
9           4           6           1           Kurs na samochód osobowy kat. B                    2025-10-11      2026-01-12      2600,00               2025-11-30      0,00                  NULL
10          4           7           1           Kurs na samochód osobowy kat. B                    2025-10-11      2026-01-12      2600,00               2025-11-30      0,00                  NULL
11          4           9           1           Kurs na samochód osobowy kat. B                    2025-10-11      2026-01-12      2600,00               2025-11-30      0,00                  NULL

(11 rows affected)
*/

-- Modywfikowanie
EXECUTE dbo.Kurs_Aktualizuj 11, 4, 9, 1, 'Kurs na samochód osobowy kat. B', '2025-10-11', '2026-01-12', 2600, '2025-11-30', 1300, NULL;
GO -- zmiana wp³aty

/*
(1 row affected)
IdKurs      IdKategoria IdKursant   IdStanKursu Nazwa                                              DataRozpoczecia DataZakonczenia Cena                  TerminPlatnosci Zaplacono             Opis
----------- ----------- ----------- ----------- -------------------------------------------------- --------------- --------------- --------------------- --------------- --------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           4           1           12          Kurs na samochód osobowy kat. B                    2025-01-15      2025-04-16      2600,00               2025-01-30      2200,00               NULL
2           8           3           11          Kurs na Autobus kat. D                             2025-02-01      2025-05-01      3500,00               2025-02-28      3500,00               Kursant zrezygnowa³ z kontynuowania kursu
3           4           5           4           Kurs na samochód osobowy kat. B                    2025-05-01      2025-08-01      2600,00               2025-05-30      1100,00               NULL
4           4           4           4           Kurs na samochód osobowy kat. B                    2025-05-01      2025-08-01      2600,00               2025-05-30      2200,00               NULL
5           2           9           2           Kurs na motocykl kat. A                            2025-05-11      2025-08-12      1800,00               2025-06-30      0,00                  NULL
6           2           10          2           Kurs na motocykl kat. A                            2025-05-11      2025-08-12      1800,00               2025-06-30      0,00                  NULL
7           7           3           1           Kurs na pojazd ciê¿arowy C+E                       2025-08-20      2025-11-20      4600,00               2025-09-30      0,00                  NULL
8           4           2           1           Kurs na samochód osobowy kat. B                    2025-10-11      2026-01-12      2600,00               2025-11-30      0,00                  NULL
9           4           6           1           Kurs na samochód osobowy kat. B                    2025-10-11      2026-01-12      2600,00               2025-11-30      0,00                  NULL
10          4           7           1           Kurs na samochód osobowy kat. B                    2025-10-11      2026-01-12      2600,00               2025-11-30      0,00                  NULL
11          4           9           1           Kurs na samochód osobowy kat. B                    2025-10-11      2026-01-12      2600,00               2025-11-30      1300,00               NULL

(11 rows affected)
*/

-- Usuwanie
EXECUTE dbo.Kurs_Usun 11;
GO

/*
(1 row affected)
IdKurs      IdKategoria IdKursant   IdStanKursu Nazwa                                              DataRozpoczecia DataZakonczenia Cena                  TerminPlatnosci Zaplacono             Opis
----------- ----------- ----------- ----------- -------------------------------------------------- --------------- --------------- --------------------- --------------- --------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           4           1           12          Kurs na samochód osobowy kat. B                    2025-01-15      2025-04-16      2600,00               2025-01-30      2200,00               NULL
2           8           3           11          Kurs na Autobus kat. D                             2025-02-01      2025-05-01      3500,00               2025-02-28      3500,00               Kursant zrezygnowa³ z kontynuowania kursu
3           4           5           4           Kurs na samochód osobowy kat. B                    2025-05-01      2025-08-01      2600,00               2025-05-30      1100,00               NULL
4           4           4           4           Kurs na samochód osobowy kat. B                    2025-05-01      2025-08-01      2600,00               2025-05-30      2200,00               NULL
5           2           9           2           Kurs na motocykl kat. A                            2025-05-11      2025-08-12      1800,00               2025-06-30      0,00                  NULL
6           2           10          2           Kurs na motocykl kat. A                            2025-05-11      2025-08-12      1800,00               2025-06-30      0,00                  NULL
7           7           3           1           Kurs na pojazd ciê¿arowy C+E                       2025-08-20      2025-11-20      4600,00               2025-09-30      0,00                  NULL
8           4           2           1           Kurs na samochód osobowy kat. B                    2025-10-11      2026-01-12      2600,00               2025-11-30      0,00                  NULL
9           4           6           1           Kurs na samochód osobowy kat. B                    2025-10-11      2026-01-12      2600,00               2025-11-30      0,00                  NULL
10          4           7           1           Kurs na samochód osobowy kat. B                    2025-10-11      2026-01-12      2600,00               2025-11-30      0,00                  NULL

(10 rows affected)
*/

-----------------------------------------------------------------------------------------------------------
-- [Zajecia]
-----------------------------------------------------------------------------------------------------------
SELECT * FROM dbo.Zajecia;
GO

/*
IdZajecia   IdKurs      IdPojazd    IdInstruktor Rodzaj               Temat                                              DataZajecOd             DataZajecDo             Opis
----------- ----------- ----------- ------------ -------------------- -------------------------------------------------- ----------------------- ----------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           3           7           2            Praktyczne           Jazda po mieœcie                                   2025-05-15 10:00:00.000 2025-05-15 11:30:00.000 NULL
2           4           7           2            Praktyczne           Jazda po mieœcie                                   2025-05-15 11:30:00.000 2025-05-15 13:00:00.000 NULL
3           3           7           2            Praktyczne           Jazda po mieœcie                                   2025-05-22 10:00:00.000 2025-05-22 11:30:00.000 NULL
4           4           7           2            Praktyczne           Jazda po mieœcie                                   2025-05-22 11:30:00.000 2025-05-22 13:00:00.000 NULL
5           3           7           2            Praktyczne           Jazda po mieœcie                                   2025-06-01 10:00:00.000 2025-06-01 11:30:00.000 NULL
6           4           7           2            Praktyczne           Jazda po mieœcie                                   2025-06-07 14:00:00.000 2025-06-07 15:30:00.000 NULL
7           5           11          4            Teoretyczne          Znaki drogowe                                      2025-05-20 14:00:00.000 2025-05-20 15:30:00.000 NULL
8           6           11          4            Teoretyczne          Znaki drogowe                                      2025-05-20 14:00:00.000 2025-05-20 15:30:00.000 NULL
9           5           11          1            Teoretyczne          BHP                                                2025-05-27 13:00:00.000 2025-05-27 14:30:00.000 NULL
10          6           11          1            Teoretyczne          BHP                                                2025-05-27 13:00:00.000 2025-05-27 14:30:00.000 NULL

(10 rows affected)
*/

-- Wstawianie
EXECUTE dbo.Zajecia_Wstaw 11, 6, 11, 1, 'Teoretyczne', 'Pierwszeñstwo na drodze', '2025-06-03 13:00:00', '2025-06-03 14:30:00', NULL;
GO

/*
(1 row affected)
IdZajecia   IdKurs      IdPojazd    IdInstruktor Rodzaj               Temat                                              DataZajecOd             DataZajecDo             Opis
----------- ----------- ----------- ------------ -------------------- -------------------------------------------------- ----------------------- ----------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           3           7           2            Praktyczne           Jazda po mieœcie                                   2025-05-15 10:00:00.000 2025-05-15 11:30:00.000 NULL
2           4           7           2            Praktyczne           Jazda po mieœcie                                   2025-05-15 11:30:00.000 2025-05-15 13:00:00.000 NULL
3           3           7           2            Praktyczne           Jazda po mieœcie                                   2025-05-22 10:00:00.000 2025-05-22 11:30:00.000 NULL
4           4           7           2            Praktyczne           Jazda po mieœcie                                   2025-05-22 11:30:00.000 2025-05-22 13:00:00.000 NULL
5           3           7           2            Praktyczne           Jazda po mieœcie                                   2025-06-01 10:00:00.000 2025-06-01 11:30:00.000 NULL
6           4           7           2            Praktyczne           Jazda po mieœcie                                   2025-06-07 14:00:00.000 2025-06-07 15:30:00.000 NULL
7           5           11          4            Teoretyczne          Znaki drogowe                                      2025-05-20 14:00:00.000 2025-05-20 15:30:00.000 NULL
8           6           11          4            Teoretyczne          Znaki drogowe                                      2025-05-20 14:00:00.000 2025-05-20 15:30:00.000 NULL
9           5           11          1            Teoretyczne          BHP                                                2025-05-27 13:00:00.000 2025-05-27 14:30:00.000 NULL
10          6           11          1            Teoretyczne          BHP                                                2025-05-27 13:00:00.000 2025-05-27 14:30:00.000 NULL
11          6           11          1            Teoretyczne          Pierwszeñstwo na drodze                            2025-06-03 13:00:00.000 2025-06-03 14:30:00.000 NULL

(11 rows affected)
*/

-- Modywfikowanie
EXECUTE dbo.Zajecia_Aktualizuj 11, 6, 11, 2, 'Teoretyczne', 'Pierwszeñstwo na drodze', '2025-06-03 13:00:00', '2025-06-03 14:30:00', NULL;
GO -- zmiana instruktora

/*
(1 row affected)
IdZajecia   IdKurs      IdPojazd    IdInstruktor Rodzaj               Temat                                              DataZajecOd             DataZajecDo             Opis
----------- ----------- ----------- ------------ -------------------- -------------------------------------------------- ----------------------- ----------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           3           7           2            Praktyczne           Jazda po mieœcie                                   2025-05-15 10:00:00.000 2025-05-15 11:30:00.000 NULL
2           4           7           2            Praktyczne           Jazda po mieœcie                                   2025-05-15 11:30:00.000 2025-05-15 13:00:00.000 NULL
3           3           7           2            Praktyczne           Jazda po mieœcie                                   2025-05-22 10:00:00.000 2025-05-22 11:30:00.000 NULL
4           4           7           2            Praktyczne           Jazda po mieœcie                                   2025-05-22 11:30:00.000 2025-05-22 13:00:00.000 NULL
5           3           7           2            Praktyczne           Jazda po mieœcie                                   2025-06-01 10:00:00.000 2025-06-01 11:30:00.000 NULL
6           4           7           2            Praktyczne           Jazda po mieœcie                                   2025-06-07 14:00:00.000 2025-06-07 15:30:00.000 NULL
7           5           11          4            Teoretyczne          Znaki drogowe                                      2025-05-20 14:00:00.000 2025-05-20 15:30:00.000 NULL
8           6           11          4            Teoretyczne          Znaki drogowe                                      2025-05-20 14:00:00.000 2025-05-20 15:30:00.000 NULL
9           5           11          1            Teoretyczne          BHP                                                2025-05-27 13:00:00.000 2025-05-27 14:30:00.000 NULL
10          6           11          1            Teoretyczne          BHP                                                2025-05-27 13:00:00.000 2025-05-27 14:30:00.000 NULL
11          6           11          2            Teoretyczne          Pierwszeñstwo na drodze                            2025-06-03 13:00:00.000 2025-06-03 14:30:00.000 NULL

(11 rows affected)
*/

-- Usuwanie
EXECUTE dbo.Zajecia_Usun 11;
GO

/*
(1 row affected)
IdZajecia   IdKurs      IdPojazd    IdInstruktor Rodzaj               Temat                                              DataZajecOd             DataZajecDo             Opis
----------- ----------- ----------- ------------ -------------------- -------------------------------------------------- ----------------------- ----------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           3           7           2            Praktyczne           Jazda po mieœcie                                   2025-05-15 10:00:00.000 2025-05-15 11:30:00.000 NULL
2           4           7           2            Praktyczne           Jazda po mieœcie                                   2025-05-15 11:30:00.000 2025-05-15 13:00:00.000 NULL
3           3           7           2            Praktyczne           Jazda po mieœcie                                   2025-05-22 10:00:00.000 2025-05-22 11:30:00.000 NULL
4           4           7           2            Praktyczne           Jazda po mieœcie                                   2025-05-22 11:30:00.000 2025-05-22 13:00:00.000 NULL
5           3           7           2            Praktyczne           Jazda po mieœcie                                   2025-06-01 10:00:00.000 2025-06-01 11:30:00.000 NULL
6           4           7           2            Praktyczne           Jazda po mieœcie                                   2025-06-07 14:00:00.000 2025-06-07 15:30:00.000 NULL
7           5           11          4            Teoretyczne          Znaki drogowe                                      2025-05-20 14:00:00.000 2025-05-20 15:30:00.000 NULL
8           6           11          4            Teoretyczne          Znaki drogowe                                      2025-05-20 14:00:00.000 2025-05-20 15:30:00.000 NULL
9           5           11          1            Teoretyczne          BHP                                                2025-05-27 13:00:00.000 2025-05-27 14:30:00.000 NULL
10          6           11          1            Teoretyczne          BHP                                                2025-05-27 13:00:00.000 2025-05-27 14:30:00.000 NULL

(10 rows affected)
*/

-----------------------------------------------------------------------------------------------------------
-- [EgzaminWewnetrzny]
-----------------------------------------------------------------------------------------------------------
SELECT * FROM dbo.EgzaminWewnetrzny;
GO

/*
IdEgzamin   IdKurs      IdEgzaminator Nazwa                                              Rodzaj                                             WynikEgzaminu WynikEgzaminuPunkty DataEgzaminu            Opis
----------- ----------- ------------- -------------------------------------------------- -------------------------------------------------- ------------- ------------------- ----------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           1           2             Egzamin teoretyczny kat. B                         Teoretyczny                                        1             84                  2025-04-01 14:00:00.000 NULL
2           1           8             Egzamin praktyczny kat. B                          Praktyczny                                         0             NULL                2025-04-02 11:45:00.000 NULL
3           1           9             Egzamin praktyczny kat. B                          Praktyczny                                         1             NULL                2025-04-16 10:30:00.000 NULL
4           2           2             Egzamin teoretyczny kat. D                         Teoretyczny                                        1             51                  2025-04-16 15:00:00.000 NULL
5           2           9             Egzamin praktyczny kat. D                          Praktyczny                                         0             NULL                2025-04-24 09:15:00.000 NULL
6           3           6             Egzamin teoretyczny kat. B                         Teoretyczny                                        0             NULL                2025-07-14 11:00:00.000 NULL
7           3           7             Egzamin praktyczny kat. B                          Praktyczny                                         0             NULL                2025-07-22 11:00:00.000 NULL
8           4           6             Egzamin teoretyczny kat. B                         Teoretyczny                                        0             NULL                2025-07-14 11:00:00.000 NULL
9           4           9             Egzamin praktyczny kat. B                          Praktyczny                                         0             NULL                2025-07-23 13:30:00.000 NULL
10          5           10            Egzamin teoretyczny kat. A                         Teoretyczny                                        0             NULL                2025-08-02 10:00:00.000 NULL
11          6           10            Egzamin teoretyczny kat. A                         Teoretyczny                                        0             NULL                2025-08-02 10:00:00.000 NULL

(11 rows affected)
*/

-- Wstawianie
EXECUTE dbo.EgzaminWewnetrzny_Wstaw 12, 1, 8, 'Egzamin praktyczny kat. B', 'Praktyczny', 0, NULL, '2025-05-02 11:15:00', NULL;
GO

/*
(1 row affected)
IdEgzamin   IdKurs      IdEgzaminator Nazwa                                              Rodzaj                                             WynikEgzaminu WynikEgzaminuPunkty DataEgzaminu            Opis
----------- ----------- ------------- -------------------------------------------------- -------------------------------------------------- ------------- ------------------- ----------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           1           2             Egzamin teoretyczny kat. B                         Teoretyczny                                        1             84                  2025-04-01 14:00:00.000 NULL
2           1           8             Egzamin praktyczny kat. B                          Praktyczny                                         0             NULL                2025-04-02 11:45:00.000 NULL
3           1           9             Egzamin praktyczny kat. B                          Praktyczny                                         1             NULL                2025-04-16 10:30:00.000 NULL
4           2           2             Egzamin teoretyczny kat. D                         Teoretyczny                                        1             51                  2025-04-16 15:00:00.000 NULL
5           2           9             Egzamin praktyczny kat. D                          Praktyczny                                         0             NULL                2025-04-24 09:15:00.000 NULL
6           3           6             Egzamin teoretyczny kat. B                         Teoretyczny                                        0             NULL                2025-07-14 11:00:00.000 NULL
7           3           7             Egzamin praktyczny kat. B                          Praktyczny                                         0             NULL                2025-07-22 11:00:00.000 NULL
8           4           6             Egzamin teoretyczny kat. B                         Teoretyczny                                        0             NULL                2025-07-14 11:00:00.000 NULL
9           4           9             Egzamin praktyczny kat. B                          Praktyczny                                         0             NULL                2025-07-23 13:30:00.000 NULL
10          5           10            Egzamin teoretyczny kat. A                         Teoretyczny                                        0             NULL                2025-08-02 10:00:00.000 NULL
11          6           10            Egzamin teoretyczny kat. A                         Teoretyczny                                        0             NULL                2025-08-02 10:00:00.000 NULL
12          1           8             Egzamin praktyczny kat. B                          Praktyczny                                         0             NULL                2025-05-02 11:15:00.000 NULL

(12 rows affected)
*/

-- Modywfikowanie
EXECUTE dbo.EgzaminWewnetrzny_Aktualizuj 12, 1, 8, 'Egzamin praktyczny kat. B', 'Praktyczny', 1, 28, '2025-05-02 11:15:00', NULL;
GO -- zmiana wyniku

/*
(1 row affected)
IdEgzamin   IdKurs      IdEgzaminator Nazwa                                              Rodzaj                                             WynikEgzaminu WynikEgzaminuPunkty DataEgzaminu            Opis
----------- ----------- ------------- -------------------------------------------------- -------------------------------------------------- ------------- ------------------- ----------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           1           2             Egzamin teoretyczny kat. B                         Teoretyczny                                        1             84                  2025-04-01 14:00:00.000 NULL
2           1           8             Egzamin praktyczny kat. B                          Praktyczny                                         0             NULL                2025-04-02 11:45:00.000 NULL
3           1           9             Egzamin praktyczny kat. B                          Praktyczny                                         1             NULL                2025-04-16 10:30:00.000 NULL
4           2           2             Egzamin teoretyczny kat. D                         Teoretyczny                                        1             51                  2025-04-16 15:00:00.000 NULL
5           2           9             Egzamin praktyczny kat. D                          Praktyczny                                         0             NULL                2025-04-24 09:15:00.000 NULL
6           3           6             Egzamin teoretyczny kat. B                         Teoretyczny                                        0             NULL                2025-07-14 11:00:00.000 NULL
7           3           7             Egzamin praktyczny kat. B                          Praktyczny                                         0             NULL                2025-07-22 11:00:00.000 NULL
8           4           6             Egzamin teoretyczny kat. B                         Teoretyczny                                        0             NULL                2025-07-14 11:00:00.000 NULL
9           4           9             Egzamin praktyczny kat. B                          Praktyczny                                         0             NULL                2025-07-23 13:30:00.000 NULL
10          5           10            Egzamin teoretyczny kat. A                         Teoretyczny                                        0             NULL                2025-08-02 10:00:00.000 NULL
11          6           10            Egzamin teoretyczny kat. A                         Teoretyczny                                        0             NULL                2025-08-02 10:00:00.000 NULL
12          1           8             Egzamin praktyczny kat. B                          Praktyczny                                         1             28                  2025-05-02 11:15:00.000 NULL

(12 rows affected)
*/

-- Usuwanie
EXECUTE dbo.EgzaminWewnetrzny_Usun 12;
GO

/*
(1 row affected)
IdEgzamin   IdKurs      IdEgzaminator Nazwa                                              Rodzaj                                             WynikEgzaminu WynikEgzaminuPunkty DataEgzaminu            Opis
----------- ----------- ------------- -------------------------------------------------- -------------------------------------------------- ------------- ------------------- ----------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           1           2             Egzamin teoretyczny kat. B                         Teoretyczny                                        1             84                  2025-04-01 14:00:00.000 NULL
2           1           8             Egzamin praktyczny kat. B                          Praktyczny                                         0             NULL                2025-04-02 11:45:00.000 NULL
3           1           9             Egzamin praktyczny kat. B                          Praktyczny                                         1             NULL                2025-04-16 10:30:00.000 NULL
4           2           2             Egzamin teoretyczny kat. D                         Teoretyczny                                        1             51                  2025-04-16 15:00:00.000 NULL
5           2           9             Egzamin praktyczny kat. D                          Praktyczny                                         0             NULL                2025-04-24 09:15:00.000 NULL
6           3           6             Egzamin teoretyczny kat. B                         Teoretyczny                                        0             NULL                2025-07-14 11:00:00.000 NULL
7           3           7             Egzamin praktyczny kat. B                          Praktyczny                                         0             NULL                2025-07-22 11:00:00.000 NULL
8           4           6             Egzamin teoretyczny kat. B                         Teoretyczny                                        0             NULL                2025-07-14 11:00:00.000 NULL
9           4           9             Egzamin praktyczny kat. B                          Praktyczny                                         0             NULL                2025-07-23 13:30:00.000 NULL
10          5           10            Egzamin teoretyczny kat. A                         Teoretyczny                                        0             NULL                2025-08-02 10:00:00.000 NULL
11          6           10            Egzamin teoretyczny kat. A                         Teoretyczny                                        0             NULL                2025-08-02 10:00:00.000 NULL

(11 rows affected)
*/


-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-- Testowanie Transakcji
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------
-- Archiwizowanie danych tabeli [Instruktor]
----------------------------------------------------------------------------------------
SELECT * FROM dbo.Instruktor;
SELECT * FROM dbo.Instruktor_Kopia;
GO
EXECUTE dbo.Instruktor_Wstaw 11, 'Piotr', 'Borkowski', 'borkowskipiotr@osk.pl', '+ 48 902 000 299', NULL;
GO

/*
IdInstruktor Imie                           Nazwisko                       Email                                              Telefon              Uwagi
------------ ------------------------------ ------------------------------ -------------------------------------------------- -------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1            Przemys³aw                     Rogalski                       rogalskiprzemyslaw@osk.pl                          123 234 345          NULL
2            Celina                         Borkowska                      borkowskacelina@osk.pl                             +48 691 293 237      NULL
3            Eryk                           WoŸniak                        wozniakeryk@osk.pl                                 +48 517 829 380      NULL
4            Aureliusz                      Walczak                        walczakaureliusz@osk.pl                            +48 604 184 631      NULL
5            Lubomir                        Adamczyk                       adamczyklubomir@osk.pl                             +48 721 853 351      NULL
6            Karol                          Maciejewski                    maciejewskikarol@osk.pl                            +48 517 690 242      NULL
7            Karol                          Jab³oñski                      jablonskikarol@osk.pl                              +48 920 517 340      NULL
8            Rados³aw                       Koz³owski                      kozlowskiradoslaw@osk.pl                           +48 532 149 497      NULL
9            Patryk                         Adamski                        adamskipatryk@osk.pl                               +48 029 580 910      NULL
10           Micha³                         Chocho³owski                   chocholowskimichal@osk.pl                          +48 728 920 483      NULL
11           Piotr                          Borkowski                      borkowskipiotr@osk.pl                              + 48 902 000 299     NULL

(11 rows affected)

IdInstruktor Imie                           Nazwisko                       Email                                              Telefon              Uwagi                                                                                                                                                                                                    DataArchiwizacji
------------ ------------------------------ ------------------------------ -------------------------------------------------- -------------------- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------------------

(0 rows affected)
*/

-- (a) Wykonanie transakcji bez b³êdów
EXECUTE dbo.Instruktor_Archiwizuj 11;
GO

/*
IdInstruktor Imie                           Nazwisko                       Email                                              Telefon              Uwagi
------------ ------------------------------ ------------------------------ -------------------------------------------------- -------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1            Przemys³aw                     Rogalski                       rogalskiprzemyslaw@osk.pl                          123 234 345          NULL
2            Celina                         Borkowska                      borkowskacelina@osk.pl                             +48 691 293 237      NULL
3            Eryk                           WoŸniak                        wozniakeryk@osk.pl                                 +48 517 829 380      NULL
4            Aureliusz                      Walczak                        walczakaureliusz@osk.pl                            +48 604 184 631      NULL
5            Lubomir                        Adamczyk                       adamczyklubomir@osk.pl                             +48 721 853 351      NULL
6            Karol                          Maciejewski                    maciejewskikarol@osk.pl                            +48 517 690 242      NULL
7            Karol                          Jab³oñski                      jablonskikarol@osk.pl                              +48 920 517 340      NULL
8            Rados³aw                       Koz³owski                      kozlowskiradoslaw@osk.pl                           +48 532 149 497      NULL
9            Patryk                         Adamski                        adamskipatryk@osk.pl                               +48 029 580 910      NULL
10           Micha³                         Chocho³owski                   chocholowskimichal@osk.pl                          +48 728 920 483      NULL

(10 rows affected)

IdInstruktor Imie                           Nazwisko                       Email                                              Telefon              Uwagi                                                                                                                                                                                                    DataArchiwizacji
------------ ------------------------------ ------------------------------ -------------------------------------------------- -------------------- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------------------
11           Piotr                          Borkowski                      borkowskipiotr@osk.pl                              + 48 902 000 299     NULL                                                                                                                                                                                                     2025-05-16 20:44:01.117

(1 row affected)
*/

-- (b) Wykonanie transakcji z b³êdem 
EXECUTE dbo.Instruktor_Wstaw 11, 'Adam', 'Komar', 'komaradam@osk.pl', '+ 48 900 100 100', NULL;
GO

/* -- Przed
IdInstruktor Imie                           Nazwisko                       Email                                              Telefon              Uwagi
------------ ------------------------------ ------------------------------ -------------------------------------------------- -------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1            Przemys³aw                     Rogalski                       rogalskiprzemyslaw@osk.pl                          123 234 345          NULL
2            Celina                         Borkowska                      borkowskacelina@osk.pl                             +48 691 293 237      NULL
3            Eryk                           WoŸniak                        wozniakeryk@osk.pl                                 +48 517 829 380      NULL
4            Aureliusz                      Walczak                        walczakaureliusz@osk.pl                            +48 604 184 631      NULL
5            Lubomir                        Adamczyk                       adamczyklubomir@osk.pl                             +48 721 853 351      NULL
6            Karol                          Maciejewski                    maciejewskikarol@osk.pl                            +48 517 690 242      NULL
7            Karol                          Jab³oñski                      jablonskikarol@osk.pl                              +48 920 517 340      NULL
8            Rados³aw                       Koz³owski                      kozlowskiradoslaw@osk.pl                           +48 532 149 497      NULL
9            Patryk                         Adamski                        adamskipatryk@osk.pl                               +48 029 580 910      NULL
10           Micha³                         Chocho³owski                   chocholowskimichal@osk.pl                          +48 728 920 483      NULL
11           Adam                           Komar                          komaradam@osk.pl                                   + 48 900 100 100     NULL

(11 rows affected)

IdInstruktor Imie                           Nazwisko                       Email                                              Telefon              Uwagi                                                                                                                                                                                                    DataArchiwizacji
------------ ------------------------------ ------------------------------ -------------------------------------------------- -------------------- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------------------
11           Piotr                          Borkowski                      borkowskipiotr@osk.pl                              + 48 902 000 299     NULL                                                                                                                                                                                                     2025-05-16 20:44:01.117

(1 row affected)
*/
EXECUTE dbo.Instruktor_Archiwizuj 11;
GO

/*
Msg 2627, Level 14, State 1, Procedure dbo.Instruktor_Archiwizuj, Line 11 [Batch Start Line 846]
Violation of PRIMARY KEY constraint 'PK__Instrukt__CCFD2D41F4ED145C'. Cannot insert duplicate key in object 'dbo.Instruktor_Kopia'. The duplicate key value is (11).

Completion time: 2025-05-16T20:48:12.3882703+02:00
*/



-- (c) Wykonanie transakcji z przerwaniem transakcji
-- TRUNCATE TABLE dbo.Instruktor_Kopia;
-- GO
/*
IdInstruktor Imie                           Nazwisko                       Email                                              Telefon              Uwagi
------------ ------------------------------ ------------------------------ -------------------------------------------------- -------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1            Przemys³aw                     Rogalski                       rogalskiprzemyslaw@osk.pl                          123 234 345          NULL
2            Celina                         Borkowska                      borkowskacelina@osk.pl                             +48 691 293 237      NULL
3            Eryk                           WoŸniak                        wozniakeryk@osk.pl                                 +48 517 829 380      NULL
4            Aureliusz                      Walczak                        walczakaureliusz@osk.pl                            +48 604 184 631      NULL
5            Lubomir                        Adamczyk                       adamczyklubomir@osk.pl                             +48 721 853 351      NULL
6            Karol                          Maciejewski                    maciejewskikarol@osk.pl                            +48 517 690 242      NULL
7            Karol                          Jab³oñski                      jablonskikarol@osk.pl                              +48 920 517 340      NULL
8            Rados³aw                       Koz³owski                      kozlowskiradoslaw@osk.pl                           +48 532 149 497      NULL
9            Patryk                         Adamski                        adamskipatryk@osk.pl                               +48 029 580 910      NULL
10           Micha³                         Chocho³owski                   chocholowskimichal@osk.pl                          +48 728 920 483      NULL
11           Adam                           Komar                          komaradam@osk.pl                                   + 48 900 100 100     NULL

(11 rows affected)

IdInstruktor Imie                           Nazwisko                       Email                                              Telefon              Uwagi                                                                                                                                                                                                    DataArchiwizacji
------------ ------------------------------ ------------------------------ -------------------------------------------------- -------------------- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------------------

(0 rows affected)
*/
EXECUTE dbo.Instruktor_Archiwizuj 11;
GO

/*
(1 row affected)
Query was canceled by user.
IdInstruktor Imie                           Nazwisko                       Email                                              Telefon              Uwagi
------------ ------------------------------ ------------------------------ -------------------------------------------------- -------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1            Przemys³aw                     Rogalski                       rogalskiprzemyslaw@osk.pl                          123 234 345          NULL
2            Celina                         Borkowska                      borkowskacelina@osk.pl                             +48 691 293 237      NULL
3            Eryk                           WoŸniak                        wozniakeryk@osk.pl                                 +48 517 829 380      NULL
4            Aureliusz                      Walczak                        walczakaureliusz@osk.pl                            +48 604 184 631      NULL
5            Lubomir                        Adamczyk                       adamczyklubomir@osk.pl                             +48 721 853 351      NULL
6            Karol                          Maciejewski                    maciejewskikarol@osk.pl                            +48 517 690 242      NULL
7            Karol                          Jab³oñski                      jablonskikarol@osk.pl                              +48 920 517 340      NULL
8            Rados³aw                       Koz³owski                      kozlowskiradoslaw@osk.pl                           +48 532 149 497      NULL
9            Patryk                         Adamski                        adamskipatryk@osk.pl                               +48 029 580 910      NULL
10           Micha³                         Chocho³owski                   chocholowskimichal@osk.pl                          +48 728 920 483      NULL
11           Adam                           Komar                          komaradam@osk.pl                                   + 48 900 100 100     NULL

(11 rows affected)

IdInstruktor Imie                           Nazwisko                       Email                                              Telefon              Uwagi                                                                                                                                                                                                    DataArchiwizacji
------------ ------------------------------ ------------------------------ -------------------------------------------------- -------------------- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -----------------------

(0 rows affected)
*/

----------------------------------------------------------------------------------------
-- Monitorowanie zmian wp³at do kursu [Kurs.Zaplacono]
----------------------------------------------------------------------------------------
SELECT * FROM dbo.Kurs;
SELECT * FROM dbo.KursZaplacono_Historia;
GO

/*
IdKurs      IdKategoria IdKursant   IdStanKursu Nazwa                                              DataRozpoczecia DataZakonczenia Cena                  TerminPlatnosci Zaplacono             Opis
----------- ----------- ----------- ----------- -------------------------------------------------- --------------- --------------- --------------------- --------------- --------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           4           1           12          Kurs na samochód osobowy kat. B                    2025-01-15      2025-04-16      2600,00               2025-01-30      2200,00               NULL
2           8           3           11          Kurs na Autobus kat. D                             2025-02-01      2025-05-01      3500,00               2025-02-28      3500,00               Kursant zrezygnowa³ z kontynuowania kursu
3           4           5           4           Kurs na samochód osobowy kat. B                    2025-05-01      2025-08-01      2600,00               2025-05-30      1100,00               NULL
4           4           4           4           Kurs na samochód osobowy kat. B                    2025-05-01      2025-08-01      2600,00               2025-05-30      2200,00               NULL
5           2           9           2           Kurs na motocykl kat. A                            2025-05-11      2025-08-12      1800,00               2025-06-30      0,00                  NULL
6           2           10          2           Kurs na motocykl kat. A                            2025-05-11      2025-08-12      1800,00               2025-06-30      0,00                  NULL
7           7           3           1           Kurs na pojazd ciê¿arowy C+E                       2025-08-20      2025-11-20      4600,00               2025-09-30      0,00                  NULL
8           4           2           1           Kurs na samochód osobowy kat. B                    2025-10-11      2026-01-12      2600,00               2025-11-30      0,00                  NULL
9           4           6           1           Kurs na samochód osobowy kat. B                    2025-10-11      2026-01-12      2600,00               2025-11-30      0,00                  NULL
10          4           7           1           Kurs na samochód osobowy kat. B                    2025-10-11      2026-01-12      2600,00               2025-11-30      0,00                  NULL

(10 rows affected)

IdKursZaplacono IdKurs      DataGodzZmiany          ZaplaconoPrzed        ZaplaconoPo
--------------- ----------- ----------------------- --------------------- ---------------------

(0 rows affected)
*/

-- (a) Modyfikacja zaplaty kursu
EXECUTE dbo.Kurs_ZmienZaplacono
@Par_IdKurs = 6,
@Par_Zaplacono = 900;
GO

/*
(1 row affected)

(1 row affected)
IdKurs      IdKategoria IdKursant   IdStanKursu Nazwa                                              DataRozpoczecia DataZakonczenia Cena                  TerminPlatnosci Zaplacono             Opis
----------- ----------- ----------- ----------- -------------------------------------------------- --------------- --------------- --------------------- --------------- --------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           4           1           12          Kurs na samochód osobowy kat. B                    2025-01-15      2025-04-16      2600,00               2025-01-30      2200,00               NULL
2           8           3           11          Kurs na Autobus kat. D                             2025-02-01      2025-05-01      3500,00               2025-02-28      3500,00               Kursant zrezygnowa³ z kontynuowania kursu
3           4           5           4           Kurs na samochód osobowy kat. B                    2025-05-01      2025-08-01      2600,00               2025-05-30      1100,00               NULL
4           4           4           4           Kurs na samochód osobowy kat. B                    2025-05-01      2025-08-01      2600,00               2025-05-30      2200,00               NULL
5           2           9           2           Kurs na motocykl kat. A                            2025-05-11      2025-08-12      1800,00               2025-06-30      0,00                  NULL
6           2           10          2           Kurs na motocykl kat. A                            2025-05-11      2025-08-12      1800,00               2025-06-30      900,00                NULL
7           7           3           1           Kurs na pojazd ciê¿arowy C+E                       2025-08-20      2025-11-20      4600,00               2025-09-30      0,00                  NULL
8           4           2           1           Kurs na samochód osobowy kat. B                    2025-10-11      2026-01-12      2600,00               2025-11-30      0,00                  NULL
9           4           6           1           Kurs na samochód osobowy kat. B                    2025-10-11      2026-01-12      2600,00               2025-11-30      0,00                  NULL
10          4           7           1           Kurs na samochód osobowy kat. B                    2025-10-11      2026-01-12      2600,00               2025-11-30      0,00                  NULL

(10 rows affected)

IdKursZaplacono IdKurs      DataGodzZmiany          ZaplaconoPrzed        ZaplaconoPo
--------------- ----------- ----------------------- --------------------- ---------------------
1               6           2025-05-16 20:56:21.880 0,00                  900,00

(1 row affected)
*/

-- (b) Modyfikacja zap³aty do kursu bez zmiany wp³aty
EXECUTE dbo.Kurs_ZmienZaplacono
@Par_IdKurs = 6,
@Par_Zaplacono = 900;
GO

/*
(1 row affected)
IdKurs      IdKategoria IdKursant   IdStanKursu Nazwa                                              DataRozpoczecia DataZakonczenia Cena                  TerminPlatnosci Zaplacono             Opis
----------- ----------- ----------- ----------- -------------------------------------------------- --------------- --------------- --------------------- --------------- --------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           4           1           12          Kurs na samochód osobowy kat. B                    2025-01-15      2025-04-16      2600,00               2025-01-30      2200,00               NULL
2           8           3           11          Kurs na Autobus kat. D                             2025-02-01      2025-05-01      3500,00               2025-02-28      3500,00               Kursant zrezygnowa³ z kontynuowania kursu
3           4           5           4           Kurs na samochód osobowy kat. B                    2025-05-01      2025-08-01      2600,00               2025-05-30      1100,00               NULL
4           4           4           4           Kurs na samochód osobowy kat. B                    2025-05-01      2025-08-01      2600,00               2025-05-30      2200,00               NULL
5           2           9           2           Kurs na motocykl kat. A                            2025-05-11      2025-08-12      1800,00               2025-06-30      0,00                  NULL
6           2           10          2           Kurs na motocykl kat. A                            2025-05-11      2025-08-12      1800,00               2025-06-30      900,00                NULL
7           7           3           1           Kurs na pojazd ciê¿arowy C+E                       2025-08-20      2025-11-20      4600,00               2025-09-30      0,00                  NULL
8           4           2           1           Kurs na samochód osobowy kat. B                    2025-10-11      2026-01-12      2600,00               2025-11-30      0,00                  NULL
9           4           6           1           Kurs na samochód osobowy kat. B                    2025-10-11      2026-01-12      2600,00               2025-11-30      0,00                  NULL
10          4           7           1           Kurs na samochód osobowy kat. B                    2025-10-11      2026-01-12      2600,00               2025-11-30      0,00                  NULL

(10 rows affected)

IdKursZaplacono IdKurs      DataGodzZmiany          ZaplaconoPrzed        ZaplaconoPo
--------------- ----------- ----------------------- --------------------- ---------------------
1               6           2025-05-16 20:56:21.880 0,00                  900,00

(1 row affected)
*/

-- (c) Próba modyfikacji nieistniej¹cego kursu
EXECUTE dbo.Kurs_ZmienZaplacono
@Par_IdKurs = 20,
@Par_Zaplacono = 999;
GO

/*
(0 rows affected)
IdKurs      IdKategoria IdKursant   IdStanKursu Nazwa                                              DataRozpoczecia DataZakonczenia Cena                  TerminPlatnosci Zaplacono             Opis
----------- ----------- ----------- ----------- -------------------------------------------------- --------------- --------------- --------------------- --------------- --------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           4           1           12          Kurs na samochód osobowy kat. B                    2025-01-15      2025-04-16      2600,00               2025-01-30      2200,00               NULL
2           8           3           11          Kurs na Autobus kat. D                             2025-02-01      2025-05-01      3500,00               2025-02-28      3500,00               Kursant zrezygnowa³ z kontynuowania kursu
3           4           5           4           Kurs na samochód osobowy kat. B                    2025-05-01      2025-08-01      2600,00               2025-05-30      1100,00               NULL
4           4           4           4           Kurs na samochód osobowy kat. B                    2025-05-01      2025-08-01      2600,00               2025-05-30      2200,00               NULL
5           2           9           2           Kurs na motocykl kat. A                            2025-05-11      2025-08-12      1800,00               2025-06-30      0,00                  NULL
6           2           10          2           Kurs na motocykl kat. A                            2025-05-11      2025-08-12      1800,00               2025-06-30      900,00                NULL
7           7           3           1           Kurs na pojazd ciê¿arowy C+E                       2025-08-20      2025-11-20      4600,00               2025-09-30      0,00                  NULL
8           4           2           1           Kurs na samochód osobowy kat. B                    2025-10-11      2026-01-12      2600,00               2025-11-30      0,00                  NULL
9           4           6           1           Kurs na samochód osobowy kat. B                    2025-10-11      2026-01-12      2600,00               2025-11-30      0,00                  NULL
10          4           7           1           Kurs na samochód osobowy kat. B                    2025-10-11      2026-01-12      2600,00               2025-11-30      0,00                  NULL

(10 rows affected)

IdKursZaplacono IdKurs      DataGodzZmiany          ZaplaconoPrzed        ZaplaconoPo
--------------- ----------- ----------------------- --------------------- ---------------------
1               6           2025-05-16 20:56:21.880 0,00                  900,00

(1 row affected)
*/

-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
-- Sprawdzenie zawartoœci bazy danych
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
SELECT * FROM dbo.Kursant;
SELECT * FROM dbo.StanKursu;
SELECT * FROM dbo.Kategoria;
SELECT * FROM dbo.Pojazd;
SELECT * FROM dbo.Instruktor;
SELECT * FROM dbo.Kurs;
SELECT * FROM dbo.Zajecia;
SELECT * FROM dbo.EgzaminWewnetrzny;
GO

/*
IdKursant   Imie                           Nazwisko                       Miejscowosc                                        KodPocztowy Ulica                                              NumerDomu  Email                                              Telefon              Uwagi
----------- ------------------------------ ------------------------------ -------------------------------------------------- ----------- -------------------------------------------------- ---------- -------------------------------------------------- -------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Jan                            Kowalski                       Kalisz                                             60-050      Grunwaldzka                                        16         jankowalski@poczta.fm                              +48 997 808 220      NULL
2           Anna                           Kowalska                       Kalisz                                             60-050      NULL                                               16B        annakowalska@poczta.fm                             +48 607 776 120      NULL
3           Kamil                          Nowak                          Ostrów                                             55-150      Pó³nocna                                           3/4        superkamil@gmail.com                               +48 100 508 320      NULL
4           Jolanta                        Zaj¹c                          Kalisz                                             60-050      Kostki                                             42         jolanta@gmail.com                                  +48 699 021 018      NULL
5           Jakub                          Michalski                      Ostrów                                             55-150      Jagodowa                                           12         jakubmichalski22@o2.pl                             +48 513 899 620      NULL
6           Zuzanna                        Walczak                        Sulis³awice                                        34-250      Œwitezianki                                        20         zuza@gmail.com                                     +48 723 153 246      NULL
7           Eryk                           Symañski                       Leziona                                            58-354      NULL                                               6          NULL                                               +48 724 652 984      NULL
8           Natala                         Pawlak                         Kalisz                                             60-050      Poznañska                                          13B        NULL                                               +48 662 137 299      NULL
9           Marzena                        Wysocka                        Leziona                                            58-354      NULL                                               6          marzenawysocka@gmail.com                           +48 791 896 988      NULL
10          Borys                          Nowak                          Kalisz                                             55-150      Poznañska                                          114        nowakborys9@o2.pl                                  +48 603 536 170      NULL

(10 rows affected)

IdStanKursu Nazwa
----------- --------------------------------------------------
9           Egzamin pañstwowy zaliczony
7           Egzamin wewnêtrzny zaliczony
10          Niezaliczony
8           Oczekuje na egzamin pañstwowy
6           Oczekuje na egzamin wewnêtrzny
11          Przerwany
12          Ukoñczony
4           W trakcie jazd
2           W trakcie teorii
5           Zakoñczono jazdy
3           Zakoñczono teoriê
1           Zarejestrowany

(12 rows affected)

IdKategoria Nazwa                                              Skrot
----------- -------------------------------------------------- ----------
1           Motorower                                          AM
2           Ka¿dy motocykl                                     A
3           Czteroko³owiec                                     B1
4           Pojazd samochodowy o masie < 3,5ton                B
5           Zespó³ pojazdów kat. B i przyczepy                 B+E
6           Pojazd samochodowy o masie > 3,5ton                C
7           Zespó³ pojazdów kat. C i przyczepy                 C+E
8           Autobus                                            D
9           Zespó³ pojazdów kat. D i przyczepy                 D+E
10          Pojazd wolnobie¿ny                                 T

(10 rows affected)

IdPojazd    Marka                Model                          RokProdukcji NrRejestracyjny VIN                            Opis
----------- -------------------- ------------------------------ ------------ --------------- ------------------------------ --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           Toyota               Yaris                          2010         PKA 1FD5        0123456789ABCDEFG              NULL
2           Kia                  Rio                            2006         PK 89DA         4T1BF22K8YU005156              NULL
3           Hyundai              i20                            2009         PA 1EGAC        1FTPW14585FA81441              W konserwacji
4           Renault              Clio                           2009         MKA 9DFGB       1G2ZJ57B594220317              NULL
5           Audi                 A4                             2011         MA E4E5         WAUHFBFR0A0010190              NULL
6           Ford                 Fiesta                         2008         MA SF3D6        WAUDG74FX5ND88616              NULL
7           Kia                  Rio                            2007         PK F5G12        5XYKT4A18DG418921              NULL
8           Kia                  Rio                            2007         PK TG6F         KNDJT2A23A7159904              NULL
9           Toyota               Yaris                          2014         PA CD5A2        JTDBE38K720072804              NULL
10          Hyundai              i20                            2012         PKA T5HJ        KMHJG35F414262494              NULL
11          Yamaha               MT-07                          2012         PK MT80         JHMRA3810WC201700              NULL

(11 rows affected)

IdInstruktor Imie                           Nazwisko                       Email                                              Telefon              Uwagi
------------ ------------------------------ ------------------------------ -------------------------------------------------- -------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1            Przemys³aw                     Rogalski                       rogalskiprzemyslaw@osk.pl                          123 234 345          NULL
2            Celina                         Borkowska                      borkowskacelina@osk.pl                             +48 691 293 237      NULL
3            Eryk                           WoŸniak                        wozniakeryk@osk.pl                                 +48 517 829 380      NULL
4            Aureliusz                      Walczak                        walczakaureliusz@osk.pl                            +48 604 184 631      NULL
5            Lubomir                        Adamczyk                       adamczyklubomir@osk.pl                             +48 721 853 351      NULL
6            Karol                          Maciejewski                    maciejewskikarol@osk.pl                            +48 517 690 242      NULL
7            Karol                          Jab³oñski                      jablonskikarol@osk.pl                              +48 920 517 340      NULL
8            Rados³aw                       Koz³owski                      kozlowskiradoslaw@osk.pl                           +48 532 149 497      NULL
9            Patryk                         Adamski                        adamskipatryk@osk.pl                               +48 029 580 910      NULL
10           Micha³                         Chocho³owski                   chocholowskimichal@osk.pl                          +48 728 920 483      NULL

(10 rows affected)

IdKurs      IdKategoria IdKursant   IdStanKursu Nazwa                                              DataRozpoczecia DataZakonczenia Cena                  TerminPlatnosci Zaplacono             Opis
----------- ----------- ----------- ----------- -------------------------------------------------- --------------- --------------- --------------------- --------------- --------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           4           1           12          Kurs na samochód osobowy kat. B                    2025-01-15      2025-04-16      2600,00               2025-01-30      2200,00               NULL
2           8           3           11          Kurs na Autobus kat. D                             2025-02-01      2025-05-01      3500,00               2025-02-28      3500,00               Kursant zrezygnowa³ z kontynuowania kursu
3           4           5           4           Kurs na samochód osobowy kat. B                    2025-05-01      2025-08-01      2600,00               2025-05-30      1100,00               NULL
4           4           4           4           Kurs na samochód osobowy kat. B                    2025-05-01      2025-08-01      2600,00               2025-05-30      2200,00               NULL
5           2           9           2           Kurs na motocykl kat. A                            2025-05-11      2025-08-12      1800,00               2025-06-30      0,00                  NULL
6           2           10          2           Kurs na motocykl kat. A                            2025-05-11      2025-08-12      1800,00               2025-06-30      0,00                  NULL
7           7           3           1           Kurs na pojazd ciê¿arowy C+E                       2025-08-20      2025-11-20      4600,00               2025-09-30      0,00                  NULL
8           4           2           1           Kurs na samochód osobowy kat. B                    2025-10-11      2026-01-12      2600,00               2025-11-30      0,00                  NULL
9           4           6           1           Kurs na samochód osobowy kat. B                    2025-10-11      2026-01-12      2600,00               2025-11-30      0,00                  NULL
10          4           7           1           Kurs na samochód osobowy kat. B                    2025-10-11      2026-01-12      2600,00               2025-11-30      0,00                  NULL

(10 rows affected)

IdZajecia   IdKurs      IdPojazd    IdInstruktor Rodzaj               Temat                                              DataZajecOd             DataZajecDo             Opis
----------- ----------- ----------- ------------ -------------------- -------------------------------------------------- ----------------------- ----------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           3           7           2            Praktyczne           Jazda po mieœcie                                   2025-05-15 10:00:00.000 2025-05-15 11:30:00.000 NULL
2           4           7           2            Praktyczne           Jazda po mieœcie                                   2025-05-15 11:30:00.000 2025-05-15 13:00:00.000 NULL
3           3           7           2            Praktyczne           Jazda po mieœcie                                   2025-05-22 10:00:00.000 2025-05-22 11:30:00.000 NULL
4           4           7           2            Praktyczne           Jazda po mieœcie                                   2025-05-22 11:30:00.000 2025-05-22 13:00:00.000 NULL
5           3           7           2            Praktyczne           Jazda po mieœcie                                   2025-06-01 10:00:00.000 2025-06-01 11:30:00.000 NULL
6           4           7           2            Praktyczne           Jazda po mieœcie                                   2025-06-07 14:00:00.000 2025-06-07 15:30:00.000 NULL
7           5           11          4            Teoretyczne          Znaki drogowe                                      2025-05-20 14:00:00.000 2025-05-20 15:30:00.000 NULL
8           6           11          4            Teoretyczne          Znaki drogowe                                      2025-05-20 14:00:00.000 2025-05-20 15:30:00.000 NULL
9           5           11          1            Teoretyczne          BHP                                                2025-05-27 13:00:00.000 2025-05-27 14:30:00.000 NULL
10          6           11          1            Teoretyczne          BHP                                                2025-05-27 13:00:00.000 2025-05-27 14:30:00.000 NULL

(10 rows affected)

IdEgzamin   IdKurs      IdEgzaminator Nazwa                                              Rodzaj                                             WynikEgzaminu WynikEgzaminuPunkty DataEgzaminu            Opis
----------- ----------- ------------- -------------------------------------------------- -------------------------------------------------- ------------- ------------------- ----------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1           1           2             Egzamin teoretyczny kat. B                         Teoretyczny                                        1             84                  2025-04-01 14:00:00.000 NULL
2           1           8             Egzamin praktyczny kat. B                          Praktyczny                                         0             NULL                2025-04-02 11:45:00.000 NULL
3           1           9             Egzamin praktyczny kat. B                          Praktyczny                                         1             NULL                2025-04-16 10:30:00.000 NULL
4           2           2             Egzamin teoretyczny kat. D                         Teoretyczny                                        1             51                  2025-04-16 15:00:00.000 NULL
5           2           9             Egzamin praktyczny kat. D                          Praktyczny                                         0             NULL                2025-04-24 09:15:00.000 NULL
6           3           6             Egzamin teoretyczny kat. B                         Teoretyczny                                        0             NULL                2025-07-14 11:00:00.000 NULL
7           3           7             Egzamin praktyczny kat. B                          Praktyczny                                         0             NULL                2025-07-22 11:00:00.000 NULL
8           4           6             Egzamin teoretyczny kat. B                         Teoretyczny                                        0             NULL                2025-07-14 11:00:00.000 NULL
9           4           9             Egzamin praktyczny kat. B                          Praktyczny                                         0             NULL                2025-07-23 13:30:00.000 NULL
10          5           10            Egzamin teoretyczny kat. A                         Teoretyczny                                        0             NULL                2025-08-02 10:00:00.000 NULL
11          6           10            Egzamin teoretyczny kat. A                         Teoretyczny                                        0             NULL                2025-08-02 10:00:00.000 NULL

(11 rows affected)


Completion time: 2025-05-16T18:57:56.4120523+02:00
*/