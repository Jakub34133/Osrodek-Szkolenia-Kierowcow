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
        )
        {
            print("<p class='msg error'>Nie można usunąć danych kursu,
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
            print("<p class='msg error'>Polaczenie z serwerem nie powiodło się.</p>");
            print(print_r(sqlsrv_errors(), true));
            require_once("../uklad_koniec.php");
            die();
        }
        else
        {
            // Jeżeli nawiązano połączenie
            // print("<p class='msg success'>Nawiązano połączenie z serwerem $serwer </p>");

            // Pobranie danych z formularza
            $IdKurs = $_GET["IdKurs"];

            // Komenda SQL wstawiająca dane
            $sql = 
            "EXECUTE dbo.Kurs_Usun
            @Par_IdKurs = ?;";

            $dane = array($IdKurs);
            // print("Komenda SQL: $komenda_sql</p>");

            // Wykonanie polecenia
            // $rezultat = sqlsrv_query($polaczenie, $komenda_sql);
            $komenda_sql = sqlsrv_prepare($polaczenie, $sql, $dane);
            if (!$komenda_sql) {
                print(print_r(sqlsrv_errors(), true));
                require_once("../uklad_koniec.php");
                die();
            }

            $rezultat = sqlsrv_execute($komenda_sql);

            if(!$rezultat)
            {
                // Jeżli polecenie nie powiodło się
                print("<p class='msg error'>Usunięcie kursu o identyfikatorze <strong>$IdKurs</strong> nie powiodło się.</p>");
            }
            else
            {
                // Jeżel udało się usunąć kursu
                print("<p class='msg success'>Dane kursu <strong>$IdKurs</strong> zostały usunięte z bazy.</p>");
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