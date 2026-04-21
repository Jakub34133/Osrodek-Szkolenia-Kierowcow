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
    <script src="js/script.js"></script>
</head>
<body>
    
    <?php
        require_once("../uklad_poczatek.php");
        require_once("../uwierzytelnienie.php");


        if(!isset($_GET["IdInstruktor"])
            || trim($_GET["IdInstruktor"] == "")
            || !is_numeric($_GET["IdInstruktor"])
        )
        {
            print("<p class='msg error'>Nie można usunąć danych instruktora, 
            ponieważ nie został on wybrany.</p>");

            print("<p><a class='btn' href='instruktorzy_tabela.php'>Powrót do wykazu instruktorów</a></p>");

            require_once("../uklad_koniec.php");
            die();
        }

    
        $IdInstruktor = $_GET["IdInstruktor"];
        
        print("<p class='msg warn'>Czy na pewno usunąć dane instruktora o identyfikatorze <strong>$IdInstruktor</strong>?</p> ");
        print(
        "<p>
            <a href='instruktor_usun_potwierdz.php?IdInstruktor=$IdInstruktor' class='btn delete'>Tak, usuń</a>
            <a href='instruktorzy_tabela.php' class='btn default'>Anuluj</a>
        </p>"
        );
        require_once("../uklad_koniec.php");

    ?>
   
</body>
</html>