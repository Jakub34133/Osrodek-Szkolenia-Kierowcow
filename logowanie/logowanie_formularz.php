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

        // Formularz logowania
        print("
        <form id='formLogowanie' method='post' action='logowanie_weryfikacja.php'>
            <h2>Logowanie</h2>
            <fieldset>
                <legend>Dane użytkownika</legend>

                <p class='lbl'>
                    <label for='Konto'>Konto*</label>
                    <input type='text' id='Konto' name='Konto' maxlength='30'>
                </p>

                <p class='lbl'>
                    <label for='Haslo'>Hasło*</label>
                    <input type='password' id='Haslo' name='Haslo' maxlength='30'>
                </p>

            </fieldset>

            <p>
                <input type='submit' value='Zaloguj'>
                <input type='reset' value='Wyczyść pola'>

            </p>
        </form>
        ");

        require_once("../uklad_koniec.php");
    ?>
   
</body>
</html>