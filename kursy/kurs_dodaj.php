<?php
    session_name("PSIN");
    session_start();
?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="utf-8">
    <title>Ośrodek szkolenia kierowców</title>
    <meta name="keywords" content="szkolenia, kursy, prawo jazdy, licencja, jazdy, egzaminy">
    <meta name="description" content="Strona utworzona w ramach przedmiotu PSIN">
    <meta name="author" content="Jakub J.">

    <link rel="stylesheet" href="../css/uklad.css" type="text/css">
    <link rel="stylesheet" href="css/styl.css" type="text/css">
</head>
<body>
    
    <?php
        require_once("../uklad_poczatek.php");
        require_once("../uwierzytelnienie.php");


        // Sprawdzenie poprawności i kompletności danych
        if(!isset($_GET["IdKurs"])
            || (trim($_GET["IdKurs"]) == "")
            || !is_numeric($_GET["IdKurs"])

            || !isset($_GET["IdKursant"])
            || (trim($_GET["IdKursant"]) == "")
            || !is_numeric($_GET["IdKursant"])
            || ($_GET["IdKursant"] == 0)

            || !isset($_GET["IdKategoria"])
            || (trim($_GET["IdKategoria"]) == "")
            || !is_numeric($_GET["IdKategoria"])
            || ($_GET["IdKategoria"] == 0)

            || !isset($_GET["IdStanKursu"])
            || (trim($_GET["IdStanKursu"]) == "")
            || !is_numeric($_GET["IdStanKursu"])
            || ($_GET["IdStanKursu"] == 0)

            || !isset($_GET["KursNazwa"])
            || (trim($_GET["KursNazwa"]) == "")

            || !isset($_GET["DataRozpoczecia"])
            || (trim($_GET["DataRozpoczecia"]) == "")
            || !date_format(date_create($_GET["DataRozpoczecia"]), "Y-m-d")

            || !isset($_GET["DataZakonczenia"])
            || (trim($_GET["DataZakonczenia"]) == "")
            || !date_format(date_create($_GET["DataZakonczenia"]), "Y-m-d")

            || !isset($_GET["Cena"])
            || (trim($_GET["Cena"]) == "")

            || !isset($_GET["TerminPlatnosci"])
            || (trim($_GET["TerminPlatnosci"]) == "")
            || !date_format(date_create($_GET["TerminPlatnosci"]), "Y-m-d")

            || !isset($_GET["Zaplacono"])
            || (trim($_GET["Zaplacono"]) == ""))
            {
                print("<p class='msg error'>Nie można zapisać danych kursu,
                 ponieważ jego dane są niekompletne lub niepoprawne</p>");

                print("<p><a class='btn' href='kurs_tabela.php'>Powrót do wykazu kursów</a></p>");

                require_once("../uklad_koniec.php");
                die();
            }

        $serwer = "LAPTOP-MGQT4RCV\SQL1";

        $dane_polaczenia = array("Database" => "OSK", "CharacterSet" => "UTF-8");

        $polaczenie = sqlsrv_connect($serwer, $dane_polaczenia);

        if(!$polaczenie)
        {
            print("<p class='msg error'>Połaczenie z serwerem nie powiodło się.</p>");

            print(print_r(sqlsrv_errors(), true));
            require_once("../uklad_koniec.php");
            die();
        }
        else
        {
            // Jeżeli nawiązano połączenie
            // print("<p class='msg success'>Nawiązano połączenie z serwerem $serwer </p>");

            // Pobranie danych z formularza
            $IdKurs = trim($_GET["IdKurs"]);
            $IdKursant = trim($_GET["IdKursant"]);
            $IdKategoria = trim($_GET["IdKategoria"]);
            $IdStanKursu = trim($_GET["IdStanKursu"]);
            $KursNazwa = trim($_GET["KursNazwa"]);
            $DataRozpoczecia = trim($_GET["DataRozpoczecia"]);
            $DataZakonczenia = trim($_GET["DataZakonczenia"]);
            $Cena = trim($_GET["Cena"]);
            $TerminPlatnosci = trim($_GET["TerminPlatnosci"]);
            $Zaplacono = trim($_GET["Zaplacono"]);

            // Konwersja zmiennych typu money
            $Cena = str_replace(' ', '', $Cena);
            $Cena = str_replace(',', '.', $Cena);
            
            $Zaplacono = str_replace(' ', '', $Zaplacono);
            $Zaplacono = str_replace(',', '.', $Zaplacono);

            // Komenda SQL wstawiająca dane
            $sql = 
            "EXECUTE dbo.Kurs_Wstaw 
            @Par_IdKurs = ?, 
            @Par_IdKategoria = ?, 
            @Par_IdKursant = ?, 
            @Par_IdStanKursu = ?, 
            @Par_Nazwa = ?, 
            @Par_DataRozpoczecia = ?, 
            @Par_DataZakonczenia = ?, 
            @Par_Cena = ?, 
            @Par_TerminPlatnosci = ?, 
            @Par_Zaplacono = ?,
            @Par_Opis = NULL;";

            $dane = array(
                $IdKurs, 
                $IdKategoria, 
                $IdKursant, 
                $IdStanKursu, 
                $KursNazwa, 
                $DataRozpoczecia, 
                $DataZakonczenia, 
                $Cena, 
                $TerminPlatnosci, 
                $Zaplacono
            );

            $komenda_sql = sqlsrv_prepare($polaczenie, $sql, $dane);
            if (!$komenda_sql) {
                print(print_r(sqlsrv_errors(), true));
                require_once("../uklad_koniec.php");
                die();
            }

            $rezultat = sqlsrv_execute($komenda_sql);

            // print("Komenda SQL: $komenda_sql</p>");

            // Wykonanie polecenia
            // $rezultat = sqlsrv_query($polaczenie, $komenda_sql);

            if(!$rezultat)
            {
                // Jeżli polecenie nie powiodło się
                print("<p class='msg error'>Zapisanie kursu <strong>$KursNazwa</strong> nie powiodło się.</p>");
            }
            else
            {
                // Jeżel udało się dodać instruktora
                print("<p class='msg success'>Dane kursu <strong>$KursNazwa</strong> zostały zapisane w bazie.</p>");
            }

            print("<p><a class='btn' href='kurs_tabela.php'>Powrót do wykazu kursów</a></p>");

            // Zwolnienie pamięci zarezerwowanej na wynik zapytania
            // if($rezultat != null)
            //     sqlsrv_free_stmt($rezultat);

            sqlsrv_close($polaczenie);

        } // Nawiązano połączenie
        require_once("../uklad_koniec.php");

    ?>
   
</body>
</html>