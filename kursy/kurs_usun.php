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
    <script src="js/skrypt.js"></script>
</head>
<body>
    
    <?php
        require_once("../uklad_poczatek.php");
        require_once("../uwierzytelnienie.php");

        if(!isset($_GET["IdKurs"])
            || trim($_GET["IdKurs"] == "")
            || !is_numeric($_GET["IdKurs"])
        )
        {
            print("<p class='msg error'>Nie można usunąć danych kursu, 
            ponieważ nie został on wybrany.</p>");

            print("<p><a class='btn' href='kurs_tabela.php'>Powrót do wykazu kursów</a></p>");

            require_once("../uklad_koniec.php");
            die();
        }

    
        $IdKurs = $_GET["IdKurs"];
        
        print("<p class='msg warn'>Czy na pewno usunąć dane kursu o identyfikatorze <strong>$IdKurs</strong>?</p> ");
        print(
        "<p>
            <a href='kurs_usun_potwierdz.php?IdKurs=$IdKurs' class='btn delete'>Tak, usuń</a>
            <a href='kurs_tabela.php' class='btn default'>Anuluj</a>
        </p>"
        );
        require_once("../uklad_koniec.php");

    ?>
   
</body>
</html>