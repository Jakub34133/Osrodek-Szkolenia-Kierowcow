<?php
    session_name("PSIN");
    session_start();
?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="utf-8">
    <title>Programowanie serwisów internetowych - lista C1.</title>
    <meta name="keywords" content="serwisy, internetowe, programowanie">
    <meta name="description" content="Strona utworzona w ramach listy C1.">
    <meta name="author" content="Jan Kowalski">

    <link rel="stylesheet" href="../css/uklad.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
    
    <?php
        require_once("../uklad_poczatek.php");
        require_once("../uwierzytelnienie.php");

        
        // Sprawdzenie poprawności i kompletności danych
        if(!isset($_GET["IdInstruktor"])
            || (trim($_GET["IdInstruktor"]) == "")
            || !is_numeric($_GET["IdInstruktor"])
            || !isset($_GET["Imie"])
            || (trim($_GET["Imie"]) == "")
            || !isset($_GET["Nazwisko"])
            || (trim($_GET["Nazwisko"]) == "")
            || !isset($_GET["Email"])
            || (trim($_GET["Email"]) == "")
            || !isset($_GET["Telefon"])
            || (trim($_GET["Telefon"]) == "")
        )
        {
            print("<p class='msg error'>Nie można zapisać danych instruktora,
                ponieważ jego dane są niekompletne lub niepoprawne</p>");

            print("<p><a class='btn' href='instruktorzy_tabela.php'>Powrót do wykazu instruktorów</a></p>");

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
            $IdInstruktor = $_GET["IdInstruktor"];
            $Imie = $_GET["Imie"];
            $Nazwisko = $_GET["Nazwisko"];
            $Email = $_GET["Email"];
            $Telefon = $_GET["Telefon"];
            $Uwagi = isset($_GET["Uwagi"]) && trim($_GET["Uwagi"] != "") ? $Uwagi = "'" . $_GET["Uwagi"] . "'" : $Uwagi = "NULL";

            // Komenda SQL wstawiająca dane
            $komenda_sql = 
            "UPDATE dbo.Instruktor
            SET Imie = '$Imie', 
                Nazwisko = '$Nazwisko', 
                Email = '$Email', 
                Telefon = '$Telefon', 
                Uwagi = $Uwagi
            WHERE IdInstruktor = $IdInstruktor;";

            // print("Komenda SQL: $komenda_sql</p>");

            // Wykonanie polecenia
            $rezultat = sqlsrv_query($polaczenie, $komenda_sql);

            if(!$rezultat)
            {
                // Jeżli polecenie nie powiodło się
                print("<p class='msg error'>Zapisanie instruktora <strong>$Imie $Nazwisko</strong> nie powiodło się.</p>");
            }
            else
            {
                // Jeżel udało się dodać instruktora
                print("<p class='msg success'>Dane instruktora <strong>$Imie $Nazwisko</strong> zostały zapisane w bazie.</p>");
            }

            print("<p><a class='btn' href='instruktorzy_tabela.php'>Powrót do wykazu instruktorów</a></p>");

            // Zwolnienie pamięci zarezerwowanej na wynik zapytania
            if($rezultat != null)
                sqlsrv_free_stmt($rezultat);

            sqlsrv_close($polaczenie);

        } // Nawiązano połączenie
        require_once("../uklad_koniec.php");

    ?>
   
</body>
</html>