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
        // Zakończenie sesji użtkownika
        $_SESSION["zalogowany"] = false;
        
        if(isset($_SESSION["uzytkownik"]))
            unset($_SESSION["uzytkownik"]);

        if(isset($_SESSION["Imie"]))
            unset($_SESSION["Imie"]);
        
        if(isset($_SESSION["Nazwisko"]))
            unset($_SESSION["Nazwisko"]);

        session_destroy();

        require_once("../uklad_poczatek.php");

        print("<h2>Koniec sesji użytkownika</h2>");
        print("<p class='msg success'>Sesja użytkownika została zakończona.</p>");

        print("<p><a class='btn' href='logowanie_formularz.php'>Powrót do formularza logowania</a></p>");
        
        require_once("../uklad_koniec.php");
    ?>
   
</body>
</html>