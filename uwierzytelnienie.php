<?php
    // Sprawdzenie zmiennej sesyjnej - uprawnień
    if((isset($_SESSION["zalogowany"]) && $_SESSION["zalogowany"] == false)
        || !isset($_SESSION["zalogowany"])
        || !isset($_SESSION["uzytkownik"])) 
    {
            
        // Zakończenie sesji użtkownika
        $_SESSION["zalogowany"] = false;
        
        if(isset($_SESSION["uzytkownik"]))
            unset($_SESSION["uzytkownik"]);

        if(isset($_SESSION["Imie"]))
            unset($_SESSION["Imie"]);
        
        if(isset($_SESSION["Nazwisko"]))
            unset($_SESSION["Nazwisko"]);

        session_destroy();

        print("<h2>Odmowa dostępu</h2>");

        print("<p class='msg error'>Ta funkcja jest dostępna tylko dla zalogowanych użytkowników.</p>");

        print("<p><a class='btn' href='/2025/P29_P1/logowanie/logowanie_formularz.php'>Powrót do formularza logowania</a></p>");

        require_once("../uklad_koniec.php");
        die();
    }
?>