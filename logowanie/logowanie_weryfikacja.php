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

    // Sprawdzenie danych przesłanych przez formularz logowania
    if(!isset($_POST["Konto"])
        || trim($_POST["Konto"] == "")
        || !isset($_POST["Haslo"])
        || trim($_POST["Haslo"] == "")
    )
    {
        $_SESSION["zalogowany"] = false;
        
        if(isset($_SESSION["uzytkownik"]))
            unset($_SESSION["uzytkownik"]);

        if(isset($_SESSION["Imie"]))
            unset($_SESSION["Imie"]);
        
        if(isset($_SESSION["Nazwisko"]))
            unset($_SESSION["Nazwisko"]);

        require_once("../uklad_poczatek.php");

        print("<p class='msg error'>Nieprawidłowa nazwa konta lub hasło. (1)</p>");

        print("<p><a class='btn' href='logowanie_formularz.php'>Powrót do formularza logowania</a></p>");

    } else {
        // Pobranie danych z formularza
        $KontoForm = trim($_POST["Konto"]);
        $HasloForm = trim($_POST["Haslo"]);
    
        // Zabezpieczenie przed SQL Injection
        // ';CREATE TABLE dbo.A;--
        $tablica_znaki = array("-", "~", ":", ";", "(", ")", "{", "}", "`", "'", "[", "]", "+", 
        "<", ">", "\\", "\/", "!", "@", "#", "$", "%", "^", "&", "*", ",", ".", "?");

        $KontoForm = str_ireplace($tablica_znaki, "", $KontoForm);

        // Połączenie z bazą

        $serwer = "LAPTOP-MGQT4RCV\SQL1";

        $dane_polaczenia = array("Database" => "OSK", "CharacterSet" => "UTF-8");

        $polaczenie = sqlsrv_connect($serwer, $dane_polaczenia);

        if(!$polaczenie)
        {
            require_once("../uklad_poczatek.php");

            print("<p class='msg error'>Polaczenie z serwerem nie powiodło się.</p>");
            print(print_r(sqlsrv_errors(), true));
            require_once("../uklad_koniec.php");
            die();
        }
        else
        {
            // Jeżeli nawiązano połączenie
            $komenda_sql = 
            "SELECT Imie, Nazwisko, Haslo, DataZarejestrowania
            FROM dbo.Uzytkownik
            WHERE Konto = '$KontoForm';";

            $zbior_wierszy = sqlsrv_query($polaczenie, $komenda_sql);

            if(!sqlsrv_has_rows($zbior_wierszy))
            {
                // Jeżeli nie ma takiego użytkownika w bazie
                $_SESSION["zalogowany"] = false;
        
                if(isset($_SESSION["uzytkownik"]))
                    unset($_SESSION["uzytkownik"]);
    
                if(isset($_SESSION["Imie"]))
                    unset($_SESSION["Imie"]);
                
                if(isset($_SESSION["Nazwisko"]))
                    unset($_SESSION["Nazwisko"]);

                require_once("../uklad_poczatek.php");

                print("<p class='msg error'>Nieprawidłowa nazwa konta lub hasło. (2)</p>");

                print("<p><a class='btn' href='logowanie_formularz.php'>Powrót do formularza logowania</a></p>");

            }
            else
            {
                // Jeżel jest poprawny użytkownik
                $wiersz = sqlsrv_fetch_array($zbior_wierszy, SQLSRV_FETCH_ASSOC);
                
                $Imie = $wiersz["Imie"]; 
                $Nazwisko = $wiersz["Nazwisko"]; 
                $Haslo = $wiersz["Haslo"];
                $DataZarejestrowania = $wiersz["DataZarejestrowania"];

                // Weryfikacja hasła
                if(password_verify($HasloForm, $Haslo))
                {
                    $_SESSION["zalogowany"] = true;
                    $_SESSION["uzytkownik"] = $KontoForm;
                    $_SESSION["Imie"] = $Imie;
                    $_SESSION["Nazwisko"] = $Nazwisko;

                    require_once("../uklad_poczatek.php");

                    // Powitanie użytkownika
                    print("<h2>Rozpoczęto sesje użytkownika</h2>");

                    print("<p class='msg success'>Witaj <strong>$Imie $Nazwisko</strong>! <br>
                        Jesteś zalogowany jako <strong>$KontoForm</strong></p>");

                    print("
                    <fieldset>
                        <legend>Zarządzaj tabelami</legend>
                        <p class='lbl'><a class='btn' href='/2025/P29_P1/P29_P1_serwis/instruktorzy/instruktorzy_tabela.php'>Przejdź do wykazu instruktorów</a></p>
                        <p class='lbl'><a class='btn' href='/2025/P29_P1/P29_P1_serwis/kursy/kurs_tabela.php'>Przejdź do wykazu kursów</a></p>
                    </fieldset>
                    ");

                } else {
                    // Hasło jest niepoprawne
                    $_SESSION["zalogowany"] = false;
        
                    if(isset($_SESSION["uzytkownik"]))
                        unset($_SESSION["uzytkownik"]);
    
                    if(isset($_SESSION["Imie"]))
                        unset($_SESSION["Imie"]);
                    
                    if(isset($_SESSION["Nazwisko"]))
                        unset($_SESSION["Nazwisko"]);

                    require_once("../uklad_poczatek.php");

                    print("<p class='msg error'>Nieprawidłowa nazwa konta lub hasło. (3)</p>");

                    print("<p><a class='btn' href='logowanie_formularz.php'>Powrót do formularza logowania</a></p>");

                }

                // Zwolnienie pamięci zarezerwowanej na wynik zapytania
                if($zbior_wierszy != null)
                    sqlsrv_free_stmt($zbior_wierszy);

            }

            sqlsrv_close($polaczenie);

            
        } // Nawiązano połączenie
    }

    require_once("../uklad_koniec.php");
?>
   
</body>
</html>